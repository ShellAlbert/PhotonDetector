set_property SRC_FILE_INFO {cfile:f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_clk_wiz_0_0/ZPhotonDetector_Block_clk_wiz_0_0.xdc rfile:../ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_clk_wiz_0_0/ZPhotonDetector_Block_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:ZPhotonDetector_Block_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:F:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZConstraint_IO.xdc rfile:../ZVerilog/ZConstraint_IO.xdc id:2} [current_design]
current_instance ZPhotonDetector_Block_i/clk_wiz_0/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:120 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list u_ila_0_clk_50M]]
set_property src_info {type:XDC file:2 line:121 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_50M]
set_property src_info {type:XDC file:2 line:130 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_clkfbout_buf_ZPhotonDetector_Block_clk_wiz_0_0]
