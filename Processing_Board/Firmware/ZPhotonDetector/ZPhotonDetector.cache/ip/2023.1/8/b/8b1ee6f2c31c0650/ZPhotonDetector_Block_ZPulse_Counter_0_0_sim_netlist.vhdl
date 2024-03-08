-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Tue Oct 24 10:54:58 2023
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
    oNewPulseCounter : out STD_LOGIC_VECTOR ( 15 downto 0 );
    oNewDataUpdate : out STD_LOGIC;
    iTimeInterval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    iEn : in STD_LOGIC;
    iClk : in STD_LOGIC;
    iPulse : in STD_LOGIC;
    iRst_N : in STD_LOGIC
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
  signal \CNT1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_n_0\ : STD_LOGIC;
  signal \CNT1_carry__0_n_1\ : STD_LOGIC;
  signal \CNT1_carry__0_n_2\ : STD_LOGIC;
  signal \CNT1_carry__0_n_3\ : STD_LOGIC;
  signal \CNT1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_n_0\ : STD_LOGIC;
  signal \CNT1_carry__1_n_1\ : STD_LOGIC;
  signal \CNT1_carry__1_n_2\ : STD_LOGIC;
  signal \CNT1_carry__1_n_3\ : STD_LOGIC;
  signal \CNT1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \CNT1_carry__2_n_1\ : STD_LOGIC;
  signal \CNT1_carry__2_n_2\ : STD_LOGIC;
  signal \CNT1_carry__2_n_3\ : STD_LOGIC;
  signal CNT1_carry_i_1_n_0 : STD_LOGIC;
  signal CNT1_carry_i_2_n_0 : STD_LOGIC;
  signal CNT1_carry_i_3_n_0 : STD_LOGIC;
  signal CNT1_carry_i_4_n_0 : STD_LOGIC;
  signal CNT1_carry_i_5_n_0 : STD_LOGIC;
  signal CNT1_carry_i_6_n_0 : STD_LOGIC;
  signal CNT1_carry_i_7_n_0 : STD_LOGIC;
  signal CNT1_carry_i_8_n_0 : STD_LOGIC;
  signal CNT1_carry_n_0 : STD_LOGIC;
  signal CNT1_carry_n_1 : STD_LOGIC;
  signal CNT1_carry_n_2 : STD_LOGIC;
  signal CNT1_carry_n_3 : STD_LOGIC;
  signal CNT_Deadline : STD_LOGIC_VECTOR ( 22 downto 6 );
  signal \CNT_Deadline[10]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[13]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[15]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[17]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[19]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[22]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[22]_i_2_n_0\ : STD_LOGIC;
  signal \CNT_Deadline[6]_i_1_n_0\ : STD_LOGIC;
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
  signal oNewDataUpdate0 : STD_LOGIC_VECTOR ( 12 downto 7 );
  signal \oNewDataUpdate_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_1\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__0_n_3\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_n_2\ : STD_LOGIC;
  signal \oNewDataUpdate_carry__1_n_3\ : STD_LOGIC;
  signal oNewDataUpdate_carry_i_1_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_2_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_3_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_4_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_5_n_3 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_7_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_8_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_i_9_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_0 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_1 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_2 : STD_LOGIC;
  signal oNewDataUpdate_carry_n_3 : STD_LOGIC;
  signal \^onewpulsecounter\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal oNewPulseCounter0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \oNewPulseCounter0_carry__0_n_0\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__0_n_1\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__0_n_2\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__0_n_3\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__1_n_0\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__1_n_1\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__1_n_2\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__1_n_3\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__2_n_2\ : STD_LOGIC;
  signal \oNewPulseCounter0_carry__2_n_3\ : STD_LOGIC;
  signal oNewPulseCounter0_carry_n_0 : STD_LOGIC;
  signal oNewPulseCounter0_carry_n_1 : STD_LOGIC;
  signal oNewPulseCounter0_carry_n_2 : STD_LOGIC;
  signal oNewPulseCounter0_carry_n_3 : STD_LOGIC;
  signal \oNewPulseCounter[15]_i_1_n_0\ : STD_LOGIC;
  signal \oNewPulseCounter[15]_i_3_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zero_signal : STD_LOGIC;
  signal zero_signal0 : STD_LOGIC_VECTOR ( 12 downto 8 );
  signal \zero_signal_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_1\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__0_n_3\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \zero_signal_carry__1_n_2\ : STD_LOGIC;
  signal \zero_signal_carry__1_n_3\ : STD_LOGIC;
  signal zero_signal_carry_i_1_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_2_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_3_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_4_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_1 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_2 : STD_LOGIC;
  signal zero_signal_carry_i_5_n_3 : STD_LOGIC;
  signal zero_signal_carry_i_6_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_7_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_8_n_0 : STD_LOGIC;
  signal zero_signal_carry_i_9_n_0 : STD_LOGIC;
  signal zero_signal_carry_n_0 : STD_LOGIC;
  signal zero_signal_carry_n_1 : STD_LOGIC;
  signal zero_signal_carry_n_2 : STD_LOGIC;
  signal zero_signal_carry_n_3 : STD_LOGIC;
  signal NLW_CNT1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_CNT_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_oNewDataUpdate_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__0_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_oNewDataUpdate_carry__0_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oNewDataUpdate_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_oNewDataUpdate_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_oNewDataUpdate_carry_i_5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_oNewPulseCounter0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_oNewPulseCounter0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_zero_signal_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_zero_signal_carry__0_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_signal_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero_signal_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of CNT1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \CNT1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \CNT1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \CNT1_carry__2\ : label is 11;
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
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \CNT_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[16]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[20]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[24]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[28]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT_reg[8]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of oNewPulseCounter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \oNewPulseCounter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \oNewPulseCounter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \oNewPulseCounter0_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of \oNewPulseCounter[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \oNewPulseCounter[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \oNewPulseCounter[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \oNewPulseCounter[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \oNewPulseCounter[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \oNewPulseCounter[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \oNewPulseCounter[15]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \oNewPulseCounter[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \oNewPulseCounter[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \oNewPulseCounter[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \oNewPulseCounter[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \oNewPulseCounter[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \oNewPulseCounter[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \oNewPulseCounter[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \oNewPulseCounter[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \oNewPulseCounter[9]_i_1\ : label is "soft_lutpair4";
begin
  oNewPulseCounter(15 downto 0) <= \^onewpulsecounter\(15 downto 0);
CNT1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => CNT1_carry_n_0,
      CO(2) => CNT1_carry_n_1,
      CO(1) => CNT1_carry_n_2,
      CO(0) => CNT1_carry_n_3,
      CYINIT => '1',
      DI(3) => CNT1_carry_i_1_n_0,
      DI(2) => CNT1_carry_i_2_n_0,
      DI(1) => CNT1_carry_i_3_n_0,
      DI(0) => CNT1_carry_i_4_n_0,
      O(3 downto 0) => NLW_CNT1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => CNT1_carry_i_5_n_0,
      S(2) => CNT1_carry_i_6_n_0,
      S(1) => CNT1_carry_i_7_n_0,
      S(0) => CNT1_carry_i_8_n_0
    );
\CNT1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => CNT1_carry_n_0,
      CO(3) => \CNT1_carry__0_n_0\,
      CO(2) => \CNT1_carry__0_n_1\,
      CO(1) => \CNT1_carry__0_n_2\,
      CO(0) => \CNT1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \CNT1_carry__0_i_1_n_0\,
      DI(2) => \CNT1_carry__0_i_2_n_0\,
      DI(1) => \CNT1_carry__0_i_3_n_0\,
      DI(0) => \CNT1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_CNT1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \CNT1_carry__0_i_5_n_0\,
      S(2) => \CNT1_carry__0_i_6_n_0\,
      S(1) => \CNT1_carry__0_i_7_n_0\,
      S(0) => \CNT1_carry__0_i_8_n_0\
    );
\CNT1_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => CNT(15),
      I1 => CNT_Deadline(15),
      I2 => CNT(14),
      O => \CNT1_carry__0_i_1_n_0\
    );
\CNT1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT(13),
      I1 => CNT_Deadline(13),
      O => \CNT1_carry__0_i_2_n_0\
    );
\CNT1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => CNT(11),
      I1 => CNT_Deadline(6),
      I2 => CNT(10),
      I3 => CNT_Deadline(10),
      O => \CNT1_carry__0_i_3_n_0\
    );
\CNT1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => CNT(9),
      I1 => CNT_Deadline(9),
      I2 => CNT(8),
      I3 => CNT_Deadline(8),
      O => \CNT1_carry__0_i_4_n_0\
    );
\CNT1_carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => CNT(15),
      I1 => CNT_Deadline(15),
      I2 => CNT(14),
      O => \CNT1_carry__0_i_5_n_0\
    );
\CNT1_carry__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"90"
    )
        port map (
      I0 => CNT(13),
      I1 => CNT_Deadline(13),
      I2 => CNT(12),
      O => \CNT1_carry__0_i_6_n_0\
    );
\CNT1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => CNT_Deadline(6),
      I1 => CNT(11),
      I2 => CNT_Deadline(10),
      I3 => CNT(10),
      O => \CNT1_carry__0_i_7_n_0\
    );
\CNT1_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => CNT_Deadline(9),
      I1 => CNT(9),
      I2 => CNT_Deadline(8),
      I3 => CNT(8),
      O => \CNT1_carry__0_i_8_n_0\
    );
\CNT1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT1_carry__0_n_0\,
      CO(3) => \CNT1_carry__1_n_0\,
      CO(2) => \CNT1_carry__1_n_1\,
      CO(1) => \CNT1_carry__1_n_2\,
      CO(0) => \CNT1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \CNT1_carry__1_i_1_n_0\,
      DI(2) => \CNT1_carry__1_i_2_n_0\,
      DI(1) => \CNT1_carry__1_i_3_n_0\,
      DI(0) => \CNT1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_CNT1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \CNT1_carry__1_i_5_n_0\,
      S(2) => \CNT1_carry__1_i_6_n_0\,
      S(1) => \CNT1_carry__1_i_7_n_0\,
      S(0) => \CNT1_carry__1_i_8_n_0\
    );
\CNT1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => CNT(23),
      I1 => CNT_Deadline(15),
      I2 => CNT(22),
      I3 => CNT_Deadline(22),
      O => \CNT1_carry__1_i_1_n_0\
    );
\CNT1_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => CNT(21),
      I1 => CNT(20),
      I2 => CNT_Deadline(17),
      O => \CNT1_carry__1_i_2_n_0\
    );
\CNT1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => CNT(19),
      I1 => CNT_Deadline(19),
      I2 => CNT(18),
      I3 => CNT_Deadline(13),
      O => \CNT1_carry__1_i_3_n_0\
    );
