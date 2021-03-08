`include "alu_if.vh"
`include "cpu_types_pkg.vh"
module alu(
  alu_if.af afif
);
import cpu_types_pkg::*;
reg [31:0] temp;
always_comb begin
  afif.overflow = 1'b0;
  //shift left
  if(afif.aluop == ALU_SLL) begin
    afif.port_out = afif.port_b << afif.port_a[4:0];
  end
  //shift right
  else if(afif.aluop == ALU_SRL) begin
    afif.port_out = afif.port_b >> afif.port_a[4:0];
  end
  //add
  else if(afif.aluop == ALU_ADD) begin
    afif.port_out = afif.port_a + afif.port_b;
    if(afif.port_a[31] == afif.port_b[31]) begin
      afif.overflow = afif.port_out[31] != afif.port_a[31];
    end
  end
  //subtract
  else if(afif.aluop == ALU_SUB) begin
    afif.port_out = afif.port_a - afif.port_b;
    if(afif.port_a[31] != afif.port_b[31]) begin
      afif.overflow = afif.port_out[31] != afif.port_a[31];
    end
  end
  //and
  else if(afif.aluop == ALU_AND) begin
    afif.port_out = afif.port_a & afif.port_b;
  end
  //or
  else if(afif.aluop == ALU_OR) begin
    afif.port_out = afif.port_a | afif.port_b;
  end
  //xor
  else if(afif.aluop == ALU_XOR) begin
    afif.port_out = afif.port_a ^ afif.port_b;
  end
  //nor
  else if(afif.aluop == ALU_NOR) begin
    afif.port_out = ~(afif.port_a | afif.port_b);
  end
  //set less than
  else if(afif.aluop == ALU_SLT) begin
  afif.port_out = signed'(afif.port_a) < signed'(afif.port_b);
  end
  //set less than unsigned
  else if(afif.aluop == ALU_SLTU) begin
    afif.port_out = afif.port_a < afif.port_b;
  end
  //error
  else begin
    afif.port_out = 32'b0;
  end

  afif.negative = afif.port_out[31];
  afif.zero = afif.port_out == 32'b0;
end
endmodule