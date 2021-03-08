onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/CLK
add wave -noupdate /control_unit_tb/PROG/tb_test_case
add wave -noupdate -radix hexadecimal -childformat {{{/control_unit_tb/cuif/instruction[31]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[30]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[29]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[28]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[27]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[26]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[25]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[24]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[23]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[22]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[21]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[20]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[19]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[18]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[17]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[16]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[15]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[14]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[13]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[12]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[11]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[10]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[9]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[8]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[7]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[6]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[5]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[4]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[3]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[2]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[1]} -radix hexadecimal} {{/control_unit_tb/cuif/instruction[0]} -radix hexadecimal}} -subitemconfig {{/control_unit_tb/cuif/instruction[31]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[30]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[29]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[28]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[27]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[26]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[25]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[24]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[23]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[22]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[21]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[20]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[19]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[18]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[17]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[16]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[15]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[14]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[13]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[12]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[11]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[10]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[9]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[8]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[7]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[6]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[5]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[4]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[3]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[2]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[1]} {-height 16 -radix hexadecimal} {/control_unit_tb/cuif/instruction[0]} {-height 16 -radix hexadecimal}} /control_unit_tb/cuif/instruction
add wave -noupdate /control_unit_tb/cuif/Rs
add wave -noupdate /control_unit_tb/cuif/Rt
add wave -noupdate /control_unit_tb/cuif/Rd
add wave -noupdate /control_unit_tb/cuif/ALUctr
add wave -noupdate /control_unit_tb/cuif/Imm16
add wave -noupdate /control_unit_tb/cuif/RegWEN
add wave -noupdate /control_unit_tb/cuif/RegDst
add wave -noupdate /control_unit_tb/cuif/jr
add wave -noupdate /control_unit_tb/cuif/j
add wave -noupdate /control_unit_tb/cuif/jal
add wave -noupdate /control_unit_tb/cuif/beq
add wave -noupdate /control_unit_tb/cuif/bne
add wave -noupdate /control_unit_tb/cuif/halt
add wave -noupdate /control_unit_tb/cuif/ExtOp
add wave -noupdate /control_unit_tb/DUT/opcode
add wave -noupdate /control_unit_tb/DUT/funct
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ns} 0}
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
WaveRestoreZoom {0 ns} {100 ns}
