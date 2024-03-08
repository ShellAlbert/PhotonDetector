-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Oct 26 10:54:51 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZUART_Data_Dump_0_0/ZPhotonDetector_Block_ZUART_Data_Dump_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZUART_Data_Dump_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_BPS_Generator is
  port (
    iRst_N_0 : out STD_LOGIC;
    \cnt_bps_reg[28]_0\ : out STD_LOGIC;
    \cnt_bps_reg[5]_0\ : out STD_LOGIC;
    \cnt_bps_reg[1]_0\ : out STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iClk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_BPS_Generator : entity is "ZUART_Module_BPS_Generator";
end ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_BPS_Generator;

architecture STRUCTURE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_BPS_Generator is
  signal cnt_bps : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cnt_bps0_carry__0_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__0_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__1_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__2_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__3_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__4_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_0\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_1\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_4\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__5_n_7\ : STD_LOGIC;
  signal \cnt_bps0_carry__6_n_2\ : STD_LOGIC;
  signal \cnt_bps0_carry__6_n_3\ : STD_LOGIC;
  signal \cnt_bps0_carry__6_n_5\ : STD_LOGIC;
  signal \cnt_bps0_carry__6_n_6\ : STD_LOGIC;
  signal \cnt_bps0_carry__6_n_7\ : STD_LOGIC;
  signal cnt_bps0_carry_n_0 : STD_LOGIC;
  signal cnt_bps0_carry_n_1 : STD_LOGIC;
  signal cnt_bps0_carry_n_2 : STD_LOGIC;
  signal cnt_bps0_carry_n_3 : STD_LOGIC;
  signal cnt_bps0_carry_n_4 : STD_LOGIC;
  signal cnt_bps0_carry_n_5 : STD_LOGIC;
  signal cnt_bps0_carry_n_6 : STD_LOGIC;
  signal cnt_bps0_carry_n_7 : STD_LOGIC;
  signal \cnt_bps[31]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_bps[31]_i_3_n_0\ : STD_LOGIC;
  signal cnt_bps_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^cnt_bps_reg[28]_0\ : STD_LOGIC;
  signal \^irst_n_0\ : STD_LOGIC;
  signal rtx_pin_i_12_n_0 : STD_LOGIC;
  signal rtx_pin_i_13_n_0 : STD_LOGIC;
  signal rtx_pin_i_14_n_0 : STD_LOGIC;
  signal rtx_pin_i_15_n_0 : STD_LOGIC;
  signal rtx_pin_i_16_n_0 : STD_LOGIC;
  signal \NLW_cnt_bps0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_bps0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of cnt_bps0_carry : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_bps0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_bps[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_bps[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt_bps[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt_bps[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt_bps[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt_bps[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt_bps[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt_bps[16]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt_bps[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt_bps[18]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt_bps[19]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt_bps[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_bps[20]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt_bps[21]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt_bps[22]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_bps[23]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_bps[24]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt_bps[25]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt_bps[26]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cnt_bps[27]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cnt_bps[28]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \cnt_bps[29]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \cnt_bps[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_bps[30]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_bps[31]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_bps[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_bps[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt_bps[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt_bps[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_bps[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_bps[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt_bps[9]_i_1\ : label is "soft_lutpair4";
begin
  \cnt_bps_reg[28]_0\ <= \^cnt_bps_reg[28]_0\;
  iRst_N_0 <= \^irst_n_0\;
cnt_bps0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => cnt_bps0_carry_n_0,
      CO(2) => cnt_bps0_carry_n_1,
      CO(1) => cnt_bps0_carry_n_2,
      CO(0) => cnt_bps0_carry_n_3,
      CYINIT => cnt_bps(0),
      DI(3 downto 0) => B"0000",
      O(3) => cnt_bps0_carry_n_4,
      O(2) => cnt_bps0_carry_n_5,
      O(1) => cnt_bps0_carry_n_6,
      O(0) => cnt_bps0_carry_n_7,
      S(3 downto 0) => cnt_bps(4 downto 1)
    );
\cnt_bps0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => cnt_bps0_carry_n_0,
      CO(3) => \cnt_bps0_carry__0_n_0\,
      CO(2) => \cnt_bps0_carry__0_n_1\,
      CO(1) => \cnt_bps0_carry__0_n_2\,
      CO(0) => \cnt_bps0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__0_n_4\,
      O(2) => \cnt_bps0_carry__0_n_5\,
      O(1) => \cnt_bps0_carry__0_n_6\,
      O(0) => \cnt_bps0_carry__0_n_7\,
      S(3 downto 0) => cnt_bps(8 downto 5)
    );
\cnt_bps0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__0_n_0\,
      CO(3) => \cnt_bps0_carry__1_n_0\,
      CO(2) => \cnt_bps0_carry__1_n_1\,
      CO(1) => \cnt_bps0_carry__1_n_2\,
      CO(0) => \cnt_bps0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__1_n_4\,
      O(2) => \cnt_bps0_carry__1_n_5\,
      O(1) => \cnt_bps0_carry__1_n_6\,
      O(0) => \cnt_bps0_carry__1_n_7\,
      S(3 downto 0) => cnt_bps(12 downto 9)
    );
\cnt_bps0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__1_n_0\,
      CO(3) => \cnt_bps0_carry__2_n_0\,
      CO(2) => \cnt_bps0_carry__2_n_1\,
      CO(1) => \cnt_bps0_carry__2_n_2\,
      CO(0) => \cnt_bps0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__2_n_4\,
      O(2) => \cnt_bps0_carry__2_n_5\,
      O(1) => \cnt_bps0_carry__2_n_6\,
      O(0) => \cnt_bps0_carry__2_n_7\,
      S(3 downto 0) => cnt_bps(16 downto 13)
    );
\cnt_bps0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__2_n_0\,
      CO(3) => \cnt_bps0_carry__3_n_0\,
      CO(2) => \cnt_bps0_carry__3_n_1\,
      CO(1) => \cnt_bps0_carry__3_n_2\,
      CO(0) => \cnt_bps0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__3_n_4\,
      O(2) => \cnt_bps0_carry__3_n_5\,
      O(1) => \cnt_bps0_carry__3_n_6\,
      O(0) => \cnt_bps0_carry__3_n_7\,
      S(3 downto 0) => cnt_bps(20 downto 17)
    );
\cnt_bps0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__3_n_0\,
      CO(3) => \cnt_bps0_carry__4_n_0\,
      CO(2) => \cnt_bps0_carry__4_n_1\,
      CO(1) => \cnt_bps0_carry__4_n_2\,
      CO(0) => \cnt_bps0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__4_n_4\,
      O(2) => \cnt_bps0_carry__4_n_5\,
      O(1) => \cnt_bps0_carry__4_n_6\,
      O(0) => \cnt_bps0_carry__4_n_7\,
      S(3 downto 0) => cnt_bps(24 downto 21)
    );
\cnt_bps0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__4_n_0\,
      CO(3) => \cnt_bps0_carry__5_n_0\,
      CO(2) => \cnt_bps0_carry__5_n_1\,
      CO(1) => \cnt_bps0_carry__5_n_2\,
      CO(0) => \cnt_bps0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_bps0_carry__5_n_4\,
      O(2) => \cnt_bps0_carry__5_n_5\,
      O(1) => \cnt_bps0_carry__5_n_6\,
      O(0) => \cnt_bps0_carry__5_n_7\,
      S(3 downto 0) => cnt_bps(28 downto 25)
    );
\cnt_bps0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_bps0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_cnt_bps0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_bps0_carry__6_n_2\,
      CO(0) => \cnt_bps0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_cnt_bps0_carry__6_O_UNCONNECTED\(3),
      O(2) => \cnt_bps0_carry__6_n_5\,
      O(1) => \cnt_bps0_carry__6_n_6\,
      O(0) => \cnt_bps0_carry__6_n_7\,
      S(3) => '0',
      S(2 downto 0) => cnt_bps(31 downto 29)
    );
\cnt_bps[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_bps(0),
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(0)
    );
\cnt_bps[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__1_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(10)
    );
\cnt_bps[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__1_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(11)
    );
\cnt_bps[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__1_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(12)
    );
\cnt_bps[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__2_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(13)
    );
\cnt_bps[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__2_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(14)
    );
\cnt_bps[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__2_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(15)
    );
\cnt_bps[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__2_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(16)
    );
\cnt_bps[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__3_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(17)
    );
\cnt_bps[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__3_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(18)
    );
\cnt_bps[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__3_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(19)
    );
\cnt_bps[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_bps0_carry_n_7,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(1)
    );
\cnt_bps[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__3_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(20)
    );
\cnt_bps[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__4_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(21)
    );
\cnt_bps[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__4_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(22)
    );
\cnt_bps[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__4_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(23)
    );
\cnt_bps[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__4_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(24)
    );
\cnt_bps[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__5_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(25)
    );
\cnt_bps[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__5_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(26)
    );
\cnt_bps[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__5_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(27)
    );
\cnt_bps[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__5_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(28)
    );
\cnt_bps[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__6_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(29)
    );
\cnt_bps[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_bps0_carry_n_6,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(2)
    );
\cnt_bps[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__6_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(30)
    );
\cnt_bps[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__6_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(31)
    );
\cnt_bps[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => \^cnt_bps_reg[28]_0\,
      I1 => rtx_pin_i_12_n_0,
      I2 => cnt_bps(1),
      I3 => cnt_bps(5),
      I4 => cnt_bps(2),
      I5 => \cnt_bps[31]_i_3_n_0\,
      O => \cnt_bps[31]_i_2_n_0\
    );
\cnt_bps[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFDFF"
    )
        port map (
      I0 => cnt_bps(4),
      I1 => cnt_bps(31),
      I2 => cnt_bps(6),
      I3 => cnt_bps(8),
      I4 => cnt_bps(0),
      I5 => cnt_bps(3),
      O => \cnt_bps[31]_i_3_n_0\
    );
\cnt_bps[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_bps0_carry_n_5,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(3)
    );
\cnt_bps[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_bps0_carry_n_4,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(4)
    );
\cnt_bps[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__0_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(5)
    );
\cnt_bps[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__0_n_6\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(6)
    );
\cnt_bps[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__0_n_5\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(7)
    );
\cnt_bps[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__0_n_4\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(8)
    );
\cnt_bps[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cnt_bps0_carry__1_n_7\,
      I1 => \cnt_bps[31]_i_2_n_0\,
      O => cnt_bps_0(9)
    );
\cnt_bps_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(0),
      Q => cnt_bps(0)
    );
\cnt_bps_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(10),
      Q => cnt_bps(10)
    );
\cnt_bps_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(11),
      Q => cnt_bps(11)
    );
\cnt_bps_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(12),
      Q => cnt_bps(12)
    );
\cnt_bps_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(13),
      Q => cnt_bps(13)
    );
\cnt_bps_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(14),
      Q => cnt_bps(14)
    );
\cnt_bps_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(15),
      Q => cnt_bps(15)
    );
\cnt_bps_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(16),
      Q => cnt_bps(16)
    );
\cnt_bps_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(17),
      Q => cnt_bps(17)
    );
