-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Oct 26 09:19:40 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZPulse_Counter_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZPulse_Counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter is
  port (
    oNewDataUpdate : out STD_LOGIC;
    oNewPulseCounter : out STD_LOGIC_VECTOR ( 0 to 0 );
    iTimeInterval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    iClk : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iPulse : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter is
  signal CNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CNT0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal CNT1 : STD_LOGIC;
  signal \CNT1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_n_1\ : STD_LOGIC;
  signal \CNT1_carry__0_n_2\ : STD_LOGIC;
  signal \CNT1_carry__0_n_3\ : STD_LOGIC;
  signal \CNT1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_n_2\ : STD_LOGIC;
  signal \CNT1_carry__1_n_3\ : STD_LOGIC;
  signal CNT1_carry_i_1_n_0 : STD_LOGIC;
  signal CNT1_carry_i_2_n_0 : STD_LOGIC;
  signal CNT1_carry_i_3_n_0 : STD_LOGIC;
  signal CNT1_carry_i_4_n_0 : STD_LOGIC;
  signal CNT1_carry_n_0 : STD_LOGIC;
  signal CNT1_carry_n_1 : STD_LOGIC;
  signal CNT1_carry_n_2 : STD_LOGIC;
  signal CNT1_carry_n_3 : STD_LOGIC;
  signal \CNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[10]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[11]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[12]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[13]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[14]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[15]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[16]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[17]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[18]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[19]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[20]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[21]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[22]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[23]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[24]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[25]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[26]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[27]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[28]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[29]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[2]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[30]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[31]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[3]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[4]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[5]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[6]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[7]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[8]_i_1_n_0\ : STD_LOGIC;
  signal \CNT[9]_i_1_n_0\ : STD_LOGIC;
  signal CNT_Deadline : STD_LOGIC_VECTOR ( 20 downto 1 );
  signal \CNT_Deadline[11]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[12]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[13]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[14]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[15]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[16]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[18]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[19]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[1]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[20]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[20]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[2]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[3]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[4]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[5]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[6]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[7]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[8]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[9]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \CNT_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \CNT_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \CNT_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal oNewDataUpdate0 : STD_LOGIC_VECTOR ( 25 downto 1 );
  signal \oNewDataUpdate_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_5_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_5_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_5_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_6_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_6_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_6_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_4_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_4_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_5_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_5_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_n_3\ : STD_LOGIC;
  signal oNewDataUpdate_carry_i_10_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_11_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_12_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_13_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_14_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_15_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_16_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_17_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_18_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_19_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_1_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_20_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_2_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_3_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_4_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_3 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_6_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_6_n_3 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_7_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_7_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_7_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_7_n_3 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_8_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_8_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_8_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_8_n_3 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_9_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_3 : STD_LOGIC;
  signal \^onewpulsecounter\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \oNewPulseCounter[12]_i_1_n_0\ : STD_LOGIC;
  signal \oNewPulseCounter[12]_i_2_n_0\ : STD_LOGIC;
  signal zero_signal : STD_LOGIC;
  signal zero_signal0 : STD_LOGIC_VECTOR ( 25 downto 2 );
  signal \zero_signal_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_17_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_5_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_5_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_6_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_6_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_6_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_7_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_7_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_7_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_4_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_4_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__1_n_3\ : STD_LOGIC;
  signal zero_signal_carry_i_10_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_11_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_12_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_13_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_14_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_15_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_16_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_17_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_18_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_19_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_1_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_2_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_3_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_4_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_1 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_2 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_3 : STD_LOGIC;
  signal zero_signal_carry_i_6_n_3 : STD_LOGIC;
  signal zero_signal_carry_i_7_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_7_n_1 : STD_LOGIC;
  signal zero_signal_carry_i_7_n_2 : STD_LOGIC;
  signal zero_signal_carry_i_7_n_3 : STD_LOGIC;
  signal zero_signal_carry_i_8_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_8_n_1 : STD_LOGIC;
  signal zero_signal_carry_i_8_n_2 : STD_LOGIC;
  signal zero_signal_carry_i_8_n_3 : STD_LOGIC;
  signal zero_signal_carry_i_9_n_0 : STD_LOGIC;
  signal zero_signal_carry_n_0 : STD_LOGIC;
  signal zero_signal_carry_n_1 : STD_LOGIC;
  signal zero_signal_carry_n_2 : STD_LOGIC;
  signal zero_signal_carry_n_3 : STD_LOGIC;
  signal NLW_CNT1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_CNT1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_CNT_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_oNewDataUpdate_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_oNewDataUpdate_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_oNewDataUpdate_carry__1_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_oNewDataUpdate_carry__1_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_oNewDataUpdate_carry_i_5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_oNewDataUpdate_carry_i_6_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_oNewDataUpdate_carry_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_zero_signal_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_zero_signal_carry__0_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_zero_signal_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero_signal_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_zero_signal_carry__1_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_zero_signal_carry_i_5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_zero_signal_carry_i_6_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_zero_signal_carry_i_6_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CNT[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \CNT[10]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \CNT[11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \CNT[12]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \CNT[13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \CNT[14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \CNT[15]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \CNT[16]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \CNT[17]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \CNT[18]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \CNT[19]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \CNT[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \CNT[20]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \CNT[21]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \CNT[22]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \CNT[23]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \CNT[24]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \CNT[25]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \CNT[26]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \CNT[27]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \CNT[28]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \CNT[29]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \CNT[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \CNT[30]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \CNT[31]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \CNT[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \CNT[4]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \CNT[5]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \CNT[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \CNT[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \CNT[8]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \CNT[9]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \CNT_Deadline[11]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT_Deadline[12]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \CNT_Deadline[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \CNT_Deadline[14]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \CNT_Deadline[15]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \CNT_Deadline[16]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT_Deadline[19]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \CNT_Deadline[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CNT_Deadline[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CNT_Deadline[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CNT_Deadline[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \CNT_Deadline[5]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CNT_Deadline[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT_Deadline[7]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \CNT_Deadline[8]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT_Deadline[9]_i_1\ : label is "soft_lutpair4";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \CNT_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[16]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[20]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[24]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[28]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[8]_i_2\ : label is 35;
begin
  oNewPulseCounter(0) <= \^onewpulsecounter\(0);
CNT1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => CNT1_carry_n_0,
      CO(2) => CNT1_carry_n_1,
      CO(1) => CNT1_carry_n_2,
      CO(0) => CNT1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_CNT1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => CNT1_carry_i_1_n_0,
      S(2) => CNT1_carry_i_2_n_0,
      S(1) => CNT1_carry_i_3_n_0,
      S(0) => CNT1_carry_i_4_n_0
    );
\CNT1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => CNT1_carry_n_0,
      CO(3) => \CNT1_carry__0_n_0\,
      CO(2) => \CNT1_carry__0_n_1\,
      CO(1) => \CNT1_carry__0_n_2\,
      CO(0) => \CNT1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_CNT1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \CNT1_carry__0_i_1_n_0\,
      S(2) => \CNT1_carry__0_i_2_n_0\,
      S(1) => \CNT1_carry__0_i_3_n_0\,
      S(0) => \CNT1_carry__0_i_4_n_0\
    );
\CNT1_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90000009"
    )
        port map (
      I0 => CNT_Deadline(19),
      I1 => CNT(22),
      I2 => CNT(23),
      I3 => CNT(21),
      I4 => CNT_Deadline(20),
      O => \CNT1_carry__0_i_1_n_0\
    );
\CNT1_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(20),
      I1 => CNT(20),
      I2 => CNT_Deadline(19),
      I3 => CNT(19),
      I4 => CNT(18),
      I5 => CNT_Deadline(18),
      O => \CNT1_carry__0_i_2_n_0\
    );
\CNT1_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(13),
      I1 => CNT(17),
      I2 => CNT_Deadline(16),
      I3 => CNT(16),
      I4 => CNT(15),
      I5 => CNT_Deadline(15),
      O => \CNT1_carry__0_i_3_n_0\
    );
\CNT1_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(14),
      I1 => CNT(14),
      I2 => CNT_Deadline(13),
      I3 => CNT(13),
      I4 => CNT(12),
      I5 => CNT_Deadline(12),
      O => \CNT1_carry__0_i_4_n_0\
    );
\CNT1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT1_carry__0_n_0\,
      CO(3) => \NLW_CNT1_carry__1_CO_UNCONNECTED\(3),
      CO(2) => CNT1,
      CO(1) => \CNT1_carry__1_n_2\,
      CO(0) => \CNT1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_CNT1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \CNT1_carry__1_i_1_n_0\,
      S(1) => \CNT1_carry__1_i_2_n_0\,
      S(0) => \CNT1_carry__1_i_3_n_0\
    );
\CNT1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \CNT1_carry__1_i_1_n_0\
    );
\CNT1_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(29),
      I1 => CNT(28),
      I2 => CNT(27),
      O => \CNT1_carry__1_i_2_n_0\
    );
\CNT1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1001"
    )
        port map (
      I0 => CNT(26),
      I1 => CNT(24),
      I2 => CNT(25),
      I3 => CNT_Deadline(20),
      O => \CNT1_carry__1_i_3_n_0\
    );
CNT1_carry_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000041"
    )
        port map (
      I0 => CNT(10),
      I1 => CNT_Deadline(11),
      I2 => CNT(11),
      I3 => CNT(9),
      I4 => CNT_Deadline(9),
      O => CNT1_carry_i_1_n_0
    );
CNT1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(8),
      I1 => CNT(8),
      I2 => CNT_Deadline(7),
      I3 => CNT(7),
      I4 => CNT(6),
      I5 => CNT_Deadline(6),
      O => CNT1_carry_i_2_n_0
    );
CNT1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(5),
      I1 => CNT(5),
      I2 => CNT_Deadline(4),
      I3 => CNT(4),
      I4 => CNT(3),
      I5 => CNT_Deadline(3),
      O => CNT1_carry_i_3_n_0
    );
CNT1_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000041"
    )
        port map (
      I0 => CNT(0),
      I1 => CNT_Deadline(1),
      I2 => CNT(1),
      I3 => CNT(2),
      I4 => CNT_Deadline(2),
      O => CNT1_carry_i_4_n_0
    );
\CNT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT(0),
      O => \CNT[0]_i_1_n_0\
    );
\CNT[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(10),
      O => \CNT[10]_i_1_n_0\
    );
\CNT[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(11),
      O => \CNT[11]_i_1_n_0\
    );
\CNT[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(12),
      O => \CNT[12]_i_1_n_0\
    );
\CNT[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(13),
      O => \CNT[13]_i_1_n_0\
    );
\CNT[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(14),
      O => \CNT[14]_i_1_n_0\
    );
\CNT[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(15),
      O => \CNT[15]_i_1_n_0\
    );
\CNT[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(16),
      O => \CNT[16]_i_1_n_0\
    );
\CNT[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(17),
      O => \CNT[17]_i_1_n_0\
    );
\CNT[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(18),
      O => \CNT[18]_i_1_n_0\
    );
\CNT[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(19),
      O => \CNT[19]_i_1_n_0\
    );
\CNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(1),
      O => \CNT[1]_i_1_n_0\
    );
