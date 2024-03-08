-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Fri Nov 10 14:48:01 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZExtSig_Simulator_0_0/ZPhotonDetector_Block_ZExtSig_Simulator_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZExtSig_Simulator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZExtSig_Simulator_0_0 is
  port (
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    oTest_Mode : out STD_LOGIC;
    oFixedFreq_Sel : out STD_LOGIC_VECTOR ( 2 downto 0 );
    oTime_Interval : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 : entity is "ZPhotonDetector_Block_ZExtSig_Simulator_0_0,ZExtSig_Simulator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 : entity is "ZExtSig_Simulator,Vivado 2023.1";
end ZPhotonDetector_Block_ZExtSig_Simulator_0_0;

architecture STRUCTURE of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  oFixedFreq_Sel(2) <= \<const0>\;
  oFixedFreq_Sel(1) <= \<const0>\;
  oFixedFreq_Sel(0) <= \<const0>\;
  oTest_Mode <= \<const1>\;
  oTime_Interval(7) <= \<const0>\;
  oTime_Interval(6) <= \<const0>\;
  oTime_Interval(5) <= \<const0>\;
  oTime_Interval(4) <= \<const0>\;
  oTime_Interval(3) <= \<const0>\;
  oTime_Interval(2) <= \<const1>\;
  oTime_Interval(1) <= \<const1>\;
  oTime_Interval(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