\cnt_bps_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(18),
      Q => cnt_bps(18)
    );
\cnt_bps_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(19),
      Q => cnt_bps(19)
    );
\cnt_bps_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(1),
      Q => cnt_bps(1)
    );
\cnt_bps_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(20),
      Q => cnt_bps(20)
    );
\cnt_bps_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(21),
      Q => cnt_bps(21)
    );
\cnt_bps_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(22),
      Q => cnt_bps(22)
    );
\cnt_bps_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(23),
      Q => cnt_bps(23)
    );
\cnt_bps_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(24),
      Q => cnt_bps(24)
    );
\cnt_bps_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(25),
      Q => cnt_bps(25)
    );
\cnt_bps_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(26),
      Q => cnt_bps(26)
    );
\cnt_bps_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(27),
      Q => cnt_bps(27)
    );
\cnt_bps_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(28),
      Q => cnt_bps(28)
    );
\cnt_bps_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(29),
      Q => cnt_bps(29)
    );
\cnt_bps_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(2),
      Q => cnt_bps(2)
    );
\cnt_bps_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(30),
      Q => cnt_bps(30)
    );
\cnt_bps_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(31),
      Q => cnt_bps(31)
    );
\cnt_bps_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(3),
      Q => cnt_bps(3)
    );
\cnt_bps_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(4),
      Q => cnt_bps(4)
    );
\cnt_bps_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(5),
      Q => cnt_bps(5)
    );
\cnt_bps_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(6),
      Q => cnt_bps(6)
    );
\cnt_bps_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(7),
      Q => cnt_bps(7)
    );
\cnt_bps_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(8),
      Q => cnt_bps(8)
    );
\cnt_bps_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \^irst_n_0\,
      D => cnt_bps_0(9),
      Q => cnt_bps(9)
    );
rtx_pin_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_bps(17),
      I1 => cnt_bps(16),
      I2 => cnt_bps(30),
      I3 => cnt_bps(15),
      O => rtx_pin_i_12_n_0
    );
rtx_pin_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020000000000"
    )
        port map (
      I0 => cnt_bps(4),
      I1 => cnt_bps(31),
      I2 => cnt_bps(8),
      I3 => cnt_bps(0),
      I4 => cnt_bps(2),
      I5 => cnt_bps(3),
      O => rtx_pin_i_13_n_0
    );
rtx_pin_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => cnt_bps(12),
      I1 => cnt_bps(14),
      I2 => cnt_bps(13),
      I3 => cnt_bps(19),
      I4 => cnt_bps(20),
      I5 => cnt_bps(18),
      O => rtx_pin_i_14_n_0
    );
rtx_pin_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => cnt_bps(21),
      I1 => cnt_bps(11),
      I2 => cnt_bps(10),
      I3 => cnt_bps(23),
      I4 => cnt_bps(9),
      I5 => cnt_bps(22),
      O => rtx_pin_i_15_n_0
    );
rtx_pin_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => cnt_bps(24),
      I1 => cnt_bps(29),
      I2 => cnt_bps(7),
      I3 => cnt_bps(26),
      O => rtx_pin_i_16_n_0
    );
rtx_pin_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => \^irst_n_0\
    );
rtx_pin_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => rtx_pin_i_12_n_0,
      I1 => cnt_bps(5),
      I2 => cnt_bps(6),
      I3 => cnt_bps(1),
      I4 => rtx_pin_i_13_n_0,
      I5 => \^cnt_bps_reg[28]_0\,
      O => \cnt_bps_reg[5]_0\
    );
rtx_pin_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => rtx_pin_i_14_n_0,
      I1 => rtx_pin_i_15_n_0,
      I2 => cnt_bps(28),
      I3 => cnt_bps(27),
      I4 => cnt_bps(25),
      I5 => rtx_pin_i_16_n_0,
      O => \^cnt_bps_reg[28]_0\
    );
rtx_pin_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => rtx_pin_i_13_n_0,
      I1 => cnt_bps(1),
      I2 => cnt_bps(6),
      I3 => cnt_bps(5),
      I4 => rtx_pin_i_12_n_0,
      O => \cnt_bps_reg[1]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_TX is
  port (
    oTxd_Pin : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rdone_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    iEn_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_i_reg[3]\ : out STD_LOGIC;
    \FSM_sequential_i_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    rdone_reg_1 : out STD_LOGIC;
    iClk : in STD_LOGIC;
    \i_reg[3]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    iEn : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    \locked_pulse_counter_reg[0]\ : in STD_LOGIC;
    rdone_reg_2 : in STD_LOGIC;
    \i_reg[2]_0\ : in STD_LOGIC;
    uart_en_reg : in STD_LOGIC;
    rtx_pin_reg_0 : in STD_LOGIC;
    rtx_pin_reg_1 : in STD_LOGIC;
    rtx_pin_i_11_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_TX : entity is "ZUART_Module_TX";
end ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_TX;

architecture STRUCTURE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_TX is
  signal i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^otxd_pin\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rdone_i_1_n_0 : STD_LOGIC;
  signal rdone_i_2_n_0 : STD_LOGIC;
  signal rtx_pin_i_10_n_0 : STD_LOGIC;
  signal rtx_pin_i_11_n_0 : STD_LOGIC;
  signal rtx_pin_i_17_n_0 : STD_LOGIC;
  signal rtx_pin_i_18_n_0 : STD_LOGIC;
  signal rtx_pin_i_1_n_0 : STD_LOGIC;
  signal rtx_pin_i_3_n_0 : STD_LOGIC;
  signal rtx_pin_i_4_n_0 : STD_LOGIC;
  signal rtx_pin_i_6_n_0 : STD_LOGIC;
  signal rtx_pin_i_9_n_0 : STD_LOGIC;
  signal tx_done : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_i[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_sequential_i[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_sequential_i[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \FSM_sequential_i[3]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \i[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \i[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \i[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \i[3]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of rdone_i_2 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of rtx_pin_i_4 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of rtx_pin_i_6 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of rtx_pin_i_9 : label is "soft_lutpair21";
begin
  oTxd_Pin <= \^otxd_pin\;
\FSM_sequential_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45555555"
    )
        port map (
      I0 => Q(0),
      I1 => tx_done,
      I2 => Q(1),
      I3 => Q(3),
      I4 => Q(2),
      O => D(0)
    );
\FSM_sequential_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4A5A5A5A"
    )
        port map (
      I0 => Q(0),
      I1 => tx_done,
      I2 => Q(1),
      I3 => Q(3),
      I4 => Q(2),
      O => D(1)
    );
\FSM_sequential_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A6A626A"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(3),
      I4 => tx_done,
      O => D(2)
    );
\FSM_sequential_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8888888"
    )
        port map (
      I0 => iEn,
      I1 => tx_done,
      I2 => Q(0),
      I3 => Q(2),
      I4 => Q(3),
      O => iEn_0(0)
    );
\FSM_sequential_i[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7388FF00"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => tx_done,
      I3 => Q(3),
      I4 => Q(2),
      O => D(3)
    );
\i[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0070"
    )
        port map (
      I0 => i(2),
      I1 => i(3),
      I2 => \i_reg[2]_0\,
      I3 => i(0),
      O => p_1_in(0)
    );
\i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00282828"
    )
        port map (
      I0 => \i_reg[2]_0\,
      I1 => i(1),
      I2 => i(0),
      I3 => i(2),
      I4 => i(3),
      O => p_1_in(1)
    );
\i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80802A80"
    )
        port map (
      I0 => \i_reg[2]_0\,
      I1 => i(1),
      I2 => i(0),
      I3 => i(2),
      I4 => i(3),
      O => p_1_in(2)
    );
\i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FFFFFFF1F0F0F0F"
    )
        port map (
      I0 => i(0),
      I1 => i(1),
      I2 => \i_reg[2]_0\,
      I3 => i(2),
      I4 => i(3),
      I5 => rdone_reg_2,
      O => p_0_in
    );
