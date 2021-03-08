`include "cpu_types_pkg.vh"
`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH
interface hazard_unit_if;
  import cpu_types_pkg::*;

  logic fd_stall, fd_flush, de_stall, de_flush, em_stall, em_flush, mw_stall, mw_flush, pc_stall, stop_new_branch;

endinterface
`endif
