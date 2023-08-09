gui_open_window Wave
gui_sg_create ZsyPLL_group
gui_list_add_group -id Wave.1 {ZsyPLL_group}
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.test_phase}
gui_set_radix -radix {ascii} -signals {ZsyPLL_tb.test_phase}
gui_sg_addsignal -group ZsyPLL_group {{Input_clocks}} -divider
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.CLK_IN1}
gui_sg_addsignal -group ZsyPLL_group {{Output_clocks}} -divider
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.dut.clk}
gui_list_expand -id Wave.1 ZsyPLL_tb.dut.clk
gui_sg_addsignal -group ZsyPLL_group {{Status_control}} -divider
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.LOCKED}
gui_sg_addsignal -group ZsyPLL_group {{Counters}} -divider
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.COUNT}
gui_sg_addsignal -group ZsyPLL_group {ZsyPLL_tb.dut.counter}
gui_list_expand -id Wave.1 ZsyPLL_tb.dut.counter
gui_zoom -window Wave.1 -full