\i[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA8000"
    )
        port map (
      I0 => \i_reg[2]_0\,
      I1 => i(0),
      I2 => i(1),
      I3 => i(2),
      I4 => i(3),
      O => p_1_in(3)
    );
\i_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => p_0_in,
      CLR => \i_reg[3]_0\,
      D => p_1_in(0),
      Q => i(0)
    );
\i_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => p_0_in,
      CLR => \i_reg[3]_0\,
      D => p_1_in(1),
      Q => i(1)
    );
\i_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => p_0_in,
      CLR => \i_reg[3]_0\,
      D => p_1_in(2),
      Q => i(2)
    );
\i_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => p_0_in,
      CLR => \i_reg[3]_0\,
      D => p_1_in(3),
      Q => i(3)
    );
\locked_pulse_counter[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => tx_done,
      I4 => Q(3),
      I5 => \locked_pulse_counter_reg[0]\,
      O => \FSM_sequential_i_reg[0]\(0)
    );
\phase_diff[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(2),
      I3 => tx_done,
      I4 => iEn,
      I5 => Q(3),
      O => E(0)
    );
rdone_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBFF000010000000"
    )
        port map (
      I0 => rdone_i_2_n_0,
      I1 => i(2),
      I2 => rdone_reg_2,
      I3 => i(3),
      I4 => \i_reg[2]_0\,
      I5 => tx_done,
      O => rdone_i_1_n_0
    );
rdone_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BD"
    )
        port map (
      I0 => i(2),
      I1 => i(0),
      I2 => i(1),
      O => rdone_i_2_n_0
    );
rdone_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => \i_reg[3]_0\,
      D => rdone_i_1_n_0,
      Q => tx_done
    );
rtx_pin_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFAAAA0020AAAA"
    )
        port map (
      I0 => rtx_pin_i_3_n_0,
      I1 => rtx_pin_i_4_n_0,
      I2 => rdone_reg_2,
      I3 => rtx_pin_i_6_n_0,
      I4 => \i_reg[2]_0\,
      I5 => \^otxd_pin\,
      O => rtx_pin_i_1_n_0
    );
rtx_pin_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => i(1),
      I1 => i(0),
      O => rtx_pin_i_10_n_0
    );
rtx_pin_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00FF40FF40FF"
    )
        port map (
      I0 => rtx_pin_i_10_n_0,
      I1 => i(3),
      I2 => rtx_pin_i_17_n_0,
      I3 => \i_reg[2]_0\,
      I4 => rtx_pin_i_18_n_0,
      I5 => i(2),
      O => rtx_pin_i_11_n_0
    );
rtx_pin_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => rtx_pin_i_11_0(2),
      I1 => rtx_pin_i_11_0(1),
      I2 => i(1),
      I3 => rtx_pin_i_11_0(0),
      I4 => i(0),
      I5 => rtx_pin_i_11_0(7),
      O => rtx_pin_i_17_n_0
    );
rtx_pin_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => rtx_pin_i_11_0(6),
      I1 => rtx_pin_i_11_0(5),
      I2 => i(1),
      I3 => rtx_pin_i_11_0(4),
      I4 => i(0),
      I5 => rtx_pin_i_11_0(3),
      O => rtx_pin_i_18_n_0
    );
rtx_pin_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF808F0000"
    )
        port map (
      I0 => rtx_pin_reg_0,
      I1 => rtx_pin_reg_1,
      I2 => i(3),
      I3 => rtx_pin_i_9_n_0,
      I4 => rtx_pin_i_10_n_0,
      I5 => rtx_pin_i_11_n_0,
      O => rtx_pin_i_3_n_0
    );
rtx_pin_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => i(0),
      I1 => i(1),
      I2 => i(3),
      O => rtx_pin_i_4_n_0
    );
rtx_pin_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => i(2),
      I1 => i(3),
      O => rtx_pin_i_6_n_0
    );
rtx_pin_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => rtx_pin_i_17_n_0,
      I1 => i(2),
      I2 => rtx_pin_i_18_n_0,
      O => rtx_pin_i_9_n_0
    );
rtx_pin_reg: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => rtx_pin_i_1_n_0,
      PRE => \i_reg[3]_0\,
      Q => \^otxd_pin\
    );
\time_interval[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => iEn,
      I3 => Q(0),
      I4 => Q(1),
      I5 => tx_done,
      O => \FSM_sequential_i_reg[3]\
    );
\tx_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555000000000000"
    )
        port map (
      I0 => tx_done,
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(3),
      I4 => iRst_N,
      I5 => iEn,
      O => rdone_reg_0(0)
    );
