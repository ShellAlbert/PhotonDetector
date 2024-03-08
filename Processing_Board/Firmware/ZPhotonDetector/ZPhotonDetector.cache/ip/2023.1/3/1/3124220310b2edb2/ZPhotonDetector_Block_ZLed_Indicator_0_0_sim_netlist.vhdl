-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Tue Oct 24 10:54:58 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZLed_Indicator_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZLed_Indicator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator is
  port (
    oLED : out STD_LOGIC_VECTOR ( 0 to 0 );
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator is
  signal cnt_1S1 : STD_LOGIC;
  signal \cnt_1S[0]_i_10_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_11_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_12_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_13_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_14_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_15_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_16_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_17_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_18_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_19_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_20_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_21_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_7_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_8_n_0\ : STD_LOGIC;
  signal \cnt_1S[0]_i_9_n_0\ : STD_LOGIC;
  signal \cnt_1S[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[12]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[12]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[12]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[16]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[16]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[16]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[16]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[20]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[20]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[20]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[20]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[24]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[24]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[24]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[24]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[28]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[28]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[28]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[28]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[4]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[4]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[4]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1S[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S[8]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1S[8]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1S[8]_i_5_n_0\ : STD_LOGIC;
  signal cnt_1S_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cnt_1S_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1S_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS1__44\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_10_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_11_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_12_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_13_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_14_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_15_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_16_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_17_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_18_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_19_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_20_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_21_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_22_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_23_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_24_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_25_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_26_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_8_n_0\ : STD_LOGIC;
  signal \cnt_1mS[0]_i_9_n_0\ : STD_LOGIC;
  signal \cnt_1mS[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[12]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[12]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[12]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[16]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[16]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[16]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[16]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[20]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[20]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[20]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[20]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[24]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[24]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[24]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[24]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[28]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[28]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[28]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[28]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[4]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[4]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[4]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1mS[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS[8]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1mS[8]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1mS[8]_i_5_n_0\ : STD_LOGIC;
  signal cnt_1mS_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cnt_1mS_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_1mS_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal cnt_1uS : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cnt_1uS0_carry__0_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__0_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__0_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__0_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__1_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__1_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__1_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__1_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__2_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__2_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__2_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__2_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__3_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__3_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__3_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__3_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__4_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__4_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__4_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__4_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__5_n_0\ : STD_LOGIC;
  signal \cnt_1uS0_carry__5_n_1\ : STD_LOGIC;
  signal \cnt_1uS0_carry__5_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__5_n_3\ : STD_LOGIC;
  signal \cnt_1uS0_carry__6_n_2\ : STD_LOGIC;
  signal \cnt_1uS0_carry__6_n_3\ : STD_LOGIC;
  signal cnt_1uS0_carry_n_0 : STD_LOGIC;
  signal cnt_1uS0_carry_n_1 : STD_LOGIC;
  signal cnt_1uS0_carry_n_2 : STD_LOGIC;
  signal cnt_1uS0_carry_n_3 : STD_LOGIC;
  signal \cnt_1uS[31]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_7_n_0\ : STD_LOGIC;
  signal \cnt_1uS[31]_i_8_n_0\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[0]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[10]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[11]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[12]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[13]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[14]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[15]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[16]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[17]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[18]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[19]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[1]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[20]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[21]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[22]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[23]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[24]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[25]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[26]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[27]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[28]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[29]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[2]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[30]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[31]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[3]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[4]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[5]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[6]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[7]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[8]\ : STD_LOGIC;
  signal \cnt_1uS_reg_n_0_[9]\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal oLED_r2 : STD_LOGIC;
  signal oLED_r20_in : STD_LOGIC;
  signal \oLED_r2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__0_n_1\ : STD_LOGIC;
  signal \oLED_r2_carry__0_n_2\ : STD_LOGIC;
  signal \oLED_r2_carry__0_n_3\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__1_n_1\ : STD_LOGIC;
  signal \oLED_r2_carry__1_n_2\ : STD_LOGIC;
  signal \oLED_r2_carry__1_n_3\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \oLED_r2_carry__2_n_1\ : STD_LOGIC;
  signal \oLED_r2_carry__2_n_2\ : STD_LOGIC;
  signal \oLED_r2_carry__2_n_3\ : STD_LOGIC;
  signal oLED_r2_carry_i_1_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_2_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_3_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_4_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_5_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_6_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_7_n_0 : STD_LOGIC;
  signal oLED_r2_carry_i_8_n_0 : STD_LOGIC;
  signal oLED_r2_carry_n_0 : STD_LOGIC;
  signal oLED_r2_carry_n_1 : STD_LOGIC;
  signal oLED_r2_carry_n_2 : STD_LOGIC;
  signal oLED_r2_carry_n_3 : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \oLED_r2_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \oLED_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \oLED_r[1]_i_2_n_0\ : STD_LOGIC;
  signal on_off_flag : STD_LOGIC;
  signal on_off_flag_i_1_n_0 : STD_LOGIC;
  signal \NLW_cnt_1S_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cnt_1mS_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cnt_1uS0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_1uS0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_oLED_r2_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oLED_r2_inferred__0/i__carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1S_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_1mS_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of cnt_1uS0_carry : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1uS0_carry__6\ : label is 35;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of oLED_r2_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_carry__2\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_inferred__0/i__carry\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_inferred__0/i__carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_inferred__0/i__carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \oLED_r2_inferred__0/i__carry__2\ : label is 11;
begin
\cnt_1S[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => cnt_1S1,
      I1 => \cnt_1mS1__44\,
      O => \cnt_1S[0]_i_1_n_0\
    );
\cnt_1S[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \cnt_1S[0]_i_16_n_0\,
      I1 => \cnt_1S[0]_i_17_n_0\,
      I2 => \cnt_1S[0]_i_18_n_0\,
      I3 => \cnt_1S[0]_i_19_n_0\,
      O => \cnt_1S[0]_i_10_n_0\
    );
\cnt_1S[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cnt_1S[0]_i_20_n_0\,
      I1 => \cnt_1uS[31]_i_7_n_0\,
      I2 => \cnt_1S[0]_i_21_n_0\,
      I3 => \cnt_1uS[31]_i_8_n_0\,
      I4 => \cnt_1uS[31]_i_3_n_0\,
      O => \cnt_1S[0]_i_11_n_0\
    );
\cnt_1S[0]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1S_reg(20),
      I1 => cnt_1S_reg(21),
      I2 => cnt_1S_reg(22),
      I3 => cnt_1S_reg(23),
      O => \cnt_1S[0]_i_12_n_0\
    );
\cnt_1S[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1S_reg(16),
      I1 => cnt_1S_reg(17),
      I2 => cnt_1S_reg(18),
      I3 => cnt_1S_reg(19),
      O => \cnt_1S[0]_i_13_n_0\
    );
\cnt_1S[0]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1S_reg(28),
      I1 => cnt_1S_reg(29),
      I2 => cnt_1S_reg(31),
      I3 => cnt_1S_reg(30),
      O => \cnt_1S[0]_i_14_n_0\
    );
\cnt_1S[0]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1S_reg(24),
      I1 => cnt_1S_reg(25),
      I2 => cnt_1S_reg(26),
      I3 => cnt_1S_reg(27),
      O => \cnt_1S[0]_i_15_n_0\
    );
\cnt_1S[0]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => cnt_1S_reg(7),
      I1 => cnt_1S_reg(6),
      I2 => cnt_1S_reg(4),
      I3 => cnt_1S_reg(5),
      O => \cnt_1S[0]_i_16_n_0\
    );
\cnt_1S[0]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => cnt_1S_reg(1),
      I1 => cnt_1S_reg(0),
      I2 => cnt_1S_reg(3),
      I3 => cnt_1S_reg(2),
      O => \cnt_1S[0]_i_17_n_0\
    );
\cnt_1S[0]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => cnt_1S_reg(11),
      I1 => cnt_1S_reg(10),
      I2 => cnt_1S_reg(9),
      I3 => cnt_1S_reg(8),
      O => \cnt_1S[0]_i_18_n_0\
    );
\cnt_1S[0]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => cnt_1S_reg(15),
      I1 => cnt_1S_reg(14),
      I2 => cnt_1S_reg(13),
      I3 => cnt_1S_reg(12),
      O => \cnt_1S[0]_i_19_n_0\
    );
\cnt_1S[0]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[16]\,
      I1 => \cnt_1uS_reg_n_0_[17]\,
      I2 => \cnt_1uS_reg_n_0_[18]\,
      I3 => \cnt_1uS_reg_n_0_[19]\,
      O => \cnt_1S[0]_i_20_n_0\
    );
\cnt_1S[0]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[8]\,
      I1 => \cnt_1uS_reg_n_0_[9]\,
      I2 => \cnt_1uS_reg_n_0_[10]\,
      I3 => \cnt_1uS_reg_n_0_[11]\,
      O => \cnt_1S[0]_i_21_n_0\
    );
\cnt_1S[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => \cnt_1S[0]_i_9_n_0\,
      I1 => \cnt_1S[0]_i_10_n_0\,
      I2 => \cnt_1mS[0]_i_18_n_0\,
      I3 => \cnt_1mS[0]_i_17_n_0\,
      I4 => \cnt_1S[0]_i_11_n_0\,
      I5 => \cnt_1mS[0]_i_16_n_0\,
      O => cnt_1S1
    );
