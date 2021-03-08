`ifndef ALU_IF_VH
`define ALU_IF_VH
`include "cpu_types_pkg.vh"

interface alu_if;
  import cpu_types_pkg::*;
  aluop_t aluop;
  logic [31:0] port_a, port_b, port_out;
  logic negative, overflow, zero;
  modport af (
    input aluop, port_a, port_b,
    output negative, overflow, zero, port_out
  );
endinterface
`endif  //ALU_IF_VH
