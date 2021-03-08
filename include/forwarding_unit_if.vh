`ifndef FORWARDING_UNIT_IF_VH
`define FORWARDING_UNIT_IF_VH
`include "cpu_types_pkg.vh"

interface forwarding_unit_if;
  logic[1:0] forwarda, forwardb;
  logic rdat1forward, rdat2forward;
endinterface

`endif
