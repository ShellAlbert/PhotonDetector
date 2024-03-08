# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CNT_DEADLINE_100mS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_100uS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_10mS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_10uS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_1S" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_1mS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CNT_DEADLINE_1uS" -parent ${Page_0}


}

proc update_PARAM_VALUE.CNT_DEADLINE_100mS { PARAM_VALUE.CNT_DEADLINE_100mS } {
	# Procedure called to update CNT_DEADLINE_100mS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_100mS { PARAM_VALUE.CNT_DEADLINE_100mS } {
	# Procedure called to validate CNT_DEADLINE_100mS
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_100uS { PARAM_VALUE.CNT_DEADLINE_100uS } {
	# Procedure called to update CNT_DEADLINE_100uS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_100uS { PARAM_VALUE.CNT_DEADLINE_100uS } {
	# Procedure called to validate CNT_DEADLINE_100uS
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_10mS { PARAM_VALUE.CNT_DEADLINE_10mS } {
	# Procedure called to update CNT_DEADLINE_10mS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_10mS { PARAM_VALUE.CNT_DEADLINE_10mS } {
	# Procedure called to validate CNT_DEADLINE_10mS
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_10uS { PARAM_VALUE.CNT_DEADLINE_10uS } {
	# Procedure called to update CNT_DEADLINE_10uS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_10uS { PARAM_VALUE.CNT_DEADLINE_10uS } {
	# Procedure called to validate CNT_DEADLINE_10uS
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_1S { PARAM_VALUE.CNT_DEADLINE_1S } {
	# Procedure called to update CNT_DEADLINE_1S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_1S { PARAM_VALUE.CNT_DEADLINE_1S } {
	# Procedure called to validate CNT_DEADLINE_1S
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_1mS { PARAM_VALUE.CNT_DEADLINE_1mS } {
	# Procedure called to update CNT_DEADLINE_1mS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_1mS { PARAM_VALUE.CNT_DEADLINE_1mS } {
	# Procedure called to validate CNT_DEADLINE_1mS
	return true
}

proc update_PARAM_VALUE.CNT_DEADLINE_1uS { PARAM_VALUE.CNT_DEADLINE_1uS } {
	# Procedure called to update CNT_DEADLINE_1uS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CNT_DEADLINE_1uS { PARAM_VALUE.CNT_DEADLINE_1uS } {
	# Procedure called to validate CNT_DEADLINE_1uS
	return true
}


proc update_MODELPARAM_VALUE.CNT_DEADLINE_1uS { MODELPARAM_VALUE.CNT_DEADLINE_1uS PARAM_VALUE.CNT_DEADLINE_1uS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_1uS}] ${MODELPARAM_VALUE.CNT_DEADLINE_1uS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_10uS { MODELPARAM_VALUE.CNT_DEADLINE_10uS PARAM_VALUE.CNT_DEADLINE_10uS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_10uS}] ${MODELPARAM_VALUE.CNT_DEADLINE_10uS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_100uS { MODELPARAM_VALUE.CNT_DEADLINE_100uS PARAM_VALUE.CNT_DEADLINE_100uS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_100uS}] ${MODELPARAM_VALUE.CNT_DEADLINE_100uS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_1mS { MODELPARAM_VALUE.CNT_DEADLINE_1mS PARAM_VALUE.CNT_DEADLINE_1mS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_1mS}] ${MODELPARAM_VALUE.CNT_DEADLINE_1mS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_10mS { MODELPARAM_VALUE.CNT_DEADLINE_10mS PARAM_VALUE.CNT_DEADLINE_10mS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_10mS}] ${MODELPARAM_VALUE.CNT_DEADLINE_10mS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_100mS { MODELPARAM_VALUE.CNT_DEADLINE_100mS PARAM_VALUE.CNT_DEADLINE_100mS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_100mS}] ${MODELPARAM_VALUE.CNT_DEADLINE_100mS}
}

proc update_MODELPARAM_VALUE.CNT_DEADLINE_1S { MODELPARAM_VALUE.CNT_DEADLINE_1S PARAM_VALUE.CNT_DEADLINE_1S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CNT_DEADLINE_1S}] ${MODELPARAM_VALUE.CNT_DEADLINE_1S}
}

