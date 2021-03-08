`ifndef BRANCH_TARGET_PREDICTOR_IF_VH
`define BRANCH_TARGET_PREDICTOR_IF_VH

`include "cpu_types_pkg.vh"

interface branch_target_predictor_if;
	//import types
   import cpu_types_pkg::*;

   // input
   logic 	branch_taken;
   word_t   next_pc;
   word_t   branchAddr;

   //output
   logic 	branch_prediction; // taken = 1, not taken = 0
   logic    ifbranch;
   logic [1:0] penalty_cycles;

endinterface
`endif