\CNT[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(20),
      O => \CNT[20]_i_1_n_0\
    );
\CNT[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(21),
      O => \CNT[21]_i_1_n_0\
    );
\CNT[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(22),
      O => \CNT[22]_i_1_n_0\
    );
\CNT[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(23),
      O => \CNT[23]_i_1_n_0\
    );
\CNT[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(24),
      O => \CNT[24]_i_1_n_0\
    );
\CNT[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(25),
      O => \CNT[25]_i_1_n_0\
    );
\CNT[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(26),
      O => \CNT[26]_i_1_n_0\
    );
\CNT[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(27),
      O => \CNT[27]_i_1_n_0\
    );
\CNT[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(28),
      O => \CNT[28]_i_1_n_0\
    );
\CNT[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(29),
      O => \CNT[29]_i_1_n_0\
    );
\CNT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(2),
      O => \CNT[2]_i_1_n_0\
    );
\CNT[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(30),
      O => \CNT[30]_i_1_n_0\
    );
\CNT[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(31),
      O => \CNT[31]_i_1_n_0\
    );
\CNT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(3),
      O => \CNT[3]_i_1_n_0\
    );
\CNT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(4),
      O => \CNT[4]_i_1_n_0\
    );
\CNT[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(5),
      O => \CNT[5]_i_1_n_0\
    );
\CNT[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(6),
      O => \CNT[6]_i_1_n_0\
    );
\CNT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(7),
      O => \CNT[7]_i_1_n_0\
    );
\CNT[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(8),
      O => \CNT[8]_i_1_n_0\
    );
\CNT[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(9),
      O => \CNT[9]_i_1_n_0\
    );
\CNT_Deadline[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[11]_i_1_n_0\
    );
\CNT_Deadline[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCDC"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => \CNT_Deadline[20]_i_2_n_0\,
      I2 => iTimeInterval(1),
      I3 => iTimeInterval(2),
      O => \CNT_Deadline[12]_i_1_n_0\
    );
\CNT_Deadline[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDCC"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => \CNT_Deadline[20]_i_2_n_0\,
      I2 => iTimeInterval(1),
      I3 => iTimeInterval(2),
      O => \CNT_Deadline[13]_i_1_n_0\
    );
