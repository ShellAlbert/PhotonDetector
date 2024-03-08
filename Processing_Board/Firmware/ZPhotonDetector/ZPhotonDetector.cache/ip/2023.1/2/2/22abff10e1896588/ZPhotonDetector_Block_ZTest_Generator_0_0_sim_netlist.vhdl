-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Wed Oct 25 15:04:18 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZTest_Generator_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZTest_Generator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator is
  port (
    oFixedFreq : out STD_LOGIC;
    iSelect : in STD_LOGIC_VECTOR ( 2 downto 0 );
    iRst_N : in STD_LOGIC;
    iClk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator is
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
  signal \CNT[0]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[0]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[0]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[0]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[0]_i_6_n_0\ : STD_LOGIC;
  signal \CNT[12]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[12]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[12]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[12]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[16]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[16]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[16]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[16]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[20]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[20]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[20]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[20]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[24]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[24]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[24]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[24]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[28]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[28]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[28]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[28]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[4]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[4]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[4]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[4]_i_5_n_0\ : STD_LOGIC;
  signal \CNT[8]_i_2_n_0\ : STD_LOGIC;
  signal \CNT[8]_i_3_n_0\ : STD_LOGIC;
  signal \CNT[8]_i_4_n_0\ : STD_LOGIC;
  signal \CNT[8]_i_5_n_0\ : STD_LOGIC;
  signal CNT_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \CNT_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \CNT_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal load : STD_LOGIC;
  signal \^ofixedfreq\ : STD_LOGIC;
  signal oFixedFreq_i_1_n_0 : STD_LOGIC;
  signal oFixedFreq_i_2_n_0 : STD_LOGIC;
  signal NLW_CNT1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT1_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_CNT1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CNT_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \CNT_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \CNT_reg[8]_i_1\ : label is 11;
begin
  oFixedFreq <= \^ofixedfreq\;
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
\CNT1_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(23),
      I1 => CNT_reg(22),
      I2 => CNT_reg(21),
      O => \CNT1_carry__0_i_1_n_0\
    );
\CNT1_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(20),
      I1 => CNT_reg(19),
      I2 => CNT_reg(18),
      O => \CNT1_carry__0_i_2_n_0\
    );
\CNT1_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(17),
      I1 => CNT_reg(16),
      I2 => CNT_reg(15),
      O => \CNT1_carry__0_i_3_n_0\
    );
\CNT1_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000010000FE"
    )
        port map (
      I0 => iSelect(2),
      I1 => iSelect(0),
      I2 => iSelect(1),
      I3 => CNT_reg(14),
      I4 => CNT_reg(13),
      I5 => CNT_reg(12),
      O => \CNT1_carry__0_i_4_n_0\
    );
\CNT1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT1_carry__0_n_0\,
      CO(3) => \NLW_CNT1_carry__1_CO_UNCONNECTED\(3),
      CO(2) => load,
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
      I0 => CNT_reg(30),
      I1 => CNT_reg(31),
      O => \CNT1_carry__1_i_1_n_0\
    );
\CNT1_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(29),
      I1 => CNT_reg(28),
      I2 => CNT_reg(27),
      O => \CNT1_carry__1_i_2_n_0\
    );
\CNT1_carry__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(26),
      I1 => CNT_reg(25),
      I2 => CNT_reg(24),
      O => \CNT1_carry__1_i_3_n_0\
    );
CNT1_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => CNT_reg(11),
      I1 => CNT_reg(10),
      I2 => CNT_reg(9),
      O => CNT1_carry_i_1_n_0
    );
CNT1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001002000005544"
    )
        port map (
      I0 => CNT_reg(6),
      I1 => iSelect(2),
      I2 => iSelect(0),
      I3 => iSelect(1),
      I4 => CNT_reg(8),
      I5 => CNT_reg(7),
      O => CNT1_carry_i_2_n_0
    );
CNT1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02A800A800000200"
    )
        port map (
      I0 => CNT_reg(3),
      I1 => iSelect(2),
      I2 => iSelect(1),
      I3 => CNT_reg(5),
      I4 => iSelect(0),
      I5 => CNT_reg(4),
      O => CNT1_carry_i_3_n_0
    );
CNT1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000022202221"
    )
        port map (
      I0 => CNT_reg(0),
      I1 => CNT_reg(2),
      I2 => iSelect(1),
      I3 => iSelect(2),
      I4 => iSelect(0),
      I5 => CNT_reg(1),
      O => CNT1_carry_i_4_n_0
    );
