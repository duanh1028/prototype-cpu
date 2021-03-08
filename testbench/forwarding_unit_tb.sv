`include "cpu_types_pkg.vh"
`include "forwarding_unit_if.vh"
`include "pipeline_registers_if.vh"
`timescale 1 ns / 1 ns
module forwarding_unit_tb;
  forwarding_unit_if fuif();
  pipeline_registers_if plif();
  test PROG(plif);
  forwarding_unit DUT(fuif, plif);
endmodule
program test(
  pipeline_registers_if plif
);
  logic[4:0] Rs, Rt, Rd;
  logic[15:0] imm;
  logic[25:0] addr;
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
    #(PERIOD)
    plif.instruction_wb = {ORI, Rs, Rt, imm};
    plif.rf_wen_wb = 1'b1;
    plif.regOut_wb = 5'd3;
    plif.Rs_id = 5'd3;
    #(PERIOD);


  end
endprogram