\CNT1_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => CNT(17),
      I1 => CNT_Deadline(17),
      I2 => CNT(16),
      O => \CNT1_carry__1_i_4_n_0\
    );
\CNT1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => CNT(22),
      I1 => CNT_Deadline(22),
      I2 => CNT(23),
      I3 => CNT_Deadline(15),
      O => \CNT1_carry__1_i_5_n_0\
    );
\CNT1_carry__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"81"
    )
        port map (
      I0 => CNT_Deadline(17),
      I1 => CNT(20),
      I2 => CNT(21),
      O => \CNT1_carry__1_i_6_n_0\
    );
\CNT1_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => CNT(18),
      I1 => CNT_Deadline(13),
      I2 => CNT(19),
      I3 => CNT_Deadline(19),
      O => \CNT1_carry__1_i_7_n_0\
    );
\CNT1_carry__1_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => CNT(17),
      I1 => CNT_Deadline(17),
      I2 => CNT(16),
      O => \CNT1_carry__1_i_8_n_0\
    );
\CNT1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT1_carry__1_n_0\,
      CO(3) => CNT1,
      CO(2) => \CNT1_carry__2_n_1\,
      CO(1) => \CNT1_carry__2_n_2\,
      CO(0) => \CNT1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \CNT1_carry__2_i_1_n_0\,
      DI(2) => \CNT1_carry__2_i_2_n_0\,
      DI(1) => \CNT1_carry__2_i_3_n_0\,
      DI(0) => \CNT1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_CNT1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \CNT1_carry__2_i_5_n_0\,
      S(2) => \CNT1_carry__2_i_6_n_0\,
      S(1) => \CNT1_carry__2_i_7_n_0\,
      S(0) => \CNT1_carry__2_i_8_n_0\
    );