\CNT_Deadline[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEC"
    )
        port map (
      I0 => iTimeInterval(2),
      I1 => \CNT_Deadline[20]_i_2_n_0\,
      I2 => iTimeInterval(1),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[14]_i_1_n_0\
    );
\CNT_Deadline[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FAEE"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(1),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[15]_i_1_n_0\
    );
\CNT_Deadline[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(0),
      I3 => iTimeInterval(2),
      O => \CNT_Deadline[16]_i_1_n_0\
    );
\CNT_Deadline[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      O => \CNT_Deadline[18]_i_1_n_0\
    );
\CNT_Deadline[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FAEA"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[19]_i_1_n_0\
    );
\CNT_Deadline[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[1]_i_1_n_0\
    );
\CNT_Deadline[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => iTimeInterval(2),
      I1 => iTimeInterval(1),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      O => \CNT_Deadline[20]_i_1_n_0\
    );
\CNT_Deadline[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFB"
    )
        port map (
      I0 => iTimeInterval(7),
      I1 => iEn,
      I2 => iTimeInterval(5),
      I3 => iTimeInterval(6),
      I4 => iTimeInterval(4),
      I5 => iTimeInterval(3),
      O => \CNT_Deadline[20]_i_2_n_0\
    );
\CNT_Deadline[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[2]_i_1_n_0\
    );
\CNT_Deadline[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => \CNT_Deadline[20]_i_2_n_0\,
      O => \CNT_Deadline[3]_i_1_n_0\
    );
\CNT_Deadline[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0203"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => iTimeInterval(2),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      I3 => iTimeInterval(1),
      O => \CNT_Deadline[4]_i_1_n_0\
    );
\CNT_Deadline[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0111"
    )
        port map (
      I0 => \CNT_Deadline[20]_i_2_n_0\,
      I1 => iTimeInterval(1),
      I2 => iTimeInterval(2),
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[5]_i_1_n_0\
    );
\CNT_Deadline[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"040C"
    )
        port map (
      I0 => iTimeInterval(1),
      I1 => iTimeInterval(0),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      I3 => iTimeInterval(2),
      O => \CNT_Deadline[6]_i_1_n_0\
    );
\CNT_Deadline[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F9FC"
    )
        port map (
      I0 => iTimeInterval(2),
      I1 => iTimeInterval(1),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      I3 => iTimeInterval(0),
      O => \CNT_Deadline[7]_i_1_n_0\
    );
\CNT_Deadline[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"030E"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => iTimeInterval(2),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      I3 => iTimeInterval(1),
      O => \CNT_Deadline[8]_i_1_n_0\
    );
\CNT_Deadline[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"020C"
    )
        port map (
      I0 => iTimeInterval(0),
      I1 => iTimeInterval(1),
      I2 => \CNT_Deadline[20]_i_2_n_0\,
      I3 => iTimeInterval(2),
      O => \CNT_Deadline[9]_i_1_n_0\
    );
\CNT_Deadline_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[11]_i_1_n_0\,
      Q => CNT_Deadline(11)
    );
\CNT_Deadline_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[12]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(12)
    );
\CNT_Deadline_reg[13]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[13]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(13)
    );
\CNT_Deadline_reg[14]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[14]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(14)
    );
\CNT_Deadline_reg[15]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[15]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(15)
    );
\CNT_Deadline_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[16]_i_1_n_0\,
      Q => CNT_Deadline(16)
    );
\CNT_Deadline_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[18]_i_1_n_0\,
      Q => CNT_Deadline(18)
    );
\CNT_Deadline_reg[19]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[19]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(19)
    );
\CNT_Deadline_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[1]_i_1_n_0\,
      Q => CNT_Deadline(1)
    );
\CNT_Deadline_reg[20]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[20]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(20)
    );
\CNT_Deadline_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[2]_i_1_n_0\,
      Q => CNT_Deadline(2)
    );
\CNT_Deadline_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[3]_i_1_n_0\,
      Q => CNT_Deadline(3)
    );
\CNT_Deadline_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[4]_i_1_n_0\,
      Q => CNT_Deadline(4)
    );
\CNT_Deadline_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[5]_i_1_n_0\,
      Q => CNT_Deadline(5)
    );
\CNT_Deadline_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[6]_i_1_n_0\,
      Q => CNT_Deadline(6)
    );
\CNT_Deadline_reg[7]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[7]_i_1_n_0\,
      PRE => \oNewPulseCounter[12]_i_2_n_0\,
      Q => CNT_Deadline(7)
    );
\CNT_Deadline_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[8]_i_1_n_0\,
      Q => CNT_Deadline(8)
    );
\CNT_Deadline_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT_Deadline[9]_i_1_n_0\,
      Q => CNT_Deadline(9)
    );
\CNT_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[0]_i_1_n_0\,
      Q => CNT(0)
    );
\CNT_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[10]_i_1_n_0\,
      Q => CNT(10)
    );
\CNT_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[11]_i_1_n_0\,
      Q => CNT(11)
    );
\CNT_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[12]_i_1_n_0\,
      Q => CNT(12)
    );
\CNT_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[8]_i_2_n_0\,
      CO(3) => \CNT_reg[12]_i_2_n_0\,
      CO(2) => \CNT_reg[12]_i_2_n_1\,
      CO(1) => \CNT_reg[12]_i_2_n_2\,
      CO(0) => \CNT_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(12 downto 9),
      S(3 downto 0) => CNT(12 downto 9)
    );
\CNT_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[13]_i_1_n_0\,
      Q => CNT(13)
    );
\CNT_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[14]_i_1_n_0\,
      Q => CNT(14)
    );
\CNT_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[15]_i_1_n_0\,
      Q => CNT(15)
    );
\CNT_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[16]_i_1_n_0\,
      Q => CNT(16)
    );
\CNT_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[12]_i_2_n_0\,
      CO(3) => \CNT_reg[16]_i_2_n_0\,
      CO(2) => \CNT_reg[16]_i_2_n_1\,
      CO(1) => \CNT_reg[16]_i_2_n_2\,
      CO(0) => \CNT_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(16 downto 13),
      S(3 downto 0) => CNT(16 downto 13)
    );
\CNT_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[17]_i_1_n_0\,
      Q => CNT(17)
    );
\CNT_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[18]_i_1_n_0\,
      Q => CNT(18)
    );
\CNT_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[19]_i_1_n_0\,
      Q => CNT(19)
    );
\CNT_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[1]_i_1_n_0\,
      Q => CNT(1)
    );
\CNT_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[20]_i_1_n_0\,
      Q => CNT(20)
    );
