-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Wed Oct 25 10:34:32 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZMux2to1_0_0/ZPhotonDetector_Block_ZMux2to1_0_0_sim_netlist.vhdl
-- Design      : ZPhotonDetector_Block_ZMux2to1_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZPhotonDetector_Block_ZMux2to1_0_0 is
  port (
    iSig1 : in STD_LOGIC;
    iSig2 : in STD_LOGIC;
    oSig : out STD_LOGIC;
    iSel : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZPhotonDetector_Block_ZMux2to1_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZPhotonDetector_Block_ZMux2to1_0_0 : entity is "ZPhotonDetector_Block_ZMux2to1_0_0,ZMux2to1,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZPhotonDetector_Block_ZMux2to1_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ZPhotonDetector_Block_ZMux2to1_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZPhotonDetector_Block_ZMux2to1_0_0 : entity is "ZMux2to1,Vivado 2023.1";
end ZPhotonDetector_Block_ZMux2to1_0_0;

architecture STRUCTURE of ZPhotonDetector_Block_ZMux2to1_0_0 is
begin
oSig_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => iSig2,
      I1 => iSel,
      I2 => iSig1,
      O => oSig
    );
end STRUCTURE;
