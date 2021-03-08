`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

module register_file(
  input clk, nRst,
  register_file_if.rf rfif
);
import cpu_types_pkg::*;
word_t [31:0]registers, n_registers;

always_ff @(posedge clk, negedge nRst) begin
  if(!nRst) begin
    registers <= '{default:'0};
  end
  else begin
    registers <= n_registers;
  end
end
always_comb begin
  n_registers = registers;
  if(rfif.WEN && rfif.wsel != '0)
    n_registers[rfif.wsel] = rfif.wdat;
end

assign rfif.rdat1 = registers[rfif.rsel1];
assign rfif.rdat2 = registers[rfif.rsel2];

endmodule
