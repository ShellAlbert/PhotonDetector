
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /ZM9K_SIN_tb/status
      waveform add -signals /ZM9K_SIN_tb/ZM9K_SIN_synth_inst/bmg_port/CLKA
      waveform add -signals /ZM9K_SIN_tb/ZM9K_SIN_synth_inst/bmg_port/ADDRA
      waveform add -signals /ZM9K_SIN_tb/ZM9K_SIN_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
