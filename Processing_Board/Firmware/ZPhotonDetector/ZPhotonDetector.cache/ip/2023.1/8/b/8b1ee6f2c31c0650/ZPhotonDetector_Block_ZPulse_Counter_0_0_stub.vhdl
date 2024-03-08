-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Tue Oct 24 10:54:57 2023
-- Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZPulse_Counter_0_0_stub.vhdl
-- Design      : ZPhotonDetector_Block_ZPulse_Counter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    iClk : in STD_LOGIC;
    iRst_N : in STD_LOGIC;
    iEn : in STD_LOGIC;
    iPulse : in STD_LOGIC;
    iTimeInterval : in STD_LOGIC_VECTOR ( 7 downto 0 );
    oNewPulseCounter : out STD_LOGIC_VECTOR ( 15 downto 0 );
    oNewDataUpdate : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "iClk,iRst_N,iEn,iPulse,iTimeInterval[7:0],oNewPulseCounter[15:0],oNewDataUpdate";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ZPulse_Counter,Vivado 2023.1";
begin
end;
