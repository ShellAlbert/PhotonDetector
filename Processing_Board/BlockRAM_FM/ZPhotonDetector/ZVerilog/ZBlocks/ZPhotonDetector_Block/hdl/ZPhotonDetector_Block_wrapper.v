//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Thu Mar 28 14:07:53 2024
//Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
//Command     : generate_target ZPhotonDetector_Block_wrapper.bd
//Design      : ZPhotonDetector_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ZPhotonDetector_Block_wrapper
   (KEY_PREV,
    RST_DIS,
    iClk,
    iPulse,
    iRS485_Rxd1,
    iRS485_Rxd2,
    iSync50Hz,
    oClkUsed,
    oLED1,
    oLED2,
    oLED_Fault,
    oLED_Pwr,
    oLED_Run,
    oLED_Sync,
    oRAM_ACLKB,
    oRAM_Addr,
    oRAM_BankAddr,
    oRAM_CAS,
    oRAM_CKE,
    oRAM_CS,
    oRAM_DQ,
    oRAM_DQM,
    oRAM_RAS,
    oRAM_WE,
    oRS485_Dir1,
    oRS485_Dir2,
    oRS485_Txd1,
    oRS485_Txd2);
  output KEY_PREV;
  output RST_DIS;
  input iClk;
  input iPulse;
  input iRS485_Rxd1;
  input iRS485_Rxd2;
  input iSync50Hz;
  output oClkUsed;
  output oLED1;
  output oLED2;
  output oLED_Fault;
  output oLED_Pwr;
  output oLED_Run;
  output oLED_Sync;
  output oRAM_ACLKB;
  output [11:0]oRAM_Addr;
  output [1:0]oRAM_BankAddr;
  output oRAM_CAS;
  output oRAM_CKE;
  output oRAM_CS;
  inout [31:0]oRAM_DQ;
  output [3:0]oRAM_DQM;
  output oRAM_RAS;
  output oRAM_WE;
  output oRS485_Dir1;
  output oRS485_Dir2;
  output oRS485_Txd1;
  output oRS485_Txd2;

  wire KEY_PREV;
  wire RST_DIS;
  wire iClk;
  wire iPulse;
  wire iRS485_Rxd1;
  wire iRS485_Rxd2;
  wire iSync50Hz;
  wire oClkUsed;
  wire oLED1;
  wire oLED2;
  wire oLED_Fault;
  wire oLED_Pwr;
  wire oLED_Run;
  wire oLED_Sync;
  wire oRAM_ACLKB;
  wire [11:0]oRAM_Addr;
  wire [1:0]oRAM_BankAddr;
  wire oRAM_CAS;
  wire oRAM_CKE;
  wire oRAM_CS;
  wire [31:0]oRAM_DQ;
  wire [3:0]oRAM_DQM;
  wire oRAM_RAS;
  wire oRAM_WE;
  wire oRS485_Dir1;
  wire oRS485_Dir2;
  wire oRS485_Txd1;
  wire oRS485_Txd2;

  ZPhotonDetector_Block ZPhotonDetector_Block_i
       (.KEY_PREV(KEY_PREV),
        .RST_DIS(RST_DIS),
        .iClk(iClk),
        .iPulse(iPulse),
        .iRS485_Rxd1(iRS485_Rxd1),
        .iRS485_Rxd2(iRS485_Rxd2),
        .iSync50Hz(iSync50Hz),
        .oClkUsed(oClkUsed),
        .oLED1(oLED1),
        .oLED2(oLED2),
        .oLED_Fault(oLED_Fault),
        .oLED_Pwr(oLED_Pwr),
        .oLED_Run(oLED_Run),
        .oLED_Sync(oLED_Sync),
        .oRAM_ACLKB(oRAM_ACLKB),
        .oRAM_Addr(oRAM_Addr),
        .oRAM_BankAddr(oRAM_BankAddr),
        .oRAM_CAS(oRAM_CAS),
        .oRAM_CKE(oRAM_CKE),
        .oRAM_CS(oRAM_CS),
        .oRAM_DQ(oRAM_DQ),
        .oRAM_DQM(oRAM_DQM),
        .oRAM_RAS(oRAM_RAS),
        .oRAM_WE(oRAM_WE),
        .oRS485_Dir1(oRS485_Dir1),
        .oRS485_Dir2(oRS485_Dir2),
        .oRS485_Txd1(oRS485_Txd1),
        .oRS485_Txd2(oRS485_Txd2));
endmodule