uart_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5FFFFFF15000000"
    )
        port map (
      I0 => tx_done,
      I1 => uart_en_reg,
      I2 => Q(0),
      I3 => iRst_N,
      I4 => iEn,
      I5 => \i_reg[2]_0\,
      O => rdone_reg_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module is
  port (
    iRst_N_0 : out STD_LOGIC;
    oTxd_Pin : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rdone_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    iEn_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_i_reg[3]\ : out STD_LOGIC;
    \FSM_sequential_i_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    rdone_reg_0 : out STD_LOGIC;
    iClk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    iEn : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    \locked_pulse_counter_reg[0]\ : in STD_LOGIC;
    \i_reg[2]\ : in STD_LOGIC;
    uart_en_reg : in STD_LOGIC;
    rtx_pin_i_11 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module : entity is "ZUART_Module";
end ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module;

architecture STRUCTURE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module is
  signal \^irst_n_0\ : STD_LOGIC;
  signal u1_n_1 : STD_LOGIC;
  signal u1_n_2 : STD_LOGIC;
  signal u1_n_3 : STD_LOGIC;
begin
  iRst_N_0 <= \^irst_n_0\;
u1: entity work.ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_BPS_Generator
     port map (
      \cnt_bps_reg[1]_0\ => u1_n_3,
      \cnt_bps_reg[28]_0\ => u1_n_1,
      \cnt_bps_reg[5]_0\ => u1_n_2,
      iClk => iClk,
      iRst_N => iRst_N,
      iRst_N_0 => \^irst_n_0\
    );
u2: entity work.ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module_TX
     port map (
      D(3 downto 0) => D(3 downto 0),
      E(0) => E(0),
      \FSM_sequential_i_reg[0]\(0) => \FSM_sequential_i_reg[0]\(0),
      \FSM_sequential_i_reg[3]\ => \FSM_sequential_i_reg[3]\,
      Q(3 downto 0) => Q(3 downto 0),
      iClk => iClk,
      iEn => iEn,
      iEn_0(0) => iEn_0(0),
      iRst_N => iRst_N,
      \i_reg[2]_0\ => \i_reg[2]\,
      \i_reg[3]_0\ => \^irst_n_0\,
      \locked_pulse_counter_reg[0]\ => \locked_pulse_counter_reg[0]\,
      oTxd_Pin => oTxd_Pin,
      rdone_reg_0(0) => rdone_reg(0),
      rdone_reg_1 => rdone_reg_0,
      rdone_reg_2 => u1_n_2,
      rtx_pin_i_11_0(7 downto 0) => rtx_pin_i_11(7 downto 0),
      rtx_pin_reg_0 => u1_n_1,
      rtx_pin_reg_1 => u1_n_3,
      uart_en_reg => uart_en_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Data_Dump is
  port (
    oDone : out STD_LOGIC;
    oTxd_Pin : out STD_LOGIC;
    iEn : in STD_LOGIC;
    iClk : in STD_LOGIC;
    iNewData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    iTime_Interval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    iNewDataUpdate : in STD_LOGIC;
    iRst_N : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Data_Dump : entity is "ZUART_Data_Dump";
end ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Data_Dump;

architecture STRUCTURE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Data_Dump is
  signal NewDataLocked : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NewDataLocked0 : STD_LOGIC;
  signal check_sum : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \check_sum0__0_carry_i_1_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_i_2_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_i_3_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_i_4_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_i_5_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_i_6_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_0\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_1\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_2\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_3\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_4\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_5\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_6\ : STD_LOGIC;
  signal \check_sum0__0_carry_n_7\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_i_9_n_3\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_1\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_2\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_3\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_4\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_5\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_6\ : STD_LOGIC;
  signal \check_sum0__14_carry__0_n_7\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_10_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_11_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_1_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_2_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_3_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_4_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_5_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_6_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_7_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_8_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_i_9_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_0\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_1\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_2\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_3\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_4\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_5\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_6\ : STD_LOGIC;
  signal \check_sum0__14_carry_n_7\ : STD_LOGIC;
  signal \check_sum[7]_i_1_n_0\ : STD_LOGIC;
  signal \current_gap_no[0]_i_1_n_0\ : STD_LOGIC;
  signal \current_gap_no[1]_i_1_n_0\ : STD_LOGIC;
  signal \current_gap_no[2]_i_1_n_0\ : STD_LOGIC;
  signal \current_gap_no[3]_i_1_n_0\ : STD_LOGIC;
  signal \current_gap_no_reg_n_0_[0]\ : STD_LOGIC;
  signal \current_gap_no_reg_n_0_[1]\ : STD_LOGIC;
  signal \current_gap_no_reg_n_0_[2]\ : STD_LOGIC;
  signal \current_gap_no_reg_n_0_[3]\ : STD_LOGIC;
  signal data0 : STD_LOGIC;
  signal data2 : STD_LOGIC;
  signal data3 : STD_LOGIC;
  signal data4 : STD_LOGIC;
  signal data5 : STD_LOGIC;
  signal data6 : STD_LOGIC;
  signal data7 : STD_LOGIC;
  signal i_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal in5 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal in7 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \locked_pulse_counter[15]_i_2_n_0\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \locked_pulse_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal oDone_i_1_n_0 : STD_LOGIC;
  signal \phase_diff[2]_i_1_n_0\ : STD_LOGIC;
  signal \phase_diff[3]_i_1_n_0\ : STD_LOGIC;
  signal \phase_diff[5]_i_1_n_0\ : STD_LOGIC;
  signal \phase_diff[6]_i_1_n_0\ : STD_LOGIC;
  signal \phase_diff[7]_i_1_n_0\ : STD_LOGIC;
  signal \phase_diff[8]_i_2_n_0\ : STD_LOGIC;
  signal \phase_diff_reg_n_0_[2]\ : STD_LOGIC;
  signal \phase_diff_reg_n_0_[3]\ : STD_LOGIC;
  signal \phase_diff_reg_n_0_[5]\ : STD_LOGIC;
  signal \phase_diff_reg_n_0_[6]\ : STD_LOGIC;
  signal \phase_diff_reg_n_0_[7]\ : STD_LOGIC;
  signal time_interval : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \time_interval[0]_i_1_n_0\ : STD_LOGIC;
  signal \time_interval[1]_i_1_n_0\ : STD_LOGIC;
  signal \time_interval[1]_i_2_n_0\ : STD_LOGIC;
  signal \time_interval[2]_i_1_n_0\ : STD_LOGIC;
  signal \time_interval[2]_i_2_n_0\ : STD_LOGIC;
  signal \time_interval[2]_i_4_n_0\ : STD_LOGIC;
  signal tx_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \tx_data[0]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[0]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data[0]_i_4_n_0\ : STD_LOGIC;
  signal \tx_data[0]_i_5_n_0\ : STD_LOGIC;
  signal \tx_data[1]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[1]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data[1]_i_4_n_0\ : STD_LOGIC;
  signal \tx_data[2]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[2]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data[2]_i_4_n_0\ : STD_LOGIC;
  signal \tx_data[3]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[3]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data[3]_i_4_n_0\ : STD_LOGIC;
  signal \tx_data[4]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[4]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data[5]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[6]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data[7]_i_3_n_0\ : STD_LOGIC;
  signal \tx_data_reg_n_0_[0]\ : STD_LOGIC;
  signal u1_n_0 : STD_LOGIC;
  signal u1_n_10 : STD_LOGIC;
  signal u1_n_11 : STD_LOGIC;
  signal u1_n_2 : STD_LOGIC;
  signal u1_n_7 : STD_LOGIC;
  signal u1_n_8 : STD_LOGIC;
  signal u1_n_9 : STD_LOGIC;
  signal uart_en_i_2_n_0 : STD_LOGIC;
  signal uart_en_reg_n_0 : STD_LOGIC;
  signal \NLW_check_sum0__14_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_check_sum0__14_carry__0_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_check_sum0__14_carry__0_i_9_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_i_reg[0]\ : label is "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_i_reg[1]\ : label is "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_i_reg[2]\ : label is "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_i_reg[3]\ : label is "iSTATE:0100,iSTATE0:0011,iSTATE1:1101,iSTATE2:0010,iSTATE3:1011,iSTATE4:1100,iSTATE5:1010,iSTATE6:0001,iSTATE7:0000,iSTATE8:1001,iSTATE9:0111,iSTATE10:1000,iSTATE11:0110,iSTATE12:1111,iSTATE13:1110,iSTATE14:0101";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \check_sum0__14_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \check_sum0__14_carry__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_11\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_12\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_13\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_14\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_15\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_16\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \check_sum0__14_carry__0_i_8\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \check_sum0__14_carry_i_10\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \check_sum0__14_carry_i_11\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \check_sum0__14_carry_i_9\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \current_gap_no[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \current_gap_no[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \phase_diff[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \phase_diff[3]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \phase_diff[5]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \phase_diff[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \phase_diff[7]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \phase_diff[8]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \tx_data[0]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \tx_data[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tx_data[1]_i_4\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \tx_data[3]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tx_data[3]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of uart_en_i_2 : label is "soft_lutpair23";
begin
\FSM_sequential_i_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_8,
      CLR => u1_n_0,
      D => \i__0\(0),
      Q => i_0(0)
    );
\FSM_sequential_i_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_8,
      CLR => u1_n_0,
      D => \i__0\(1),
      Q => i_0(1)
    );
\FSM_sequential_i_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_8,
      CLR => u1_n_0,
      D => \i__0\(2),
      Q => i_0(2)
    );
\FSM_sequential_i_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_8,
      CLR => u1_n_0,
      D => \i__0\(3),
      Q => i_0(3)
    );
\NewDataLocked[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => iEn,
      I1 => iNewDataUpdate,
      O => NewDataLocked0
    );
\NewDataLocked_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(0),
      Q => NewDataLocked(0)
    );
\NewDataLocked_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(10),
      Q => NewDataLocked(10)
    );
\NewDataLocked_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(11),
      Q => NewDataLocked(11)
    );
\NewDataLocked_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(12),
      Q => NewDataLocked(12)
    );
\NewDataLocked_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(13),
      Q => NewDataLocked(13)
    );
\NewDataLocked_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(14),
      Q => NewDataLocked(14)
    );
\NewDataLocked_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(15),
      Q => NewDataLocked(15)
    );
\NewDataLocked_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(1),
      Q => NewDataLocked(1)
    );
\NewDataLocked_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(2),
      Q => NewDataLocked(2)
    );
\NewDataLocked_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(3),
      Q => NewDataLocked(3)
    );
\NewDataLocked_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(4),
      Q => NewDataLocked(4)
    );
\NewDataLocked_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(5),
      Q => NewDataLocked(5)
    );
\NewDataLocked_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(6),
      Q => NewDataLocked(6)
    );
\NewDataLocked_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(7),
      Q => NewDataLocked(7)
    );
\NewDataLocked_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(8),
      Q => NewDataLocked(8)
    );
\NewDataLocked_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => NewDataLocked0,
      CLR => u1_n_0,
      D => iNewData(9),
      Q => NewDataLocked(9)
    );
\check_sum0__0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \check_sum0__0_carry_n_0\,
      CO(2) => \check_sum0__0_carry_n_1\,
      CO(1) => \check_sum0__0_carry_n_2\,
      CO(0) => \check_sum0__0_carry_n_3\,
      CYINIT => '0',
      DI(3) => \current_gap_no_reg_n_0_[3]\,
      DI(2) => \check_sum0__0_carry_i_1_n_0\,
      DI(1) => \check_sum0__0_carry_i_2_n_0\,
      DI(0) => '0',
      O(3) => \check_sum0__0_carry_n_4\,
      O(2) => \check_sum0__0_carry_n_5\,
      O(1) => \check_sum0__0_carry_n_6\,
      O(0) => \check_sum0__0_carry_n_7\,
      S(3) => \check_sum0__0_carry_i_3_n_0\,
      S(2) => \check_sum0__0_carry_i_4_n_0\,
      S(1) => \check_sum0__0_carry_i_5_n_0\,
      S(0) => \check_sum0__0_carry_i_6_n_0\
    );
