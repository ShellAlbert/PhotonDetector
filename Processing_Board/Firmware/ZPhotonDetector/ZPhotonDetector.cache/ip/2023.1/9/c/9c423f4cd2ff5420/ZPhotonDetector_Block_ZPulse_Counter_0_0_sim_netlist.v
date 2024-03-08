// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Oct 26 09:19:40 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZPulse_Counter_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZPulse_Counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZPulse_Counter_0_0,ZPulse_Counter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZPulse_Counter,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (iClk,
    iRst_N,
    iEn,
    iPulse,
    iTimeInterval,
    oNewPulseCounter,
    oNewDataUpdate);
  input iClk;
  input iRst_N;
  input iEn;
  input iPulse;
  input [7:0]iTimeInterval;
  output [15:0]oNewPulseCounter;
  output oNewDataUpdate;

  wire \<const0> ;
  wire iClk;
  wire iEn;
  wire iPulse;
  wire iRst_N;
  wire [7:0]iTimeInterval;
  wire oNewDataUpdate;
  wire [11:11]\^oNewPulseCounter ;

  assign oNewPulseCounter[15] = \<const0> ;
  assign oNewPulseCounter[14] = \<const0> ;
  assign oNewPulseCounter[13] = \<const0> ;
  assign oNewPulseCounter[12] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[11] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[10] = \<const0> ;
  assign oNewPulseCounter[9] = \<const0> ;
  assign oNewPulseCounter[8] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[7] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[6] = \<const0> ;
  assign oNewPulseCounter[5] = \<const0> ;
  assign oNewPulseCounter[4] = \<const0> ;
  assign oNewPulseCounter[3] = \<const0> ;
  assign oNewPulseCounter[2] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[1] = \^oNewPulseCounter [11];
  assign oNewPulseCounter[0] = \^oNewPulseCounter [11];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter inst
       (.iClk(iClk),
        .iEn(iEn),
        .iPulse(iPulse),
        .iRst_N(iRst_N),
        .iTimeInterval(iTimeInterval),
        .oNewDataUpdate(oNewDataUpdate),
        .oNewPulseCounter(\^oNewPulseCounter ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter
   (oNewDataUpdate,
    oNewPulseCounter,
    iTimeInterval,
    iClk,
    iEn,
    iRst_N,
    iPulse);
  output oNewDataUpdate;
  output [0:0]oNewPulseCounter;
  input [7:0]iTimeInterval;
  input iClk;
  input iEn;
  input iRst_N;
  input iPulse;

  wire [31:0]CNT;
  wire [31:1]CNT0;
  wire CNT1;
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
  wire \CNT[0]_i_1_n_0 ;
  wire \CNT[10]_i_1_n_0 ;
  wire \CNT[11]_i_1_n_0 ;
  wire \CNT[12]_i_1_n_0 ;
  wire \CNT[13]_i_1_n_0 ;
  wire \CNT[14]_i_1_n_0 ;
  wire \CNT[15]_i_1_n_0 ;
  wire \CNT[16]_i_1_n_0 ;
  wire \CNT[17]_i_1_n_0 ;
  wire \CNT[18]_i_1_n_0 ;
  wire \CNT[19]_i_1_n_0 ;
  wire \CNT[1]_i_1_n_0 ;
  wire \CNT[20]_i_1_n_0 ;
  wire \CNT[21]_i_1_n_0 ;
  wire \CNT[22]_i_1_n_0 ;
  wire \CNT[23]_i_1_n_0 ;
  wire \CNT[24]_i_1_n_0 ;
  wire \CNT[25]_i_1_n_0 ;
  wire \CNT[26]_i_1_n_0 ;
  wire \CNT[27]_i_1_n_0 ;
  wire \CNT[28]_i_1_n_0 ;
  wire \CNT[29]_i_1_n_0 ;
  wire \CNT[2]_i_1_n_0 ;
  wire \CNT[30]_i_1_n_0 ;
  wire \CNT[31]_i_1_n_0 ;
  wire \CNT[3]_i_1_n_0 ;
  wire \CNT[4]_i_1_n_0 ;
  wire \CNT[5]_i_1_n_0 ;
  wire \CNT[6]_i_1_n_0 ;
  wire \CNT[7]_i_1_n_0 ;
  wire \CNT[8]_i_1_n_0 ;
  wire \CNT[9]_i_1_n_0 ;
  wire [20:1]CNT_Deadline;
  wire \CNT_Deadline[11]_i_1_n_0 ;
  wire \CNT_Deadline[12]_i_1_n_0 ;
  wire \CNT_Deadline[13]_i_1_n_0 ;
  wire \CNT_Deadline[14]_i_1_n_0 ;
  wire \CNT_Deadline[15]_i_1_n_0 ;
  wire \CNT_Deadline[16]_i_1_n_0 ;
  wire \CNT_Deadline[18]_i_1_n_0 ;
  wire \CNT_Deadline[19]_i_1_n_0 ;
  wire \CNT_Deadline[1]_i_1_n_0 ;
  wire \CNT_Deadline[20]_i_1_n_0 ;
  wire \CNT_Deadline[20]_i_2_n_0 ;
  wire \CNT_Deadline[2]_i_1_n_0 ;
  wire \CNT_Deadline[3]_i_1_n_0 ;
  wire \CNT_Deadline[4]_i_1_n_0 ;
  wire \CNT_Deadline[5]_i_1_n_0 ;
  wire \CNT_Deadline[6]_i_1_n_0 ;
  wire \CNT_Deadline[7]_i_1_n_0 ;
  wire \CNT_Deadline[8]_i_1_n_0 ;
  wire \CNT_Deadline[9]_i_1_n_0 ;
  wire \CNT_reg[12]_i_2_n_0 ;
  wire \CNT_reg[12]_i_2_n_1 ;
  wire \CNT_reg[12]_i_2_n_2 ;
  wire \CNT_reg[12]_i_2_n_3 ;
  wire \CNT_reg[16]_i_2_n_0 ;
  wire \CNT_reg[16]_i_2_n_1 ;
  wire \CNT_reg[16]_i_2_n_2 ;
  wire \CNT_reg[16]_i_2_n_3 ;
  wire \CNT_reg[20]_i_2_n_0 ;
  wire \CNT_reg[20]_i_2_n_1 ;
  wire \CNT_reg[20]_i_2_n_2 ;
  wire \CNT_reg[20]_i_2_n_3 ;
  wire \CNT_reg[24]_i_2_n_0 ;
  wire \CNT_reg[24]_i_2_n_1 ;
  wire \CNT_reg[24]_i_2_n_2 ;
  wire \CNT_reg[24]_i_2_n_3 ;
  wire \CNT_reg[28]_i_2_n_0 ;
  wire \CNT_reg[28]_i_2_n_1 ;
  wire \CNT_reg[28]_i_2_n_2 ;
  wire \CNT_reg[28]_i_2_n_3 ;
  wire \CNT_reg[31]_i_2_n_2 ;
  wire \CNT_reg[31]_i_2_n_3 ;
  wire \CNT_reg[4]_i_2_n_0 ;
  wire \CNT_reg[4]_i_2_n_1 ;
  wire \CNT_reg[4]_i_2_n_2 ;
  wire \CNT_reg[4]_i_2_n_3 ;
  wire \CNT_reg[8]_i_2_n_0 ;
  wire \CNT_reg[8]_i_2_n_1 ;
  wire \CNT_reg[8]_i_2_n_2 ;
  wire \CNT_reg[8]_i_2_n_3 ;
  wire iClk;
  wire iEn;
  wire iPulse;
  wire iRst_N;
  wire [7:0]iTimeInterval;
  wire oNewDataUpdate;
  wire [25:1]oNewDataUpdate0;
  wire oNewDataUpdate_carry__0_i_10_n_0;
  wire oNewDataUpdate_carry__0_i_11_n_0;
  wire oNewDataUpdate_carry__0_i_12_n_0;
  wire oNewDataUpdate_carry__0_i_13_n_0;
  wire oNewDataUpdate_carry__0_i_14_n_0;
  wire oNewDataUpdate_carry__0_i_1_n_0;
  wire oNewDataUpdate_carry__0_i_2_n_0;
  wire oNewDataUpdate_carry__0_i_3_n_0;
  wire oNewDataUpdate_carry__0_i_4_n_0;
  wire oNewDataUpdate_carry__0_i_5_n_0;
  wire oNewDataUpdate_carry__0_i_5_n_1;
  wire oNewDataUpdate_carry__0_i_5_n_2;
  wire oNewDataUpdate_carry__0_i_5_n_3;
  wire oNewDataUpdate_carry__0_i_6_n_0;
  wire oNewDataUpdate_carry__0_i_6_n_1;
  wire oNewDataUpdate_carry__0_i_6_n_2;
  wire oNewDataUpdate_carry__0_i_6_n_3;
  wire oNewDataUpdate_carry__0_i_7_n_0;
  wire oNewDataUpdate_carry__0_i_8_n_0;
  wire oNewDataUpdate_carry__0_i_9_n_0;
  wire oNewDataUpdate_carry__0_n_0;
  wire oNewDataUpdate_carry__0_n_1;
  wire oNewDataUpdate_carry__0_n_2;
  wire oNewDataUpdate_carry__0_n_3;
  wire oNewDataUpdate_carry__1_i_1_n_0;
  wire oNewDataUpdate_carry__1_i_2_n_0;
  wire oNewDataUpdate_carry__1_i_3_n_0;
  wire oNewDataUpdate_carry__1_i_4_n_1;
  wire oNewDataUpdate_carry__1_i_4_n_3;
  wire oNewDataUpdate_carry__1_i_5_n_1;
  wire oNewDataUpdate_carry__1_i_5_n_3;
  wire oNewDataUpdate_carry__1_i_6_n_0;
  wire oNewDataUpdate_carry__1_i_7_n_0;
  wire oNewDataUpdate_carry__1_i_8_n_0;
  wire oNewDataUpdate_carry__1_n_2;
  wire oNewDataUpdate_carry__1_n_3;
  wire oNewDataUpdate_carry_i_10_n_0;
  wire oNewDataUpdate_carry_i_11_n_0;
  wire oNewDataUpdate_carry_i_12_n_0;
  wire oNewDataUpdate_carry_i_13_n_0;
  wire oNewDataUpdate_carry_i_14_n_0;
  wire oNewDataUpdate_carry_i_15_n_0;
  wire oNewDataUpdate_carry_i_16_n_0;
  wire oNewDataUpdate_carry_i_17_n_0;
  wire oNewDataUpdate_carry_i_18_n_0;
  wire oNewDataUpdate_carry_i_19_n_0;
  wire oNewDataUpdate_carry_i_1_n_0;
  wire oNewDataUpdate_carry_i_20_n_0;
  wire oNewDataUpdate_carry_i_2_n_0;
  wire oNewDataUpdate_carry_i_3_n_0;
  wire oNewDataUpdate_carry_i_4_n_0;
  wire oNewDataUpdate_carry_i_5_n_0;
  wire oNewDataUpdate_carry_i_5_n_1;
  wire oNewDataUpdate_carry_i_5_n_2;
  wire oNewDataUpdate_carry_i_5_n_3;
  wire oNewDataUpdate_carry_i_6_n_1;
  wire oNewDataUpdate_carry_i_6_n_3;
  wire oNewDataUpdate_carry_i_7_n_0;
  wire oNewDataUpdate_carry_i_7_n_1;
  wire oNewDataUpdate_carry_i_7_n_2;
  wire oNewDataUpdate_carry_i_7_n_3;
  wire oNewDataUpdate_carry_i_8_n_0;
  wire oNewDataUpdate_carry_i_8_n_1;
  wire oNewDataUpdate_carry_i_8_n_2;
  wire oNewDataUpdate_carry_i_8_n_3;
  wire oNewDataUpdate_carry_i_9_n_0;
  wire oNewDataUpdate_carry_n_0;
  wire oNewDataUpdate_carry_n_1;
  wire oNewDataUpdate_carry_n_2;
  wire oNewDataUpdate_carry_n_3;
  wire [0:0]oNewPulseCounter;
  wire \oNewPulseCounter[12]_i_1_n_0 ;
  wire \oNewPulseCounter[12]_i_2_n_0 ;
  wire zero_signal;
  wire [25:2]zero_signal0;
  wire zero_signal_carry__0_i_10_n_0;
  wire zero_signal_carry__0_i_11_n_0;
  wire zero_signal_carry__0_i_12_n_0;
  wire zero_signal_carry__0_i_13_n_0;
  wire zero_signal_carry__0_i_14_n_0;
  wire zero_signal_carry__0_i_15_n_0;
  wire zero_signal_carry__0_i_16_n_0;
  wire zero_signal_carry__0_i_17_n_0;
  wire zero_signal_carry__0_i_1_n_0;
  wire zero_signal_carry__0_i_2_n_0;
  wire zero_signal_carry__0_i_3_n_0;
  wire zero_signal_carry__0_i_4_n_0;
  wire zero_signal_carry__0_i_5_n_1;
  wire zero_signal_carry__0_i_5_n_3;
  wire zero_signal_carry__0_i_6_n_0;
  wire zero_signal_carry__0_i_6_n_1;
  wire zero_signal_carry__0_i_6_n_2;
  wire zero_signal_carry__0_i_6_n_3;
  wire zero_signal_carry__0_i_7_n_0;
  wire zero_signal_carry__0_i_7_n_1;
  wire zero_signal_carry__0_i_7_n_2;
  wire zero_signal_carry__0_i_7_n_3;
  wire zero_signal_carry__0_i_8_n_0;
  wire zero_signal_carry__0_i_9_n_0;
  wire zero_signal_carry__0_n_0;
  wire zero_signal_carry__0_n_1;
  wire zero_signal_carry__0_n_2;
  wire zero_signal_carry__0_n_3;
  wire zero_signal_carry__1_i_1_n_0;
  wire zero_signal_carry__1_i_2_n_0;
  wire zero_signal_carry__1_i_3_n_0;
  wire zero_signal_carry__1_i_4_n_1;
  wire zero_signal_carry__1_i_4_n_3;
  wire zero_signal_carry__1_i_5_n_0;
  wire zero_signal_carry__1_n_2;
  wire zero_signal_carry__1_n_3;
  wire zero_signal_carry_i_10_n_0;
  wire zero_signal_carry_i_11_n_0;
  wire zero_signal_carry_i_12_n_0;
  wire zero_signal_carry_i_13_n_0;
  wire zero_signal_carry_i_14_n_0;
  wire zero_signal_carry_i_15_n_0;
  wire zero_signal_carry_i_16_n_0;
  wire zero_signal_carry_i_17_n_0;
  wire zero_signal_carry_i_18_n_0;
  wire zero_signal_carry_i_19_n_0;
  wire zero_signal_carry_i_1_n_0;
  wire zero_signal_carry_i_2_n_0;
  wire zero_signal_carry_i_3_n_0;
  wire zero_signal_carry_i_4_n_0;
  wire zero_signal_carry_i_5_n_0;
  wire zero_signal_carry_i_5_n_1;
  wire zero_signal_carry_i_5_n_2;
  wire zero_signal_carry_i_5_n_3;
  wire zero_signal_carry_i_6_n_3;
  wire zero_signal_carry_i_7_n_0;
  wire zero_signal_carry_i_7_n_1;
  wire zero_signal_carry_i_7_n_2;
  wire zero_signal_carry_i_7_n_3;
  wire zero_signal_carry_i_8_n_0;
  wire zero_signal_carry_i_8_n_1;
  wire zero_signal_carry_i_8_n_2;
  wire zero_signal_carry_i_8_n_3;
  wire zero_signal_carry_i_9_n_0;
  wire zero_signal_carry_n_0;
  wire zero_signal_carry_n_1;
  wire zero_signal_carry_n_2;
  wire zero_signal_carry_n_3;
  wire [3:0]NLW_CNT1_carry_O_UNCONNECTED;
  wire [3:0]NLW_CNT1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_CNT1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_CNT1_carry__1_O_UNCONNECTED;
  wire [3:2]\NLW_CNT_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_CNT_reg[31]_i_2_O_UNCONNECTED ;
  wire [3:0]NLW_oNewDataUpdate_carry_O_UNCONNECTED;
  wire [3:0]NLW_oNewDataUpdate_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_oNewDataUpdate_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_oNewDataUpdate_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_oNewDataUpdate_carry__1_i_4_O_UNCONNECTED;
  wire [3:1]NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED;
  wire [3:2]NLW_oNewDataUpdate_carry__1_i_5_O_UNCONNECTED;
  wire [0:0]NLW_oNewDataUpdate_carry_i_5_O_UNCONNECTED;
  wire [3:1]NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED;
  wire [3:2]NLW_oNewDataUpdate_carry_i_6_O_UNCONNECTED;
  wire [0:0]NLW_oNewDataUpdate_carry_i_8_O_UNCONNECTED;
  wire [3:0]NLW_zero_signal_carry_O_UNCONNECTED;
  wire [3:0]NLW_zero_signal_carry__0_O_UNCONNECTED;
  wire [3:1]NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED;
  wire [3:2]NLW_zero_signal_carry__0_i_5_O_UNCONNECTED;
  wire [3:3]NLW_zero_signal_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_zero_signal_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_zero_signal_carry__1_i_4_O_UNCONNECTED;
  wire [0:0]NLW_zero_signal_carry_i_5_O_UNCONNECTED;
  wire [3:1]NLW_zero_signal_carry_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_zero_signal_carry_i_6_O_UNCONNECTED;

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
  LUT5 #(
    .INIT(32'h90000009)) 
    CNT1_carry__0_i_1
       (.I0(CNT_Deadline[19]),
        .I1(CNT[22]),
        .I2(CNT[23]),
        .I3(CNT[21]),
        .I4(CNT_Deadline[20]),
        .O(CNT1_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    CNT1_carry__0_i_2
       (.I0(CNT_Deadline[20]),
        .I1(CNT[20]),
        .I2(CNT_Deadline[19]),
        .I3(CNT[19]),
        .I4(CNT[18]),
        .I5(CNT_Deadline[18]),
        .O(CNT1_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    CNT1_carry__0_i_3
       (.I0(CNT_Deadline[13]),
        .I1(CNT[17]),
        .I2(CNT_Deadline[16]),
        .I3(CNT[16]),
        .I4(CNT[15]),
        .I5(CNT_Deadline[15]),
        .O(CNT1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    CNT1_carry__0_i_4
       (.I0(CNT_Deadline[14]),
        .I1(CNT[14]),
        .I2(CNT_Deadline[13]),
        .I3(CNT[13]),
        .I4(CNT[12]),
        .I5(CNT_Deadline[12]),
        .O(CNT1_carry__0_i_4_n_0));
  CARRY4 CNT1_carry__1
       (.CI(CNT1_carry__0_n_0),
        .CO({NLW_CNT1_carry__1_CO_UNCONNECTED[3],CNT1,CNT1_carry__1_n_2,CNT1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_CNT1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,CNT1_carry__1_i_1_n_0,CNT1_carry__1_i_2_n_0,CNT1_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    CNT1_carry__1_i_1
       (.I0(CNT[30]),
        .I1(CNT[31]),
        .O(CNT1_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    CNT1_carry__1_i_2
       (.I0(CNT[29]),
        .I1(CNT[28]),
        .I2(CNT[27]),
        .O(CNT1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h1001)) 
    CNT1_carry__1_i_3
       (.I0(CNT[26]),
        .I1(CNT[24]),
        .I2(CNT[25]),
        .I3(CNT_Deadline[20]),
        .O(CNT1_carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'h41000041)) 
    CNT1_carry_i_1
       (.I0(CNT[10]),
        .I1(CNT_Deadline[11]),
        .I2(CNT[11]),
        .I3(CNT[9]),
        .I4(CNT_Deadline[9]),
        .O(CNT1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    CNT1_carry_i_2
       (.I0(CNT_Deadline[8]),
        .I1(CNT[8]),
        .I2(CNT_Deadline[7]),
        .I3(CNT[7]),
        .I4(CNT[6]),
        .I5(CNT_Deadline[6]),
        .O(CNT1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    CNT1_carry_i_3
       (.I0(CNT_Deadline[5]),
        .I1(CNT[5]),
        .I2(CNT_Deadline[4]),
        .I3(CNT[4]),
        .I4(CNT[3]),
        .I5(CNT_Deadline[3]),
        .O(CNT1_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h41000041)) 
    CNT1_carry_i_4
       (.I0(CNT[0]),
        .I1(CNT_Deadline[1]),
        .I2(CNT[1]),
        .I3(CNT[2]),
        .I4(CNT_Deadline[2]),
        .O(CNT1_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \CNT[0]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT[0]),
        .O(\CNT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[10]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[10]),
        .O(\CNT[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[11]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[11]),
        .O(\CNT[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[12]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[12]),
        .O(\CNT[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[13]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[13]),
        .O(\CNT[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[14]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[14]),
        .O(\CNT[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[15]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[15]),
        .O(\CNT[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[16]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[16]),
        .O(\CNT[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[17]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[17]),
        .O(\CNT[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[18]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[18]),
        .O(\CNT[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[19]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[19]),
        .O(\CNT[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[1]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[1]),
        .O(\CNT[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[20]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[20]),
        .O(\CNT[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[21]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[21]),
        .O(\CNT[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[22]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[22]),
        .O(\CNT[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[23]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[23]),
        .O(\CNT[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[24]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[24]),
        .O(\CNT[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[25]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[25]),
        .O(\CNT[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[26]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[26]),
        .O(\CNT[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[27]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[27]),
        .O(\CNT[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[28]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[28]),
        .O(\CNT[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[29]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[29]),
        .O(\CNT[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[2]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[2]),
        .O(\CNT[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[30]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[30]),
        .O(\CNT[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[31]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[31]),
        .O(\CNT[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[3]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[3]),
        .O(\CNT[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[4]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[4]),
        .O(\CNT[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[5]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[5]),
        .O(\CNT[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[6]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[6]),
        .O(\CNT[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[7]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[7]),
        .O(\CNT[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[8]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[8]),
        .O(\CNT[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \CNT[9]_i_1 
       (.I0(CNT1),
        .I1(iEn),
        .I2(CNT0[9]),
        .O(\CNT[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \CNT_Deadline[11]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFCDC)) 
    \CNT_Deadline[12]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(\CNT_Deadline[20]_i_2_n_0 ),
        .I2(iTimeInterval[1]),
        .I3(iTimeInterval[2]),
        .O(\CNT_Deadline[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFDCC)) 
    \CNT_Deadline[13]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(\CNT_Deadline[20]_i_2_n_0 ),
        .I2(iTimeInterval[1]),
        .I3(iTimeInterval[2]),
        .O(\CNT_Deadline[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFEEC)) 
    \CNT_Deadline[14]_i_1 
       (.I0(iTimeInterval[2]),
        .I1(\CNT_Deadline[20]_i_2_n_0 ),
        .I2(iTimeInterval[1]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFAEE)) 
    \CNT_Deadline[15]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[2]),
        .I2(iTimeInterval[1]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \CNT_Deadline[16]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[0]),
        .I3(iTimeInterval[2]),
        .O(\CNT_Deadline[16]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \CNT_Deadline[18]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .O(\CNT_Deadline[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFAEA)) 
    \CNT_Deadline[19]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \CNT_Deadline[1]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \CNT_Deadline[20]_i_1 
       (.I0(iTimeInterval[2]),
        .I1(iTimeInterval[1]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .O(\CNT_Deadline[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \CNT_Deadline[20]_i_2 
       (.I0(iTimeInterval[7]),
        .I1(iEn),
        .I2(iTimeInterval[5]),
        .I3(iTimeInterval[6]),
        .I4(iTimeInterval[4]),
        .I5(iTimeInterval[3]),
        .O(\CNT_Deadline[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \CNT_Deadline[2]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \CNT_Deadline[3]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(\CNT_Deadline[20]_i_2_n_0 ),
        .O(\CNT_Deadline[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0203)) 
    \CNT_Deadline[4]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(iTimeInterval[2]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .I3(iTimeInterval[1]),
        .O(\CNT_Deadline[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0111)) 
    \CNT_Deadline[5]_i_1 
       (.I0(\CNT_Deadline[20]_i_2_n_0 ),
        .I1(iTimeInterval[1]),
        .I2(iTimeInterval[2]),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h040C)) 
    \CNT_Deadline[6]_i_1 
       (.I0(iTimeInterval[1]),
        .I1(iTimeInterval[0]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .I3(iTimeInterval[2]),
        .O(\CNT_Deadline[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF9FC)) 
    \CNT_Deadline[7]_i_1 
       (.I0(iTimeInterval[2]),
        .I1(iTimeInterval[1]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .I3(iTimeInterval[0]),
        .O(\CNT_Deadline[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h030E)) 
    \CNT_Deadline[8]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(iTimeInterval[2]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .I3(iTimeInterval[1]),
        .O(\CNT_Deadline[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h020C)) 
    \CNT_Deadline[9]_i_1 
       (.I0(iTimeInterval[0]),
        .I1(iTimeInterval[1]),
        .I2(\CNT_Deadline[20]_i_2_n_0 ),
        .I3(iTimeInterval[2]),
        .O(\CNT_Deadline[9]_i_1_n_0 ));
  FDCE \CNT_Deadline_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[11]_i_1_n_0 ),
        .Q(CNT_Deadline[11]));
  FDPE \CNT_Deadline_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[12]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[12]));
  FDPE \CNT_Deadline_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[13]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[13]));
  FDPE \CNT_Deadline_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[14]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[14]));
  FDPE \CNT_Deadline_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[15]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[15]));
  FDCE \CNT_Deadline_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[16]_i_1_n_0 ),
        .Q(CNT_Deadline[16]));
  FDCE \CNT_Deadline_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[18]_i_1_n_0 ),
        .Q(CNT_Deadline[18]));
  FDPE \CNT_Deadline_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[19]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[19]));
  FDCE \CNT_Deadline_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[1]_i_1_n_0 ),
        .Q(CNT_Deadline[1]));
  FDPE \CNT_Deadline_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[20]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[20]));
  FDCE \CNT_Deadline_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[2]_i_1_n_0 ),
        .Q(CNT_Deadline[2]));
  FDCE \CNT_Deadline_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[3]_i_1_n_0 ),
        .Q(CNT_Deadline[3]));
  FDCE \CNT_Deadline_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[4]_i_1_n_0 ),
        .Q(CNT_Deadline[4]));
  FDCE \CNT_Deadline_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[5]_i_1_n_0 ),
        .Q(CNT_Deadline[5]));
  FDCE \CNT_Deadline_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[6]_i_1_n_0 ),
        .Q(CNT_Deadline[6]));
  FDPE \CNT_Deadline_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .D(\CNT_Deadline[7]_i_1_n_0 ),
        .PRE(\oNewPulseCounter[12]_i_2_n_0 ),
        .Q(CNT_Deadline[7]));
  FDCE \CNT_Deadline_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[8]_i_1_n_0 ),
        .Q(CNT_Deadline[8]));
  FDCE \CNT_Deadline_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT_Deadline[9]_i_1_n_0 ),
        .Q(CNT_Deadline[9]));
  FDCE \CNT_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[0]_i_1_n_0 ),
        .Q(CNT[0]));
  FDCE \CNT_reg[10] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[10]_i_1_n_0 ),
        .Q(CNT[10]));
  FDCE \CNT_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[11]_i_1_n_0 ),
        .Q(CNT[11]));
  FDCE \CNT_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[12]_i_1_n_0 ),
        .Q(CNT[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[12]_i_2 
       (.CI(\CNT_reg[8]_i_2_n_0 ),
        .CO({\CNT_reg[12]_i_2_n_0 ,\CNT_reg[12]_i_2_n_1 ,\CNT_reg[12]_i_2_n_2 ,\CNT_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[12:9]),
        .S(CNT[12:9]));
  FDCE \CNT_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[13]_i_1_n_0 ),
        .Q(CNT[13]));
  FDCE \CNT_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[14]_i_1_n_0 ),
        .Q(CNT[14]));
  FDCE \CNT_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[15]_i_1_n_0 ),
        .Q(CNT[15]));
  FDCE \CNT_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[16]_i_1_n_0 ),
        .Q(CNT[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[16]_i_2 
       (.CI(\CNT_reg[12]_i_2_n_0 ),
        .CO({\CNT_reg[16]_i_2_n_0 ,\CNT_reg[16]_i_2_n_1 ,\CNT_reg[16]_i_2_n_2 ,\CNT_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[16:13]),
        .S(CNT[16:13]));
  FDCE \CNT_reg[17] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[17]_i_1_n_0 ),
        .Q(CNT[17]));
  FDCE \CNT_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[18]_i_1_n_0 ),
        .Q(CNT[18]));
  FDCE \CNT_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[19]_i_1_n_0 ),
        .Q(CNT[19]));
  FDCE \CNT_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[1]_i_1_n_0 ),
        .Q(CNT[1]));
  FDCE \CNT_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[20]_i_1_n_0 ),
        .Q(CNT[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[20]_i_2 
       (.CI(\CNT_reg[16]_i_2_n_0 ),
        .CO({\CNT_reg[20]_i_2_n_0 ,\CNT_reg[20]_i_2_n_1 ,\CNT_reg[20]_i_2_n_2 ,\CNT_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[20:17]),
        .S(CNT[20:17]));
  FDCE \CNT_reg[21] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[21]_i_1_n_0 ),
        .Q(CNT[21]));
  FDCE \CNT_reg[22] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[22]_i_1_n_0 ),
        .Q(CNT[22]));
  FDCE \CNT_reg[23] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[23]_i_1_n_0 ),
        .Q(CNT[23]));
  FDCE \CNT_reg[24] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[24]_i_1_n_0 ),
        .Q(CNT[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[24]_i_2 
       (.CI(\CNT_reg[20]_i_2_n_0 ),
        .CO({\CNT_reg[24]_i_2_n_0 ,\CNT_reg[24]_i_2_n_1 ,\CNT_reg[24]_i_2_n_2 ,\CNT_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[24:21]),
        .S(CNT[24:21]));
  FDCE \CNT_reg[25] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[25]_i_1_n_0 ),
        .Q(CNT[25]));
  FDCE \CNT_reg[26] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[26]_i_1_n_0 ),
        .Q(CNT[26]));
  FDCE \CNT_reg[27] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[27]_i_1_n_0 ),
        .Q(CNT[27]));
  FDCE \CNT_reg[28] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[28]_i_1_n_0 ),
        .Q(CNT[28]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[28]_i_2 
       (.CI(\CNT_reg[24]_i_2_n_0 ),
        .CO({\CNT_reg[28]_i_2_n_0 ,\CNT_reg[28]_i_2_n_1 ,\CNT_reg[28]_i_2_n_2 ,\CNT_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[28:25]),
        .S(CNT[28:25]));
  FDCE \CNT_reg[29] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[29]_i_1_n_0 ),
        .Q(CNT[29]));
  FDCE \CNT_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[2]_i_1_n_0 ),
        .Q(CNT[2]));
  FDCE \CNT_reg[30] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[30]_i_1_n_0 ),
        .Q(CNT[30]));
  FDCE \CNT_reg[31] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[31]_i_1_n_0 ),
        .Q(CNT[31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[31]_i_2 
       (.CI(\CNT_reg[28]_i_2_n_0 ),
        .CO({\NLW_CNT_reg[31]_i_2_CO_UNCONNECTED [3:2],\CNT_reg[31]_i_2_n_2 ,\CNT_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_CNT_reg[31]_i_2_O_UNCONNECTED [3],CNT0[31:29]}),
        .S({1'b0,CNT[31:29]}));
  FDCE \CNT_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[3]_i_1_n_0 ),
        .Q(CNT[3]));
  FDCE \CNT_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[4]_i_1_n_0 ),
        .Q(CNT[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\CNT_reg[4]_i_2_n_0 ,\CNT_reg[4]_i_2_n_1 ,\CNT_reg[4]_i_2_n_2 ,\CNT_reg[4]_i_2_n_3 }),
        .CYINIT(CNT[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[4:1]),
        .S(CNT[4:1]));
  FDCE \CNT_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[5]_i_1_n_0 ),
        .Q(CNT[5]));
  FDCE \CNT_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[6]_i_1_n_0 ),
        .Q(CNT[6]));
  FDCE \CNT_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[7]_i_1_n_0 ),
        .Q(CNT[7]));
  FDCE \CNT_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[8]_i_1_n_0 ),
        .Q(CNT[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \CNT_reg[8]_i_2 
       (.CI(\CNT_reg[4]_i_2_n_0 ),
        .CO({\CNT_reg[8]_i_2_n_0 ,\CNT_reg[8]_i_2_n_1 ,\CNT_reg[8]_i_2_n_2 ,\CNT_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(CNT0[8:5]),
        .S(CNT[8:5]));
  FDCE \CNT_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\CNT[9]_i_1_n_0 ),
        .Q(CNT[9]));
  CARRY4 oNewDataUpdate_carry
       (.CI(1'b0),
        .CO({oNewDataUpdate_carry_n_0,oNewDataUpdate_carry_n_1,oNewDataUpdate_carry_n_2,oNewDataUpdate_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oNewDataUpdate_carry_O_UNCONNECTED[3:0]),
        .S({oNewDataUpdate_carry_i_1_n_0,oNewDataUpdate_carry_i_2_n_0,oNewDataUpdate_carry_i_3_n_0,oNewDataUpdate_carry_i_4_n_0}));
  CARRY4 oNewDataUpdate_carry__0
       (.CI(oNewDataUpdate_carry_n_0),
        .CO({oNewDataUpdate_carry__0_n_0,oNewDataUpdate_carry__0_n_1,oNewDataUpdate_carry__0_n_2,oNewDataUpdate_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oNewDataUpdate_carry__0_O_UNCONNECTED[3:0]),
        .S({oNewDataUpdate_carry__0_i_1_n_0,oNewDataUpdate_carry__0_i_2_n_0,oNewDataUpdate_carry__0_i_3_n_0,oNewDataUpdate_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry__0_i_1
       (.I0(oNewDataUpdate0[23]),
        .I1(CNT[23]),
        .I2(oNewDataUpdate0[22]),
        .I3(CNT[22]),
        .I4(CNT[21]),
        .I5(oNewDataUpdate0[21]),
        .O(oNewDataUpdate_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_10
       (.I0(CNT_Deadline[18]),
        .O(oNewDataUpdate_carry__0_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_11
       (.I0(CNT_Deadline[13]),
        .O(oNewDataUpdate_carry__0_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_12
       (.I0(CNT_Deadline[16]),
        .O(oNewDataUpdate_carry__0_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_13
       (.I0(CNT_Deadline[15]),
        .O(oNewDataUpdate_carry__0_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_14
       (.I0(CNT_Deadline[14]),
        .O(oNewDataUpdate_carry__0_i_14_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry__0_i_2
       (.I0(oNewDataUpdate0[20]),
        .I1(CNT[20]),
        .I2(oNewDataUpdate0[19]),
        .I3(CNT[19]),
        .I4(CNT[18]),
        .I5(oNewDataUpdate0[18]),
        .O(oNewDataUpdate_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry__0_i_3
       (.I0(oNewDataUpdate0[17]),
        .I1(CNT[17]),
        .I2(oNewDataUpdate0[16]),
        .I3(CNT[16]),
        .I4(CNT[15]),
        .I5(oNewDataUpdate0[15]),
        .O(oNewDataUpdate_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry__0_i_4
       (.I0(oNewDataUpdate0[14]),
        .I1(CNT[14]),
        .I2(oNewDataUpdate0[13]),
        .I3(CNT[13]),
        .I4(CNT[12]),
        .I5(oNewDataUpdate0[12]),
        .O(oNewDataUpdate_carry__0_i_4_n_0));
  CARRY4 oNewDataUpdate_carry__0_i_5
       (.CI(oNewDataUpdate_carry__0_i_6_n_0),
        .CO({oNewDataUpdate_carry__0_i_5_n_0,oNewDataUpdate_carry__0_i_5_n_1,oNewDataUpdate_carry__0_i_5_n_2,oNewDataUpdate_carry__0_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({CNT_Deadline[20],CNT_Deadline[20:18]}),
        .O(oNewDataUpdate0[21:18]),
        .S({oNewDataUpdate_carry__0_i_7_n_0,oNewDataUpdate_carry__0_i_8_n_0,oNewDataUpdate_carry__0_i_9_n_0,oNewDataUpdate_carry__0_i_10_n_0}));
  CARRY4 oNewDataUpdate_carry__0_i_6
       (.CI(oNewDataUpdate_carry_i_5_n_0),
        .CO({oNewDataUpdate_carry__0_i_6_n_0,oNewDataUpdate_carry__0_i_6_n_1,oNewDataUpdate_carry__0_i_6_n_2,oNewDataUpdate_carry__0_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({CNT_Deadline[13],CNT_Deadline[16:14]}),
        .O(oNewDataUpdate0[17:14]),
        .S({oNewDataUpdate_carry__0_i_11_n_0,oNewDataUpdate_carry__0_i_12_n_0,oNewDataUpdate_carry__0_i_13_n_0,oNewDataUpdate_carry__0_i_14_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_7
       (.I0(CNT_Deadline[20]),
        .O(oNewDataUpdate_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_8
       (.I0(CNT_Deadline[20]),
        .O(oNewDataUpdate_carry__0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__0_i_9
       (.I0(CNT_Deadline[19]),
        .O(oNewDataUpdate_carry__0_i_9_n_0));
  CARRY4 oNewDataUpdate_carry__1
       (.CI(oNewDataUpdate_carry__0_n_0),
        .CO({NLW_oNewDataUpdate_carry__1_CO_UNCONNECTED[3],oNewDataUpdate,oNewDataUpdate_carry__1_n_2,oNewDataUpdate_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_oNewDataUpdate_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,oNewDataUpdate_carry__1_i_1_n_0,oNewDataUpdate_carry__1_i_2_n_0,oNewDataUpdate_carry__1_i_3_n_0}));
  LUT3 #(
    .INIT(8'h42)) 
    oNewDataUpdate_carry__1_i_1
       (.I0(oNewDataUpdate_carry__1_i_4_n_1),
        .I1(CNT[30]),
        .I2(CNT[31]),
        .O(oNewDataUpdate_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    oNewDataUpdate_carry__1_i_2
       (.I0(CNT[28]),
        .I1(CNT[29]),
        .I2(oNewDataUpdate_carry__1_i_4_n_1),
        .I3(CNT[27]),
        .O(oNewDataUpdate_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000600660060000)) 
    oNewDataUpdate_carry__1_i_3
       (.I0(oNewDataUpdate_carry__1_i_4_n_1),
        .I1(CNT[26]),
        .I2(oNewDataUpdate0[25]),
        .I3(CNT[25]),
        .I4(CNT[24]),
        .I5(oNewDataUpdate_carry__1_i_5_n_1),
        .O(oNewDataUpdate_carry__1_i_3_n_0));
  CARRY4 oNewDataUpdate_carry__1_i_4
       (.CI(1'b0),
        .CO({NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED[3],oNewDataUpdate_carry__1_i_4_n_1,NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED[1],oNewDataUpdate_carry__1_i_4_n_3}),
        .CYINIT(oNewDataUpdate_carry__1_i_5_n_1),
        .DI({1'b0,1'b0,CNT_Deadline[20],1'b0}),
        .O({NLW_oNewDataUpdate_carry__1_i_4_O_UNCONNECTED[3:2],oNewDataUpdate0[25:24]}),
        .S({1'b0,1'b1,oNewDataUpdate_carry__1_i_6_n_0,1'b1}));
  CARRY4 oNewDataUpdate_carry__1_i_5
       (.CI(oNewDataUpdate_carry__0_i_5_n_0),
        .CO({NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED[3],oNewDataUpdate_carry__1_i_5_n_1,NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED[1],oNewDataUpdate_carry__1_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,CNT_Deadline[20:19]}),
        .O({NLW_oNewDataUpdate_carry__1_i_5_O_UNCONNECTED[3:2],oNewDataUpdate0[23:22]}),
        .S({1'b0,1'b1,oNewDataUpdate_carry__1_i_7_n_0,oNewDataUpdate_carry__1_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__1_i_6
       (.I0(CNT_Deadline[20]),
        .O(oNewDataUpdate_carry__1_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__1_i_7
       (.I0(CNT_Deadline[20]),
        .O(oNewDataUpdate_carry__1_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry__1_i_8
       (.I0(CNT_Deadline[19]),
        .O(oNewDataUpdate_carry__1_i_8_n_0));
  LUT6 #(
    .INIT(64'h0990000000000990)) 
    oNewDataUpdate_carry_i_1
       (.I0(oNewDataUpdate0[11]),
        .I1(CNT[11]),
        .I2(oNewDataUpdate_carry_i_6_n_1),
        .I3(CNT[10]),
        .I4(CNT[9]),
        .I5(oNewDataUpdate0[9]),
        .O(oNewDataUpdate_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_10
       (.I0(CNT_Deadline[12]),
        .O(oNewDataUpdate_carry_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_11
       (.I0(CNT_Deadline[11]),
        .O(oNewDataUpdate_carry_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_12
       (.I0(CNT_Deadline[9]),
        .O(oNewDataUpdate_carry_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_13
       (.I0(CNT_Deadline[8]),
        .O(oNewDataUpdate_carry_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_14
       (.I0(CNT_Deadline[7]),
        .O(oNewDataUpdate_carry_i_14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_15
       (.I0(CNT_Deadline[6]),
        .O(oNewDataUpdate_carry_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_16
       (.I0(CNT_Deadline[5]),
        .O(oNewDataUpdate_carry_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_17
       (.I0(CNT_Deadline[4]),
        .O(oNewDataUpdate_carry_i_17_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_18
       (.I0(CNT_Deadline[3]),
        .O(oNewDataUpdate_carry_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_19
       (.I0(CNT_Deadline[2]),
        .O(oNewDataUpdate_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry_i_2
       (.I0(oNewDataUpdate0[8]),
        .I1(CNT[8]),
        .I2(oNewDataUpdate0[7]),
        .I3(CNT[7]),
        .I4(CNT[6]),
        .I5(oNewDataUpdate0[6]),
        .O(oNewDataUpdate_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_20
       (.I0(CNT_Deadline[1]),
        .O(oNewDataUpdate_carry_i_20_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    oNewDataUpdate_carry_i_3
       (.I0(oNewDataUpdate0[5]),
        .I1(CNT[5]),
        .I2(oNewDataUpdate0[4]),
        .I3(CNT[4]),
        .I4(CNT[3]),
        .I5(oNewDataUpdate0[3]),
        .O(oNewDataUpdate_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h41000041)) 
    oNewDataUpdate_carry_i_4
       (.I0(CNT[0]),
        .I1(oNewDataUpdate0[2]),
        .I2(CNT[2]),
        .I3(CNT[1]),
        .I4(oNewDataUpdate0[1]),
        .O(oNewDataUpdate_carry_i_4_n_0));
  CARRY4 oNewDataUpdate_carry_i_5
       (.CI(1'b0),
        .CO({oNewDataUpdate_carry_i_5_n_0,oNewDataUpdate_carry_i_5_n_1,oNewDataUpdate_carry_i_5_n_2,oNewDataUpdate_carry_i_5_n_3}),
        .CYINIT(oNewDataUpdate_carry_i_6_n_1),
        .DI({CNT_Deadline[13:11],1'b0}),
        .O(oNewDataUpdate0[13:10]),
        .S({oNewDataUpdate_carry_i_9_n_0,oNewDataUpdate_carry_i_10_n_0,oNewDataUpdate_carry_i_11_n_0,1'b1}));
  CARRY4 oNewDataUpdate_carry_i_6
       (.CI(oNewDataUpdate_carry_i_7_n_0),
        .CO({NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED[3],oNewDataUpdate_carry_i_6_n_1,NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED[1],oNewDataUpdate_carry_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,CNT_Deadline[9:8]}),
        .O({NLW_oNewDataUpdate_carry_i_6_O_UNCONNECTED[3:2],oNewDataUpdate0[9:8]}),
        .S({1'b0,1'b1,oNewDataUpdate_carry_i_12_n_0,oNewDataUpdate_carry_i_13_n_0}));
  CARRY4 oNewDataUpdate_carry_i_7
       (.CI(oNewDataUpdate_carry_i_8_n_0),
        .CO({oNewDataUpdate_carry_i_7_n_0,oNewDataUpdate_carry_i_7_n_1,oNewDataUpdate_carry_i_7_n_2,oNewDataUpdate_carry_i_7_n_3}),
        .CYINIT(1'b0),
        .DI(CNT_Deadline[7:4]),
        .O(oNewDataUpdate0[7:4]),
        .S({oNewDataUpdate_carry_i_14_n_0,oNewDataUpdate_carry_i_15_n_0,oNewDataUpdate_carry_i_16_n_0,oNewDataUpdate_carry_i_17_n_0}));
  CARRY4 oNewDataUpdate_carry_i_8
       (.CI(1'b0),
        .CO({oNewDataUpdate_carry_i_8_n_0,oNewDataUpdate_carry_i_8_n_1,oNewDataUpdate_carry_i_8_n_2,oNewDataUpdate_carry_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({CNT_Deadline[3:1],1'b0}),
        .O({oNewDataUpdate0[3:1],NLW_oNewDataUpdate_carry_i_8_O_UNCONNECTED[0]}),
        .S({oNewDataUpdate_carry_i_18_n_0,oNewDataUpdate_carry_i_19_n_0,oNewDataUpdate_carry_i_20_n_0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    oNewDataUpdate_carry_i_9
       (.I0(CNT_Deadline[13]),
        .O(oNewDataUpdate_carry_i_9_n_0));
  LUT4 #(
    .INIT(16'h2220)) 
    \oNewPulseCounter[12]_i_1 
       (.I0(iEn),
        .I1(zero_signal),
        .I2(iPulse),
        .I3(oNewPulseCounter),
        .O(\oNewPulseCounter[12]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \oNewPulseCounter[12]_i_2 
       (.I0(iRst_N),
        .O(\oNewPulseCounter[12]_i_2_n_0 ));
  FDCE \oNewPulseCounter_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oNewPulseCounter[12]_i_2_n_0 ),
        .D(\oNewPulseCounter[12]_i_1_n_0 ),
        .Q(oNewPulseCounter));
  CARRY4 zero_signal_carry
       (.CI(1'b0),
        .CO({zero_signal_carry_n_0,zero_signal_carry_n_1,zero_signal_carry_n_2,zero_signal_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_zero_signal_carry_O_UNCONNECTED[3:0]),
        .S({zero_signal_carry_i_1_n_0,zero_signal_carry_i_2_n_0,zero_signal_carry_i_3_n_0,zero_signal_carry_i_4_n_0}));
  CARRY4 zero_signal_carry__0
       (.CI(zero_signal_carry_n_0),
        .CO({zero_signal_carry__0_n_0,zero_signal_carry__0_n_1,zero_signal_carry__0_n_2,zero_signal_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_zero_signal_carry__0_O_UNCONNECTED[3:0]),
        .S({zero_signal_carry__0_i_1_n_0,zero_signal_carry__0_i_2_n_0,zero_signal_carry__0_i_3_n_0,zero_signal_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry__0_i_1
       (.I0(zero_signal0[23]),
        .I1(CNT[23]),
        .I2(zero_signal0[22]),
        .I3(CNT[22]),
        .I4(CNT[21]),
        .I5(zero_signal0[21]),
        .O(zero_signal_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_10
       (.I0(CNT_Deadline[20]),
        .O(zero_signal_carry__0_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_11
       (.I0(CNT_Deadline[20]),
        .O(zero_signal_carry__0_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_12
       (.I0(CNT_Deadline[19]),
        .O(zero_signal_carry__0_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_13
       (.I0(CNT_Deadline[18]),
        .O(zero_signal_carry__0_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_14
       (.I0(CNT_Deadline[13]),
        .O(zero_signal_carry__0_i_14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_15
       (.I0(CNT_Deadline[16]),
        .O(zero_signal_carry__0_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_16
       (.I0(CNT_Deadline[15]),
        .O(zero_signal_carry__0_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_17
       (.I0(CNT_Deadline[14]),
        .O(zero_signal_carry__0_i_17_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry__0_i_2
       (.I0(zero_signal0[20]),
        .I1(CNT[20]),
        .I2(zero_signal0[19]),
        .I3(CNT[19]),
        .I4(CNT[18]),
        .I5(zero_signal0[18]),
        .O(zero_signal_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry__0_i_3
       (.I0(zero_signal0[17]),
        .I1(CNT[17]),
        .I2(zero_signal0[16]),
        .I3(CNT[16]),
        .I4(CNT[15]),
        .I5(zero_signal0[15]),
        .O(zero_signal_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry__0_i_4
       (.I0(zero_signal0[14]),
        .I1(CNT[14]),
        .I2(zero_signal0[13]),
        .I3(CNT[13]),
        .I4(CNT[12]),
        .I5(zero_signal0[12]),
        .O(zero_signal_carry__0_i_4_n_0));
  CARRY4 zero_signal_carry__0_i_5
       (.CI(zero_signal_carry__0_i_6_n_0),
        .CO({NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED[3],zero_signal_carry__0_i_5_n_1,NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED[1],zero_signal_carry__0_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,CNT_Deadline[20:19]}),
        .O({NLW_zero_signal_carry__0_i_5_O_UNCONNECTED[3:2],zero_signal0[23:22]}),
        .S({1'b0,1'b1,zero_signal_carry__0_i_8_n_0,zero_signal_carry__0_i_9_n_0}));
  CARRY4 zero_signal_carry__0_i_6
       (.CI(zero_signal_carry__0_i_7_n_0),
        .CO({zero_signal_carry__0_i_6_n_0,zero_signal_carry__0_i_6_n_1,zero_signal_carry__0_i_6_n_2,zero_signal_carry__0_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({CNT_Deadline[20],CNT_Deadline[20:18]}),
        .O(zero_signal0[21:18]),
        .S({zero_signal_carry__0_i_10_n_0,zero_signal_carry__0_i_11_n_0,zero_signal_carry__0_i_12_n_0,zero_signal_carry__0_i_13_n_0}));
  CARRY4 zero_signal_carry__0_i_7
       (.CI(zero_signal_carry_i_5_n_0),
        .CO({zero_signal_carry__0_i_7_n_0,zero_signal_carry__0_i_7_n_1,zero_signal_carry__0_i_7_n_2,zero_signal_carry__0_i_7_n_3}),
        .CYINIT(1'b0),
        .DI({CNT_Deadline[13],CNT_Deadline[16:14]}),
        .O(zero_signal0[17:14]),
        .S({zero_signal_carry__0_i_14_n_0,zero_signal_carry__0_i_15_n_0,zero_signal_carry__0_i_16_n_0,zero_signal_carry__0_i_17_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_8
       (.I0(CNT_Deadline[20]),
        .O(zero_signal_carry__0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__0_i_9
       (.I0(CNT_Deadline[19]),
        .O(zero_signal_carry__0_i_9_n_0));
  CARRY4 zero_signal_carry__1
       (.CI(zero_signal_carry__0_n_0),
        .CO({NLW_zero_signal_carry__1_CO_UNCONNECTED[3],zero_signal,zero_signal_carry__1_n_2,zero_signal_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_zero_signal_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,zero_signal_carry__1_i_1_n_0,zero_signal_carry__1_i_2_n_0,zero_signal_carry__1_i_3_n_0}));
  LUT3 #(
    .INIT(8'h42)) 
    zero_signal_carry__1_i_1
       (.I0(zero_signal_carry__1_i_4_n_1),
        .I1(CNT[30]),
        .I2(CNT[31]),
        .O(zero_signal_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    zero_signal_carry__1_i_2
       (.I0(CNT[28]),
        .I1(CNT[29]),
        .I2(zero_signal_carry__1_i_4_n_1),
        .I3(CNT[27]),
        .O(zero_signal_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000600660060000)) 
    zero_signal_carry__1_i_3
       (.I0(zero_signal_carry__1_i_4_n_1),
        .I1(CNT[26]),
        .I2(zero_signal0[25]),
        .I3(CNT[25]),
        .I4(CNT[24]),
        .I5(zero_signal_carry__0_i_5_n_1),
        .O(zero_signal_carry__1_i_3_n_0));
  CARRY4 zero_signal_carry__1_i_4
       (.CI(1'b0),
        .CO({NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED[3],zero_signal_carry__1_i_4_n_1,NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED[1],zero_signal_carry__1_i_4_n_3}),
        .CYINIT(zero_signal_carry__0_i_5_n_1),
        .DI({1'b0,1'b0,CNT_Deadline[20],1'b0}),
        .O({NLW_zero_signal_carry__1_i_4_O_UNCONNECTED[3:2],zero_signal0[25:24]}),
        .S({1'b0,1'b1,zero_signal_carry__1_i_5_n_0,1'b1}));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry__1_i_5
       (.I0(CNT_Deadline[20]),
        .O(zero_signal_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h0990000000000990)) 
    zero_signal_carry_i_1
       (.I0(zero_signal0[11]),
        .I1(CNT[11]),
        .I2(zero_signal_carry_i_6_n_3),
        .I3(CNT[10]),
        .I4(CNT[9]),
        .I5(zero_signal0[9]),
        .O(zero_signal_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_10
       (.I0(CNT_Deadline[12]),
        .O(zero_signal_carry_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_11
       (.I0(CNT_Deadline[11]),
        .O(zero_signal_carry_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_12
       (.I0(CNT_Deadline[9]),
        .O(zero_signal_carry_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_13
       (.I0(CNT_Deadline[8]),
        .O(zero_signal_carry_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_14
       (.I0(CNT_Deadline[7]),
        .O(zero_signal_carry_i_14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_15
       (.I0(CNT_Deadline[6]),
        .O(zero_signal_carry_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_16
       (.I0(CNT_Deadline[5]),
        .O(zero_signal_carry_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_17
       (.I0(CNT_Deadline[4]),
        .O(zero_signal_carry_i_17_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_18
       (.I0(CNT_Deadline[3]),
        .O(zero_signal_carry_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_19
       (.I0(CNT_Deadline[2]),
        .O(zero_signal_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry_i_2
       (.I0(zero_signal0[8]),
        .I1(CNT[8]),
        .I2(zero_signal0[7]),
        .I3(CNT[7]),
        .I4(CNT[6]),
        .I5(zero_signal0[6]),
        .O(zero_signal_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    zero_signal_carry_i_3
       (.I0(zero_signal0[5]),
        .I1(CNT[5]),
        .I2(zero_signal0[4]),
        .I3(CNT[4]),
        .I4(CNT[3]),
        .I5(zero_signal0[3]),
        .O(zero_signal_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h60000060)) 
    zero_signal_carry_i_4
       (.I0(CNT_Deadline[1]),
        .I1(CNT[1]),
        .I2(CNT[0]),
        .I3(CNT[2]),
        .I4(zero_signal0[2]),
        .O(zero_signal_carry_i_4_n_0));
  CARRY4 zero_signal_carry_i_5
       (.CI(1'b0),
        .CO({zero_signal_carry_i_5_n_0,zero_signal_carry_i_5_n_1,zero_signal_carry_i_5_n_2,zero_signal_carry_i_5_n_3}),
        .CYINIT(zero_signal_carry_i_6_n_3),
        .DI({CNT_Deadline[13:11],1'b0}),
        .O(zero_signal0[13:10]),
        .S({zero_signal_carry_i_9_n_0,zero_signal_carry_i_10_n_0,zero_signal_carry_i_11_n_0,1'b1}));
  CARRY4 zero_signal_carry_i_6
       (.CI(zero_signal_carry_i_7_n_0),
        .CO({NLW_zero_signal_carry_i_6_CO_UNCONNECTED[3:1],zero_signal_carry_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_zero_signal_carry_i_6_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 zero_signal_carry_i_7
       (.CI(zero_signal_carry_i_8_n_0),
        .CO({zero_signal_carry_i_7_n_0,zero_signal_carry_i_7_n_1,zero_signal_carry_i_7_n_2,zero_signal_carry_i_7_n_3}),
        .CYINIT(1'b0),
        .DI(CNT_Deadline[9:6]),
        .O(zero_signal0[9:6]),
        .S({zero_signal_carry_i_12_n_0,zero_signal_carry_i_13_n_0,zero_signal_carry_i_14_n_0,zero_signal_carry_i_15_n_0}));
  CARRY4 zero_signal_carry_i_8
       (.CI(1'b0),
        .CO({zero_signal_carry_i_8_n_0,zero_signal_carry_i_8_n_1,zero_signal_carry_i_8_n_2,zero_signal_carry_i_8_n_3}),
        .CYINIT(CNT_Deadline[1]),
        .DI(CNT_Deadline[5:2]),
        .O(zero_signal0[5:2]),
        .S({zero_signal_carry_i_16_n_0,zero_signal_carry_i_17_n_0,zero_signal_carry_i_18_n_0,zero_signal_carry_i_19_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    zero_signal_carry_i_9
       (.I0(CNT_Deadline[13]),
        .O(zero_signal_carry_i_9_n_0));
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
