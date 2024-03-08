// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Oct 26 13:50:48 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZTest_Generator_0_0_stub.v
// Design      : ZPhotonDetector_Block_ZTest_Generator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZTest_Generator,Vivado 2023.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(iClk, iRst_N, iSelect, oFixedFreq, oFixedFreq_IO)
/* synthesis syn_black_box black_box_pad_pin="iRst_N,iSelect[2:0],oFixedFreq,oFixedFreq_IO" */
/* synthesis syn_force_seq_prim="iClk" */;
  input iClk /* synthesis syn_isclock = 1 */;
  input iRst_N;
  input [2:0]iSelect;
  output oFixedFreq;
  output oFixedFreq_IO;
endmodule
