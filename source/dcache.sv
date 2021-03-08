`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  caches_if.dcache cif
);
import cpu_types_pkg::*;

typedef enum logic [3:0] {IDLE, FETCH1, FETCH2, WRITE1, WRITE2, FLUSHSTART,
FLUSHEND, DPWRITE, SNOOPWRITE1, SNOOPWRITE2} stateType;
//modified snoopwrite for multicore

stateType state, nstate;

dcachef_t addr, snoopaddr;
assign addr = dcachef_t'(dcif.dmemaddr);
assign snoopaddr = dcachef_t'(cif.ccsnoopaddr); //modified for multicore
dcache_frame  [7:0][1:0] dcache;
logic [7:0] LRUindicator = '0;
logic [7:0] next_LRUindicator = '0;
logic hit, hit0, hit1, snoophit, snoophit0, snoophit1;
logic [5:0] flush_count_out;
logic flush_count_enable;
logic [31:0] total = '0;
logic [31:0] next_total = '0;
logic [31:0] hit_count = '0;
logic [31:0] next_hit_count = '0;
word_t previous_addr;
logic previous_dWEN, previous_dREN;
logic [2:0]flush_idx;
logic [31:0] rmwstate, next_rmwstate;  //added for lock


assign dcif.dmemload =  (dcif.dmemWEN & dcif.datomic) ? (dcif.dmemaddr == rmwstate) : 
                        (state == IDLE & dcif.dmemREN & hit) ? dcache[addr.idx][hit1].data[addr.blkoff] : '0;

assign cif.ccwrite = dcif.dmemWEN;    //added for multicore

assign hit0 = (dcache[addr.idx][0].valid && dcache[addr.idx][0].tag == addr.tag);
assign hit1 = (dcache[addr.idx][1].valid && dcache[addr.idx][1].tag == addr.tag);
assign hit = (dcache[addr.idx][0].valid && dcache[addr.idx][0].tag == addr.tag) |
             (dcache[addr.idx][1].valid && dcache[addr.idx][1].tag == addr.tag);

//added for multicore
assign snoophit0 = (dcache[snoopaddr.idx][0].valid && dcache[snoopaddr.idx][0].tag == snoopaddr.tag);
assign snoophit1 = (dcache[snoopaddr.idx][1].valid && dcache[snoopaddr.idx][1].tag == snoopaddr.tag);
assign snoophit =  (dcache[snoopaddr.idx][0].valid && dcache[snoopaddr.idx][0].tag == snoopaddr.tag) |
                   (dcache[snoopaddr.idx][1].valid && dcache[snoopaddr.idx][1].tag == snoopaddr.tag);



assign dcif.dhit = dcif.dmemWEN & !dcif.datomic & (state == IDLE) & (hit0 & dcache[addr.idx][0].dirty | hit1 & dcache[addr.idx][1].dirty)
                 | dcif.dmemREN & (state == IDLE) & hit 
                 | dcif.dmemWEN & dcif.datomic & dcif.dmemaddr == rmwstate & (hit0 & dcache[addr.idx][0].dirty | hit1 & dcache[addr.idx][1].dirty) & (state == IDLE) 
                 | dcif.dmemWEN & dcif.datomic & dcif.dmemaddr != rmwstate
		 | state == DPWRITE;

//write logic for cache register
always_ff @(posedge CLK, negedge nRST)begin
  if(!nRST) begin
    dcache <= '{default: '0};
    //LRUindicator <= '0;
  end
//  else if(dcif.dmemWEN && dcif.datomic && dcif.dmemaddr != rmwstate) begin end
  else if(dcif.dmemWEN && state == IDLE && hit && !(dcif.datomic && dcif.dmemaddr != rmwstate) && (hit0 & dcache[addr.idx][0].dirty | hit1 & dcache[addr.idx][1].dirty)) begin
    dcache[addr.idx][hit1].valid <= 1'b1;
    dcache[addr.idx][hit1].dirty <= 1'b1;
    dcache[addr.idx][hit1].tag <= addr.tag;
    dcache[addr.idx][hit1].data[addr.blkoff] <= dcif.dmemstore;
  end
  else if(state == DPWRITE) begin
    dcache[addr.idx][hit1].valid <= 1'b1;
    dcache[addr.idx][hit1].dirty <= 1'b1;
    dcache[addr.idx][hit1].tag <= addr.tag;
    dcache[addr.idx][hit1].data[addr.blkoff] <= dcif.dmemstore;
//    LRUindicator[addr.idx] <= ~LRUindicator[addr.idx];
  end
  else if(!cif.dwait && (state == FETCH1 || state == FETCH2) && dcif.dmemREN) begin
    dcache[addr.idx][LRUindicator[addr.idx]].valid <= 1'b1;
    dcache[addr.idx][LRUindicator[addr.idx]].dirty <= 1'b0;
//    dcache[addr.idx][LRUindicator[addr.idx]].tag <= dcif.dmemWEN ? '0 : addr.tag;
    dcache[addr.idx][LRUindicator[addr.idx]].tag <= addr.tag;
    if(state == FETCH1)
      dcache[addr.idx][LRUindicator[addr.idx]].data[0] <= cif.dload;
    else if(state == FETCH2)
      dcache[addr.idx][LRUindicator[addr.idx]].data[1] <= cif.dload;
  end
  else if(!cif.dwait && (state == FETCH1 || state == FETCH2) && dcif.dmemWEN) begin
    dcache[addr.idx][hit1].valid <= 1'b1;
    dcache[addr.idx][hit1].dirty <= 1'b0;
//    dcache[addr.idx][LRUindicator[addr.idx]].tag <= dcif.dmemWEN ? '0 : addr.tag;
    dcache[addr.idx][hit1].tag <= addr.tag;
    if(state == FETCH1)
      dcache[addr.idx][hit1].data[0] <= cif.dload;
    else if(state == FETCH2)
      dcache[addr.idx][hit1].data[1] <= cif.dload;
  end
  else if(state == WRITE1) begin
    if(dcif.dmemREN)
    	dcache[addr.idx][LRUindicator[addr.idx]].dirty <= 0;
    else
        dcache[addr.idx][hit1].dirty <= 0;
  end
  else if(state == SNOOPWRITE1)  //added for multicore
    dcache[snoopaddr.idx][snoophit1].dirty <= 0;
  else if(state == IDLE && cif.ccinv && snoophit) begin
    dcache[snoopaddr.idx][snoophit1].valid <= 0;
    dcache[snoopaddr.idx][snoophit1].dirty <= 0;
  end
end

//nstate logic
always_comb begin
  nstate = state;
  case(state)
    IDLE : begin
        if(cif.ccwait & (snoophit0 & dcache[snoopaddr.idx][0].dirty | snoophit1 & dcache[snoopaddr.idx][1].dirty))
            nstate = SNOOPWRITE1;
        else if(dcif.halt)
            nstate = FLUSHSTART;
        else if(dcif.dmemWEN & dcif.datomic & dcif.dmemaddr != rmwstate)
	    nstate = IDLE;
        else if((!hit && dcache[addr.idx][LRUindicator[addr.idx]].dirty == 0 && dcif.dmemREN) 
              | (dcif.dmemWEN & !(dcif.datomic & dcif.dmemaddr != rmwstate) & (!hit & !dcache[addr.idx][hit1].dirty | hit1 & !dcache[addr.idx][1].dirty | hit0 & !dcache[addr.idx][0].dirty))) begin
	    nstate = FETCH1;
        end
   //     else if(!hit && dcache[addr.idx][LRUindicator[addr.idx]].dirty == 1 && (dcif.dmemREN || dcif.dmemWEN))
        else if((!hit && dcache[addr.idx][LRUindicator[addr.idx]].dirty == 1 && dcif.dmemREN) 
	      | (dcif.dmemWEN & !(dcif.datomic & dcif.dmemaddr != rmwstate) & (!hit & dcache[addr.idx][hit1].dirty)))
            nstate = WRITE1;
    end
    FETCH1: begin if(!cif.dwait)
               nstate = FETCH2;
   	       if(cif.ccwait & (snoophit0 & dcache[snoopaddr.idx][0].dirty | snoophit1 & dcache[snoopaddr.idx][1].dirty))
		 nstate = SNOOPWRITE1;
            end
    FETCH2: begin if(!cif.dwait) begin
               nstate = IDLE;
	       if(dcif.dmemWEN)
		 nstate = DPWRITE;
	       end
            end
    DPWRITE: nstate = IDLE;
    WRITE1: begin if(!cif.dwait)
               nstate = WRITE2;
   	       if(cif.ccwait & (snoophit0 & dcache[snoopaddr.idx][0].dirty | snoophit1 & dcache[snoopaddr.idx][1].dirty))
		 nstate = SNOOPWRITE1;
            end
    WRITE2: begin if(!hit && !cif.dwait)
               nstate = FETCH1;
            end
    SNOOPWRITE1: begin if(!cif.dwait)    //added for multicore
                    nstate = SNOOPWRITE2;
                 end
    SNOOPWRITE2: begin if(!cif.dwait)
                    nstate = IDLE;
                 end
    FLUSHSTART: begin if((flush_count_out == 6'd31 & dcache[3'd7][1'd1].dirty & !cif.dwait) || (flush_count_out == 6'd31 & !dcache[3'd7][1'd1].dirty))
                  nstate = FLUSHEND;
   		else if(cif.ccwait)
		  nstate = IDLE;
                end
 /*   STOREMISSRATE: begin if(!cif.dwait)
                    nstate = FLUSHEND;
		   end */
    FLUSHEND: nstate = FLUSHEND;

    default: nstate = state;
  endcase
end

//output logic
always_comb begin
  //ihit = hit;
  cif.dREN = 0;
  cif.dWEN = 0;
  cif.dstore = 32'b0;
  cif.daddr = dcif.dmemaddr;
  dcif.flushed = 0;
  flush_count_enable = 0;
  flush_idx = '0;
  cif.cctrans = !snoophit;
  if(state == IDLE) begin
    if (cif.ccwait & (snoophit0 & !dcache[snoopaddr.idx][0].dirty | snoophit1 & !dcache[snoopaddr.idx][1].dirty))   //modified for multicore
      cif.cctrans = 1;
  end
  else if(state == FETCH1) begin
    cif.dREN = 1;
    cif.daddr = {dcif.dmemaddr[31:3], 1'b0, dcif.dmemaddr[1:0]};
    if (cif.ccwait & (snoophit0 & !dcache[snoopaddr.idx][0].dirty | snoophit1 & !dcache[snoopaddr.idx][1].dirty))   //modified for multicore
      cif.cctrans = 1;
  end
  else if(state == FETCH2) begin
    cif.dREN = 1;
    cif.daddr = {dcif.dmemaddr[31:3], 1'b1, dcif.dmemaddr[1:0]};
  end
  else if(state == WRITE1) begin
    cif.dWEN = 1;
    if(dcif.dmemREN) begin
      cif.dstore = dcache[addr.idx][LRUindicator[addr.idx]].data[0];
      cif.daddr = {dcache[addr.idx][LRUindicator[addr.idx]].tag,
                   addr.idx, 1'b0, 2'b00};
    end
    else begin
      cif.dstore = dcache[addr.idx][hit1].data[0];
      cif.daddr = {dcache[addr.idx][hit1].tag, addr.idx, 1'b0, 2'b00};
    end
  end
  else if(state == WRITE2) begin
    cif.dWEN = 1;
    if(dcif.dmemREN) begin
      cif.dstore = dcache[addr.idx][LRUindicator[addr.idx]].data[1];
      cif.daddr = {dcache[addr.idx][LRUindicator[addr.idx]].tag,
                   addr.idx, 1'b1, 2'b00};
    end
    else begin
      cif.dstore = dcache[addr.idx][hit1].data[1];
      cif.daddr = {dcache[addr.idx][hit1].tag, addr.idx, 1'b1, 2'b00};
    end
    //dcache[addr.idx][LRUindicator[addr.idx]].dirty = 0;
  end
  else if(state == SNOOPWRITE1) begin
    cif.dWEN = 1;
    cif.dstore = dcache[snoopaddr.idx][snoophit1].data[0];
    cif.daddr = {dcache[snoopaddr.idx][snoophit1].tag, snoopaddr.idx, 1'b0, 2'b00};
    cif.cctrans = 1;
  end
  else if(state == SNOOPWRITE2) begin
    cif.dWEN = 1;
    cif.dstore = dcache[snoopaddr.idx][snoophit1].data[1];
    cif.daddr = {dcache[snoopaddr.idx][snoophit1].tag, snoopaddr.idx, 1'b1, 2'b00};
  end
  else if(state == FLUSHSTART) begin
    flush_count_enable = 1'b1;
    cif.cctrans = 0;
    if(flush_count_out < 6'd8) begin
      flush_idx = flush_count_out;
      cif.dstore = dcache[flush_idx][1'd0].data[0];
      cif.dWEN = dcache[flush_idx][1'd0].dirty;
      cif.daddr = {dcache[flush_idx][1'd0].tag,
                   flush_idx, 1'b0, 2'b00};
      flush_count_enable = dcache[flush_idx][1'd0].dirty ? !cif.dwait : 1;
    end
    else if(flush_count_out > 6'd7 && flush_count_out < 6'd16) begin
      flush_idx = flush_count_out - 6'd8;
      cif.dstore = dcache[flush_idx][1'd0].data[1];
      cif.dWEN = dcache[flush_idx][1'd0].dirty;
      cif.daddr = {dcache[flush_idx][1'd0].tag,
                   flush_idx, 1'b1, 2'b00};
      flush_count_enable = dcache[flush_idx][1'd0].dirty ? !cif.dwait : 1;
    end
    else if(flush_count_out > 6'd15 && flush_count_out < 6'd24) begin
      flush_idx = flush_count_out - 6'd16;
      cif.dstore = dcache[flush_idx][1'd1].data[0];
      cif.dWEN = dcache[flush_idx][1'd1].dirty;
      cif.daddr = {dcache[flush_idx][1'd1].tag,
                   flush_idx, 1'b0, 2'b00};
      flush_count_enable = dcache[flush_idx][1'd1].dirty ? !cif.dwait : 1;
    end
    else if(flush_count_out > 6'd23 && flush_count_out < 6'd32) begin
      flush_idx = flush_count_out - 6'd24;
      cif.dstore = dcache[flush_idx][1'd1].data[1];
      cif.dWEN = dcache[flush_idx][1'd1].dirty;
      cif.daddr = {dcache[flush_idx][1'd1].tag,
                   flush_idx, 1'b1, 2'b00};
      flush_count_enable = dcache[flush_idx][1'd1].dirty ? !cif.dwait : 1;
    end
  end
/*
  else if(state == STOREMISSRATE) begin
    cif.dWEN = 1;
    cif.dstore = hit_count;
    cif.daddr = 32'h3100;
    cif.cctrans = 0;
  end
*/
  else if(state == FLUSHEND) begin
    dcif.flushed = 1'b1;
    cif.cctrans = 1;
  end
end

//rmwstate logic for lock operation
always_comb begin
  next_rmwstate = rmwstate;
  if(dcif.dmemREN & dcif.datomic)
    next_rmwstate = dcif.dmemaddr;
  else if(dcif.dmemWEN & dcif.dmemaddr == rmwstate & (state == DPWRITE | hit0 & dcache[addr.idx][0].dirty | hit1 & dcache[addr.idx][1].dirty))
    next_rmwstate = rmwstate + 1; 
  else if(cif.ccwait & cif.ccinv)
    next_rmwstate = '0;
end


//flush counter
//always_ff @(negedge cif.dwait, negedge nRST) begin
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST)
    flush_count_out <= '0;
  else if(flush_count_enable)
    flush_count_out <= flush_count_out + 1;
end

//miss rate calculation
always_comb begin
  next_total = total;
  next_hit_count = hit_count;
  next_LRUindicator = LRUindicator;

  if((previous_addr != dcif.dmemaddr | previous_dWEN != dcif.dmemWEN | previous_dREN != dcif.dmemREN)
     && (dcif.dmemREN | dcif.dmemWEN) && !dcif.halt) begin
    if(hit0) begin
      next_LRUindicator[dcif.dmemaddr[5:3]] = 1'b1;
    end
    else if(hit1) begin
      next_LRUindicator[dcif.dmemaddr[5:3]] = 1'd0;
    end
    next_total = total + 1;
    next_hit_count = hit_count;
    if(hit)
      next_hit_count = hit_count + 1;
  end
  else if((state == FETCH2 && !cif.dwait && dcif.dmemREN) | (state == DPWRITE))
      next_LRUindicator[addr.idx] = ~LRUindicator[addr.idx];
   // else
   //   LRUindicator[dcif.dmemaddr[5:3]] = ~LRUindicator[dcif.dmemaddr[5:3]];



end
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    previous_addr <= 31'b0;
    hit_count <= '0;
    previous_dWEN <= 0;
    previous_dREN <= 0;
    total <= '0;
    LRUindicator <= '0;
    rmwstate <= '0;
  end
  else begin
    previous_addr <= dcif.dmemaddr;
    hit_count <= next_hit_count;
    previous_dWEN <= dcif.dmemWEN;
    previous_dREN <= dcif.dmemREN;
    total <= next_total;
    LRUindicator <= next_LRUindicator;
    rmwstate <= next_rmwstate;
  end
end


//state machine state update
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST)
    state <= IDLE;
  else
    state <= nstate;
end

endmodule
