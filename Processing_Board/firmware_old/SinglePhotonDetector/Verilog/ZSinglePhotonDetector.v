module ZSinglePhotonDector(
//the external main clock.
//CLK_100MHz(H3)
input iClk, 

//Debug LED.
//LED1(H11),LED2(D3)
output wire [1:0] oLED,

//To enable Sensor Board Power Supply.
//HVPS_EN(F11),AUX_PWR_EN(C3)
output oHVPS_En,
output oAux_Pwr_En,

//I2C ADC.
//I2C_SDA(C4), I2C_SCL(D4)
output oI2C_SCL,
inout ioI2C_SDA,

//SAPD quench logic.
//QUENCH(N1), RST_DIS(P2)
//PULSE(P3),PULSE2(M3)
output oQuench_Voltage_Down,
output oReset_Discharge,
input iPulse,
input iPulse2,

//RS485-1.
//TXD(L1),RXD(M1),DIR(L2)
output oRS485_Dir1,
output oRS485_Txd1,
input iRS485_Rxd1,
//RS485-2.
//TXD2(C5), RXD2(A5), DIR2(B5)
output oRS485_Dir2,
output oRS485_Txd2,
input iRS485_Rxd2,

//Interaction Key Input.
//iKey[0]=iKey_Prev(L3),
//iKey[1]=iKey_Next(M2),
//iKey[2]=iKey_Okay(K3),
//iKey[3]=iKey_Pause(J3).
input [3:0] iKey,

//Serial DDR Interface.
//S_RST(B2),S_CS(B1),S_CLK(B3),S_RWDS(C1)
//S_DQ0(F2),S_DQ1(F3),S_DQ2(D2),S_DQ3(E2),S_DQ4(D1),S_DQ5(F1),S_DQ6(G1),S_DQ7(H2)
output oSerDDR_RST,
output oSerDDR_CS,
output oSerDDR_CLK,
output oSerDDR_RWDS,
inout wire [7:0] ioSerDDR_DQ,

//Parallel DDR Interface.
//A0(B13),A1(A13),A2(D12),A3(E11),A4(J11),A5(J12),A6(G11),A7(L12),A8(K11),A9(N11),A10(E12),A11(C12)
//CS(P12),WE(M10),RAS(P10),CAS(N10),CLK(M12),CKE(M11)
//BA0(P11),BA1(F12)
//DQM0(J14),DQM1(H4),DQM2(H13),DQM3(F4)
//DQ0(M13),DQ1(L13),DQ2(N14),DQ3(M14),DQ4(P13),DQ5(L14),DQ6(K12),DQ7(J13),
//DQ8(J4),DQ9(K4),DQ10(L5),DQ11(P5),DQ12(M5),DQ13(P4),DQ14(M4),DQ15(N4),
//DQ16(H14),DQ17(H12),DQ18(G14),DQ19(D14),DQ20(F14),DQ21(D13),DQ22(F13),DQ23(E13),
//DQ24(A12),DQ25(B6),DQ26(B14),DQ27(C14),DQ28(C10),DQ29(D10),DQ30(A10),DQ31(E4).
output ParDDR_WE,
output ParDDR_CS,
output ParDDR_CAS,
output ParDDR_RAS,
output ParDDR_CKE,
output ParDDR_CLK,
output wire [1:0] ParDDR_BA,
output wire [3:0] ParDDR_DQM,
output wire [11:0] ParDDR_A,
output wire [31:0] ParDDR_D,

//IO Reserved for Wireless Communication.
//IO_A2(A2),IO_A3(A3),IO_A4(A4),IO_J1(J1),IO_J2(J2),IO_H1(H1)
output oIO_A2,oIO_A3,oIO_A4,oIO_H1,oIO_J1,oIO_J2);

wire clk_pll1;
wire clk_pll2;
wire reset_n;
  clk_wiz_0 my_pll
   (
    // Clock out ports
    .clk_out1(clk_pll1),     // output clk_out1
    .clk_out2(clk_pll2),     // output clk_out2
    // Status and control signals
    .locked(reset_n),       // output locked
   // Clock in ports
    .clk_in1(iClk)      // input clk_in1
);

//LED Module.
ZLed_Indicator u1_ZLed_Indicator(
.iClk(clk_pll1),
.iRst_N(reset_n),
.oLed(oLed));

//Ext Pulse Counter & Upload.
ZExt_Pulse u1_ZExt_Pulse(
.iClk(clk_pll1),
.iRst_N(reset_n),
.iExtPulse(iPulse), //External Pulse at the Physical Pin.

.oTxd(oRS485_Txd));


endmodule
