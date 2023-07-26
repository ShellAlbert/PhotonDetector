
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name TFT43 -dir "D:/MyTemporary/PhotonDetector/TFT43/TFT43/planAhead_run_5" -part xc6slx25ftg256-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ZTFT43_Module.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ipcore_dir/ZsyPLL.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {ipcore_dir/M9K_ZiMo3232.ngc}]
add_files [list {ipcore_dir/ZSIN_ROM_M9K.ngc}]
add_files [list {ipcore_dir/ZPulseCounter_Random.ngc}]
add_files [list {ipcore_dir/ZROM_ExtSyncLost.ngc}]
add_files [list {ipcore_dir/ZROM_PowerOnSelfTest.ngc}]
set hdlfile [add_files [list {code/zuart/ZUART_Module_TX.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zuart/ZUART_Module_RX.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zuart/ZUART_Module_BPS_Generator.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/ZSIN_ROM_M9K.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/ZPulseCounter_Random.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/M9K_ZiMo3232.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zuart/ZUART_Module.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZTFT43_CfgData.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zsdram/ZSDRAM_Module_Function.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zsdram/ZSDRAM_Module_Ctrl.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZRTC_Counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpulse_counter/ZPulseCounter_Mux10to1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/RTC/ZRTC_Mux8to1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/ZROM_PowerOnSelfTest.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/ZROM_ExtSyncLost.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zuart/ZDataDump2UART.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZTFT43_Module.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zsdram/ZSDRAM_Module_Base.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpush_button/zpush_button.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpulse_counter/ZPulseCounter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zedge_detect/ZEdgeDetect.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zdraw/ZDrawCore.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZTFT43_Adapter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ztest_signal/ZTestSignal.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zsdram/ZSDRAM_RW_Arbit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zsdram/ZPage_PowerOnSelfTest.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpush_button/ZPushButton_Adapter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpulse_counter/ZPulseCounter_Adapter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zpage_no/ZPage_ExtSyncLost.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZDrawAdapter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/zdraw/ZShift_and_Draw.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {code/ZSinglePhotonCounter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ZSinglePhotonCounter $srcset
add_files [list {ZTFT43_Module.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/M9K_ZiMo3232.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZFIFO_PulseCounter.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZM9K_SIN.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZPulseCounter_Random.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZROM_ExtSyncLost.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZROM_PowerOnSelfTest.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZSIN_ROM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZSIN_ROM_M9K.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {code/zpulse_counter/ZPulseCounter_FIFO.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx25ftg256-2