\check_sum0__0_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[1]\,
      I1 => time_interval(1),
      O => \check_sum0__0_carry_i_1_n_0\
    );
\check_sum0__0_carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => in5(0),
      I1 => \current_gap_no_reg_n_0_[0]\,
      I2 => time_interval(0),
      O => \check_sum0__0_carry_i_2_n_0\
    );
\check_sum0__0_carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => time_interval(2),
      I1 => \current_gap_no_reg_n_0_[2]\,
      I2 => \current_gap_no_reg_n_0_[3]\,
      O => \check_sum0__0_carry_i_3_n_0\
    );
\check_sum0__0_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => time_interval(1),
      I1 => \current_gap_no_reg_n_0_[1]\,
      I2 => time_interval(2),
      I3 => \current_gap_no_reg_n_0_[2]\,
      O => \check_sum0__0_carry_i_4_n_0\
    );
\check_sum0__0_carry_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => time_interval(0),
      I1 => \current_gap_no_reg_n_0_[0]\,
      I2 => in5(0),
      I3 => time_interval(1),
      I4 => \current_gap_no_reg_n_0_[1]\,
      O => \check_sum0__0_carry_i_5_n_0\
    );
\check_sum0__0_carry_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => in5(0),
      I1 => time_interval(0),
      I2 => \current_gap_no_reg_n_0_[0]\,
      O => \check_sum0__0_carry_i_6_n_0\
    );
\check_sum0__14_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \check_sum0__14_carry_n_0\,
      CO(2) => \check_sum0__14_carry_n_1\,
      CO(1) => \check_sum0__14_carry_n_2\,
      CO(0) => \check_sum0__14_carry_n_3\,
      CYINIT => '0',
      DI(3) => \check_sum0__14_carry_i_1_n_0\,
      DI(2) => \check_sum0__14_carry_i_2_n_0\,
      DI(1) => \check_sum0__0_carry_n_7\,
      DI(0) => \check_sum0__14_carry_i_3_n_0\,
      O(3) => \check_sum0__14_carry_n_4\,
      O(2) => \check_sum0__14_carry_n_5\,
      O(1) => \check_sum0__14_carry_n_6\,
      O(0) => \check_sum0__14_carry_n_7\,
      S(3) => \check_sum0__14_carry_i_4_n_0\,
      S(2) => \check_sum0__14_carry_i_5_n_0\,
      S(1) => \check_sum0__14_carry_i_6_n_0\,
      S(0) => \check_sum0__14_carry_i_7_n_0\
    );
\check_sum0__14_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \check_sum0__14_carry_n_0\,
      CO(3) => \NLW_check_sum0__14_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \check_sum0__14_carry__0_n_1\,
      CO(1) => \check_sum0__14_carry__0_n_2\,
      CO(0) => \check_sum0__14_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \check_sum0__14_carry__0_i_1_n_0\,
      DI(1) => \check_sum0__14_carry__0_i_2_n_0\,
      DI(0) => \check_sum0__14_carry__0_i_3_n_0\,
      O(3) => \check_sum0__14_carry__0_n_4\,
      O(2) => \check_sum0__14_carry__0_n_5\,
      O(1) => \check_sum0__14_carry__0_n_6\,
      O(0) => \check_sum0__14_carry__0_n_7\,
      S(3) => \check_sum0__14_carry__0_i_4_n_0\,
      S(2) => \check_sum0__14_carry__0_i_5_n_0\,
      S(1) => \check_sum0__14_carry__0_i_6_n_0\,
      S(0) => \check_sum0__14_carry__0_i_7_n_0\
    );
\check_sum0__14_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9990900090006660"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[5]\,
      I1 => \check_sum0__14_carry__0_i_8_n_0\,
      I2 => \locked_pulse_counter_reg_n_0_[4]\,
      I3 => in7(4),
      I4 => \phase_diff_reg_n_0_[7]\,
      I5 => \check_sum0__14_carry__0_i_9_n_3\,
      O => \check_sum0__14_carry__0_i_1_n_0\
    );
\check_sum0__14_carry__0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[4]\,
      I1 => in7(4),
      I2 => \phase_diff_reg_n_0_[7]\,
      I3 => \check_sum0__14_carry__0_i_9_n_3\,
      O => \check_sum0__14_carry__0_i_10_n_0\
    );
\check_sum0__14_carry__0_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEBEBE28"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[5]\,
      I1 => in7(5),
      I2 => \phase_diff_reg_n_0_[5]\,
      I3 => \check_sum0__14_carry__0_i_9_n_3\,
      I4 => \phase_diff_reg_n_0_[7]\,
      O => \check_sum0__14_carry__0_i_11_n_0\
    );
\check_sum0__14_carry__0_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"87787887"
    )
        port map (
      I0 => in7(6),
      I1 => \phase_diff_reg_n_0_[6]\,
      I2 => \phase_diff_reg_n_0_[7]\,
      I3 => in7(7),
      I4 => \locked_pulse_counter_reg_n_0_[7]\,
      O => \check_sum0__14_carry__0_i_12_n_0\
    );
\check_sum0__14_carry__0_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \phase_diff_reg_n_0_[6]\,
      I1 => in7(6),
      O => \check_sum0__14_carry__0_i_13_n_0\
    );
\check_sum0__14_carry__0_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78878778"
    )
        port map (
      I0 => in7(5),
      I1 => \phase_diff_reg_n_0_[5]\,
      I2 => \phase_diff_reg_n_0_[6]\,
      I3 => in7(6),
      I4 => \locked_pulse_counter_reg_n_0_[6]\,
      O => \check_sum0__14_carry__0_i_14_n_0\
    );
\check_sum0__14_carry__0_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E11E1EE1"
    )
        port map (
      I0 => \phase_diff_reg_n_0_[7]\,
      I1 => \check_sum0__14_carry__0_i_9_n_3\,
      I2 => \phase_diff_reg_n_0_[5]\,
      I3 => in7(5),
      I4 => \locked_pulse_counter_reg_n_0_[5]\,
      O => \check_sum0__14_carry__0_i_15_n_0\
    );
\check_sum0__14_carry__0_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => \check_sum0__0_carry_n_4\,
      I1 => in7(3),
      I2 => \phase_diff_reg_n_0_[3]\,
      O => \check_sum0__14_carry__0_i_16_n_0\
    );
\check_sum0__14_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000E880FEE8FFFE"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[3]\,
      I1 => \check_sum0__0_carry_n_4\,
      I2 => in7(3),
      I3 => \phase_diff_reg_n_0_[3]\,
      I4 => \check_sum0__14_carry_i_10_n_0\,
      I5 => \check_sum0__14_carry__0_i_10_n_0\,
      O => \check_sum0__14_carry__0_i_2_n_0\
    );
\check_sum0__14_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"022AA880A880022A"
    )
        port map (
      I0 => \check_sum0__14_carry_i_8_n_0\,
      I1 => \check_sum0__0_carry_n_5\,
      I2 => in7(2),
      I3 => \phase_diff_reg_n_0_[2]\,
      I4 => \locked_pulse_counter_reg_n_0_[3]\,
      I5 => \check_sum0__14_carry_i_9_n_0\,
      O => \check_sum0__14_carry__0_i_3_n_0\
    );
\check_sum0__14_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6CC9C993C993C993"
    )
        port map (
      I0 => \check_sum0__14_carry__0_i_11_n_0\,
      I1 => \check_sum0__14_carry__0_i_12_n_0\,
      I2 => \locked_pulse_counter_reg_n_0_[6]\,
      I3 => \check_sum0__14_carry__0_i_13_n_0\,
      I4 => \phase_diff_reg_n_0_[5]\,
      I5 => in7(5),
      O => \check_sum0__14_carry__0_i_4_n_0\
    );
\check_sum0__14_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A9955656566A"
    )
        port map (
      I0 => \check_sum0__14_carry__0_i_1_n_0\,
      I1 => \locked_pulse_counter_reg_n_0_[5]\,
      I2 => \check_sum0__14_carry__0_i_8_n_0\,
      I3 => \check_sum0__14_carry__0_i_9_n_3\,
      I4 => \phase_diff_reg_n_0_[7]\,
      I5 => \check_sum0__14_carry__0_i_14_n_0\,
      O => \check_sum0__14_carry__0_i_5_n_0\
    );
\check_sum0__14_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"556969AAAA969655"
    )
        port map (
      I0 => \check_sum0__14_carry__0_i_2_n_0\,
      I1 => \check_sum0__14_carry__0_i_9_n_3\,
      I2 => \phase_diff_reg_n_0_[7]\,
      I3 => in7(4),
      I4 => \locked_pulse_counter_reg_n_0_[4]\,
      I5 => \check_sum0__14_carry__0_i_15_n_0\,
      O => \check_sum0__14_carry__0_i_6_n_0\
    );
