-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Tue Oct 24 10:56:55 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZEdge_Detect_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZEdge_Detect_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect is
  port (
    oSig_Rising : out STD_LOGIC;
    oSig_Falling : out STD_LOGIC;
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iSig_In : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect is
  signal sig_delay1 : STD_LOGIC;
  signal sig_delay10_out : STD_LOGIC;
  signal sig_delay1_i_2_n_0 : STD_LOGIC;
  signal sig_delay2 : STD_LOGIC;
  signal sig_delay2_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of oSig_Falling_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of oSig_Rising_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of sig_delay1_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of sig_delay2_i_1 : label is "soft_lutpair0";
begin
oSig_Falling_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sig_delay2_reg_n_0,
      I1 => sig_delay1,
      O => oSig_Falling
    );
oSig_Rising_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sig_delay1,
      I1 => sig_delay2_reg_n_0,
      O => oSig_Rising
    );
sig_delay1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => iEn,
      I1 => iSig_In,
      O => sig_delay10_out
    );
sig_delay1_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => iRst_N,
      O => sig_delay1_i_2_n_0
    );
sig_delay1_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => sig_delay1_i_2_n_0,
      D => sig_delay10_out,
      Q => sig_delay1
    );
sig_delay2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => iEn,
      I1 => sig_delay1,
      O => sig_delay2
    );
sig_delay2_reg: unisim.vcomponents.FDCE
     port map (
      C => iClk,
      CE => '1',
      CLR => sig_delay1_i_2_n_0,
      D => sig_delay2,
      Q => sig_delay2_reg_n_0
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
    iSig_In : in STD_LOGIC;
    oSig_Rising : out STD_LOGIC;
    oSig_Falling : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZPhotonDetector_Block_ZEdge_Detect_0_0,ZEdge_Detect,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ZEdge_Detect,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect
     port map (
      iClk => iClk,
      iEn => iEn,
      iRst_N => iRst_N,
      iSig_In => iSig_In,
      oSig_Falling => oSig_Falling,
      oSig_Rising => oSig_Rising
    );
end STRUCTURE;
