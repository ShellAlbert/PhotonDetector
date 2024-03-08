// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Tue Oct 24 10:55:56 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZPower_EN_0_0/ZPhotonDetector_Block_ZPower_EN_0_0_stub.v
// Design      : ZPhotonDetector_Block_ZPower_EN_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZPower_EN,Vivado 2023.1" *)
module ZPhotonDetector_Block_ZPower_EN_0_0(iClk, iRst_N, oEn)
/* synthesis syn_black_box black_box_pad_pin="iClk,iRst_N,oEn" */;
  input iClk;
  input iRst_N;
  output oEn;
endmodule