\cnt_1S[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(0),
      I1 => cnt_1S1,
      O => \cnt_1S[0]_i_4_n_0\
    );
\cnt_1S[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(3),
      I1 => cnt_1S1,
      O => \cnt_1S[0]_i_5_n_0\
    );
\cnt_1S[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(2),
      I1 => cnt_1S1,
      O => \cnt_1S[0]_i_6_n_0\
    );
\cnt_1S[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(1),
      I1 => cnt_1S1,
      O => \cnt_1S[0]_i_7_n_0\
    );
\cnt_1S[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_1S_reg(0),
      I1 => cnt_1S1,
      O => \cnt_1S[0]_i_8_n_0\
    );
\cnt_1S[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1S[0]_i_12_n_0\,
      I1 => \cnt_1S[0]_i_13_n_0\,
      I2 => \cnt_1S[0]_i_14_n_0\,
      I3 => \cnt_1S[0]_i_15_n_0\,
      O => \cnt_1S[0]_i_9_n_0\
    );
\cnt_1S[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(15),
      I1 => cnt_1S1,
      O => \cnt_1S[12]_i_2_n_0\
    );
\cnt_1S[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(14),
      I1 => cnt_1S1,
      O => \cnt_1S[12]_i_3_n_0\
    );
\cnt_1S[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(13),
      I1 => cnt_1S1,
      O => \cnt_1S[12]_i_4_n_0\
    );
\cnt_1S[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(12),
      I1 => cnt_1S1,
      O => \cnt_1S[12]_i_5_n_0\
    );
\cnt_1S[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(19),
      I1 => cnt_1S1,
      O => \cnt_1S[16]_i_2_n_0\
    );
\cnt_1S[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(18),
      I1 => cnt_1S1,
      O => \cnt_1S[16]_i_3_n_0\
    );
\cnt_1S[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(17),
      I1 => cnt_1S1,
      O => \cnt_1S[16]_i_4_n_0\
    );
\cnt_1S[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(16),
      I1 => cnt_1S1,
      O => \cnt_1S[16]_i_5_n_0\
    );
\cnt_1S[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(23),
      I1 => cnt_1S1,
      O => \cnt_1S[20]_i_2_n_0\
    );
\cnt_1S[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(22),
      I1 => cnt_1S1,
      O => \cnt_1S[20]_i_3_n_0\
    );
\cnt_1S[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(21),
      I1 => cnt_1S1,
      O => \cnt_1S[20]_i_4_n_0\
    );
\cnt_1S[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(20),
      I1 => cnt_1S1,
      O => \cnt_1S[20]_i_5_n_0\
    );
\cnt_1S[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(27),
      I1 => cnt_1S1,
      O => \cnt_1S[24]_i_2_n_0\
    );
\cnt_1S[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(26),
      I1 => cnt_1S1,
      O => \cnt_1S[24]_i_3_n_0\
    );
\cnt_1S[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(25),
      I1 => cnt_1S1,
      O => \cnt_1S[24]_i_4_n_0\
    );
\cnt_1S[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(24),
      I1 => cnt_1S1,
      O => \cnt_1S[24]_i_5_n_0\
    );
\cnt_1S[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(31),
      I1 => cnt_1S1,
      O => \cnt_1S[28]_i_2_n_0\
    );
\cnt_1S[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(30),
      I1 => cnt_1S1,
      O => \cnt_1S[28]_i_3_n_0\
    );
\cnt_1S[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(29),
      I1 => cnt_1S1,
      O => \cnt_1S[28]_i_4_n_0\
    );
\cnt_1S[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(28),
      I1 => cnt_1S1,
      O => \cnt_1S[28]_i_5_n_0\
    );
\cnt_1S[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(7),
      I1 => cnt_1S1,
      O => \cnt_1S[4]_i_2_n_0\
    );
\cnt_1S[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(6),
      I1 => cnt_1S1,
      O => \cnt_1S[4]_i_3_n_0\
    );
\cnt_1S[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(5),
      I1 => cnt_1S1,
      O => \cnt_1S[4]_i_4_n_0\
    );
\cnt_1S[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(4),
      I1 => cnt_1S1,
      O => \cnt_1S[4]_i_5_n_0\
    );
\cnt_1S[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(11),
      I1 => cnt_1S1,
      O => \cnt_1S[8]_i_2_n_0\
    );
\cnt_1S[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(10),
      I1 => cnt_1S1,
      O => \cnt_1S[8]_i_3_n_0\
    );
\cnt_1S[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(9),
      I1 => cnt_1S1,
      O => \cnt_1S[8]_i_4_n_0\
    );
\cnt_1S[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1S_reg(8),
      I1 => cnt_1S1,
      O => \cnt_1S[8]_i_5_n_0\
    );
\cnt_1S_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[0]_i_2_n_7\,
      Q => cnt_1S_reg(0)
    );
\cnt_1S_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_1S_reg[0]_i_2_n_0\,
      CO(2) => \cnt_1S_reg[0]_i_2_n_1\,
      CO(1) => \cnt_1S_reg[0]_i_2_n_2\,
      CO(0) => \cnt_1S_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \cnt_1S[0]_i_4_n_0\,
      O(3) => \cnt_1S_reg[0]_i_2_n_4\,
      O(2) => \cnt_1S_reg[0]_i_2_n_5\,
      O(1) => \cnt_1S_reg[0]_i_2_n_6\,
      O(0) => \cnt_1S_reg[0]_i_2_n_7\,
      S(3) => \cnt_1S[0]_i_5_n_0\,
      S(2) => \cnt_1S[0]_i_6_n_0\,
      S(1) => \cnt_1S[0]_i_7_n_0\,
      S(0) => \cnt_1S[0]_i_8_n_0\
    );
\cnt_1S_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[8]_i_1_n_5\,
      Q => cnt_1S_reg(10)
    );
\cnt_1S_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[8]_i_1_n_4\,
      Q => cnt_1S_reg(11)
    );
\cnt_1S_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[12]_i_1_n_7\,
      Q => cnt_1S_reg(12)
    );
\cnt_1S_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[8]_i_1_n_0\,
      CO(3) => \cnt_1S_reg[12]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[12]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[12]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[12]_i_1_n_4\,
      O(2) => \cnt_1S_reg[12]_i_1_n_5\,
      O(1) => \cnt_1S_reg[12]_i_1_n_6\,
      O(0) => \cnt_1S_reg[12]_i_1_n_7\,
      S(3) => \cnt_1S[12]_i_2_n_0\,
      S(2) => \cnt_1S[12]_i_3_n_0\,
      S(1) => \cnt_1S[12]_i_4_n_0\,
      S(0) => \cnt_1S[12]_i_5_n_0\
    );
\cnt_1S_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[12]_i_1_n_6\,
      Q => cnt_1S_reg(13)
    );
\cnt_1S_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[12]_i_1_n_5\,
      Q => cnt_1S_reg(14)
    );
\cnt_1S_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[12]_i_1_n_4\,
      Q => cnt_1S_reg(15)
    );
\cnt_1S_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[16]_i_1_n_7\,
      Q => cnt_1S_reg(16)
    );
\cnt_1S_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[12]_i_1_n_0\,
      CO(3) => \cnt_1S_reg[16]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[16]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[16]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[16]_i_1_n_4\,
      O(2) => \cnt_1S_reg[16]_i_1_n_5\,
      O(1) => \cnt_1S_reg[16]_i_1_n_6\,
      O(0) => \cnt_1S_reg[16]_i_1_n_7\,
      S(3) => \cnt_1S[16]_i_2_n_0\,
      S(2) => \cnt_1S[16]_i_3_n_0\,
      S(1) => \cnt_1S[16]_i_4_n_0\,
      S(0) => \cnt_1S[16]_i_5_n_0\
    );
\cnt_1S_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[16]_i_1_n_6\,
      Q => cnt_1S_reg(17)
    );
\cnt_1S_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[16]_i_1_n_5\,
      Q => cnt_1S_reg(18)
    );
\cnt_1S_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[16]_i_1_n_4\,
      Q => cnt_1S_reg(19)
    );
\cnt_1S_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[0]_i_2_n_6\,
      Q => cnt_1S_reg(1)
    );
\cnt_1S_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[20]_i_1_n_7\,
      Q => cnt_1S_reg(20)
    );
\cnt_1S_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[16]_i_1_n_0\,
      CO(3) => \cnt_1S_reg[20]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[20]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[20]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[20]_i_1_n_4\,
      O(2) => \cnt_1S_reg[20]_i_1_n_5\,
      O(1) => \cnt_1S_reg[20]_i_1_n_6\,
      O(0) => \cnt_1S_reg[20]_i_1_n_7\,
      S(3) => \cnt_1S[20]_i_2_n_0\,
      S(2) => \cnt_1S[20]_i_3_n_0\,
      S(1) => \cnt_1S[20]_i_4_n_0\,
      S(0) => \cnt_1S[20]_i_5_n_0\
    );
\cnt_1S_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[20]_i_1_n_6\,
      Q => cnt_1S_reg(21)
    );
\cnt_1S_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[20]_i_1_n_5\,
      Q => cnt_1S_reg(22)
    );
