////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : xaw2verilog
//  /   /         Filename : ZsyDCM.v
// /___/   /\     Timestamp : 10/27/2022 19:26:58
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st D:\Work\GitHub\SAPDXC\SAPDXC\ipcore_dir\.\ZsyDCM.xaw D:\Work\GitHub\SAPDXC\SAPDXC\ipcore_dir\.\ZsyDCM
//Design Name: ZsyDCM
//Device: xc3s50an-5tqg144
//
// Module ZsyDCM
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// Period Jitter (unit interval) for block DCM_SP_INST = 0.04 UI
// Period Jitter (Peak-to-Peak) for block DCM_SP_INST = 3.59 ns
`timescale 1ns / 1ps

module ZsyDCM(CLKIN_IN, 
              CLKFX_OUT, 
              CLKIN_IBUFG_OUT, 
              CLK0_OUT, 
              LOCKED_OUT);

    input CLKIN_IN;
   output CLKFX_OUT;
   output CLKIN_IBUFG_OUT;
   output CLK0_OUT;
   output LOCKED_OUT;
   
   wire CLKFB_IN;
   wire CLKFX_BUF;
   wire CLKIN_IBUFG;
   wire CLK0_BUF;
   wire GND_BIT;
   
   assign GND_BIT = 0;
   assign CLKIN_IBUFG_OUT = CLKIN_IBUFG;
   assign CLK0_OUT = CLKFB_IN;
   BUFG  CLKFX_BUFG_INST (.I(CLKFX_BUF), 
                         .O(CLKFX_OUT));
   IBUFG  CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG  CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   DCM_SP #( .CLK_FEEDBACK("1X"), .CLKDV_DIVIDE(2.0), .CLKFX_DIVIDE(20), 
         .CLKFX_MULTIPLY(2), .CLKIN_DIVIDE_BY_2("FALSE"), 
         .CLKIN_PERIOD(10.000), .CLKOUT_PHASE_SHIFT("NONE"), 
         .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), .DFS_FREQUENCY_MODE("LOW"), 
         .DLL_FREQUENCY_MODE("LOW"), .DUTY_CYCLE_CORRECTION("TRUE"), 
         .FACTORY_JF(16'hC080), .PHASE_SHIFT(0), .STARTUP_WAIT("FALSE") ) 
         DCM_SP_INST (.CLKFB(CLKFB_IN), 
                       .CLKIN(CLKIN_IBUFG), 
                       .DSSEN(GND_BIT), 
                       .PSCLK(GND_BIT), 
                       .PSEN(GND_BIT), 
                       .PSINCDEC(GND_BIT), 
                       .RST(GND_BIT), 
                       .CLKDV(), 
                       .CLKFX(CLKFX_BUF), 
                       .CLKFX180(), 
                       .CLK0(CLK0_BUF), 
                       .CLK2X(), 
                       .CLK2X180(), 
                       .CLK90(), 
                       .CLK180(), 
                       .CLK270(), 
                       .LOCKED(LOCKED_OUT), 
                       .PSDONE(), 
                       .STATUS());
endmodule
