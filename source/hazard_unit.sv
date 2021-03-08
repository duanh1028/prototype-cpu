`include "pipeline_registers_if.vh"
`include "hazard_unit_if.vh"
`include "forwarding_unit_if.vh"
`include "cpu_types_pkg.vh"
//`include "branch_target_predictor_if.vh"

module hazard_unit(
    pipeline_registers_if plif,
    hazard_unit_if huif,
    forwarding_unit_if fuif
    //branch_target_predictor_if btpif
);
import cpu_types_pkg::*;
always_comb begin
huif.fd_stall = 0;
huif.fd_flush = 0;

huif.de_stall = 0;
huif.de_flush = 0;

huif.em_stall = 0;
huif.em_flush = 0;

huif.mw_stall = 0;
huif.mw_flush = 0;

huif.pc_stall = 0;
huif.stop_new_branch = 0;
/*
if((plif.instruction_ex[31:26] != BEQ)
 & (plif.instruction_ex[31:26] != BNE)
 & (plif.instruction_ex[31:26] != J)
 & (plif.instruction_ex[31:26] != JAL)
 & (plif.instruction_mem[31:26] != BEQ)
 & (plif.instruction_mem[31:26] != BNE)
 & (plif.instruction_mem[31:26] != J)
 & (plif.instruction_mem[31:26] != JAL)
*/


//not taken predictor
/*
if((plif.instruction_id[31:26] == ADDIU)
 | (plif.instruction_id[31:26] == ADDI)
 | (plif.instruction_id[31:26] == ANDI)
 | (plif.instruction_id[31:26] == ORI)
 | (plif.instruction_id[31:26] == SLTI)
 | (plif.instruction_id[31:26] == SLTIU)
 | (plif.instruction_id[31:26] == XORI)
 | (plif.instruction_id[31:26] == LW)
 | ((plif.instruction_id[31:26] == RTYPE) && (plif.instruction_id[5:0] == JR)))begin
  if((plif.Rs_id == plif.regOut_ex) && (plif.regOut_ex != '0)) begin
    $display("1 hazard in ex");
    huif.fd_stall = 1;
    huif.de_flush = 1;
    huif.pc_stall = 1;
  end
  else if((plif.Rs_id == plif.regOut_mem) && (plif.regOut_mem != '0)) begin
    $display("1 hazard in mem");
    huif.fd_stall = 1;
    huif.de_stall = 1;
    huif.em_flush = 1;
    huif.pc_stall = 1;
  end
  else if((plif.Rs_id == plif.regOut_wb) && (plif.regOut_wb != '0)) begin
    $display("1 hazard in wb");
    huif.fd_stall = 1;
    huif.de_stall = 1;
    huif.em_stall = 1;
    huif.mw_flush = 1;
    huif.pc_stall = 1;
  end
end
else if((plif.instruction_id[31:26] == BNE)
      | (plif.instruction_id[31:26] == BEQ)
      | (plif.instruction_id[31:26] == SW)
      | ((plif.instruction_id[31:26] == RTYPE) && (plif.instruction_id != 32'b0))) begin
  if(((plif.Rs_id == plif.regOut_ex)
   | (plif.Rt_id == plif.regOut_ex)) && (plif.regOut_ex != 2'b0)) begin
    $display("2 hazard in ex");
    huif.fd_stall = 1;
    huif.de_flush = 1;
    huif.pc_stall = 1;
  end
  else if(((plif.Rs_id == plif.regOut_mem)
        | (plif.Rt_id == plif.regOut_mem)) && (plif.regOut_mem != 2'b0)) begin
    $display("2 hazard in mem");
    huif.fd_stall = 1;
    huif.de_stall = 1;
    huif.em_flush = 1;
    huif.pc_stall = 1;
  end
  else if(((plif.Rs_id == plif.regOut_wb)
        | (plif.Rt_id == plif.regOut_wb)) && (plif.regOut_wb != 2'b0)) begin
    $display("2 hazard in wb");
    huif.fd_stall = 1;
    huif.de_stall = 1;
    huif.em_stall = 1;
    huif.mw_flush = 1;
    huif.pc_stall = 1;
  end
end

*/
/*
if(plif.dhit) begin
  huif.fd_stall = 1;
  huif.de_stall = 1;
  huif.mw_stall = plif.dWEN_mem ? 1 : 0;
  huif.pc_stall = 1;
end
*/
/*
if(plif.instruction_id[31:26] == LW || plif.instruction_id[31:26] == SW) begin
  huif.pc_stall = 1;
  huif.fd_flush = 1;
end

if(plif.instruction_ex[31:26] == LW || plif.instruction_ex[31:26] == SW) begin
  huif.pc_stall = 1;
  huif.fd_flush = 1;
  huif.de_flush = 1;
end

if(plif.instruction_mem[31:26] == LW || plif.instruction_mem[31:26] == SW) begin
  huif.de_flush = 1;
  huif.em_flush = 1;
end
*/

if(plif.rf_wen_mem &&
   plif.regOut_mem != 0 &&
   (plif.Rs_id == plif.regOut_mem | plif.Rt_id == plif.regOut_mem) && 
   (plif.dWEN_ex | plif.dREN_ex)) begin
   huif.pc_stall = 1;
   huif.fd_stall = 1;
   huif.de_flush = 1;
end
/*branch not taken
if(plif.instruction_mem[31:26] == BEQ && plif.zero_mem == 1
   || plif.instruction_mem[31:26] == BNE && plif.zero_mem == 0) begin
    $display("branch flush");
    huif.fd_flush = 1;
    huif.de_flush = 1;
    huif.em_flush = 1;
end*/

//branch taken predictor
if(plif.instruction_mem[31:26] == BEQ && plif.zero_mem == 0
   || plif.instruction_mem[31:26] == BNE && plif.zero_mem == 1) begin

    huif.fd_flush = 1;
    huif.de_flush = 1;
    huif.em_flush = 1;
    if(plif.instruction_if[31:26] == BEQ || plif.instruction_if[31:26] == BNE) begin
	huif.stop_new_branch = 1;
    end
end
/*
if(btpif.branch_taken != btpif.branch_prediction) begin
    $display("branch flush");
    huif.fd_flush = 1;
    huif.de_flush = 1;
    huif.em_flush = 1;
end*/
else begin
if(/*(plif.instruction_id[31:26] == BEQ)
 | (plif.instruction_id[31:26] == BNE)
 | */(plif.instruction_id[31:26] == J)
 | (plif.instruction_id[31:26] == JAL)
 | (plif.instruction_id[31:26] == RTYPE && plif.instruction_id[5:0] == JR)) begin

  huif.fd_stall = 1;
  huif.pc_stall = 1;
end
if(/*(plif.instruction_ex[31:26] == BEQ)
 | (plif.instruction_ex[31:26] == BNE)
 | */(plif.instruction_ex[31:26] == J)
 | (plif.instruction_ex[31:26] == JAL)
 | (plif.instruction_ex[31:26] == RTYPE && plif.instruction_ex[5:0] == JR)) begin

  huif.fd_flush = 1;
  huif.de_flush = 1;
  huif.pc_stall = 1;
end
if(/*(plif.instruction_mem[31:26] == BEQ)
 | (plif.instruction_mem[31:26] == BNE)
 | */(plif.instruction_mem[31:26] == J)
 | (plif.instruction_mem[31:26] == JAL)
 | (plif.instruction_mem[31:26] == RTYPE && plif.instruction_mem[5:0] == JR)) begin

  huif.fd_flush = 1;
  huif.de_flush = 1;
  huif.em_flush = 1;
end


end
end


endmodule