\CNT[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(0),
      I1 => load,
      O => \CNT[0]_i_2_n_0\
    );
\CNT[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(3),
      I1 => load,
      O => \CNT[0]_i_3_n_0\
    );
\CNT[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(2),
      I1 => load,
      O => \CNT[0]_i_4_n_0\
    );
\CNT[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(1),
      I1 => load,
      O => \CNT[0]_i_5_n_0\
    );
\CNT[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CNT_reg(0),
      I1 => load,
      O => \CNT[0]_i_6_n_0\
    );
\CNT[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(15),
      I1 => load,
      O => \CNT[12]_i_2_n_0\
    );
\CNT[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(14),
      I1 => load,
      O => \CNT[12]_i_3_n_0\
    );
\CNT[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(13),
      I1 => load,
      O => \CNT[12]_i_4_n_0\
    );
\CNT[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(12),
      I1 => load,
      O => \CNT[12]_i_5_n_0\
    );
\CNT[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(19),
      I1 => load,
      O => \CNT[16]_i_2_n_0\
    );
\CNT[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(18),
      I1 => load,
      O => \CNT[16]_i_3_n_0\
    );
\CNT[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(17),
      I1 => load,
      O => \CNT[16]_i_4_n_0\
    );
\CNT[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(16),
      I1 => load,
      O => \CNT[16]_i_5_n_0\
    );
\CNT[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(23),
      I1 => load,
      O => \CNT[20]_i_2_n_0\
    );
\CNT[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(22),
      I1 => load,
      O => \CNT[20]_i_3_n_0\
    );
\CNT[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(21),
      I1 => load,
      O => \CNT[20]_i_4_n_0\
    );
\CNT[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(20),
      I1 => load,
      O => \CNT[20]_i_5_n_0\
    );
\CNT[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(27),
      I1 => load,
      O => \CNT[24]_i_2_n_0\
    );
\CNT[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(26),
      I1 => load,
      O => \CNT[24]_i_3_n_0\
    );
\CNT[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(25),
      I1 => load,
      O => \CNT[24]_i_4_n_0\
    );
\CNT[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(24),
      I1 => load,
      O => \CNT[24]_i_5_n_0\
    );
\CNT[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(31),
      I1 => load,
      O => \CNT[28]_i_2_n_0\
    );
\CNT[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(30),
      I1 => load,
      O => \CNT[28]_i_3_n_0\
    );
\CNT[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(29),
      I1 => load,
      O => \CNT[28]_i_4_n_0\
    );
\CNT[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(28),
      I1 => load,
      O => \CNT[28]_i_5_n_0\
    );
\CNT[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(7),
      I1 => load,
      O => \CNT[4]_i_2_n_0\
    );
\CNT[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(6),
      I1 => load,
      O => \CNT[4]_i_3_n_0\
    );
\CNT[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(5),
      I1 => load,
      O => \CNT[4]_i_4_n_0\
    );
\CNT[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(4),
      I1 => load,
      O => \CNT[4]_i_5_n_0\
    );
\CNT[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(11),
      I1 => load,
      O => \CNT[8]_i_2_n_0\
    );
\CNT[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(10),
      I1 => load,
      O => \CNT[8]_i_3_n_0\
    );
\CNT[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(9),
      I1 => load,
      O => \CNT[8]_i_4_n_0\
    );
\CNT[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CNT_reg(8),
      I1 => load,
      O => \CNT[8]_i_5_n_0\
    );
\CNT_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[0]_i_1_n_7\,
      Q => CNT_reg(0)
    );
\CNT_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \CNT_reg[0]_i_1_n_0\,
      CO(2) => \CNT_reg[0]_i_1_n_1\,
      CO(1) => \CNT_reg[0]_i_1_n_2\,
      CO(0) => \CNT_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \CNT[0]_i_2_n_0\,
      O(3) => \CNT_reg[0]_i_1_n_4\,
      O(2) => \CNT_reg[0]_i_1_n_5\,
      O(1) => \CNT_reg[0]_i_1_n_6\,
      O(0) => \CNT_reg[0]_i_1_n_7\,
      S(3) => \CNT[0]_i_3_n_0\,
      S(2) => \CNT[0]_i_4_n_0\,
      S(1) => \CNT[0]_i_5_n_0\,
      S(0) => \CNT[0]_i_6_n_0\
    );
\CNT_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[8]_i_1_n_5\,
      Q => CNT_reg(10)
    );
\CNT_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[8]_i_1_n_4\,
      Q => CNT_reg(11)
    );
