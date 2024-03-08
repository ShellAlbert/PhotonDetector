transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {F:/MyTemporary/Github/PhotonDetector/Processing_Board/firmware/SinglePhotonDetector/SinglePhotonDetector.cache/compile_simlib/activehdl}
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../SinglePhotonDetector.gen/sources_1/ip/clk_wiz_0" -l xpm \
"F:/MySoftware/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"F:/MySoftware/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

