onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group fuif /forwarding_unit_tb/fuif/forwarda
add wave -noupdate -expand -group fuif /forwarding_unit_tb/fuif/forwardb
add wave -noupdate -expand -group fuif /forwarding_unit_tb/fuif/rdat1forward
add wave -noupdate -expand -group fuif /forwarding_unit_tb/fuif/rdat2forward
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ihit
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dhit
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc4_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/immload_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Instruction16_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ExtOp_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUsrc_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/RegDst_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/jal_sel_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dWEN_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dREN_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/halt_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/MemtoReg_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rf_wen_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/PCSrc_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rs_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rt_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rd_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUctr_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm25_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc4_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/immload_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ExtOp_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm16_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat1_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat2_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Instruction16_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rs_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rt_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rd_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm25_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUsrc_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/RegDst_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/jal_sel_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dWEN_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dREN_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/halt_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/MemtoReg_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rf_wen_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUctr_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/PCSrc_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc4_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm16_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat1_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat2_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rs_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rt_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rd_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm25_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUsrc_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/RegDst_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/jal_sel_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUctr_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pcOut_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUout_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dmwdata_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/regOut_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/zero_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dWEN_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dREN_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/halt_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/MemtoReg_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rf_wen_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/PCSrc_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pcOut_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUout_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat2_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdat1_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc4_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dmwdata_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/regOut_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/zero_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dWEN_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/dREN_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/halt_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/PCSrc_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm25_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/MemtoReg_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rf_wen_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdata_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/MemtoReg_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rf_wen_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/rdata_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/regOut_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUout_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/writeback_flush
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/writeback_enable
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/instruction_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/instruction_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/instruction_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/instruction_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/instruction_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUctr_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/ALUctr_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rs_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rt_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rs_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Rt_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pc_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/npc_if
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/npc_id
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/npc_ex
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/npc_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/npc_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm16_mem
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/Imm16_wb
add wave -noupdate -expand -group plif /forwarding_unit_tb/plif/pcOut_wb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {1 us}