\cnt_1S_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[20]_i_1_n_4\,
      Q => cnt_1S_reg(23)
    );
\cnt_1S_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[24]_i_1_n_7\,
      Q => cnt_1S_reg(24)
    );
\cnt_1S_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[20]_i_1_n_0\,
      CO(3) => \cnt_1S_reg[24]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[24]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[24]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[24]_i_1_n_4\,
      O(2) => \cnt_1S_reg[24]_i_1_n_5\,
      O(1) => \cnt_1S_reg[24]_i_1_n_6\,
      O(0) => \cnt_1S_reg[24]_i_1_n_7\,
      S(3) => \cnt_1S[24]_i_2_n_0\,
      S(2) => \cnt_1S[24]_i_3_n_0\,
      S(1) => \cnt_1S[24]_i_4_n_0\,
      S(0) => \cnt_1S[24]_i_5_n_0\
    );
\cnt_1S_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[24]_i_1_n_6\,
      Q => cnt_1S_reg(25)
    );
\cnt_1S_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[24]_i_1_n_5\,
      Q => cnt_1S_reg(26)
    );
\cnt_1S_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[24]_i_1_n_4\,
      Q => cnt_1S_reg(27)
    );
\cnt_1S_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[28]_i_1_n_7\,
      Q => cnt_1S_reg(28)
    );
\cnt_1S_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[24]_i_1_n_0\,
      CO(3) => \NLW_cnt_1S_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \cnt_1S_reg[28]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[28]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[28]_i_1_n_4\,
      O(2) => \cnt_1S_reg[28]_i_1_n_5\,
      O(1) => \cnt_1S_reg[28]_i_1_n_6\,
      O(0) => \cnt_1S_reg[28]_i_1_n_7\,
      S(3) => \cnt_1S[28]_i_2_n_0\,
      S(2) => \cnt_1S[28]_i_3_n_0\,
      S(1) => \cnt_1S[28]_i_4_n_0\,
      S(0) => \cnt_1S[28]_i_5_n_0\
    );
\cnt_1S_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[28]_i_1_n_6\,
      Q => cnt_1S_reg(29)
    );
\cnt_1S_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[0]_i_2_n_5\,
      Q => cnt_1S_reg(2)
    );
\cnt_1S_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[28]_i_1_n_5\,
      Q => cnt_1S_reg(30)
    );
\cnt_1S_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[28]_i_1_n_4\,
      Q => cnt_1S_reg(31)
    );
\cnt_1S_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[0]_i_2_n_4\,
      Q => cnt_1S_reg(3)
    );
\cnt_1S_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[4]_i_1_n_7\,
      Q => cnt_1S_reg(4)
    );
\cnt_1S_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[0]_i_2_n_0\,
      CO(3) => \cnt_1S_reg[4]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[4]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[4]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[4]_i_1_n_4\,
      O(2) => \cnt_1S_reg[4]_i_1_n_5\,
      O(1) => \cnt_1S_reg[4]_i_1_n_6\,
      O(0) => \cnt_1S_reg[4]_i_1_n_7\,
      S(3) => \cnt_1S[4]_i_2_n_0\,
      S(2) => \cnt_1S[4]_i_3_n_0\,
      S(1) => \cnt_1S[4]_i_4_n_0\,
      S(0) => \cnt_1S[4]_i_5_n_0\
    );
\cnt_1S_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[4]_i_1_n_6\,
      Q => cnt_1S_reg(5)
    );
\cnt_1S_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[4]_i_1_n_5\,
      Q => cnt_1S_reg(6)
    );
\cnt_1S_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[4]_i_1_n_4\,
      Q => cnt_1S_reg(7)
    );
\cnt_1S_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[8]_i_1_n_7\,
      Q => cnt_1S_reg(8)
    );
\cnt_1S_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1S_reg[4]_i_1_n_0\,
      CO(3) => \cnt_1S_reg[8]_i_1_n_0\,
      CO(2) => \cnt_1S_reg[8]_i_1_n_1\,
      CO(1) => \cnt_1S_reg[8]_i_1_n_2\,
      CO(0) => \cnt_1S_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1S_reg[8]_i_1_n_4\,
      O(2) => \cnt_1S_reg[8]_i_1_n_5\,
      O(1) => \cnt_1S_reg[8]_i_1_n_6\,
      O(0) => \cnt_1S_reg[8]_i_1_n_7\,
      S(3) => \cnt_1S[8]_i_2_n_0\,
      S(2) => \cnt_1S[8]_i_3_n_0\,
      S(1) => \cnt_1S[8]_i_4_n_0\,
      S(0) => \cnt_1S[8]_i_5_n_0\
    );
\cnt_1S_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1S[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1S_reg[8]_i_1_n_6\,
      Q => cnt_1S_reg(9)
    );
\cnt_1mS[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00008000"
    )
        port map (
      I0 => \cnt_1mS[0]_i_3_n_0\,
      I1 => \cnt_1mS[0]_i_4_n_0\,
      I2 => \cnt_1mS[0]_i_5_n_0\,
      I3 => \cnt_1mS[0]_i_6_n_0\,
      I4 => \cnt_1uS[31]_i_3_n_0\,
      I5 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_1_n_0\
    );
\cnt_1mS[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(2),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_10_n_0\
    );
\cnt_1mS[0]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(1),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_11_n_0\
    );
\cnt_1mS[0]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_1mS_reg(0),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_12_n_0\
    );
\cnt_1mS[0]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230023002300"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[7]\,
      I1 => \cnt_1uS_reg_n_0_[8]\,
      I2 => \cnt_1uS_reg_n_0_[6]\,
      I3 => \cnt_1uS_reg_n_0_[5]\,
      I4 => \cnt_1uS_reg_n_0_[4]\,
      I5 => \cnt_1uS_reg_n_0_[3]\,
      O => \cnt_1mS[0]_i_13_n_0\
    );
\cnt_1mS[0]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[14]\,
      I1 => \cnt_1uS_reg_n_0_[13]\,
      I2 => \cnt_1uS_reg_n_0_[16]\,
      I3 => \cnt_1uS_reg_n_0_[17]\,
      O => \cnt_1mS[0]_i_14_n_0\
    );
\cnt_1mS[0]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230000002323"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[28]\,
      I1 => \cnt_1uS_reg_n_0_[29]\,
      I2 => \cnt_1uS_reg_n_0_[27]\,
      I3 => \cnt_1uS_reg_n_0_[25]\,
      I4 => \cnt_1uS_reg_n_0_[26]\,
      I5 => \cnt_1uS_reg_n_0_[24]\,
      O => \cnt_1mS[0]_i_15_n_0\
    );
\cnt_1mS[0]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[24]\,
      I1 => \cnt_1uS_reg_n_0_[27]\,
      I2 => \cnt_1uS_reg_n_0_[3]\,
      I3 => \cnt_1uS_reg_n_0_[6]\,
      I4 => \cnt_1uS[31]_i_5_n_0\,
      O => \cnt_1mS[0]_i_16_n_0\
    );
\cnt_1mS[0]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1mS[0]_i_19_n_0\,
      I1 => \cnt_1mS[0]_i_20_n_0\,
      I2 => \cnt_1mS[0]_i_21_n_0\,
      I3 => \cnt_1mS[0]_i_22_n_0\,
      O => \cnt_1mS[0]_i_17_n_0\
    );
\cnt_1mS[0]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \cnt_1mS[0]_i_23_n_0\,
      I1 => \cnt_1mS[0]_i_24_n_0\,
      I2 => \cnt_1mS[0]_i_25_n_0\,
      I3 => \cnt_1mS[0]_i_26_n_0\,
      O => \cnt_1mS[0]_i_18_n_0\
    );
\cnt_1mS[0]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1mS_reg(20),
      I1 => cnt_1mS_reg(21),
      I2 => cnt_1mS_reg(22),
      I3 => cnt_1mS_reg(23),
      O => \cnt_1mS[0]_i_19_n_0\
    );
\cnt_1mS[0]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1mS_reg(16),
      I1 => cnt_1mS_reg(17),
      I2 => cnt_1mS_reg(18),
      I3 => cnt_1mS_reg(19),
      O => \cnt_1mS[0]_i_20_n_0\
    );
\cnt_1mS[0]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1mS_reg(28),
      I1 => cnt_1mS_reg(29),
      I2 => cnt_1mS_reg(31),
      I3 => cnt_1mS_reg(30),
      O => \cnt_1mS[0]_i_21_n_0\
    );
\cnt_1mS[0]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1mS_reg(24),
      I1 => cnt_1mS_reg(25),
      I2 => cnt_1mS_reg(26),
      I3 => cnt_1mS_reg(27),
      O => \cnt_1mS[0]_i_22_n_0\
    );
\cnt_1mS[0]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => cnt_1mS_reg(7),
      I1 => cnt_1mS_reg(6),
      I2 => cnt_1mS_reg(4),
      I3 => cnt_1mS_reg(5),
      O => \cnt_1mS[0]_i_23_n_0\
    );
\cnt_1mS[0]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => cnt_1mS_reg(1),
      I1 => cnt_1mS_reg(0),
      I2 => cnt_1mS_reg(3),
      I3 => cnt_1mS_reg(2),
      O => \cnt_1mS[0]_i_24_n_0\
    );
