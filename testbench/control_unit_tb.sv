`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns
`include "control_unit_if.vh"
module control_unit_tb;
import cpu_types_pkg::*;
control_unit_if cuif();


test PROG(cuif);


control_unit DUT(cuif);

endmodule

program test(
  control_unit_if cuif
);
logic [4:0] Rs, Rt, Rd;
logic [15:0] imm;
logic [25:0] addr;

  parameter PERIOD = 10;
  initial begin
    import cpu_types_pkg::*;

    Rs = 5'b1;
    Rt = 5'b1;
    imm = 16'h5;
    cuif.instruction = {ADDIU, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {ADDI, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {ANDI, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {BEQ, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {BNE, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {LUI, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {LW, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {ORI, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {SLTI, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {SLTIU, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {SW, Rs, Rt, imm};
    #(PERIOD);
    cuif.instruction = {XORI, Rs, Rt, imm};
    #(PERIOD);
    addr = 26'h8;
    cuif.instruction = {J, addr};
    #(PERIOD);
    cuif.instruction = {JAL, addr};
    Rs = 5'h2;
    Rd = 5'h5;
    Rt = 5'h5;
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, ADDU};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, ADD};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, JR};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, NOR};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, OR};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SLT};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SLTU};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SLLV};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SRLV};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SUBU};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, SUB};
    #(PERIOD);
    cuif.instruction = {RTYPE, Rs, Rt, Rd, 5'b0, XOR};
    #(PERIOD);
  end
endprogram
