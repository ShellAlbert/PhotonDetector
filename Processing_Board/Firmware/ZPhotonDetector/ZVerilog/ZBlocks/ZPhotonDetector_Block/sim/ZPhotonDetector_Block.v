//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Fri Nov 10 15:49:13 2023
//Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
//Command     : generate_target ZPhotonDetector_Block.bd
//Design      : ZPhotonDetector_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ZPhotonDetector_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ZPhotonDetector_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=8,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "ZPhotonDetector_Block.hwdef" *) 
module ZPhotonDetector_Block
   (iClk,
    iPulse,
    oIO_J1,
    oLED,
    oRS485_Dir1,
    oRS485_Dir2,
    oRS485_Txd1,
    oRS485_Txd2);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ICLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ICLK, CLK_DOMAIN ZPhotonDetector_Block_iClk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input iClk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.IPULSE INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.IPULSE, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input iPulse;
  output oIO_J1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OLED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OLED, LAYERED_METADATA undef" *) output [1:0]oLED;
  output oRS485_Dir1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORS485_DIR2 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORS485_DIR2, LAYERED_METADATA undef" *) output oRS485_Dir2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORS485_TXD1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORS485_TXD1, LAYERED_METADATA undef" *) output oRS485_Txd1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORS485_TXD2 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORS485_TXD2, LAYERED_METADATA undef" *) output oRS485_Txd2;

  wire ZEdge_Detect_0_oSig_Rising;
  wire [2:0]ZExtSig_Simulator_0_oFixedFreq_Sel;
  wire ZExtSig_Simulator_0_oTest_Mode;
  wire [1:0]ZLed_Indicator_0_oLED;
  wire ZMux2to1_0_oSig;
  wire ZPulse_Counter_0_oNewDataUpdate;
  wire [15:0]ZPulse_Counter_0_oNewPulseCounter;
  wire ZTest_Generator_0_oFixedFreq;
  wire ZTest_Generator_0_oFixedFreq_IO;
  wire ZUART_Data_Dump_0_oDir_Pin;
  wire ZUART_Data_Dump_0_oTxd_Pin;
  wire clk_wiz_0_clk_50M;
  wire iClk_1;
  wire iEn_1;
  wire iPulse_1;
  wire iRst_N_1;
  wire [7:0]iTimeInterval_1;

  assign iClk_1 = iClk;
  assign iPulse_1 = iPulse;
  assign oIO_J1 = ZTest_Generator_0_oFixedFreq_IO;
  assign oLED[1:0] = ZLed_Indicator_0_oLED;
  assign oRS485_Dir1 = ZUART_Data_Dump_0_oDir_Pin;
  assign oRS485_Dir2 = ZUART_Data_Dump_0_oDir_Pin;
  assign oRS485_Txd1 = ZUART_Data_Dump_0_oTxd_Pin;
  assign oRS485_Txd2 = ZUART_Data_Dump_0_oTxd_Pin;
  ZPhotonDetector_Block_ZEdge_Detect_0_0 ZEdge_Detect_0
       (.iClk(clk_wiz_0_clk_50M),
        .iEn(iEn_1),
        .iRst_N(iRst_N_1),
        .iSig_In(iPulse_1),
        .oSig_Rising(ZEdge_Detect_0_oSig_Rising));
  ZPhotonDetector_Block_ZExtSig_Simulator_0_0 ZExtSig_Simulator_0
       (.iClk(clk_wiz_0_clk_50M),
        .iRst_N(iRst_N_1),
        .oFixedFreq_Sel(ZExtSig_Simulator_0_oFixedFreq_Sel),
        .oTest_Mode(ZExtSig_Simulator_0_oTest_Mode),
        .oTime_Interval(iTimeInterval_1));
  ZPhotonDetector_Block_ZLed_Indicator_0_0 ZLed_Indicator_0
       (.iClk(clk_wiz_0_clk_50M),
        .iNewDataUpdate(ZPulse_Counter_0_oNewDataUpdate),
        .iRst_N(iRst_N_1),
        .oLED(ZLed_Indicator_0_oLED));
  ZPhotonDetector_Block_ZMux2to1_0_0 ZMux2to1_0
       (.iSel(ZExtSig_Simulator_0_oTest_Mode),
        .iSig1(ZEdge_Detect_0_oSig_Rising),
        .iSig2(ZTest_Generator_0_oFixedFreq),
        .oSig(ZMux2to1_0_oSig));
  ZPhotonDetector_Block_ZPower_EN_0_0 ZPower_EN_0
       (.iClk(clk_wiz_0_clk_50M),
        .iRst_N(iRst_N_1),
        .oEn(iEn_1));
  ZPhotonDetector_Block_ZPulse_Counter_0_0 ZPulse_Counter_0
       (.iClk(clk_wiz_0_clk_50M),
        .iEn(iEn_1),
        .iPulse(ZMux2to1_0_oSig),
        .iRst_N(iRst_N_1),
        .iTimeInterval(iTimeInterval_1),
        .oNewDataUpdate(ZPulse_Counter_0_oNewDataUpdate),
        .oNewPulseCounter(ZPulse_Counter_0_oNewPulseCounter));
  ZPhotonDetector_Block_ZTest_Generator_0_0 ZTest_Generator_0
       (.iClk(clk_wiz_0_clk_50M),
        .iEn(ZExtSig_Simulator_0_oTest_Mode),
        .iRst_N(iRst_N_1),
        .iSelect(ZExtSig_Simulator_0_oFixedFreq_Sel),
        .oFixedFreq(ZTest_Generator_0_oFixedFreq),
        .oFixedFreq_IO(ZTest_Generator_0_oFixedFreq_IO));
  ZPhotonDetector_Block_ZUART_Data_Dump_0_0 ZUART_Data_Dump_0
       (.iClk(clk_wiz_0_clk_50M),
        .iEn(iEn_1),
        .iNewData(ZPulse_Counter_0_oNewPulseCounter),
        .iNewDataUpdate(ZPulse_Counter_0_oNewDataUpdate),
        .iRst_N(iRst_N_1),
        .iTime_Interval(iTimeInterval_1),
        .oDir_Pin(ZUART_Data_Dump_0_oDir_Pin),
        .oTxd_Pin(ZUART_Data_Dump_0_oTxd_Pin));
  ZPhotonDetector_Block_clk_wiz_0_0 clk_wiz_0
       (.clk_50M(clk_wiz_0_clk_50M),
        .clk_in1(iClk_1),
        .locked(iRst_N_1));
endmodule
