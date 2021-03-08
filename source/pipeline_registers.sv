`include "cpu_types_pkg.vh"
`include "pipeline_registers_if.vh"
`include "hazard_unit_if.vh"

module pipeline_registers (
  input logic CLK, nRST,
  pipeline_registers_if plif,
  hazard_unit_if huif
);
    logic enable_write;
    import cpu_types_pkg::*;

    //IF/ID
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            plif.pc4_id <= '0;
            plif.immload_id <= '0;
            plif.ExtOp_id <= '0;
            plif.ALUsrc_id <= '0;
            plif.RegDst_id <= '0;
            plif.jal_sel_id <= '0;
            plif.ALUctr_id <= ALU_SLL;
            plif.dWEN_id <= '0;
            plif.dREN_id <= '0;
            plif.halt_id <= '0;
            plif.PCSrc_id <= '0;
            plif.MemtoReg_id <= '0;
            plif.rf_wen_id <= '0;
            plif.Instruction16_id <= '0;
            plif.Rs_id <= '0;
            plif.Rt_id <= '0;
            plif.Rd_id <= '0;
            plif.Imm25_id <= '0;
            plif.instruction_id <= '0;
            plif.pc_id <= '0;
            plif.npc_id <= '0;
            plif.atomic_id <= '0;
        end
        else if(plif.ihit & huif.fd_flush) begin
            plif.pc4_id <= '0;
            plif.immload_id <= '0;
            plif.ExtOp_id <= '0;
            plif.ALUsrc_id <= '0;
            plif.RegDst_id <= '0;
            plif.jal_sel_id <= '0;
            plif.ALUctr_id <= ALU_SLL;
            plif.dWEN_id <= '0;
            plif.dREN_id <= '0;
            plif.halt_id <= '0;
            plif.PCSrc_id <= '0;
            plif.MemtoReg_id <= '0;
            plif.rf_wen_id <= '0;
            plif.Instruction16_id <= '0;
            plif.Rs_id <= '0;
            plif.Rt_id <= '0;
            plif.Rd_id <= '0;
            plif.Imm25_id <= '0;
            plif.instruction_id <= '0;
            plif.pc_id <= '0;
            plif.npc_id <= '0;
            plif.atomic_id <= '0;
        end
        else if(plif.ihit & !huif.fd_stall & !plif.halt_mem)begin
            plif.pc4_id <= plif.pc4_if;
            plif.immload_id <= plif.immload_if;
            plif.ExtOp_id <= plif.ExtOp_if;
            plif.ALUsrc_id <= plif.ALUsrc_if;
            plif.RegDst_id <=  plif.RegDst_if;
            plif.jal_sel_id <= plif.jal_sel_if;
            plif.ALUctr_id <= plif.ALUctr_if;
            plif.dWEN_id <= plif.dWEN_if;
            plif.dREN_id <= plif.dREN_if;
            plif.halt_id <= plif.halt_if;
            plif.PCSrc_id <= plif.PCSrc_if;
            plif.MemtoReg_id <= plif.MemtoReg_if;
            plif.rf_wen_id <= plif.rf_wen_if;
            plif.Instruction16_id <= plif.Instruction16_if;
            plif.Rs_id <= plif.Rs_if;
            plif.Rt_id <= plif.Rt_if;
            plif.Rd_id <= plif.Rd_if;
            plif.Imm25_id <= plif.Imm25_if;
            plif.instruction_id <= plif.instruction_if;
            plif.pc_id <= plif.pc_if;
            plif.npc_id <= plif.npc_if;
            plif.atomic_id <= plif.atomic_if;
        end
    end

    //ID/EX
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            plif.pc4_ex <= '0;
            plif.Imm16_ex <= '0;
            plif.Rs_ex <= '0;
            plif.Rt_ex <= '0;
            plif.Rd_ex <= '0;
            plif.Imm25_ex <= '0;
            plif.rdat1_ex <= '0;
            plif.rdat2_ex <= '0;
            plif.ALUsrc_ex <= '0;
            plif.RegDst_ex <= '0;
            plif.jal_sel_ex <= '0;
            plif.ALUctr_ex <= ALU_SLL;
            plif.dWEN_ex <= '0;
            plif.dREN_ex <= '0;
            plif.halt_ex <= '0;
            plif.PCSrc_ex <= '0;
            plif.MemtoReg_ex <= '0;
            plif.rf_wen_ex <= '0;
            plif.instruction_ex <= '0;
            plif.pc_ex <= '0;
            plif.npc_ex <= '0;
            plif.atomic_ex <= '0;
        end
        else if(plif.ihit & huif.de_flush) begin
            plif.pc4_ex <= '0;
            plif.Imm16_ex <= '0;
            plif.Rs_ex <= '0;
            plif.Rt_ex <= '0;
            plif.Rd_ex <= '0;
            plif.Imm25_ex <= '0;
            plif.rdat1_ex <= '0;
            plif.rdat2_ex <= '0;
            plif.ALUsrc_ex <= '0;
            plif.RegDst_ex <= '0;
            plif.jal_sel_ex <= '0;
            plif.ALUctr_ex <= ALU_SLL;
            plif.dWEN_ex <= '0;
            plif.dREN_ex <= '0;
            plif.halt_ex <= '0;
            plif.PCSrc_ex <= '0;
            plif.MemtoReg_ex <= '0;
            plif.rf_wen_ex <= '0;
            plif.instruction_ex <= '0;
            plif.pc_ex <= '0;
            plif.npc_ex <= '0;
            plif.atomic_ex <= '0;
        end
        else if(plif.ihit & !huif.de_stall & !plif.halt_mem)begin
            plif.pc4_ex <= plif.pc4_id;
            plif.Imm16_ex <= plif.Imm16_id;
            plif.Rs_ex <= plif.Rs_id;
            plif.Rt_ex <= plif.Rt_id;
            plif.Rd_ex <= plif.Rd_id;
            plif.Imm25_ex <= plif.Imm25_id;
            plif.rdat1_ex <= plif.rdat1_id;
            plif.rdat2_ex <= plif.rdat2_id;
            plif.ALUsrc_ex <= plif.ALUsrc_id;
            plif.RegDst_ex <= plif.RegDst_id;
            plif.jal_sel_ex <= plif.jal_sel_id;
            plif.ALUctr_ex <= plif.ALUctr_id;
            plif.dWEN_ex <= plif.dWEN_id;
            plif.dREN_ex <= plif.dREN_id;
            plif.halt_ex <= plif.halt_id;
            plif.PCSrc_ex <= plif.PCSrc_id;
            plif.MemtoReg_ex <= plif.MemtoReg_id;
            plif.rf_wen_ex <= plif.rf_wen_id;
            plif.instruction_ex <= plif.instruction_id;
            plif.pc_ex <= plif.pc_id;
            plif.npc_ex <= plif.npc_id;
            plif.atomic_ex <= plif.atomic_id;
        end
    end

    //EX/MEM
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            plif.pcOut_mem <= '0;
            plif.ALUout_mem <= '0;
            plif.regOut_mem <= '0;
            plif.zero_mem <= '0;
            plif.halt_mem <= '0;
            plif.PCSrc_mem <= '0;
            plif.rdat1_mem <= '0;
            plif.rdat2_mem <= '0;
            plif.Imm25_mem <= '0;
            plif.MemtoReg_mem <= '0;
            plif.rf_wen_mem <= '0;
            plif.instruction_mem <= '0;
            plif.ALUctr_mem <= ALU_SLL;
            plif.Rs_mem <= '0;
            plif.Rt_mem <= '0;
            plif.PCSrc_mem <= '0;
            plif.npc_mem <= '0;
            plif.Imm16_mem <= '0;
            plif.dWEN_mem <= '0;
            plif.dREN_mem <= '0;
            plif.pc4_mem <= '0;
            plif.dmwdata_mem <= '0;
            plif.atomic_mem <= '0;
        end
        else if((plif.ihit & huif.em_flush)) begin
            plif.pcOut_mem <= '0;
            plif.ALUout_mem <= '0;
            plif.regOut_mem <= '0;
            plif.zero_mem <= '0;
            plif.halt_mem <= '0;
            plif.PCSrc_mem <= '0;
            plif.rdat1_mem <= '0;
            plif.rdat2_mem <= '0;
            plif.Imm25_mem <= '0;
            plif.MemtoReg_mem <= '0;
            plif.rf_wen_mem <= '0;
            plif.instruction_mem <= '0;
            plif.ALUctr_mem <= ALU_SLL;
            plif.Rs_mem <= '0;
            plif.Rt_mem <= '0;
            plif.PCSrc_mem <= '0;
            plif.npc_mem <= '0;
            plif.Imm16_mem <= '0;
            plif.dWEN_mem <= '0;
            plif.dREN_mem <= '0;
            plif.pc4_mem <= '0;
            plif.dmwdata_mem <= '0;
            plif.atomic_mem <= '0;
        end
        else if(plif.ihit & !huif.em_stall & !plif.halt_mem)begin
            plif.pcOut_mem <= plif.pcOut_ex;
            plif.ALUout_mem <= plif.ALUout_ex;
            plif.regOut_mem <= plif.regOut_ex;
            plif.zero_mem <= plif.zero_ex;
            plif.dWEN_mem <= plif.dWEN_ex;
            plif.dREN_mem <= plif.dREN_ex;
            plif.halt_mem <= plif.halt_ex;
            plif.PCSrc_mem <= plif.PCSrc_ex;
            plif.rdat1_mem <= plif.rdat1_ex;
            plif.rdat2_mem <= plif.rdat2_ex;
            plif.Imm25_mem <= plif.Imm25_ex;
            plif.MemtoReg_mem <= plif.MemtoReg_ex;
            plif.rf_wen_mem <= plif.rf_wen_ex;
            plif.instruction_mem <= plif.instruction_ex;
            plif.ALUctr_mem <= plif.ALUctr_ex;
            plif.Rs_mem <= plif.Rs_ex;
            plif.Rt_mem <= plif.Rt_ex;
            plif.pc_mem <= plif.pc_ex;
            plif.npc_mem <= plif.npc_ex;
            plif.Imm16_mem <= plif.Imm16_ex;
            plif.pc4_mem <= plif.pc4_ex;
            plif.dmwdata_mem <= plif.dmwdata_ex;
            plif.atomic_mem <= plif.atomic_ex;
        end
    end

    //MEM/WB
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            plif.MemtoReg_wb <= '0;
            plif.rf_wen_wb <= '0;
            plif.rdata_wb <= '0;
            plif.regOut_wb <= '0;
            plif.ALUout_wb <= '0;
            plif.instruction_wb <= '0;
            plif.ALUctr_wb <= ALU_SLL;
            plif.Rs_wb <= '0;
            plif.Rt_wb <= '0;
            plif.pc_wb <= '0;
            plif.npc_wb <= '0;
            plif.Imm16_wb <= '0;
            plif.pcOut_wb <= '0;
        end
        else if(plif.ihit & huif.mw_flush) begin
            plif.MemtoReg_wb <= '0;
            plif.rf_wen_wb <= '0;
            plif.rdata_wb <= '0;
            plif.regOut_wb <= '0;
            plif.ALUout_wb <= '0;
            plif.instruction_wb <= '0;
            plif.ALUctr_wb <= ALU_SLL;
            plif.Rs_wb <= '0;
            plif.Rt_wb <= '0;
            plif.pc_wb <= '0;
            plif.npc_wb <= '0;
            plif.Imm16_wb <= '0;
            plif.pcOut_wb <= '0;
        end
        else begin
            if(plif.writeback_flush) begin
                plif.MemtoReg_wb <= '0;
                plif.rf_wen_wb <= '0;
                plif.rdata_wb <= '0;
                plif.regOut_wb <= '0;
                plif.ALUout_wb <= '0;
                plif.instruction_wb <= '0;
                plif.ALUctr_wb <= ALU_SLL;
                plif.Rs_wb <= '0;
                plif.Rt_wb <= '0;
                plif.pc_wb <= '0;
                plif.npc_wb <= '0;
                plif.Imm16_wb <= '0;
                plif.pcOut_wb <= '0;
            end
            else if(plif.writeback_enable & (plif.ihit | plif.dhit) & !huif.mw_stall & !plif.halt_mem) begin
                plif.MemtoReg_wb <= plif.MemtoReg_mem;
                plif.rf_wen_wb <= plif.rf_wen_mem;
                plif.rdata_wb <= plif.rdata_mem;
                plif.regOut_wb <= plif.regOut_mem;
                plif.ALUout_wb <= plif.ALUout_mem;
                plif.instruction_wb <= plif.instruction_mem;
                plif.ALUctr_wb <= plif.ALUctr_mem;
                plif.Rs_wb <= plif.Rs_mem;
                plif.Rt_wb <= plif.Rt_mem;
                plif.pc_wb <= plif.pc_mem;
                plif.npc_wb <= plif.npc_mem;
                plif.Imm16_wb <= plif.Imm16_mem;
                plif.pcOut_wb <= plif.pcOut_mem;
            end
        end
    end


endmodule
