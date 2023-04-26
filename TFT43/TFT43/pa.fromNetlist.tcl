
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TFT43 -dir "D:/Work/GitHub/PhotonDetector/TFT43/TFT43/planAhead_run_4" -part xc6slx25ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Work/GitHub/PhotonDetector/TFT43/TFT43/ZSinglePhotonCounter.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Work/GitHub/PhotonDetector/TFT43/TFT43} {ipcore_dir} {code/zpulse_counter} }
add_files [list {ipcore_dir/M9K_ZiMo3232.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZFIFO_PulseCounter.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZM9K_SIN.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZPulseCounter_Random.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZSIN_ROM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ZSIN_ROM_M9K.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {code/zpulse_counter/ZPulseCounter_FIFO.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "ZTFT43_Module.ucf" [current_fileset -constrset]
add_files [list {ZTFT43_Module.ucf}] -fileset [get_property constrset [current_run]]
link_design
