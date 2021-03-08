`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"

import cpu_types_pkg::*;

`timescale 1 ns / 1 ns

module request_unit_tb;
  parameter PERIOD = 10;
  logic CLK = 0;
  logic nRst;

  always #(PERIOD/2) CLK++;

  request_unit_if ru();

  test PROG(CLK, nRst, ru);
`ifndef MAPPED
  request_unit DUT(CLK, nRst, ru);
`else
  request_unit DUT(
    .\CLK(CLK),
    .\nRst(nRst),
    .\ru.dWEN(ru.dWEN),
    .\ru.dREN(ru.dREN),
    .\ru.dhit(ru.dhit),
    .\ru.ihit(ru.ihit),
    .\ru.dmREN(ru.dmREN),
    .\ru.dmWEN(ru.dmWEN),
    .\ru.imREN(ru.imREN)
  );
`endif
endmodule

program test(
  input logic CLK,
  output logic nRst,
  request_unit_if.tb tb
);
  string test_case;
  parameter PERIOD = 10;
  initial begin
  nRst = 1;
  #(PERIOD);
  test_case = "reset";
  nRst = 0;
  tb.dWEN = 0;
  tb.dREN = 0;
  tb.dhit = 0;
  tb.ihit = 0;
  #(PERIOD);
  nRst = 1;
  #(PERIOD);
  test_case = "when dhit is 1";
  tb.dWEN = 1;
  tb.dREN = 0;
  tb.dhit = 1;
  #(PERIOD);
  test_case = "when ihit and dhit is 1";
  tb.dWEN = 1;
  tb.dREN = 0;
  tb.ihit = 1;
  tb.dhit = 1;
  #(PERIOD);
  test_case = "when ihit is 0 and dhit is 1";
  tb.dWEN = 1;
  tb.dREN = 0;
  tb.ihit = 1;
  tb.dhit = 0;
  #(PERIOD);
  end
endprogram