\cnt_1mS[0]_i_25\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => cnt_1mS_reg(11),
      I1 => cnt_1mS_reg(10),
      I2 => cnt_1mS_reg(9),
      I3 => cnt_1mS_reg(8),
      O => \cnt_1mS[0]_i_25_n_0\
    );
\cnt_1mS[0]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => cnt_1mS_reg(15),
      I1 => cnt_1mS_reg(14),
      I2 => cnt_1mS_reg(13),
      I3 => cnt_1mS_reg(12),
      O => \cnt_1mS[0]_i_26_n_0\
    );
\cnt_1mS[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \cnt_1mS[0]_i_13_n_0\,
      I1 => \cnt_1mS[0]_i_14_n_0\,
      I2 => \cnt_1uS_reg_n_0_[8]\,
      I3 => \cnt_1uS_reg_n_0_[11]\,
      I4 => \cnt_1uS_reg_n_0_[10]\,
      I5 => \cnt_1uS[31]_i_5_n_0\,
      O => \cnt_1mS[0]_i_3_n_0\
    );
\cnt_1mS[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230000002323"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[13]\,
      I1 => \cnt_1uS_reg_n_0_[14]\,
      I2 => \cnt_1uS_reg_n_0_[12]\,
      I3 => \cnt_1uS_reg_n_0_[10]\,
      I4 => \cnt_1uS_reg_n_0_[11]\,
      I5 => \cnt_1uS_reg_n_0_[9]\,
      O => \cnt_1mS[0]_i_4_n_0\
    );
\cnt_1mS[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230000002323"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[19]\,
      I1 => \cnt_1uS_reg_n_0_[20]\,
      I2 => \cnt_1uS_reg_n_0_[18]\,
      I3 => \cnt_1uS_reg_n_0_[16]\,
      I4 => \cnt_1uS_reg_n_0_[17]\,
      I5 => \cnt_1uS_reg_n_0_[15]\,
      O => \cnt_1mS[0]_i_5_n_0\
    );
\cnt_1mS[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \cnt_1mS[0]_i_15_n_0\,
      I1 => \cnt_1uS_reg_n_0_[21]\,
      I2 => \cnt_1uS_reg_n_0_[23]\,
      I3 => \cnt_1uS_reg_n_0_[22]\,
      I4 => \cnt_1uS_reg_n_0_[20]\,
      I5 => \cnt_1uS_reg_n_0_[19]\,
      O => \cnt_1mS[0]_i_6_n_0\
    );
\cnt_1mS[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \cnt_1mS[0]_i_16_n_0\,
      I1 => \cnt_1uS[31]_i_2_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_3_n_0\,
      I4 => \cnt_1mS[0]_i_17_n_0\,
      I5 => \cnt_1mS[0]_i_18_n_0\,
      O => \cnt_1mS1__44\
    );
\cnt_1mS[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(0),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_8_n_0\
    );
\cnt_1mS[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(3),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[0]_i_9_n_0\
    );
\cnt_1mS[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(15),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[12]_i_2_n_0\
    );
\cnt_1mS[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(14),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[12]_i_3_n_0\
    );
\cnt_1mS[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(13),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[12]_i_4_n_0\
    );
\cnt_1mS[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(12),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[12]_i_5_n_0\
    );
\cnt_1mS[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(19),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[16]_i_2_n_0\
    );
\cnt_1mS[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(18),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[16]_i_3_n_0\
    );
\cnt_1mS[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(17),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[16]_i_4_n_0\
    );
\cnt_1mS[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(16),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[16]_i_5_n_0\
    );
\cnt_1mS[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(23),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[20]_i_2_n_0\
    );
\cnt_1mS[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(22),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[20]_i_3_n_0\
    );
\cnt_1mS[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(21),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[20]_i_4_n_0\
    );
\cnt_1mS[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(20),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[20]_i_5_n_0\
    );
\cnt_1mS[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(27),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[24]_i_2_n_0\
    );
\cnt_1mS[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(26),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[24]_i_3_n_0\
    );
\cnt_1mS[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(25),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[24]_i_4_n_0\
    );
\cnt_1mS[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(24),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[24]_i_5_n_0\
    );
\cnt_1mS[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(31),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[28]_i_2_n_0\
    );
\cnt_1mS[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(30),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[28]_i_3_n_0\
    );
\cnt_1mS[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(29),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[28]_i_4_n_0\
    );
\cnt_1mS[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(28),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[28]_i_5_n_0\
    );
\cnt_1mS[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(7),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[4]_i_2_n_0\
    );
\cnt_1mS[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(6),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[4]_i_3_n_0\
    );
\cnt_1mS[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(5),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[4]_i_4_n_0\
    );
\cnt_1mS[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(4),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[4]_i_5_n_0\
    );
\cnt_1mS[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(11),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[8]_i_2_n_0\
    );
\cnt_1mS[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(10),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[8]_i_3_n_0\
    );
\cnt_1mS[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(9),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[8]_i_4_n_0\
    );
\cnt_1mS[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1mS_reg(8),
      I1 => \cnt_1mS1__44\,
      O => \cnt_1mS[8]_i_5_n_0\
    );
\cnt_1mS_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[0]_i_2_n_7\,
      Q => cnt_1mS_reg(0)
    );
\cnt_1mS_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_1mS_reg[0]_i_2_n_0\,
      CO(2) => \cnt_1mS_reg[0]_i_2_n_1\,
      CO(1) => \cnt_1mS_reg[0]_i_2_n_2\,
      CO(0) => \cnt_1mS_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \cnt_1mS[0]_i_8_n_0\,
      O(3) => \cnt_1mS_reg[0]_i_2_n_4\,
      O(2) => \cnt_1mS_reg[0]_i_2_n_5\,
      O(1) => \cnt_1mS_reg[0]_i_2_n_6\,
      O(0) => \cnt_1mS_reg[0]_i_2_n_7\,
      S(3) => \cnt_1mS[0]_i_9_n_0\,
      S(2) => \cnt_1mS[0]_i_10_n_0\,
      S(1) => \cnt_1mS[0]_i_11_n_0\,
      S(0) => \cnt_1mS[0]_i_12_n_0\
    );
\cnt_1mS_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[8]_i_1_n_5\,
      Q => cnt_1mS_reg(10)
    );
\cnt_1mS_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[8]_i_1_n_4\,
      Q => cnt_1mS_reg(11)
    );
\cnt_1mS_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[12]_i_1_n_7\,
      Q => cnt_1mS_reg(12)
    );
\cnt_1mS_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[8]_i_1_n_0\,
      CO(3) => \cnt_1mS_reg[12]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[12]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[12]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[12]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[12]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[12]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[12]_i_1_n_7\,
      S(3) => \cnt_1mS[12]_i_2_n_0\,
      S(2) => \cnt_1mS[12]_i_3_n_0\,
      S(1) => \cnt_1mS[12]_i_4_n_0\,
      S(0) => \cnt_1mS[12]_i_5_n_0\
    );
\cnt_1mS_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[12]_i_1_n_6\,
      Q => cnt_1mS_reg(13)
    );
\cnt_1mS_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[12]_i_1_n_5\,
      Q => cnt_1mS_reg(14)
    );
\cnt_1mS_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[12]_i_1_n_4\,
      Q => cnt_1mS_reg(15)
    );
\cnt_1mS_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[16]_i_1_n_7\,
      Q => cnt_1mS_reg(16)
    );
\cnt_1mS_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[12]_i_1_n_0\,
      CO(3) => \cnt_1mS_reg[16]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[16]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[16]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[16]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[16]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[16]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[16]_i_1_n_7\,
      S(3) => \cnt_1mS[16]_i_2_n_0\,
      S(2) => \cnt_1mS[16]_i_3_n_0\,
      S(1) => \cnt_1mS[16]_i_4_n_0\,
      S(0) => \cnt_1mS[16]_i_5_n_0\
    );
\cnt_1mS_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[16]_i_1_n_6\,
      Q => cnt_1mS_reg(17)
    );
\cnt_1mS_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[16]_i_1_n_5\,
      Q => cnt_1mS_reg(18)
    );
\cnt_1mS_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[16]_i_1_n_4\,
      Q => cnt_1mS_reg(19)
    );
\cnt_1mS_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[0]_i_2_n_6\,
      Q => cnt_1mS_reg(1)
    );
\cnt_1mS_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[20]_i_1_n_7\,
      Q => cnt_1mS_reg(20)
    );
\cnt_1mS_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[16]_i_1_n_0\,
      CO(3) => \cnt_1mS_reg[20]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[20]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[20]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[20]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[20]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[20]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[20]_i_1_n_7\,
      S(3) => \cnt_1mS[20]_i_2_n_0\,
      S(2) => \cnt_1mS[20]_i_3_n_0\,
      S(1) => \cnt_1mS[20]_i_4_n_0\,
      S(0) => \cnt_1mS[20]_i_5_n_0\
    );
\cnt_1mS_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[20]_i_1_n_6\,
      Q => cnt_1mS_reg(21)
    );
\cnt_1mS_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[20]_i_1_n_5\,
      Q => cnt_1mS_reg(22)
    );
\cnt_1mS_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[20]_i_1_n_4\,
      Q => cnt_1mS_reg(23)
    );
\cnt_1mS_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[24]_i_1_n_7\,
      Q => cnt_1mS_reg(24)
    );