\CNT1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \CNT1_carry__2_i_1_n_0\
    );
\CNT1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(28),
      I1 => CNT(29),
      O => \CNT1_carry__2_i_2_n_0\
    );
\CNT1_carry__2_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => CNT_Deadline(15),
      I1 => CNT(26),
      I2 => CNT(27),
      O => \CNT1_carry__2_i_3_n_0\
    );
\CNT1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(24),
      I1 => CNT(25),
      O => \CNT1_carry__2_i_4_n_0\
    );
\CNT1_carry__2_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \CNT1_carry__2_i_5_n_0\
    );
\CNT1_carry__2_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(29),
      I1 => CNT(28),
      O => \CNT1_carry__2_i_6_n_0\
    );
\CNT1_carry__2_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => CNT(26),
      I1 => CNT_Deadline(15),
      I2 => CNT(27),
      O => \CNT1_carry__2_i_7_n_0\
    );
\CNT1_carry__2_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(25),
      I1 => CNT(24),
      O => \CNT1_carry__2_i_8_n_0\
    );
CNT1_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => CNT_Deadline(6),
      I1 => CNT(6),
      I2 => CNT(7),
      O => CNT1_carry_i_1_n_0
    );
CNT1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(4),
      I1 => CNT(5),
      O => CNT1_carry_i_2_n_0
    );
