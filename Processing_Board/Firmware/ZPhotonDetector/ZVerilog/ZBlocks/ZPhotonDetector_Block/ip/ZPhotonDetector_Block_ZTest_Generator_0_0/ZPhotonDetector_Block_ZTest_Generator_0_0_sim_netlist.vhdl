-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Nov  9 14:50:31 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZTest_Generator_0_0/ZPhotonDetector_Block_ZTest_Generator_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZTest_Generator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator is
  port (
    oFixedFreq : out STD_LOGIC;
    oFixedFreq_IO : out STD_LOGIC;
    iSelect : in STD_LOGIC_VECTOR ( 2 downto 0 );
    iClk : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iRst_N : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator : entity is "ZTest_Generator";
end ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator;

architecture STRUCTURE of ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator is
  signal CNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CNT0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \CNT0_carry__0_n_0\ : STD_LOGIC;
  signal \CNT0_carry__0_n_1\ : STD_LOGIC;
  signal \CNT0_carry__0_n_2\ : STD_LOGIC;
  signal \CNT0_carry__0_n_3\ : STD_LOGIC;
  signal \CNT0_carry__1_n_0\ : STD_LOGIC;
  signal \CNT0_carry__1_n_1\ : STD_LOGIC;
  signal \CNT0_carry__1_n_2\ : STD_LOGIC;
  signal \CNT0_carry__1_n_3\ : STD_LOGIC;
  signal \CNT0_carry__2_n_0\ : STD_LOGIC;
  signal \CNT0_carry__2_n_1\ : STD_LOGIC;
  signal \CNT0_carry__2_n_2\ : STD_LOGIC;
  signal \CNT0_carry__2_n_3\ : STD_LOGIC;
  signal \CNT0_carry__3_n_0\ : STD_LOGIC;
  signal \CNT0_carry__3_n_1\ : STD_LOGIC;
  signal \CNT0_carry__3_n_2\ : STD_LOGIC;
  signal \CNT0_carry__3_n_3\ : STD_LOGIC;
  signal \CNT0_carry__4_n_0\ : STD_LOGIC;
  signal \CNT0_carry__4_n_1\ : STD_LOGIC;
  signal \CNT0_carry__4_n_2\ : STD_LOGIC;
  signal \CNT0_carry__4_n_3\ : STD_LOGIC;
  signal \CNT0_carry__5_n_0\ : STD_LOGIC;
  signal \CNT0_carry__5_n_1\ : STD_LOGIC;
  signal \CNT0_carry__5_n_2\ : STD_LOGIC;
  signal \CNT0_carry__5_n_3\ : STD_LOGIC;
  signal \CNT0_carry__6_n_2\ : STD_LOGIC;
  signal \CNT0_carry__6_n_3\ : STD_LOGIC;
  signal CNT0_carry_n_0 : STD_LOGIC;
  signal CNT0_carry_n_1 : STD_LOGIC;
  signal CNT0_carry_n_2 : STD_LOGIC;
  signal CNT0_carry_n_3 : STD_LOGIC;
  signal \^ofixedfreq\ : STD_LOGIC;
  signal \^ofixedfreq_io\ : STD_LOGIC;
  signal oFixedFreq_IO_i_1_n_0 : STD_LOGIC;
  signal oFixedFreq_IO_i_2_n_0 : STD_LOGIC;
  signal \oFixedFreq_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_n_1\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_n_2\ : STD_LOGIC;
  signal \oFixedFreq_carry__0_n_3\ : STD_LOGIC;
  signal \oFixedFreq_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \oFixedFreq_carry__1_n_2\ : STD_LOGIC;
  signal \oFixedFreq_carry__1_n_3\ : STD_LOGIC;
  signal oFixedFreq_carry_i_1_n_0 : STD_LOGIC;
  signal oFixedFreq_carry_i_2_n_0 : STD_LOGIC;
  signal oFixedFreq_carry_i_3_n_0 : STD_LOGIC;
  signal oFixedFreq_carry_i_4_n_0 : STD_LOGIC;
  signal oFixedFreq_carry_n_0 : STD_LOGIC;
  signal oFixedFreq_carry_n_1 : STD_LOGIC;
  signal oFixedFreq_carry_n_2 : STD_LOGIC;
  signal oFixedFreq_carry_n_3 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_CNT0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_CNT0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_oFixedFreq_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oFixedFreq_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_oFixedFreq_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_oFixedFreq_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of CNT0_carry : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \CNT0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CNT[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \CNT[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \CNT[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \CNT[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \CNT[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \CNT[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \CNT[16]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \CNT[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \CNT[18]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \CNT[19]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \CNT[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT[20]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \CNT[21]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \CNT[22]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \CNT[23]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \CNT[24]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \CNT[25]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \CNT[26]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \CNT[27]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \CNT[28]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \CNT[29]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \CNT[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CNT[30]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \CNT[31]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \CNT[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CNT[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CNT[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \CNT[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \CNT[9]_i_1\ : label is "soft_lutpair4";
begin
  oFixedFreq <= \^ofixedfreq\;
  oFixedFreq_IO <= \^ofixedfreq_io\;
CNT0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => CNT0_carry_n_0,
      CO(2) => CNT0_carry_n_1,
      CO(1) => CNT0_carry_n_2,
      CO(0) => CNT0_carry_n_3,
      CYINIT => CNT(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(4 downto 1),
      S(3 downto 0) => CNT(4 downto 1)
    );
\CNT0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => CNT0_carry_n_0,
      CO(3) => \CNT0_carry__0_n_0\,
      CO(2) => \CNT0_carry__0_n_1\,
      CO(1) => \CNT0_carry__0_n_2\,
      CO(0) => \CNT0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(8 downto 5),
      S(3 downto 0) => CNT(8 downto 5)
    );
\CNT0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__0_n_0\,
      CO(3) => \CNT0_carry__1_n_0\,
      CO(2) => \CNT0_carry__1_n_1\,
      CO(1) => \CNT0_carry__1_n_2\,
      CO(0) => \CNT0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(12 downto 9),
      S(3 downto 0) => CNT(12 downto 9)
    );
\CNT0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__1_n_0\,
      CO(3) => \CNT0_carry__2_n_0\,
      CO(2) => \CNT0_carry__2_n_1\,
      CO(1) => \CNT0_carry__2_n_2\,
      CO(0) => \CNT0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(16 downto 13),
      S(3 downto 0) => CNT(16 downto 13)
    );
\CNT0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__2_n_0\,
      CO(3) => \CNT0_carry__3_n_0\,
      CO(2) => \CNT0_carry__3_n_1\,
      CO(1) => \CNT0_carry__3_n_2\,
      CO(0) => \CNT0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(20 downto 17),
      S(3 downto 0) => CNT(20 downto 17)
    );
\CNT0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__3_n_0\,
      CO(3) => \CNT0_carry__4_n_0\,
      CO(2) => \CNT0_carry__4_n_1\,
      CO(1) => \CNT0_carry__4_n_2\,
      CO(0) => \CNT0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(24 downto 21),
      S(3 downto 0) => CNT(24 downto 21)
    );
\CNT0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__4_n_0\,
      CO(3) => \CNT0_carry__5_n_0\,
      CO(2) => \CNT0_carry__5_n_1\,
      CO(1) => \CNT0_carry__5_n_2\,
      CO(0) => \CNT0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => CNT0(28 downto 25),
      S(3 downto 0) => CNT(28 downto 25)
    );
\CNT0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_CNT0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \CNT0_carry__6_n_2\,
      CO(0) => \CNT0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_CNT0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => CNT0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => CNT(31 downto 29)
    );
\CNT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT(0),
      O => p_0_in(0)
    );
\CNT[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(10),
      O => p_0_in(10)
    );
\CNT[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(11),
      O => p_0_in(11)
    );
\CNT[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(12),
      O => p_0_in(12)
    );
\CNT[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(13),
      O => p_0_in(13)
    );
\CNT[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(14),
      O => p_0_in(14)
    );
\CNT[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(15),
      O => p_0_in(15)
    );
\CNT[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(16),
      O => p_0_in(16)
    );
\CNT[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(17),
      O => p_0_in(17)
    );
\CNT[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(18),
      O => p_0_in(18)
    );
\CNT[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(19),
      O => p_0_in(19)
    );
\CNT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(1),
      O => p_0_in(1)
    );
\CNT[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(20),
      O => p_0_in(20)
    );
\CNT[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(21),
      O => p_0_in(21)
    );
\CNT[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(22),
      O => p_0_in(22)
    );
\CNT[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(23),
      O => p_0_in(23)
    );
\CNT[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(24),
      O => p_0_in(24)
    );
\CNT[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(25),
      O => p_0_in(25)
    );
\CNT[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(26),
      O => p_0_in(26)
    );
\CNT[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(27),
      O => p_0_in(27)
    );
\CNT[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(28),
      O => p_0_in(28)
    );
\CNT[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(29),
      O => p_0_in(29)
    );
\CNT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(2),
      O => p_0_in(2)
    );
\CNT[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(30),
      O => p_0_in(30)
    );
\CNT[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(31),
      O => p_0_in(31)
    );
\CNT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(3),
      O => p_0_in(3)
    );
\CNT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(4),
      O => p_0_in(4)
    );
\CNT[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(5),
      O => p_0_in(5)
    );
\CNT[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(6),
      O => p_0_in(6)
    );
\CNT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(7),
      O => p_0_in(7)
    );
\CNT[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(8),
      O => p_0_in(8)
    );
\CNT[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => iEn,
      I1 => \^ofixedfreq\,
      I2 => CNT0(9),
      O => p_0_in(9)
    );
\CNT_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(0),
      Q => CNT(0)
    );
