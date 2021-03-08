onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group dcif /dcache_tb/dcif/halt
add wave -noupdate -expand -group dcif /dcache_tb/dcif/ihit
add wave -noupdate -expand -group dcif /dcache_tb/dcif/imemREN
add wave -noupdate -expand -group dcif /dcache_tb/dcif/imemload
add wave -noupdate -expand -group dcif /dcache_tb/dcif/imemaddr
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dhit
add wave -noupdate -expand -group dcif /dcache_tb/dcif/datomic
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dmemREN
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dmemWEN
add wave -noupdate -expand -group dcif /dcache_tb/dcif/flushed
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dmemload
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dmemstore
add wave -noupdate -expand -group dcif /dcache_tb/dcif/dmemaddr
add wave -noupdate -expand -group cif /dcache_tb/cif/iwait
add wave -noupdate -expand -group cif /dcache_tb/cif/dwait
add wave -noupdate -expand -group cif /dcache_tb/cif/iREN
add wave -noupdate -expand -group cif /dcache_tb/cif/dREN
add wave -noupdate -expand -group cif /dcache_tb/cif/dWEN
add wave -noupdate -expand -group cif /dcache_tb/cif/iload
add wave -noupdate -expand -group cif /dcache_tb/cif/dload
add wave -noupdate -expand -group cif /dcache_tb/cif/dstore
add wave -noupdate -expand -group cif /dcache_tb/cif/iaddr
add wave -noupdate -expand -group cif /dcache_tb/cif/daddr
add wave -noupdate -expand -group cif /dcache_tb/cif/ccwait
add wave -noupdate -expand -group cif /dcache_tb/cif/ccinv
add wave -noupdate -expand -group cif /dcache_tb/cif/ccwrite
add wave -noupdate -expand -group cif /dcache_tb/cif/cctrans
add wave -noupdate -expand -group cif /dcache_tb/cif/ccsnoopaddr
add wave -noupdate -expand -group DUT /dcache_tb/DUT/CLK
add wave -noupdate -expand -group DUT /dcache_tb/DUT/nRST
add wave -noupdate -expand -group DUT /dcache_tb/DUT/state
add wave -noupdate -expand -group DUT /dcache_tb/DUT/nstate
add wave -noupdate -expand -group DUT /dcache_tb/DUT/addr
add wave -noupdate -expand -group DUT /dcache_tb/DUT/dcache
add wave -noupdate -expand -group DUT /dcache_tb/DUT/LRUindicator
add wave -noupdate -expand -group DUT /dcache_tb/DUT/hit
add wave -noupdate -expand -group DUT /dcache_tb/DUT/flush_count_out
add wave -noupdate -expand -group DUT /dcache_tb/DUT/flush_count_enable
add wave -noupdate -expand -group DUT /dcache_tb/DUT/hit_count
add wave -noupdate -expand -group DUT /dcache_tb/DUT/next_hit_count
add wave -noupdate -expand -group DUT /dcache_tb/DUT/previous_addr
add wave -noupdate /dcache_tb/DUT/previous_dWEN
add wave -noupdate /dcache_tb/DUT/previous_dREN
add wave -noupdate /dcache_tb/PROG/tb_test_case
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95 ns} 0}
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
WaveRestoreZoom {40 ns} {140 ns}