CNT1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(2),
      I1 => CNT(3),
      O => CNT1_carry_i_3_n_0
    );
CNT1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => CNT(0),
      I1 => CNT(1),
      O => CNT1_carry_i_4_n_0
    );
CNT1_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => CNT_Deadline(6),
      I1 => CNT(6),
      I2 => CNT(7),
      O => CNT1_carry_i_5_n_0
    );
CNT1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(4),
      I1 => CNT(5),
      O => CNT1_carry_i_6_n_0
    );
CNT1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(2),
      I1 => CNT(3),
      O => CNT1_carry_i_7_n_0
    );
CNT1_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(0),
      I1 => CNT(1),
      O => CNT1_carry_i_8_n_0
    );
\CNT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT(0),
      O => p_0_in(0)
    );
\CNT[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(10),
      O => p_0_in(10)
    );
\CNT[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(11),
      O => p_0_in(11)
    );
\CNT[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(12),
      O => p_0_in(12)
    );
\CNT[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(13),
      O => p_0_in(13)
    );
\CNT[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(14),
      O => p_0_in(14)
    );
\CNT[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(15),
      O => p_0_in(15)
    );
\CNT[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(16),
      O => p_0_in(16)
    );
\CNT[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(17),
      O => p_0_in(17)
    );
\CNT[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(18),
      O => p_0_in(18)
    );
\CNT[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(19),
      O => p_0_in(19)
    );
\CNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(1),
      O => p_0_in(1)
    );
\CNT[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(20),
      O => p_0_in(20)
    );
\CNT[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(21),
      O => p_0_in(21)
    );
\CNT[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(22),
      O => p_0_in(22)
    );
\CNT[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(23),
      O => p_0_in(23)
    );
\CNT[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(24),
      O => p_0_in(24)
    );
\CNT[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(25),
      O => p_0_in(25)
    );
\CNT[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(26),
      O => p_0_in(26)
    );
\CNT[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(27),
      O => p_0_in(27)
    );
\CNT[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(28),
      O => p_0_in(28)
    );
\CNT[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(29),
      O => p_0_in(29)
    );
\CNT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(2),
      O => p_0_in(2)
    );
\CNT[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(30),
      O => p_0_in(30)
    );
\CNT[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(31),
      O => p_0_in(31)
    );
\CNT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(3),
      O => p_0_in(3)
    );
\CNT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(4),
      O => p_0_in(4)
    );
\CNT[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(5),
      O => p_0_in(5)
    );
\CNT[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(6),
      O => p_0_in(6)
    );
\CNT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(7),
      O => p_0_in(7)
    );
\CNT[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(8),
      O => p_0_in(8)
    );
\CNT[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => CNT1,
      I1 => iEn,
      I2 => CNT0(9),
      O => p_0_in(9)
    );
\CNT_Deadline[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(0),
      I5 => iTimeInterval(1),
      O => \CNT_Deadline[10]_i_1_n_0\
    );
\CNT_Deadline[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(0),
      O => \CNT_Deadline[13]_i_1_n_0\
    );
\CNT_Deadline[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFFFEFFFFFF"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(1),
      I5 => iTimeInterval(0),
      O => \CNT_Deadline[15]_i_1_n_0\
    );
\CNT_Deadline[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(1),
      I5 => iTimeInterval(0),
      O => \CNT_Deadline[17]_i_1_n_0\
    );
