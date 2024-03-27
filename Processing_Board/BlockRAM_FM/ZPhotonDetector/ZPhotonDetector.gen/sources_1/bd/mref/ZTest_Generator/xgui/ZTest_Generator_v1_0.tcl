# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CNT_1MHz" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_50Hz" -parent ${Page_0}


}

proc update_PARAM_VALUE.CNT_1MHz { PARAM_VALUE.CNT_1MHz } {
	# Procedure called to update CNT_1MHz when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_1MHz { PARAM_VALUE.CNT_1MHz } {
	# Procedure called to validate CNT_1MHz
	return true
}

proc update_PARAM_VALUE.CNT_50Hz { PARAM_VALUE.CNT_50Hz } {
	# Procedure called to update CNT_50Hz when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_50Hz { PARAM_VALUE.CNT_50Hz } {
	# Procedure called to validate CNT_50Hz
	return true
}


proc update_MODELPARAM_VALUE.CNT_50Hz { MODELPARAM_VALUE.CNT_50Hz PARAM_VALUE.CNT_50Hz } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_50Hz}] ${MODELPARAM_VALUE.CNT_50Hz}
}

proc update_MODELPARAM_VALUE.CNT_1MHz { MODELPARAM_VALUE.CNT_1MHz PARAM_VALUE.CNT_1MHz } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_1MHz}] ${MODELPARAM_VALUE.CNT_1MHz}
}

