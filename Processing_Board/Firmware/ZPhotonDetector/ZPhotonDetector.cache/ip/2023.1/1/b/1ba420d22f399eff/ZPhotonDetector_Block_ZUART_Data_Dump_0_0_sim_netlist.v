// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Oct 26 10:54:51 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZUART_Data_Dump_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZUART_Data_Dump_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZUART_Data_Dump_0_0,ZUART_Data_Dump,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZUART_Data_Dump,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (iClk,
    iRst_N,
    iEn,
    iNewDataUpdate,
    iNewData,
    iTime_Interval,
    oTxd_Pin,
    oDir_Pin,
    oDone);
  input iClk;
  input iRst_N;
  input iEn;
  input iNewDataUpdate;
  input [15:0]iNewData;
  input [7:0]iTime_Interval;
  output oTxd_Pin;
  output oDir_Pin;
  output oDone;

  wire \<const1> ;
  wire iClk;
  wire iEn;
  wire [15:0]iNewData;
  wire iNewDataUpdate;
  wire iRst_N;
  wire [7:0]iTime_Interval;
  wire oDone;
  wire oTxd_Pin;

  assign oDir_Pin = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Data_Dump inst
       (.iClk(iClk),
        .iEn(iEn),
        .iNewData(iNewData),
        .iNewDataUpdate(iNewDataUpdate),
        .iRst_N(iRst_N),
        .iTime_Interval(iTime_Interval),
        .oDone(oDone),
        .oTxd_Pin(oTxd_Pin));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Data_Dump
   (oDone,
    oTxd_Pin,
    iEn,
    iClk,
    iNewData,
    iTime_Interval,
    iNewDataUpdate,
    iRst_N);
  output oDone;
  output oTxd_Pin;
  input iEn;
  input iClk;
  input [15:0]iNewData;
  input [7:0]iTime_Interval;
  input iNewDataUpdate;
  input iRst_N;

  wire [15:0]NewDataLocked;
  wire NewDataLocked0;
  wire [7:0]check_sum;
  wire check_sum0__0_carry_i_1_n_0;
  wire check_sum0__0_carry_i_2_n_0;
  wire check_sum0__0_carry_i_3_n_0;
  wire check_sum0__0_carry_i_4_n_0;
  wire check_sum0__0_carry_i_5_n_0;
  wire check_sum0__0_carry_i_6_n_0;
  wire check_sum0__0_carry_n_0;
  wire check_sum0__0_carry_n_1;
  wire check_sum0__0_carry_n_2;
  wire check_sum0__0_carry_n_3;
  wire check_sum0__0_carry_n_4;
  wire check_sum0__0_carry_n_5;
  wire check_sum0__0_carry_n_6;
  wire check_sum0__0_carry_n_7;
  wire check_sum0__14_carry__0_i_10_n_0;
  wire check_sum0__14_carry__0_i_11_n_0;
  wire check_sum0__14_carry__0_i_12_n_0;
  wire check_sum0__14_carry__0_i_13_n_0;
  wire check_sum0__14_carry__0_i_14_n_0;
  wire check_sum0__14_carry__0_i_15_n_0;
  wire check_sum0__14_carry__0_i_16_n_0;
  wire check_sum0__14_carry__0_i_1_n_0;
  wire check_sum0__14_carry__0_i_2_n_0;
  wire check_sum0__14_carry__0_i_3_n_0;
  wire check_sum0__14_carry__0_i_4_n_0;
  wire check_sum0__14_carry__0_i_5_n_0;
  wire check_sum0__14_carry__0_i_6_n_0;
  wire check_sum0__14_carry__0_i_7_n_0;
  wire check_sum0__14_carry__0_i_8_n_0;
  wire check_sum0__14_carry__0_i_9_n_3;
  wire check_sum0__14_carry__0_n_1;
  wire check_sum0__14_carry__0_n_2;
  wire check_sum0__14_carry__0_n_3;
  wire check_sum0__14_carry__0_n_4;
  wire check_sum0__14_carry__0_n_5;
  wire check_sum0__14_carry__0_n_6;
  wire check_sum0__14_carry__0_n_7;
  wire check_sum0__14_carry_i_10_n_0;
  wire check_sum0__14_carry_i_11_n_0;
  wire check_sum0__14_carry_i_1_n_0;
  wire check_sum0__14_carry_i_2_n_0;
  wire check_sum0__14_carry_i_3_n_0;
  wire check_sum0__14_carry_i_4_n_0;
  wire check_sum0__14_carry_i_5_n_0;
  wire check_sum0__14_carry_i_6_n_0;
  wire check_sum0__14_carry_i_7_n_0;
  wire check_sum0__14_carry_i_8_n_0;
  wire check_sum0__14_carry_i_9_n_0;
  wire check_sum0__14_carry_n_0;
  wire check_sum0__14_carry_n_1;
  wire check_sum0__14_carry_n_2;
  wire check_sum0__14_carry_n_3;
  wire check_sum0__14_carry_n_4;
  wire check_sum0__14_carry_n_5;
  wire check_sum0__14_carry_n_6;
  wire check_sum0__14_carry_n_7;
  wire \check_sum[7]_i_1_n_0 ;
  wire \current_gap_no[0]_i_1_n_0 ;
  wire \current_gap_no[1]_i_1_n_0 ;
  wire \current_gap_no[2]_i_1_n_0 ;
  wire \current_gap_no[3]_i_1_n_0 ;
  wire \current_gap_no_reg_n_0_[0] ;
  wire \current_gap_no_reg_n_0_[1] ;
  wire \current_gap_no_reg_n_0_[2] ;
  wire \current_gap_no_reg_n_0_[3] ;
  wire data0;
  wire data2;
  wire data3;
  wire data4;
  wire data5;
  wire data6;
  wire data7;
  wire iClk;
  wire iEn;
  wire [15:0]iNewData;
  wire iNewDataUpdate;
  wire iRst_N;
  wire [7:0]iTime_Interval;
  wire [3:0]i_0;
  wire [3:0]i__0;
  wire [0:0]in5;
  wire [7:0]in7;
  wire \locked_pulse_counter[15]_i_2_n_0 ;
  wire \locked_pulse_counter_reg_n_0_[0] ;
  wire \locked_pulse_counter_reg_n_0_[1] ;
  wire \locked_pulse_counter_reg_n_0_[2] ;
  wire \locked_pulse_counter_reg_n_0_[3] ;
  wire \locked_pulse_counter_reg_n_0_[4] ;
  wire \locked_pulse_counter_reg_n_0_[5] ;
  wire \locked_pulse_counter_reg_n_0_[6] ;
  wire \locked_pulse_counter_reg_n_0_[7] ;
  wire oDone;
  wire oDone_i_1_n_0;
  wire oTxd_Pin;
  wire \phase_diff[2]_i_1_n_0 ;
  wire \phase_diff[3]_i_1_n_0 ;
  wire \phase_diff[5]_i_1_n_0 ;
  wire \phase_diff[6]_i_1_n_0 ;
  wire \phase_diff[7]_i_1_n_0 ;
  wire \phase_diff[8]_i_2_n_0 ;
  wire \phase_diff_reg_n_0_[2] ;
  wire \phase_diff_reg_n_0_[3] ;
  wire \phase_diff_reg_n_0_[5] ;
  wire \phase_diff_reg_n_0_[6] ;
  wire \phase_diff_reg_n_0_[7] ;
  wire [2:0]time_interval;
  wire \time_interval[0]_i_1_n_0 ;
  wire \time_interval[1]_i_1_n_0 ;
  wire \time_interval[1]_i_2_n_0 ;
  wire \time_interval[2]_i_1_n_0 ;
  wire \time_interval[2]_i_2_n_0 ;
  wire \time_interval[2]_i_4_n_0 ;
  wire [7:0]tx_data;
  wire \tx_data[0]_i_2_n_0 ;
  wire \tx_data[0]_i_3_n_0 ;
  wire \tx_data[0]_i_4_n_0 ;
  wire \tx_data[0]_i_5_n_0 ;
  wire \tx_data[1]_i_2_n_0 ;
  wire \tx_data[1]_i_3_n_0 ;
  wire \tx_data[1]_i_4_n_0 ;
  wire \tx_data[2]_i_2_n_0 ;
  wire \tx_data[2]_i_3_n_0 ;
  wire \tx_data[2]_i_4_n_0 ;
  wire \tx_data[3]_i_2_n_0 ;
  wire \tx_data[3]_i_3_n_0 ;
  wire \tx_data[3]_i_4_n_0 ;
  wire \tx_data[4]_i_2_n_0 ;
  wire \tx_data[4]_i_3_n_0 ;
  wire \tx_data[5]_i_2_n_0 ;
  wire \tx_data[6]_i_2_n_0 ;
  wire \tx_data[7]_i_3_n_0 ;
  wire \tx_data_reg_n_0_[0] ;
  wire u1_n_0;
  wire u1_n_10;
  wire u1_n_11;
  wire u1_n_2;
  wire u1_n_7;
  wire u1_n_8;
  wire u1_n_9;
  wire uart_en_i_2_n_0;
  wire uart_en_reg_n_0;
  wire [3:3]NLW_check_sum0__14_carry__0_CO_UNCONNECTED;
  wire [3:1]NLW_check_sum0__14_carry__0_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_check_sum0__14_carry__0_i_9_O_UNCONNECTED;

  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101" *) 
  FDCE \FSM_sequential_i_reg[0] 
       (.C(iClk),
        .CE(u1_n_8),
        .CLR(u1_n_0),
        .D(i__0[0]),
        .Q(i_0[0]));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101" *) 
  FDCE \FSM_sequential_i_reg[1] 
       (.C(iClk),
        .CE(u1_n_8),
        .CLR(u1_n_0),
        .D(i__0[1]),
        .Q(i_0[1]));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101" *) 
  FDCE \FSM_sequential_i_reg[2] 
       (.C(iClk),
        .CE(u1_n_8),
        .CLR(u1_n_0),
        .D(i__0[2]),
        .Q(i_0[2]));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101" *) 
  FDCE \FSM_sequential_i_reg[3] 
       (.C(iClk),
        .CE(u1_n_8),
        .CLR(u1_n_0),
        .D(i__0[3]),
        .Q(i_0[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \NewDataLocked[15]_i_1 
       (.I0(iEn),
        .I1(iNewDataUpdate),
        .O(NewDataLocked0));
  FDCE \NewDataLocked_reg[0] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[0]),
        .Q(NewDataLocked[0]));
  FDCE \NewDataLocked_reg[10] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[10]),
        .Q(NewDataLocked[10]));
  FDCE \NewDataLocked_reg[11] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[11]),
        .Q(NewDataLocked[11]));
  FDCE \NewDataLocked_reg[12] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[12]),
        .Q(NewDataLocked[12]));
  FDCE \NewDataLocked_reg[13] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[13]),
        .Q(NewDataLocked[13]));
  FDCE \NewDataLocked_reg[14] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[14]),
        .Q(NewDataLocked[14]));
  FDCE \NewDataLocked_reg[15] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[15]),
        .Q(NewDataLocked[15]));
  FDCE \NewDataLocked_reg[1] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[1]),
        .Q(NewDataLocked[1]));
  FDCE \NewDataLocked_reg[2] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[2]),
        .Q(NewDataLocked[2]));
  FDCE \NewDataLocked_reg[3] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[3]),
        .Q(NewDataLocked[3]));
  FDCE \NewDataLocked_reg[4] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[4]),
        .Q(NewDataLocked[4]));
  FDCE \NewDataLocked_reg[5] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[5]),
        .Q(NewDataLocked[5]));
  FDCE \NewDataLocked_reg[6] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[6]),
        .Q(NewDataLocked[6]));
  FDCE \NewDataLocked_reg[7] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[7]),
        .Q(NewDataLocked[7]));
  FDCE \NewDataLocked_reg[8] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[8]),
        .Q(NewDataLocked[8]));
  FDCE \NewDataLocked_reg[9] 
       (.C(iClk),
        .CE(NewDataLocked0),
        .CLR(u1_n_0),
        .D(iNewData[9]),
        .Q(NewDataLocked[9]));
  CARRY4 check_sum0__0_carry
       (.CI(1'b0),
        .CO({check_sum0__0_carry_n_0,check_sum0__0_carry_n_1,check_sum0__0_carry_n_2,check_sum0__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\current_gap_no_reg_n_0_[3] ,check_sum0__0_carry_i_1_n_0,check_sum0__0_carry_i_2_n_0,1'b0}),
        .O({check_sum0__0_carry_n_4,check_sum0__0_carry_n_5,check_sum0__0_carry_n_6,check_sum0__0_carry_n_7}),
        .S({check_sum0__0_carry_i_3_n_0,check_sum0__0_carry_i_4_n_0,check_sum0__0_carry_i_5_n_0,check_sum0__0_carry_i_6_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    check_sum0__0_carry_i_1
       (.I0(\current_gap_no_reg_n_0_[1] ),
        .I1(time_interval[1]),
        .O(check_sum0__0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    check_sum0__0_carry_i_2
       (.I0(in5),
        .I1(\current_gap_no_reg_n_0_[0] ),
        .I2(time_interval[0]),
        .O(check_sum0__0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    check_sum0__0_carry_i_3
       (.I0(time_interval[2]),
        .I1(\current_gap_no_reg_n_0_[2] ),
        .I2(\current_gap_no_reg_n_0_[3] ),
        .O(check_sum0__0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    check_sum0__0_carry_i_4
       (.I0(time_interval[1]),
        .I1(\current_gap_no_reg_n_0_[1] ),
        .I2(time_interval[2]),
        .I3(\current_gap_no_reg_n_0_[2] ),
        .O(check_sum0__0_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    check_sum0__0_carry_i_5
       (.I0(time_interval[0]),
        .I1(\current_gap_no_reg_n_0_[0] ),
        .I2(in5),
        .I3(time_interval[1]),
        .I4(\current_gap_no_reg_n_0_[1] ),
        .O(check_sum0__0_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    check_sum0__0_carry_i_6
       (.I0(in5),
        .I1(time_interval[0]),
        .I2(\current_gap_no_reg_n_0_[0] ),
        .O(check_sum0__0_carry_i_6_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 check_sum0__14_carry
       (.CI(1'b0),
        .CO({check_sum0__14_carry_n_0,check_sum0__14_carry_n_1,check_sum0__14_carry_n_2,check_sum0__14_carry_n_3}),
        .CYINIT(1'b0),
        .DI({check_sum0__14_carry_i_1_n_0,check_sum0__14_carry_i_2_n_0,check_sum0__0_carry_n_7,check_sum0__14_carry_i_3_n_0}),
        .O({check_sum0__14_carry_n_4,check_sum0__14_carry_n_5,check_sum0__14_carry_n_6,check_sum0__14_carry_n_7}),
        .S({check_sum0__14_carry_i_4_n_0,check_sum0__14_carry_i_5_n_0,check_sum0__14_carry_i_6_n_0,check_sum0__14_carry_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 check_sum0__14_carry__0
       (.CI(check_sum0__14_carry_n_0),
        .CO({NLW_check_sum0__14_carry__0_CO_UNCONNECTED[3],check_sum0__14_carry__0_n_1,check_sum0__14_carry__0_n_2,check_sum0__14_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,check_sum0__14_carry__0_i_1_n_0,check_sum0__14_carry__0_i_2_n_0,check_sum0__14_carry__0_i_3_n_0}),
        .O({check_sum0__14_carry__0_n_4,check_sum0__14_carry__0_n_5,check_sum0__14_carry__0_n_6,check_sum0__14_carry__0_n_7}),
        .S({check_sum0__14_carry__0_i_4_n_0,check_sum0__14_carry__0_i_5_n_0,check_sum0__14_carry__0_i_6_n_0,check_sum0__14_carry__0_i_7_n_0}));
  LUT6 #(
    .INIT(64'h9990900090006660)) 
    check_sum0__14_carry__0_i_1
       (.I0(\locked_pulse_counter_reg_n_0_[5] ),
        .I1(check_sum0__14_carry__0_i_8_n_0),
        .I2(\locked_pulse_counter_reg_n_0_[4] ),
        .I3(in7[4]),
        .I4(\phase_diff_reg_n_0_[7] ),
        .I5(check_sum0__14_carry__0_i_9_n_3),
        .O(check_sum0__14_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    check_sum0__14_carry__0_i_10
       (.I0(\locked_pulse_counter_reg_n_0_[4] ),
        .I1(in7[4]),
        .I2(\phase_diff_reg_n_0_[7] ),
        .I3(check_sum0__14_carry__0_i_9_n_3),
        .O(check_sum0__14_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hBEBEBE28)) 
    check_sum0__14_carry__0_i_11
       (.I0(\locked_pulse_counter_reg_n_0_[5] ),
        .I1(in7[5]),
        .I2(\phase_diff_reg_n_0_[5] ),
        .I3(check_sum0__14_carry__0_i_9_n_3),
        .I4(\phase_diff_reg_n_0_[7] ),
        .O(check_sum0__14_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h87787887)) 
    check_sum0__14_carry__0_i_12
       (.I0(in7[6]),
        .I1(\phase_diff_reg_n_0_[6] ),
        .I2(\phase_diff_reg_n_0_[7] ),
        .I3(in7[7]),
        .I4(\locked_pulse_counter_reg_n_0_[7] ),
        .O(check_sum0__14_carry__0_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    check_sum0__14_carry__0_i_13
       (.I0(\phase_diff_reg_n_0_[6] ),
        .I1(in7[6]),
        .O(check_sum0__14_carry__0_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h78878778)) 
    check_sum0__14_carry__0_i_14
       (.I0(in7[5]),
        .I1(\phase_diff_reg_n_0_[5] ),
        .I2(\phase_diff_reg_n_0_[6] ),
        .I3(in7[6]),
        .I4(\locked_pulse_counter_reg_n_0_[6] ),
        .O(check_sum0__14_carry__0_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hE11E1EE1)) 
    check_sum0__14_carry__0_i_15
       (.I0(\phase_diff_reg_n_0_[7] ),
        .I1(check_sum0__14_carry__0_i_9_n_3),
        .I2(\phase_diff_reg_n_0_[5] ),
        .I3(in7[5]),
        .I4(\locked_pulse_counter_reg_n_0_[5] ),
        .O(check_sum0__14_carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h17)) 
    check_sum0__14_carry__0_i_16
       (.I0(check_sum0__0_carry_n_4),
        .I1(in7[3]),
        .I2(\phase_diff_reg_n_0_[3] ),
        .O(check_sum0__14_carry__0_i_16_n_0));
  LUT6 #(
    .INIT(64'h8000E880FEE8FFFE)) 
    check_sum0__14_carry__0_i_2
       (.I0(\locked_pulse_counter_reg_n_0_[3] ),
        .I1(check_sum0__0_carry_n_4),
        .I2(in7[3]),
        .I3(\phase_diff_reg_n_0_[3] ),
        .I4(check_sum0__14_carry_i_10_n_0),
        .I5(check_sum0__14_carry__0_i_10_n_0),
        .O(check_sum0__14_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h022AA880A880022A)) 
    check_sum0__14_carry__0_i_3
       (.I0(check_sum0__14_carry_i_8_n_0),
        .I1(check_sum0__0_carry_n_5),
        .I2(in7[2]),
        .I3(\phase_diff_reg_n_0_[2] ),
        .I4(\locked_pulse_counter_reg_n_0_[3] ),
        .I5(check_sum0__14_carry_i_9_n_0),
        .O(check_sum0__14_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h6CC9C993C993C993)) 
    check_sum0__14_carry__0_i_4
       (.I0(check_sum0__14_carry__0_i_11_n_0),
        .I1(check_sum0__14_carry__0_i_12_n_0),
        .I2(\locked_pulse_counter_reg_n_0_[6] ),
        .I3(check_sum0__14_carry__0_i_13_n_0),
        .I4(\phase_diff_reg_n_0_[5] ),
        .I5(in7[5]),
        .O(check_sum0__14_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'hA9A9A9955656566A)) 
    check_sum0__14_carry__0_i_5
       (.I0(check_sum0__14_carry__0_i_1_n_0),
        .I1(\locked_pulse_counter_reg_n_0_[5] ),
        .I2(check_sum0__14_carry__0_i_8_n_0),
        .I3(check_sum0__14_carry__0_i_9_n_3),
        .I4(\phase_diff_reg_n_0_[7] ),
        .I5(check_sum0__14_carry__0_i_14_n_0),
        .O(check_sum0__14_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h556969AAAA969655)) 
    check_sum0__14_carry__0_i_6
       (.I0(check_sum0__14_carry__0_i_2_n_0),
        .I1(check_sum0__14_carry__0_i_9_n_3),
        .I2(\phase_diff_reg_n_0_[7] ),
        .I3(in7[4]),
        .I4(\locked_pulse_counter_reg_n_0_[4] ),
        .I5(check_sum0__14_carry__0_i_15_n_0),
        .O(check_sum0__14_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'hA665599A599AA665)) 
    check_sum0__14_carry__0_i_7
       (.I0(check_sum0__14_carry__0_i_3_n_0),
        .I1(\locked_pulse_counter_reg_n_0_[3] ),
        .I2(check_sum0__14_carry_i_9_n_0),
        .I3(check_sum0__14_carry_i_10_n_0),
        .I4(check_sum0__14_carry__0_i_10_n_0),
        .I5(check_sum0__14_carry__0_i_16_n_0),
        .O(check_sum0__14_carry__0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    check_sum0__14_carry__0_i_8
       (.I0(\phase_diff_reg_n_0_[5] ),
        .I1(in7[5]),
        .O(check_sum0__14_carry__0_i_8_n_0));
  CARRY4 check_sum0__14_carry__0_i_9
       (.CI(check_sum0__0_carry_n_0),
        .CO({NLW_check_sum0__14_carry__0_i_9_CO_UNCONNECTED[3:1],check_sum0__14_carry__0_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_check_sum0__14_carry__0_i_9_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT6 #(
    .INIT(64'hA995566A566AA995)) 
    check_sum0__14_carry_i_1
       (.I0(check_sum0__14_carry_i_8_n_0),
        .I1(check_sum0__0_carry_n_5),
        .I2(in7[2]),
        .I3(\phase_diff_reg_n_0_[2] ),
        .I4(\locked_pulse_counter_reg_n_0_[3] ),
        .I5(check_sum0__14_carry_i_9_n_0),
        .O(check_sum0__14_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h17)) 
    check_sum0__14_carry_i_10
       (.I0(check_sum0__0_carry_n_5),
        .I1(in7[2]),
        .I2(\phase_diff_reg_n_0_[2] ),
        .O(check_sum0__14_carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    check_sum0__14_carry_i_11
       (.I0(check_sum0__0_carry_n_6),
        .I1(\locked_pulse_counter_reg_n_0_[2] ),
        .I2(check_sum0__0_carry_n_5),
        .I3(in7[2]),
        .I4(\phase_diff_reg_n_0_[2] ),
        .O(check_sum0__14_carry_i_11_n_0));
  LUT5 #(
    .INIT(32'h96696996)) 
    check_sum0__14_carry_i_2
       (.I0(check_sum0__0_carry_n_6),
        .I1(\phase_diff_reg_n_0_[2] ),
        .I2(in7[2]),
        .I3(check_sum0__0_carry_n_5),
        .I4(\locked_pulse_counter_reg_n_0_[2] ),
        .O(check_sum0__14_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    check_sum0__14_carry_i_3
       (.I0(check_sum0__0_carry_n_7),
        .O(check_sum0__14_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h96696996)) 
    check_sum0__14_carry_i_4
       (.I0(check_sum0__14_carry_i_9_n_0),
        .I1(\locked_pulse_counter_reg_n_0_[3] ),
        .I2(check_sum0__14_carry_i_10_n_0),
        .I3(check_sum0__14_carry_i_8_n_0),
        .I4(check_sum0__14_carry_i_11_n_0),
        .O(check_sum0__14_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h556A6AAA9555556A)) 
    check_sum0__14_carry_i_5
       (.I0(check_sum0__14_carry_i_2_n_0),
        .I1(in7[0]),
        .I2(\locked_pulse_counter_reg_n_0_[0] ),
        .I3(in7[1]),
        .I4(\locked_pulse_counter_reg_n_0_[1] ),
        .I5(check_sum0__0_carry_n_6),
        .O(check_sum0__14_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h7887877887787887)) 
    check_sum0__14_carry_i_6
       (.I0(\locked_pulse_counter_reg_n_0_[0] ),
        .I1(in7[0]),
        .I2(\locked_pulse_counter_reg_n_0_[1] ),
        .I3(in7[1]),
        .I4(check_sum0__0_carry_n_6),
        .I5(check_sum0__0_carry_n_7),
        .O(check_sum0__14_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    check_sum0__14_carry_i_7
       (.I0(check_sum0__0_carry_n_7),
        .I1(\locked_pulse_counter_reg_n_0_[0] ),
        .I2(in7[0]),
        .O(check_sum0__14_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    check_sum0__14_carry_i_8
       (.I0(check_sum0__0_carry_n_6),
        .I1(\locked_pulse_counter_reg_n_0_[1] ),
        .I2(in7[1]),
        .I3(\locked_pulse_counter_reg_n_0_[0] ),
        .I4(in7[0]),
        .O(check_sum0__14_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h69)) 
    check_sum0__14_carry_i_9
       (.I0(\phase_diff_reg_n_0_[3] ),
        .I1(in7[3]),
        .I2(check_sum0__0_carry_n_4),
        .O(check_sum0__14_carry_i_9_n_0));
  LUT5 #(
    .INIT(32'h00800000)) 
    \check_sum[7]_i_1 
       (.I0(i_0[3]),
        .I1(i_0[2]),
        .I2(iEn),
        .I3(i_0[1]),
        .I4(i_0[0]),
        .O(\check_sum[7]_i_1_n_0 ));
  FDCE \check_sum_reg[0] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry_n_7),
        .Q(check_sum[0]));
  FDCE \check_sum_reg[1] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry_n_6),
        .Q(check_sum[1]));
  FDCE \check_sum_reg[2] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry_n_5),
        .Q(check_sum[2]));
  FDCE \check_sum_reg[3] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry_n_4),
        .Q(check_sum[3]));
  FDCE \check_sum_reg[4] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry__0_n_7),
        .Q(check_sum[4]));
  FDCE \check_sum_reg[5] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry__0_n_6),
        .Q(check_sum[5]));
  FDCE \check_sum_reg[6] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry__0_n_5),
        .Q(check_sum[6]));
  FDCE \check_sum_reg[7] 
       (.C(iClk),
        .CE(\check_sum[7]_i_1_n_0 ),
        .CLR(u1_n_0),
        .D(check_sum0__14_carry__0_n_4),
        .Q(check_sum[7]));
  LUT4 #(
    .INIT(16'hE0FF)) 
    \current_gap_no[0]_i_1 
       (.I0(\current_gap_no_reg_n_0_[1] ),
        .I1(\current_gap_no_reg_n_0_[2] ),
        .I2(\current_gap_no_reg_n_0_[3] ),
        .I3(\current_gap_no_reg_n_0_[0] ),
        .O(\current_gap_no[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0266)) 
    \current_gap_no[1]_i_1 
       (.I0(\current_gap_no_reg_n_0_[0] ),
        .I1(\current_gap_no_reg_n_0_[1] ),
        .I2(\current_gap_no_reg_n_0_[2] ),
        .I3(\current_gap_no_reg_n_0_[3] ),
        .O(\current_gap_no[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \current_gap_no[2]_i_1 
       (.I0(\current_gap_no_reg_n_0_[0] ),
        .I1(\current_gap_no_reg_n_0_[1] ),
        .I2(\current_gap_no_reg_n_0_[2] ),
        .I3(\current_gap_no_reg_n_0_[3] ),
        .O(\current_gap_no[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0380)) 
    \current_gap_no[3]_i_1 
       (.I0(\current_gap_no_reg_n_0_[0] ),
        .I1(\current_gap_no_reg_n_0_[1] ),
        .I2(\current_gap_no_reg_n_0_[2] ),
        .I3(\current_gap_no_reg_n_0_[3] ),
        .O(\current_gap_no[3]_i_1_n_0 ));
  FDPE \current_gap_no_reg[0] 
       (.C(iClk),
        .CE(oDone_i_1_n_0),
        .D(\current_gap_no[0]_i_1_n_0 ),
        .PRE(u1_n_0),
        .Q(\current_gap_no_reg_n_0_[0] ));
  FDCE \current_gap_no_reg[1] 
       (.C(iClk),
        .CE(oDone_i_1_n_0),
        .CLR(u1_n_0),
        .D(\current_gap_no[1]_i_1_n_0 ),
        .Q(\current_gap_no_reg_n_0_[1] ));
  FDCE \current_gap_no_reg[2] 
       (.C(iClk),
        .CE(oDone_i_1_n_0),
        .CLR(u1_n_0),
        .D(\current_gap_no[2]_i_1_n_0 ),
        .Q(\current_gap_no_reg_n_0_[2] ));
  FDCE \current_gap_no_reg[3] 
       (.C(iClk),
        .CE(oDone_i_1_n_0),
        .CLR(u1_n_0),
        .D(\current_gap_no[3]_i_1_n_0 ),
        .Q(\current_gap_no_reg_n_0_[3] ));
  LUT2 #(
    .INIT(4'h7)) 
    \locked_pulse_counter[15]_i_2 
       (.I0(iEn),
        .I1(iRst_N),
        .O(\locked_pulse_counter[15]_i_2_n_0 ));
  FDRE \locked_pulse_counter_reg[0] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[0]),
        .Q(\locked_pulse_counter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[10] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[10]),
        .Q(in7[2]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[11] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[11]),
        .Q(in7[3]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[12] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[12]),
        .Q(in7[4]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[13] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[13]),
        .Q(in7[5]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[14] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[14]),
        .Q(in7[6]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[15] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[15]),
        .Q(in7[7]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[1] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[1]),
        .Q(\locked_pulse_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[2] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[2]),
        .Q(\locked_pulse_counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[3] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[3]),
        .Q(\locked_pulse_counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[4] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[4]),
        .Q(\locked_pulse_counter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[5] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[5]),
        .Q(\locked_pulse_counter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[6] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[6]),
        .Q(\locked_pulse_counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[7] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[7]),
        .Q(\locked_pulse_counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[8] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[8]),
        .Q(in7[0]),
        .R(1'b0));
  FDRE \locked_pulse_counter_reg[9] 
       (.C(iClk),
        .CE(u1_n_10),
        .D(NewDataLocked[9]),
        .Q(in7[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h80000000)) 
    oDone_i_1
       (.I0(i_0[3]),
        .I1(i_0[2]),
        .I2(iEn),
        .I3(i_0[1]),
        .I4(i_0[0]),
        .O(oDone_i_1_n_0));
  FDCE oDone_reg
       (.C(iClk),
        .CE(oDone_i_1_n_0),
        .CLR(u1_n_0),
        .D(iEn),
        .Q(oDone));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFCF1)) 
    \phase_diff[2]_i_1 
       (.I0(\current_gap_no_reg_n_0_[1] ),
        .I1(\current_gap_no_reg_n_0_[3] ),
        .I2(\current_gap_no_reg_n_0_[0] ),
        .I3(\current_gap_no_reg_n_0_[2] ),
        .O(\phase_diff[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h222A)) 
    \phase_diff[3]_i_1 
       (.I0(\current_gap_no_reg_n_0_[1] ),
        .I1(\current_gap_no_reg_n_0_[3] ),
        .I2(\current_gap_no_reg_n_0_[0] ),
        .I3(\current_gap_no_reg_n_0_[2] ),
        .O(\phase_diff[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hEFF1)) 
    \phase_diff[5]_i_1 
       (.I0(\current_gap_no_reg_n_0_[1] ),
        .I1(\current_gap_no_reg_n_0_[2] ),
        .I2(\current_gap_no_reg_n_0_[3] ),
        .I3(\current_gap_no_reg_n_0_[0] ),
        .O(\phase_diff[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h1F40)) 
    \phase_diff[6]_i_1 
       (.I0(\current_gap_no_reg_n_0_[2] ),
        .I1(\current_gap_no_reg_n_0_[0] ),
        .I2(\current_gap_no_reg_n_0_[3] ),
        .I3(\current_gap_no_reg_n_0_[1] ),
        .O(\phase_diff[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \phase_diff[7]_i_1 
       (.I0(\current_gap_no_reg_n_0_[2] ),
        .I1(\current_gap_no_reg_n_0_[3] ),
        .O(\phase_diff[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h002A)) 
    \phase_diff[8]_i_2 
       (.I0(\current_gap_no_reg_n_0_[3] ),
        .I1(\current_gap_no_reg_n_0_[0] ),
        .I2(\current_gap_no_reg_n_0_[1] ),
        .I3(\current_gap_no_reg_n_0_[2] ),
        .O(\phase_diff[8]_i_2_n_0 ));
  FDPE \phase_diff_reg[2] 
       (.C(iClk),
        .CE(u1_n_2),
        .D(\phase_diff[2]_i_1_n_0 ),
        .PRE(u1_n_0),
        .Q(\phase_diff_reg_n_0_[2] ));
  FDCE \phase_diff_reg[3] 
       (.C(iClk),
        .CE(u1_n_2),
        .CLR(u1_n_0),
        .D(\phase_diff[3]_i_1_n_0 ),
        .Q(\phase_diff_reg_n_0_[3] ));
  FDPE \phase_diff_reg[5] 
       (.C(iClk),
        .CE(u1_n_2),
        .D(\phase_diff[5]_i_1_n_0 ),
        .PRE(u1_n_0),
        .Q(\phase_diff_reg_n_0_[5] ));
  FDCE \phase_diff_reg[6] 
       (.C(iClk),
        .CE(u1_n_2),
        .CLR(u1_n_0),
        .D(\phase_diff[6]_i_1_n_0 ),
        .Q(\phase_diff_reg_n_0_[6] ));
  FDCE \phase_diff_reg[7] 
       (.C(iClk),
        .CE(u1_n_2),
        .CLR(u1_n_0),
        .D(\phase_diff[7]_i_1_n_0 ),
        .Q(\phase_diff_reg_n_0_[7] ));
  FDCE \phase_diff_reg[8] 
       (.C(iClk),
        .CE(u1_n_2),
        .CLR(u1_n_0),
        .D(\phase_diff[8]_i_2_n_0 ),
        .Q(in5));
  LUT6 #(
    .INIT(64'hBFFBFFFFBFFB0000)) 
    \time_interval[0]_i_1 
       (.I0(\time_interval[1]_i_2_n_0 ),
        .I1(iTime_Interval[0]),
        .I2(iTime_Interval[1]),
        .I3(iTime_Interval[2]),
        .I4(u1_n_9),
        .I5(time_interval[0]),
        .O(\time_interval[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0081FFFF00810000)) 
    \time_interval[1]_i_1 
       (.I0(iTime_Interval[0]),
        .I1(iTime_Interval[1]),
        .I2(iTime_Interval[2]),
        .I3(\time_interval[1]_i_2_n_0 ),
        .I4(u1_n_9),
        .I5(time_interval[1]),
        .O(\time_interval[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFF)) 
    \time_interval[1]_i_2 
       (.I0(iTime_Interval[5]),
        .I1(iTime_Interval[6]),
        .I2(iTime_Interval[4]),
        .I3(iTime_Interval[7]),
        .I4(iTime_Interval[3]),
        .I5(iTime_Interval[2]),
        .O(\time_interval[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_interval[2]_i_1 
       (.I0(\time_interval[2]_i_2_n_0 ),
        .I1(u1_n_9),
        .I2(time_interval[2]),
        .O(\time_interval[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \time_interval[2]_i_2 
       (.I0(iTime_Interval[0]),
        .I1(iTime_Interval[2]),
        .I2(iTime_Interval[1]),
        .I3(iTime_Interval[3]),
        .I4(\time_interval[2]_i_4_n_0 ),
        .O(\time_interval[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \time_interval[2]_i_4 
       (.I0(iTime_Interval[7]),
        .I1(iTime_Interval[4]),
        .I2(iTime_Interval[6]),
        .I3(iTime_Interval[5]),
        .O(\time_interval[2]_i_4_n_0 ));
  FDPE \time_interval_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .D(\time_interval[0]_i_1_n_0 ),
        .PRE(u1_n_0),
        .Q(time_interval[0]));
  FDCE \time_interval_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(u1_n_0),
        .D(\time_interval[1]_i_1_n_0 ),
        .Q(time_interval[1]));
  FDCE \time_interval_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(u1_n_0),
        .D(\time_interval[2]_i_1_n_0 ),
        .Q(time_interval[2]));
  LUT5 #(
    .INIT(32'h0000AEAA)) 
    \tx_data[0]_i_1 
       (.I0(\tx_data[0]_i_2_n_0 ),
        .I1(\tx_data[0]_i_3_n_0 ),
        .I2(i_0[1]),
        .I3(i_0[2]),
        .I4(\tx_data[0]_i_4_n_0 ),
        .O(tx_data[0]));
  LUT6 #(
    .INIT(64'hFF0F0F0F8F8F0F0F)) 
    \tx_data[0]_i_2 
       (.I0(i_0[0]),
        .I1(\current_gap_no_reg_n_0_[0] ),
        .I2(i_0[3]),
        .I3(check_sum[0]),
        .I4(i_0[1]),
        .I5(i_0[2]),
        .O(\tx_data[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hBFFB)) 
    \tx_data[0]_i_3 
       (.I0(\time_interval[1]_i_2_n_0 ),
        .I1(iTime_Interval[0]),
        .I2(iTime_Interval[1]),
        .I3(iTime_Interval[2]),
        .O(\tx_data[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000047FFFFFF)) 
    \tx_data[0]_i_4 
       (.I0(\locked_pulse_counter_reg_n_0_[0] ),
        .I1(i_0[0]),
        .I2(in7[0]),
        .I3(i_0[2]),
        .I4(i_0[1]),
        .I5(\tx_data[0]_i_5_n_0 ),
        .O(\tx_data[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hABAAABAB)) 
    \tx_data[0]_i_5 
       (.I0(i_0[3]),
        .I1(i_0[0]),
        .I2(i_0[1]),
        .I3(in5),
        .I4(i_0[2]),
        .O(\tx_data[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h8A888888)) 
    \tx_data[1]_i_1 
       (.I0(\tx_data[1]_i_2_n_0 ),
        .I1(\tx_data[1]_i_3_n_0 ),
        .I2(i_0[1]),
        .I3(i_0[2]),
        .I4(\tx_data[1]_i_4_n_0 ),
        .O(tx_data[1]));
  LUT6 #(
    .INIT(64'hFBBBEAEAFBBBAAAA)) 
    \tx_data[1]_i_2 
       (.I0(i_0[3]),
        .I1(i_0[2]),
        .I2(i_0[1]),
        .I3(\locked_pulse_counter_reg_n_0_[1] ),
        .I4(i_0[0]),
        .I5(in7[1]),
        .O(\tx_data[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFB3B3B33F333F33)) 
    \tx_data[1]_i_3 
       (.I0(check_sum[1]),
        .I1(i_0[3]),
        .I2(i_0[2]),
        .I3(i_0[0]),
        .I4(\current_gap_no_reg_n_0_[1] ),
        .I5(i_0[1]),
        .O(\tx_data[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0081)) 
    \tx_data[1]_i_4 
       (.I0(iTime_Interval[0]),
        .I1(iTime_Interval[1]),
        .I2(iTime_Interval[2]),
        .I3(\time_interval[1]_i_2_n_0 ),
        .O(\tx_data[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000AEAA)) 
    \tx_data[2]_i_1 
       (.I0(\tx_data[2]_i_2_n_0 ),
        .I1(\time_interval[2]_i_2_n_0 ),
        .I2(i_0[1]),
        .I3(i_0[2]),
        .I4(\tx_data[2]_i_3_n_0 ),
        .O(tx_data[2]));
  LUT6 #(
    .INIT(64'hFF0F0F0F8F8F0F0F)) 
    \tx_data[2]_i_2 
       (.I0(i_0[0]),
        .I1(\current_gap_no_reg_n_0_[2] ),
        .I2(i_0[3]),
        .I3(check_sum[2]),
        .I4(i_0[1]),
        .I5(i_0[2]),
        .O(\tx_data[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000047FFFFFF)) 
    \tx_data[2]_i_3 
       (.I0(\locked_pulse_counter_reg_n_0_[2] ),
        .I1(i_0[0]),
        .I2(in7[2]),
        .I3(i_0[2]),
        .I4(i_0[1]),
        .I5(\tx_data[2]_i_4_n_0 ),
        .O(\tx_data[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAEAAF)) 
    \tx_data[2]_i_4 
       (.I0(i_0[3]),
        .I1(\phase_diff_reg_n_0_[2] ),
        .I2(i_0[2]),
        .I3(i_0[0]),
        .I4(i_0[1]),
        .O(\tx_data[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAFEAE)) 
    \tx_data[3]_i_1 
       (.I0(\tx_data[3]_i_2_n_0 ),
        .I1(in7[3]),
        .I2(i_0[0]),
        .I3(\locked_pulse_counter_reg_n_0_[3] ),
        .I4(\tx_data[3]_i_3_n_0 ),
        .I5(\tx_data[3]_i_4_n_0 ),
        .O(tx_data[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hAFAAEFAA)) 
    \tx_data[3]_i_2 
       (.I0(i_0[3]),
        .I1(\phase_diff_reg_n_0_[3] ),
        .I2(i_0[2]),
        .I3(i_0[0]),
        .I4(i_0[1]),
        .O(\tx_data[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \tx_data[3]_i_3 
       (.I0(i_0[2]),
        .I1(i_0[1]),
        .O(\tx_data[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A002AAA2AA02AAA)) 
    \tx_data[3]_i_4 
       (.I0(i_0[3]),
        .I1(check_sum[3]),
        .I2(i_0[1]),
        .I3(i_0[2]),
        .I4(i_0[0]),
        .I5(\current_gap_no_reg_n_0_[3] ),
        .O(\tx_data[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hD5550000D555D555)) 
    \tx_data[4]_i_1 
       (.I0(i_0[3]),
        .I1(check_sum[4]),
        .I2(i_0[1]),
        .I3(i_0[2]),
        .I4(\tx_data[4]_i_2_n_0 ),
        .I5(\tx_data[4]_i_3_n_0 ),
        .O(tx_data[4]));
  LUT5 #(
    .INIT(32'hAEAAAAAF)) 
    \tx_data[4]_i_2 
       (.I0(i_0[3]),
        .I1(\phase_diff_reg_n_0_[7] ),
        .I2(i_0[1]),
        .I3(i_0[0]),
        .I4(i_0[2]),
        .O(\tx_data[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h777FFF7F)) 
    \tx_data[4]_i_3 
       (.I0(i_0[1]),
        .I1(i_0[2]),
        .I2(in7[4]),
        .I3(i_0[0]),
        .I4(\locked_pulse_counter_reg_n_0_[4] ),
        .O(\tx_data[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    \tx_data[5]_i_1 
       (.I0(check_sum[5]),
        .I1(i_0[1]),
        .I2(i_0[2]),
        .I3(i_0[3]),
        .I4(\tx_data[5]_i_2_n_0 ),
        .O(tx_data[5]));
  LUT6 #(
    .INIT(64'hAA00CC00F0FF0000)) 
    \tx_data[5]_i_2 
       (.I0(\locked_pulse_counter_reg_n_0_[5] ),
        .I1(in7[5]),
        .I2(\phase_diff_reg_n_0_[5] ),
        .I3(i_0[2]),
        .I4(i_0[0]),
        .I5(i_0[1]),
        .O(\tx_data[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88000003BB333333)) 
    \tx_data[6]_i_1 
       (.I0(check_sum[6]),
        .I1(i_0[3]),
        .I2(i_0[0]),
        .I3(i_0[1]),
        .I4(i_0[2]),
        .I5(\tx_data[6]_i_2_n_0 ),
        .O(tx_data[6]));
  LUT6 #(
    .INIT(64'h37F73F3F37F7FFFF)) 
    \tx_data[6]_i_2 
       (.I0(\phase_diff_reg_n_0_[6] ),
        .I1(i_0[2]),
        .I2(i_0[1]),
        .I3(\locked_pulse_counter_reg_n_0_[6] ),
        .I4(i_0[0]),
        .I5(in7[6]),
        .O(\tx_data[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    \tx_data[7]_i_2 
       (.I0(i_0[2]),
        .I1(check_sum[7]),
        .I2(i_0[1]),
        .I3(i_0[3]),
        .I4(\tx_data[7]_i_3_n_0 ),
        .O(tx_data[7]));
  LUT6 #(
    .INIT(64'hCCF0AA0000FF0000)) 
    \tx_data[7]_i_3 
       (.I0(in7[7]),
        .I1(\locked_pulse_counter_reg_n_0_[7] ),
        .I2(\phase_diff_reg_n_0_[7] ),
        .I3(i_0[1]),
        .I4(i_0[0]),
        .I5(i_0[2]),
        .O(\tx_data[7]_i_3_n_0 ));
  FDRE \tx_data_reg[0] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[0]),
        .Q(\tx_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \tx_data_reg[1] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[1]),
        .Q(data2),
        .R(1'b0));
  FDRE \tx_data_reg[2] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[2]),
        .Q(data3),
        .R(1'b0));
  FDRE \tx_data_reg[3] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[3]),
        .Q(data4),
        .R(1'b0));
  FDRE \tx_data_reg[4] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[4]),
        .Q(data5),
        .R(1'b0));
  FDRE \tx_data_reg[5] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[5]),
        .Q(data6),
        .R(1'b0));
  FDRE \tx_data_reg[6] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[6]),
        .Q(data7),
        .R(1'b0));
  FDRE \tx_data_reg[7] 
       (.C(iClk),
        .CE(u1_n_7),
        .D(tx_data[7]),
        .Q(data0),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module u1
       (.D(i__0),
        .E(u1_n_2),
        .\FSM_sequential_i_reg[0] (u1_n_10),
        .\FSM_sequential_i_reg[3] (u1_n_9),
        .Q(i_0),
        .iClk(iClk),
        .iEn(iEn),
        .iEn_0(u1_n_8),
        .iRst_N(iRst_N),
        .iRst_N_0(u1_n_0),
        .\i_reg[2] (uart_en_reg_n_0),
        .\locked_pulse_counter_reg[0] (\locked_pulse_counter[15]_i_2_n_0 ),
        .oTxd_Pin(oTxd_Pin),
        .rdone_reg(u1_n_7),
        .rdone_reg_0(u1_n_11),
        .rtx_pin_i_11({data0,data7,data6,data5,data4,data3,data2,\tx_data_reg_n_0_[0] }),
        .uart_en_reg(uart_en_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    uart_en_i_2
       (.I0(i_0[3]),
        .I1(i_0[2]),
        .O(uart_en_i_2_n_0));
  FDRE uart_en_reg
       (.C(iClk),
        .CE(1'b1),
        .D(u1_n_11),
        .Q(uart_en_reg_n_0),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module
   (iRst_N_0,
    oTxd_Pin,
    E,
    D,
    rdone_reg,
    iEn_0,
    \FSM_sequential_i_reg[3] ,
    \FSM_sequential_i_reg[0] ,
    rdone_reg_0,
    iClk,
    Q,
    iEn,
    iRst_N,
    \locked_pulse_counter_reg[0] ,
    \i_reg[2] ,
    uart_en_reg,
    rtx_pin_i_11);
  output iRst_N_0;
  output oTxd_Pin;
  output [0:0]E;
  output [3:0]D;
  output [0:0]rdone_reg;
  output [0:0]iEn_0;
  output \FSM_sequential_i_reg[3] ;
  output [0:0]\FSM_sequential_i_reg[0] ;
  output rdone_reg_0;
  input iClk;
  input [3:0]Q;
  input iEn;
  input iRst_N;
  input \locked_pulse_counter_reg[0] ;
  input \i_reg[2] ;
  input uart_en_reg;
  input [7:0]rtx_pin_i_11;

  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_i_reg[0] ;
  wire \FSM_sequential_i_reg[3] ;
  wire [3:0]Q;
  wire iClk;
  wire iEn;
  wire [0:0]iEn_0;
  wire iRst_N;
  wire iRst_N_0;
  wire \i_reg[2] ;
  wire \locked_pulse_counter_reg[0] ;
  wire oTxd_Pin;
  wire [0:0]rdone_reg;
  wire rdone_reg_0;
  wire [7:0]rtx_pin_i_11;
  wire u1_n_1;
  wire u1_n_2;
  wire u1_n_3;
  wire uart_en_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module_BPS_Generator u1
       (.\cnt_bps_reg[1]_0 (u1_n_3),
        .\cnt_bps_reg[28]_0 (u1_n_1),
        .\cnt_bps_reg[5]_0 (u1_n_2),
        .iClk(iClk),
        .iRst_N(iRst_N),
        .iRst_N_0(iRst_N_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module_TX u2
       (.D(D),
        .E(E),
        .\FSM_sequential_i_reg[0] (\FSM_sequential_i_reg[0] ),
        .\FSM_sequential_i_reg[3] (\FSM_sequential_i_reg[3] ),
        .Q(Q),
        .iClk(iClk),
        .iEn(iEn),
        .iEn_0(iEn_0),
        .iRst_N(iRst_N),
        .\i_reg[2]_0 (\i_reg[2] ),
        .\i_reg[3]_0 (iRst_N_0),
        .\locked_pulse_counter_reg[0] (\locked_pulse_counter_reg[0] ),
        .oTxd_Pin(oTxd_Pin),
        .rdone_reg_0(rdone_reg),
        .rdone_reg_1(rdone_reg_0),
        .rdone_reg_2(u1_n_2),
        .rtx_pin_i_11_0(rtx_pin_i_11),
        .rtx_pin_reg_0(u1_n_1),
        .rtx_pin_reg_1(u1_n_3),
        .uart_en_reg(uart_en_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module_BPS_Generator
   (iRst_N_0,
    \cnt_bps_reg[28]_0 ,
    \cnt_bps_reg[5]_0 ,
    \cnt_bps_reg[1]_0 ,
    iRst_N,
    iClk);
  output iRst_N_0;
  output \cnt_bps_reg[28]_0 ;
  output \cnt_bps_reg[5]_0 ;
  output \cnt_bps_reg[1]_0 ;
  input iRst_N;
  input iClk;

  wire [31:0]cnt_bps;
  wire cnt_bps0_carry__0_n_0;
  wire cnt_bps0_carry__0_n_1;
  wire cnt_bps0_carry__0_n_2;
  wire cnt_bps0_carry__0_n_3;
  wire cnt_bps0_carry__0_n_4;
  wire cnt_bps0_carry__0_n_5;
  wire cnt_bps0_carry__0_n_6;
  wire cnt_bps0_carry__0_n_7;
  wire cnt_bps0_carry__1_n_0;
  wire cnt_bps0_carry__1_n_1;
  wire cnt_bps0_carry__1_n_2;
  wire cnt_bps0_carry__1_n_3;
  wire cnt_bps0_carry__1_n_4;
  wire cnt_bps0_carry__1_n_5;
  wire cnt_bps0_carry__1_n_6;
  wire cnt_bps0_carry__1_n_7;
  wire cnt_bps0_carry__2_n_0;
  wire cnt_bps0_carry__2_n_1;
  wire cnt_bps0_carry__2_n_2;
  wire cnt_bps0_carry__2_n_3;
  wire cnt_bps0_carry__2_n_4;
  wire cnt_bps0_carry__2_n_5;
  wire cnt_bps0_carry__2_n_6;
  wire cnt_bps0_carry__2_n_7;
  wire cnt_bps0_carry__3_n_0;
  wire cnt_bps0_carry__3_n_1;
  wire cnt_bps0_carry__3_n_2;
  wire cnt_bps0_carry__3_n_3;
  wire cnt_bps0_carry__3_n_4;
  wire cnt_bps0_carry__3_n_5;
  wire cnt_bps0_carry__3_n_6;
  wire cnt_bps0_carry__3_n_7;
  wire cnt_bps0_carry__4_n_0;
  wire cnt_bps0_carry__4_n_1;
  wire cnt_bps0_carry__4_n_2;
  wire cnt_bps0_carry__4_n_3;
  wire cnt_bps0_carry__4_n_4;
  wire cnt_bps0_carry__4_n_5;
  wire cnt_bps0_carry__4_n_6;
  wire cnt_bps0_carry__4_n_7;
  wire cnt_bps0_carry__5_n_0;
  wire cnt_bps0_carry__5_n_1;
  wire cnt_bps0_carry__5_n_2;
  wire cnt_bps0_carry__5_n_3;
  wire cnt_bps0_carry__5_n_4;
  wire cnt_bps0_carry__5_n_5;
  wire cnt_bps0_carry__5_n_6;
  wire cnt_bps0_carry__5_n_7;
  wire cnt_bps0_carry__6_n_2;
  wire cnt_bps0_carry__6_n_3;
  wire cnt_bps0_carry__6_n_5;
  wire cnt_bps0_carry__6_n_6;
  wire cnt_bps0_carry__6_n_7;
  wire cnt_bps0_carry_n_0;
  wire cnt_bps0_carry_n_1;
  wire cnt_bps0_carry_n_2;
  wire cnt_bps0_carry_n_3;
  wire cnt_bps0_carry_n_4;
  wire cnt_bps0_carry_n_5;
  wire cnt_bps0_carry_n_6;
  wire cnt_bps0_carry_n_7;
  wire \cnt_bps[31]_i_2_n_0 ;
  wire \cnt_bps[31]_i_3_n_0 ;
  wire [31:0]cnt_bps_0;
  wire \cnt_bps_reg[1]_0 ;
  wire \cnt_bps_reg[28]_0 ;
  wire \cnt_bps_reg[5]_0 ;
  wire iClk;
  wire iRst_N;
  wire iRst_N_0;
  wire rtx_pin_i_12_n_0;
  wire rtx_pin_i_13_n_0;
  wire rtx_pin_i_14_n_0;
  wire rtx_pin_i_15_n_0;
  wire rtx_pin_i_16_n_0;
  wire [3:2]NLW_cnt_bps0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_cnt_bps0_carry__6_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry
       (.CI(1'b0),
        .CO({cnt_bps0_carry_n_0,cnt_bps0_carry_n_1,cnt_bps0_carry_n_2,cnt_bps0_carry_n_3}),
        .CYINIT(cnt_bps[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry_n_4,cnt_bps0_carry_n_5,cnt_bps0_carry_n_6,cnt_bps0_carry_n_7}),
        .S(cnt_bps[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__0
       (.CI(cnt_bps0_carry_n_0),
        .CO({cnt_bps0_carry__0_n_0,cnt_bps0_carry__0_n_1,cnt_bps0_carry__0_n_2,cnt_bps0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__0_n_4,cnt_bps0_carry__0_n_5,cnt_bps0_carry__0_n_6,cnt_bps0_carry__0_n_7}),
        .S(cnt_bps[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__1
       (.CI(cnt_bps0_carry__0_n_0),
        .CO({cnt_bps0_carry__1_n_0,cnt_bps0_carry__1_n_1,cnt_bps0_carry__1_n_2,cnt_bps0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__1_n_4,cnt_bps0_carry__1_n_5,cnt_bps0_carry__1_n_6,cnt_bps0_carry__1_n_7}),
        .S(cnt_bps[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__2
       (.CI(cnt_bps0_carry__1_n_0),
        .CO({cnt_bps0_carry__2_n_0,cnt_bps0_carry__2_n_1,cnt_bps0_carry__2_n_2,cnt_bps0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__2_n_4,cnt_bps0_carry__2_n_5,cnt_bps0_carry__2_n_6,cnt_bps0_carry__2_n_7}),
        .S(cnt_bps[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__3
       (.CI(cnt_bps0_carry__2_n_0),
        .CO({cnt_bps0_carry__3_n_0,cnt_bps0_carry__3_n_1,cnt_bps0_carry__3_n_2,cnt_bps0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__3_n_4,cnt_bps0_carry__3_n_5,cnt_bps0_carry__3_n_6,cnt_bps0_carry__3_n_7}),
        .S(cnt_bps[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__4
       (.CI(cnt_bps0_carry__3_n_0),
        .CO({cnt_bps0_carry__4_n_0,cnt_bps0_carry__4_n_1,cnt_bps0_carry__4_n_2,cnt_bps0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__4_n_4,cnt_bps0_carry__4_n_5,cnt_bps0_carry__4_n_6,cnt_bps0_carry__4_n_7}),
        .S(cnt_bps[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__5
       (.CI(cnt_bps0_carry__4_n_0),
        .CO({cnt_bps0_carry__5_n_0,cnt_bps0_carry__5_n_1,cnt_bps0_carry__5_n_2,cnt_bps0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({cnt_bps0_carry__5_n_4,cnt_bps0_carry__5_n_5,cnt_bps0_carry__5_n_6,cnt_bps0_carry__5_n_7}),
        .S(cnt_bps[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt_bps0_carry__6
       (.CI(cnt_bps0_carry__5_n_0),
        .CO({NLW_cnt_bps0_carry__6_CO_UNCONNECTED[3:2],cnt_bps0_carry__6_n_2,cnt_bps0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_cnt_bps0_carry__6_O_UNCONNECTED[3],cnt_bps0_carry__6_n_5,cnt_bps0_carry__6_n_6,cnt_bps0_carry__6_n_7}),
        .S({1'b0,cnt_bps[31:29]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \cnt_bps[0]_i_1 
       (.I0(cnt_bps[0]),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[10]_i_1 
       (.I0(cnt_bps0_carry__1_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[11]_i_1 
       (.I0(cnt_bps0_carry__1_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[12]_i_1 
       (.I0(cnt_bps0_carry__1_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[13]_i_1 
       (.I0(cnt_bps0_carry__2_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[14]_i_1 
       (.I0(cnt_bps0_carry__2_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[15]_i_1 
       (.I0(cnt_bps0_carry__2_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[16]_i_1 
       (.I0(cnt_bps0_carry__2_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[17]_i_1 
       (.I0(cnt_bps0_carry__3_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[18]_i_1 
       (.I0(cnt_bps0_carry__3_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[19]_i_1 
       (.I0(cnt_bps0_carry__3_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[1]_i_1 
       (.I0(cnt_bps0_carry_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[20]_i_1 
       (.I0(cnt_bps0_carry__3_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[21]_i_1 
       (.I0(cnt_bps0_carry__4_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[22]_i_1 
       (.I0(cnt_bps0_carry__4_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[23]_i_1 
       (.I0(cnt_bps0_carry__4_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[24]_i_1 
       (.I0(cnt_bps0_carry__4_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[25]_i_1 
       (.I0(cnt_bps0_carry__5_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[26]_i_1 
       (.I0(cnt_bps0_carry__5_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[27]_i_1 
       (.I0(cnt_bps0_carry__5_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[28]_i_1 
       (.I0(cnt_bps0_carry__5_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[29]_i_1 
       (.I0(cnt_bps0_carry__6_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[2]_i_1 
       (.I0(cnt_bps0_carry_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[30]_i_1 
       (.I0(cnt_bps0_carry__6_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[31]_i_1 
       (.I0(cnt_bps0_carry__6_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[31]));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \cnt_bps[31]_i_2 
       (.I0(\cnt_bps_reg[28]_0 ),
        .I1(rtx_pin_i_12_n_0),
        .I2(cnt_bps[1]),
        .I3(cnt_bps[5]),
        .I4(cnt_bps[2]),
        .I5(\cnt_bps[31]_i_3_n_0 ),
        .O(\cnt_bps[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    \cnt_bps[31]_i_3 
       (.I0(cnt_bps[4]),
        .I1(cnt_bps[31]),
        .I2(cnt_bps[6]),
        .I3(cnt_bps[8]),
        .I4(cnt_bps[0]),
        .I5(cnt_bps[3]),
        .O(\cnt_bps[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[3]_i_1 
       (.I0(cnt_bps0_carry_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[4]_i_1 
       (.I0(cnt_bps0_carry_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[5]_i_1 
       (.I0(cnt_bps0_carry__0_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[6]_i_1 
       (.I0(cnt_bps0_carry__0_n_6),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[7]_i_1 
       (.I0(cnt_bps0_carry__0_n_5),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[8]_i_1 
       (.I0(cnt_bps0_carry__0_n_4),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_bps[9]_i_1 
       (.I0(cnt_bps0_carry__1_n_7),
        .I1(\cnt_bps[31]_i_2_n_0 ),
        .O(cnt_bps_0[9]));
  FDCE \cnt_bps_reg[0] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[0]),
        .Q(cnt_bps[0]));
  FDCE \cnt_bps_reg[10] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[10]),
        .Q(cnt_bps[10]));
  FDCE \cnt_bps_reg[11] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[11]),
        .Q(cnt_bps[11]));
  FDCE \cnt_bps_reg[12] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[12]),
        .Q(cnt_bps[12]));
  FDCE \cnt_bps_reg[13] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[13]),
        .Q(cnt_bps[13]));
  FDCE \cnt_bps_reg[14] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[14]),
        .Q(cnt_bps[14]));
  FDCE \cnt_bps_reg[15] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[15]),
        .Q(cnt_bps[15]));
  FDCE \cnt_bps_reg[16] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[16]),
        .Q(cnt_bps[16]));
  FDCE \cnt_bps_reg[17] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[17]),
        .Q(cnt_bps[17]));
  FDCE \cnt_bps_reg[18] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[18]),
        .Q(cnt_bps[18]));
  FDCE \cnt_bps_reg[19] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[19]),
        .Q(cnt_bps[19]));
  FDCE \cnt_bps_reg[1] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[1]),
        .Q(cnt_bps[1]));
  FDCE \cnt_bps_reg[20] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[20]),
        .Q(cnt_bps[20]));
  FDCE \cnt_bps_reg[21] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[21]),
        .Q(cnt_bps[21]));
  FDCE \cnt_bps_reg[22] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[22]),
        .Q(cnt_bps[22]));
  FDCE \cnt_bps_reg[23] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[23]),
        .Q(cnt_bps[23]));
  FDCE \cnt_bps_reg[24] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[24]),
        .Q(cnt_bps[24]));
  FDCE \cnt_bps_reg[25] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[25]),
        .Q(cnt_bps[25]));
  FDCE \cnt_bps_reg[26] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[26]),
        .Q(cnt_bps[26]));
  FDCE \cnt_bps_reg[27] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[27]),
        .Q(cnt_bps[27]));
  FDCE \cnt_bps_reg[28] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[28]),
        .Q(cnt_bps[28]));
  FDCE \cnt_bps_reg[29] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[29]),
        .Q(cnt_bps[29]));
  FDCE \cnt_bps_reg[2] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[2]),
        .Q(cnt_bps[2]));
  FDCE \cnt_bps_reg[30] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[30]),
        .Q(cnt_bps[30]));
  FDCE \cnt_bps_reg[31] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[31]),
        .Q(cnt_bps[31]));
  FDCE \cnt_bps_reg[3] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[3]),
        .Q(cnt_bps[3]));
  FDCE \cnt_bps_reg[4] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[4]),
        .Q(cnt_bps[4]));
  FDCE \cnt_bps_reg[5] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[5]),
        .Q(cnt_bps[5]));
  FDCE \cnt_bps_reg[6] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[6]),
        .Q(cnt_bps[6]));
  FDCE \cnt_bps_reg[7] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[7]),
        .Q(cnt_bps[7]));
  FDCE \cnt_bps_reg[8] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[8]),
        .Q(cnt_bps[8]));
  FDCE \cnt_bps_reg[9] 
       (.C(iClk),
        .CE(1'b1),
        .CLR(iRst_N_0),
        .D(cnt_bps_0[9]),
        .Q(cnt_bps[9]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    rtx_pin_i_12
       (.I0(cnt_bps[17]),
        .I1(cnt_bps[16]),
        .I2(cnt_bps[30]),
        .I3(cnt_bps[15]),
        .O(rtx_pin_i_12_n_0));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    rtx_pin_i_13
       (.I0(cnt_bps[4]),
        .I1(cnt_bps[31]),
        .I2(cnt_bps[8]),
        .I3(cnt_bps[0]),
        .I4(cnt_bps[2]),
        .I5(cnt_bps[3]),
        .O(rtx_pin_i_13_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    rtx_pin_i_14
       (.I0(cnt_bps[12]),
        .I1(cnt_bps[14]),
        .I2(cnt_bps[13]),
        .I3(cnt_bps[19]),
        .I4(cnt_bps[20]),
        .I5(cnt_bps[18]),
        .O(rtx_pin_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rtx_pin_i_15
       (.I0(cnt_bps[21]),
        .I1(cnt_bps[11]),
        .I2(cnt_bps[10]),
        .I3(cnt_bps[23]),
        .I4(cnt_bps[9]),
        .I5(cnt_bps[22]),
        .O(rtx_pin_i_15_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    rtx_pin_i_16
       (.I0(cnt_bps[24]),
        .I1(cnt_bps[29]),
        .I2(cnt_bps[7]),
        .I3(cnt_bps[26]),
        .O(rtx_pin_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    rtx_pin_i_2
       (.I0(iRst_N),
        .O(iRst_N_0));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    rtx_pin_i_5
       (.I0(rtx_pin_i_12_n_0),
        .I1(cnt_bps[5]),
        .I2(cnt_bps[6]),
        .I3(cnt_bps[1]),
        .I4(rtx_pin_i_13_n_0),
        .I5(\cnt_bps_reg[28]_0 ),
        .O(\cnt_bps_reg[5]_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    rtx_pin_i_7
       (.I0(rtx_pin_i_14_n_0),
        .I1(rtx_pin_i_15_n_0),
        .I2(cnt_bps[28]),
        .I3(cnt_bps[27]),
        .I4(cnt_bps[25]),
        .I5(rtx_pin_i_16_n_0),
        .O(\cnt_bps_reg[28]_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    rtx_pin_i_8
       (.I0(rtx_pin_i_13_n_0),
        .I1(cnt_bps[1]),
        .I2(cnt_bps[6]),
        .I3(cnt_bps[5]),
        .I4(rtx_pin_i_12_n_0),
        .O(\cnt_bps_reg[1]_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZUART_Module_TX
   (oTxd_Pin,
    E,
    D,
    rdone_reg_0,
    iEn_0,
    \FSM_sequential_i_reg[3] ,
    \FSM_sequential_i_reg[0] ,
    rdone_reg_1,
    iClk,
    \i_reg[3]_0 ,
    Q,
    iEn,
    iRst_N,
    \locked_pulse_counter_reg[0] ,
    rdone_reg_2,
    \i_reg[2]_0 ,
    uart_en_reg,
    rtx_pin_reg_0,
    rtx_pin_reg_1,
    rtx_pin_i_11_0);
  output oTxd_Pin;
  output [0:0]E;
  output [3:0]D;
  output [0:0]rdone_reg_0;
  output [0:0]iEn_0;
  output \FSM_sequential_i_reg[3] ;
  output [0:0]\FSM_sequential_i_reg[0] ;
  output rdone_reg_1;
  input iClk;
  input \i_reg[3]_0 ;
  input [3:0]Q;
  input iEn;
  input iRst_N;
  input \locked_pulse_counter_reg[0] ;
  input rdone_reg_2;
  input \i_reg[2]_0 ;
  input uart_en_reg;
  input rtx_pin_reg_0;
  input rtx_pin_reg_1;
  input [7:0]rtx_pin_i_11_0;

  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_i_reg[0] ;
  wire \FSM_sequential_i_reg[3] ;
  wire [3:0]Q;
  wire [3:0]i;
  wire iClk;
  wire iEn;
  wire [0:0]iEn_0;
  wire iRst_N;
  wire \i_reg[2]_0 ;
  wire \i_reg[3]_0 ;
  wire \locked_pulse_counter_reg[0] ;
  wire oTxd_Pin;
  wire p_0_in;
  wire [3:0]p_1_in;
  wire rdone_i_1_n_0;
  wire rdone_i_2_n_0;
  wire [0:0]rdone_reg_0;
  wire rdone_reg_1;
  wire rdone_reg_2;
  wire rtx_pin_i_10_n_0;
  wire [7:0]rtx_pin_i_11_0;
  wire rtx_pin_i_11_n_0;
  wire rtx_pin_i_17_n_0;
  wire rtx_pin_i_18_n_0;
  wire rtx_pin_i_1_n_0;
  wire rtx_pin_i_3_n_0;
  wire rtx_pin_i_4_n_0;
  wire rtx_pin_i_6_n_0;
  wire rtx_pin_i_9_n_0;
  wire rtx_pin_reg_0;
  wire rtx_pin_reg_1;
  wire tx_done;
  wire uart_en_reg;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h45555555)) 
    \FSM_sequential_i[0]_i_1 
       (.I0(Q[0]),
        .I1(tx_done),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h4A5A5A5A)) 
    \FSM_sequential_i[1]_i_1 
       (.I0(Q[0]),
        .I1(tx_done),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h6A6A626A)) 
    \FSM_sequential_i[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(tx_done),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hA8888888)) 
    \FSM_sequential_i[3]_i_1 
       (.I0(iEn),
        .I1(tx_done),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(iEn_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7388FF00)) 
    \FSM_sequential_i[3]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(tx_done),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0070)) 
    \i[0]_i_1 
       (.I0(i[2]),
        .I1(i[3]),
        .I2(\i_reg[2]_0 ),
        .I3(i[0]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00282828)) 
    \i[1]_i_1 
       (.I0(\i_reg[2]_0 ),
        .I1(i[1]),
        .I2(i[0]),
        .I3(i[2]),
        .I4(i[3]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h80802A80)) 
    \i[2]_i_1 
       (.I0(\i_reg[2]_0 ),
        .I1(i[1]),
        .I2(i[0]),
        .I3(i[2]),
        .I4(i[3]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'h1FFFFFFF1F0F0F0F)) 
    \i[3]_i_1 
       (.I0(i[0]),
        .I1(i[1]),
        .I2(\i_reg[2]_0 ),
        .I3(i[2]),
        .I4(i[3]),
        .I5(rdone_reg_2),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00AA8000)) 
    \i[3]_i_2 
       (.I0(\i_reg[2]_0 ),
        .I1(i[0]),
        .I2(i[1]),
        .I3(i[2]),
        .I4(i[3]),
        .O(p_1_in[3]));
  FDCE \i_reg[0] 
       (.C(iClk),
        .CE(p_0_in),
        .CLR(\i_reg[3]_0 ),
        .D(p_1_in[0]),
        .Q(i[0]));
  FDCE \i_reg[1] 
       (.C(iClk),
        .CE(p_0_in),
        .CLR(\i_reg[3]_0 ),
        .D(p_1_in[1]),
        .Q(i[1]));
  FDCE \i_reg[2] 
       (.C(iClk),
        .CE(p_0_in),
        .CLR(\i_reg[3]_0 ),
        .D(p_1_in[2]),
        .Q(i[2]));
  FDCE \i_reg[3] 
       (.C(iClk),
        .CE(p_0_in),
        .CLR(\i_reg[3]_0 ),
        .D(p_1_in[3]),
        .Q(i[3]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \locked_pulse_counter[15]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(tx_done),
        .I4(Q[3]),
        .I5(\locked_pulse_counter_reg[0] ),
        .O(\FSM_sequential_i_reg[0] ));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    \phase_diff[8]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(tx_done),
        .I4(iEn),
        .I5(Q[3]),
        .O(E));
  LUT6 #(
    .INIT(64'hBBFF000010000000)) 
    rdone_i_1
       (.I0(rdone_i_2_n_0),
        .I1(i[2]),
        .I2(rdone_reg_2),
        .I3(i[3]),
        .I4(\i_reg[2]_0 ),
        .I5(tx_done),
        .O(rdone_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hBD)) 
    rdone_i_2
       (.I0(i[2]),
        .I1(i[0]),
        .I2(i[1]),
        .O(rdone_i_2_n_0));
  FDCE rdone_reg
       (.C(iClk),
        .CE(1'b1),
        .CLR(\i_reg[3]_0 ),
        .D(rdone_i_1_n_0),
        .Q(tx_done));
  LUT6 #(
    .INIT(64'hFFEFAAAA0020AAAA)) 
    rtx_pin_i_1
       (.I0(rtx_pin_i_3_n_0),
        .I1(rtx_pin_i_4_n_0),
        .I2(rdone_reg_2),
        .I3(rtx_pin_i_6_n_0),
        .I4(\i_reg[2]_0 ),
        .I5(oTxd_Pin),
        .O(rtx_pin_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    rtx_pin_i_10
       (.I0(i[1]),
        .I1(i[0]),
        .O(rtx_pin_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFF00FF40FF40FF)) 
    rtx_pin_i_11
       (.I0(rtx_pin_i_10_n_0),
        .I1(i[3]),
        .I2(rtx_pin_i_17_n_0),
        .I3(\i_reg[2]_0 ),
        .I4(rtx_pin_i_18_n_0),
        .I5(i[2]),
        .O(rtx_pin_i_11_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    rtx_pin_i_17
       (.I0(rtx_pin_i_11_0[2]),
        .I1(rtx_pin_i_11_0[1]),
        .I2(i[1]),
        .I3(rtx_pin_i_11_0[0]),
        .I4(i[0]),
        .I5(rtx_pin_i_11_0[7]),
        .O(rtx_pin_i_17_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    rtx_pin_i_18
       (.I0(rtx_pin_i_11_0[6]),
        .I1(rtx_pin_i_11_0[5]),
        .I2(i[1]),
        .I3(rtx_pin_i_11_0[4]),
        .I4(i[0]),
        .I5(rtx_pin_i_11_0[3]),
        .O(rtx_pin_i_18_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF808F0000)) 
    rtx_pin_i_3
       (.I0(rtx_pin_reg_0),
        .I1(rtx_pin_reg_1),
        .I2(i[3]),
        .I3(rtx_pin_i_9_n_0),
        .I4(rtx_pin_i_10_n_0),
        .I5(rtx_pin_i_11_n_0),
        .O(rtx_pin_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    rtx_pin_i_4
       (.I0(i[0]),
        .I1(i[1]),
        .I2(i[3]),
        .O(rtx_pin_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    rtx_pin_i_6
       (.I0(i[2]),
        .I1(i[3]),
        .O(rtx_pin_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    rtx_pin_i_9
       (.I0(rtx_pin_i_17_n_0),
        .I1(i[2]),
        .I2(rtx_pin_i_18_n_0),
        .O(rtx_pin_i_9_n_0));
  FDPE rtx_pin_reg
       (.C(iClk),
        .CE(1'b1),
        .D(rtx_pin_i_1_n_0),
        .PRE(\i_reg[3]_0 ),
        .Q(oTxd_Pin));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \time_interval[2]_i_3 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(iEn),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(tx_done),
        .O(\FSM_sequential_i_reg[3] ));
  LUT6 #(
    .INIT(64'h1555000000000000)) 
    \tx_data[7]_i_1 
       (.I0(tx_done),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(iRst_N),
        .I5(iEn),
        .O(rdone_reg_0));
  LUT6 #(
    .INIT(64'hD5FFFFFF15000000)) 
    uart_en_i_1
       (.I0(tx_done),
        .I1(uart_en_reg),
        .I2(Q[0]),
        .I3(iRst_N),
        .I4(iEn),
        .I5(\i_reg[2]_0 ),
        .O(rdone_reg_1));
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
