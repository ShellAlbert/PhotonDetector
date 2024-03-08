// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Nov  9 14:50:31 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZTest_Generator_0_0/ZPhotonDetector_Block_ZTest_Generator_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZTest_Generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZTest_Generator_0_0,ZTest_Generator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZTest_Generator,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module ZPhotonDetector_Block_ZTest_Generator_0_0
   (iClk,
    iRst_N,
    iEn,
    iSelect,
    oFixedFreq,
    oFixedFreq_IO);
  input iClk;
  input iRst_N;
  input iEn;
  input [2:0]iSelect;
  output oFixedFreq;
  output oFixedFreq_IO;

  wire iClk;
  wire iEn;
  wire iRst_N;
  wire [2:0]iSelect;
  wire oFixedFreq;
  wire oFixedFreq_IO;

  ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator inst
       (.iClk(iClk),
        .iEn(iEn),
        .iRst_N(iRst_N),
        .iSelect(iSelect),
        .oFixedFreq(oFixedFreq),
        .oFixedFreq_IO(oFixedFreq_IO));
endmodule

(* ORIG_REF_NAME = "ZTest_Generator" *) 
module ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator
   (oFixedFreq,
    oFixedFreq_IO,
    iSelect,
    iClk,
    iEn,
    iRst_N);
  output oFixedFreq;
  output oFixedFreq_IO;
  input [2:0]iSelect;
  input iClk;
  input iEn;
  input iRst_N;

  wire [31:0]CNT;
  wire [31:1]CNT0;
  wire CNT0_carry__0_n_0;
  wire CNT0_carry__0_n_1;
  wire CNT0_carry__0_n_2;
  wire CNT0_carry__0_n_3;
  wire CNT0_carry__1_n_0;
  wire CNT0_carry__1_n_1;
  wire CNT0_carry__1_n_2;
  wire CNT0_carry__1_n_3;
  wire CNT0_carry__2_n_0;
  wire CNT0_carry__2_n_1;
  wire CNT0_carry__2_n_2;
  wire CNT0_carry__2_n_3;
  wire CNT0_carry__3_n_0;
  wire CNT0_carry__3_n_1;
  wire CNT0_carry__3_n_2;
  wire CNT0_carry__3_n_3;
  wire CNT0_carry__4_n_0;
  wire CNT0_carry__4_n_1;
  wire CNT0_carry__4_n_2;
  wire CNT0_carry__4_n_3;
  wire CNT0_carry__5_n_0;
  wire CNT0_carry__5_n_1;
  wire CNT0_carry__5_n_2;
  wire CNT0_carry__5_n_3;
  wire CNT0_carry__6_n_2;
  wire CNT0_carry__6_n_3;
  wire CNT0_carry_n_0;
  wire CNT0_carry_n_1;
  wire CNT0_carry_n_2;
  wire CNT0_carry_n_3;
  wire iClk;
  wire iEn;
  wire iRst_N;
  wire [2:0]iSelect;
  wire oFixedFreq;
  wire oFixedFreq_IO;
  wire oFixedFreq_IO_i_1_n_0;
  wire oFixedFreq_IO_i_2_n_0;
  wire oFixedFreq_carry__0_i_1_n_0;
  wire oFixedFreq_carry__0_i_2_n_0;
  wire oFixedFreq_carry__0_i_3_n_0;
  wire oFixedFreq_carry__0_i_4_n_0;
  wire oFixedFreq_carry__0_n_0;
  wire oFixedFreq_carry__0_n_1;
  wire oFixedFreq_carry__0_n_2;
  wire oFixedFreq_carry__0_n_3;
  wire oFixedFreq_carry__1_i_1_n_0;
  wire oFixedFreq_carry__1_i_2_n_0;
  wire oFixedFreq_carry__1_i_3_n_0;
  wire oFixedFreq_carry__1_n_2;
  wire oFixedFreq_carry__1_n_3;
  wire oFixedFreq_carry_i_1_n_0;
  wire oFixedFreq_carry_i_2_n_0;
  wire oFixedFreq_carry_i_3_n_0;
  wire oFixedFreq_carry_i_4_n_0;
  wire oFixedFreq_carry_n_0;
  wire oFixedFreq_carry_n_1;
  wire oFixedFreq_carry_n_2;
  wire oFixedFreq_carry_n_3;
  wire [31:0]p_0_in;
  wire [3:2]NLW_CNT0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_CNT0_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_oFixedFreq_carry_O_UNCONNECTED;
  wire [3:0]NLW_oFixedFreq_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_oFixedFreq_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_oFixedFreq_carry__1_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry
       (.CI(1'b0),
        .CO({CNT0_carry_n_0,CNT0_carry_n_1,CNT0_carry_n_2,CNT0_carry_n_3}),
        .CYINIT(CNT[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[4:1]),
        .S(CNT[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__0
       (.CI(CNT0_carry_n_0),
        .CO({CNT0_carry__0_n_0,CNT0_carry__0_n_1,CNT0_carry__0_n_2,CNT0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[8:5]),
        .S(CNT[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__1
       (.CI(CNT0_carry__0_n_0),
        .CO({CNT0_carry__1_n_0,CNT0_carry__1_n_1,CNT0_carry__1_n_2,CNT0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[12:9]),
        .S(CNT[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__2
       (.CI(CNT0_carry__1_n_0),
        .CO({CNT0_carry__2_n_0,CNT0_carry__2_n_1,CNT0_carry__2_n_2,CNT0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[16:13]),
        .S(CNT[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__3
       (.CI(CNT0_carry__2_n_0),
        .CO({CNT0_carry__3_n_0,CNT0_carry__3_n_1,CNT0_carry__3_n_2,CNT0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[20:17]),
        .S(CNT[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__4
       (.CI(CNT0_carry__3_n_0),
        .CO({CNT0_carry__4_n_0,CNT0_carry__4_n_1,CNT0_carry__4_n_2,CNT0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[24:21]),
        .S(CNT[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__5
       (.CI(CNT0_carry__4_n_0),
        .CO({CNT0_carry__5_n_0,CNT0_carry__5_n_1,CNT0_carry__5_n_2,CNT0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[28:25]),
        .S(CNT[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 CNT0_carry__6
       (.CI(CNT0_carry__5_n_0),
        .CO({NLW_CNT0_carry__6_CO_UNCONNECTED[3:2],CNT0_carry__6_n_2,CNT0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_CNT0_carry__6_O_UNCONNECTED[3],CNT0[31:29]}),
        .S({1'b0,CNT[31:29]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \CNT[0]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[10]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[11]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[11]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[12]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[12]),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[13]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[13]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[14]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[14]),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[15]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[15]),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[16]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[16]),
        .O(p_0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[17]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[17]),
        .O(p_0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[18]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[18]),
        .O(p_0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[19]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[19]),
        .O(p_0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[1]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[20]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[20]),
        .O(p_0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[21]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[21]),
        .O(p_0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[22]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[22]),
        .O(p_0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[23]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[23]),
        .O(p_0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[24]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[24]),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[25]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[25]),
        .O(p_0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[26]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[26]),
        .O(p_0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[27]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[27]),
        .O(p_0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[28]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[28]),
        .O(p_0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[29]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[29]),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[2]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[30]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[30]),
        .O(p_0_in[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[31]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[31]),
        .O(p_0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[3]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[4]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[4]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[5]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[6]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[7]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[8]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CNT[9]_i_1 
       (.I0(iEn),
        .I1(oFixedFreq),
        .I2(CNT0[9]),
        .O(p_0_in[9]));
  FDCE \CNT_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[0]),
        .Q(CNT[0]));
  FDCE \CNT_reg[10] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[10]),
        .Q(CNT[10]));
  FDCE \CNT_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[11]),
        .Q(CNT[11]));
  FDCE \CNT_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[12]),
        .Q(CNT[12]));
  FDCE \CNT_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[13]),
        .Q(CNT[13]));
  FDCE \CNT_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[14]),
        .Q(CNT[14]));
  FDCE \CNT_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[15]),
        .Q(CNT[15]));
  FDCE \CNT_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[16]),
        .Q(CNT[16]));
  FDCE \CNT_reg[17] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[17]),
        .Q(CNT[17]));
  FDCE \CNT_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[18]),
        .Q(CNT[18]));
  FDCE \CNT_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[19]),
        .Q(CNT[19]));
  FDCE \CNT_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[1]),
        .Q(CNT[1]));
  FDCE \CNT_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[20]),
        .Q(CNT[20]));
  FDCE \CNT_reg[21] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[21]),
        .Q(CNT[21]));
  FDCE \CNT_reg[22] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[22]),
        .Q(CNT[22]));
  FDCE \CNT_reg[23] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[23]),
        .Q(CNT[23]));
  FDCE \CNT_reg[24] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[24]),
        .Q(CNT[24]));
  FDCE \CNT_reg[25] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[25]),
        .Q(CNT[25]));
  FDCE \CNT_reg[26] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[26]),
        .Q(CNT[26]));
  FDCE \CNT_reg[27] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[27]),
        .Q(CNT[27]));
  FDCE \CNT_reg[28] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[28]),
        .Q(CNT[28]));
  FDCE \CNT_reg[29] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[29]),
        .Q(CNT[29]));
  FDCE \CNT_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[2]),
        .Q(CNT[2]));
  FDCE \CNT_reg[30] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[30]),
        .Q(CNT[30]));
  FDCE \CNT_reg[31] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[31]),
        .Q(CNT[31]));
  FDCE \CNT_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[3]),
        .Q(CNT[3]));
  FDCE \CNT_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[4]),
        .Q(CNT[4]));
  FDCE \CNT_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[5]),
        .Q(CNT[5]));
  FDCE \CNT_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[6]),
        .Q(CNT[6]));
  FDCE \CNT_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[7]),
        .Q(CNT[7]));
  FDCE \CNT_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[8]),
        .Q(CNT[8]));
  FDCE \CNT_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(p_0_in[9]),
        .Q(CNT[9]));
  LUT3 #(
    .INIT(8'h48)) 
    oFixedFreq_IO_i_1
       (.I0(oFixedFreq),
        .I1(iEn),
        .I2(oFixedFreq_IO),
        .O(oFixedFreq_IO_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oFixedFreq_IO_i_2
       (.I0(iRst_N),
        .O(oFixedFreq_IO_i_2_n_0));
  FDCE oFixedFreq_IO_reg
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_IO_i_2_n_0),
        .D(oFixedFreq_IO_i_1_n_0),
        .Q(oFixedFreq_IO));
  CARRY4 oFixedFreq_carry
       (.CI(1'b0),
        .CO({oFixedFreq_carry_n_0,oFixedFreq_carry_n_1,oFixedFreq_carry_n_2,oFixedFreq_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oFixedFreq_carry_O_UNCONNECTED[3:0]),
        .S({oFixedFreq_carry_i_1_n_0,oFixedFreq_carry_i_2_n_0,oFixedFreq_carry_i_3_n_0,oFixedFreq_carry_i_4_n_0}));
  CARRY4 oFixedFreq_carry__0
       (.CI(oFixedFreq_carry_n_0),
        .CO({oFixedFreq_carry__0_n_0,oFixedFreq_carry__0_n_1,oFixedFreq_carry__0_n_2,oFixedFreq_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oFixedFreq_carry__0_O_UNCONNECTED[3:0]),
        .S({oFixedFreq_carry__0_i_1_n_0,oFixedFreq_carry__0_i_2_n_0,oFixedFreq_carry__0_i_3_n_0,oFixedFreq_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry__0_i_1
       (.I0(CNT[23]),
        .I1(CNT[22]),
        .I2(CNT[21]),
        .O(oFixedFreq_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry__0_i_2
       (.I0(CNT[20]),
        .I1(CNT[19]),
        .I2(CNT[18]),
        .O(oFixedFreq_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry__0_i_3
       (.I0(CNT[17]),
        .I1(CNT[16]),
        .I2(CNT[15]),
        .O(oFixedFreq_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000000010000FE)) 
    oFixedFreq_carry__0_i_4
       (.I0(iSelect[2]),
        .I1(iSelect[0]),
        .I2(iSelect[1]),
        .I3(CNT[14]),
        .I4(CNT[13]),
        .I5(CNT[12]),
        .O(oFixedFreq_carry__0_i_4_n_0));
  CARRY4 oFixedFreq_carry__1
       (.CI(oFixedFreq_carry__0_n_0),
        .CO({NLW_oFixedFreq_carry__1_CO_UNCONNECTED[3],oFixedFreq,oFixedFreq_carry__1_n_2,oFixedFreq_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oFixedFreq_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,oFixedFreq_carry__1_i_1_n_0,oFixedFreq_carry__1_i_2_n_0,oFixedFreq_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    oFixedFreq_carry__1_i_1
       (.I0(CNT[30]),
        .I1(CNT[31]),
        .O(oFixedFreq_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry__1_i_2
       (.I0(CNT[29]),
        .I1(CNT[28]),
        .I2(CNT[27]),
        .O(oFixedFreq_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry__1_i_3
       (.I0(CNT[26]),
        .I1(CNT[25]),
        .I2(CNT[24]),
        .O(oFixedFreq_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    oFixedFreq_carry_i_1
       (.I0(CNT[11]),
        .I1(CNT[10]),
        .I2(CNT[9]),
        .O(oFixedFreq_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0001002000005544)) 
    oFixedFreq_carry_i_2
       (.I0(CNT[6]),
        .I1(iSelect[2]),
        .I2(iSelect[0]),
        .I3(iSelect[1]),
        .I4(CNT[8]),
        .I5(CNT[7]),
        .O(oFixedFreq_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h02A800A800000200)) 
    oFixedFreq_carry_i_3
       (.I0(CNT[3]),
        .I1(iSelect[2]),
        .I2(iSelect[1]),
        .I3(CNT[5]),
        .I4(iSelect[0]),
        .I5(CNT[4]),
        .O(oFixedFreq_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0001000022202221)) 
    oFixedFreq_carry_i_4
       (.I0(CNT[0]),
        .I1(CNT[2]),
        .I2(iSelect[1]),
        .I3(iSelect[2]),
        .I4(iSelect[0]),
        .I5(CNT[1]),
        .O(oFixedFreq_carry_i_4_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
