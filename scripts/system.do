onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/DUT/nRST
add wave -noupdate /system_tb/DUT/CPU/CLK
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -expand -group ramif /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/pc
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/npc
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -expand -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate /system_tb/DUT/CPU/DP1/RF/registers
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/state
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/prio
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/reqC
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/instr_choose
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/pc
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/npc
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate /system_tb/DUT/CPU/DP0/RF/registers
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/Rd
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/Rt
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/Rs
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/imm16
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/cuif/ALUctr
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CONTROL/opcode
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CONTROL/rtype
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/cuif/Rd
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/cuif/Rt
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/cuif/Rs
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/cuif/imm16
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/CONTROL/opcode
add wave -noupdate -expand -group cuif1 /system_tb/DUT/CPU/DP1/CONTROL/rtype
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ihit
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dhit
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc4_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/immload_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Instruction16_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ExtOp_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUsrc_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/RegDst_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/jal_sel_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dWEN_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dREN_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/halt_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/MemtoReg_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rf_wen_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/PCSrc_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rs_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rt_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rd_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUctr_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm25_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc4_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/immload_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ExtOp_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm16_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat1_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat2_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Instruction16_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rs_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rt_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rd_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm25_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUsrc_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/RegDst_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/jal_sel_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dWEN_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dREN_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/halt_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/MemtoReg_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rf_wen_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUctr_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/PCSrc_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc4_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm16_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat1_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat2_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rs_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rt_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rd_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm25_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUsrc_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/RegDst_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/jal_sel_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUctr_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pcOut_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUout_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dmwdata_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/regOut_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/zero_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dWEN_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dREN_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/halt_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/MemtoReg_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rf_wen_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/PCSrc_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pcOut_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUout_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat2_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdat1_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc4_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dmwdata_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/regOut_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/zero_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dWEN_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/dREN_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/halt_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/PCSrc_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm25_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/MemtoReg_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rf_wen_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdata_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/MemtoReg_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rf_wen_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/rdata_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/regOut_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUout_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/writeback_flush
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/writeback_enable
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/instruction_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUctr_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/ALUctr_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rs_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rt_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rs_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Rt_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pc_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/npc_if
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/npc_id
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/npc_ex
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/npc_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/npc_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm16_mem
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/Imm16_wb
add wave -noupdate -group plif0 /system_tb/DUT/CPU/DP0/plif/pcOut_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/branchAddr
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ihit
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dhit
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc4_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/immload_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Instruction16_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ExtOp_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUsrc_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/RegDst_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/jal_sel_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dWEN_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dREN_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/halt_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/MemtoReg_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rf_wen_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/PCSrc_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rs_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rt_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rd_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUctr_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm25_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc4_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/immload_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ExtOp_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm16_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat1_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat2_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Instruction16_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rs_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rt_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rd_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm25_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUsrc_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/RegDst_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/jal_sel_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dWEN_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dREN_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/halt_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/MemtoReg_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rf_wen_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUctr_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/PCSrc_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc4_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm16_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat1_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat2_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rs_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rt_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rd_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm25_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUsrc_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/RegDst_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/jal_sel_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUctr_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pcOut_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUout_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dmwdata_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/regOut_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/zero_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dWEN_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dREN_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/halt_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/MemtoReg_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rf_wen_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/PCSrc_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pcOut_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUout_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat2_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdat1_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc4_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dmwdata_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/regOut_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/zero_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dWEN_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/dREN_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/halt_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/PCSrc_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm25_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/MemtoReg_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rf_wen_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdata_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/MemtoReg_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rf_wen_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/rdata_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/regOut_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUout_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/writeback_flush
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/writeback_enable
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/instruction_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUctr_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/ALUctr_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rs_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rt_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rs_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Rt_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pc_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/npc_if
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/npc_id
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/npc_ex
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/npc_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/npc_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm16_mem
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/Imm16_wb
add wave -noupdate -expand -group plif1 /system_tb/DUT/CPU/DP1/plif/pcOut_wb
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/hit
add wave -noupdate -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/address
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nstate
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/rmwstate
add wave -noupdate -group dcache0 -expand /system_tb/DUT/CPU/CM0/DCACHE/addr
add wave -noupdate -group dcache0 -expand /system_tb/DUT/CPU/CM0/DCACHE/snoopaddr
add wave -noupdate -group dcache0 -expand /system_tb/DUT/CPU/CM0/DCACHE/dcache
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/LRUindicator
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/next_LRUindicator
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit0
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit1
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/snoophit
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/snoophit0
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/snoophit1
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/flush_count_out
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/flush_count_enable
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/total
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/next_total
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit_count
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/next_hit_count
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/previous_addr
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/previous_dWEN
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/previous_dREN
add wave -noupdate -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/flush_idx
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/hit
add wave -noupdate -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/address
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nstate
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/addr
add wave -noupdate -expand -group dcache1 -expand /system_tb/DUT/CPU/CM1/DCACHE/snoopaddr
add wave -noupdate -expand -group dcache1 -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/dcache[7]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[1]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[0]} -expand} /system_tb/DUT/CPU/CM1/DCACHE/dcache
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/LRUindicator
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/next_LRUindicator
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit0
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit1
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/snoophit
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/snoophit0
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/snoophit1
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/flush_count_out
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/flush_count_enable
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/total
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/next_total
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit_count
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/next_hit_count
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/previous_addr
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/previous_dWEN
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/previous_dREN
add wave -noupdate -expand -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/flush_idx
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -expand -group ccif -expand /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -expand -group ccif -expand /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccwait
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccinv
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccwrite
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ccsnoopaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -expand -group ccif /system_tb/DUT/CPU/CC/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {2078983 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 187
configure wave -valuecolwidth 80
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1999 ns} {2451 ns}
