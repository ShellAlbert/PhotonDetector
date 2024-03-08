// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Nov 10 14:42:31 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZLed_Indicator_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZLed_Indicator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator
   (oLED,
    iClk,
    iRst_N,
    iNewDataUpdate);
  output [1:0]oLED;
  input iClk;
  input iRst_N;
  input iNewDataUpdate;

  wire cnt_1S1;
  wire \cnt_1S[0]_i_10_n_0 ;
  wire \cnt_1S[0]_i_11_n_0 ;
  wire \cnt_1S[0]_i_12_n_0 ;
  wire \cnt_1S[0]_i_13_n_0 ;
  wire \cnt_1S[0]_i_14_n_0 ;
  wire \cnt_1S[0]_i_15_n_0 ;
  wire \cnt_1S[0]_i_16_n_0 ;
  wire \cnt_1S[0]_i_17_n_0 ;
  wire \cnt_1S[0]_i_18_n_0 ;
  wire \cnt_1S[0]_i_19_n_0 ;
  wire \cnt_1S[0]_i_1_n_0 ;
  wire \cnt_1S[0]_i_20_n_0 ;
  wire \cnt_1S[0]_i_21_n_0 ;
  wire \cnt_1S[0]_i_4_n_0 ;
  wire \cnt_1S[0]_i_5_n_0 ;
  wire \cnt_1S[0]_i_6_n_0 ;
  wire \cnt_1S[0]_i_7_n_0 ;
  wire \cnt_1S[0]_i_8_n_0 ;
  wire \cnt_1S[0]_i_9_n_0 ;
  wire \cnt_1S[12]_i_2_n_0 ;
  wire \cnt_1S[12]_i_3_n_0 ;
  wire \cnt_1S[12]_i_4_n_0 ;
  wire \cnt_1S[12]_i_5_n_0 ;
  wire \cnt_1S[16]_i_2_n_0 ;
  wire \cnt_1S[16]_i_3_n_0 ;
  wire \cnt_1S[16]_i_4_n_0 ;
  wire \cnt_1S[16]_i_5_n_0 ;
  wire \cnt_1S[20]_i_2_n_0 ;
  wire \cnt_1S[20]_i_3_n_0 ;
  wire \cnt_1S[20]_i_4_n_0 ;
  wire \cnt_1S[20]_i_5_n_0 ;
  wire \cnt_1S[24]_i_2_n_0 ;
  wire \cnt_1S[24]_i_3_n_0 ;
  wire \cnt_1S[24]_i_4_n_0 ;
  wire \cnt_1S[24]_i_5_n_0 ;
  wire \cnt_1S[28]_i_2_n_0 ;
  wire \cnt_1S[28]_i_3_n_0 ;
  wire \cnt_1S[28]_i_4_n_0 ;
  wire \cnt_1S[28]_i_5_n_0 ;
  wire \cnt_1S[4]_i_2_n_0 ;
  wire \cnt_1S[4]_i_3_n_0 ;
  wire \cnt_1S[4]_i_4_n_0 ;
  wire \cnt_1S[4]_i_5_n_0 ;
  wire \cnt_1S[8]_i_2_n_0 ;
  wire \cnt_1S[8]_i_3_n_0 ;
  wire \cnt_1S[8]_i_4_n_0 ;
  wire \cnt_1S[8]_i_5_n_0 ;
  wire [31:0]cnt_1S_reg;
  wire \cnt_1S_reg[0]_i_2_n_0 ;
  wire \cnt_1S_reg[0]_i_2_n_1 ;
  wire \cnt_1S_reg[0]_i_2_n_2 ;
  wire \cnt_1S_reg[0]_i_2_n_3 ;
  wire \cnt_1S_reg[0]_i_2_n_4 ;
  wire \cnt_1S_reg[0]_i_2_n_5 ;
  wire \cnt_1S_reg[0]_i_2_n_6 ;
  wire \cnt_1S_reg[0]_i_2_n_7 ;
  wire \cnt_1S_reg[12]_i_1_n_0 ;
  wire \cnt_1S_reg[12]_i_1_n_1 ;
  wire \cnt_1S_reg[12]_i_1_n_2 ;
  wire \cnt_1S_reg[12]_i_1_n_3 ;
  wire \cnt_1S_reg[12]_i_1_n_4 ;
  wire \cnt_1S_reg[12]_i_1_n_5 ;
  wire \cnt_1S_reg[12]_i_1_n_6 ;
  wire \cnt_1S_reg[12]_i_1_n_7 ;
  wire \cnt_1S_reg[16]_i_1_n_0 ;
  wire \cnt_1S_reg[16]_i_1_n_1 ;
  wire \cnt_1S_reg[16]_i_1_n_2 ;
  wire \cnt_1S_reg[16]_i_1_n_3 ;
  wire \cnt_1S_reg[16]_i_1_n_4 ;
  wire \cnt_1S_reg[16]_i_1_n_5 ;
  wire \cnt_1S_reg[16]_i_1_n_6 ;
  wire \cnt_1S_reg[16]_i_1_n_7 ;
  wire \cnt_1S_reg[20]_i_1_n_0 ;
  wire \cnt_1S_reg[20]_i_1_n_1 ;
  wire \cnt_1S_reg[20]_i_1_n_2 ;
  wire \cnt_1S_reg[20]_i_1_n_3 ;
  wire \cnt_1S_reg[20]_i_1_n_4 ;
  wire \cnt_1S_reg[20]_i_1_n_5 ;
  wire \cnt_1S_reg[20]_i_1_n_6 ;
  wire \cnt_1S_reg[20]_i_1_n_7 ;
  wire \cnt_1S_reg[24]_i_1_n_0 ;
  wire \cnt_1S_reg[24]_i_1_n_1 ;
  wire \cnt_1S_reg[24]_i_1_n_2 ;
  wire \cnt_1S_reg[24]_i_1_n_3 ;
  wire \cnt_1S_reg[24]_i_1_n_4 ;
  wire \cnt_1S_reg[24]_i_1_n_5 ;
  wire \cnt_1S_reg[24]_i_1_n_6 ;
  wire \cnt_1S_reg[24]_i_1_n_7 ;
  wire \cnt_1S_reg[28]_i_1_n_1 ;
  wire \cnt_1S_reg[28]_i_1_n_2 ;
  wire \cnt_1S_reg[28]_i_1_n_3 ;
  wire \cnt_1S_reg[28]_i_1_n_4 ;
  wire \cnt_1S_reg[28]_i_1_n_5 ;
  wire \cnt_1S_reg[28]_i_1_n_6 ;
  wire \cnt_1S_reg[28]_i_1_n_7 ;
  wire \cnt_1S_reg[4]_i_1_n_0 ;
  wire \cnt_1S_reg[4]_i_1_n_1 ;
  wire \cnt_1S_reg[4]_i_1_n_2 ;
  wire \cnt_1S_reg[4]_i_1_n_3 ;
  wire \cnt_1S_reg[4]_i_1_n_4 ;
  wire \cnt_1S_reg[4]_i_1_n_5 ;
  wire \cnt_1S_reg[4]_i_1_n_6 ;
  wire \cnt_1S_reg[4]_i_1_n_7 ;
  wire \cnt_1S_reg[8]_i_1_n_0 ;
  wire \cnt_1S_reg[8]_i_1_n_1 ;
  wire \cnt_1S_reg[8]_i_1_n_2 ;
  wire \cnt_1S_reg[8]_i_1_n_3 ;
  wire \cnt_1S_reg[8]_i_1_n_4 ;
  wire \cnt_1S_reg[8]_i_1_n_5 ;
  wire \cnt_1S_reg[8]_i_1_n_6 ;
  wire \cnt_1S_reg[8]_i_1_n_7 ;
  wire cnt_1mS1__44;
  wire \cnt_1mS[0]_i_10_n_0 ;
  wire \cnt_1mS[0]_i_11_n_0 ;
  wire \cnt_1mS[0]_i_12_n_0 ;
  wire \cnt_1mS[0]_i_13_n_0 ;
  wire \cnt_1mS[0]_i_14_n_0 ;
  wire \cnt_1mS[0]_i_15_n_0 ;
  wire \cnt_1mS[0]_i_16_n_0 ;
  wire \cnt_1mS[0]_i_17_n_0 ;
  wire \cnt_1mS[0]_i_18_n_0 ;
  wire \cnt_1mS[0]_i_19_n_0 ;
  wire \cnt_1mS[0]_i_1_n_0 ;
  wire \cnt_1mS[0]_i_20_n_0 ;
  wire \cnt_1mS[0]_i_21_n_0 ;
  wire \cnt_1mS[0]_i_22_n_0 ;
  wire \cnt_1mS[0]_i_23_n_0 ;
  wire \cnt_1mS[0]_i_24_n_0 ;
  wire \cnt_1mS[0]_i_25_n_0 ;
  wire \cnt_1mS[0]_i_26_n_0 ;
  wire \cnt_1mS[0]_i_3_n_0 ;
  wire \cnt_1mS[0]_i_4_n_0 ;
  wire \cnt_1mS[0]_i_5_n_0 ;
  wire \cnt_1mS[0]_i_6_n_0 ;
  wire \cnt_1mS[0]_i_8_n_0 ;
  wire \cnt_1mS[0]_i_9_n_0 ;
  wire \cnt_1mS[12]_i_2_n_0 ;
  wire \cnt_1mS[12]_i_3_n_0 ;
  wire \cnt_1mS[12]_i_4_n_0 ;
  wire \cnt_1mS[12]_i_5_n_0 ;
  wire \cnt_1mS[16]_i_2_n_0 ;
  wire \cnt_1mS[16]_i_3_n_0 ;
  wire \cnt_1mS[16]_i_4_n_0 ;
  wire \cnt_1mS[16]_i_5_n_0 ;
  wire \cnt_1mS[20]_i_2_n_0 ;
  wire \cnt_1mS[20]_i_3_n_0 ;
  wire \cnt_1mS[20]_i_4_n_0 ;
  wire \cnt_1mS[20]_i_5_n_0 ;
  wire \cnt_1mS[24]_i_2_n_0 ;
  wire \cnt_1mS[24]_i_3_n_0 ;
  wire \cnt_1mS[24]_i_4_n_0 ;
  wire \cnt_1mS[24]_i_5_n_0 ;
  wire \cnt_1mS[28]_i_2_n_0 ;
  wire \cnt_1mS[28]_i_3_n_0 ;
  wire \cnt_1mS[28]_i_4_n_0 ;
  wire \cnt_1mS[28]_i_5_n_0 ;
  wire \cnt_1mS[4]_i_2_n_0 ;
  wire \cnt_1mS[4]_i_3_n_0 ;
  wire \cnt_1mS[4]_i_4_n_0 ;
  wire \cnt_1mS[4]_i_5_n_0 ;
  wire \cnt_1mS[8]_i_2_n_0 ;
  wire \cnt_1mS[8]_i_3_n_0 ;
  wire \cnt_1mS[8]_i_4_n_0 ;
  wire \cnt_1mS[8]_i_5_n_0 ;
  wire [31:0]cnt_1mS_reg;
  wire \cnt_1mS_reg[0]_i_2_n_0 ;
  wire \cnt_1mS_reg[0]_i_2_n_1 ;
  wire \cnt_1mS_reg[0]_i_2_n_2 ;
  wire \cnt_1mS_reg[0]_i_2_n_3 ;
  wire \cnt_1mS_reg[0]_i_2_n_4 ;
  wire \cnt_1mS_reg[0]_i_2_n_5 ;
  wire \cnt_1mS_reg[0]_i_2_n_6 ;
  wire \cnt_1mS_reg[0]_i_2_n_7 ;
  wire \cnt_1mS_reg[12]_i_1_n_0 ;
  wire \cnt_1mS_reg[12]_i_1_n_1 ;
  wire \cnt_1mS_reg[12]_i_1_n_2 ;
  wire \cnt_1mS_reg[12]_i_1_n_3 ;
  wire \cnt_1mS_reg[12]_i_1_n_4 ;
  wire \cnt_1mS_reg[12]_i_1_n_5 ;
  wire \cnt_1mS_reg[12]_i_1_n_6 ;
  wire \cnt_1mS_reg[12]_i_1_n_7 ;
  wire \cnt_1mS_reg[16]_i_1_n_0 ;
  wire \cnt_1mS_reg[16]_i_1_n_1 ;
  wire \cnt_1mS_reg[16]_i_1_n_2 ;
  wire \cnt_1mS_reg[16]_i_1_n_3 ;
  wire \cnt_1mS_reg[16]_i_1_n_4 ;
  wire \cnt_1mS_reg[16]_i_1_n_5 ;
  wire \cnt_1mS_reg[16]_i_1_n_6 ;
  wire \cnt_1mS_reg[16]_i_1_n_7 ;
  wire \cnt_1mS_reg[20]_i_1_n_0 ;
  wire \cnt_1mS_reg[20]_i_1_n_1 ;
  wire \cnt_1mS_reg[20]_i_1_n_2 ;
  wire \cnt_1mS_reg[20]_i_1_n_3 ;
  wire \cnt_1mS_reg[20]_i_1_n_4 ;
  wire \cnt_1mS_reg[20]_i_1_n_5 ;
  wire \cnt_1mS_reg[20]_i_1_n_6 ;
  wire \cnt_1mS_reg[20]_i_1_n_7 ;
  wire \cnt_1mS_reg[24]_i_1_n_0 ;
  wire \cnt_1mS_reg[24]_i_1_n_1 ;
  wire \cnt_1mS_reg[24]_i_1_n_2 ;
  wire \cnt_1mS_reg[24]_i_1_n_3 ;
  wire \cnt_1mS_reg[24]_i_1_n_4 ;
  wire \cnt_1mS_reg[24]_i_1_n_5 ;
  wire \cnt_1mS_reg[24]_i_1_n_6 ;
  wire \cnt_1mS_reg[24]_i_1_n_7 ;
  wire \cnt_1mS_reg[28]_i_1_n_1 ;
  wire \cnt_1mS_reg[28]_i_1_n_2 ;
  wire \cnt_1mS_reg[28]_i_1_n_3 ;
  wire \cnt_1mS_reg[28]_i_1_n_4 ;
  wire \cnt_1mS_reg[28]_i_1_n_5 ;
  wire \cnt_1mS_reg[28]_i_1_n_6 ;
  wire \cnt_1mS_reg[28]_i_1_n_7 ;
  wire \cnt_1mS_reg[4]_i_1_n_0 ;
  wire \cnt_1mS_reg[4]_i_1_n_1 ;
  wire \cnt_1mS_reg[4]_i_1_n_2 ;
  wire \cnt_1mS_reg[4]_i_1_n_3 ;
  wire \cnt_1mS_reg[4]_i_1_n_4 ;
  wire \cnt_1mS_reg[4]_i_1_n_5 ;
  wire \cnt_1mS_reg[4]_i_1_n_6 ;
  wire \cnt_1mS_reg[4]_i_1_n_7 ;
  wire \cnt_1mS_reg[8]_i_1_n_0 ;
  wire \cnt_1mS_reg[8]_i_1_n_1 ;
  wire \cnt_1mS_reg[8]_i_1_n_2 ;
  wire \cnt_1mS_reg[8]_i_1_n_3 ;
  wire \cnt_1mS_reg[8]_i_1_n_4 ;
  wire \cnt_1mS_reg[8]_i_1_n_5 ;
  wire \cnt_1mS_reg[8]_i_1_n_6 ;
  wire \cnt_1mS_reg[8]_i_1_n_7 ;
  wire [31:0]cnt_1uS;
  wire cnt_1uS0_carry__0_n_0;
  wire cnt_1uS0_carry__0_n_1;
  wire cnt_1uS0_carry__0_n_2;
  wire cnt_1uS0_carry__0_n_3;
  wire cnt_1uS0_carry__1_n_0;
  wire cnt_1uS0_carry__1_n_1;
  wire cnt_1uS0_carry__1_n_2;
  wire cnt_1uS0_carry__1_n_3;
  wire cnt_1uS0_carry__2_n_0;
  wire cnt_1uS0_carry__2_n_1;
  wire cnt_1uS0_carry__2_n_2;
  wire cnt_1uS0_carry__2_n_3;
  wire cnt_1uS0_carry__3_n_0;
  wire cnt_1uS0_carry__3_n_1;
  wire cnt_1uS0_carry__3_n_2;
  wire cnt_1uS0_carry__3_n_3;
  wire cnt_1uS0_carry__4_n_0;
  wire cnt_1uS0_carry__4_n_1;
  wire cnt_1uS0_carry__4_n_2;
  wire cnt_1uS0_carry__4_n_3;
  wire cnt_1uS0_carry__5_n_0;
  wire cnt_1uS0_carry__5_n_1;
  wire cnt_1uS0_carry__5_n_2;
  wire cnt_1uS0_carry__5_n_3;
  wire cnt_1uS0_carry__6_n_2;
  wire cnt_1uS0_carry__6_n_3;
  wire cnt_1uS0_carry_n_0;
  wire cnt_1uS0_carry_n_1;
  wire cnt_1uS0_carry_n_2;
  wire cnt_1uS0_carry_n_3;
  wire \cnt_1uS[31]_i_2_n_0 ;
  wire \cnt_1uS[31]_i_3_n_0 ;
  wire \cnt_1uS[31]_i_4_n_0 ;
  wire \cnt_1uS[31]_i_5_n_0 ;
  wire \cnt_1uS[31]_i_6_n_0 ;
  wire \cnt_1uS[31]_i_7_n_0 ;
  wire \cnt_1uS[31]_i_8_n_0 ;
  wire \cnt_1uS_reg_n_0_[0] ;
  wire \cnt_1uS_reg_n_0_[10] ;
  wire \cnt_1uS_reg_n_0_[11] ;
  wire \cnt_1uS_reg_n_0_[12] ;
  wire \cnt_1uS_reg_n_0_[13] ;
  wire \cnt_1uS_reg_n_0_[14] ;
  wire \cnt_1uS_reg_n_0_[15] ;
  wire \cnt_1uS_reg_n_0_[16] ;
  wire \cnt_1uS_reg_n_0_[17] ;
  wire \cnt_1uS_reg_n_0_[18] ;
  wire \cnt_1uS_reg_n_0_[19] ;
  wire \cnt_1uS_reg_n_0_[1] ;
  wire \cnt_1uS_reg_n_0_[20] ;
  wire \cnt_1uS_reg_n_0_[21] ;
  wire \cnt_1uS_reg_n_0_[22] ;
  wire \cnt_1uS_reg_n_0_[23] ;
  wire \cnt_1uS_reg_n_0_[24] ;
  wire \cnt_1uS_reg_n_0_[25] ;
  wire \cnt_1uS_reg_n_0_[26] ;
  wire \cnt_1uS_reg_n_0_[27] ;
  wire \cnt_1uS_reg_n_0_[28] ;
  wire \cnt_1uS_reg_n_0_[29] ;
  wire \cnt_1uS_reg_n_0_[2] ;
  wire \cnt_1uS_reg_n_0_[30] ;
  wire \cnt_1uS_reg_n_0_[31] ;
  wire \cnt_1uS_reg_n_0_[3] ;
  wire \cnt_1uS_reg_n_0_[4] ;
  wire \cnt_1uS_reg_n_0_[5] ;
  wire \cnt_1uS_reg_n_0_[6] ;
  wire \cnt_1uS_reg_n_0_[7] ;
  wire \cnt_1uS_reg_n_0_[8] ;
  wire \cnt_1uS_reg_n_0_[9] ;
  wire [31:1]data0;
  wire iClk;
  wire iNewDataUpdate;
  wire iRst_N;
  wire [1:0]oLED;
  wire \oLED_r[0]_i_1_n_0 ;
  wire \oLED_r[1]_i_1_n_0 ;
  wire \oLED_r[1]_i_2_n_0 ;
  wire oLED_r_reg2;
  wire oLED_r_reg20_in;
  wire oLED_r_reg2__15_carry__0_i_1_n_0;
  wire oLED_r_reg2__15_carry__0_i_2_n_0;
  wire oLED_r_reg2__15_carry__0_i_3_n_0;
  wire oLED_r_reg2__15_carry__0_i_4_n_0;
  wire oLED_r_reg2__15_carry__0_i_5_n_0;
  wire oLED_r_reg2__15_carry__0_i_6_n_0;
  wire oLED_r_reg2__15_carry__0_i_7_n_0;
  wire oLED_r_reg2__15_carry__0_i_8_n_0;
  wire oLED_r_reg2__15_carry__0_n_0;
  wire oLED_r_reg2__15_carry__0_n_1;
  wire oLED_r_reg2__15_carry__0_n_2;
  wire oLED_r_reg2__15_carry__0_n_3;
  wire oLED_r_reg2__15_carry__1_i_1_n_0;
  wire oLED_r_reg2__15_carry__1_i_2_n_0;
  wire oLED_r_reg2__15_carry__1_i_3_n_0;
  wire oLED_r_reg2__15_carry__1_i_4_n_0;
  wire oLED_r_reg2__15_carry__1_i_5_n_0;
  wire oLED_r_reg2__15_carry__1_i_6_n_0;
  wire oLED_r_reg2__15_carry__1_i_7_n_0;
  wire oLED_r_reg2__15_carry__1_i_8_n_0;
  wire oLED_r_reg2__15_carry__1_n_0;
  wire oLED_r_reg2__15_carry__1_n_1;
  wire oLED_r_reg2__15_carry__1_n_2;
  wire oLED_r_reg2__15_carry__1_n_3;
  wire oLED_r_reg2__15_carry__2_i_1_n_0;
  wire oLED_r_reg2__15_carry__2_i_2_n_0;
  wire oLED_r_reg2__15_carry__2_i_3_n_0;
  wire oLED_r_reg2__15_carry__2_i_4_n_0;
  wire oLED_r_reg2__15_carry__2_i_5_n_0;
  wire oLED_r_reg2__15_carry__2_i_6_n_0;
  wire oLED_r_reg2__15_carry__2_i_7_n_0;
  wire oLED_r_reg2__15_carry__2_i_8_n_0;
  wire oLED_r_reg2__15_carry__2_n_1;
  wire oLED_r_reg2__15_carry__2_n_2;
  wire oLED_r_reg2__15_carry__2_n_3;
  wire oLED_r_reg2__15_carry_i_1_n_0;
  wire oLED_r_reg2__15_carry_i_2_n_0;
  wire oLED_r_reg2__15_carry_i_3_n_0;
  wire oLED_r_reg2__15_carry_i_4_n_0;
  wire oLED_r_reg2__15_carry_i_5_n_0;
  wire oLED_r_reg2__15_carry_i_6_n_0;
  wire oLED_r_reg2__15_carry_i_7_n_0;
  wire oLED_r_reg2__15_carry_i_8_n_0;
  wire oLED_r_reg2__15_carry_n_0;
  wire oLED_r_reg2__15_carry_n_1;
  wire oLED_r_reg2__15_carry_n_2;
  wire oLED_r_reg2__15_carry_n_3;
  wire oLED_r_reg2_carry__0_i_1_n_0;
  wire oLED_r_reg2_carry__0_i_2_n_0;
  wire oLED_r_reg2_carry__0_i_3_n_0;
  wire oLED_r_reg2_carry__0_i_4_n_0;
  wire oLED_r_reg2_carry__0_i_5_n_0;
  wire oLED_r_reg2_carry__0_i_6_n_0;
  wire oLED_r_reg2_carry__0_i_7_n_0;
  wire oLED_r_reg2_carry__0_i_8_n_0;
  wire oLED_r_reg2_carry__0_n_0;
  wire oLED_r_reg2_carry__0_n_1;
  wire oLED_r_reg2_carry__0_n_2;
  wire oLED_r_reg2_carry__0_n_3;
  wire oLED_r_reg2_carry__1_i_1_n_0;
  wire oLED_r_reg2_carry__1_i_2_n_0;
  wire oLED_r_reg2_carry__1_i_3_n_0;
  wire oLED_r_reg2_carry__1_i_4_n_0;
  wire oLED_r_reg2_carry__1_i_5_n_0;
  wire oLED_r_reg2_carry__1_i_6_n_0;
  wire oLED_r_reg2_carry__1_i_7_n_0;
  wire oLED_r_reg2_carry__1_i_8_n_0;
  wire oLED_r_reg2_carry__1_n_0;
  wire oLED_r_reg2_carry__1_n_1;
  wire oLED_r_reg2_carry__1_n_2;
  wire oLED_r_reg2_carry__1_n_3;
  wire oLED_r_reg2_carry__2_i_1_n_0;
  wire oLED_r_reg2_carry__2_i_2_n_0;
  wire oLED_r_reg2_carry__2_i_3_n_0;
  wire oLED_r_reg2_carry__2_i_4_n_0;
  wire oLED_r_reg2_carry__2_i_5_n_0;
  wire oLED_r_reg2_carry__2_i_6_n_0;
  wire oLED_r_reg2_carry__2_i_7_n_0;
  wire oLED_r_reg2_carry__2_i_8_n_0;
  wire oLED_r_reg2_carry__2_n_1;
  wire oLED_r_reg2_carry__2_n_2;
  wire oLED_r_reg2_carry__2_n_3;
  wire oLED_r_reg2_carry_i_1_n_0;
  wire oLED_r_reg2_carry_i_2_n_0;
  wire oLED_r_reg2_carry_i_3_n_0;
  wire oLED_r_reg2_carry_i_4_n_0;
  wire oLED_r_reg2_carry_i_5_n_0;
  wire oLED_r_reg2_carry_i_6_n_0;
  wire oLED_r_reg2_carry_i_7_n_0;
  wire oLED_r_reg2_carry_i_8_n_0;
  wire oLED_r_reg2_carry_n_0;
  wire oLED_r_reg2_carry_n_1;
  wire oLED_r_reg2_carry_n_2;
  wire oLED_r_reg2_carry_n_3;
  wire on_off_flag;
  wire on_off_flag_i_1_n_0;
  wire [3:3]\NLW_cnt_1S_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_1mS_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:2]NLW_cnt_1uS0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_cnt_1uS0_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2__15_carry_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2__15_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2__15_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2__15_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2_carry_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_oLED_r_reg2_carry__2_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'hE)) 
    \cnt_1S[0]_i_1 
       (.I0(cnt_1S1),
        .I1(cnt_1mS1__44),
        .O(\cnt_1S[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \cnt_1S[0]_i_10 
       (.I0(\cnt_1S[0]_i_16_n_0 ),
        .I1(\cnt_1S[0]_i_17_n_0 ),
        .I2(\cnt_1S[0]_i_18_n_0 ),
        .I3(\cnt_1S[0]_i_19_n_0 ),
        .O(\cnt_1S[0]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \cnt_1S[0]_i_11 
       (.I0(\cnt_1S[0]_i_20_n_0 ),
        .I1(\cnt_1uS[31]_i_7_n_0 ),
        .I2(\cnt_1S[0]_i_21_n_0 ),
        .I3(\cnt_1uS[31]_i_8_n_0 ),
        .I4(\cnt_1uS[31]_i_3_n_0 ),
        .O(\cnt_1S[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_12 
       (.I0(cnt_1S_reg[20]),
        .I1(cnt_1S_reg[21]),
        .I2(cnt_1S_reg[22]),
        .I3(cnt_1S_reg[23]),
        .O(\cnt_1S[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_13 
       (.I0(cnt_1S_reg[16]),
        .I1(cnt_1S_reg[17]),
        .I2(cnt_1S_reg[18]),
        .I3(cnt_1S_reg[19]),
        .O(\cnt_1S[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_14 
       (.I0(cnt_1S_reg[28]),
        .I1(cnt_1S_reg[29]),
        .I2(cnt_1S_reg[31]),
        .I3(cnt_1S_reg[30]),
        .O(\cnt_1S[0]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_15 
       (.I0(cnt_1S_reg[24]),
        .I1(cnt_1S_reg[25]),
        .I2(cnt_1S_reg[26]),
        .I3(cnt_1S_reg[27]),
        .O(\cnt_1S[0]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1S[0]_i_16 
       (.I0(cnt_1S_reg[7]),
        .I1(cnt_1S_reg[6]),
        .I2(cnt_1S_reg[4]),
        .I3(cnt_1S_reg[5]),
        .O(\cnt_1S[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1S[0]_i_17 
       (.I0(cnt_1S_reg[1]),
        .I1(cnt_1S_reg[0]),
        .I2(cnt_1S_reg[3]),
        .I3(cnt_1S_reg[2]),
        .O(\cnt_1S[0]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \cnt_1S[0]_i_18 
       (.I0(cnt_1S_reg[11]),
        .I1(cnt_1S_reg[10]),
        .I2(cnt_1S_reg[9]),
        .I3(cnt_1S_reg[8]),
        .O(\cnt_1S[0]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1S[0]_i_19 
       (.I0(cnt_1S_reg[15]),
        .I1(cnt_1S_reg[14]),
        .I2(cnt_1S_reg[13]),
        .I3(cnt_1S_reg[12]),
        .O(\cnt_1S[0]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_20 
       (.I0(\cnt_1uS_reg_n_0_[16] ),
        .I1(\cnt_1uS_reg_n_0_[17] ),
        .I2(\cnt_1uS_reg_n_0_[18] ),
        .I3(\cnt_1uS_reg_n_0_[19] ),
        .O(\cnt_1S[0]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_21 
       (.I0(\cnt_1uS_reg_n_0_[8] ),
        .I1(\cnt_1uS_reg_n_0_[9] ),
        .I2(\cnt_1uS_reg_n_0_[10] ),
        .I3(\cnt_1uS_reg_n_0_[11] ),
        .O(\cnt_1S[0]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \cnt_1S[0]_i_3 
       (.I0(\cnt_1S[0]_i_9_n_0 ),
        .I1(\cnt_1S[0]_i_10_n_0 ),
        .I2(\cnt_1mS[0]_i_18_n_0 ),
        .I3(\cnt_1mS[0]_i_17_n_0 ),
        .I4(\cnt_1S[0]_i_11_n_0 ),
        .I5(\cnt_1mS[0]_i_16_n_0 ),
        .O(cnt_1S1));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[0]_i_4 
       (.I0(cnt_1S_reg[0]),
        .I1(cnt_1S1),
        .O(\cnt_1S[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[0]_i_5 
       (.I0(cnt_1S_reg[3]),
        .I1(cnt_1S1),
        .O(\cnt_1S[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[0]_i_6 
       (.I0(cnt_1S_reg[2]),
        .I1(cnt_1S1),
        .O(\cnt_1S[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[0]_i_7 
       (.I0(cnt_1S_reg[1]),
        .I1(cnt_1S1),
        .O(\cnt_1S[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \cnt_1S[0]_i_8 
       (.I0(cnt_1S_reg[0]),
        .I1(cnt_1S1),
        .O(\cnt_1S[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1S[0]_i_9 
       (.I0(\cnt_1S[0]_i_12_n_0 ),
        .I1(\cnt_1S[0]_i_13_n_0 ),
        .I2(\cnt_1S[0]_i_14_n_0 ),
        .I3(\cnt_1S[0]_i_15_n_0 ),
        .O(\cnt_1S[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[12]_i_2 
       (.I0(cnt_1S_reg[15]),
        .I1(cnt_1S1),
        .O(\cnt_1S[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[12]_i_3 
       (.I0(cnt_1S_reg[14]),
        .I1(cnt_1S1),
        .O(\cnt_1S[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[12]_i_4 
       (.I0(cnt_1S_reg[13]),
        .I1(cnt_1S1),
        .O(\cnt_1S[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[12]_i_5 
       (.I0(cnt_1S_reg[12]),
        .I1(cnt_1S1),
        .O(\cnt_1S[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[16]_i_2 
       (.I0(cnt_1S_reg[19]),
        .I1(cnt_1S1),
        .O(\cnt_1S[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[16]_i_3 
       (.I0(cnt_1S_reg[18]),
        .I1(cnt_1S1),
        .O(\cnt_1S[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[16]_i_4 
       (.I0(cnt_1S_reg[17]),
        .I1(cnt_1S1),
        .O(\cnt_1S[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[16]_i_5 
       (.I0(cnt_1S_reg[16]),
        .I1(cnt_1S1),
        .O(\cnt_1S[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[20]_i_2 
       (.I0(cnt_1S_reg[23]),
        .I1(cnt_1S1),
        .O(\cnt_1S[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[20]_i_3 
       (.I0(cnt_1S_reg[22]),
        .I1(cnt_1S1),
        .O(\cnt_1S[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[20]_i_4 
       (.I0(cnt_1S_reg[21]),
        .I1(cnt_1S1),
        .O(\cnt_1S[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[20]_i_5 
       (.I0(cnt_1S_reg[20]),
        .I1(cnt_1S1),
        .O(\cnt_1S[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[24]_i_2 
       (.I0(cnt_1S_reg[27]),
        .I1(cnt_1S1),
        .O(\cnt_1S[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[24]_i_3 
       (.I0(cnt_1S_reg[26]),
        .I1(cnt_1S1),
        .O(\cnt_1S[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[24]_i_4 
       (.I0(cnt_1S_reg[25]),
        .I1(cnt_1S1),
        .O(\cnt_1S[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[24]_i_5 
       (.I0(cnt_1S_reg[24]),
        .I1(cnt_1S1),
        .O(\cnt_1S[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[28]_i_2 
       (.I0(cnt_1S_reg[31]),
        .I1(cnt_1S1),
        .O(\cnt_1S[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[28]_i_3 
       (.I0(cnt_1S_reg[30]),
        .I1(cnt_1S1),
        .O(\cnt_1S[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[28]_i_4 
       (.I0(cnt_1S_reg[29]),
        .I1(cnt_1S1),
        .O(\cnt_1S[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[28]_i_5 
       (.I0(cnt_1S_reg[28]),
        .I1(cnt_1S1),
        .O(\cnt_1S[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[4]_i_2 
       (.I0(cnt_1S_reg[7]),
        .I1(cnt_1S1),
        .O(\cnt_1S[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[4]_i_3 
       (.I0(cnt_1S_reg[6]),
        .I1(cnt_1S1),
        .O(\cnt_1S[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[4]_i_4 
       (.I0(cnt_1S_reg[5]),
        .I1(cnt_1S1),
        .O(\cnt_1S[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[4]_i_5 
       (.I0(cnt_1S_reg[4]),
        .I1(cnt_1S1),
        .O(\cnt_1S[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[8]_i_2 
       (.I0(cnt_1S_reg[11]),
        .I1(cnt_1S1),
        .O(\cnt_1S[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[8]_i_3 
       (.I0(cnt_1S_reg[10]),
        .I1(cnt_1S1),
        .O(\cnt_1S[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[8]_i_4 
       (.I0(cnt_1S_reg[9]),
        .I1(cnt_1S1),
        .O(\cnt_1S[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1S[8]_i_5 
       (.I0(cnt_1S_reg[8]),
        .I1(cnt_1S1),
        .O(\cnt_1S[8]_i_5_n_0 ));
  FDCE \cnt_1S_reg[0] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[0]_i_2_n_7 ),
        .Q(cnt_1S_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cnt_1S_reg[0]_i_2_n_0 ,\cnt_1S_reg[0]_i_2_n_1 ,\cnt_1S_reg[0]_i_2_n_2 ,\cnt_1S_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\cnt_1S[0]_i_4_n_0 }),
        .O({\cnt_1S_reg[0]_i_2_n_4 ,\cnt_1S_reg[0]_i_2_n_5 ,\cnt_1S_reg[0]_i_2_n_6 ,\cnt_1S_reg[0]_i_2_n_7 }),
        .S({\cnt_1S[0]_i_5_n_0 ,\cnt_1S[0]_i_6_n_0 ,\cnt_1S[0]_i_7_n_0 ,\cnt_1S[0]_i_8_n_0 }));
  FDCE \cnt_1S_reg[10] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[8]_i_1_n_5 ),
        .Q(cnt_1S_reg[10]));
  FDCE \cnt_1S_reg[11] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[8]_i_1_n_4 ),
        .Q(cnt_1S_reg[11]));
  FDCE \cnt_1S_reg[12] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[12]_i_1_n_7 ),
        .Q(cnt_1S_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[12]_i_1 
       (.CI(\cnt_1S_reg[8]_i_1_n_0 ),
        .CO({\cnt_1S_reg[12]_i_1_n_0 ,\cnt_1S_reg[12]_i_1_n_1 ,\cnt_1S_reg[12]_i_1_n_2 ,\cnt_1S_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[12]_i_1_n_4 ,\cnt_1S_reg[12]_i_1_n_5 ,\cnt_1S_reg[12]_i_1_n_6 ,\cnt_1S_reg[12]_i_1_n_7 }),
        .S({\cnt_1S[12]_i_2_n_0 ,\cnt_1S[12]_i_3_n_0 ,\cnt_1S[12]_i_4_n_0 ,\cnt_1S[12]_i_5_n_0 }));
  FDCE \cnt_1S_reg[13] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[12]_i_1_n_6 ),
        .Q(cnt_1S_reg[13]));
  FDCE \cnt_1S_reg[14] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[12]_i_1_n_5 ),
        .Q(cnt_1S_reg[14]));
  FDCE \cnt_1S_reg[15] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[12]_i_1_n_4 ),
        .Q(cnt_1S_reg[15]));
  FDCE \cnt_1S_reg[16] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[16]_i_1_n_7 ),
        .Q(cnt_1S_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[16]_i_1 
       (.CI(\cnt_1S_reg[12]_i_1_n_0 ),
        .CO({\cnt_1S_reg[16]_i_1_n_0 ,\cnt_1S_reg[16]_i_1_n_1 ,\cnt_1S_reg[16]_i_1_n_2 ,\cnt_1S_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[16]_i_1_n_4 ,\cnt_1S_reg[16]_i_1_n_5 ,\cnt_1S_reg[16]_i_1_n_6 ,\cnt_1S_reg[16]_i_1_n_7 }),
        .S({\cnt_1S[16]_i_2_n_0 ,\cnt_1S[16]_i_3_n_0 ,\cnt_1S[16]_i_4_n_0 ,\cnt_1S[16]_i_5_n_0 }));
  FDCE \cnt_1S_reg[17] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[16]_i_1_n_6 ),
        .Q(cnt_1S_reg[17]));
  FDCE \cnt_1S_reg[18] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[16]_i_1_n_5 ),
        .Q(cnt_1S_reg[18]));
  FDCE \cnt_1S_reg[19] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[16]_i_1_n_4 ),
        .Q(cnt_1S_reg[19]));
  FDCE \cnt_1S_reg[1] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[0]_i_2_n_6 ),
        .Q(cnt_1S_reg[1]));
  FDCE \cnt_1S_reg[20] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[20]_i_1_n_7 ),
        .Q(cnt_1S_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[20]_i_1 
       (.CI(\cnt_1S_reg[16]_i_1_n_0 ),
        .CO({\cnt_1S_reg[20]_i_1_n_0 ,\cnt_1S_reg[20]_i_1_n_1 ,\cnt_1S_reg[20]_i_1_n_2 ,\cnt_1S_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[20]_i_1_n_4 ,\cnt_1S_reg[20]_i_1_n_5 ,\cnt_1S_reg[20]_i_1_n_6 ,\cnt_1S_reg[20]_i_1_n_7 }),
        .S({\cnt_1S[20]_i_2_n_0 ,\cnt_1S[20]_i_3_n_0 ,\cnt_1S[20]_i_4_n_0 ,\cnt_1S[20]_i_5_n_0 }));
  FDCE \cnt_1S_reg[21] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[20]_i_1_n_6 ),
        .Q(cnt_1S_reg[21]));
  FDCE \cnt_1S_reg[22] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[20]_i_1_n_5 ),
        .Q(cnt_1S_reg[22]));
  FDCE \cnt_1S_reg[23] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[20]_i_1_n_4 ),
        .Q(cnt_1S_reg[23]));
  FDCE \cnt_1S_reg[24] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[24]_i_1_n_7 ),
        .Q(cnt_1S_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[24]_i_1 
       (.CI(\cnt_1S_reg[20]_i_1_n_0 ),
        .CO({\cnt_1S_reg[24]_i_1_n_0 ,\cnt_1S_reg[24]_i_1_n_1 ,\cnt_1S_reg[24]_i_1_n_2 ,\cnt_1S_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[24]_i_1_n_4 ,\cnt_1S_reg[24]_i_1_n_5 ,\cnt_1S_reg[24]_i_1_n_6 ,\cnt_1S_reg[24]_i_1_n_7 }),
        .S({\cnt_1S[24]_i_2_n_0 ,\cnt_1S[24]_i_3_n_0 ,\cnt_1S[24]_i_4_n_0 ,\cnt_1S[24]_i_5_n_0 }));
  FDCE \cnt_1S_reg[25] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[24]_i_1_n_6 ),
        .Q(cnt_1S_reg[25]));
  FDCE \cnt_1S_reg[26] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[24]_i_1_n_5 ),
        .Q(cnt_1S_reg[26]));
  FDCE \cnt_1S_reg[27] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[24]_i_1_n_4 ),
        .Q(cnt_1S_reg[27]));
  FDCE \cnt_1S_reg[28] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[28]_i_1_n_7 ),
        .Q(cnt_1S_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[28]_i_1 
       (.CI(\cnt_1S_reg[24]_i_1_n_0 ),
        .CO({\NLW_cnt_1S_reg[28]_i_1_CO_UNCONNECTED [3],\cnt_1S_reg[28]_i_1_n_1 ,\cnt_1S_reg[28]_i_1_n_2 ,\cnt_1S_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[28]_i_1_n_4 ,\cnt_1S_reg[28]_i_1_n_5 ,\cnt_1S_reg[28]_i_1_n_6 ,\cnt_1S_reg[28]_i_1_n_7 }),
        .S({\cnt_1S[28]_i_2_n_0 ,\cnt_1S[28]_i_3_n_0 ,\cnt_1S[28]_i_4_n_0 ,\cnt_1S[28]_i_5_n_0 }));
  FDCE \cnt_1S_reg[29] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[28]_i_1_n_6 ),
        .Q(cnt_1S_reg[29]));
  FDCE \cnt_1S_reg[2] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[0]_i_2_n_5 ),
        .Q(cnt_1S_reg[2]));
  FDCE \cnt_1S_reg[30] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[28]_i_1_n_5 ),
        .Q(cnt_1S_reg[30]));
  FDCE \cnt_1S_reg[31] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[28]_i_1_n_4 ),
        .Q(cnt_1S_reg[31]));
  FDCE \cnt_1S_reg[3] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[0]_i_2_n_4 ),
        .Q(cnt_1S_reg[3]));
  FDCE \cnt_1S_reg[4] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[4]_i_1_n_7 ),
        .Q(cnt_1S_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[4]_i_1 
       (.CI(\cnt_1S_reg[0]_i_2_n_0 ),
        .CO({\cnt_1S_reg[4]_i_1_n_0 ,\cnt_1S_reg[4]_i_1_n_1 ,\cnt_1S_reg[4]_i_1_n_2 ,\cnt_1S_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[4]_i_1_n_4 ,\cnt_1S_reg[4]_i_1_n_5 ,\cnt_1S_reg[4]_i_1_n_6 ,\cnt_1S_reg[4]_i_1_n_7 }),
        .S({\cnt_1S[4]_i_2_n_0 ,\cnt_1S[4]_i_3_n_0 ,\cnt_1S[4]_i_4_n_0 ,\cnt_1S[4]_i_5_n_0 }));
  FDCE \cnt_1S_reg[5] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[4]_i_1_n_6 ),
        .Q(cnt_1S_reg[5]));
  FDCE \cnt_1S_reg[6] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[4]_i_1_n_5 ),
        .Q(cnt_1S_reg[6]));
  FDCE \cnt_1S_reg[7] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[4]_i_1_n_4 ),
        .Q(cnt_1S_reg[7]));
  FDCE \cnt_1S_reg[8] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[8]_i_1_n_7 ),
        .Q(cnt_1S_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1S_reg[8]_i_1 
       (.CI(\cnt_1S_reg[4]_i_1_n_0 ),
        .CO({\cnt_1S_reg[8]_i_1_n_0 ,\cnt_1S_reg[8]_i_1_n_1 ,\cnt_1S_reg[8]_i_1_n_2 ,\cnt_1S_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1S_reg[8]_i_1_n_4 ,\cnt_1S_reg[8]_i_1_n_5 ,\cnt_1S_reg[8]_i_1_n_6 ,\cnt_1S_reg[8]_i_1_n_7 }),
        .S({\cnt_1S[8]_i_2_n_0 ,\cnt_1S[8]_i_3_n_0 ,\cnt_1S[8]_i_4_n_0 ,\cnt_1S[8]_i_5_n_0 }));
  FDCE \cnt_1S_reg[9] 
       (.C(iClk),
        .CE(\cnt_1S[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1S_reg[8]_i_1_n_6 ),
        .Q(cnt_1S_reg[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008000)) 
    \cnt_1mS[0]_i_1 
       (.I0(\cnt_1mS[0]_i_3_n_0 ),
        .I1(\cnt_1mS[0]_i_4_n_0 ),
        .I2(\cnt_1mS[0]_i_5_n_0 ),
        .I3(\cnt_1mS[0]_i_6_n_0 ),
        .I4(\cnt_1uS[31]_i_3_n_0 ),
        .I5(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[0]_i_10 
       (.I0(cnt_1mS_reg[2]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[0]_i_11 
       (.I0(cnt_1mS_reg[1]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \cnt_1mS[0]_i_12 
       (.I0(cnt_1mS_reg[0]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000230023002300)) 
    \cnt_1mS[0]_i_13 
       (.I0(\cnt_1uS_reg_n_0_[7] ),
        .I1(\cnt_1uS_reg_n_0_[8] ),
        .I2(\cnt_1uS_reg_n_0_[6] ),
        .I3(\cnt_1uS_reg_n_0_[5] ),
        .I4(\cnt_1uS_reg_n_0_[4] ),
        .I5(\cnt_1uS_reg_n_0_[3] ),
        .O(\cnt_1mS[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1mS[0]_i_14 
       (.I0(\cnt_1uS_reg_n_0_[14] ),
        .I1(\cnt_1uS_reg_n_0_[13] ),
        .I2(\cnt_1uS_reg_n_0_[16] ),
        .I3(\cnt_1uS_reg_n_0_[17] ),
        .O(\cnt_1mS[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \cnt_1mS[0]_i_15 
       (.I0(\cnt_1uS_reg_n_0_[28] ),
        .I1(\cnt_1uS_reg_n_0_[29] ),
        .I2(\cnt_1uS_reg_n_0_[27] ),
        .I3(\cnt_1uS_reg_n_0_[25] ),
        .I4(\cnt_1uS_reg_n_0_[26] ),
        .I5(\cnt_1uS_reg_n_0_[24] ),
        .O(\cnt_1mS[0]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \cnt_1mS[0]_i_16 
       (.I0(\cnt_1uS_reg_n_0_[24] ),
        .I1(\cnt_1uS_reg_n_0_[27] ),
        .I2(\cnt_1uS_reg_n_0_[3] ),
        .I3(\cnt_1uS_reg_n_0_[6] ),
        .I4(\cnt_1uS[31]_i_5_n_0 ),
        .O(\cnt_1mS[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1mS[0]_i_17 
       (.I0(\cnt_1mS[0]_i_19_n_0 ),
        .I1(\cnt_1mS[0]_i_20_n_0 ),
        .I2(\cnt_1mS[0]_i_21_n_0 ),
        .I3(\cnt_1mS[0]_i_22_n_0 ),
        .O(\cnt_1mS[0]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \cnt_1mS[0]_i_18 
       (.I0(\cnt_1mS[0]_i_23_n_0 ),
        .I1(\cnt_1mS[0]_i_24_n_0 ),
        .I2(\cnt_1mS[0]_i_25_n_0 ),
        .I3(\cnt_1mS[0]_i_26_n_0 ),
        .O(\cnt_1mS[0]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1mS[0]_i_19 
       (.I0(cnt_1mS_reg[20]),
        .I1(cnt_1mS_reg[21]),
        .I2(cnt_1mS_reg[22]),
        .I3(cnt_1mS_reg[23]),
        .O(\cnt_1mS[0]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1mS[0]_i_20 
       (.I0(cnt_1mS_reg[16]),
        .I1(cnt_1mS_reg[17]),
        .I2(cnt_1mS_reg[18]),
        .I3(cnt_1mS_reg[19]),
        .O(\cnt_1mS[0]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1mS[0]_i_21 
       (.I0(cnt_1mS_reg[28]),
        .I1(cnt_1mS_reg[29]),
        .I2(cnt_1mS_reg[31]),
        .I3(cnt_1mS_reg[30]),
        .O(\cnt_1mS[0]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1mS[0]_i_22 
       (.I0(cnt_1mS_reg[24]),
        .I1(cnt_1mS_reg[25]),
        .I2(cnt_1mS_reg[26]),
        .I3(cnt_1mS_reg[27]),
        .O(\cnt_1mS[0]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1mS[0]_i_23 
       (.I0(cnt_1mS_reg[7]),
        .I1(cnt_1mS_reg[6]),
        .I2(cnt_1mS_reg[4]),
        .I3(cnt_1mS_reg[5]),
        .O(\cnt_1mS[0]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \cnt_1mS[0]_i_24 
       (.I0(cnt_1mS_reg[1]),
        .I1(cnt_1mS_reg[0]),
        .I2(cnt_1mS_reg[3]),
        .I3(cnt_1mS_reg[2]),
        .O(\cnt_1mS[0]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \cnt_1mS[0]_i_25 
       (.I0(cnt_1mS_reg[11]),
        .I1(cnt_1mS_reg[10]),
        .I2(cnt_1mS_reg[9]),
        .I3(cnt_1mS_reg[8]),
        .O(\cnt_1mS[0]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1mS[0]_i_26 
       (.I0(cnt_1mS_reg[15]),
        .I1(cnt_1mS_reg[14]),
        .I2(cnt_1mS_reg[13]),
        .I3(cnt_1mS_reg[12]),
        .O(\cnt_1mS[0]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \cnt_1mS[0]_i_3 
       (.I0(\cnt_1mS[0]_i_13_n_0 ),
        .I1(\cnt_1mS[0]_i_14_n_0 ),
        .I2(\cnt_1uS_reg_n_0_[8] ),
        .I3(\cnt_1uS_reg_n_0_[11] ),
        .I4(\cnt_1uS_reg_n_0_[10] ),
        .I5(\cnt_1uS[31]_i_5_n_0 ),
        .O(\cnt_1mS[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \cnt_1mS[0]_i_4 
       (.I0(\cnt_1uS_reg_n_0_[13] ),
        .I1(\cnt_1uS_reg_n_0_[14] ),
        .I2(\cnt_1uS_reg_n_0_[12] ),
        .I3(\cnt_1uS_reg_n_0_[10] ),
        .I4(\cnt_1uS_reg_n_0_[11] ),
        .I5(\cnt_1uS_reg_n_0_[9] ),
        .O(\cnt_1mS[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \cnt_1mS[0]_i_5 
       (.I0(\cnt_1uS_reg_n_0_[19] ),
        .I1(\cnt_1uS_reg_n_0_[20] ),
        .I2(\cnt_1uS_reg_n_0_[18] ),
        .I3(\cnt_1uS_reg_n_0_[16] ),
        .I4(\cnt_1uS_reg_n_0_[17] ),
        .I5(\cnt_1uS_reg_n_0_[15] ),
        .O(\cnt_1mS[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \cnt_1mS[0]_i_6 
       (.I0(\cnt_1mS[0]_i_15_n_0 ),
        .I1(\cnt_1uS_reg_n_0_[21] ),
        .I2(\cnt_1uS_reg_n_0_[23] ),
        .I3(\cnt_1uS_reg_n_0_[22] ),
        .I4(\cnt_1uS_reg_n_0_[20] ),
        .I5(\cnt_1uS_reg_n_0_[19] ),
        .O(\cnt_1mS[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \cnt_1mS[0]_i_7 
       (.I0(\cnt_1mS[0]_i_16_n_0 ),
        .I1(\cnt_1uS[31]_i_2_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_3_n_0 ),
        .I4(\cnt_1mS[0]_i_17_n_0 ),
        .I5(\cnt_1mS[0]_i_18_n_0 ),
        .O(cnt_1mS1__44));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[0]_i_8 
       (.I0(cnt_1mS_reg[0]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[0]_i_9 
       (.I0(cnt_1mS_reg[3]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[12]_i_2 
       (.I0(cnt_1mS_reg[15]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[12]_i_3 
       (.I0(cnt_1mS_reg[14]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[12]_i_4 
       (.I0(cnt_1mS_reg[13]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[12]_i_5 
       (.I0(cnt_1mS_reg[12]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[16]_i_2 
       (.I0(cnt_1mS_reg[19]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[16]_i_3 
       (.I0(cnt_1mS_reg[18]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[16]_i_4 
       (.I0(cnt_1mS_reg[17]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[16]_i_5 
       (.I0(cnt_1mS_reg[16]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[20]_i_2 
       (.I0(cnt_1mS_reg[23]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[20]_i_3 
       (.I0(cnt_1mS_reg[22]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[20]_i_4 
       (.I0(cnt_1mS_reg[21]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[20]_i_5 
       (.I0(cnt_1mS_reg[20]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[24]_i_2 
       (.I0(cnt_1mS_reg[27]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[24]_i_3 
       (.I0(cnt_1mS_reg[26]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[24]_i_4 
       (.I0(cnt_1mS_reg[25]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[24]_i_5 
       (.I0(cnt_1mS_reg[24]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[28]_i_2 
       (.I0(cnt_1mS_reg[31]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[28]_i_3 
       (.I0(cnt_1mS_reg[30]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[28]_i_4 
       (.I0(cnt_1mS_reg[29]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[28]_i_5 
       (.I0(cnt_1mS_reg[28]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[4]_i_2 
       (.I0(cnt_1mS_reg[7]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[4]_i_3 
       (.I0(cnt_1mS_reg[6]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[4]_i_4 
       (.I0(cnt_1mS_reg[5]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[4]_i_5 
       (.I0(cnt_1mS_reg[4]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[8]_i_2 
       (.I0(cnt_1mS_reg[11]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[8]_i_3 
       (.I0(cnt_1mS_reg[10]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[8]_i_4 
       (.I0(cnt_1mS_reg[9]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1mS[8]_i_5 
       (.I0(cnt_1mS_reg[8]),
        .I1(cnt_1mS1__44),
        .O(\cnt_1mS[8]_i_5_n_0 ));
  FDCE \cnt_1mS_reg[0] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[0]_i_2_n_7 ),
        .Q(cnt_1mS_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cnt_1mS_reg[0]_i_2_n_0 ,\cnt_1mS_reg[0]_i_2_n_1 ,\cnt_1mS_reg[0]_i_2_n_2 ,\cnt_1mS_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\cnt_1mS[0]_i_8_n_0 }),
        .O({\cnt_1mS_reg[0]_i_2_n_4 ,\cnt_1mS_reg[0]_i_2_n_5 ,\cnt_1mS_reg[0]_i_2_n_6 ,\cnt_1mS_reg[0]_i_2_n_7 }),
        .S({\cnt_1mS[0]_i_9_n_0 ,\cnt_1mS[0]_i_10_n_0 ,\cnt_1mS[0]_i_11_n_0 ,\cnt_1mS[0]_i_12_n_0 }));
  FDCE \cnt_1mS_reg[10] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[8]_i_1_n_5 ),
        .Q(cnt_1mS_reg[10]));
  FDCE \cnt_1mS_reg[11] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[8]_i_1_n_4 ),
        .Q(cnt_1mS_reg[11]));
  FDCE \cnt_1mS_reg[12] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[12]_i_1_n_7 ),
        .Q(cnt_1mS_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[12]_i_1 
       (.CI(\cnt_1mS_reg[8]_i_1_n_0 ),
        .CO({\cnt_1mS_reg[12]_i_1_n_0 ,\cnt_1mS_reg[12]_i_1_n_1 ,\cnt_1mS_reg[12]_i_1_n_2 ,\cnt_1mS_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[12]_i_1_n_4 ,\cnt_1mS_reg[12]_i_1_n_5 ,\cnt_1mS_reg[12]_i_1_n_6 ,\cnt_1mS_reg[12]_i_1_n_7 }),
        .S({\cnt_1mS[12]_i_2_n_0 ,\cnt_1mS[12]_i_3_n_0 ,\cnt_1mS[12]_i_4_n_0 ,\cnt_1mS[12]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[13] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[12]_i_1_n_6 ),
        .Q(cnt_1mS_reg[13]));
  FDCE \cnt_1mS_reg[14] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[12]_i_1_n_5 ),
        .Q(cnt_1mS_reg[14]));
  FDCE \cnt_1mS_reg[15] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[12]_i_1_n_4 ),
        .Q(cnt_1mS_reg[15]));
  FDCE \cnt_1mS_reg[16] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[16]_i_1_n_7 ),
        .Q(cnt_1mS_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[16]_i_1 
       (.CI(\cnt_1mS_reg[12]_i_1_n_0 ),
        .CO({\cnt_1mS_reg[16]_i_1_n_0 ,\cnt_1mS_reg[16]_i_1_n_1 ,\cnt_1mS_reg[16]_i_1_n_2 ,\cnt_1mS_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[16]_i_1_n_4 ,\cnt_1mS_reg[16]_i_1_n_5 ,\cnt_1mS_reg[16]_i_1_n_6 ,\cnt_1mS_reg[16]_i_1_n_7 }),
        .S({\cnt_1mS[16]_i_2_n_0 ,\cnt_1mS[16]_i_3_n_0 ,\cnt_1mS[16]_i_4_n_0 ,\cnt_1mS[16]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[17] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[16]_i_1_n_6 ),
        .Q(cnt_1mS_reg[17]));
  FDCE \cnt_1mS_reg[18] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[16]_i_1_n_5 ),
        .Q(cnt_1mS_reg[18]));
  FDCE \cnt_1mS_reg[19] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[16]_i_1_n_4 ),
        .Q(cnt_1mS_reg[19]));
  FDCE \cnt_1mS_reg[1] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[0]_i_2_n_6 ),
        .Q(cnt_1mS_reg[1]));
  FDCE \cnt_1mS_reg[20] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[20]_i_1_n_7 ),
        .Q(cnt_1mS_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[20]_i_1 
       (.CI(\cnt_1mS_reg[16]_i_1_n_0 ),
        .CO({\cnt_1mS_reg[20]_i_1_n_0 ,\cnt_1mS_reg[20]_i_1_n_1 ,\cnt_1mS_reg[20]_i_1_n_2 ,\cnt_1mS_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[20]_i_1_n_4 ,\cnt_1mS_reg[20]_i_1_n_5 ,\cnt_1mS_reg[20]_i_1_n_6 ,\cnt_1mS_reg[20]_i_1_n_7 }),
        .S({\cnt_1mS[20]_i_2_n_0 ,\cnt_1mS[20]_i_3_n_0 ,\cnt_1mS[20]_i_4_n_0 ,\cnt_1mS[20]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[21] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[20]_i_1_n_6 ),
        .Q(cnt_1mS_reg[21]));
  FDCE \cnt_1mS_reg[22] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[20]_i_1_n_5 ),
        .Q(cnt_1mS_reg[22]));
  FDCE \cnt_1mS_reg[23] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[20]_i_1_n_4 ),
        .Q(cnt_1mS_reg[23]));
  FDCE \cnt_1mS_reg[24] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[24]_i_1_n_7 ),
        .Q(cnt_1mS_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[24]_i_1 
       (.CI(\cnt_1mS_reg[20]_i_1_n_0 ),
        .CO({\cnt_1mS_reg[24]_i_1_n_0 ,\cnt_1mS_reg[24]_i_1_n_1 ,\cnt_1mS_reg[24]_i_1_n_2 ,\cnt_1mS_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[24]_i_1_n_4 ,\cnt_1mS_reg[24]_i_1_n_5 ,\cnt_1mS_reg[24]_i_1_n_6 ,\cnt_1mS_reg[24]_i_1_n_7 }),
        .S({\cnt_1mS[24]_i_2_n_0 ,\cnt_1mS[24]_i_3_n_0 ,\cnt_1mS[24]_i_4_n_0 ,\cnt_1mS[24]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[25] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[24]_i_1_n_6 ),
        .Q(cnt_1mS_reg[25]));
  FDCE \cnt_1mS_reg[26] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[24]_i_1_n_5 ),
        .Q(cnt_1mS_reg[26]));
  FDCE \cnt_1mS_reg[27] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[24]_i_1_n_4 ),
        .Q(cnt_1mS_reg[27]));
  FDCE \cnt_1mS_reg[28] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[28]_i_1_n_7 ),
        .Q(cnt_1mS_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[28]_i_1 
       (.CI(\cnt_1mS_reg[24]_i_1_n_0 ),
        .CO({\NLW_cnt_1mS_reg[28]_i_1_CO_UNCONNECTED [3],\cnt_1mS_reg[28]_i_1_n_1 ,\cnt_1mS_reg[28]_i_1_n_2 ,\cnt_1mS_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[28]_i_1_n_4 ,\cnt_1mS_reg[28]_i_1_n_5 ,\cnt_1mS_reg[28]_i_1_n_6 ,\cnt_1mS_reg[28]_i_1_n_7 }),
        .S({\cnt_1mS[28]_i_2_n_0 ,\cnt_1mS[28]_i_3_n_0 ,\cnt_1mS[28]_i_4_n_0 ,\cnt_1mS[28]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[29] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[28]_i_1_n_6 ),
        .Q(cnt_1mS_reg[29]));
  FDCE \cnt_1mS_reg[2] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[0]_i_2_n_5 ),
        .Q(cnt_1mS_reg[2]));
  FDCE \cnt_1mS_reg[30] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[28]_i_1_n_5 ),
        .Q(cnt_1mS_reg[30]));
  FDCE \cnt_1mS_reg[31] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[28]_i_1_n_4 ),
        .Q(cnt_1mS_reg[31]));
  FDCE \cnt_1mS_reg[3] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[0]_i_2_n_4 ),
        .Q(cnt_1mS_reg[3]));
  FDCE \cnt_1mS_reg[4] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[4]_i_1_n_7 ),
        .Q(cnt_1mS_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[4]_i_1 
       (.CI(\cnt_1mS_reg[0]_i_2_n_0 ),
        .CO({\cnt_1mS_reg[4]_i_1_n_0 ,\cnt_1mS_reg[4]_i_1_n_1 ,\cnt_1mS_reg[4]_i_1_n_2 ,\cnt_1mS_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[4]_i_1_n_4 ,\cnt_1mS_reg[4]_i_1_n_5 ,\cnt_1mS_reg[4]_i_1_n_6 ,\cnt_1mS_reg[4]_i_1_n_7 }),
        .S({\cnt_1mS[4]_i_2_n_0 ,\cnt_1mS[4]_i_3_n_0 ,\cnt_1mS[4]_i_4_n_0 ,\cnt_1mS[4]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[5] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[4]_i_1_n_6 ),
        .Q(cnt_1mS_reg[5]));
  FDCE \cnt_1mS_reg[6] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[4]_i_1_n_5 ),
        .Q(cnt_1mS_reg[6]));
  FDCE \cnt_1mS_reg[7] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[4]_i_1_n_4 ),
        .Q(cnt_1mS_reg[7]));
  FDCE \cnt_1mS_reg[8] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[8]_i_1_n_7 ),
        .Q(cnt_1mS_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_1mS_reg[8]_i_1 
       (.CI(\cnt_1mS_reg[4]_i_1_n_0 ),
        .CO({\cnt_1mS_reg[8]_i_1_n_0 ,\cnt_1mS_reg[8]_i_1_n_1 ,\cnt_1mS_reg[8]_i_1_n_2 ,\cnt_1mS_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_1mS_reg[8]_i_1_n_4 ,\cnt_1mS_reg[8]_i_1_n_5 ,\cnt_1mS_reg[8]_i_1_n_6 ,\cnt_1mS_reg[8]_i_1_n_7 }),
        .S({\cnt_1mS[8]_i_2_n_0 ,\cnt_1mS[8]_i_3_n_0 ,\cnt_1mS[8]_i_4_n_0 ,\cnt_1mS[8]_i_5_n_0 }));
  FDCE \cnt_1mS_reg[9] 
       (.C(iClk),
        .CE(\cnt_1mS[0]_i_1_n_0 ),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\cnt_1mS_reg[8]_i_1_n_6 ),
        .Q(cnt_1mS_reg[9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry
       (.CI(1'b0),
        .CO({cnt_1uS0_carry_n_0,cnt_1uS0_carry_n_1,cnt_1uS0_carry_n_2,cnt_1uS0_carry_n_3}),
        .CYINIT(\cnt_1uS_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\cnt_1uS_reg_n_0_[4] ,\cnt_1uS_reg_n_0_[3] ,\cnt_1uS_reg_n_0_[2] ,\cnt_1uS_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__0
       (.CI(cnt_1uS0_carry_n_0),
        .CO({cnt_1uS0_carry__0_n_0,cnt_1uS0_carry__0_n_1,cnt_1uS0_carry__0_n_2,cnt_1uS0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\cnt_1uS_reg_n_0_[8] ,\cnt_1uS_reg_n_0_[7] ,\cnt_1uS_reg_n_0_[6] ,\cnt_1uS_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__1
       (.CI(cnt_1uS0_carry__0_n_0),
        .CO({cnt_1uS0_carry__1_n_0,cnt_1uS0_carry__1_n_1,cnt_1uS0_carry__1_n_2,cnt_1uS0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S({\cnt_1uS_reg_n_0_[12] ,\cnt_1uS_reg_n_0_[11] ,\cnt_1uS_reg_n_0_[10] ,\cnt_1uS_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__2
       (.CI(cnt_1uS0_carry__1_n_0),
        .CO({cnt_1uS0_carry__2_n_0,cnt_1uS0_carry__2_n_1,cnt_1uS0_carry__2_n_2,cnt_1uS0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S({\cnt_1uS_reg_n_0_[16] ,\cnt_1uS_reg_n_0_[15] ,\cnt_1uS_reg_n_0_[14] ,\cnt_1uS_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__3
       (.CI(cnt_1uS0_carry__2_n_0),
        .CO({cnt_1uS0_carry__3_n_0,cnt_1uS0_carry__3_n_1,cnt_1uS0_carry__3_n_2,cnt_1uS0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S({\cnt_1uS_reg_n_0_[20] ,\cnt_1uS_reg_n_0_[19] ,\cnt_1uS_reg_n_0_[18] ,\cnt_1uS_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__4
       (.CI(cnt_1uS0_carry__3_n_0),
        .CO({cnt_1uS0_carry__4_n_0,cnt_1uS0_carry__4_n_1,cnt_1uS0_carry__4_n_2,cnt_1uS0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S({\cnt_1uS_reg_n_0_[24] ,\cnt_1uS_reg_n_0_[23] ,\cnt_1uS_reg_n_0_[22] ,\cnt_1uS_reg_n_0_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__5
       (.CI(cnt_1uS0_carry__4_n_0),
        .CO({cnt_1uS0_carry__5_n_0,cnt_1uS0_carry__5_n_1,cnt_1uS0_carry__5_n_2,cnt_1uS0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S({\cnt_1uS_reg_n_0_[28] ,\cnt_1uS_reg_n_0_[27] ,\cnt_1uS_reg_n_0_[26] ,\cnt_1uS_reg_n_0_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_1uS0_carry__6
       (.CI(cnt_1uS0_carry__5_n_0),
        .CO({NLW_cnt_1uS0_carry__6_CO_UNCONNECTED[3:2],cnt_1uS0_carry__6_n_2,cnt_1uS0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_cnt_1uS0_carry__6_O_UNCONNECTED[3],data0[31:29]}),
        .S({1'b0,\cnt_1uS_reg_n_0_[31] ,\cnt_1uS_reg_n_0_[30] ,\cnt_1uS_reg_n_0_[29] }));
  LUT6 #(
    .INIT(64'h00000000FFFEFFFF)) 
    \cnt_1uS[0]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(\cnt_1uS_reg_n_0_[0] ),
        .O(cnt_1uS[0]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[10]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[10]),
        .O(cnt_1uS[10]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[11]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[11]),
        .O(cnt_1uS[11]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[12]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[12]),
        .O(cnt_1uS[12]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[13]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[13]),
        .O(cnt_1uS[13]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[14]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[14]),
        .O(cnt_1uS[14]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[15]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[15]),
        .O(cnt_1uS[15]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[16]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[16]),
        .O(cnt_1uS[16]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[17]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[17]),
        .O(cnt_1uS[17]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[18]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[18]),
        .O(cnt_1uS[18]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[19]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[19]),
        .O(cnt_1uS[19]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[1]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[1]),
        .O(cnt_1uS[1]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[20]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[20]),
        .O(cnt_1uS[20]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[21]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[21]),
        .O(cnt_1uS[21]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[22]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[22]),
        .O(cnt_1uS[22]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[23]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[23]),
        .O(cnt_1uS[23]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[24]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[24]),
        .O(cnt_1uS[24]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[25]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[25]),
        .O(cnt_1uS[25]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[26]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[26]),
        .O(cnt_1uS[26]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[27]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[27]),
        .O(cnt_1uS[27]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[28]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[28]),
        .O(cnt_1uS[28]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[29]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[29]),
        .O(cnt_1uS[29]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[2]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[2]),
        .O(cnt_1uS[2]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[30]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[30]),
        .O(cnt_1uS[30]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[31]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[31]),
        .O(cnt_1uS[31]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt_1uS[31]_i_2 
       (.I0(\cnt_1uS_reg_n_0_[19] ),
        .I1(\cnt_1uS_reg_n_0_[18] ),
        .I2(\cnt_1uS_reg_n_0_[17] ),
        .I3(\cnt_1uS_reg_n_0_[16] ),
        .I4(\cnt_1uS[31]_i_7_n_0 ),
        .O(\cnt_1uS[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cnt_1uS[31]_i_3 
       (.I0(\cnt_1uS_reg_n_0_[26] ),
        .I1(\cnt_1uS_reg_n_0_[25] ),
        .I2(\cnt_1uS_reg_n_0_[29] ),
        .I3(\cnt_1uS_reg_n_0_[28] ),
        .I4(\cnt_1uS_reg_n_0_[31] ),
        .I5(\cnt_1uS_reg_n_0_[30] ),
        .O(\cnt_1uS[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt_1uS[31]_i_4 
       (.I0(\cnt_1uS_reg_n_0_[11] ),
        .I1(\cnt_1uS_reg_n_0_[10] ),
        .I2(\cnt_1uS_reg_n_0_[9] ),
        .I3(\cnt_1uS_reg_n_0_[8] ),
        .I4(\cnt_1uS[31]_i_8_n_0 ),
        .O(\cnt_1uS[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    \cnt_1uS[31]_i_5 
       (.I0(\cnt_1uS_reg_n_0_[5] ),
        .I1(\cnt_1uS_reg_n_0_[4] ),
        .I2(\cnt_1uS_reg_n_0_[7] ),
        .I3(\cnt_1uS_reg_n_0_[1] ),
        .I4(\cnt_1uS_reg_n_0_[2] ),
        .I5(\cnt_1uS_reg_n_0_[0] ),
        .O(\cnt_1uS[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt_1uS[31]_i_6 
       (.I0(\cnt_1uS_reg_n_0_[6] ),
        .I1(\cnt_1uS_reg_n_0_[3] ),
        .I2(\cnt_1uS_reg_n_0_[27] ),
        .I3(\cnt_1uS_reg_n_0_[24] ),
        .O(\cnt_1uS[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1uS[31]_i_7 
       (.I0(\cnt_1uS_reg_n_0_[20] ),
        .I1(\cnt_1uS_reg_n_0_[21] ),
        .I2(\cnt_1uS_reg_n_0_[22] ),
        .I3(\cnt_1uS_reg_n_0_[23] ),
        .O(\cnt_1uS[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1uS[31]_i_8 
       (.I0(\cnt_1uS_reg_n_0_[12] ),
        .I1(\cnt_1uS_reg_n_0_[13] ),
        .I2(\cnt_1uS_reg_n_0_[14] ),
        .I3(\cnt_1uS_reg_n_0_[15] ),
        .O(\cnt_1uS[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[3]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[3]),
        .O(cnt_1uS[3]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[4]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[4]),
        .O(cnt_1uS[4]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[5]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[5]),
        .O(cnt_1uS[5]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[6]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[6]),
        .O(cnt_1uS[6]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[7]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[7]),
        .O(cnt_1uS[7]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[8]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[8]),
        .O(cnt_1uS[8]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \cnt_1uS[9]_i_1 
       (.I0(\cnt_1uS[31]_i_2_n_0 ),
        .I1(\cnt_1uS[31]_i_3_n_0 ),
        .I2(\cnt_1uS[31]_i_4_n_0 ),
        .I3(\cnt_1uS[31]_i_5_n_0 ),
        .I4(\cnt_1uS[31]_i_6_n_0 ),
        .I5(data0[9]),
        .O(cnt_1uS[9]));
  FDCE \cnt_1uS_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[0]),
        .Q(\cnt_1uS_reg_n_0_[0] ));
  FDCE \cnt_1uS_reg[10] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[10]),
        .Q(\cnt_1uS_reg_n_0_[10] ));
  FDCE \cnt_1uS_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[11]),
        .Q(\cnt_1uS_reg_n_0_[11] ));
  FDCE \cnt_1uS_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[12]),
        .Q(\cnt_1uS_reg_n_0_[12] ));
  FDCE \cnt_1uS_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[13]),
        .Q(\cnt_1uS_reg_n_0_[13] ));
  FDCE \cnt_1uS_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[14]),
        .Q(\cnt_1uS_reg_n_0_[14] ));
  FDCE \cnt_1uS_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[15]),
        .Q(\cnt_1uS_reg_n_0_[15] ));
  FDCE \cnt_1uS_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[16]),
        .Q(\cnt_1uS_reg_n_0_[16] ));
  FDCE \cnt_1uS_reg[17] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[17]),
        .Q(\cnt_1uS_reg_n_0_[17] ));
  FDCE \cnt_1uS_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[18]),
        .Q(\cnt_1uS_reg_n_0_[18] ));
  FDCE \cnt_1uS_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[19]),
        .Q(\cnt_1uS_reg_n_0_[19] ));
  FDCE \cnt_1uS_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[1]),
        .Q(\cnt_1uS_reg_n_0_[1] ));
  FDCE \cnt_1uS_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[20]),
        .Q(\cnt_1uS_reg_n_0_[20] ));
  FDCE \cnt_1uS_reg[21] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[21]),
        .Q(\cnt_1uS_reg_n_0_[21] ));
  FDCE \cnt_1uS_reg[22] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[22]),
        .Q(\cnt_1uS_reg_n_0_[22] ));
  FDCE \cnt_1uS_reg[23] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[23]),
        .Q(\cnt_1uS_reg_n_0_[23] ));
  FDCE \cnt_1uS_reg[24] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[24]),
        .Q(\cnt_1uS_reg_n_0_[24] ));
  FDCE \cnt_1uS_reg[25] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[25]),
        .Q(\cnt_1uS_reg_n_0_[25] ));
  FDCE \cnt_1uS_reg[26] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[26]),
        .Q(\cnt_1uS_reg_n_0_[26] ));
  FDCE \cnt_1uS_reg[27] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[27]),
        .Q(\cnt_1uS_reg_n_0_[27] ));
  FDCE \cnt_1uS_reg[28] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[28]),
        .Q(\cnt_1uS_reg_n_0_[28] ));
  FDCE \cnt_1uS_reg[29] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[29]),
        .Q(\cnt_1uS_reg_n_0_[29] ));
  FDCE \cnt_1uS_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[2]),
        .Q(\cnt_1uS_reg_n_0_[2] ));
  FDCE \cnt_1uS_reg[30] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[30]),
        .Q(\cnt_1uS_reg_n_0_[30] ));
  FDCE \cnt_1uS_reg[31] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[31]),
        .Q(\cnt_1uS_reg_n_0_[31] ));
  FDCE \cnt_1uS_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[3]),
        .Q(\cnt_1uS_reg_n_0_[3] ));
  FDCE \cnt_1uS_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[4]),
        .Q(\cnt_1uS_reg_n_0_[4] ));
  FDCE \cnt_1uS_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[5]),
        .Q(\cnt_1uS_reg_n_0_[5] ));
  FDCE \cnt_1uS_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[6]),
        .Q(\cnt_1uS_reg_n_0_[6] ));
  FDCE \cnt_1uS_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[7]),
        .Q(\cnt_1uS_reg_n_0_[7] ));
  FDCE \cnt_1uS_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[8]),
        .Q(\cnt_1uS_reg_n_0_[8] ));
  FDCE \cnt_1uS_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(cnt_1uS[9]),
        .Q(\cnt_1uS_reg_n_0_[9] ));
  LUT3 #(
    .INIT(8'hB8)) 
    \oLED_r[0]_i_1 
       (.I0(oLED_r_reg2),
        .I1(on_off_flag),
        .I2(oLED_r_reg20_in),
        .O(\oLED_r[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \oLED_r[1]_i_1 
       (.I0(iNewDataUpdate),
        .I1(oLED[1]),
        .O(\oLED_r[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \oLED_r[1]_i_2 
       (.I0(iRst_N),
        .O(\oLED_r[1]_i_2_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2__15_carry
       (.CI(1'b0),
        .CO({oLED_r_reg2__15_carry_n_0,oLED_r_reg2__15_carry_n_1,oLED_r_reg2__15_carry_n_2,oLED_r_reg2__15_carry_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2__15_carry_i_1_n_0,oLED_r_reg2__15_carry_i_2_n_0,oLED_r_reg2__15_carry_i_3_n_0,oLED_r_reg2__15_carry_i_4_n_0}),
        .O(NLW_oLED_r_reg2__15_carry_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2__15_carry_i_5_n_0,oLED_r_reg2__15_carry_i_6_n_0,oLED_r_reg2__15_carry_i_7_n_0,oLED_r_reg2__15_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2__15_carry__0
       (.CI(oLED_r_reg2__15_carry_n_0),
        .CO({oLED_r_reg2__15_carry__0_n_0,oLED_r_reg2__15_carry__0_n_1,oLED_r_reg2__15_carry__0_n_2,oLED_r_reg2__15_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2__15_carry__0_i_1_n_0,oLED_r_reg2__15_carry__0_i_2_n_0,oLED_r_reg2__15_carry__0_i_3_n_0,oLED_r_reg2__15_carry__0_i_4_n_0}),
        .O(NLW_oLED_r_reg2__15_carry__0_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2__15_carry__0_i_5_n_0,oLED_r_reg2__15_carry__0_i_6_n_0,oLED_r_reg2__15_carry__0_i_7_n_0,oLED_r_reg2__15_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__0_i_1
       (.I0(cnt_1S_reg[14]),
        .I1(cnt_1mS_reg[14]),
        .I2(cnt_1mS_reg[15]),
        .I3(cnt_1S_reg[15]),
        .O(oLED_r_reg2__15_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__0_i_2
       (.I0(cnt_1S_reg[12]),
        .I1(cnt_1mS_reg[12]),
        .I2(cnt_1mS_reg[13]),
        .I3(cnt_1S_reg[13]),
        .O(oLED_r_reg2__15_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__0_i_3
       (.I0(cnt_1S_reg[10]),
        .I1(cnt_1mS_reg[10]),
        .I2(cnt_1mS_reg[11]),
        .I3(cnt_1S_reg[11]),
        .O(oLED_r_reg2__15_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__0_i_4
       (.I0(cnt_1S_reg[8]),
        .I1(cnt_1mS_reg[8]),
        .I2(cnt_1mS_reg[9]),
        .I3(cnt_1S_reg[9]),
        .O(oLED_r_reg2__15_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__0_i_5
       (.I0(cnt_1mS_reg[14]),
        .I1(cnt_1S_reg[14]),
        .I2(cnt_1mS_reg[15]),
        .I3(cnt_1S_reg[15]),
        .O(oLED_r_reg2__15_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__0_i_6
       (.I0(cnt_1mS_reg[12]),
        .I1(cnt_1S_reg[12]),
        .I2(cnt_1mS_reg[13]),
        .I3(cnt_1S_reg[13]),
        .O(oLED_r_reg2__15_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__0_i_7
       (.I0(cnt_1mS_reg[10]),
        .I1(cnt_1S_reg[10]),
        .I2(cnt_1mS_reg[11]),
        .I3(cnt_1S_reg[11]),
        .O(oLED_r_reg2__15_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__0_i_8
       (.I0(cnt_1mS_reg[8]),
        .I1(cnt_1S_reg[8]),
        .I2(cnt_1mS_reg[9]),
        .I3(cnt_1S_reg[9]),
        .O(oLED_r_reg2__15_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2__15_carry__1
       (.CI(oLED_r_reg2__15_carry__0_n_0),
        .CO({oLED_r_reg2__15_carry__1_n_0,oLED_r_reg2__15_carry__1_n_1,oLED_r_reg2__15_carry__1_n_2,oLED_r_reg2__15_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2__15_carry__1_i_1_n_0,oLED_r_reg2__15_carry__1_i_2_n_0,oLED_r_reg2__15_carry__1_i_3_n_0,oLED_r_reg2__15_carry__1_i_4_n_0}),
        .O(NLW_oLED_r_reg2__15_carry__1_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2__15_carry__1_i_5_n_0,oLED_r_reg2__15_carry__1_i_6_n_0,oLED_r_reg2__15_carry__1_i_7_n_0,oLED_r_reg2__15_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__1_i_1
       (.I0(cnt_1S_reg[22]),
        .I1(cnt_1mS_reg[22]),
        .I2(cnt_1mS_reg[23]),
        .I3(cnt_1S_reg[23]),
        .O(oLED_r_reg2__15_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__1_i_2
       (.I0(cnt_1S_reg[20]),
        .I1(cnt_1mS_reg[20]),
        .I2(cnt_1mS_reg[21]),
        .I3(cnt_1S_reg[21]),
        .O(oLED_r_reg2__15_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__1_i_3
       (.I0(cnt_1S_reg[18]),
        .I1(cnt_1mS_reg[18]),
        .I2(cnt_1mS_reg[19]),
        .I3(cnt_1S_reg[19]),
        .O(oLED_r_reg2__15_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__1_i_4
       (.I0(cnt_1S_reg[16]),
        .I1(cnt_1mS_reg[16]),
        .I2(cnt_1mS_reg[17]),
        .I3(cnt_1S_reg[17]),
        .O(oLED_r_reg2__15_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__1_i_5
       (.I0(cnt_1mS_reg[22]),
        .I1(cnt_1S_reg[22]),
        .I2(cnt_1mS_reg[23]),
        .I3(cnt_1S_reg[23]),
        .O(oLED_r_reg2__15_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__1_i_6
       (.I0(cnt_1mS_reg[20]),
        .I1(cnt_1S_reg[20]),
        .I2(cnt_1mS_reg[21]),
        .I3(cnt_1S_reg[21]),
        .O(oLED_r_reg2__15_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__1_i_7
       (.I0(cnt_1mS_reg[18]),
        .I1(cnt_1S_reg[18]),
        .I2(cnt_1mS_reg[19]),
        .I3(cnt_1S_reg[19]),
        .O(oLED_r_reg2__15_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__1_i_8
       (.I0(cnt_1mS_reg[16]),
        .I1(cnt_1S_reg[16]),
        .I2(cnt_1mS_reg[17]),
        .I3(cnt_1S_reg[17]),
        .O(oLED_r_reg2__15_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2__15_carry__2
       (.CI(oLED_r_reg2__15_carry__1_n_0),
        .CO({oLED_r_reg20_in,oLED_r_reg2__15_carry__2_n_1,oLED_r_reg2__15_carry__2_n_2,oLED_r_reg2__15_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2__15_carry__2_i_1_n_0,oLED_r_reg2__15_carry__2_i_2_n_0,oLED_r_reg2__15_carry__2_i_3_n_0,oLED_r_reg2__15_carry__2_i_4_n_0}),
        .O(NLW_oLED_r_reg2__15_carry__2_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2__15_carry__2_i_5_n_0,oLED_r_reg2__15_carry__2_i_6_n_0,oLED_r_reg2__15_carry__2_i_7_n_0,oLED_r_reg2__15_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__2_i_1
       (.I0(cnt_1S_reg[30]),
        .I1(cnt_1mS_reg[30]),
        .I2(cnt_1mS_reg[31]),
        .I3(cnt_1S_reg[31]),
        .O(oLED_r_reg2__15_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__2_i_2
       (.I0(cnt_1S_reg[28]),
        .I1(cnt_1mS_reg[28]),
        .I2(cnt_1mS_reg[29]),
        .I3(cnt_1S_reg[29]),
        .O(oLED_r_reg2__15_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__2_i_3
       (.I0(cnt_1S_reg[26]),
        .I1(cnt_1mS_reg[26]),
        .I2(cnt_1mS_reg[27]),
        .I3(cnt_1S_reg[27]),
        .O(oLED_r_reg2__15_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry__2_i_4
       (.I0(cnt_1S_reg[24]),
        .I1(cnt_1mS_reg[24]),
        .I2(cnt_1mS_reg[25]),
        .I3(cnt_1S_reg[25]),
        .O(oLED_r_reg2__15_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__2_i_5
       (.I0(cnt_1mS_reg[30]),
        .I1(cnt_1S_reg[30]),
        .I2(cnt_1mS_reg[31]),
        .I3(cnt_1S_reg[31]),
        .O(oLED_r_reg2__15_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__2_i_6
       (.I0(cnt_1mS_reg[28]),
        .I1(cnt_1S_reg[28]),
        .I2(cnt_1mS_reg[29]),
        .I3(cnt_1S_reg[29]),
        .O(oLED_r_reg2__15_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__2_i_7
       (.I0(cnt_1mS_reg[26]),
        .I1(cnt_1S_reg[26]),
        .I2(cnt_1mS_reg[27]),
        .I3(cnt_1S_reg[27]),
        .O(oLED_r_reg2__15_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry__2_i_8
       (.I0(cnt_1mS_reg[24]),
        .I1(cnt_1S_reg[24]),
        .I2(cnt_1mS_reg[25]),
        .I3(cnt_1S_reg[25]),
        .O(oLED_r_reg2__15_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry_i_1
       (.I0(cnt_1S_reg[6]),
        .I1(cnt_1mS_reg[6]),
        .I2(cnt_1mS_reg[7]),
        .I3(cnt_1S_reg[7]),
        .O(oLED_r_reg2__15_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry_i_2
       (.I0(cnt_1S_reg[4]),
        .I1(cnt_1mS_reg[4]),
        .I2(cnt_1mS_reg[5]),
        .I3(cnt_1S_reg[5]),
        .O(oLED_r_reg2__15_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry_i_3
       (.I0(cnt_1S_reg[2]),
        .I1(cnt_1mS_reg[2]),
        .I2(cnt_1mS_reg[3]),
        .I3(cnt_1S_reg[3]),
        .O(oLED_r_reg2__15_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2__15_carry_i_4
       (.I0(cnt_1S_reg[0]),
        .I1(cnt_1mS_reg[0]),
        .I2(cnt_1mS_reg[1]),
        .I3(cnt_1S_reg[1]),
        .O(oLED_r_reg2__15_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry_i_5
       (.I0(cnt_1mS_reg[6]),
        .I1(cnt_1S_reg[6]),
        .I2(cnt_1mS_reg[7]),
        .I3(cnt_1S_reg[7]),
        .O(oLED_r_reg2__15_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry_i_6
       (.I0(cnt_1mS_reg[4]),
        .I1(cnt_1S_reg[4]),
        .I2(cnt_1mS_reg[5]),
        .I3(cnt_1S_reg[5]),
        .O(oLED_r_reg2__15_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry_i_7
       (.I0(cnt_1mS_reg[2]),
        .I1(cnt_1S_reg[2]),
        .I2(cnt_1mS_reg[3]),
        .I3(cnt_1S_reg[3]),
        .O(oLED_r_reg2__15_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2__15_carry_i_8
       (.I0(cnt_1mS_reg[0]),
        .I1(cnt_1S_reg[0]),
        .I2(cnt_1mS_reg[1]),
        .I3(cnt_1S_reg[1]),
        .O(oLED_r_reg2__15_carry_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2_carry
       (.CI(1'b0),
        .CO({oLED_r_reg2_carry_n_0,oLED_r_reg2_carry_n_1,oLED_r_reg2_carry_n_2,oLED_r_reg2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2_carry_i_1_n_0,oLED_r_reg2_carry_i_2_n_0,oLED_r_reg2_carry_i_3_n_0,oLED_r_reg2_carry_i_4_n_0}),
        .O(NLW_oLED_r_reg2_carry_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2_carry_i_5_n_0,oLED_r_reg2_carry_i_6_n_0,oLED_r_reg2_carry_i_7_n_0,oLED_r_reg2_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2_carry__0
       (.CI(oLED_r_reg2_carry_n_0),
        .CO({oLED_r_reg2_carry__0_n_0,oLED_r_reg2_carry__0_n_1,oLED_r_reg2_carry__0_n_2,oLED_r_reg2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2_carry__0_i_1_n_0,oLED_r_reg2_carry__0_i_2_n_0,oLED_r_reg2_carry__0_i_3_n_0,oLED_r_reg2_carry__0_i_4_n_0}),
        .O(NLW_oLED_r_reg2_carry__0_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2_carry__0_i_5_n_0,oLED_r_reg2_carry__0_i_6_n_0,oLED_r_reg2_carry__0_i_7_n_0,oLED_r_reg2_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__0_i_1
       (.I0(cnt_1mS_reg[14]),
        .I1(cnt_1S_reg[14]),
        .I2(cnt_1S_reg[15]),
        .I3(cnt_1mS_reg[15]),
        .O(oLED_r_reg2_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__0_i_2
       (.I0(cnt_1mS_reg[12]),
        .I1(cnt_1S_reg[12]),
        .I2(cnt_1S_reg[13]),
        .I3(cnt_1mS_reg[13]),
        .O(oLED_r_reg2_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__0_i_3
       (.I0(cnt_1mS_reg[10]),
        .I1(cnt_1S_reg[10]),
        .I2(cnt_1S_reg[11]),
        .I3(cnt_1mS_reg[11]),
        .O(oLED_r_reg2_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__0_i_4
       (.I0(cnt_1mS_reg[8]),
        .I1(cnt_1S_reg[8]),
        .I2(cnt_1S_reg[9]),
        .I3(cnt_1mS_reg[9]),
        .O(oLED_r_reg2_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__0_i_5
       (.I0(cnt_1mS_reg[14]),
        .I1(cnt_1S_reg[14]),
        .I2(cnt_1mS_reg[15]),
        .I3(cnt_1S_reg[15]),
        .O(oLED_r_reg2_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__0_i_6
       (.I0(cnt_1mS_reg[12]),
        .I1(cnt_1S_reg[12]),
        .I2(cnt_1mS_reg[13]),
        .I3(cnt_1S_reg[13]),
        .O(oLED_r_reg2_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__0_i_7
       (.I0(cnt_1mS_reg[10]),
        .I1(cnt_1S_reg[10]),
        .I2(cnt_1mS_reg[11]),
        .I3(cnt_1S_reg[11]),
        .O(oLED_r_reg2_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__0_i_8
       (.I0(cnt_1mS_reg[8]),
        .I1(cnt_1S_reg[8]),
        .I2(cnt_1mS_reg[9]),
        .I3(cnt_1S_reg[9]),
        .O(oLED_r_reg2_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2_carry__1
       (.CI(oLED_r_reg2_carry__0_n_0),
        .CO({oLED_r_reg2_carry__1_n_0,oLED_r_reg2_carry__1_n_1,oLED_r_reg2_carry__1_n_2,oLED_r_reg2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2_carry__1_i_1_n_0,oLED_r_reg2_carry__1_i_2_n_0,oLED_r_reg2_carry__1_i_3_n_0,oLED_r_reg2_carry__1_i_4_n_0}),
        .O(NLW_oLED_r_reg2_carry__1_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2_carry__1_i_5_n_0,oLED_r_reg2_carry__1_i_6_n_0,oLED_r_reg2_carry__1_i_7_n_0,oLED_r_reg2_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__1_i_1
       (.I0(cnt_1mS_reg[22]),
        .I1(cnt_1S_reg[22]),
        .I2(cnt_1S_reg[23]),
        .I3(cnt_1mS_reg[23]),
        .O(oLED_r_reg2_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__1_i_2
       (.I0(cnt_1mS_reg[20]),
        .I1(cnt_1S_reg[20]),
        .I2(cnt_1S_reg[21]),
        .I3(cnt_1mS_reg[21]),
        .O(oLED_r_reg2_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__1_i_3
       (.I0(cnt_1mS_reg[18]),
        .I1(cnt_1S_reg[18]),
        .I2(cnt_1S_reg[19]),
        .I3(cnt_1mS_reg[19]),
        .O(oLED_r_reg2_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__1_i_4
       (.I0(cnt_1mS_reg[16]),
        .I1(cnt_1S_reg[16]),
        .I2(cnt_1S_reg[17]),
        .I3(cnt_1mS_reg[17]),
        .O(oLED_r_reg2_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__1_i_5
       (.I0(cnt_1mS_reg[22]),
        .I1(cnt_1S_reg[22]),
        .I2(cnt_1mS_reg[23]),
        .I3(cnt_1S_reg[23]),
        .O(oLED_r_reg2_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__1_i_6
       (.I0(cnt_1mS_reg[20]),
        .I1(cnt_1S_reg[20]),
        .I2(cnt_1mS_reg[21]),
        .I3(cnt_1S_reg[21]),
        .O(oLED_r_reg2_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__1_i_7
       (.I0(cnt_1mS_reg[18]),
        .I1(cnt_1S_reg[18]),
        .I2(cnt_1mS_reg[19]),
        .I3(cnt_1S_reg[19]),
        .O(oLED_r_reg2_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__1_i_8
       (.I0(cnt_1mS_reg[16]),
        .I1(cnt_1S_reg[16]),
        .I2(cnt_1mS_reg[17]),
        .I3(cnt_1S_reg[17]),
        .O(oLED_r_reg2_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 oLED_r_reg2_carry__2
       (.CI(oLED_r_reg2_carry__1_n_0),
        .CO({oLED_r_reg2,oLED_r_reg2_carry__2_n_1,oLED_r_reg2_carry__2_n_2,oLED_r_reg2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({oLED_r_reg2_carry__2_i_1_n_0,oLED_r_reg2_carry__2_i_2_n_0,oLED_r_reg2_carry__2_i_3_n_0,oLED_r_reg2_carry__2_i_4_n_0}),
        .O(NLW_oLED_r_reg2_carry__2_O_UNCONNECTED[3:0]),
        .S({oLED_r_reg2_carry__2_i_5_n_0,oLED_r_reg2_carry__2_i_6_n_0,oLED_r_reg2_carry__2_i_7_n_0,oLED_r_reg2_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__2_i_1
       (.I0(cnt_1mS_reg[30]),
        .I1(cnt_1S_reg[30]),
        .I2(cnt_1S_reg[31]),
        .I3(cnt_1mS_reg[31]),
        .O(oLED_r_reg2_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__2_i_2
       (.I0(cnt_1mS_reg[28]),
        .I1(cnt_1S_reg[28]),
        .I2(cnt_1S_reg[29]),
        .I3(cnt_1mS_reg[29]),
        .O(oLED_r_reg2_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__2_i_3
       (.I0(cnt_1mS_reg[26]),
        .I1(cnt_1S_reg[26]),
        .I2(cnt_1S_reg[27]),
        .I3(cnt_1mS_reg[27]),
        .O(oLED_r_reg2_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry__2_i_4
       (.I0(cnt_1mS_reg[24]),
        .I1(cnt_1S_reg[24]),
        .I2(cnt_1S_reg[25]),
        .I3(cnt_1mS_reg[25]),
        .O(oLED_r_reg2_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__2_i_5
       (.I0(cnt_1mS_reg[30]),
        .I1(cnt_1S_reg[30]),
        .I2(cnt_1mS_reg[31]),
        .I3(cnt_1S_reg[31]),
        .O(oLED_r_reg2_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__2_i_6
       (.I0(cnt_1mS_reg[28]),
        .I1(cnt_1S_reg[28]),
        .I2(cnt_1mS_reg[29]),
        .I3(cnt_1S_reg[29]),
        .O(oLED_r_reg2_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__2_i_7
       (.I0(cnt_1mS_reg[26]),
        .I1(cnt_1S_reg[26]),
        .I2(cnt_1mS_reg[27]),
        .I3(cnt_1S_reg[27]),
        .O(oLED_r_reg2_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry__2_i_8
       (.I0(cnt_1mS_reg[24]),
        .I1(cnt_1S_reg[24]),
        .I2(cnt_1mS_reg[25]),
        .I3(cnt_1S_reg[25]),
        .O(oLED_r_reg2_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry_i_1
       (.I0(cnt_1mS_reg[6]),
        .I1(cnt_1S_reg[6]),
        .I2(cnt_1S_reg[7]),
        .I3(cnt_1mS_reg[7]),
        .O(oLED_r_reg2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry_i_2
       (.I0(cnt_1mS_reg[4]),
        .I1(cnt_1S_reg[4]),
        .I2(cnt_1S_reg[5]),
        .I3(cnt_1mS_reg[5]),
        .O(oLED_r_reg2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry_i_3
       (.I0(cnt_1mS_reg[2]),
        .I1(cnt_1S_reg[2]),
        .I2(cnt_1S_reg[3]),
        .I3(cnt_1mS_reg[3]),
        .O(oLED_r_reg2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    oLED_r_reg2_carry_i_4
       (.I0(cnt_1mS_reg[0]),
        .I1(cnt_1S_reg[0]),
        .I2(cnt_1S_reg[1]),
        .I3(cnt_1mS_reg[1]),
        .O(oLED_r_reg2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry_i_5
       (.I0(cnt_1mS_reg[6]),
        .I1(cnt_1S_reg[6]),
        .I2(cnt_1mS_reg[7]),
        .I3(cnt_1S_reg[7]),
        .O(oLED_r_reg2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry_i_6
       (.I0(cnt_1mS_reg[4]),
        .I1(cnt_1S_reg[4]),
        .I2(cnt_1mS_reg[5]),
        .I3(cnt_1S_reg[5]),
        .O(oLED_r_reg2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry_i_7
       (.I0(cnt_1mS_reg[2]),
        .I1(cnt_1S_reg[2]),
        .I2(cnt_1mS_reg[3]),
        .I3(cnt_1S_reg[3]),
        .O(oLED_r_reg2_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    oLED_r_reg2_carry_i_8
       (.I0(cnt_1mS_reg[0]),
        .I1(cnt_1S_reg[0]),
        .I2(cnt_1mS_reg[1]),
        .I3(cnt_1S_reg[1]),
        .O(oLED_r_reg2_carry_i_8_n_0));
  FDCE \oLED_r_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\oLED_r[0]_i_1_n_0 ),
        .Q(oLED[0]));
  FDCE \oLED_r_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(\oLED_r[1]_i_2_n_0 ),
        .D(\oLED_r[1]_i_1_n_0 ),
        .Q(oLED[1]));
  LUT2 #(
    .INIT(4'h6)) 
    on_off_flag_i_1
       (.I0(cnt_1S1),
        .I1(on_off_flag),
        .O(on_off_flag_i_1_n_0));
  FDPE on_off_flag_reg
       (.C(iClk),
        .CE(1'b1),
        .D(on_off_flag_i_1_n_0),
        .PRE(\oLED_r[1]_i_2_n_0 ),
        .Q(on_off_flag));
endmodule

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZLed_Indicator_0_0,ZLed_Indicator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZLed_Indicator,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (iClk,
    iRst_N,
    iNewDataUpdate,
    oLED);
  input iClk;
  input iRst_N;
  input iNewDataUpdate;
  output [1:0]oLED;

  wire iClk;
  wire iNewDataUpdate;
  wire iRst_N;
  wire [1:0]oLED;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator inst
       (.iClk(iClk),
        .iNewDataUpdate(iNewDataUpdate),
        .iRst_N(iRst_N),
        .oLED(oLED));
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
