
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SAPDXC -dir "D:/Work/GitHub/SAPDXC/SAPDXC/planAhead_run_1" -part xc3s50antqg144-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "led.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Code/led.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top led $srcset
add_files [list {led.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s50antqg144-5
