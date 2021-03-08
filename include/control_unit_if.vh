`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH
`include "cpu_types_pkg.vh"

interface control_unit_if;
  import cpu_types_pkg::*;

  word_t instruction;
  logic  MemtoReg, dWEN, dREN, rf_wdata_sel, rf_wen, ALUsrc, RegDst, jal_sel, atomic;
  logic [1:0] ExtOp;
  logic [2:0] PCsrc;
  logic [4:0] Rd;
  logic [4:0] Rt;
  logic [4:0] Rs;
  logic [15:0] imm16;
  aluop_t ALUctr;
  logic halt;

  modport cu(
    input instruction,

    output MemtoReg, dWEN, dREN, rf_wdata_sel, rf_wen,
           ALUsrc, RegDst, jal_sel, ExtOp, PCsrc,
           Rd, Rt, Rs, imm16, ALUctr, halt, atomic
  );
endinterface
`endif
