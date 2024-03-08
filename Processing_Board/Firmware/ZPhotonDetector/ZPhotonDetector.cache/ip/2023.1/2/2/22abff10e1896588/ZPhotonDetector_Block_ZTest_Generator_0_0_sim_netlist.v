// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Oct 25 15:04:18 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZTest_Generator_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZTest_Generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZTest_Generator_0_0,ZTest_Generator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZTest_Generator,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (iClk,
    iRst_N,
    iSelect,
    oFixedFreq);
  input iClk;
  input iRst_N;
  input [2:0]iSelect;
  output oFixedFreq;

  wire iClk;
  wire iRst_N;
  wire [2:0]iSelect;
  wire oFixedFreq;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator inst
       (.iClk(iClk),
        .iRst_N(iRst_N),
        .iSelect(iSelect),
        .oFixedFreq(oFixedFreq));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator
   (oFixedFreq,
    iSelect,
    iRst_N,
    iClk);
  output oFixedFreq;
  input [2:0]iSelect;
  input iRst_N;
  input iClk;

  wire CNT1_carry__0_i_1_n_0;
  wire CNT1_carry__0_i_2_n_0;
  wire CNT1_carry__0_i_3_n_0;
  wire CNT1_carry__0_i_4_n_0;
  wire CNT1_carry__0_n_0;
  wire CNT1_carry__0_n_1;
  wire CNT1_carry__0_n_2;
  wire CNT1_carry__0_n_3;
  wire CNT1_carry__1_i_1_n_0;
  wire CNT1_carry__1_i_2_n_0;
  wire CNT1_carry__1_i_3_n_0;
  wire CNT1_carry__1_n_2;
  wire CNT1_carry__1_n_3;
  wire CNT1_carry_i_1_n_0;
  wire CNT1_carry_i_2_n_0;
  wire CNT1_carry_i_3_n_0;
  wire CNT1_carry_i_4_n_0;
  wire CNT1_carry_n_0;
  wire CNT1_carry_n_1;
  wire CNT1_carry_n_2;
  wire CNT1_carry_n_3;
  wire \CNT[0]_i_2_n_0 ;
  wire \CNT[0]_i_3_n_0 ;
  wire \CNT[0]_i_4_n_0 ;
  wire \CNT[0]_i_5_n_0 ;
  wire \CNT[0]_i_6_n_0 ;
  wire \CNT[12]_i_2_n_0 ;
  wire \CNT[12]_i_3_n_0 ;
  wire \CNT[12]_i_4_n_0 ;
  wire \CNT[12]_i_5_n_0 ;
  wire \CNT[16]_i_2_n_0 ;
  wire \CNT[16]_i_3_n_0 ;
  wire \CNT[16]_i_4_n_0 ;
  wire \CNT[16]_i_5_n_0 ;
  wire \CNT[20]_i_2_n_0 ;
  wire \CNT[20]_i_3_n_0 ;
  wire \CNT[20]_i_4_n_0 ;
  wire \CNT[20]_i_5_n_0 ;
  wire \CNT[24]_i_2_n_0 ;
  wire \CNT[24]_i_3_n_0 ;
  wire \CNT[24]_i_4_n_0 ;
  wire \CNT[24]_i_5_n_0 ;
  wire \CNT[28]_i_2_n_0 ;
  wire \CNT[28]_i_3_n_0 ;
  wire \CNT[28]_i_4_n_0 ;
  wire \CNT[28]_i_5_n_0 ;
  wire \CNT[4]_i_2_n_0 ;
  wire \CNT[4]_i_3_n_0 ;
  wire \CNT[4]_i_4_n_0 ;
  wire \CNT[4]_i_5_n_0 ;
  wire \CNT[8]_i_2_n_0 ;
  wire \CNT[8]_i_3_n_0 ;
  wire \CNT[8]_i_4_n_0 ;
  wire \CNT[8]_i_5_n_0 ;
  wire [31:0]CNT_reg;
  wire \CNT_reg[0]_i_1_n_0 ;
  wire \CNT_reg[0]_i_1_n_1 ;
  wire \CNT_reg[0]_i_1_n_2 ;
  wire \CNT_reg[0]_i_1_n_3 ;
  wire \CNT_reg[0]_i_1_n_4 ;
  wire \CNT_reg[0]_i_1_n_5 ;
  wire \CNT_reg[0]_i_1_n_6 ;
  wire \CNT_reg[0]_i_1_n_7 ;
  wire \CNT_reg[12]_i_1_n_0 ;
  wire \CNT_reg[12]_i_1_n_1 ;
  wire \CNT_reg[12]_i_1_n_2 ;
  wire \CNT_reg[12]_i_1_n_3 ;
  wire \CNT_reg[12]_i_1_n_4 ;
  wire \CNT_reg[12]_i_1_n_5 ;
  wire \CNT_reg[12]_i_1_n_6 ;
  wire \CNT_reg[12]_i_1_n_7 ;
  wire \CNT_reg[16]_i_1_n_0 ;
  wire \CNT_reg[16]_i_1_n_1 ;
  wire \CNT_reg[16]_i_1_n_2 ;
  wire \CNT_reg[16]_i_1_n_3 ;
  wire \CNT_reg[16]_i_1_n_4 ;
  wire \CNT_reg[16]_i_1_n_5 ;
  wire \CNT_reg[16]_i_1_n_6 ;
  wire \CNT_reg[16]_i_1_n_7 ;
  wire \CNT_reg[20]_i_1_n_0 ;
  wire \CNT_reg[20]_i_1_n_1 ;
  wire \CNT_reg[20]_i_1_n_2 ;
  wire \CNT_reg[20]_i_1_n_3 ;
  wire \CNT_reg[20]_i_1_n_4 ;
  wire \CNT_reg[20]_i_1_n_5 ;
  wire \CNT_reg[20]_i_1_n_6 ;
  wire \CNT_reg[20]_i_1_n_7 ;
  wire \CNT_reg[24]_i_1_n_0 ;
  wire \CNT_reg[24]_i_1_n_1 ;
  wire \CNT_reg[24]_i_1_n_2 ;
  wire \CNT_reg[24]_i_1_n_3 ;
  wire \CNT_reg[24]_i_1_n_4 ;
  wire \CNT_reg[24]_i_1_n_5 ;
  wire \CNT_reg[24]_i_1_n_6 ;
  wire \CNT_reg[24]_i_1_n_7 ;
  wire \CNT_reg[28]_i_1_n_1 ;
  wire \CNT_reg[28]_i_1_n_2 ;
  wire \CNT_reg[28]_i_1_n_3 ;
  wire \CNT_reg[28]_i_1_n_4 ;
  wire \CNT_reg[28]_i_1_n_5 ;
  wire \CNT_reg[28]_i_1_n_6 ;
  wire \CNT_reg[28]_i_1_n_7 ;
  wire \CNT_reg[4]_i_1_n_0 ;
  wire \CNT_reg[4]_i_1_n_1 ;
  wire \CNT_reg[4]_i_1_n_2 ;
  wire \CNT_reg[4]_i_1_n_3 ;
  wire \CNT_reg[4]_i_1_n_4 ;
  wire \CNT_reg[4]_i_1_n_5 ;
  wire \CNT_reg[4]_i_1_n_6 ;
  wire \CNT_reg[4]_i_1_n_7 ;
  wire \CNT_reg[8]_i_1_n_0 ;
  wire \CNT_reg[8]_i_1_n_1 ;
  wire \CNT_reg[8]_i_1_n_2 ;
  wire \CNT_reg[8]_i_1_n_3 ;
  wire \CNT_reg[8]_i_1_n_4 ;
  wire \CNT_reg[8]_i_1_n_5 ;
  wire \CNT_reg[8]_i_1_n_6 ;
  wire \CNT_reg[8]_i_1_n_7 ;
  wire iClk;
  wire iRst_N;
  wire [2:0]iSelect;
  wire load;
  wire oFixedFreq;
  wire oFixedFreq_i_1_n_0;
  wire oFixedFreq_i_2_n_0;
  wire [3:0]NLW_CNT1_carry_O_UNCONNECTED;
  wire [3:0]NLW_CNT1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_CNT1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_CNT1_carry__1_O_UNCONNECTED;
  wire [3:3]\NLW_CNT_reg[28]_i_1_CO_UNCONNECTED ;

  CARRY4 CNT1_carry
       (.CI(1'b0),
        .CO({CNT1_carry_n_0,CNT1_carry_n_1,CNT1_carry_n_2,CNT1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_CNT1_carry_O_UNCONNECTED[3:0]),
        .S({CNT1_carry_i_1_n_0,CNT1_carry_i_2_n_0,CNT1_carry_i_3_n_0,CNT1_carry_i_4_n_0}));
  CARRY4 CNT1_carry__0
       (.CI(CNT1_carry_n_0),
        .CO({CNT1_carry__0_n_0,CNT1_carry__0_n_1,CNT1_carry__0_n_2,CNT1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_CNT1_carry__0_O_UNCONNECTED[3:0]),
        .S({CNT1_carry__0_i_1_n_0,CNT1_carry__0_i_2_n_0,CNT1_carry__0_i_3_n_0,CNT1_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__0_i_1
       (.I0(CNT_reg[23]),
        .I1(CNT_reg[22]),
        .I2(CNT_reg[21]),
        .O(CNT1_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__0_i_2
       (.I0(CNT_reg[20]),
        .I1(CNT_reg[19]),
        .I2(CNT_reg[18]),
        .O(CNT1_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__0_i_3
       (.I0(CNT_reg[17]),
        .I1(CNT_reg[16]),
        .I2(CNT_reg[15]),
        .O(CNT1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000000010000FE)) 
    CNT1_carry__0_i_4
       (.I0(iSelect[2]),
        .I1(iSelect[0]),
        .I2(iSelect[1]),
        .I3(CNT_reg[14]),
        .I4(CNT_reg[13]),
        .I5(CNT_reg[12]),
        .O(CNT1_carry__0_i_4_n_0));
  CARRY4 CNT1_carry__1
       (.CI(CNT1_carry__0_n_0),
        .CO({NLW_CNT1_carry__1_CO_UNCONNECTED[3],load,CNT1_carry__1_n_2,CNT1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_CNT1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,CNT1_carry__1_i_1_n_0,CNT1_carry__1_i_2_n_0,CNT1_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    CNT1_carry__1_i_1
       (.I0(CNT_reg[30]),
        .I1(CNT_reg[31]),
        .O(CNT1_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__1_i_2
       (.I0(CNT_reg[29]),
        .I1(CNT_reg[28]),
        .I2(CNT_reg[27]),
        .O(CNT1_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__1_i_3
       (.I0(CNT_reg[26]),
        .I1(CNT_reg[25]),
        .I2(CNT_reg[24]),
        .O(CNT1_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry_i_1
       (.I0(CNT_reg[11]),
        .I1(CNT_reg[10]),
        .I2(CNT_reg[9]),
        .O(CNT1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0001002000005544)) 
    CNT1_carry_i_2
       (.I0(CNT_reg[6]),
        .I1(iSelect[2]),
        .I2(iSelect[0]),
        .I3(iSelect[1]),
        .I4(CNT_reg[8]),
        .I5(CNT_reg[7]),
        .O(CNT1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h02A800A800000200)) 
    CNT1_carry_i_3
       (.I0(CNT_reg[3]),
        .I1(iSelect[2]),
        .I2(iSelect[1]),
        .I3(CNT_reg[5]),
        .I4(iSelect[0]),
        .I5(CNT_reg[4]),
        .O(CNT1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0001000022202221)) 
    CNT1_carry_i_4
       (.I0(CNT_reg[0]),
        .I1(CNT_reg[2]),
        .I2(iSelect[1]),
        .I3(iSelect[2]),
        .I4(iSelect[0]),
        .I5(CNT_reg[1]),
        .O(CNT1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[0]_i_2 
       (.I0(CNT_reg[0]),
        .I1(load),
        .O(\CNT[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[0]_i_3 
       (.I0(CNT_reg[3]),
        .I1(load),
        .O(\CNT[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[0]_i_4 
       (.I0(CNT_reg[2]),
        .I1(load),
        .O(\CNT[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[0]_i_5 
       (.I0(CNT_reg[1]),
        .I1(load),
        .O(\CNT[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \CNT[0]_i_6 
       (.I0(CNT_reg[0]),
        .I1(load),
        .O(\CNT[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[12]_i_2 
       (.I0(CNT_reg[15]),
        .I1(load),
        .O(\CNT[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[12]_i_3 
       (.I0(CNT_reg[14]),
        .I1(load),
        .O(\CNT[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[12]_i_4 
       (.I0(CNT_reg[13]),
        .I1(load),
        .O(\CNT[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[12]_i_5 
       (.I0(CNT_reg[12]),
        .I1(load),
        .O(\CNT[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[16]_i_2 
       (.I0(CNT_reg[19]),
        .I1(load),
        .O(\CNT[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[16]_i_3 
       (.I0(CNT_reg[18]),
        .I1(load),
        .O(\CNT[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[16]_i_4 
       (.I0(CNT_reg[17]),
        .I1(load),
        .O(\CNT[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[16]_i_5 
       (.I0(CNT_reg[16]),
        .I1(load),
        .O(\CNT[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[20]_i_2 
       (.I0(CNT_reg[23]),
        .I1(load),
        .O(\CNT[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[20]_i_3 
       (.I0(CNT_reg[22]),
        .I1(load),
        .O(\CNT[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[20]_i_4 
       (.I0(CNT_reg[21]),
        .I1(load),
        .O(\CNT[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[20]_i_5 
       (.I0(CNT_reg[20]),
        .I1(load),
        .O(\CNT[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[24]_i_2 
       (.I0(CNT_reg[27]),
        .I1(load),
        .O(\CNT[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[24]_i_3 
       (.I0(CNT_reg[26]),
        .I1(load),
        .O(\CNT[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[24]_i_4 
       (.I0(CNT_reg[25]),
        .I1(load),
        .O(\CNT[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[24]_i_5 
       (.I0(CNT_reg[24]),
        .I1(load),
        .O(\CNT[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[28]_i_2 
       (.I0(CNT_reg[31]),
        .I1(load),
        .O(\CNT[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[28]_i_3 
       (.I0(CNT_reg[30]),
        .I1(load),
        .O(\CNT[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[28]_i_4 
       (.I0(CNT_reg[29]),
        .I1(load),
        .O(\CNT[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[28]_i_5 
       (.I0(CNT_reg[28]),
        .I1(load),
        .O(\CNT[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[4]_i_2 
       (.I0(CNT_reg[7]),
        .I1(load),
        .O(\CNT[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[4]_i_3 
       (.I0(CNT_reg[6]),
        .I1(load),
        .O(\CNT[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[4]_i_4 
       (.I0(CNT_reg[5]),
        .I1(load),
        .O(\CNT[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[4]_i_5 
       (.I0(CNT_reg[4]),
        .I1(load),
        .O(\CNT[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[8]_i_2 
       (.I0(CNT_reg[11]),
        .I1(load),
        .O(\CNT[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[8]_i_3 
       (.I0(CNT_reg[10]),
        .I1(load),
        .O(\CNT[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[8]_i_4 
       (.I0(CNT_reg[9]),
        .I1(load),
        .O(\CNT[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \CNT[8]_i_5 
       (.I0(CNT_reg[8]),
        .I1(load),
        .O(\CNT[8]_i_5_n_0 ));
  FDCE \CNT_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[0]_i_1_n_7 ),
        .Q(CNT_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\CNT_reg[0]_i_1_n_0 ,\CNT_reg[0]_i_1_n_1 ,\CNT_reg[0]_i_1_n_2 ,\CNT_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\CNT[0]_i_2_n_0 }),
        .O({\CNT_reg[0]_i_1_n_4 ,\CNT_reg[0]_i_1_n_5 ,\CNT_reg[0]_i_1_n_6 ,\CNT_reg[0]_i_1_n_7 }),
        .S({\CNT[0]_i_3_n_0 ,\CNT[0]_i_4_n_0 ,\CNT[0]_i_5_n_0 ,\CNT[0]_i_6_n_0 }));
  FDCE \CNT_reg[10] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[8]_i_1_n_5 ),
        .Q(CNT_reg[10]));
  FDCE \CNT_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[8]_i_1_n_4 ),
        .Q(CNT_reg[11]));
  FDCE \CNT_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[12]_i_1_n_7 ),
        .Q(CNT_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[12]_i_1 
       (.CI(\CNT_reg[8]_i_1_n_0 ),
        .CO({\CNT_reg[12]_i_1_n_0 ,\CNT_reg[12]_i_1_n_1 ,\CNT_reg[12]_i_1_n_2 ,\CNT_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[12]_i_1_n_4 ,\CNT_reg[12]_i_1_n_5 ,\CNT_reg[12]_i_1_n_6 ,\CNT_reg[12]_i_1_n_7 }),
        .S({\CNT[12]_i_2_n_0 ,\CNT[12]_i_3_n_0 ,\CNT[12]_i_4_n_0 ,\CNT[12]_i_5_n_0 }));
  FDCE \CNT_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[12]_i_1_n_6 ),
        .Q(CNT_reg[13]));
  FDCE \CNT_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[12]_i_1_n_5 ),
        .Q(CNT_reg[14]));
  FDCE \CNT_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[12]_i_1_n_4 ),
        .Q(CNT_reg[15]));
  FDCE \CNT_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[16]_i_1_n_7 ),
        .Q(CNT_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[16]_i_1 
       (.CI(\CNT_reg[12]_i_1_n_0 ),
        .CO({\CNT_reg[16]_i_1_n_0 ,\CNT_reg[16]_i_1_n_1 ,\CNT_reg[16]_i_1_n_2 ,\CNT_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[16]_i_1_n_4 ,\CNT_reg[16]_i_1_n_5 ,\CNT_reg[16]_i_1_n_6 ,\CNT_reg[16]_i_1_n_7 }),
        .S({\CNT[16]_i_2_n_0 ,\CNT[16]_i_3_n_0 ,\CNT[16]_i_4_n_0 ,\CNT[16]_i_5_n_0 }));
  FDCE \CNT_reg[17] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[16]_i_1_n_6 ),
        .Q(CNT_reg[17]));
  FDCE \CNT_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[16]_i_1_n_5 ),
        .Q(CNT_reg[18]));
  FDCE \CNT_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[16]_i_1_n_4 ),
        .Q(CNT_reg[19]));
  FDCE \CNT_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[0]_i_1_n_6 ),
        .Q(CNT_reg[1]));
  FDCE \CNT_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[20]_i_1_n_7 ),
        .Q(CNT_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[20]_i_1 
       (.CI(\CNT_reg[16]_i_1_n_0 ),
        .CO({\CNT_reg[20]_i_1_n_0 ,\CNT_reg[20]_i_1_n_1 ,\CNT_reg[20]_i_1_n_2 ,\CNT_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[20]_i_1_n_4 ,\CNT_reg[20]_i_1_n_5 ,\CNT_reg[20]_i_1_n_6 ,\CNT_reg[20]_i_1_n_7 }),
        .S({\CNT[20]_i_2_n_0 ,\CNT[20]_i_3_n_0 ,\CNT[20]_i_4_n_0 ,\CNT[20]_i_5_n_0 }));
  FDCE \CNT_reg[21] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[20]_i_1_n_6 ),
        .Q(CNT_reg[21]));
  FDCE \CNT_reg[22] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[20]_i_1_n_5 ),
        .Q(CNT_reg[22]));
  FDCE \CNT_reg[23] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[20]_i_1_n_4 ),
        .Q(CNT_reg[23]));
  FDCE \CNT_reg[24] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[24]_i_1_n_7 ),
        .Q(CNT_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[24]_i_1 
       (.CI(\CNT_reg[20]_i_1_n_0 ),
        .CO({\CNT_reg[24]_i_1_n_0 ,\CNT_reg[24]_i_1_n_1 ,\CNT_reg[24]_i_1_n_2 ,\CNT_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[24]_i_1_n_4 ,\CNT_reg[24]_i_1_n_5 ,\CNT_reg[24]_i_1_n_6 ,\CNT_reg[24]_i_1_n_7 }),
        .S({\CNT[24]_i_2_n_0 ,\CNT[24]_i_3_n_0 ,\CNT[24]_i_4_n_0 ,\CNT[24]_i_5_n_0 }));
  FDCE \CNT_reg[25] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[24]_i_1_n_6 ),
        .Q(CNT_reg[25]));
  FDCE \CNT_reg[26] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[24]_i_1_n_5 ),
        .Q(CNT_reg[26]));
  FDCE \CNT_reg[27] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[24]_i_1_n_4 ),
        .Q(CNT_reg[27]));
  FDCE \CNT_reg[28] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[28]_i_1_n_7 ),
        .Q(CNT_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[28]_i_1 
       (.CI(\CNT_reg[24]_i_1_n_0 ),
        .CO({\NLW_CNT_reg[28]_i_1_CO_UNCONNECTED [3],\CNT_reg[28]_i_1_n_1 ,\CNT_reg[28]_i_1_n_2 ,\CNT_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[28]_i_1_n_4 ,\CNT_reg[28]_i_1_n_5 ,\CNT_reg[28]_i_1_n_6 ,\CNT_reg[28]_i_1_n_7 }),
        .S({\CNT[28]_i_2_n_0 ,\CNT[28]_i_3_n_0 ,\CNT[28]_i_4_n_0 ,\CNT[28]_i_5_n_0 }));
  FDCE \CNT_reg[29] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[28]_i_1_n_6 ),
        .Q(CNT_reg[29]));
  FDCE \CNT_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[0]_i_1_n_5 ),
        .Q(CNT_reg[2]));
  FDCE \CNT_reg[30] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[28]_i_1_n_5 ),
        .Q(CNT_reg[30]));
  FDCE \CNT_reg[31] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[28]_i_1_n_4 ),
        .Q(CNT_reg[31]));
  FDCE \CNT_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[0]_i_1_n_4 ),
        .Q(CNT_reg[3]));
  FDCE \CNT_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[4]_i_1_n_7 ),
        .Q(CNT_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[4]_i_1 
       (.CI(\CNT_reg[0]_i_1_n_0 ),
        .CO({\CNT_reg[4]_i_1_n_0 ,\CNT_reg[4]_i_1_n_1 ,\CNT_reg[4]_i_1_n_2 ,\CNT_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[4]_i_1_n_4 ,\CNT_reg[4]_i_1_n_5 ,\CNT_reg[4]_i_1_n_6 ,\CNT_reg[4]_i_1_n_7 }),
        .S({\CNT[4]_i_2_n_0 ,\CNT[4]_i_3_n_0 ,\CNT[4]_i_4_n_0 ,\CNT[4]_i_5_n_0 }));
  FDCE \CNT_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[4]_i_1_n_6 ),
        .Q(CNT_reg[5]));
  FDCE \CNT_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[4]_i_1_n_5 ),
        .Q(CNT_reg[6]));
  FDCE \CNT_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[4]_i_1_n_4 ),
        .Q(CNT_reg[7]));
  FDCE \CNT_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[8]_i_1_n_7 ),
        .Q(CNT_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \CNT_reg[8]_i_1 
       (.CI(\CNT_reg[4]_i_1_n_0 ),
        .CO({\CNT_reg[8]_i_1_n_0 ,\CNT_reg[8]_i_1_n_1 ,\CNT_reg[8]_i_1_n_2 ,\CNT_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\CNT_reg[8]_i_1_n_4 ,\CNT_reg[8]_i_1_n_5 ,\CNT_reg[8]_i_1_n_6 ,\CNT_reg[8]_i_1_n_7 }),
        .S({\CNT[8]_i_2_n_0 ,\CNT[8]_i_3_n_0 ,\CNT[8]_i_4_n_0 ,\CNT[8]_i_5_n_0 }));
  FDCE \CNT_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(\CNT_reg[8]_i_1_n_6 ),
        .Q(CNT_reg[9]));
  LUT2 #(
    .INIT(4'h6)) 
    oFixedFreq_i_1
       (.I0(load),
        .I1(oFixedFreq),
        .O(oFixedFreq_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oFixedFreq_i_2
       (.I0(iRst_N),
        .O(oFixedFreq_i_2_n_0));
  FDCE oFixedFreq_reg
       (.C(iClk),
        .CE(1'b1),
        .CLR(oFixedFreq_i_2_n_0),
        .D(oFixedFreq_i_1_n_0),
        .Q(oFixedFreq));
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
