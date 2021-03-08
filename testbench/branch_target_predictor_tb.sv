`include "cpu_types_pkg.vh"
`include "branch_target_predictor_if.vh"

`timescale 1 ns / 1 ns
module branch_target_predictor_tb;
  logic CLK = 0, nRST;
  parameter PERIOD = 10;

  always #(PERIOD/2) CLK++;

  branch_target_predictor_if btpif();
  test PROG(CLK, nRST, btpif);
  branch_target_predictor DUT(CLK, nRST, btpif);
endmodule

program test(
    input logic CLK,
    output logic nRST,
    branch_target_predictor_if btpif
);

  import cpu_types_pkg::*;
  parameter PERIOD = 10;
  initial begin
    nRST = 1;
    #(PERIOD);
    nRST = 0;
    #(PERIOD);
    nRST = 1;
    #(PERIOD);
    btpif.branch_taken = 1;
    btpif.next_pc = 32'b0;
    btpif.branchAddr = 32'b0;
    #(PERIOD)
    btpif.branch_taken = 1;
    btpif.next_pc = 32'd4;
    btpif.branchAddr = 32'd4;
    #(PERIOD)
    btpif.branch_taken = 1;
    btpif.next_pc = 32'd9;
    btpif.branchAddr = 32'b0;
    #(PERIOD)
    btpif.branch_taken = 1;
    btpif.next_pc = 32'd12;
    btpif.branchAddr = 32'd120;
    #(PERIOD)
    btpif.branch_taken = 0;
    btpif.next_pc = 32'b0;
    btpif.branchAddr = 32'b0;
    #(PERIOD)
    btpif.branch_taken = 1;
    btpif.next_pc = 32'd16;
    btpif.branchAddr = 32'd16;
    #(PERIOD)
    btpif.branch_taken = 1;
    btpif.next_pc = 32'd20;
    btpif.branchAddr = 32'd20;
  end
endprogram