\CNT_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(10),
      Q => CNT(10)
    );
\CNT_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(11),
      Q => CNT(11)
    );
\CNT_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(12),
      Q => CNT(12)
    );
\CNT_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(13),
      Q => CNT(13)
    );
\CNT_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(14),
      Q => CNT(14)
    );
\CNT_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(15),
      Q => CNT(15)
    );
\CNT_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(16),
      Q => CNT(16)
    );
\CNT_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(17),
      Q => CNT(17)
    );
\CNT_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(18),
      Q => CNT(18)
    );
\CNT_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(19),
      Q => CNT(19)
    );
\CNT_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(1),
      Q => CNT(1)
    );
\CNT_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(20),
      Q => CNT(20)
    );
\CNT_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(21),
      Q => CNT(21)
    );
\CNT_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(22),
      Q => CNT(22)
    );
\CNT_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(23),
      Q => CNT(23)
    );
\CNT_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(24),
      Q => CNT(24)
    );
\CNT_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(25),
      Q => CNT(25)
    );
\CNT_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(26),
      Q => CNT(26)
    );
\CNT_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(27),
      Q => CNT(27)
    );
\CNT_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(28),
      Q => CNT(28)
    );
\CNT_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(29),
      Q => CNT(29)
    );
\CNT_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(2),
      Q => CNT(2)
    );
