// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ZUART_Data_Dump,Vivado 2023.1" *)
module ZPhotonDetector_Block_ZUART_Data_Dump_0_0(iClk, iRst_N, iEn, iNewDataUpdate, iNewData, 
  iTime_Interval, oTxd_Pin, oDir_Pin, oDone);
  input iClk /* synthesis syn_isclock = 1 */;
  input iRst_N;
  input iEn;
  input iNewDataUpdate;
  input [15:0]iNewData;
  input [7:0]iTime_Interval;
  output oTxd_Pin;
  output oDir_Pin;
  output oDone;
endmodule
