`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH
`include "cpu_types_pkg.vh"

interface request_unit_if;
  import cpu_types_pkg::*;
  logic dWEN, dREN, dhit, ihit;
  logic dmREN, dmWEN;
  logic halt;
  modport ru(
    input dWEN, dREN, dhit, ihit, halt,
    output dmREN, dmWEN
  );
  modport tb(
    input dmREN, dmWEN,
    output dWEN, dREN, dhit, ihit, halt
  );


endinterface
`endif
