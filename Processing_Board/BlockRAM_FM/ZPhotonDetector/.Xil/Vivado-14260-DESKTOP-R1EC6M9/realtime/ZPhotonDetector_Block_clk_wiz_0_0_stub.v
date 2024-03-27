// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ZPhotonDetector_Block_clk_wiz_0_0(clk_100M, clk_200M, clk_50M, locked, clk_in1);
  output clk_100M /* synthesis syn_isclock = 1 */;
  output clk_200M /* synthesis syn_isclock = 1 */;
  output clk_50M /* synthesis syn_isclock = 1 */;
  output locked;
  input clk_in1;
endmodule