\CNT_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[16]_i_2_n_0\,
      CO(3) => \CNT_reg[20]_i_2_n_0\,
      CO(2) => \CNT_reg[20]_i_2_n_1\,
      CO(1) => \CNT_reg[20]_i_2_n_2\,
      CO(0) => \CNT_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(20 downto 17),
      S(3 downto 0) => CNT(20 downto 17)
    );
\CNT_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[21]_i_1_n_0\,
      Q => CNT(21)
    );
\CNT_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[22]_i_1_n_0\,
      Q => CNT(22)
    );
\CNT_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[23]_i_1_n_0\,
      Q => CNT(23)
    );
\CNT_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[24]_i_1_n_0\,
      Q => CNT(24)
    );
\CNT_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[20]_i_2_n_0\,
      CO(3) => \CNT_reg[24]_i_2_n_0\,
      CO(2) => \CNT_reg[24]_i_2_n_1\,
      CO(1) => \CNT_reg[24]_i_2_n_2\,
      CO(0) => \CNT_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(24 downto 21),
      S(3 downto 0) => CNT(24 downto 21)
    );
\CNT_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[25]_i_1_n_0\,
      Q => CNT(25)
    );
\CNT_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[26]_i_1_n_0\,
      Q => CNT(26)
    );
\CNT_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[27]_i_1_n_0\,
      Q => CNT(27)
    );
\CNT_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[28]_i_1_n_0\,
      Q => CNT(28)
    );
\CNT_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[24]_i_2_n_0\,
      CO(3) => \CNT_reg[28]_i_2_n_0\,
      CO(2) => \CNT_reg[28]_i_2_n_1\,
      CO(1) => \CNT_reg[28]_i_2_n_2\,
      CO(0) => \CNT_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(28 downto 25),
      S(3 downto 0) => CNT(28 downto 25)
    );
\CNT_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[29]_i_1_n_0\,
      Q => CNT(29)
    );
\CNT_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[2]_i_1_n_0\,
      Q => CNT(2)
    );
\CNT_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[30]_i_1_n_0\,
      Q => CNT(30)
    );
\CNT_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[31]_i_1_n_0\,
      Q => CNT(31)
    );
\CNT_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_CNT_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \CNT_reg[31]_i_2_n_2\,
      CO(0) => \CNT_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_CNT_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => CNT0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => CNT(31 downto 29)
    );
\CNT_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[3]_i_1_n_0\,
      Q => CNT(3)
    );
\CNT_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[4]_i_1_n_0\,
      Q => CNT(4)
    );
\CNT_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \CNT_reg[4]_i_2_n_0\,
      CO(2) => \CNT_reg[4]_i_2_n_1\,
      CO(1) => \CNT_reg[4]_i_2_n_2\,
      CO(0) => \CNT_reg[4]_i_2_n_3\,
      CYINIT => CNT(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(4 downto 1),
      S(3 downto 0) => CNT(4 downto 1)
    );
\CNT_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[5]_i_1_n_0\,
      Q => CNT(5)
    );
\CNT_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[6]_i_1_n_0\,
      Q => CNT(6)
    );
\CNT_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[7]_i_1_n_0\,
      Q => CNT(7)
    );
\CNT_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[8]_i_1_n_0\,
      Q => CNT(8)
    );
\CNT_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[4]_i_2_n_0\,
      CO(3) => \CNT_reg[8]_i_2_n_0\,
      CO(2) => \CNT_reg[8]_i_2_n_1\,
      CO(1) => \CNT_reg[8]_i_2_n_2\,
      CO(0) => \CNT_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(8 downto 5),
      S(3 downto 0) => CNT(8 downto 5)
    );
\CNT_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \CNT[9]_i_1_n_0\,
      Q => CNT(9)
    );
oNewDataUpdate_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oNewDataUpdate_carry_n_0,
      CO(2) => oNewDataUpdate_carry_n_1,
      CO(1) => oNewDataUpdate_carry_n_2,
      CO(0) => oNewDataUpdate_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_oNewDataUpdate_carry_O_UNCONNECTED(3 downto 0),
      S(3) => oNewDataUpdate_carry_i_1_n_0,
      S(2) => oNewDataUpdate_carry_i_2_n_0,
      S(1) => oNewDataUpdate_carry_i_3_n_0,
      S(0) => oNewDataUpdate_carry_i_4_n_0
    );
\oNewDataUpdate_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => oNewDataUpdate_carry_n_0,
      CO(3) => \oNewDataUpdate_carry__0_n_0\,
      CO(2) => \oNewDataUpdate_carry__0_n_1\,
      CO(1) => \oNewDataUpdate_carry__0_n_2\,
      CO(0) => \oNewDataUpdate_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_oNewDataUpdate_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \oNewDataUpdate_carry__0_i_1_n_0\,
      S(2) => \oNewDataUpdate_carry__0_i_2_n_0\,
      S(1) => \oNewDataUpdate_carry__0_i_3_n_0\,
      S(0) => \oNewDataUpdate_carry__0_i_4_n_0\
    );
\oNewDataUpdate_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(23),
      I1 => CNT(23),
      I2 => oNewDataUpdate0(22),
      I3 => CNT(22),
      I4 => CNT(21),
      I5 => oNewDataUpdate0(21),
      O => \oNewDataUpdate_carry__0_i_1_n_0\
    );
\oNewDataUpdate_carry__0_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(18),
      O => \oNewDataUpdate_carry__0_i_10_n_0\
    );
\oNewDataUpdate_carry__0_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(13),
      O => \oNewDataUpdate_carry__0_i_11_n_0\
    );
\oNewDataUpdate_carry__0_i_12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(16),
      O => \oNewDataUpdate_carry__0_i_12_n_0\
    );
\oNewDataUpdate_carry__0_i_13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(15),
      O => \oNewDataUpdate_carry__0_i_13_n_0\
    );
\oNewDataUpdate_carry__0_i_14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(14),
      O => \oNewDataUpdate_carry__0_i_14_n_0\
    );
\oNewDataUpdate_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(20),
      I1 => CNT(20),
      I2 => oNewDataUpdate0(19),
      I3 => CNT(19),
      I4 => CNT(18),
      I5 => oNewDataUpdate0(18),
      O => \oNewDataUpdate_carry__0_i_2_n_0\
    );
\oNewDataUpdate_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(17),
      I1 => CNT(17),
      I2 => oNewDataUpdate0(16),
      I3 => CNT(16),
      I4 => CNT(15),
      I5 => oNewDataUpdate0(15),
      O => \oNewDataUpdate_carry__0_i_3_n_0\
    );
\oNewDataUpdate_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(14),
      I1 => CNT(14),
      I2 => oNewDataUpdate0(13),
      I3 => CNT(13),
      I4 => CNT(12),
      I5 => oNewDataUpdate0(12),
      O => \oNewDataUpdate_carry__0_i_4_n_0\
    );