\CNT_Deadline[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(1),
      O => \CNT_Deadline[19]_i_1_n_0\
    );
\CNT_Deadline[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFFFEFFFFFF"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(0),
      I5 => iTimeInterval(1),
      O => \CNT_Deadline[22]_i_1_n_0\
    );
\CNT_Deadline[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => iTimeInterval(4),
      I1 => iTimeInterval(3),
      I2 => iTimeInterval(6),
      I3 => iTimeInterval(5),
      O => \CNT_Deadline[22]_i_2_n_0\
    );
\CNT_Deadline[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(0),
      I5 => iTimeInterval(1),
      O => \CNT_Deadline[6]_i_1_n_0\
    );
\CNT_Deadline[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010001000000"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(1),
      I5 => iTimeInterval(0),
      O => \CNT_Deadline[8]_i_1_n_0\
    );
\CNT_Deadline[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \CNT_Deadline[22]_i_2_n_0\,
      I1 => iTimeInterval(2),
      I2 => iTimeInterval(7),
      I3 => iEn,
      I4 => iTimeInterval(0),
      O => \CNT_Deadline[9]_i_1_n_0\
    );
\CNT_Deadline_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[10]_i_1_n_0\,
      PRE => \oNewPulseCounter[15]_i_3_n_0\,
      Q => CNT_Deadline(10)
    );
\CNT_Deadline_reg[13]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[13]_i_1_n_0\,
      PRE => \oNewPulseCounter[15]_i_3_n_0\,
      Q => CNT_Deadline(13)
    );
\CNT_Deadline_reg[15]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[15]_i_1_n_0\,
      PRE => \oNewPulseCounter[15]_i_3_n_0\,
      Q => CNT_Deadline(15)
    );
\CNT_Deadline_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => \CNT_Deadline[17]_i_1_n_0\,
      Q => CNT_Deadline(17)
    );
\CNT_Deadline_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => \CNT_Deadline[19]_i_1_n_0\,
      Q => CNT_Deadline(19)
    );
\CNT_Deadline_reg[22]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \CNT_Deadline[22]_i_1_n_0\,
      PRE => \oNewPulseCounter[15]_i_3_n_0\,
      Q => CNT_Deadline(22)
    );
\CNT_Deadline_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => \CNT_Deadline[6]_i_1_n_0\,
      Q => CNT_Deadline(6)
    );
\CNT_Deadline_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => \CNT_Deadline[8]_i_1_n_0\,
      Q => CNT_Deadline(8)
    );
\CNT_Deadline_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => \CNT_Deadline[9]_i_1_n_0\,
      Q => CNT_Deadline(9)
    );
\CNT_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(0),
      Q => CNT(0)
    );
\CNT_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(10),
      Q => CNT(10)
    );
\CNT_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(11),
      Q => CNT(11)
    );
\CNT_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(12),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(13),
      Q => CNT(13)
    );
\CNT_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(14),
      Q => CNT(14)
    );
\CNT_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(15),
      Q => CNT(15)
    );
\CNT_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(16),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(17),
      Q => CNT(17)
    );
\CNT_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(18),
      Q => CNT(18)
    );
\CNT_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(19),
      Q => CNT(19)
    );
\CNT_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(1),
      Q => CNT(1)
    );
\CNT_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(20),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(21),
      Q => CNT(21)
    );
\CNT_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(22),
      Q => CNT(22)
    );
\CNT_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(23),
      Q => CNT(23)
    );
\CNT_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(24),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(25),
      Q => CNT(25)
    );
\CNT_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(26),
      Q => CNT(26)
    );
\CNT_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(27),
      Q => CNT(27)
    );
\CNT_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(28),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(29),
      Q => CNT(29)
    );
\CNT_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(2),
      Q => CNT(2)
    );
\CNT_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(30),
      Q => CNT(30)
    );
\CNT_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(31),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(3),
      Q => CNT(3)
    );
\CNT_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(4),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(5),
      Q => CNT(5)
    );
\CNT_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(6),
      Q => CNT(6)
    );
\CNT_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(7),
      Q => CNT(7)
    );
\CNT_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(8),
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
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_0_in(9),
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
      I0 => CNT_Deadline(15),
      I1 => CNT(23),
      I2 => CNT_Deadline(22),
      I3 => CNT(22),
      I4 => CNT(21),
      I5 => CNT_Deadline(17),
      O => \oNewDataUpdate_carry__0_i_1_n_0\
    );
