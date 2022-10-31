
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name SAPDXC -dir "D:/Work/GitHub/SAPDXC/SAPDXC/planAhead_run_3" -part xc3s50antqg144-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Work/GitHub/SAPDXC/SAPDXC/SAPDXC.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Work/GitHub/SAPDXC/SAPDXC} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "led.ucf" [current_fileset -constrset]
add_files [list {led.ucf}] -fileset [get_property constrset [current_run]]
link_design
