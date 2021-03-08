/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
import cpu_types_pkg::*;
typedef enum {IDLE, SENDBUSRD, READ_WRITEBACK1, READ_WRITEBACK2, SENDBUSRDX,
READFROMRAM1, READFROMRAM2, PURE_WRITEBACK1, PURE_WRITEBACK2} state_type;
state_type state, next_state;

logic prio, next_prio; //indicate the priority of caches, eg. if prio = 0, then check if the first cache signals will change state first.
logic reqC, next_reqC; // indicate which cache is sending the request now
logic instr_choose, next_instr_choose; //indicate what the bus controller is going proceed whose instruction and, it's supposed to keep flipping




//next_state logic
always_comb begin
  next_state = state;
  next_reqC = reqC;
  if(state == IDLE & ccif.iREN == '0) begin //
    if(ccif.ccwrite[prio] && ccif.dREN[prio]) begin
      next_state = SENDBUSRDX;
      next_reqC = prio;
    end
    else if(!ccif.ccwrite[prio] && ccif.dREN[prio]) begin
      next_state = SENDBUSRD;
      next_reqC = prio;
    end
    else if(ccif.ccwrite[!prio] && ccif.dREN[!prio]) begin
      next_state = SENDBUSRDX;
      next_reqC = !prio;
    end
    else if(!ccif.ccwrite[!prio] && ccif.dREN[!prio]) begin
      next_state = SENDBUSRD;
      next_reqC = !prio;
    end
    else if(ccif.dWEN[prio]) begin
      next_state = PURE_WRITEBACK1;
      next_reqC = prio;
    end
  end
  else if(state == SENDBUSRD) begin
    if(ccif.cctrans[!reqC] && !ccif.dWEN[!reqC])
      next_state = READFROMRAM1;
    else if(ccif.cctrans[!reqC] && ccif.dWEN[!reqC])
      next_state = READ_WRITEBACK1;
  end

  else if(state == READ_WRITEBACK1) begin
    if(ccif.ramstate == ACCESS)
      next_state = READ_WRITEBACK2;
  end

  else if(state == READ_WRITEBACK2) begin
    if(ccif.ramstate == ACCESS)
      next_state = IDLE;
  end

  else if(state == SENDBUSRDX) begin
    if(ccif.cctrans[!reqC] && !ccif.dWEN[!reqC])
      next_state = READFROMRAM1;
    else if(ccif.cctrans[!reqC] && ccif.dWEN[!reqC])
      next_state = READ_WRITEBACK1;
  end

  else if(state == READFROMRAM1) begin
    if(ccif.ramstate == ACCESS)
      next_state = READFROMRAM2;
  end

  else if(state == READFROMRAM2) begin
    if(ccif.ramstate == ACCESS)
      next_state = IDLE;
  end

  else if(state == PURE_WRITEBACK1) begin
    if(ccif.ramstate == ACCESS)
      next_state = IDLE;
  end

  else if(state == PURE_WRITEBACK2) begin
    if(ccif.ramstate == ACCESS)
      next_state = IDLE;
  end
end



//output logic
always_comb begin
  next_prio = prio;
  ccif.iwait = 2'b11;
  ccif.dwait = 2'b11;
  ccif.iload[0] = (ccif.iREN[0] == 1) ? ccif.ramload : 0;
  ccif.iload[1] = (ccif.iREN[1] == 1) ? ccif.ramload : 0;
  ccif.dload[0] = ccif.ramload;
  ccif.dload[1] = ccif.ramload;
  ccif.ramstore = '0;
  ccif.ramaddr = '0;
  ccif.ramWEN = '0;
  ccif.ramREN = '0;
  ccif.ccwait = 2'b0;
  ccif.ccinv = 2'b0;
  ccif.ccsnoopaddr[reqC] = '0;
  ccif.ccsnoopaddr[!reqC] = ccif.daddr[reqC];
  if(state == IDLE) begin
    ccif.ramaddr = ccif.iaddr[instr_choose];
   // ccif.ramREN = ccif.dWEN == '0 & ccif.dREN == '0 & ccif.iREN[instr_choose];
    ccif.ramREN = ccif.iREN[instr_choose];
    ccif.iwait[instr_choose] = !(state == IDLE & ccif.ramstate == ACCESS & ccif.iREN[instr_choose]);
  end
  else if(state == SENDBUSRD) begin
    ccif.ccinv[!reqC] = 0;
    ccif.ccwait[!reqC] = 1;
  end
  else if(state == SENDBUSRDX) begin
    ccif.ccinv[!reqC] = 1;
    ccif.ccwait[!reqC] = 1;
  end
  else if(state == READ_WRITEBACK1 | state == READ_WRITEBACK2) begin
    ccif.ramWEN = ccif.dWEN[!reqC];
    ccif.ramstore = ccif.dstore[!reqC];
    ccif.ramaddr = ccif.daddr[!reqC];
    ccif.dload[reqC] = ccif.dstore[!reqC];
    ccif.dwait[!reqC] = ccif.ramstate == ACCESS ? 0 : 1;
    ccif.dwait[reqC] = ccif.ramstate == ACCESS ? 0 : 1;
  end
  else if(state == READFROMRAM1 | state == READFROMRAM2) begin
    ccif.ramREN = ccif.dREN[reqC];
    ccif.ramaddr = ccif.daddr[reqC];
    ccif.dload[reqC] = ccif.ramload;
    ccif.dwait[reqC] = ccif.ramstate == ACCESS ? 0 : 1;
  end
  else if(state == PURE_WRITEBACK1 | state == PURE_WRITEBACK2) begin
    ccif.ramWEN = ccif.dWEN[reqC];
    ccif.ramaddr = ccif.daddr[reqC];
    ccif.ramstore = ccif.dstore[reqC];
    ccif.dwait[reqC] = ccif.ramstate == ACCESS ? 0 : 1;
  end


  //logic for dcache process priority flipping
  if((ccif.ramstate == ACCESS && (state == READFROMRAM2 | state == READ_WRITEBACK2 | state == PURE_WRITEBACK2)) 
    | (!ccif.dWEN[prio] & !ccif.dREN[prio] & state == IDLE))
    next_prio = ~prio;

end



// icaches control
always_comb begin
  next_instr_choose = instr_choose;
  if((state == IDLE && ccif.ramstate == ACCESS && ccif.iREN[~next_instr_choose]) | !ccif.iREN[instr_choose])
    next_instr_choose = ~next_instr_choose;
end

//update ff
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    state = IDLE;
    reqC = '0;
    prio = '0;
    instr_choose = '0;
  end
  else begin
    state = next_state;
    reqC = next_reqC;
    prio = next_prio;
    instr_choose = next_instr_choose;
  end
end


endmodule


















/*
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

assign ccif.ramstore = ccif.dstore;
assign ccif.ramWEN = ccif.dWEN;
assign ccif.ramREN = ~ccif.dWEN & (ccif.dREN | ccif.iREN);
assign ccif.dload = ccif.ramload;
assign ccif.iload = (ccif.iREN == 1) ? ccif.ramload : '0;

always_comb begin
  ccif.iwait = 1;
  ccif.dwait = 1;
  if(ccif.ramstate == ACCESS) begin
    if(ccif.dWEN || ccif.dREN) begin
      ccif.dwait = 0;
      ccif.iwait = 1;
    end
    else if(ccif.iREN && ~ccif.dREN && ~ccif.dWEN) begin
      ccif.dwait = 1;
      ccif.iwait = 0;
    end
  end
  if(ccif.dWEN | ccif.dREN)
    ccif.ramaddr = ccif.daddr;
  else
    ccif.ramaddr = ccif.iaddr;
end

endmodule
*/