\cnt_1mS_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[20]_i_1_n_0\,
      CO(3) => \cnt_1mS_reg[24]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[24]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[24]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[24]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[24]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[24]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[24]_i_1_n_7\,
      S(3) => \cnt_1mS[24]_i_2_n_0\,
      S(2) => \cnt_1mS[24]_i_3_n_0\,
      S(1) => \cnt_1mS[24]_i_4_n_0\,
      S(0) => \cnt_1mS[24]_i_5_n_0\
    );
\cnt_1mS_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[24]_i_1_n_6\,
      Q => cnt_1mS_reg(25)
    );
\cnt_1mS_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[24]_i_1_n_5\,
      Q => cnt_1mS_reg(26)
    );
\cnt_1mS_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[24]_i_1_n_4\,
      Q => cnt_1mS_reg(27)
    );
\cnt_1mS_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[28]_i_1_n_7\,
      Q => cnt_1mS_reg(28)
    );
\cnt_1mS_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[24]_i_1_n_0\,
      CO(3) => \NLW_cnt_1mS_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \cnt_1mS_reg[28]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[28]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[28]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[28]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[28]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[28]_i_1_n_7\,
      S(3) => \cnt_1mS[28]_i_2_n_0\,
      S(2) => \cnt_1mS[28]_i_3_n_0\,
      S(1) => \cnt_1mS[28]_i_4_n_0\,
      S(0) => \cnt_1mS[28]_i_5_n_0\
    );
\cnt_1mS_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[28]_i_1_n_6\,
      Q => cnt_1mS_reg(29)
    );
\cnt_1mS_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[0]_i_2_n_5\,
      Q => cnt_1mS_reg(2)
    );
\cnt_1mS_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[28]_i_1_n_5\,
      Q => cnt_1mS_reg(30)
    );
\cnt_1mS_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[28]_i_1_n_4\,
      Q => cnt_1mS_reg(31)
    );
\cnt_1mS_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[0]_i_2_n_4\,
      Q => cnt_1mS_reg(3)
    );
\cnt_1mS_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[4]_i_1_n_7\,
      Q => cnt_1mS_reg(4)
    );
\cnt_1mS_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[0]_i_2_n_0\,
      CO(3) => \cnt_1mS_reg[4]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[4]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[4]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[4]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[4]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[4]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[4]_i_1_n_7\,
      S(3) => \cnt_1mS[4]_i_2_n_0\,
      S(2) => \cnt_1mS[4]_i_3_n_0\,
      S(1) => \cnt_1mS[4]_i_4_n_0\,
      S(0) => \cnt_1mS[4]_i_5_n_0\
    );
\cnt_1mS_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[4]_i_1_n_6\,
      Q => cnt_1mS_reg(5)
    );
\cnt_1mS_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[4]_i_1_n_5\,
      Q => cnt_1mS_reg(6)
    );
\cnt_1mS_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[4]_i_1_n_4\,
      Q => cnt_1mS_reg(7)
    );
\cnt_1mS_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[8]_i_1_n_7\,
      Q => cnt_1mS_reg(8)
    );
\cnt_1mS_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1mS_reg[4]_i_1_n_0\,
      CO(3) => \cnt_1mS_reg[8]_i_1_n_0\,
      CO(2) => \cnt_1mS_reg[8]_i_1_n_1\,
      CO(1) => \cnt_1mS_reg[8]_i_1_n_2\,
      CO(0) => \cnt_1mS_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_1mS_reg[8]_i_1_n_4\,
      O(2) => \cnt_1mS_reg[8]_i_1_n_5\,
      O(1) => \cnt_1mS_reg[8]_i_1_n_6\,
      O(0) => \cnt_1mS_reg[8]_i_1_n_7\,
      S(3) => \cnt_1mS[8]_i_2_n_0\,
      S(2) => \cnt_1mS[8]_i_3_n_0\,
      S(1) => \cnt_1mS[8]_i_4_n_0\,
      S(0) => \cnt_1mS[8]_i_5_n_0\
    );
\cnt_1mS_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \cnt_1mS[0]_i_1_n_0\,
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \cnt_1mS_reg[8]_i_1_n_6\,
      Q => cnt_1mS_reg(9)
    );
cnt_1uS0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => cnt_1uS0_carry_n_0,
      CO(2) => cnt_1uS0_carry_n_1,
      CO(1) => cnt_1uS0_carry_n_2,
      CO(0) => cnt_1uS0_carry_n_3,
      CYINIT => \cnt_1uS_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \cnt_1uS_reg_n_0_[4]\,
      S(2) => \cnt_1uS_reg_n_0_[3]\,
      S(1) => \cnt_1uS_reg_n_0_[2]\,
      S(0) => \cnt_1uS_reg_n_0_[1]\
    );
\cnt_1uS0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => cnt_1uS0_carry_n_0,
      CO(3) => \cnt_1uS0_carry__0_n_0\,
      CO(2) => \cnt_1uS0_carry__0_n_1\,
      CO(1) => \cnt_1uS0_carry__0_n_2\,
      CO(0) => \cnt_1uS0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \cnt_1uS_reg_n_0_[8]\,
      S(2) => \cnt_1uS_reg_n_0_[7]\,
      S(1) => \cnt_1uS_reg_n_0_[6]\,
      S(0) => \cnt_1uS_reg_n_0_[5]\
    );
\cnt_1uS0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__0_n_0\,
      CO(3) => \cnt_1uS0_carry__1_n_0\,
      CO(2) => \cnt_1uS0_carry__1_n_1\,
      CO(1) => \cnt_1uS0_carry__1_n_2\,
      CO(0) => \cnt_1uS0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \cnt_1uS_reg_n_0_[12]\,
      S(2) => \cnt_1uS_reg_n_0_[11]\,
      S(1) => \cnt_1uS_reg_n_0_[10]\,
      S(0) => \cnt_1uS_reg_n_0_[9]\
    );
\cnt_1uS0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__1_n_0\,
      CO(3) => \cnt_1uS0_carry__2_n_0\,
      CO(2) => \cnt_1uS0_carry__2_n_1\,
      CO(1) => \cnt_1uS0_carry__2_n_2\,
      CO(0) => \cnt_1uS0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \cnt_1uS_reg_n_0_[16]\,
      S(2) => \cnt_1uS_reg_n_0_[15]\,
      S(1) => \cnt_1uS_reg_n_0_[14]\,
      S(0) => \cnt_1uS_reg_n_0_[13]\
    );
\cnt_1uS0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__2_n_0\,
      CO(3) => \cnt_1uS0_carry__3_n_0\,
      CO(2) => \cnt_1uS0_carry__3_n_1\,
      CO(1) => \cnt_1uS0_carry__3_n_2\,
      CO(0) => \cnt_1uS0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \cnt_1uS_reg_n_0_[20]\,
      S(2) => \cnt_1uS_reg_n_0_[19]\,
      S(1) => \cnt_1uS_reg_n_0_[18]\,
      S(0) => \cnt_1uS_reg_n_0_[17]\
    );
\cnt_1uS0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__3_n_0\,
      CO(3) => \cnt_1uS0_carry__4_n_0\,
      CO(2) => \cnt_1uS0_carry__4_n_1\,
      CO(1) => \cnt_1uS0_carry__4_n_2\,
      CO(0) => \cnt_1uS0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \cnt_1uS_reg_n_0_[24]\,
      S(2) => \cnt_1uS_reg_n_0_[23]\,
      S(1) => \cnt_1uS_reg_n_0_[22]\,
      S(0) => \cnt_1uS_reg_n_0_[21]\
    );
\cnt_1uS0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__4_n_0\,
      CO(3) => \cnt_1uS0_carry__5_n_0\,
      CO(2) => \cnt_1uS0_carry__5_n_1\,
      CO(1) => \cnt_1uS0_carry__5_n_2\,
      CO(0) => \cnt_1uS0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \cnt_1uS_reg_n_0_[28]\,
      S(2) => \cnt_1uS_reg_n_0_[27]\,
      S(1) => \cnt_1uS_reg_n_0_[26]\,
      S(0) => \cnt_1uS_reg_n_0_[25]\
    );
\cnt_1uS0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1uS0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_cnt_1uS0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_1uS0_carry__6_n_2\,
      CO(0) => \cnt_1uS0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_cnt_1uS0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2) => \cnt_1uS_reg_n_0_[31]\,
      S(1) => \cnt_1uS_reg_n_0_[30]\,
      S(0) => \cnt_1uS_reg_n_0_[29]\
    );
\cnt_1uS[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFEFFFF"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => \cnt_1uS_reg_n_0_[0]\,
      O => cnt_1uS(0)
    );
\cnt_1uS[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(10),
      O => cnt_1uS(10)
    );
\cnt_1uS[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(11),
      O => cnt_1uS(11)
    );
\cnt_1uS[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(12),
      O => cnt_1uS(12)
    );
\cnt_1uS[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(13),
      O => cnt_1uS(13)
    );
\cnt_1uS[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(14),
      O => cnt_1uS(14)
    );
\cnt_1uS[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(15),
      O => cnt_1uS(15)
    );
\cnt_1uS[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(16),
      O => cnt_1uS(16)
    );
\cnt_1uS[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(17),
      O => cnt_1uS(17)
    );