\oNewDataUpdate_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(19),
      I1 => CNT(19),
      I2 => CNT_Deadline(13),
      I3 => CNT(18),
      I4 => CNT(20),
      I5 => CNT_Deadline(17),
      O => \oNewDataUpdate_carry__0_i_2_n_0\
    );
\oNewDataUpdate_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000041"
    )
        port map (
      I0 => CNT(16),
      I1 => CNT_Deadline(15),
      I2 => CNT(15),
      I3 => CNT(17),
      I4 => CNT_Deadline(17),
      O => \oNewDataUpdate_carry__0_i_3_n_0\
    );
\oNewDataUpdate_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000009"
    )
        port map (
      I0 => CNT(13),
      I1 => CNT_Deadline(13),
      I2 => CNT(14),
      I3 => oNewDataUpdate0(12),
      I4 => CNT(12),
      O => \oNewDataUpdate_carry__0_i_4_n_0\
    );
\oNewDataUpdate_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => oNewDataUpdate_carry_i_5_n_0,
      CO(3 downto 1) => \NLW_oNewDataUpdate_carry__0_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => oNewDataUpdate0(12),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_oNewDataUpdate_carry__0_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
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
\oNewDataUpdate_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \oNewDataUpdate_carry__1_i_1_n_0\
    );
\oNewDataUpdate_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(29),
      I1 => CNT(28),
      I2 => CNT(27),
      O => \oNewDataUpdate_carry__1_i_2_n_0\
    );
\oNewDataUpdate_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => CNT(26),
      I1 => CNT_Deadline(15),
      I2 => CNT(25),
      I3 => CNT(24),
      O => \oNewDataUpdate_carry__1_i_3_n_0\
    );
oNewDataUpdate_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => oNewDataUpdate0(11),
      I1 => CNT(11),
      I2 => oNewDataUpdate0(10),
      I3 => CNT(10),
      I4 => CNT(9),
      I5 => oNewDataUpdate0(9),
      O => oNewDataUpdate_carry_i_1_n_0
    );
oNewDataUpdate_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00412800"
    )
        port map (
      I0 => CNT(7),
      I1 => CNT_Deadline(8),
      I2 => CNT(8),
      I3 => CNT(6),
      I4 => CNT_Deadline(6),
      O => oNewDataUpdate_carry_i_2_n_0
    );
oNewDataUpdate_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => CNT(5),
      I1 => CNT(4),
      I2 => CNT(3),
      O => oNewDataUpdate_carry_i_3_n_0
    );
oNewDataUpdate_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => CNT(2),
      I1 => CNT(1),
      I2 => CNT(0),
      O => oNewDataUpdate_carry_i_4_n_0
    );
oNewDataUpdate_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oNewDataUpdate_carry_i_5_n_0,
      CO(2) => oNewDataUpdate_carry_i_5_n_1,
      CO(1) => oNewDataUpdate_carry_i_5_n_2,
      CO(0) => oNewDataUpdate_carry_i_5_n_3,
      CYINIT => CNT_Deadline(6),
      DI(3) => CNT_Deadline(6),
      DI(2 downto 0) => CNT_Deadline(10 downto 8),
      O(3 downto 1) => oNewDataUpdate0(11 downto 9),
      O(0) => NLW_oNewDataUpdate_carry_i_5_O_UNCONNECTED(0),
      S(3) => oNewDataUpdate0(7),
      S(2) => oNewDataUpdate_carry_i_7_n_0,
      S(1) => oNewDataUpdate_carry_i_8_n_0,
      S(0) => oNewDataUpdate_carry_i_9_n_0
    );
oNewDataUpdate_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(6),
      O => oNewDataUpdate0(7)
    );
oNewDataUpdate_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(10),
      O => oNewDataUpdate_carry_i_7_n_0
    );
oNewDataUpdate_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(9),
      O => oNewDataUpdate_carry_i_8_n_0
    );
oNewDataUpdate_carry_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(8),
      O => oNewDataUpdate_carry_i_9_n_0
    );
oNewPulseCounter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oNewPulseCounter0_carry_n_0,
      CO(2) => oNewPulseCounter0_carry_n_1,
      CO(1) => oNewPulseCounter0_carry_n_2,
      CO(0) => oNewPulseCounter0_carry_n_3,
      CYINIT => \^onewpulsecounter\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => oNewPulseCounter0(4 downto 1),
      S(3 downto 0) => \^onewpulsecounter\(4 downto 1)
    );
