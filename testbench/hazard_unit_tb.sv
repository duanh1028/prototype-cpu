`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"
`include "pipeline_registers_if.vh"
`timescale 1 ns / 1 ns
module hazard_unit_tb;
  hazard_unit_if huif();
  pipeline_registers_if plif();
  test PROG(plif);
  hazard_unit DUT(plif, huif);
endmodule
program test(
  pipeline_registers_if plif
);
  logic [4:0] Rs, Rt, Rd;
  logic [15:0] imm;
  logic [25:0] addr;

  import cpu_types_pkg::*;
  parameter PERIOD = 10;
  initial begin
    Rs = 5'd1;
    Rt = 5'd1;
    Rd = 5'd5;
    imm = 16'd5;
    plif.instruction_id  = {ADDIU, Rs, Rt, imm};
    plif.Rs_id = Rs;
    plif.regOut_ex = Rs;
    #(PERIOD)
    plif.instruction_id = {RTYPE, Rs, Rt, Rd, 5'b0, ADDU};
    plif.Rs_id = Rs;
    plif.regOut_wb = Rs;
    #(PERIOD)
    plif.instruction_id = {BEQ, Rs, Rt, imm};
    #(PERIOD)
    plif.instruction_id = {BEQ, Rs, Rt, imm};
    plif.Rs_id = Rs;
    plif.regOut_wb = Rs;

  end
endprogram

