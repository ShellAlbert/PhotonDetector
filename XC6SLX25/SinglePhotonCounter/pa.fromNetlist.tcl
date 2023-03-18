
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name SinglePhotonCounter -dir "D:/Work/GitHub/PhotonDetector/XC6SLX25/SinglePhotonCounter/planAhead_run_3" -part xc6slx25ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Work/GitHub/PhotonDetector/XC6SLX25/SinglePhotonCounter/ZSDRAM_Module_Demo.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Work/GitHub/PhotonDetector/XC6SLX25/SinglePhotonCounter} {ipcore_dir} }
set_property target_constrs_file "ZSDRAM_Module_Demo.ucf" [current_fileset -constrset]
add_files [list {ZSDRAM_Module_Demo.ucf}] -fileset [get_property constrset [current_run]]
link_design
