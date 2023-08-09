

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ZROM_ExtSyncLost_tb/status
      waveform add -signals /ZROM_ExtSyncLost_tb/ZROM_ExtSyncLost_synth_inst/bmg_port/CLKA
      waveform add -signals /ZROM_ExtSyncLost_tb/ZROM_ExtSyncLost_synth_inst/bmg_port/ADDRA
      waveform add -signals /ZROM_ExtSyncLost_tb/ZROM_ExtSyncLost_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
