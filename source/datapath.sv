`include "datapath_cache_if.vh"
`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"
`include "register_file_if.vh"
`include "alu_if.vh"
`include "control_unit_if.vh"
`include "pipeline_registers_if.vh"
`include "hazard_unit_if.vh"
`include "forwarding_unit_if.vh"
//`include "branch_target_predictor_if.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
import cpu_types_pkg::*;

parameter PC_INIT = 0;

//declare interface
//request_unit_if ruif();
register_file_if rfif();
alu_if aluif();
control_unit_if cuif();
pipeline_registers_if plif();
hazard_unit_if huif();
forwarding_unit_if fuif();
//branch_target_predictor_if btpif();
//connecting modules
//request_unit REQUEST(CLK, nRST, ruif);
register_file RF(CLK, nRST, rfif);
alu ALU(aluif);
control_unit CONTROL(cuif);
pipeline_registers PIPELINER(CLK, nRST, plif, huif);
//hazard_unit HAZARD(plif, huif, fuif, btpif);
hazard_unit HAZARD(plif, huif, fuif);
forwarding_unit FORWARD(fuif, plif);
//branch_target_predictor BRANCHPREDICT (CLK, nRST, btpif);
//declare variables inside datapath
word_t pc, npc, extended, pcplus4, rf_wdat, branchAddr;

assign rf_wdat = plif.instruction_wb[31:26] == JAL ? plif.npc_wb :
                 plif.MemtoReg_wb ? plif.rdata_wb : plif.ALUout_wb;

funct_t funct;
assign funct = funct_t'(plif.instruction_wb[5:0]);
opcode_t opcode;
assign opcode = opcode_t'(plif.instruction_wb[31:26]);

always_comb begin
  //extender
  case(plif.ExtOp_id)
    2'd0  : extended = {16'b0, plif.Instruction16_id};
    2'd1  : extended = {{16{plif.Instruction16_id[15]}}, plif.Instruction16_id};
    2'd2  : extended = {plif.Instruction16_id, 16'b0};
    default : extended = '0;
  endcase
end

/*always_comb begin
 //PC
  pcplus4 = pc + 4;
  case(plif.PCSrc_mem)
    3'd0  : npc = pcplus4;
    3'd1  : npc = plif.rdat1_mem;
    3'd2  : npc = {plif.pc4_mem[31:26], plif.Imm25_mem} << 2;
    3'd3  : npc = plif.zero_mem ? plif.pcOut_mem : pcplus4;
    3'd4  : npc = plif.zero_mem ? pcplus4 : plif.pcOut_mem;
    default : npc = pcplus4;
    //3'd3  : npc = huif.fd_flush ? plif.pcOut_mem : npc;
  endcase
end*/

