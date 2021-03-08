`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "cpu_types_pkg.vh"
//`include "branch_target_predictor_if.vh"

module icache(
    input logic CLK, nRST,
    datapath_cache_if.icache dcif,
    caches_if.icache cif
);
    import cpu_types_pkg::*;
    logic hit;
    icache_frame registers [15:0];
    icachef_t address; 

    assign address.tag = dcif.imemaddr[31:6];
    assign address.idx = dcif.imemaddr[5:2];
    assign address.bytoff = dcif.imemaddr[1:0];

    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST)
            registers <= '{default:'0};
        else begin
            if(!cif.iwait & !hit) begin
                registers[address.idx].valid <= 1;
                registers[address.idx].tag <= address.tag;
                registers[address.idx].data <= cif.iload;
	    end
        end
    end
    


    assign hit = registers[address.idx].valid && (registers[address.idx].tag == address.tag);
    assign cif.iREN = (!hit) ? dcif.imemREN : '0;
    assign cif.iaddr = (!hit) ? dcif.imemaddr : '0;
    assign dcif.ihit = hit;
    assign dcif.imemload = hit ? registers[address.idx].data : '0;

endmodule
