// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZExtSig_Simulator,Vivado 2023.1" *)
module ZPhotonDetector_Block_ZExtSig_Simulator_0_0(iClk, iRst_N, oTest_Mode, oFixedFreq_Sel, 
  oTime_Interval);
  input iClk;
  input iRst_N;
  output oTest_Mode;
  output [2:0]oFixedFreq_Sel;
  output [7:0]oTime_Interval;
endmodule