\CNT_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(30),
      Q => CNT(30)
    );
\CNT_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(31),
      Q => CNT(31)
    );
\CNT_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(3),
      Q => CNT(3)
    );
\CNT_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(4),
      Q => CNT(4)
    );
\CNT_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(5),
      Q => CNT(5)
    );
\CNT_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(6),
      Q => CNT(6)
    );
\CNT_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(7),
      Q => CNT(7)
    );
\CNT_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(8),
      Q => CNT(8)
    );
\CNT_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => p_0_in(9),
      Q => CNT(9)
    );
oFixedFreq_IO_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \^ofixedfreq\,
      I1 => iEn,
      I2 => \^ofixedfreq_io\,
      O => oFixedFreq_IO_i_1_n_0
    );
oFixedFreq_IO_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => oFixedFreq_IO_i_2_n_0
    );
oFixedFreq_IO_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_IO_i_2_n_0,
      D => oFixedFreq_IO_i_1_n_0,
      Q => \^ofixedfreq_io\
    );
oFixedFreq_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => oFixedFreq_carry_n_0,
      CO(2) => oFixedFreq_carry_n_1,
      CO(1) => oFixedFreq_carry_n_2,
      CO(0) => oFixedFreq_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_oFixedFreq_carry_O_UNCONNECTED(3 downto 0),
      S(3) => oFixedFreq_carry_i_1_n_0,
      S(2) => oFixedFreq_carry_i_2_n_0,
      S(1) => oFixedFreq_carry_i_3_n_0,
      S(0) => oFixedFreq_carry_i_4_n_0
    );
\oFixedFreq_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => oFixedFreq_carry_n_0,
      CO(3) => \oFixedFreq_carry__0_n_0\,
      CO(2) => \oFixedFreq_carry__0_n_1\,
      CO(1) => \oFixedFreq_carry__0_n_2\,
      CO(0) => \oFixedFreq_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_oFixedFreq_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \oFixedFreq_carry__0_i_1_n_0\,
      S(2) => \oFixedFreq_carry__0_i_2_n_0\,
      S(1) => \oFixedFreq_carry__0_i_3_n_0\,
      S(0) => \oFixedFreq_carry__0_i_4_n_0\
    );
