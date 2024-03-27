# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "T100mS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T1S" -parent ${Page_0}
  ipgui::add_param $IPINST -name "T5S" -parent ${Page_0}


}

proc update_PARAM_VALUE.T100mS { PARAM_VALUE.T100mS } {
	# Procedure called to update T100mS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T100mS { PARAM_VALUE.T100mS } {
	# Procedure called to validate T100mS
	return true
}

proc update_PARAM_VALUE.T1S { PARAM_VALUE.T1S } {
	# Procedure called to update T1S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T1S { PARAM_VALUE.T1S } {
	# Procedure called to validate T1S
	return true
}

proc update_PARAM_VALUE.T5S { PARAM_VALUE.T5S } {
	# Procedure called to update T5S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.T5S { PARAM_VALUE.T5S } {
	# Procedure called to validate T5S
	return true
}


proc update_MODELPARAM_VALUE.T5S { MODELPARAM_VALUE.T5S PARAM_VALUE.T5S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T5S}] ${MODELPARAM_VALUE.T5S}
}

proc update_MODELPARAM_VALUE.T1S { MODELPARAM_VALUE.T1S PARAM_VALUE.T1S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T1S}] ${MODELPARAM_VALUE.T1S}
}

proc update_MODELPARAM_VALUE.T100mS { MODELPARAM_VALUE.T100mS PARAM_VALUE.T100mS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T100mS}] ${MODELPARAM_VALUE.T100mS}
}