always_comb begin
  //PC
  pcplus4 = pc + 4;
  //taken address use for branch taken predictor
 // branchAddr = pcplus4 + (dpif.imemload[15:0] << 2);
  branchAddr = {15'b0, (pcplus4[15:0] + (dpif.imemload[15:0] << 2))};

  case(plif.PCSrc_mem)
    3'd0  : begin npc = pcplus4; if((plif.PCSrc_if == 3'd3 | plif.PCSrc_if == 3'd4) & !huif.stop_new_branch) npc = branchAddr; end
    3'd1  : begin npc = plif.rdat1_mem; if((plif.PCSrc_if == 3'd3 | plif.PCSrc_if == 3'd4) & !huif.stop_new_branch) npc = branchAddr; end
    3'd2  : begin npc = {plif.pc4_mem[31:26], plif.Imm25_mem} << 2; if((plif.PCSrc_if == 3'd3 | plif.PCSrc_if == 3'd4) & !huif.stop_new_branch) npc = branchAddr; end
    //beq
    3'd3  : begin npc = pcplus4; if(plif.zero_mem == 0) npc = plif.pc4_mem; if((plif.PCSrc_if == 3'd3 | plif.PCSrc_if == 3'd4) & !huif.stop_new_branch) npc = branchAddr; end
    //bne
    3'd4  : begin npc = pcplus4; if(plif.zero_mem == 1) npc = plif.pc4_mem; if((plif.PCSrc_if == 3'd3 | plif.PCSrc_if == 3'd4) & !huif.stop_new_branch) npc = branchAddr; end
    default: npc = pcplus4;
  endcase
end

always_comb begin
  /*//btpif
  btpif.branch_taken = plif.instruction_mem[31:26] == BEQ && plif.zero_mem == 1 || plif.instruction_mem[31:26] == BNE && plif.zero_mem == 0;
  btpif.next_pc = npc;
  btpif.branchAddr = branchAddr;*/
  //cuif
  cuif.instruction = dpif.imemload;
  dpif.dmemaddr = plif.ALUout_mem;
  dpif.imemaddr = pc;
  dpif.dmemstore = plif.dmwdata_mem;
  //dpif
  dpif.imemREN = !plif.halt_mem;
  dpif.dmemREN = plif.dREN_mem;
  dpif.dmemWEN = plif.dWEN_mem;
  dpif.datomic = plif.atomic_mem;
  //aluif
  aluif.aluop = plif.ALUctr_ex;
  case(fuif.forwarda)
    2'b00 : aluif.port_a = plif.rdat1_ex;
    2'b01 : aluif.port_a = (plif.instruction_mem[31:26] == LW | plif.instruction_mem[31:26] == LL | plif.instruction_mem[31:26] == SC) ? dpif.dmemload : plif.ALUout_mem;
    2'b10 : aluif.port_a = rf_wdat;
    default : aluif.port_a = plif.rdat1_ex;
  endcase
  case(fuif.forwardb)
    2'b00 : aluif.port_b = plif.ALUsrc_ex ? plif.Imm16_ex : plif.rdat2_ex;
    2'b01 : aluif.port_b = plif.ALUsrc_ex ? plif.Imm16_ex :
                           (plif.instruction_mem[31:26] == LW | plif.instruction_mem[31:26] == LL | plif.instruction_mem[31:26] == SC) ? dpif.dmemload : plif.ALUout_mem;
    2'b10 : aluif.port_b = plif.ALUsrc_ex ? plif.Imm16_ex : rf_wdat;
    default : aluif.port_b = plif.rdat1_ex;
  endcase
end
always_comb begin
  // aluif.port_a = .....
  // aluif.port_b = plif.ALUsrc_ex ? plif.Imm16_ex : plif.rdat2_ex;
  //register file
  rfif.wsel = plif.regOut_wb;
  rfif.WEN = plif.rf_wen_wb;
  rfif.rsel1 = plif.Rs_id;
  rfif.rsel2 = plif.Rt_id;
  rfif.wdat =  rf_wdat;
  //pipeline registers
  plif.ihit = ((plif.dWEN_mem | plif.dREN_mem) & !dpif.dhit) ? 0 : dpif.ihit;
  plif.dhit = dpif.dhit;
  //IF
  plif.pc4_if = pcplus4;
  plif.immload_if = dpif.imemload;
  plif.ExtOp_if = cuif.ExtOp;
  plif.jal_sel_if = cuif.jal_sel;
  plif.RegDst_if = cuif.RegDst;
  plif.ALUsrc_if = cuif.ALUsrc;
  plif.dREN_if = cuif.dREN;
  plif.dWEN_if = cuif.dWEN;
  plif.MemtoReg_if = cuif.MemtoReg;
  plif.rf_wen_if = cuif.rf_wen;
  plif.halt_if = cuif.halt;
  plif.ALUctr_if = cuif.ALUctr;
  plif.PCSrc_if = cuif.PCsrc;
  plif.Rs_if = cuif.Rs;
  plif.Rd_if = cuif.Rd;
  plif.Rt_if = cuif.Rt;
  plif.Imm25_if = cuif.instruction[25:0];
  plif.Instruction16_if = cuif.imm16;
  plif.atomic_if = cuif.atomic;
  //ID

  plif.rdat1_id = fuif.rdat1forward == 0 ? rfif.rdat1 : rf_wdat;
  plif.rdat2_id = fuif.rdat2forward == 0 ? rfif.rdat2 : rf_wdat;

  plif.Imm16_id = extended;
  //EX
  plif.pcOut_ex = plif.pc4_ex + (plif.Imm16_ex << 2);
  plif.ALUout_ex = aluif.port_out;
  plif.regOut_ex = plif.jal_sel_ex ? 5'd31 : plif.RegDst_ex ? plif.Rd_ex : plif.Rt_ex;
  plif.zero_ex = aluif.zero;
  plif.dmwdata_ex = fuif.forwardb == 2'b00 ? plif.rdat2_ex :
		    fuif.forwardb == 2'b01 ? (plif.instruction_mem[31:26] == LW | plif.instruction_mem[31:26] == LL | plif.instruction_mem[31:26] == SC) ? dpif.dmemload : plif.ALUout_mem :
		    fuif.forwardb == 2'b10 ? rf_wdat : plif.rdat2_ex;
  //MEM
  plif.rdata_mem = dpif.dmemload;

  //enable&flush
  plif.writeback_enable = ((plif.dWEN_mem | plif.dREN_mem) & !dpif.dhit) ? 0 : dpif.ihit | dpif.dhit;
  plif.writeback_flush = 0;
  //system_tb
  plif.instruction_if = cuif.instruction;
  plif.pc_if = pc;
  plif.npc_if = npc;
end

always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    dpif.halt <= 0;
    pc <= PC_INIT;
  end
  else begin
    dpif.halt <= plif.halt_mem;
    if(plif.ihit & !huif.pc_stall & !plif.halt_mem & plif.instruction_wb != 32'hffffffff)
      pc <= npc;
  end
end

endmodule


//changed datapath plif. ihit
