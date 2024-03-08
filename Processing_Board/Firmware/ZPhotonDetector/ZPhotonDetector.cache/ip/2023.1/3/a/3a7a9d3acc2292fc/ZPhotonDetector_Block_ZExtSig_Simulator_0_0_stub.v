// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Nov  9 14:17:18 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZExtSig_Simulator_0_0_stub.v
// Design      : ZPhotonDetector_Block_ZExtSig_Simulator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZExtSig_Simulator,Vivado 2023.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(iClk, iRst_N, oTest_Mode, oFixedFreq_Sel, 
  oTime_Interval)
/* synthesis syn_black_box black_box_pad_pin="iClk,iRst_N,oTest_Mode,oFixedFreq_Sel[2:0],oTime_Interval[7:0]" */;
  input iClk;
  input iRst_N;
  output oTest_Mode;
  output [2:0]oFixedFreq_Sel;
  output [7:0]oTime_Interval;
endmodule