\CNT_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[12]_i_1_n_7\,
      Q => CNT_reg(12)
    );
\CNT_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[8]_i_1_n_0\,
      CO(3) => \CNT_reg[12]_i_1_n_0\,
      CO(2) => \CNT_reg[12]_i_1_n_1\,
      CO(1) => \CNT_reg[12]_i_1_n_2\,
      CO(0) => \CNT_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[12]_i_1_n_4\,
      O(2) => \CNT_reg[12]_i_1_n_5\,
      O(1) => \CNT_reg[12]_i_1_n_6\,
      O(0) => \CNT_reg[12]_i_1_n_7\,
      S(3) => \CNT[12]_i_2_n_0\,
      S(2) => \CNT[12]_i_3_n_0\,
      S(1) => \CNT[12]_i_4_n_0\,
      S(0) => \CNT[12]_i_5_n_0\
    );
\CNT_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[12]_i_1_n_6\,
      Q => CNT_reg(13)
    );
\CNT_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[12]_i_1_n_5\,
      Q => CNT_reg(14)
    );
\CNT_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[12]_i_1_n_4\,
      Q => CNT_reg(15)
    );
\CNT_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[16]_i_1_n_7\,
      Q => CNT_reg(16)
    );
\CNT_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[12]_i_1_n_0\,
      CO(3) => \CNT_reg[16]_i_1_n_0\,
      CO(2) => \CNT_reg[16]_i_1_n_1\,
      CO(1) => \CNT_reg[16]_i_1_n_2\,
      CO(0) => \CNT_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[16]_i_1_n_4\,
      O(2) => \CNT_reg[16]_i_1_n_5\,
      O(1) => \CNT_reg[16]_i_1_n_6\,
      O(0) => \CNT_reg[16]_i_1_n_7\,
      S(3) => \CNT[16]_i_2_n_0\,
      S(2) => \CNT[16]_i_3_n_0\,
      S(1) => \CNT[16]_i_4_n_0\,
      S(0) => \CNT[16]_i_5_n_0\
    );
\CNT_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[16]_i_1_n_6\,
      Q => CNT_reg(17)
    );
\CNT_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[16]_i_1_n_5\,
      Q => CNT_reg(18)
    );
\CNT_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[16]_i_1_n_4\,
      Q => CNT_reg(19)
    );
\CNT_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[0]_i_1_n_6\,
      Q => CNT_reg(1)
    );
\CNT_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[20]_i_1_n_7\,
      Q => CNT_reg(20)
    );
\CNT_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[16]_i_1_n_0\,
      CO(3) => \CNT_reg[20]_i_1_n_0\,
      CO(2) => \CNT_reg[20]_i_1_n_1\,
      CO(1) => \CNT_reg[20]_i_1_n_2\,
      CO(0) => \CNT_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[20]_i_1_n_4\,
      O(2) => \CNT_reg[20]_i_1_n_5\,
      O(1) => \CNT_reg[20]_i_1_n_6\,
      O(0) => \CNT_reg[20]_i_1_n_7\,
      S(3) => \CNT[20]_i_2_n_0\,
      S(2) => \CNT[20]_i_3_n_0\,
      S(1) => \CNT[20]_i_4_n_0\,
      S(0) => \CNT[20]_i_5_n_0\
    );
\CNT_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[20]_i_1_n_6\,
      Q => CNT_reg(21)
    );
\CNT_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[20]_i_1_n_5\,
      Q => CNT_reg(22)
    );
\CNT_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[20]_i_1_n_4\,
      Q => CNT_reg(23)
    );
\CNT_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[24]_i_1_n_7\,
      Q => CNT_reg(24)
    );
\CNT_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[20]_i_1_n_0\,
      CO(3) => \CNT_reg[24]_i_1_n_0\,
      CO(2) => \CNT_reg[24]_i_1_n_1\,
      CO(1) => \CNT_reg[24]_i_1_n_2\,
      CO(0) => \CNT_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[24]_i_1_n_4\,
      O(2) => \CNT_reg[24]_i_1_n_5\,
      O(1) => \CNT_reg[24]_i_1_n_6\,
      O(0) => \CNT_reg[24]_i_1_n_7\,
      S(3) => \CNT[24]_i_2_n_0\,
      S(2) => \CNT[24]_i_3_n_0\,
      S(1) => \CNT[24]_i_4_n_0\,
      S(0) => \CNT[24]_i_5_n_0\
    );
\CNT_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[24]_i_1_n_6\,
      Q => CNT_reg(25)
    );
