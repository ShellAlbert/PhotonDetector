// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Oct 25 09:07:12 2023
// Host        : DESKTOP-R1EC6M9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZPhotonDetector_Block_ZEdge_Detect_0_0_sim_netlist.v
// Design      : ZPhotonDetector_Block_ZEdge_Detect_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25ftgb196-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect
   (oSig_Rising,
    oSig_Falling,
    iClk,
    iRst_N,
    iEn,
    iSig_In);
  output oSig_Rising;
  output oSig_Falling;
  input iClk;
  input iRst_N;
  input iEn;
  input iSig_In;

  wire iClk;
  wire iEn;
  wire iRst_N;
  wire iSig_In;
  wire oSig_Falling;
  wire oSig_Rising;
  wire sig_delay1;
  wire sig_delay10_out;
  wire sig_delay1_i_2_n_0;
  wire sig_delay2;
  wire sig_delay2_reg_n_0;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    oSig_Falling_INST_0
       (.I0(sig_delay2_reg_n_0),
        .I1(sig_delay1),
        .O(oSig_Falling));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    oSig_Rising_INST_0
       (.I0(sig_delay1),
        .I1(sig_delay2_reg_n_0),
        .O(oSig_Rising));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sig_delay1_i_1
       (.I0(iEn),
        .I1(iSig_In),
        .O(sig_delay10_out));
  LUT1 #(
    .INIT(2'h1)) 
    sig_delay1_i_2
       (.I0(iRst_N),
        .O(sig_delay1_i_2_n_0));
  FDCE sig_delay1_reg
       (.C(iClk),
        .CE(1'b1),
        .CLR(sig_delay1_i_2_n_0),
        .D(sig_delay10_out),
        .Q(sig_delay1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sig_delay2_i_1
       (.I0(iEn),
        .I1(sig_delay1),
        .O(sig_delay2));
  FDCE sig_delay2_reg
       (.C(iClk),
        .CE(1'b1),
        .CLR(sig_delay1_i_2_n_0),
        .D(sig_delay2),
        .Q(sig_delay2_reg_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "ZPhotonDetector_Block_ZEdge_Detect_0_0,ZEdge_Detect,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ZEdge_Detect,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (iClk,
    iRst_N,
    iEn,
    iSig_In,
    oSig_Rising,
    oSig_Falling);
  input iClk;
  input iRst_N;
  input iEn;
  input iSig_In;
  output oSig_Rising;
  output oSig_Falling;

  wire iClk;
  wire iEn;
  wire iRst_N;
  wire iSig_In;
  wire oSig_Falling;
  wire oSig_Rising;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ZEdge_Detect inst
       (.iClk(iClk),
        .iEn(iEn),
        .iRst_N(iRst_N),
        .iSig_In(iSig_In),
        .oSig_Falling(oSig_Falling),
        .oSig_Rising(oSig_Rising));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
