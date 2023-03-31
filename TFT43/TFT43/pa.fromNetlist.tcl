
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TFT43 -dir "D:/Work/GitHub/PhotonDetector/TFT43/TFT43/planAhead_run_1" -part xc6slx25ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Work/GitHub/PhotonDetector/TFT43/TFT43/ZTFT43_Module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Work/GitHub/PhotonDetector/TFT43/TFT43} }
set_property target_constrs_file "ZTFT43_Module.ucf" [current_fileset -constrset]
add_files [list {ZTFT43_Module.ucf}] -fileset [get_property constrset [current_run]]
link_design
