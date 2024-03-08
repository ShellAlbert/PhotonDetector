//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Fri Nov 10 15:49:13 2023
//Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
//Command     : generate_target ZPhotonDetector_Block_wrapper.bd
//Design      : ZPhotonDetector_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ZPhotonDetector_Block_wrapper
   (iClk,
    iPulse,
    oIO_J1,
    oLED,
    oRS485_Dir1,
    oRS485_Dir2,
    oRS485_Txd1,
    oRS485_Txd2);
  input iClk;
  input iPulse;
  output oIO_J1;
  output [1:0]oLED;
  output oRS485_Dir1;
  output oRS485_Dir2;
  output oRS485_Txd1;
  output oRS485_Txd2;

  wire iClk;
  wire iPulse;
  wire oIO_J1;
  wire [1:0]oLED;
  wire oRS485_Dir1;
  wire oRS485_Dir2;
  wire oRS485_Txd1;
  wire oRS485_Txd2;

  ZPhotonDetector_Block ZPhotonDetector_Block_i
       (.iClk(iClk),
        .iPulse(iPulse),
        .oIO_J1(oIO_J1),
        .oLED(oLED),
        .oRS485_Dir1(oRS485_Dir1),
        .oRS485_Dir2(oRS485_Dir2),
        .oRS485_Txd1(oRS485_Txd1),
        .oRS485_Txd2(oRS485_Txd2));
endmodule
