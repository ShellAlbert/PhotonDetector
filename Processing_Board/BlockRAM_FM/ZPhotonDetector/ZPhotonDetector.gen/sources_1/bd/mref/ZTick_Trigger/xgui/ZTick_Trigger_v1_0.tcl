# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CNT_1S" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_333uS" -parent ${Page_0}


}

proc update_PARAM_VALUE.CNT_1S { PARAM_VALUE.CNT_1S } {
	# Procedure called to update CNT_1S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_1S { PARAM_VALUE.CNT_1S } {
	# Procedure called to validate CNT_1S
	return true
}

proc update_PARAM_VALUE.CNT_333uS { PARAM_VALUE.CNT_333uS } {
	# Procedure called to update CNT_333uS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_333uS { PARAM_VALUE.CNT_333uS } {
	# Procedure called to validate CNT_333uS
	return true
}


proc update_MODELPARAM_VALUE.CNT_333uS { MODELPARAM_VALUE.CNT_333uS PARAM_VALUE.CNT_333uS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_333uS}] ${MODELPARAM_VALUE.CNT_333uS}
}

proc update_MODELPARAM_VALUE.CNT_1S { MODELPARAM_VALUE.CNT_1S PARAM_VALUE.CNT_1S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_1S}] ${MODELPARAM_VALUE.CNT_1S}
}