\check_sum0__14_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A665599A599AA665"
    )
        port map (
      I0 => \check_sum0__14_carry__0_i_3_n_0\,
      I1 => \locked_pulse_counter_reg_n_0_[3]\,
      I2 => \check_sum0__14_carry_i_9_n_0\,
      I3 => \check_sum0__14_carry_i_10_n_0\,
      I4 => \check_sum0__14_carry__0_i_10_n_0\,
      I5 => \check_sum0__14_carry__0_i_16_n_0\,
      O => \check_sum0__14_carry__0_i_7_n_0\
    );
\check_sum0__14_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \phase_diff_reg_n_0_[5]\,
      I1 => in7(5),
      O => \check_sum0__14_carry__0_i_8_n_0\
    );
\check_sum0__14_carry__0_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \check_sum0__0_carry_n_0\,
      CO(3 downto 1) => \NLW_check_sum0__14_carry__0_i_9_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \check_sum0__14_carry__0_i_9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_check_sum0__14_carry__0_i_9_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\check_sum0__14_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A995566A566AA995"
    )
        port map (
      I0 => \check_sum0__14_carry_i_8_n_0\,
      I1 => \check_sum0__0_carry_n_5\,
      I2 => in7(2),
      I3 => \phase_diff_reg_n_0_[2]\,
      I4 => \locked_pulse_counter_reg_n_0_[3]\,
      I5 => \check_sum0__14_carry_i_9_n_0\,
      O => \check_sum0__14_carry_i_1_n_0\
    );
\check_sum0__14_carry_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => \check_sum0__0_carry_n_5\,
      I1 => in7(2),
      I2 => \phase_diff_reg_n_0_[2]\,
      O => \check_sum0__14_carry_i_10_n_0\
    );
\check_sum0__14_carry_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E88E8EE8"
    )
        port map (
      I0 => \check_sum0__0_carry_n_6\,
      I1 => \locked_pulse_counter_reg_n_0_[2]\,
      I2 => \check_sum0__0_carry_n_5\,
      I3 => in7(2),
      I4 => \phase_diff_reg_n_0_[2]\,
      O => \check_sum0__14_carry_i_11_n_0\
    );
\check_sum0__14_carry_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \check_sum0__0_carry_n_6\,
      I1 => \phase_diff_reg_n_0_[2]\,
      I2 => in7(2),
      I3 => \check_sum0__0_carry_n_5\,
      I4 => \locked_pulse_counter_reg_n_0_[2]\,
      O => \check_sum0__14_carry_i_2_n_0\
    );
\check_sum0__14_carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \check_sum0__0_carry_n_7\,
      O => \check_sum0__14_carry_i_3_n_0\
    );
\check_sum0__14_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \check_sum0__14_carry_i_9_n_0\,
      I1 => \locked_pulse_counter_reg_n_0_[3]\,
      I2 => \check_sum0__14_carry_i_10_n_0\,
      I3 => \check_sum0__14_carry_i_8_n_0\,
      I4 => \check_sum0__14_carry_i_11_n_0\,
      O => \check_sum0__14_carry_i_4_n_0\
    );
\check_sum0__14_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"556A6AAA9555556A"
    )
        port map (
      I0 => \check_sum0__14_carry_i_2_n_0\,
      I1 => in7(0),
      I2 => \locked_pulse_counter_reg_n_0_[0]\,
      I3 => in7(1),
      I4 => \locked_pulse_counter_reg_n_0_[1]\,
      I5 => \check_sum0__0_carry_n_6\,
      O => \check_sum0__14_carry_i_5_n_0\
    );
\check_sum0__14_carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7887877887787887"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[0]\,
      I1 => in7(0),
      I2 => \locked_pulse_counter_reg_n_0_[1]\,
      I3 => in7(1),
      I4 => \check_sum0__0_carry_n_6\,
      I5 => \check_sum0__0_carry_n_7\,
      O => \check_sum0__14_carry_i_6_n_0\
    );
\check_sum0__14_carry_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \check_sum0__0_carry_n_7\,
      I1 => \locked_pulse_counter_reg_n_0_[0]\,
      I2 => in7(0),
      O => \check_sum0__14_carry_i_7_n_0\
    );
\check_sum0__14_carry_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \check_sum0__0_carry_n_6\,
      I1 => \locked_pulse_counter_reg_n_0_[1]\,
      I2 => in7(1),
      I3 => \locked_pulse_counter_reg_n_0_[0]\,
      I4 => in7(0),
      O => \check_sum0__14_carry_i_8_n_0\
    );
\check_sum0__14_carry_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \phase_diff_reg_n_0_[3]\,
      I1 => in7(3),
      I2 => \check_sum0__0_carry_n_4\,
      O => \check_sum0__14_carry_i_9_n_0\
    );
\check_sum[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => i_0(3),
      I1 => i_0(2),
      I2 => iEn,
      I3 => i_0(1),
      I4 => i_0(0),
      O => \check_sum[7]_i_1_n_0\
    );
\check_sum_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry_n_7\,
      Q => check_sum(0)
    );
\check_sum_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry_n_6\,
      Q => check_sum(1)
    );
\check_sum_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry_n_5\,
      Q => check_sum(2)
    );
\check_sum_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry_n_4\,
      Q => check_sum(3)
    );
\check_sum_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry__0_n_7\,
      Q => check_sum(4)
    );
\check_sum_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry__0_n_6\,
      Q => check_sum(5)
    );
\check_sum_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry__0_n_5\,
      Q => check_sum(6)
    );
\check_sum_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => \check_sum[7]_i_1_n_0\,
      CLR => u1_n_0,
      D => \check_sum0__14_carry__0_n_4\,
      Q => check_sum(7)
    );
\current_gap_no[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0FF"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[1]\,
      I1 => \current_gap_no_reg_n_0_[2]\,
      I2 => \current_gap_no_reg_n_0_[3]\,
      I3 => \current_gap_no_reg_n_0_[0]\,
      O => \current_gap_no[0]_i_1_n_0\
    );
\current_gap_no[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0266"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[0]\,
      I1 => \current_gap_no_reg_n_0_[1]\,
      I2 => \current_gap_no_reg_n_0_[2]\,
      I3 => \current_gap_no_reg_n_0_[3]\,
      O => \current_gap_no[1]_i_1_n_0\
    );
\current_gap_no[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0078"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[0]\,
      I1 => \current_gap_no_reg_n_0_[1]\,
      I2 => \current_gap_no_reg_n_0_[2]\,
      I3 => \current_gap_no_reg_n_0_[3]\,
      O => \current_gap_no[2]_i_1_n_0\
    );
\current_gap_no[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0380"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[0]\,
      I1 => \current_gap_no_reg_n_0_[1]\,
      I2 => \current_gap_no_reg_n_0_[2]\,
      I3 => \current_gap_no_reg_n_0_[3]\,
      O => \current_gap_no[3]_i_1_n_0\
    );
\current_gap_no_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => oDone_i_1_n_0,
      D => \current_gap_no[0]_i_1_n_0\,
      PRE => u1_n_0,
      Q => \current_gap_no_reg_n_0_[0]\
    );
\current_gap_no_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => oDone_i_1_n_0,
      CLR => u1_n_0,
      D => \current_gap_no[1]_i_1_n_0\,
      Q => \current_gap_no_reg_n_0_[1]\
    );
\current_gap_no_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => oDone_i_1_n_0,
      CLR => u1_n_0,
      D => \current_gap_no[2]_i_1_n_0\,
      Q => \current_gap_no_reg_n_0_[2]\
    );
\current_gap_no_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => oDone_i_1_n_0,
      CLR => u1_n_0,
      D => \current_gap_no[3]_i_1_n_0\,
      Q => \current_gap_no_reg_n_0_[3]\
    );
\locked_pulse_counter[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => iEn,
      I1 => iRst_N,
      O => \locked_pulse_counter[15]_i_2_n_0\
    );
\locked_pulse_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(0),
      Q => \locked_pulse_counter_reg_n_0_[0]\,
      R => '0'
    );
\locked_pulse_counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(10),
      Q => in7(2),
      R => '0'
    );
\locked_pulse_counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(11),
      Q => in7(3),
      R => '0'
    );
\locked_pulse_counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(12),
      Q => in7(4),
      R => '0'
    );
\locked_pulse_counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(13),
      Q => in7(5),
      R => '0'
    );
\locked_pulse_counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(14),
      Q => in7(6),
      R => '0'
    );
\locked_pulse_counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(15),
      Q => in7(7),
      R => '0'
    );
\locked_pulse_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(1),
      Q => \locked_pulse_counter_reg_n_0_[1]\,
      R => '0'
    );