\oFixedFreq_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(23),
      I1 => CNT(22),
      I2 => CNT(21),
      O => \oFixedFreq_carry__0_i_1_n_0\
    );
\oFixedFreq_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(20),
      I1 => CNT(19),
      I2 => CNT(18),
      O => \oFixedFreq_carry__0_i_2_n_0\
    );
\oFixedFreq_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(17),
      I1 => CNT(16),
      I2 => CNT(15),
      O => \oFixedFreq_carry__0_i_3_n_0\
    );
\oFixedFreq_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000010000FE"
    )
        port map (
      I0 => iSelect(2),
      I1 => iSelect(0),
      I2 => iSelect(1),
      I3 => CNT(14),
      I4 => CNT(13),
      I5 => CNT(12),
      O => \oFixedFreq_carry__0_i_4_n_0\
    );
\oFixedFreq_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \oFixedFreq_carry__0_n_0\,
      CO(3) => \NLW_oFixedFreq_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \^ofixedfreq\,
      CO(1) => \oFixedFreq_carry__1_n_2\,
      CO(0) => \oFixedFreq_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_oFixedFreq_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \oFixedFreq_carry__1_i_1_n_0\,
      S(1) => \oFixedFreq_carry__1_i_2_n_0\,
      S(0) => \oFixedFreq_carry__1_i_3_n_0\
    );
\oFixedFreq_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT(30),
      I1 => CNT(31),
      O => \oFixedFreq_carry__1_i_1_n_0\
    );
\oFixedFreq_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(29),
      I1 => CNT(28),
      I2 => CNT(27),
      O => \oFixedFreq_carry__1_i_2_n_0\
    );
\oFixedFreq_carry__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(26),
      I1 => CNT(25),
      I2 => CNT(24),
      O => \oFixedFreq_carry__1_i_3_n_0\
    );
oFixedFreq_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT(11),
      I1 => CNT(10),
      I2 => CNT(9),
      O => oFixedFreq_carry_i_1_n_0
    );
oFixedFreq_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001002000005544"
    )
        port map (
      I0 => CNT(6),
      I1 => iSelect(2),
      I2 => iSelect(0),
      I3 => iSelect(1),
      I4 => CNT(8),
      I5 => CNT(7),
      O => oFixedFreq_carry_i_2_n_0
    );
oFixedFreq_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02A800A800000200"
    )
        port map (
      I0 => CNT(3),
      I1 => iSelect(2),
      I2 => iSelect(1),
      I3 => CNT(5),
      I4 => iSelect(0),
      I5 => CNT(4),
      O => oFixedFreq_carry_i_3_n_0
    );
oFixedFreq_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000022202221"
    )
        port map (
      I0 => CNT(0),
      I1 => CNT(2),
      I2 => iSelect(1),
      I3 => iSelect(2),
      I4 => iSelect(0),
      I5 => CNT(1),
      O => oFixedFreq_carry_i_4_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZTest_Generator_0_0 is
  port (
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iSelect : in STD_LOGIC_VECTOR ( 2 downto 0 );
    oFixedFreq : out STD_LOGIC;
    oFixedFreq_IO : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZPhotonDetector_Block_ZTest_Generator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZPhotonDetector_Block_ZTest_Generator_0_0 : entity is "ZPhotonDetector_Block_ZTest_Generator_0_0,ZTest_Generator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZPhotonDetector_Block_ZTest_Generator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ZPhotonDetector_Block_ZTest_Generator_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZPhotonDetector_Block_ZTest_Generator_0_0 : entity is "ZTest_Generator,Vivado 2023.1";
end ZPhotonDetector_Block_ZTest_Generator_0_0;

architecture STRUCTURE of ZPhotonDetector_Block_ZTest_Generator_0_0 is
begin
inst: entity work.ZPhotonDetector_Block_ZTest_Generator_0_0_ZTest_Generator
     port map (
      iClk => iClk,
      iEn => iEn,
      iRst_N => iRst_N,
      iSelect(2 downto 0) => iSelect(2 downto 0),
      oFixedFreq => oFixedFreq,
      oFixedFreq_IO => oFixedFreq_IO
    );
end STRUCTURE;