\cnt_1uS[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(18),
      O => cnt_1uS(18)
    );
\cnt_1uS[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(19),
      O => cnt_1uS(19)
    );
\cnt_1uS[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(1),
      O => cnt_1uS(1)
    );
\cnt_1uS[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(20),
      O => cnt_1uS(20)
    );
\cnt_1uS[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(21),
      O => cnt_1uS(21)
    );
\cnt_1uS[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(22),
      O => cnt_1uS(22)
    );
\cnt_1uS[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(23),
      O => cnt_1uS(23)
    );
\cnt_1uS[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(24),
      O => cnt_1uS(24)
    );
\cnt_1uS[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(25),
      O => cnt_1uS(25)
    );
\cnt_1uS[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(26),
      O => cnt_1uS(26)
    );
\cnt_1uS[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(27),
      O => cnt_1uS(27)
    );
\cnt_1uS[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(28),
      O => cnt_1uS(28)
    );
\cnt_1uS[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(29),
      O => cnt_1uS(29)
    );
\cnt_1uS[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(2),
      O => cnt_1uS(2)
    );
\cnt_1uS[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(30),
      O => cnt_1uS(30)
    );
\cnt_1uS[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(31),
      O => cnt_1uS(31)
    );
\cnt_1uS[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[19]\,
      I1 => \cnt_1uS_reg_n_0_[18]\,
      I2 => \cnt_1uS_reg_n_0_[17]\,
      I3 => \cnt_1uS_reg_n_0_[16]\,
      I4 => \cnt_1uS[31]_i_7_n_0\,
      O => \cnt_1uS[31]_i_2_n_0\
    );
\cnt_1uS[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[26]\,
      I1 => \cnt_1uS_reg_n_0_[25]\,
      I2 => \cnt_1uS_reg_n_0_[29]\,
      I3 => \cnt_1uS_reg_n_0_[28]\,
      I4 => \cnt_1uS_reg_n_0_[31]\,
      I5 => \cnt_1uS_reg_n_0_[30]\,
      O => \cnt_1uS[31]_i_3_n_0\
    );
\cnt_1uS[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[11]\,
      I1 => \cnt_1uS_reg_n_0_[10]\,
      I2 => \cnt_1uS_reg_n_0_[9]\,
      I3 => \cnt_1uS_reg_n_0_[8]\,
      I4 => \cnt_1uS[31]_i_8_n_0\,
      O => \cnt_1uS[31]_i_4_n_0\
    );
\cnt_1uS[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF7FF"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[5]\,
      I1 => \cnt_1uS_reg_n_0_[4]\,
      I2 => \cnt_1uS_reg_n_0_[7]\,
      I3 => \cnt_1uS_reg_n_0_[1]\,
      I4 => \cnt_1uS_reg_n_0_[2]\,
      I5 => \cnt_1uS_reg_n_0_[0]\,
      O => \cnt_1uS[31]_i_5_n_0\
    );
\cnt_1uS[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[6]\,
      I1 => \cnt_1uS_reg_n_0_[3]\,
      I2 => \cnt_1uS_reg_n_0_[27]\,
      I3 => \cnt_1uS_reg_n_0_[24]\,
      O => \cnt_1uS[31]_i_6_n_0\
    );
\cnt_1uS[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[20]\,
      I1 => \cnt_1uS_reg_n_0_[21]\,
      I2 => \cnt_1uS_reg_n_0_[22]\,
      I3 => \cnt_1uS_reg_n_0_[23]\,
      O => \cnt_1uS[31]_i_7_n_0\
    );
\cnt_1uS[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_1uS_reg_n_0_[12]\,
      I1 => \cnt_1uS_reg_n_0_[13]\,
      I2 => \cnt_1uS_reg_n_0_[14]\,
      I3 => \cnt_1uS_reg_n_0_[15]\,
      O => \cnt_1uS[31]_i_8_n_0\
    );
\cnt_1uS[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(3),
      O => cnt_1uS(3)
    );
\cnt_1uS[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(4),
      O => cnt_1uS(4)
    );
\cnt_1uS[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(5),
      O => cnt_1uS(5)
    );
\cnt_1uS[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(6),
      O => cnt_1uS(6)
    );
\cnt_1uS[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(7),
      O => cnt_1uS(7)
    );
\cnt_1uS[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(8),
      O => cnt_1uS(8)
    );
\cnt_1uS[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00000000"
    )
        port map (
      I0 => \cnt_1uS[31]_i_2_n_0\,
      I1 => \cnt_1uS[31]_i_3_n_0\,
      I2 => \cnt_1uS[31]_i_4_n_0\,
      I3 => \cnt_1uS[31]_i_5_n_0\,
      I4 => \cnt_1uS[31]_i_6_n_0\,
      I5 => data0(9),
      O => cnt_1uS(9)
    );
\cnt_1uS_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(0),
      Q => \cnt_1uS_reg_n_0_[0]\
    );
\cnt_1uS_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(10),
      Q => \cnt_1uS_reg_n_0_[10]\
    );
\cnt_1uS_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(11),
      Q => \cnt_1uS_reg_n_0_[11]\
    );
\cnt_1uS_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(12),
      Q => \cnt_1uS_reg_n_0_[12]\
    );
\cnt_1uS_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(13),
      Q => \cnt_1uS_reg_n_0_[13]\
    );
\cnt_1uS_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(14),
      Q => \cnt_1uS_reg_n_0_[14]\
    );
\cnt_1uS_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(15),
      Q => \cnt_1uS_reg_n_0_[15]\
    );
\cnt_1uS_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(16),
      Q => \cnt_1uS_reg_n_0_[16]\
    );
\cnt_1uS_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(17),
      Q => \cnt_1uS_reg_n_0_[17]\
    );
\cnt_1uS_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(18),
      Q => \cnt_1uS_reg_n_0_[18]\
    );
\cnt_1uS_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(19),
      Q => \cnt_1uS_reg_n_0_[19]\
    );
\cnt_1uS_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(1),
      Q => \cnt_1uS_reg_n_0_[1]\
    );
\cnt_1uS_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(20),
      Q => \cnt_1uS_reg_n_0_[20]\
    );
\cnt_1uS_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(21),
      Q => \cnt_1uS_reg_n_0_[21]\
    );
\cnt_1uS_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(22),
      Q => \cnt_1uS_reg_n_0_[22]\
    );
\cnt_1uS_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(23),
      Q => \cnt_1uS_reg_n_0_[23]\
    );
\cnt_1uS_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(24),
      Q => \cnt_1uS_reg_n_0_[24]\
    );
\cnt_1uS_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(25),
      Q => \cnt_1uS_reg_n_0_[25]\
    );
\cnt_1uS_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(26),
      Q => \cnt_1uS_reg_n_0_[26]\
    );
\cnt_1uS_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(27),
      Q => \cnt_1uS_reg_n_0_[27]\
    );
\cnt_1uS_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(28),
      Q => \cnt_1uS_reg_n_0_[28]\
    );
\cnt_1uS_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(29),
      Q => \cnt_1uS_reg_n_0_[29]\
    );
\cnt_1uS_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(2),
      Q => \cnt_1uS_reg_n_0_[2]\
    );
\cnt_1uS_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(30),
      Q => \cnt_1uS_reg_n_0_[30]\
    );
\cnt_1uS_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(31),
      Q => \cnt_1uS_reg_n_0_[31]\
    );
\cnt_1uS_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(3),
      Q => \cnt_1uS_reg_n_0_[3]\
    );
\cnt_1uS_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(4),
      Q => \cnt_1uS_reg_n_0_[4]\
    );
\cnt_1uS_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(5),
      Q => \cnt_1uS_reg_n_0_[5]\
    );
\cnt_1uS_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(6),
      Q => \cnt_1uS_reg_n_0_[6]\
    );
\cnt_1uS_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(7),
      Q => \cnt_1uS_reg_n_0_[7]\
    );
\cnt_1uS_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(8),
      Q => \cnt_1uS_reg_n_0_[8]\
    );
\cnt_1uS_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => cnt_1uS(9),
      Q => \cnt_1uS_reg_n_0_[9]\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(14),
      I1 => cnt_1mS_reg(14),
      I2 => cnt_1mS_reg(15),
      I3 => cnt_1S_reg(15),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(12),
      I1 => cnt_1mS_reg(12),
      I2 => cnt_1mS_reg(13),
      I3 => cnt_1S_reg(13),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(10),
      I1 => cnt_1mS_reg(10),
      I2 => cnt_1mS_reg(11),
      I3 => cnt_1S_reg(11),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(8),
      I1 => cnt_1mS_reg(8),
      I2 => cnt_1mS_reg(9),
      I3 => cnt_1S_reg(9),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(14),
      I1 => cnt_1S_reg(14),
      I2 => cnt_1mS_reg(15),
      I3 => cnt_1S_reg(15),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(12),
      I1 => cnt_1S_reg(12),
      I2 => cnt_1mS_reg(13),
      I3 => cnt_1S_reg(13),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(10),
      I1 => cnt_1S_reg(10),
      I2 => cnt_1mS_reg(11),
      I3 => cnt_1S_reg(11),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(8),
      I1 => cnt_1S_reg(8),
      I2 => cnt_1mS_reg(9),
      I3 => cnt_1S_reg(9),
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(22),
      I1 => cnt_1mS_reg(22),
      I2 => cnt_1mS_reg(23),
      I3 => cnt_1S_reg(23),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(20),
      I1 => cnt_1mS_reg(20),
      I2 => cnt_1mS_reg(21),
      I3 => cnt_1S_reg(21),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(18),
      I1 => cnt_1mS_reg(18),
      I2 => cnt_1mS_reg(19),
      I3 => cnt_1S_reg(19),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(16),
      I1 => cnt_1mS_reg(16),
      I2 => cnt_1mS_reg(17),
      I3 => cnt_1S_reg(17),
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(22),
      I1 => cnt_1S_reg(22),
      I2 => cnt_1mS_reg(23),
      I3 => cnt_1S_reg(23),
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(20),
      I1 => cnt_1S_reg(20),
      I2 => cnt_1mS_reg(21),
      I3 => cnt_1S_reg(21),
      O => \i__carry__1_i_6_n_0\
    );