\locked_pulse_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(2),
      Q => \locked_pulse_counter_reg_n_0_[2]\,
      R => '0'
    );
\locked_pulse_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(3),
      Q => \locked_pulse_counter_reg_n_0_[3]\,
      R => '0'
    );
\locked_pulse_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(4),
      Q => \locked_pulse_counter_reg_n_0_[4]\,
      R => '0'
    );
\locked_pulse_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(5),
      Q => \locked_pulse_counter_reg_n_0_[5]\,
      R => '0'
    );
\locked_pulse_counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(6),
      Q => \locked_pulse_counter_reg_n_0_[6]\,
      R => '0'
    );
\locked_pulse_counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(7),
      Q => \locked_pulse_counter_reg_n_0_[7]\,
      R => '0'
    );
\locked_pulse_counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(8),
      Q => in7(0),
      R => '0'
    );
\locked_pulse_counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_10,
      D => NewDataLocked(9),
      Q => in7(1),
      R => '0'
    );
oDone_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => i_0(3),
      I1 => i_0(2),
      I2 => iEn,
      I3 => i_0(1),
      I4 => i_0(0),
      O => oDone_i_1_n_0
    );
oDone_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => oDone_i_1_n_0,
      CLR => u1_n_0,
      D => iEn,
      Q => oDone
    );
\phase_diff[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCF1"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[1]\,
      I1 => \current_gap_no_reg_n_0_[3]\,
      I2 => \current_gap_no_reg_n_0_[0]\,
      I3 => \current_gap_no_reg_n_0_[2]\,
      O => \phase_diff[2]_i_1_n_0\
    );
\phase_diff[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"222A"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[1]\,
      I1 => \current_gap_no_reg_n_0_[3]\,
      I2 => \current_gap_no_reg_n_0_[0]\,
      I3 => \current_gap_no_reg_n_0_[2]\,
      O => \phase_diff[3]_i_1_n_0\
    );
\phase_diff[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFF1"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[1]\,
      I1 => \current_gap_no_reg_n_0_[2]\,
      I2 => \current_gap_no_reg_n_0_[3]\,
      I3 => \current_gap_no_reg_n_0_[0]\,
      O => \phase_diff[5]_i_1_n_0\
    );
\phase_diff[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F40"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[2]\,
      I1 => \current_gap_no_reg_n_0_[0]\,
      I2 => \current_gap_no_reg_n_0_[3]\,
      I3 => \current_gap_no_reg_n_0_[1]\,
      O => \phase_diff[6]_i_1_n_0\
    );
\phase_diff[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[2]\,
      I1 => \current_gap_no_reg_n_0_[3]\,
      O => \phase_diff[7]_i_1_n_0\
    );
\phase_diff[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002A"
    )
        port map (
      I0 => \current_gap_no_reg_n_0_[3]\,
      I1 => \current_gap_no_reg_n_0_[0]\,
      I2 => \current_gap_no_reg_n_0_[1]\,
      I3 => \current_gap_no_reg_n_0_[2]\,
      O => \phase_diff[8]_i_2_n_0\
    );
\phase_diff_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => u1_n_2,
      D => \phase_diff[2]_i_1_n_0\,
      PRE => u1_n_0,
      Q => \phase_diff_reg_n_0_[2]\
    );
\phase_diff_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_2,
      CLR => u1_n_0,
      D => \phase_diff[3]_i_1_n_0\,
      Q => \phase_diff_reg_n_0_[3]\
    );
\phase_diff_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => u1_n_2,
      D => \phase_diff[5]_i_1_n_0\,
      PRE => u1_n_0,
      Q => \phase_diff_reg_n_0_[5]\
    );
\phase_diff_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_2,
      CLR => u1_n_0,
      D => \phase_diff[6]_i_1_n_0\,
      Q => \phase_diff_reg_n_0_[6]\
    );
\phase_diff_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_2,
      CLR => u1_n_0,
      D => \phase_diff[7]_i_1_n_0\,
      Q => \phase_diff_reg_n_0_[7]\
    );
\phase_diff_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => u1_n_2,
      CLR => u1_n_0,
      D => \phase_diff[8]_i_2_n_0\,
      Q => in5(0)
    );
\time_interval[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFBFFFFBFFB0000"
    )
        port map (
      I0 => \time_interval[1]_i_2_n_0\,
      I1 => iTime_Interval(0),
      I2 => iTime_Interval(1),
      I3 => iTime_Interval(2),
      I4 => u1_n_9,
      I5 => time_interval(0),
      O => \time_interval[0]_i_1_n_0\
    );
\time_interval[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0081FFFF00810000"
    )
        port map (
      I0 => iTime_Interval(0),
      I1 => iTime_Interval(1),
      I2 => iTime_Interval(2),
      I3 => \time_interval[1]_i_2_n_0\,
      I4 => u1_n_9,
      I5 => time_interval(1),
      O => \time_interval[1]_i_1_n_0\
    );
\time_interval[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFF"
    )
        port map (
      I0 => iTime_Interval(5),
      I1 => iTime_Interval(6),
      I2 => iTime_Interval(4),
      I3 => iTime_Interval(7),
      I4 => iTime_Interval(3),
      I5 => iTime_Interval(2),
      O => \time_interval[1]_i_2_n_0\
    );
\time_interval[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \time_interval[2]_i_2_n_0\,
      I1 => u1_n_9,
      I2 => time_interval(2),
      O => \time_interval[2]_i_1_n_0\
    );
\time_interval[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => iTime_Interval(0),
      I1 => iTime_Interval(2),
      I2 => iTime_Interval(1),
      I3 => iTime_Interval(3),
      I4 => \time_interval[2]_i_4_n_0\,
      O => \time_interval[2]_i_2_n_0\
    );
\time_interval[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => iTime_Interval(7),
      I1 => iTime_Interval(4),
      I2 => iTime_Interval(6),
      I3 => iTime_Interval(5),
      O => \time_interval[2]_i_4_n_0\
    );
\time_interval_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => iClk,
      CE => '1',
      D => \time_interval[0]_i_1_n_0\,
      PRE => u1_n_0,
      Q => time_interval(0)
    );
\time_interval_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => u1_n_0,
      D => \time_interval[1]_i_1_n_0\,
      Q => time_interval(1)
    );
\time_interval_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => u1_n_0,
      D => \time_interval[2]_i_1_n_0\,
      Q => time_interval(2)
    );
\tx_data[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AEAA"
    )
        port map (
      I0 => \tx_data[0]_i_2_n_0\,
      I1 => \tx_data[0]_i_3_n_0\,
      I2 => i_0(1),
      I3 => i_0(2),
      I4 => \tx_data[0]_i_4_n_0\,
      O => tx_data(0)
    );
\tx_data[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0F0F0F8F8F0F0F"
    )
        port map (
      I0 => i_0(0),
      I1 => \current_gap_no_reg_n_0_[0]\,
      I2 => i_0(3),
      I3 => check_sum(0),
      I4 => i_0(1),
      I5 => i_0(2),
      O => \tx_data[0]_i_2_n_0\
    );
\tx_data[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFB"
    )
        port map (
      I0 => \time_interval[1]_i_2_n_0\,
      I1 => iTime_Interval(0),
      I2 => iTime_Interval(1),
      I3 => iTime_Interval(2),
      O => \tx_data[0]_i_3_n_0\
    );
\tx_data[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000047FFFFFF"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[0]\,
      I1 => i_0(0),
      I2 => in7(0),
      I3 => i_0(2),
      I4 => i_0(1),
      I5 => \tx_data[0]_i_5_n_0\,
      O => \tx_data[0]_i_4_n_0\
    );
\tx_data[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAABAB"
    )
        port map (
      I0 => i_0(3),
      I1 => i_0(0),
      I2 => i_0(1),
      I3 => in5(0),
      I4 => i_0(2),
      O => \tx_data[0]_i_5_n_0\
    );
\tx_data[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A888888"
    )
        port map (
      I0 => \tx_data[1]_i_2_n_0\,
      I1 => \tx_data[1]_i_3_n_0\,
      I2 => i_0(1),
      I3 => i_0(2),
      I4 => \tx_data[1]_i_4_n_0\,
      O => tx_data(1)
    );
\tx_data[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBBBEAEAFBBBAAAA"
    )
        port map (
      I0 => i_0(3),
      I1 => i_0(2),
      I2 => i_0(1),
      I3 => \locked_pulse_counter_reg_n_0_[1]\,
      I4 => i_0(0),
      I5 => in7(1),
      O => \tx_data[1]_i_2_n_0\
    );
\tx_data[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB3B3B33F333F33"
    )
        port map (
      I0 => check_sum(1),
      I1 => i_0(3),
      I2 => i_0(2),
      I3 => i_0(0),
      I4 => \current_gap_no_reg_n_0_[1]\,
      I5 => i_0(1),
      O => \tx_data[1]_i_3_n_0\
    );