\CNT_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[24]_i_1_n_5\,
      Q => CNT_reg(26)
    );
\CNT_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[24]_i_1_n_4\,
      Q => CNT_reg(27)
    );
\CNT_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[28]_i_1_n_7\,
      Q => CNT_reg(28)
    );
\CNT_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[24]_i_1_n_0\,
      CO(3) => \NLW_CNT_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \CNT_reg[28]_i_1_n_1\,
      CO(1) => \CNT_reg[28]_i_1_n_2\,
      CO(0) => \CNT_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[28]_i_1_n_4\,
      O(2) => \CNT_reg[28]_i_1_n_5\,
      O(1) => \CNT_reg[28]_i_1_n_6\,
      O(0) => \CNT_reg[28]_i_1_n_7\,
      S(3) => \CNT[28]_i_2_n_0\,
      S(2) => \CNT[28]_i_3_n_0\,
      S(1) => \CNT[28]_i_4_n_0\,
      S(0) => \CNT[28]_i_5_n_0\
    );
\CNT_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[28]_i_1_n_6\,
      Q => CNT_reg(29)
    );
\CNT_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[0]_i_1_n_5\,
      Q => CNT_reg(2)
    );
\CNT_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[28]_i_1_n_5\,
      Q => CNT_reg(30)
    );
\CNT_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[28]_i_1_n_4\,
      Q => CNT_reg(31)
    );
\CNT_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[0]_i_1_n_4\,
      Q => CNT_reg(3)
    );
\CNT_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[4]_i_1_n_7\,
      Q => CNT_reg(4)
    );
\CNT_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[0]_i_1_n_0\,
      CO(3) => \CNT_reg[4]_i_1_n_0\,
      CO(2) => \CNT_reg[4]_i_1_n_1\,
      CO(1) => \CNT_reg[4]_i_1_n_2\,
      CO(0) => \CNT_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[4]_i_1_n_4\,
      O(2) => \CNT_reg[4]_i_1_n_5\,
      O(1) => \CNT_reg[4]_i_1_n_6\,
      O(0) => \CNT_reg[4]_i_1_n_7\,
      S(3) => \CNT[4]_i_2_n_0\,
      S(2) => \CNT[4]_i_3_n_0\,
      S(1) => \CNT[4]_i_4_n_0\,
      S(0) => \CNT[4]_i_5_n_0\
    );
\CNT_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[4]_i_1_n_6\,
      Q => CNT_reg(5)
    );
\CNT_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[4]_i_1_n_5\,
      Q => CNT_reg(6)
    );
\CNT_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[4]_i_1_n_4\,
      Q => CNT_reg(7)
    );
\CNT_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[8]_i_1_n_7\,
      Q => CNT_reg(8)
    );
\CNT_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \CNT_reg[4]_i_1_n_0\,
      CO(3) => \CNT_reg[8]_i_1_n_0\,
      CO(2) => \CNT_reg[8]_i_1_n_1\,
      CO(1) => \CNT_reg[8]_i_1_n_2\,
      CO(0) => \CNT_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \CNT_reg[8]_i_1_n_4\,
      O(2) => \CNT_reg[8]_i_1_n_5\,
      O(1) => \CNT_reg[8]_i_1_n_6\,
      O(0) => \CNT_reg[8]_i_1_n_7\,
      S(3) => \CNT[8]_i_2_n_0\,
      S(2) => \CNT[8]_i_3_n_0\,
      S(1) => \CNT[8]_i_4_n_0\,
      S(0) => \CNT[8]_i_5_n_0\
    );
\CNT_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => \CNT_reg[8]_i_1_n_6\,
      Q => CNT_reg(9)
    );
oFixedFreq_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => load,
      I1 => \^ofixedfreq\,
      O => oFixedFreq_i_1_n_0
    );
oFixedFreq_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => oFixedFreq_i_2_n_0
    );
oFixedFreq_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => oFixedFreq_i_2_n_0,
      D => oFixedFreq_i_1_n_0,
      Q => \^ofixedfreq\
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
    iSelect : in STD_LOGIC_VECTOR ( 2 downto 0 );
    oFixedFreq : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZPhotonDetector_Block_ZTest_Generator_0_0,ZTest_Generator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZTest_Generator,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZTest_Generator
     port map (
      iClk => iClk,
      iRst_N => iRst_N,
      iSelect(2 downto 0) => iSelect(2 downto 0),
      oFixedFreq => oFixedFreq
    );
end STRUCTURE;