\i__carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(18),
      I1 => cnt_1S_reg(18),
      I2 => cnt_1mS_reg(19),
      I3 => cnt_1S_reg(19),
      O => \i__carry__1_i_7_n_0\
    );
\i__carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(16),
      I1 => cnt_1S_reg(16),
      I2 => cnt_1mS_reg(17),
      I3 => cnt_1S_reg(17),
      O => \i__carry__1_i_8_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(30),
      I1 => cnt_1mS_reg(30),
      I2 => cnt_1mS_reg(31),
      I3 => cnt_1S_reg(31),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(28),
      I1 => cnt_1mS_reg(28),
      I2 => cnt_1mS_reg(29),
      I3 => cnt_1S_reg(29),
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(26),
      I1 => cnt_1mS_reg(26),
      I2 => cnt_1mS_reg(27),
      I3 => cnt_1S_reg(27),
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(24),
      I1 => cnt_1mS_reg(24),
      I2 => cnt_1mS_reg(25),
      I3 => cnt_1S_reg(25),
      O => \i__carry__2_i_4_n_0\
    );
\i__carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(30),
      I1 => cnt_1S_reg(30),
      I2 => cnt_1mS_reg(31),
      I3 => cnt_1S_reg(31),
      O => \i__carry__2_i_5_n_0\
    );
\i__carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(28),
      I1 => cnt_1S_reg(28),
      I2 => cnt_1mS_reg(29),
      I3 => cnt_1S_reg(29),
      O => \i__carry__2_i_6_n_0\
    );
\i__carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(26),
      I1 => cnt_1S_reg(26),
      I2 => cnt_1mS_reg(27),
      I3 => cnt_1S_reg(27),
      O => \i__carry__2_i_7_n_0\
    );
\i__carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(24),
      I1 => cnt_1S_reg(24),
      I2 => cnt_1mS_reg(25),
      I3 => cnt_1S_reg(25),
      O => \i__carry__2_i_8_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(6),
      I1 => cnt_1mS_reg(6),
      I2 => cnt_1mS_reg(7),
      I3 => cnt_1S_reg(7),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(4),
      I1 => cnt_1mS_reg(4),
      I2 => cnt_1mS_reg(5),
      I3 => cnt_1S_reg(5),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(2),
      I1 => cnt_1mS_reg(2),
      I2 => cnt_1mS_reg(3),
      I3 => cnt_1S_reg(3),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1S_reg(0),
      I1 => cnt_1mS_reg(0),
      I2 => cnt_1mS_reg(1),
      I3 => cnt_1S_reg(1),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(6),
      I1 => cnt_1S_reg(6),
      I2 => cnt_1mS_reg(7),
      I3 => cnt_1S_reg(7),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(4),
      I1 => cnt_1S_reg(4),
      I2 => cnt_1mS_reg(5),
      I3 => cnt_1S_reg(5),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(2),
      I1 => cnt_1S_reg(2),
      I2 => cnt_1mS_reg(3),
      I3 => cnt_1S_reg(3),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(0),
      I1 => cnt_1S_reg(0),
      I2 => cnt_1mS_reg(1),
      I3 => cnt_1S_reg(1),
      O => \i__carry_i_8_n_0\
    );
oLED_r2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oLED_r2_carry_n_0,
      CO(2) => oLED_r2_carry_n_1,
      CO(1) => oLED_r2_carry_n_2,
      CO(0) => oLED_r2_carry_n_3,
      CYINIT => '0',
      DI(3) => oLED_r2_carry_i_1_n_0,
      DI(2) => oLED_r2_carry_i_2_n_0,
      DI(1) => oLED_r2_carry_i_3_n_0,
      DI(0) => oLED_r2_carry_i_4_n_0,
      O(3 downto 0) => NLW_oLED_r2_carry_O_UNCONNECTED(3 downto 0),
      S(3) => oLED_r2_carry_i_5_n_0,
      S(2) => oLED_r2_carry_i_6_n_0,
      S(1) => oLED_r2_carry_i_7_n_0,
      S(0) => oLED_r2_carry_i_8_n_0
    );
\oLED_r2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => oLED_r2_carry_n_0,
      CO(3) => \oLED_r2_carry__0_n_0\,
      CO(2) => \oLED_r2_carry__0_n_1\,
      CO(1) => \oLED_r2_carry__0_n_2\,
      CO(0) => \oLED_r2_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \oLED_r2_carry__0_i_1_n_0\,
      DI(2) => \oLED_r2_carry__0_i_2_n_0\,
      DI(1) => \oLED_r2_carry__0_i_3_n_0\,
      DI(0) => \oLED_r2_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \oLED_r2_carry__0_i_5_n_0\,
      S(2) => \oLED_r2_carry__0_i_6_n_0\,
      S(1) => \oLED_r2_carry__0_i_7_n_0\,
      S(0) => \oLED_r2_carry__0_i_8_n_0\
    );
\oLED_r2_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(14),
      I1 => cnt_1S_reg(14),
      I2 => cnt_1S_reg(15),
      I3 => cnt_1mS_reg(15),
      O => \oLED_r2_carry__0_i_1_n_0\
    );
\oLED_r2_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(12),
      I1 => cnt_1S_reg(12),
      I2 => cnt_1S_reg(13),
      I3 => cnt_1mS_reg(13),
      O => \oLED_r2_carry__0_i_2_n_0\
    );
\oLED_r2_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(10),
      I1 => cnt_1S_reg(10),
      I2 => cnt_1S_reg(11),
      I3 => cnt_1mS_reg(11),
      O => \oLED_r2_carry__0_i_3_n_0\
    );
\oLED_r2_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(8),
      I1 => cnt_1S_reg(8),
      I2 => cnt_1S_reg(9),
      I3 => cnt_1mS_reg(9),
      O => \oLED_r2_carry__0_i_4_n_0\
    );
\oLED_r2_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(14),
      I1 => cnt_1S_reg(14),
      I2 => cnt_1mS_reg(15),
      I3 => cnt_1S_reg(15),
      O => \oLED_r2_carry__0_i_5_n_0\
    );
\oLED_r2_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(12),
      I1 => cnt_1S_reg(12),
      I2 => cnt_1mS_reg(13),
      I3 => cnt_1S_reg(13),
      O => \oLED_r2_carry__0_i_6_n_0\
    );
\oLED_r2_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(10),
      I1 => cnt_1S_reg(10),
      I2 => cnt_1mS_reg(11),
      I3 => cnt_1S_reg(11),
      O => \oLED_r2_carry__0_i_7_n_0\
    );
\oLED_r2_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(8),
      I1 => cnt_1S_reg(8),
      I2 => cnt_1mS_reg(9),
      I3 => cnt_1S_reg(9),
      O => \oLED_r2_carry__0_i_8_n_0\
    );
\oLED_r2_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \oLED_r2_carry__0_n_0\,
      CO(3) => \oLED_r2_carry__1_n_0\,
      CO(2) => \oLED_r2_carry__1_n_1\,
      CO(1) => \oLED_r2_carry__1_n_2\,
      CO(0) => \oLED_r2_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \oLED_r2_carry__1_i_1_n_0\,
      DI(2) => \oLED_r2_carry__1_i_2_n_0\,
      DI(1) => \oLED_r2_carry__1_i_3_n_0\,
      DI(0) => \oLED_r2_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \oLED_r2_carry__1_i_5_n_0\,
      S(2) => \oLED_r2_carry__1_i_6_n_0\,
      S(1) => \oLED_r2_carry__1_i_7_n_0\,
      S(0) => \oLED_r2_carry__1_i_8_n_0\
    );
\oLED_r2_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(22),
      I1 => cnt_1S_reg(22),
      I2 => cnt_1S_reg(23),
      I3 => cnt_1mS_reg(23),
      O => \oLED_r2_carry__1_i_1_n_0\
    );
\oLED_r2_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(20),
      I1 => cnt_1S_reg(20),
      I2 => cnt_1S_reg(21),
      I3 => cnt_1mS_reg(21),
      O => \oLED_r2_carry__1_i_2_n_0\
    );
\oLED_r2_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(18),
      I1 => cnt_1S_reg(18),
      I2 => cnt_1S_reg(19),
      I3 => cnt_1mS_reg(19),
      O => \oLED_r2_carry__1_i_3_n_0\
    );
