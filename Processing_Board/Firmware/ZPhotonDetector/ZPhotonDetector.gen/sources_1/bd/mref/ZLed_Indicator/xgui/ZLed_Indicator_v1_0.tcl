# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CNT_1S_MAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_1mS_MAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_1uS_MAX" -parent ${Page_0}


}

proc update_PARAM_VALUE.CNT_1S_MAX { PARAM_VALUE.CNT_1S_MAX } {
	# Procedure called to update CNT_1S_MAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_1S_MAX { PARAM_VALUE.CNT_1S_MAX } {
	# Procedure called to validate CNT_1S_MAX
	return true
}

proc update_PARAM_VALUE.CNT_1mS_MAX { PARAM_VALUE.CNT_1mS_MAX } {
	# Procedure called to update CNT_1mS_MAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_1mS_MAX { PARAM_VALUE.CNT_1mS_MAX } {
	# Procedure called to validate CNT_1mS_MAX
	return true
}

proc update_PARAM_VALUE.CNT_1uS_MAX { PARAM_VALUE.CNT_1uS_MAX } {
	# Procedure called to update CNT_1uS_MAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_1uS_MAX { PARAM_VALUE.CNT_1uS_MAX } {
	# Procedure called to validate CNT_1uS_MAX
	return true
}


proc update_MODELPARAM_VALUE.CNT_1uS_MAX { MODELPARAM_VALUE.CNT_1uS_MAX PARAM_VALUE.CNT_1uS_MAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_1uS_MAX}] ${MODELPARAM_VALUE.CNT_1uS_MAX}
}

proc update_MODELPARAM_VALUE.CNT_1mS_MAX { MODELPARAM_VALUE.CNT_1mS_MAX PARAM_VALUE.CNT_1mS_MAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_1mS_MAX}] ${MODELPARAM_VALUE.CNT_1mS_MAX}
}

proc update_MODELPARAM_VALUE.CNT_1S_MAX { MODELPARAM_VALUE.CNT_1S_MAX PARAM_VALUE.CNT_1S_MAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_1S_MAX}] ${MODELPARAM_VALUE.CNT_1S_MAX}
}