\oNewDataUpdate_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \oNewDataUpdate_carry__0_i_6_n_0\,
      CO(3) => \oNewDataUpdate_carry__0_i_5_n_0\,
      CO(2) => \oNewDataUpdate_carry__0_i_5_n_1\,
      CO(1) => \oNewDataUpdate_carry__0_i_5_n_2\,
      CO(0) => \oNewDataUpdate_carry__0_i_5_n_3\,
      CYINIT => '0',
      DI(3) => CNT_Deadline(20),
      DI(2 downto 0) => CNT_Deadline(20 downto 18),
      O(3 downto 0) => oNewDataUpdate0(21 downto 18),
      S(3) => \oNewDataUpdate_carry__0_i_7_n_0\,
      S(2) => \oNewDataUpdate_carry__0_i_8_n_0\,
      S(1) => \oNewDataUpdate_carry__0_i_9_n_0\,
      S(0) => \oNewDataUpdate_carry__0_i_10_n_0\
    );
\oNewDataUpdate_carry__0_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => oNewDataUpdate_carry_i_5_n_0,
      CO(3) => \oNewDataUpdate_carry__0_i_6_n_0\,
      CO(2) => \oNewDataUpdate_carry__0_i_6_n_1\,
      CO(1) => \oNewDataUpdate_carry__0_i_6_n_2\,
      CO(0) => \oNewDataUpdate_carry__0_i_6_n_3\,
      CYINIT => '0',
      DI(3) => CNT_Deadline(13),
      DI(2 downto 0) => CNT_Deadline(16 downto 14),
      O(3 downto 0) => oNewDataUpdate0(17 downto 14),
      S(3) => \oNewDataUpdate_carry__0_i_11_n_0\,
      S(2) => \oNewDataUpdate_carry__0_i_12_n_0\,
      S(1) => \oNewDataUpdate_carry__0_i_13_n_0\,
      S(0) => \oNewDataUpdate_carry__0_i_14_n_0\
    );
\oNewDataUpdate_carry__0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \oNewDataUpdate_carry__0_i_7_n_0\
    );
\oNewDataUpdate_carry__0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \oNewDataUpdate_carry__0_i_8_n_0\
    );
\oNewDataUpdate_carry__0_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(19),
      O => \oNewDataUpdate_carry__0_i_9_n_0\
    );
\oNewDataUpdate_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \oNewDataUpdate_carry__0_n_0\,
      CO(3) => \NLW_oNewDataUpdate_carry__1_CO_UNCONNECTED\(3),
      CO(2) => oNewDataUpdate,
      CO(1) => \oNewDataUpdate_carry__1_n_2\,
      CO(0) => \oNewDataUpdate_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_oNewDataUpdate_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \oNewDataUpdate_carry__1_i_1_n_0\,
      S(1) => \oNewDataUpdate_carry__1_i_2_n_0\,
      S(0) => \oNewDataUpdate_carry__1_i_3_n_0\
    );
\oNewDataUpdate_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => \oNewDataUpdate_carry__1_i_4_n_1\,
      I1 => CNT(30),
      I2 => CNT(31),
      O => \oNewDataUpdate_carry__1_i_1_n_0\
    );
\oNewDataUpdate_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => CNT(28),
      I1 => CNT(29),
      I2 => \oNewDataUpdate_carry__1_i_4_n_1\,
      I3 => CNT(27),
      O => \oNewDataUpdate_carry__1_i_2_n_0\
    );
\oNewDataUpdate_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000600660060000"
    )
        port map (
      I0 => \oNewDataUpdate_carry__1_i_4_n_1\,
      I1 => CNT(26),
      I2 => oNewDataUpdate0(25),
      I3 => CNT(25),
      I4 => CNT(24),
      I5 => \oNewDataUpdate_carry__1_i_5_n_1\,
      O => \oNewDataUpdate_carry__1_i_3_n_0\
    );
\oNewDataUpdate_carry__1_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED\(3),
      CO(2) => \oNewDataUpdate_carry__1_i_4_n_1\,
      CO(1) => \NLW_oNewDataUpdate_carry__1_i_4_CO_UNCONNECTED\(1),
      CO(0) => \oNewDataUpdate_carry__1_i_4_n_3\,
      CYINIT => \oNewDataUpdate_carry__1_i_5_n_1\,
      DI(3 downto 2) => B"00",
      DI(1) => CNT_Deadline(20),
      DI(0) => '0',
      O(3 downto 2) => \NLW_oNewDataUpdate_carry__1_i_4_O_UNCONNECTED\(3 downto 2),
      O(1) => oNewDataUpdate0(25),
      O(0) => \NLW_oNewDataUpdate_carry__1_i_4_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \oNewDataUpdate_carry__1_i_6_n_0\,
      S(0) => '1'
    );
\oNewDataUpdate_carry__1_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \oNewDataUpdate_carry__0_i_5_n_0\,
      CO(3) => \NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED\(3),
      CO(2) => \oNewDataUpdate_carry__1_i_5_n_1\,
      CO(1) => \NLW_oNewDataUpdate_carry__1_i_5_CO_UNCONNECTED\(1),
      CO(0) => \oNewDataUpdate_carry__1_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => CNT_Deadline(20 downto 19),
      O(3 downto 2) => \NLW_oNewDataUpdate_carry__1_i_5_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => oNewDataUpdate0(23 downto 22),
      S(3 downto 2) => B"01",
      S(1) => \oNewDataUpdate_carry__1_i_7_n_0\,
      S(0) => \oNewDataUpdate_carry__1_i_8_n_0\
    );
\oNewDataUpdate_carry__1_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \oNewDataUpdate_carry__1_i_6_n_0\
    );
\oNewDataUpdate_carry__1_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \oNewDataUpdate_carry__1_i_7_n_0\
    );
\oNewDataUpdate_carry__1_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(19),
      O => \oNewDataUpdate_carry__1_i_8_n_0\
    );
oNewDataUpdate_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0990000000000990"
    )
        port map (
      I0 => oNewDataUpdate0(11),
      I1 => CNT(11),
      I2 => oNewDataUpdate_carry_i_6_n_1,
      I3 => CNT(10),
      I4 => CNT(9),
      I5 => oNewDataUpdate0(9),
      O => oNewDataUpdate_carry_i_1_n_0
    );
oNewDataUpdate_carry_i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(12),
      O => oNewDataUpdate_carry_i_10_n_0
    );
oNewDataUpdate_carry_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(11),
      O => oNewDataUpdate_carry_i_11_n_0
    );
oNewDataUpdate_carry_i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(9),
      O => oNewDataUpdate_carry_i_12_n_0
    );
oNewDataUpdate_carry_i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(8),
      O => oNewDataUpdate_carry_i_13_n_0
    );