\tx_data[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0081"
    )
        port map (
      I0 => iTime_Interval(0),
      I1 => iTime_Interval(1),
      I2 => iTime_Interval(2),
      I3 => \time_interval[1]_i_2_n_0\,
      O => \tx_data[1]_i_4_n_0\
    );
\tx_data[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AEAA"
    )
        port map (
      I0 => \tx_data[2]_i_2_n_0\,
      I1 => \time_interval[2]_i_2_n_0\,
      I2 => i_0(1),
      I3 => i_0(2),
      I4 => \tx_data[2]_i_3_n_0\,
      O => tx_data(2)
    );
\tx_data[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0F0F0F8F8F0F0F"
    )
        port map (
      I0 => i_0(0),
      I1 => \current_gap_no_reg_n_0_[2]\,
      I2 => i_0(3),
      I3 => check_sum(2),
      I4 => i_0(1),
      I5 => i_0(2),
      O => \tx_data[2]_i_2_n_0\
    );
\tx_data[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000047FFFFFF"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[2]\,
      I1 => i_0(0),
      I2 => in7(2),
      I3 => i_0(2),
      I4 => i_0(1),
      I5 => \tx_data[2]_i_4_n_0\,
      O => \tx_data[2]_i_3_n_0\
    );
\tx_data[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAEAAF"
    )
        port map (
      I0 => i_0(3),
      I1 => \phase_diff_reg_n_0_[2]\,
      I2 => i_0(2),
      I3 => i_0(0),
      I4 => i_0(1),
      O => \tx_data[2]_i_4_n_0\
    );
\tx_data[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAFEAE"
    )
        port map (
      I0 => \tx_data[3]_i_2_n_0\,
      I1 => in7(3),
      I2 => i_0(0),
      I3 => \locked_pulse_counter_reg_n_0_[3]\,
      I4 => \tx_data[3]_i_3_n_0\,
      I5 => \tx_data[3]_i_4_n_0\,
      O => tx_data(3)
    );
\tx_data[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFAAEFAA"
    )
        port map (
      I0 => i_0(3),
      I1 => \phase_diff_reg_n_0_[3]\,
      I2 => i_0(2),
      I3 => i_0(0),
      I4 => i_0(1),
      O => \tx_data[3]_i_2_n_0\
    );
\tx_data[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => i_0(2),
      I1 => i_0(1),
      O => \tx_data[3]_i_3_n_0\
    );
\tx_data[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A002AAA2AA02AAA"
    )
        port map (
      I0 => i_0(3),
      I1 => check_sum(3),
      I2 => i_0(1),
      I3 => i_0(2),
      I4 => i_0(0),
      I5 => \current_gap_no_reg_n_0_[3]\,
      O => \tx_data[3]_i_4_n_0\
    );
\tx_data[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5550000D555D555"
    )
        port map (
      I0 => i_0(3),
      I1 => check_sum(4),
      I2 => i_0(1),
      I3 => i_0(2),
      I4 => \tx_data[4]_i_2_n_0\,
      I5 => \tx_data[4]_i_3_n_0\,
      O => tx_data(4)
    );
\tx_data[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAAAAF"
    )
        port map (
      I0 => i_0(3),
      I1 => \phase_diff_reg_n_0_[7]\,
      I2 => i_0(1),
      I3 => i_0(0),
      I4 => i_0(2),
      O => \tx_data[4]_i_2_n_0\
    );
\tx_data[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"777FFF7F"
    )
        port map (
      I0 => i_0(1),
      I1 => i_0(2),
      I2 => in7(4),
      I3 => i_0(0),
      I4 => \locked_pulse_counter_reg_n_0_[4]\,
      O => \tx_data[4]_i_3_n_0\
    );
\tx_data[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => check_sum(5),
      I1 => i_0(1),
      I2 => i_0(2),
      I3 => i_0(3),
      I4 => \tx_data[5]_i_2_n_0\,
      O => tx_data(5)
    );
\tx_data[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00CC00F0FF0000"
    )
        port map (
      I0 => \locked_pulse_counter_reg_n_0_[5]\,
      I1 => in7(5),
      I2 => \phase_diff_reg_n_0_[5]\,
      I3 => i_0(2),
      I4 => i_0(0),
      I5 => i_0(1),
      O => \tx_data[5]_i_2_n_0\
    );
\tx_data[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88000003BB333333"
    )
        port map (
      I0 => check_sum(6),
      I1 => i_0(3),
      I2 => i_0(0),
      I3 => i_0(1),
      I4 => i_0(2),
      I5 => \tx_data[6]_i_2_n_0\,
      O => tx_data(6)
    );
\tx_data[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"37F73F3F37F7FFFF"
    )
        port map (
      I0 => \phase_diff_reg_n_0_[6]\,
      I1 => i_0(2),
      I2 => i_0(1),
      I3 => \locked_pulse_counter_reg_n_0_[6]\,
      I4 => i_0(0),
      I5 => in7(6),
      O => \tx_data[6]_i_2_n_0\
    );
\tx_data[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => i_0(2),
      I1 => check_sum(7),
      I2 => i_0(1),
      I3 => i_0(3),
      I4 => \tx_data[7]_i_3_n_0\,
      O => tx_data(7)
    );
\tx_data[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCF0AA0000FF0000"
    )
        port map (
      I0 => in7(7),
      I1 => \locked_pulse_counter_reg_n_0_[7]\,
      I2 => \phase_diff_reg_n_0_[7]\,
      I3 => i_0(1),
      I4 => i_0(0),
      I5 => i_0(2),
      O => \tx_data[7]_i_3_n_0\
    );
\tx_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(0),
      Q => \tx_data_reg_n_0_[0]\,
      R => '0'
    );
\tx_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(1),
      Q => data2,
      R => '0'
    );
\tx_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(2),
      Q => data3,
      R => '0'
    );
\tx_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(3),
      Q => data4,
      R => '0'
    );
\tx_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(4),
      Q => data5,
      R => '0'
    );
\tx_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(5),
      Q => data6,
      R => '0'
    );
\tx_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(6),
      Q => data7,
      R => '0'
    );
\tx_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => u1_n_7,
      D => tx_data(7),
      Q => data0,
      R => '0'
    );
u1: entity work.ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Module
     port map (
      D(3 downto 0) => \i__0\(3 downto 0),
      E(0) => u1_n_2,
      \FSM_sequential_i_reg[0]\(0) => u1_n_10,
      \FSM_sequential_i_reg[3]\ => u1_n_9,
      Q(3 downto 0) => i_0(3 downto 0),
      iClk => iClk,
      iEn => iEn,
      iEn_0(0) => u1_n_8,
      iRst_N => iRst_N,
      iRst_N_0 => u1_n_0,
      \i_reg[2]\ => uart_en_reg_n_0,
      \locked_pulse_counter_reg[0]\ => \locked_pulse_counter[15]_i_2_n_0\,
      oTxd_Pin => oTxd_Pin,
      rdone_reg(0) => u1_n_7,
      rdone_reg_0 => u1_n_11,
      rtx_pin_i_11(7) => data0,
      rtx_pin_i_11(6) => data7,
      rtx_pin_i_11(5) => data6,
      rtx_pin_i_11(4) => data5,
      rtx_pin_i_11(3) => data4,
      rtx_pin_i_11(2) => data3,
      rtx_pin_i_11(1) => data2,
      rtx_pin_i_11(0) => \tx_data_reg_n_0_[0]\,
      uart_en_reg => uart_en_i_2_n_0
    );
uart_en_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => i_0(3),
      I1 => i_0(2),
      O => uart_en_i_2_n_0
    );
uart_en_reg: unisim.vcomponents.FDRE
     port map (
      C => iClk,
      CE => '1',
      D => u1_n_11,
      Q => uart_en_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZUART_Data_Dump_0_0 is
  port (
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iNewDataUpdate : in STD_LOGIC;
    iNewData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    iTime_Interval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    oTxd_Pin : out STD_LOGIC;
    oDir_Pin : out STD_LOGIC;
    oDone : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 : entity is "ZPhotonDetector_Block_ZUART_Data_Dump_0_0,ZUART_Data_Dump,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 : entity is "ZUART_Data_Dump,Vivado 2023.1";
end ZPhotonDetector_Block_ZUART_Data_Dump_0_0;

architecture STRUCTURE of ZPhotonDetector_Block_ZUART_Data_Dump_0_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  oDir_Pin <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.ZPhotonDetector_Block_ZUART_Data_Dump_0_0_ZUART_Data_Dump
     port map (
      iClk => iClk,
      iEn => iEn,
      iNewData(15 downto 0) => iNewData(15 downto 0),
      iNewDataUpdate => iNewDataUpdate,
      iRst_N => iRst_N,
      iTime_Interval(7 downto 0) => iTime_Interval(7 downto 0),
      oDone => oDone,
      oTxd_Pin => oTxd_Pin
    );
end STRUCTURE;
