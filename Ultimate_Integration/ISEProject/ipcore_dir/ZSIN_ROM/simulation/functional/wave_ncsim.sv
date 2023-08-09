

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ZSIN_ROM_tb/status
      waveform add -signals /ZSIN_ROM_tb/ZSIN_ROM_synth_inst/bmg_port/CLKA
      waveform add -signals /ZSIN_ROM_tb/ZSIN_ROM_synth_inst/bmg_port/ADDRA
      waveform add -signals /ZSIN_ROM_tb/ZSIN_ROM_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
