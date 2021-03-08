`include "alu_if.vh"
`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"

module control_unit(
  control_unit_if.cu cuif
);
import cpu_types_pkg::*;
opcode_t opcode;
funct_t rtype;
assign opcode =  opcode_t'(cuif.instruction[31:26]);
assign rtype = funct_t'(cuif.instruction[5:0]);
assign cuif.Rd = cuif.instruction[15:11];
assign cuif.imm16 = cuif.instruction[15:0];

always_comb begin
  cuif.dWEN = 1'b0;
  cuif.dREN = 1'b0;
  cuif.rf_wdata_sel = 1'b0;
  cuif.rf_wen = 1'b0;
  cuif.ALUsrc = 1'b0;
  cuif.RegDst = 1'b0;
  cuif.ExtOp  = 2'b0;
  cuif.PCsrc   = 3'b0;
  cuif.ALUctr = ALU_SLL;
  cuif.jal_sel = 1'b0;
  cuif.MemtoReg = 1'b0;
  cuif.Rs = cuif.instruction[25:21];
  cuif.Rt = cuif.instruction[20:16];
  cuif.halt = 0;
  cuif.atomic = 0;
  if(cuif.instruction[31:26] == 6'b111111)
    cuif.halt = 1;
  casez(cuif.instruction[31:26])
      J         : cuif.PCsrc = 3'd2;
      JAL       : begin cuif.PCsrc = 3'd2;
                  cuif.rf_wdata_sel = 1'b1;
                  cuif.rf_wen = 1'b1;
                  cuif.jal_sel = 1'b1; end
      BEQ       : begin cuif.ALUctr = ALU_SUB;
                  cuif.PCsrc = 3'd3; end
      BNE       : begin cuif.ALUctr = ALU_SUB;
                  cuif.PCsrc = 3'd4; end
      ADDI      : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.rf_wen = 1'b1; end
      ADDIU     : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.rf_wen = 1'b1; end
      SLTI      : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_SLT;
                  cuif.rf_wen = 1'b1; end
      SLTIU     : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_SLTU;
                  cuif.rf_wen = 1'b1; end
      ANDI      : begin cuif.ExtOp = 2'b00;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_AND;
                  cuif.rf_wen = 1'b1; end
      ORI       : begin cuif.ExtOp = 2'b00;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_OR;
                  cuif.rf_wen = 1'b1; end
      XORI      : begin cuif.ExtOp = 2'b00;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_XOR;
                  cuif.rf_wen = 1'b1; end
      LUI       : begin cuif.ExtOp = 2'b10;
                  cuif.ALUsrc = 1'b1;
                  cuif.Rs = 5'b0;
                  cuif.ALUctr = ALU_OR;
                  cuif.rf_wen = 1'b1; end
      LW        : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.dREN = 1'b1;
                  cuif.MemtoReg = 1'b1;
                  cuif.rf_wen = 1'b1; end
      SW        : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.dWEN = 1'b1; end
      LL        : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.dREN = 1'b1;
                  cuif.MemtoReg = 1'b1;
                  cuif.rf_wen = 1'b1; 
                  cuif.atomic = 1'b1; end    
      SC        : begin cuif.ExtOp = 2'b01;
                  cuif.ALUsrc = 1'b1;
                  cuif.ALUctr = ALU_ADD;
                  cuif.dWEN = 1'b1; 
                  cuif.MemtoReg = 1'b1;
		  cuif.rf_wen = 1'b1;
		  cuif.atomic = 1'b1; end  
//    HALT      : begin cuif.halt = 1'b1;end
      RTYPE     : begin
                  cuif.RegDst = 1'b1;
                  cuif.rf_wen = 1'b1;
                  casez(cuif.instruction[5:0])
                    SLLV     : cuif.ALUctr = ALU_SLL;
                    SRLV     : cuif.ALUctr = ALU_SRL;
                    ADD      : cuif.ALUctr = ALU_ADD;
                    ADDU     : cuif.ALUctr = ALU_ADD;
                    SUB      : cuif.ALUctr = ALU_SUB;
                    SUBU     : cuif.ALUctr = ALU_SUB;
                    AND      : cuif.ALUctr = ALU_AND;
                    OR       : cuif.ALUctr = ALU_OR;
                    XOR      : cuif.ALUctr = ALU_XOR;
                    NOR      : cuif.ALUctr = ALU_NOR;
                    SLT      : cuif.ALUctr = ALU_SLT;
                    SLTU     : cuif.ALUctr = ALU_SLT;
                    JR       : cuif.PCsrc = 3'd1;
                  endcase
                  end
  endcase
end
endmodule
