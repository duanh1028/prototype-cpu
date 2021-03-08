onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /branch_target_predictor_tb/CLK
add wave -noupdate /branch_target_predictor_tb/nRST
add wave -noupdate /branch_target_predictor_tb/DUT/prediction_state
add wave -noupdate /branch_target_predictor_tb/DUT/next_prediction_state
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/branch_taken
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/next_pc
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/branchAddr
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/branch_prediction
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/ifbranch
add wave -noupdate -expand -group btpif /branch_target_predictor_tb/btpif/penalty_cycles
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {2370 ns}
