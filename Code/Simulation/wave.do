onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ZsySPI_TB/clk
add wave -noupdate /ZsySPI_TB/rst_n
add wave -noupdate /ZsySPI_TB/cs_n
add wave -noupdate /ZsySPI_TB/sclk
add wave -noupdate /ZsySPI_TB/dc
add wave -noupdate /ZsySPI_TB/sdin
add wave -noupdate /ZsySPI_TB/oled_rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2930611849773 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 204
configure wave -valuecolwidth 229
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2930611849721 ps} {2930611850015 ps}
