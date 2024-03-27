// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZLed_Indicator,Vivado 2023.1" *)
module ZPhotonDetector_Block_ZLed_Indicator_0_0(iClk, iRst_N, iNewDataUpdate, oLED);
  input iClk /* synthesis syn_isclock = 1 */;
  input iRst_N;
  input iNewDataUpdate;
  output [1:0]oLED;
endmodule
