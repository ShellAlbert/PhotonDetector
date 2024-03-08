-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Fri Nov 10 14:48:01 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZVerilog/ZBlocks/ZPhotonDetector_Block/ip/ZPhotonDetector_Block_ZExtSig_Simulator_0_0/ZPhotonDetector_Block_ZExtSig_Simulator_0_0_stub.vhdl
-- Design      : ZPhotonDetector_Block_ZExtSig_Simulator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZPhotonDetector_Block_ZExtSig_Simulator_0_0 is
  Port ( 
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    oTest_Mode : out STD_LOGIC;
    oFixedFreq_Sel : out STD_LOGIC_VECTOR ( 2 downto 0 );
    oTime_Interval : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end ZPhotonDetector_Block_ZExtSig_Simulator_0_0;

architecture stub of ZPhotonDetector_Block_ZExtSig_Simulator_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "iClk,iRst_N,oTest_Mode,oFixedFreq_Sel[2:0],oTime_Interval[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ZExtSig_Simulator,Vivado 2023.1";
begin
end;
