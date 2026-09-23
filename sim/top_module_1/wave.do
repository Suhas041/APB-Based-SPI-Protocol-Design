onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_module_tb/dut/pclk
add wave -noupdate /top_module_tb/dut/preset_n
add wave -noupdate /top_module_tb/dut/pwrite
add wave -noupdate /top_module_tb/dut/psel
add wave -noupdate /top_module_tb/dut/penable
add wave -noupdate /top_module_tb/dut/miso
add wave -noupdate /top_module_tb/dut/paddr
add wave -noupdate /top_module_tb/dut/pwdata
add wave -noupdate /top_module_tb/dut/ss
add wave -noupdate /top_module_tb/dut/sclk
add wave -noupdate /top_module_tb/dut/spi_interrupt_req
add wave -noupdate /top_module_tb/dut/pready
add wave -noupdate /top_module_tb/dut/pslverr
add wave -noupdate /top_module_tb/dut/mosi
add wave -noupdate /top_module_tb/dut/pr_data
add wave -noupdate /top_module_tb/dut/spiswai
add wave -noupdate /top_module_tb/dut/cpol
add wave -noupdate /top_module_tb/dut/cpha
add wave -noupdate /top_module_tb/dut/rcv_data
add wave -noupdate /top_module_tb/dut/send_data
add wave -noupdate /top_module_tb/dut/lsbfe
add wave -noupdate /top_module_tb/dut/sppr
add wave -noupdate /top_module_tb/dut/spr
add wave -noupdate /top_module_tb/dut/spi_mode
add wave -noupdate /top_module_tb/dut/miso_recieve_sclk
add wave -noupdate /top_module_tb/dut/miso_recieve_sclk0
add wave -noupdate /top_module_tb/dut/mosi_send_sclk
add wave -noupdate /top_module_tb/dut/mosi_send_sclk0
add wave -noupdate /top_module_tb/dut/tip
add wave -noupdate /top_module_tb/dut/mstr
add wave -noupdate /top_module_tb/dut/baud_rate_divisor
add wave -noupdate /top_module_tb/dut/data_mosi
add wave -noupdate /top_module_tb/dut/data_miso
add wave -noupdate /top_module_tb/dut/miso_receive_sclk
add wave -noupdate /top_module_tb/dut/miso_receive_sclk0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {244 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 334
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {862 ns}
