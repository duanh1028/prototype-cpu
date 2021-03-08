/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG (.CLK(CLK), .nRST(nRST), .tbif(rfif));
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

//test cases
program test(
    input logic CLK,
    output logic nRST,
    register_file_if.tb tbif
);

    string  tb_test_case;
    parameter PERIOD = 10;

    initial begin
        //reset
        tb_test_case = "synchronous reset";
        tbif.wdat = '0;
        tbif.rsel1 = '0;
        tbif.rsel2 = '0;
        tbif.wsel = '0;
        tbif.WEN = 0;
        nRST = 0;
        #(PERIOD);

        //test 1
        @(posedge CLK)
        tb_test_case = "asynchronous reset";
        nRST = 1;
        tbif.wdat = 32'hffff;
        tbif.rsel1 = 5'd1;
        tbif.rsel2 = 5'd1;
        tbif.wsel = 5'd2;
        tbif.WEN = 1'b1;
        #(PERIOD);
        @(negedge CLK)
        nRST = 0;
        #(PERIOD);

        //test 2
        @(posedge CLK)
        tb_test_case = "writes to register 0";
        nRST = 1;
        tbif.wdat = 32'h1234;
        tbif.rsel1 = 5'd1;
        tbif.rsel2 = 5'd2;
        tbif.wsel = 5'd0;
        tbif.WEN = 1'b1;
        #(PERIOD);
        #(PERIOD);

        //test 3
        @(posedge CLK)
        nRST = 0;
        #(PERIOD);
        tb_test_case = "writes and reads to registers";
        nRST = 1;
        tbif.wdat = 32'hffff;
        tbif.rsel1 = 5'd1;
        tbif.rsel2 = 5'd1;
        tbif.wsel = 5'd2;
        tbif.WEN = 1'b1;
        #(PERIOD);
        #(PERIOD);
        tbif.wdat = 32'h1234;
        tbif.rsel1 = 5'd1;
        tbif.rsel2 = 5'd2;
        tbif.wsel = 5'd4;
        tbif.WEN = 1'b1;
        #(PERIOD);
        #(PERIOD);
        tbif.wdat = 32'heeee;
        tbif.rsel1 = 5'd3;
        tbif.rsel2 = 5'd4;
        tbif.wsel = 5'd5;
        tbif.WEN = 1'b1;
        #(PERIOD);
        #(PERIOD);

end


endprogram
