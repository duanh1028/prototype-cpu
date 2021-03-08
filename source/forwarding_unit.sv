`include "cpu_types_pkg.vh"
`include "forwarding_unit_if.vh"

module forwarding_unit(
  forwarding_unit_if fuif,
  pipeline_registers_if plif
);
import cpu_types_pkg::*;
always_comb begin
fuif.forwarda = 2'b0;
fuif.forwardb = 2'b0;
fuif.rdat1forward = 1'b0;
fuif.rdat2forward = 1'b0;
if(plif.rf_wen_mem &&
   plif.regOut_mem != 0 &&
   plif.Rs_ex == plif.regOut_mem)
  fuif.forwarda = 2'b01;
else if
  (plif.rf_wen_wb &&
   plif.regOut_wb != 0 &&
   plif.Rs_ex == plif.regOut_wb)
  fuif.forwarda = 2'b10;

if(plif.rf_wen_mem &&
   plif.regOut_mem != 0 &&
   plif.Rt_ex == plif.regOut_mem)
  fuif.forwardb = 2'b01;
else if
  (plif.rf_wen_wb &&
   plif.regOut_wb != 0 &&
   plif.Rt_ex == plif.regOut_wb)
  fuif.forwardb = 2'b10;

if(plif.rf_wen_wb &&
   plif.regOut_wb != 0 &&
   plif.Rs_id == plif.regOut_wb)
   fuif.rdat1forward = 1'b1;

if(plif.rf_wen_wb &&
   plif.regOut_wb != 0 &&
   plif.Rt_id == plif.regOut_wb)
   fuif.rdat2forward = 1'b1;




end


endmodule
