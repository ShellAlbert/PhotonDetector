#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=F:/MySoftware/Xilinx/Vitis/2023.1/bin;F:/MySoftware/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;F:/MySoftware/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:F:/MySoftware/Xilinx/Vivado/2023.1/bin
else
  PATH=F:/MySoftware/Xilinx/Vitis/2023.1/bin;F:/MySoftware/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;F:/MySoftware/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:F:/MySoftware/Xilinx/Vivado/2023.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='F:/MyTemporary/Github/PhotonDetector/Processing_Board/Firmware/ZPhotonDetector/ZPhotonDetector.runs/ZPhotonDetector_Block_ZExtSig_Simulator_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log ZPhotonDetector_Block_ZExtSig_Simulator_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source ZPhotonDetector_Block_ZExtSig_Simulator_0_0.tcl