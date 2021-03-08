`ifndef PIPELINE_REGISTERS_IF_VH
`define PIPELINE_REGISTERS_IF_VH

// typedefs
`include "cpu_types_pkg.vh"

interface pipeline_registers_if;
  // import types
  import cpu_types_pkg::*;

  logic ihit, dhit;

  //IF/ID
  word_t pc4_if, immload_if;
  logic[15:0] Instruction16_if;
  logic[1:0] ExtOp_if;
  logic ALUsrc_if, RegDst_if, jal_sel_if, dWEN_if, dREN_if, halt_if,
MemtoReg_if, rf_wen_if, atomic_if;
  logic [2:0] PCSrc_if;
  logic [4:0] Rs_if, Rt_if, Rd_if;
  aluop_t ALUctr_if;
  logic[25:0] Imm25_if;

  word_t pc4_id, immload_id;
  logic[1:0] ExtOp_id;

  //ID/EX
  word_t Imm16_id, rdat1_id, rdat2_id;
  logic[15:0] Instruction16_id;
  logic [4:0] Rs_id, Rt_id, Rd_id;
  logic[25:0] Imm25_id;
  logic ALUsrc_id, RegDst_id, jal_sel_id, dWEN_id, dREN_id, halt_id,
MemtoReg_id, rf_wen_id, atomic_id;
  aluop_t ALUctr_id;
  logic [2:0] PCSrc_id;

  word_t pc4_ex, Imm16_ex, rdat1_ex, rdat2_ex;
  logic [4:0] Rs_ex, Rt_ex, Rd_ex;
  logic[25:0] Imm25_ex;
  logic ALUsrc_ex, RegDst_ex, jal_sel_ex;
  aluop_t ALUctr_ex;

  //EX/MEM
  word_t pcOut_ex, ALUout_ex, dmwdata_ex;
  logic [4:0] regOut_ex;
  logic zero_ex, dWEN_ex, dREN_ex, halt_ex, MemtoReg_ex, rf_wen_ex, atomic_ex;
  logic [2:0] PCSrc_ex;

  word_t pcOut_mem, ALUout_mem, rdat2_mem, rdat1_mem, pc4_mem, dmwdata_mem;
  logic [4:0] regOut_mem;
  logic zero_mem, dWEN_mem, dREN_mem, halt_mem, atomic_mem;
  logic [2:0] PCSrc_mem;
  logic[25:0] Imm25_mem;


  //MEM/WB
  logic MemtoReg_mem, rf_wen_mem;
  word_t rdata_mem;

  logic MemtoReg_wb, rf_wen_wb;
  word_t rdata_wb;
  logic [4:0] regOut_wb;
  word_t ALUout_wb;

  //flush&enable
  logic writeback_flush;
  logic writeback_enable;

  //system_tb
  word_t instruction_if, instruction_id, instruction_ex, instruction_mem, instruction_wb;
  aluop_t ALUctr_mem, ALUctr_wb;
  logic [4:0] Rs_mem, Rt_mem, Rs_wb, Rt_wb;
  word_t pc_if, pc_id, pc_ex, pc_mem, pc_wb, npc_if, npc_id, npc_ex, npc_mem, npc_wb;
  word_t Imm16_mem, Imm16_wb;
  word_t pcOut_wb;

endinterface

`endif //PIPELINE_REGISTERS_IF_VH