oNewDataUpdate_carry_i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(7),
      O => oNewDataUpdate_carry_i_14_n_0
    );
oNewDataUpdate_carry_i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(6),
      O => oNewDataUpdate_carry_i_15_n_0
    );
oNewDataUpdate_carry_i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(5),
      O => oNewDataUpdate_carry_i_16_n_0
    );
oNewDataUpdate_carry_i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(4),
      O => oNewDataUpdate_carry_i_17_n_0
    );
oNewDataUpdate_carry_i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(3),
      O => oNewDataUpdate_carry_i_18_n_0
    );
oNewDataUpdate_carry_i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(2),
      O => oNewDataUpdate_carry_i_19_n_0
    );
oNewDataUpdate_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(8),
      I1 => CNT(8),
      I2 => oNewDataUpdate0(7),
      I3 => CNT(7),
      I4 => CNT(6),
      I5 => oNewDataUpdate0(6),
      O => oNewDataUpdate_carry_i_2_n_0
    );
oNewDataUpdate_carry_i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(1),
      O => oNewDataUpdate_carry_i_20_n_0
    );
oNewDataUpdate_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(5),
      I1 => CNT(5),
      I2 => oNewDataUpdate0(4),
      I3 => CNT(4),
      I4 => CNT(3),
      I5 => oNewDataUpdate0(3),
      O => oNewDataUpdate_carry_i_3_n_0
    );
oNewDataUpdate_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000041"
    )
        port map (
      I0 => CNT(0),
      I1 => oNewDataUpdate0(2),
      I2 => CNT(2),
      I3 => CNT(1),
      I4 => oNewDataUpdate0(1),
      O => oNewDataUpdate_carry_i_4_n_0
    );
oNewDataUpdate_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oNewDataUpdate_carry_i_5_n_0,
      CO(2) => oNewDataUpdate_carry_i_5_n_1,
      CO(1) => oNewDataUpdate_carry_i_5_n_2,
      CO(0) => oNewDataUpdate_carry_i_5_n_3,
      CYINIT => oNewDataUpdate_carry_i_6_n_1,
      DI(3 downto 1) => CNT_Deadline(13 downto 11),
      DI(0) => '0',
      O(3 downto 1) => oNewDataUpdate0(13 downto 11),
      O(0) => NLW_oNewDataUpdate_carry_i_5_O_UNCONNECTED(0),
      S(3) => oNewDataUpdate_carry_i_9_n_0,
      S(2) => oNewDataUpdate_carry_i_10_n_0,
      S(1) => oNewDataUpdate_carry_i_11_n_0,
      S(0) => '1'
    );
oNewDataUpdate_carry_i_6: unisim.vcomponents.CARRY4
     port map (
      CI => oNewDataUpdate_carry_i_7_n_0,
      CO(3) => NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED(3),
      CO(2) => oNewDataUpdate_carry_i_6_n_1,
      CO(1) => NLW_oNewDataUpdate_carry_i_6_CO_UNCONNECTED(1),
      CO(0) => oNewDataUpdate_carry_i_6_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => CNT_Deadline(9 downto 8),
      O(3 downto 2) => NLW_oNewDataUpdate_carry_i_6_O_UNCONNECTED(3 downto 2),
      O(1 downto 0) => oNewDataUpdate0(9 downto 8),
      S(3 downto 2) => B"01",
      S(1) => oNewDataUpdate_carry_i_12_n_0,
      S(0) => oNewDataUpdate_carry_i_13_n_0
    );
oNewDataUpdate_carry_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => oNewDataUpdate_carry_i_8_n_0,
      CO(3) => oNewDataUpdate_carry_i_7_n_0,
      CO(2) => oNewDataUpdate_carry_i_7_n_1,
      CO(1) => oNewDataUpdate_carry_i_7_n_2,
      CO(0) => oNewDataUpdate_carry_i_7_n_3,
      CYINIT => '0',
      DI(3 downto 0) => CNT_Deadline(7 downto 4),
      O(3 downto 0) => oNewDataUpdate0(7 downto 4),
      S(3) => oNewDataUpdate_carry_i_14_n_0,
      S(2) => oNewDataUpdate_carry_i_15_n_0,
      S(1) => oNewDataUpdate_carry_i_16_n_0,
      S(0) => oNewDataUpdate_carry_i_17_n_0
    );
oNewDataUpdate_carry_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oNewDataUpdate_carry_i_8_n_0,
      CO(2) => oNewDataUpdate_carry_i_8_n_1,
      CO(1) => oNewDataUpdate_carry_i_8_n_2,
      CO(0) => oNewDataUpdate_carry_i_8_n_3,
      CYINIT => '0',
      DI(3 downto 1) => CNT_Deadline(3 downto 1),
      DI(0) => '0',
      O(3 downto 1) => oNewDataUpdate0(3 downto 1),
      O(0) => NLW_oNewDataUpdate_carry_i_8_O_UNCONNECTED(0),
      S(3) => oNewDataUpdate_carry_i_18_n_0,
      S(2) => oNewDataUpdate_carry_i_19_n_0,
      S(1) => oNewDataUpdate_carry_i_20_n_0,
      S(0) => '0'
    );
oNewDataUpdate_carry_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(13),
      O => oNewDataUpdate_carry_i_9_n_0
    );
\oNewPulseCounter[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2220"
    )
        port map (
      I0 => iEn,
      I1 => zero_signal,
      I2 => iPulse,
      I3 => \^onewpulsecounter\(0),
      O => \oNewPulseCounter[12]_i_1_n_0\
    );
\oNewPulseCounter[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => \oNewPulseCounter[12]_i_2_n_0\
    );
\oNewPulseCounter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[12]_i_2_n_0\,
      D => \oNewPulseCounter[12]_i_1_n_0\,
      Q => \^onewpulsecounter\(0)
    );
zero_signal_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_signal_carry_n_0,
      CO(2) => zero_signal_carry_n_1,
      CO(1) => zero_signal_carry_n_2,
      CO(0) => zero_signal_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_zero_signal_carry_O_UNCONNECTED(3 downto 0),
      S(3) => zero_signal_carry_i_1_n_0,
      S(2) => zero_signal_carry_i_2_n_0,
      S(1) => zero_signal_carry_i_3_n_0,
      S(0) => zero_signal_carry_i_4_n_0
    );
\zero_signal_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => zero_signal_carry_n_0,
      CO(3) => \zero_signal_carry__0_n_0\,
      CO(2) => \zero_signal_carry__0_n_1\,
      CO(1) => \zero_signal_carry__0_n_2\,
      CO(0) => \zero_signal_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_zero_signal_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \zero_signal_carry__0_i_1_n_0\,
      S(2) => \zero_signal_carry__0_i_2_n_0\,
      S(1) => \zero_signal_carry__0_i_3_n_0\,
      S(0) => \zero_signal_carry__0_i_4_n_0\
    );
