`include "cpu_types_pkg.vh"
`include "caches_if.vh"
`include "datapath_cache_if.vh"
`timescale 1 ns / 1 ns

module dcache_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  datapath_cache_if dcif();
  caches_if cif();

  dcache DUT (.CLK(CLK), .nRST(nRST), .dcif(dcif), .cif(cif));
  // test program
  test PROG (.CLK(CLK), .nRST(nRST), .dcif(dcif), .cif(cif));

endmodule

//test cases
program test(
    input logic CLK,
    output logic nRST,
    datapath_cache_if.cache dcif,
    caches_if cif
);

    string  tb_test_case;
    parameter PERIOD = 10;

    initial begin
        //reset
        tb_test_case = "synchronous reset";
        nRST = 0;
                dcif.dmemaddr = 32'h00ff;
        #(PERIOD);
        nRST = 1;
        dcif.halt = 0;

        //write
        @(posedge CLK);
        tb_test_case = "write";
    //    dcif.dmemaddr = 32'h00ff;
        dcif.dmemstore = 32'hccdd;
        cif.dwait = 1;
        dcif.dmemREN = 0;
        dcif.dmemWEN = 1;
        #(PERIOD);
        @(posedge CLK);
        dcif.dmemaddr = 32'h00ef;
        dcif.dmemstore = 32'hddee;
        cif.dwait = 1;
        dcif.dmemREN = 0;
        dcif.dmemWEN = 1;
        #(PERIOD);
        @(posedge CLK);
        //fetch
        tb_test_case = "fetch";
        #(PERIOD);
        dcif.dmemaddr = 32'h00ef;
        cif.dload = 32'haabb;
        cif.dwait = 0;
        dcif.dmemREN = 1;
        dcif.dmemWEN = 0;
        #(PERIOD);
        @(posedge CLK)
        dcif.dmemaddr = 32'h00af;
        cif.dload = 32'hbbcc;
        cif.dwait = 0;
        dcif.dmemREN = 1;
        dcif.dmemWEN = 0;
        #(PERIOD);

        //halt
        tb_test_case = "halt";
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        dcif.halt = 1;
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD);
        #(PERIOD*6000);
end


endprogram