\oLED_r2_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(16),
      I1 => cnt_1S_reg(16),
      I2 => cnt_1S_reg(17),
      I3 => cnt_1mS_reg(17),
      O => \oLED_r2_carry__1_i_4_n_0\
    );
\oLED_r2_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(22),
      I1 => cnt_1S_reg(22),
      I2 => cnt_1mS_reg(23),
      I3 => cnt_1S_reg(23),
      O => \oLED_r2_carry__1_i_5_n_0\
    );
\oLED_r2_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(20),
      I1 => cnt_1S_reg(20),
      I2 => cnt_1mS_reg(21),
      I3 => cnt_1S_reg(21),
      O => \oLED_r2_carry__1_i_6_n_0\
    );
\oLED_r2_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(18),
      I1 => cnt_1S_reg(18),
      I2 => cnt_1mS_reg(19),
      I3 => cnt_1S_reg(19),
      O => \oLED_r2_carry__1_i_7_n_0\
    );
\oLED_r2_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(16),
      I1 => cnt_1S_reg(16),
      I2 => cnt_1mS_reg(17),
      I3 => cnt_1S_reg(17),
      O => \oLED_r2_carry__1_i_8_n_0\
    );
\oLED_r2_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \oLED_r2_carry__1_n_0\,
      CO(3) => oLED_r2,
      CO(2) => \oLED_r2_carry__2_n_1\,
      CO(1) => \oLED_r2_carry__2_n_2\,
      CO(0) => \oLED_r2_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \oLED_r2_carry__2_i_1_n_0\,
      DI(2) => \oLED_r2_carry__2_i_2_n_0\,
      DI(1) => \oLED_r2_carry__2_i_3_n_0\,
      DI(0) => \oLED_r2_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \oLED_r2_carry__2_i_5_n_0\,
      S(2) => \oLED_r2_carry__2_i_6_n_0\,
      S(1) => \oLED_r2_carry__2_i_7_n_0\,
      S(0) => \oLED_r2_carry__2_i_8_n_0\
    );
\oLED_r2_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(30),
      I1 => cnt_1S_reg(30),
      I2 => cnt_1S_reg(31),
      I3 => cnt_1mS_reg(31),
      O => \oLED_r2_carry__2_i_1_n_0\
    );
\oLED_r2_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(28),
      I1 => cnt_1S_reg(28),
      I2 => cnt_1S_reg(29),
      I3 => cnt_1mS_reg(29),
      O => \oLED_r2_carry__2_i_2_n_0\
    );
\oLED_r2_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(26),
      I1 => cnt_1S_reg(26),
      I2 => cnt_1S_reg(27),
      I3 => cnt_1mS_reg(27),
      O => \oLED_r2_carry__2_i_3_n_0\
    );
\oLED_r2_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(24),
      I1 => cnt_1S_reg(24),
      I2 => cnt_1S_reg(25),
      I3 => cnt_1mS_reg(25),
      O => \oLED_r2_carry__2_i_4_n_0\
    );
\oLED_r2_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(30),
      I1 => cnt_1S_reg(30),
      I2 => cnt_1mS_reg(31),
      I3 => cnt_1S_reg(31),
      O => \oLED_r2_carry__2_i_5_n_0\
    );
\oLED_r2_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(28),
      I1 => cnt_1S_reg(28),
      I2 => cnt_1mS_reg(29),
      I3 => cnt_1S_reg(29),
      O => \oLED_r2_carry__2_i_6_n_0\
    );
\oLED_r2_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(26),
      I1 => cnt_1S_reg(26),
      I2 => cnt_1mS_reg(27),
      I3 => cnt_1S_reg(27),
      O => \oLED_r2_carry__2_i_7_n_0\
    );
\oLED_r2_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(24),
      I1 => cnt_1S_reg(24),
      I2 => cnt_1mS_reg(25),
      I3 => cnt_1S_reg(25),
      O => \oLED_r2_carry__2_i_8_n_0\
    );
oLED_r2_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(6),
      I1 => cnt_1S_reg(6),
      I2 => cnt_1S_reg(7),
      I3 => cnt_1mS_reg(7),
      O => oLED_r2_carry_i_1_n_0
    );
oLED_r2_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(4),
      I1 => cnt_1S_reg(4),
      I2 => cnt_1S_reg(5),
      I3 => cnt_1mS_reg(5),
      O => oLED_r2_carry_i_2_n_0
    );
oLED_r2_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(2),
      I1 => cnt_1S_reg(2),
      I2 => cnt_1S_reg(3),
      I3 => cnt_1mS_reg(3),
      O => oLED_r2_carry_i_3_n_0
    );
oLED_r2_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => cnt_1mS_reg(0),
      I1 => cnt_1S_reg(0),
      I2 => cnt_1S_reg(1),
      I3 => cnt_1mS_reg(1),
      O => oLED_r2_carry_i_4_n_0
    );
oLED_r2_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(6),
      I1 => cnt_1S_reg(6),
      I2 => cnt_1mS_reg(7),
      I3 => cnt_1S_reg(7),
      O => oLED_r2_carry_i_5_n_0
    );
oLED_r2_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(4),
      I1 => cnt_1S_reg(4),
      I2 => cnt_1mS_reg(5),
      I3 => cnt_1S_reg(5),
      O => oLED_r2_carry_i_6_n_0
    );
oLED_r2_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(2),
      I1 => cnt_1S_reg(2),
      I2 => cnt_1mS_reg(3),
      I3 => cnt_1S_reg(3),
      O => oLED_r2_carry_i_7_n_0
    );
oLED_r2_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1mS_reg(0),
      I1 => cnt_1S_reg(0),
      I2 => cnt_1mS_reg(1),
      I3 => cnt_1S_reg(1),
      O => oLED_r2_carry_i_8_n_0
    );
\oLED_r2_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \oLED_r2_inferred__0/i__carry_n_0\,
      CO(2) => \oLED_r2_inferred__0/i__carry_n_1\,
      CO(1) => \oLED_r2_inferred__0/i__carry_n_2\,
      CO(0) => \oLED_r2_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\oLED_r2_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \oLED_r2_inferred__0/i__carry_n_0\,
      CO(3) => \oLED_r2_inferred__0/i__carry__0_n_0\,
      CO(2) => \oLED_r2_inferred__0/i__carry__0_n_1\,
      CO(1) => \oLED_r2_inferred__0/i__carry__0_n_2\,
      CO(0) => \oLED_r2_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__0_i_1_n_0\,
      DI(2) => \i__carry__0_i_2_n_0\,
      DI(1) => \i__carry__0_i_3_n_0\,
      DI(0) => \i__carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\oLED_r2_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \oLED_r2_inferred__0/i__carry__0_n_0\,
      CO(3) => \oLED_r2_inferred__0/i__carry__1_n_0\,
      CO(2) => \oLED_r2_inferred__0/i__carry__1_n_1\,
      CO(1) => \oLED_r2_inferred__0/i__carry__1_n_2\,
      CO(0) => \oLED_r2_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__1_i_1_n_0\,
      DI(2) => \i__carry__1_i_2_n_0\,
      DI(1) => \i__carry__1_i_3_n_0\,
      DI(0) => \i__carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_inferred__0/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__1_i_5_n_0\,
      S(2) => \i__carry__1_i_6_n_0\,
      S(1) => \i__carry__1_i_7_n_0\,
      S(0) => \i__carry__1_i_8_n_0\
    );
\oLED_r2_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \oLED_r2_inferred__0/i__carry__1_n_0\,
      CO(3) => oLED_r20_in,
      CO(2) => \oLED_r2_inferred__0/i__carry__2_n_1\,
      CO(1) => \oLED_r2_inferred__0/i__carry__2_n_2\,
      CO(0) => \oLED_r2_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__2_i_1_n_0\,
      DI(2) => \i__carry__2_i_2_n_0\,
      DI(1) => \i__carry__2_i_3_n_0\,
      DI(0) => \i__carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_oLED_r2_inferred__0/i__carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__2_i_5_n_0\,
      S(2) => \i__carry__2_i_6_n_0\,
      S(1) => \i__carry__2_i_7_n_0\,
      S(0) => \i__carry__2_i_8_n_0\
    );
\oLED_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => oLED_r2,
      I1 => on_off_flag,
      I2 => oLED_r20_in,
      O => \oLED_r[1]_i_1_n_0\
    );
\oLED_r[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => \oLED_r[1]_i_2_n_0\
    );
\oLED_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \oLED_r[1]_i_2_n_0\,
      D => \oLED_r[1]_i_1_n_0\,
      Q => oLED(0)
    );
on_off_flag_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_1S1,
      I1 => on_off_flag,
      O => on_off_flag_i_1_n_0
    );
on_off_flag_reg: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => on_off_flag_i_1_n_0,
      PRE => \oLED_r[1]_i_2_n_0\,
      Q => on_off_flag
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
    oLED : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZPhotonDetector_Block_ZLed_Indicator_0_0,ZLed_Indicator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZLed_Indicator,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^oled\ : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  oLED(1) <= \^oled\(0);
  oLED(0) <= \^oled\(0);
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZLed_Indicator
     port map (
      iClk => iClk,
      iRst_N => iRst_N,
      oLED(0) => \^oled\(0)
    );
end STRUCTURE;