\zero_signal_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(23),
      I1 => CNT(23),
      I2 => zero_signal0(22),
      I3 => CNT(22),
      I4 => CNT(21),
      I5 => zero_signal0(21),
      O => \zero_signal_carry__0_i_1_n_0\
    );
\zero_signal_carry__0_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \zero_signal_carry__0_i_10_n_0\
    );
\zero_signal_carry__0_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \zero_signal_carry__0_i_11_n_0\
    );
\zero_signal_carry__0_i_12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(19),
      O => \zero_signal_carry__0_i_12_n_0\
    );
\zero_signal_carry__0_i_13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(18),
      O => \zero_signal_carry__0_i_13_n_0\
    );
\zero_signal_carry__0_i_14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(13),
      O => \zero_signal_carry__0_i_14_n_0\
    );
\zero_signal_carry__0_i_15\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(16),
      O => \zero_signal_carry__0_i_15_n_0\
    );
\zero_signal_carry__0_i_16\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(15),
      O => \zero_signal_carry__0_i_16_n_0\
    );
\zero_signal_carry__0_i_17\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(14),
      O => \zero_signal_carry__0_i_17_n_0\
    );
\zero_signal_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(20),
      I1 => CNT(20),
      I2 => zero_signal0(19),
      I3 => CNT(19),
      I4 => CNT(18),
      I5 => zero_signal0(18),
      O => \zero_signal_carry__0_i_2_n_0\
    );
\zero_signal_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(17),
      I1 => CNT(17),
      I2 => zero_signal0(16),
      I3 => CNT(16),
      I4 => CNT(15),
      I5 => zero_signal0(15),
      O => \zero_signal_carry__0_i_3_n_0\
    );
\zero_signal_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(14),
      I1 => CNT(14),
      I2 => zero_signal0(13),
      I3 => CNT(13),
      I4 => CNT(12),
      I5 => zero_signal0(12),
      O => \zero_signal_carry__0_i_4_n_0\
    );
\zero_signal_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_signal_carry__0_i_6_n_0\,
      CO(3) => \NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED\(3),
      CO(2) => \zero_signal_carry__0_i_5_n_1\,
      CO(1) => \NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED\(1),
      CO(0) => \zero_signal_carry__0_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => CNT_Deadline(20 downto 19),
      O(3 downto 2) => \NLW_zero_signal_carry__0_i_5_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => zero_signal0(23 downto 22),
      S(3 downto 2) => B"01",
      S(1) => \zero_signal_carry__0_i_8_n_0\,
      S(0) => \zero_signal_carry__0_i_9_n_0\
    );
\zero_signal_carry__0_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_signal_carry__0_i_7_n_0\,
      CO(3) => \zero_signal_carry__0_i_6_n_0\,
      CO(2) => \zero_signal_carry__0_i_6_n_1\,
      CO(1) => \zero_signal_carry__0_i_6_n_2\,
      CO(0) => \zero_signal_carry__0_i_6_n_3\,
      CYINIT => '0',
      DI(3) => CNT_Deadline(20),
      DI(2 downto 0) => CNT_Deadline(20 downto 18),
      O(3 downto 0) => zero_signal0(21 downto 18),
      S(3) => \zero_signal_carry__0_i_10_n_0\,
      S(2) => \zero_signal_carry__0_i_11_n_0\,
      S(1) => \zero_signal_carry__0_i_12_n_0\,
      S(0) => \zero_signal_carry__0_i_13_n_0\
    );
\zero_signal_carry__0_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => zero_signal_carry_i_5_n_0,
      CO(3) => \zero_signal_carry__0_i_7_n_0\,
      CO(2) => \zero_signal_carry__0_i_7_n_1\,
      CO(1) => \zero_signal_carry__0_i_7_n_2\,
      CO(0) => \zero_signal_carry__0_i_7_n_3\,
      CYINIT => '0',
      DI(3) => CNT_Deadline(13),
      DI(2 downto 0) => CNT_Deadline(16 downto 14),
      O(3 downto 0) => zero_signal0(17 downto 14),
      S(3) => \zero_signal_carry__0_i_14_n_0\,
      S(2) => \zero_signal_carry__0_i_15_n_0\,
      S(1) => \zero_signal_carry__0_i_16_n_0\,
      S(0) => \zero_signal_carry__0_i_17_n_0\
    );
\zero_signal_carry__0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \zero_signal_carry__0_i_8_n_0\
    );
\zero_signal_carry__0_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(19),
      O => \zero_signal_carry__0_i_9_n_0\
    );
\zero_signal_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_signal_carry__0_n_0\,
      CO(3) => \NLW_zero_signal_carry__1_CO_UNCONNECTED\(3),
      CO(2) => zero_signal,
      CO(1) => \zero_signal_carry__1_n_2\,
      CO(0) => \zero_signal_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_zero_signal_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \zero_signal_carry__1_i_1_n_0\,
      S(1) => \zero_signal_carry__1_i_2_n_0\,
      S(0) => \zero_signal_carry__1_i_3_n_0\
    );
\zero_signal_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => \zero_signal_carry__1_i_4_n_1\,
      I1 => CNT(30),
      I2 => CNT(31),
      O => \zero_signal_carry__1_i_1_n_0\
    );
\zero_signal_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => CNT(28),
      I1 => CNT(29),
      I2 => \zero_signal_carry__1_i_4_n_1\,
      I3 => CNT(27),
      O => \zero_signal_carry__1_i_2_n_0\
    );
\zero_signal_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000600660060000"
    )
        port map (
      I0 => \zero_signal_carry__1_i_4_n_1\,
      I1 => CNT(26),
      I2 => zero_signal0(25),
      I3 => CNT(25),
      I4 => CNT(24),
      I5 => \zero_signal_carry__0_i_5_n_1\,
      O => \zero_signal_carry__1_i_3_n_0\
    );
\zero_signal_carry__1_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED\(3),
      CO(2) => \zero_signal_carry__1_i_4_n_1\,
      CO(1) => \NLW_zero_signal_carry__1_i_4_CO_UNCONNECTED\(1),
      CO(0) => \zero_signal_carry__1_i_4_n_3\,
      CYINIT => \zero_signal_carry__0_i_5_n_1\,
      DI(3 downto 2) => B"00",
      DI(1) => CNT_Deadline(20),
      DI(0) => '0',
      O(3 downto 2) => \NLW_zero_signal_carry__1_i_4_O_UNCONNECTED\(3 downto 2),
      O(1) => zero_signal0(25),
      O(0) => \NLW_zero_signal_carry__1_i_4_O_UNCONNECTED\(0),
      S(3 downto 2) => B"01",
      S(1) => \zero_signal_carry__1_i_5_n_0\,
      S(0) => '1'
    );