\oNewPulseCounter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => oNewPulseCounter0_carry_n_0,
      CO(3) => \oNewPulseCounter0_carry__0_n_0\,
      CO(2) => \oNewPulseCounter0_carry__0_n_1\,
      CO(1) => \oNewPulseCounter0_carry__0_n_2\,
      CO(0) => \oNewPulseCounter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => oNewPulseCounter0(8 downto 5),
      S(3 downto 0) => \^onewpulsecounter\(8 downto 5)
    );
\oNewPulseCounter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \oNewPulseCounter0_carry__0_n_0\,
      CO(3) => \oNewPulseCounter0_carry__1_n_0\,
      CO(2) => \oNewPulseCounter0_carry__1_n_1\,
      CO(1) => \oNewPulseCounter0_carry__1_n_2\,
      CO(0) => \oNewPulseCounter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => oNewPulseCounter0(12 downto 9),
      S(3 downto 0) => \^onewpulsecounter\(12 downto 9)
    );
\oNewPulseCounter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \oNewPulseCounter0_carry__1_n_0\,
      CO(3 downto 2) => \NLW_oNewPulseCounter0_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \oNewPulseCounter0_carry__2_n_2\,
      CO(0) => \oNewPulseCounter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_oNewPulseCounter0_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => oNewPulseCounter0(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => \^onewpulsecounter\(15 downto 13)
    );
\oNewPulseCounter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => iEn,
      I1 => zero_signal,
      I2 => \^onewpulsecounter\(0),
      O => p_1_in(0)
    );
\oNewPulseCounter[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(10),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(10)
    );
\oNewPulseCounter[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(11),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(11)
    );
\oNewPulseCounter[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(12),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(12)
    );
\oNewPulseCounter[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(13),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(13)
    );
\oNewPulseCounter[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(14),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(14)
    );
\oNewPulseCounter[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => iEn,
      I1 => zero_signal,
      I2 => iPulse,
      O => \oNewPulseCounter[15]_i_1_n_0\
    );
\oNewPulseCounter[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(15),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(15)
    );
\oNewPulseCounter[15]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => \oNewPulseCounter[15]_i_3_n_0\
    );
\oNewPulseCounter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(1),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(1)
    );
\oNewPulseCounter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(2),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(2)
    );
\oNewPulseCounter[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(3),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(3)
    );
\oNewPulseCounter[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(4),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(4)
    );
\oNewPulseCounter[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(5),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(5)
    );
\oNewPulseCounter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(6),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(6)
    );
\oNewPulseCounter[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(7),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(7)
    );
\oNewPulseCounter[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(8),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(8)
    );
\oNewPulseCounter[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => oNewPulseCounter0(9),
      I1 => iEn,
      I2 => zero_signal,
      O => p_1_in(9)
    );
\oNewPulseCounter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(0),
      Q => \^onewpulsecounter\(0)
    );
\oNewPulseCounter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(10),
      Q => \^onewpulsecounter\(10)
    );
\oNewPulseCounter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(11),
      Q => \^onewpulsecounter\(11)
    );
\oNewPulseCounter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(12),
      Q => \^onewpulsecounter\(12)
    );
\oNewPulseCounter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(13),
      Q => \^onewpulsecounter\(13)
    );
\oNewPulseCounter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(14),
      Q => \^onewpulsecounter\(14)
    );
\oNewPulseCounter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(15),
      Q => \^onewpulsecounter\(15)
    );
\oNewPulseCounter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(1),
      Q => \^onewpulsecounter\(1)
    );
\oNewPulseCounter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(2),
      Q => \^onewpulsecounter\(2)
    );
\oNewPulseCounter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(3),
      Q => \^onewpulsecounter\(3)
    );
\oNewPulseCounter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(4),
      Q => \^onewpulsecounter\(4)
    );
\oNewPulseCounter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(5),
      Q => \^onewpulsecounter\(5)
    );
\oNewPulseCounter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(6),
      Q => \^onewpulsecounter\(6)
    );
\oNewPulseCounter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(7),
      Q => \^onewpulsecounter\(7)
    );
\oNewPulseCounter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(8),
      Q => \^onewpulsecounter\(8)
    );
