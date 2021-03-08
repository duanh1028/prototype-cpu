`include "alu_if.vh"
`timescale 1 ns / 1 ns
`include "cpu_types_pkg.vh"
module alu_tb;
parameter PERIOD = 10;

alu_if afif ();

test PROG (.afif);

//DUT
`ifndef MAPPED
alu DUT(afif);
  `else
  alu DUT (
      .\afif.aluop (afif.aluop),
      .\afif.port_a (afif.port_a),
      .\afif.port_b (afif.port_b),
      .\afif.negative (afif.negative),
      .\afif.zero (afif.zero),
      .\afif.overflow(afif.overflow),
      .\afif.port_out(afif.port_out)
      );
  `endif
endmodule

program test(
  alu_if afif
  );
  parameter PERIOD = 10;
  initial begin
    import cpu_types_pkg::*;
    afif.aluop = ALU_SLL;
    afif.port_a = 32'h00001000;
    afif.port_b = 32'h00000005;
     #(PERIOD)

    afif.aluop = ALU_SRL;
    afif.port_a = 32'h00001000;
    afif.port_b = 32'h00000006;
    #(PERIOD)

    afif.aluop = ALU_AND;
    afif.port_a = 32'h00000011;
    afif.port_b = 32'h00000001;
    #(PERIOD)

    afif.aluop = ALU_OR;
    afif.port_a = 32'h00000011;
    afif.port_b = 32'h00000001;
    #(PERIOD)

    afif.aluop = ALU_XOR;
    afif.port_a = 32'h00000011;
    afif.port_b = 32'h00000001;
    #(PERIOD)

    afif.aluop = ALU_NOR;
    afif.port_a = 32'h00000011;
    afif.port_b = 32'h00000001;
    #(PERIOD)
    //testing overflow flag
    afif.aluop = ALU_ADD;
    afif.port_a = 32'h70000000;
    afif.port_b = 32'h70000000;
    #(PERIOD)
    afif.aluop = ALU_ADD;
    afif.port_a = 32'h00000010;
    afif.port_b = 32'hffffffff;
    #(PERIOD)
    afif.aluop = ALU_ADD;
    afif.port_a = 32'h80000007;
    afif.port_b = 32'h00000006;
    #(PERIOD)
    afif.aluop = ALU_ADD;
    afif.port_a = 32'h80000001;
    afif.port_b = 32'hffffffff;
    #(PERIOD)
    //testing zero flag
    afif.aluop = ALU_SUB;
    afif.port_a = 32'h12345678;
    afif.port_b = 32'h12345678;
    #(PERIOD)
    //testing overflow flag for sub
    afif.aluop = ALU_SUB;
    afif.port_a = 32'h00000005;
    afif.port_b = 32'hfffffffd;
    #(PERIOD)
    afif.aluop = ALU_SUB;
    afif.port_a = 32'h00000006;
    afif.port_b = 32'h80000002;
    #(PERIOD)
    //testing negative flag
    afif.aluop = ALU_SUB;
    afif.port_a = 32'h00000005;
    afif.port_b = 32'h00000008;
    #(PERIOD)
    //set less than
    afif.aluop = ALU_SLT;
    afif.port_a = 32'hf0000000;
    afif.port_b = 32'h0f000000;
    #(PERIOD)
    //set less than unsigned
    afif.aluop = ALU_SLTU;
    afif.port_a = 32'hf0000000;
    afif.port_b = 32'h0f000000;
    #(PERIOD);
  end
endprogram