\zero_signal_carry__1_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(20),
      O => \zero_signal_carry__1_i_5_n_0\
    );
zero_signal_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0990000000000990"
    )
        port map (
      I0 => zero_signal0(11),
      I1 => CNT(11),
      I2 => zero_signal_carry_i_6_n_3,
      I3 => CNT(10),
      I4 => CNT(9),
      I5 => zero_signal0(9),
      O => zero_signal_carry_i_1_n_0
    );
zero_signal_carry_i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(12),
      O => zero_signal_carry_i_10_n_0
    );
zero_signal_carry_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(11),
      O => zero_signal_carry_i_11_n_0
    );
zero_signal_carry_i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(9),
      O => zero_signal_carry_i_12_n_0
    );
zero_signal_carry_i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(8),
      O => zero_signal_carry_i_13_n_0
    );
zero_signal_carry_i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(7),
      O => zero_signal_carry_i_14_n_0
    );
zero_signal_carry_i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(6),
      O => zero_signal_carry_i_15_n_0
    );
zero_signal_carry_i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(5),
      O => zero_signal_carry_i_16_n_0
    );
zero_signal_carry_i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(4),
      O => zero_signal_carry_i_17_n_0
    );
zero_signal_carry_i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(3),
      O => zero_signal_carry_i_18_n_0
    );
zero_signal_carry_i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(2),
      O => zero_signal_carry_i_19_n_0
    );
zero_signal_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(8),
      I1 => CNT(8),
      I2 => zero_signal0(7),
      I3 => CNT(7),
      I4 => CNT(6),
      I5 => zero_signal0(6),
      O => zero_signal_carry_i_2_n_0
    );
zero_signal_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(5),
      I1 => CNT(5),
      I2 => zero_signal0(4),
      I3 => CNT(4),
      I4 => CNT(3),
      I5 => zero_signal0(3),
      O => zero_signal_carry_i_3_n_0
    );
zero_signal_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"60000060"
    )
        port map (
      I0 => CNT_Deadline(1),
      I1 => CNT(1),
      I2 => CNT(0),
      I3 => CNT(2),
      I4 => zero_signal0(2),
      O => zero_signal_carry_i_4_n_0
    );
zero_signal_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_signal_carry_i_5_n_0,
      CO(2) => zero_signal_carry_i_5_n_1,
      CO(1) => zero_signal_carry_i_5_n_2,
      CO(0) => zero_signal_carry_i_5_n_3,
      CYINIT => zero_signal_carry_i_6_n_3,
      DI(3 downto 1) => CNT_Deadline(13 downto 11),
      DI(0) => '0',
      O(3 downto 1) => zero_signal0(13 downto 11),
      O(0) => NLW_zero_signal_carry_i_5_O_UNCONNECTED(0),
      S(3) => zero_signal_carry_i_9_n_0,
      S(2) => zero_signal_carry_i_10_n_0,
      S(1) => zero_signal_carry_i_11_n_0,
      S(0) => '1'
    );
zero_signal_carry_i_6: unisim.vcomponents.CARRY4
     port map (
      CI => zero_signal_carry_i_7_n_0,
      CO(3 downto 1) => NLW_zero_signal_carry_i_6_CO_UNCONNECTED(3 downto 1),
      CO(0) => zero_signal_carry_i_6_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_zero_signal_carry_i_6_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
zero_signal_carry_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => zero_signal_carry_i_8_n_0,
      CO(3) => zero_signal_carry_i_7_n_0,
      CO(2) => zero_signal_carry_i_7_n_1,
      CO(1) => zero_signal_carry_i_7_n_2,
      CO(0) => zero_signal_carry_i_7_n_3,
      CYINIT => '0',
      DI(3 downto 0) => CNT_Deadline(9 downto 6),
      O(3 downto 0) => zero_signal0(9 downto 6),
      S(3) => zero_signal_carry_i_12_n_0,
      S(2) => zero_signal_carry_i_13_n_0,
      S(1) => zero_signal_carry_i_14_n_0,
      S(0) => zero_signal_carry_i_15_n_0
    );
zero_signal_carry_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_signal_carry_i_8_n_0,
      CO(2) => zero_signal_carry_i_8_n_1,
      CO(1) => zero_signal_carry_i_8_n_2,
      CO(0) => zero_signal_carry_i_8_n_3,
      CYINIT => CNT_Deadline(1),
      DI(3 downto 0) => CNT_Deadline(5 downto 2),
      O(3 downto 0) => zero_signal0(5 downto 2),
      S(3) => zero_signal_carry_i_16_n_0,
      S(2) => zero_signal_carry_i_17_n_0,
      S(1) => zero_signal_carry_i_18_n_0,
      S(0) => zero_signal_carry_i_19_n_0
    );
zero_signal_carry_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(13),
      O => zero_signal_carry_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iPulse : in STD_LOGIC;
    iTimeInterval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    oNewPulseCounter : out STD_LOGIC_VECTOR ( 15 downto 0 );
    oNewDataUpdate : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZPhotonDetector_Block_ZPulse_Counter_0_0,ZPulse_Counter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZPulse_Counter,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^onewpulsecounter\ : STD_LOGIC_VECTOR ( 11 to 11 );
begin
  oNewPulseCounter(15) <= \<const0>\;
  oNewPulseCounter(14) <= \<const0>\;
  oNewPulseCounter(13) <= \<const0>\;
  oNewPulseCounter(12) <= \^onewpulsecounter\(11);
  oNewPulseCounter(11) <= \^onewpulsecounter\(11);
  oNewPulseCounter(10) <= \<const0>\;
  oNewPulseCounter(9) <= \<const0>\;
  oNewPulseCounter(8) <= \^onewpulsecounter\(11);
  oNewPulseCounter(7) <= \^onewpulsecounter\(11);
  oNewPulseCounter(6) <= \<const0>\;
  oNewPulseCounter(5) <= \<const0>\;
  oNewPulseCounter(4) <= \<const0>\;
  oNewPulseCounter(3) <= \<const0>\;
  oNewPulseCounter(2) <= \^onewpulsecounter\(11);
  oNewPulseCounter(1) <= \^onewpulsecounter\(11);
  oNewPulseCounter(0) <= \^onewpulsecounter\(11);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter
     port map (
      iClk => iClk,
      iEn => iEn,
      iPulse => iPulse,
      iRst_N => iRst_N,
      iTimeInterval(7 downto 0) => iTimeInterval(7 downto 0),
      oNewDataUpdate => oNewDataUpdate,
      oNewPulseCounter(0) => \^onewpulsecounter\(11)
    );
end STRUCTURE;