\oNewPulseCounter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \oNewPulseCounter[15]_i_1_n_0\,
      CLR => \oNewPulseCounter[15]_i_3_n_0\,
      D => p_1_in(9),
      Q => \^onewpulsecounter\(9)
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
      I0 => CNT_Deadline(15),
      I1 => CNT(23),
      I2 => CNT_Deadline(22),
      I3 => CNT(22),
      I4 => CNT(21),
      I5 => CNT_Deadline(17),
      O => \zero_signal_carry__0_i_1_n_0\
    );
\zero_signal_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => CNT_Deadline(19),
      I1 => CNT(19),
      I2 => CNT_Deadline(13),
      I3 => CNT(18),
      I4 => CNT(20),
      I5 => CNT_Deadline(17),
      O => \zero_signal_carry__0_i_2_n_0\
    );
\zero_signal_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000041"
    )
        port map (
      I0 => CNT(16),
      I1 => CNT_Deadline(15),
      I2 => CNT(15),
      I3 => CNT(17),
      I4 => CNT_Deadline(17),
      O => \zero_signal_carry__0_i_3_n_0\
    );
\zero_signal_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000009"
    )
        port map (
      I0 => CNT(13),
      I1 => CNT_Deadline(13),
      I2 => CNT(14),
      I3 => zero_signal0(12),
      I4 => CNT(12),
      O => \zero_signal_carry__0_i_4_n_0\
    );
\zero_signal_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => zero_signal_carry_i_5_n_0,
      CO(3 downto 1) => \NLW_zero_signal_carry__0_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => zero_signal0(12),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_zero_signal_carry__0_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
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
\zero_signal_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \zero_signal_carry__1_i_1_n_0\
    );
\zero_signal_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(29),
      I1 => CNT(28),
      I2 => CNT(27),
      O => \zero_signal_carry__1_i_2_n_0\
    );
\zero_signal_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => CNT(26),
      I1 => CNT_Deadline(15),
      I2 => CNT(25),
      I3 => CNT(24),
      O => \zero_signal_carry__1_i_3_n_0\
    );
zero_signal_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => zero_signal0(11),
      I1 => CNT(11),
      I2 => zero_signal0(10),
      I3 => CNT(10),
      I4 => CNT(9),
      I5 => zero_signal0(9),
      O => zero_signal_carry_i_1_n_0
    );
zero_signal_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00418200"
    )
        port map (
      I0 => CNT(7),
      I1 => zero_signal0(8),
      I2 => CNT(8),
      I3 => CNT(6),
      I4 => CNT_Deadline(6),
      O => zero_signal_carry_i_2_n_0
    );
zero_signal_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => CNT(5),
      I1 => CNT(4),
      I2 => CNT(3),
      O => zero_signal_carry_i_3_n_0
    );
zero_signal_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => CNT(2),
      I1 => CNT(1),
      I2 => CNT(0),
      O => zero_signal_carry_i_4_n_0
    );
zero_signal_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_signal_carry_i_5_n_0,
      CO(2) => zero_signal_carry_i_5_n_1,
      CO(1) => zero_signal_carry_i_5_n_2,
      CO(0) => zero_signal_carry_i_5_n_3,
      CYINIT => CNT_Deadline(6),
      DI(3) => CNT_Deadline(6),
      DI(2 downto 0) => CNT_Deadline(10 downto 8),
      O(3 downto 0) => zero_signal0(11 downto 8),
      S(3) => zero_signal_carry_i_6_n_0,
      S(2) => zero_signal_carry_i_7_n_0,
      S(1) => zero_signal_carry_i_8_n_0,
      S(0) => zero_signal_carry_i_9_n_0
    );
zero_signal_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(6),
      O => zero_signal_carry_i_6_n_0
    );
zero_signal_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(10),
      O => zero_signal_carry_i_7_n_0
    );
zero_signal_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(9),
      O => zero_signal_carry_i_8_n_0
    );
zero_signal_carry_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_Deadline(8),
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
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZPulse_Counter
     port map (
      iClk => iClk,
      iEn => iEn,
      iPulse => iPulse,
      iRst_N => iRst_N,
      iTimeInterval(7 downto 0) => iTimeInterval(7 downto 0),
      oNewDataUpdate => oNewDataUpdate,
      oNewPulseCounter(15 downto 0) => oNewPulseCounter(15 downto 0)
    );
end STRUCTURE;
