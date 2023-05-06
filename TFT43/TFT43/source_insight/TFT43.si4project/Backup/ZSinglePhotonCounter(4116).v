`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:00 04/02/2023 
// Design Name: 
// Module Name:    ZSinglePhotonCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//SDRAM Testing///////////
//`define SDRAM_Test 1
//////////////////////////////////////////////
`ifdef SDRAM_Test
module ZSinglePhotonCounter(
    input clk,

	input photon_pulse, //E2, external photon pulse input pin.
	input sync_50Hz, //F2, External 50Hz Sync Signal.
	
	output photon_pulse_simulate, //E1, simulate signal to work as photon_pulse for testing.
	output sync_50Hz_simulate, //F1, simulate signal to work as sync_50Hz for testing.
	//use an oscilloscope to check how many clks were used.
    output clk_used, //E3, used to check time cost. 

	output reg uart_txd, //E4.
	
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA,

    //physical pins used to connect to SDRAM chip.
    output S_CLK,
    output S_CKE,
    output S_nCS,
    output S_nRAS,
    output S_nCAS,
    output S_nWE,
    output [12:0] S_A,
    output [1:0] S_BA,
    output [1:0] S_DQM,
    inout [15:0] S_DQ,

    //led.
    output reg led
    );

assign clk_used=0;
assign LCD_RST=0;
assign BL_CTR=0;
assign LCD_CS=0;
assign LCD_RS=0;
assign LCD_WR=0;
assign LCD_RD=0;
assign LCD_DATA=0;
assign photon_pulse_simulate=0;
assign sync_50Hz_simulate=0;

//On-board Clock=50MHz.
wire clk_133MHz_210;
wire clk_133MHz_0;
wire rst_n;
ZsyPLL ic_PLL (// Clock in ports
    .CLK_IN1(clk),      // IN
    // Clock out ports
    .clk_133MHz_210(clk_133MHz_210),     // OUT
    .clk_133MHz_0(clk_133MHz_0),     // OUT
    // Status and control signals
    .LOCKED(rst_n));      // OUT

//SDRAM IC CLK.
wire clk_to_sdram;
ODDR2 oddr2_inst(
.D0(1'b1),
.D1(1'b0),
.CE(1'b1),
.C0(clk_133MHz_0),
.C1(!clk_133MHz_0),
.R(1'b0),
.S(1'b0),
.Q(clk_to_sdram));
assign S_CLK=clk_to_sdram;

////////////////////////////////////////////////
reg [23:0] sdram_rw_addr; //SDRAM RW Address.
reg [1:0] sdram_rw_req; //SDRAM RW Request.

reg [15:0] sdram_in_data1; //Data write to SDRAM.
reg [15:0] sdram_in_data2;
reg [15:0] sdram_in_data3;
reg [15:0] sdram_in_data4;
wire [15:0] sdram_out_data1; //Data read from SDRAM.
wire [15:0] sdram_out_data2; 
wire [15:0] sdram_out_data3; 
wire [15:0] sdram_out_data4; 

wire sdram_wr_done;
wire sdram_rd_done;
ZSDRAM_Module_Base ic_SDRAM(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),

	//0: Single Word Read/Write.
	//1: Four Words Read/Write.
	//.iMode(0),
	.iMode(1),
	
    .iAddr(sdram_rw_addr), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData1(sdram_in_data1), //input data, write to SDRAM.
    .iData2(sdram_in_data2), 
    .iData3(sdram_in_data3), 
    .iData4(sdram_in_data4), 
    .oData1(sdram_out_data1), //output, read back data from SDRAM.
    .oData2(sdram_out_data2), 
    .oData3(sdram_out_data3), 
    .oData4(sdram_out_data4), 

    .iReq(sdram_rw_req), //input, [1]=1:Write, [0]=1:Read.
    .oDone({sdram_wr_done,sdram_rd_done}), //output,[1]=1:write done, [0]=1:read done.
    
    .S_CKE(S_CKE),
    .S_nCS(S_nCS),
    .S_nRAS(S_nRAS),
    .S_nCAS(S_nCAS),
    .S_nWE(S_nWE),
    .S_BA(S_BA),
    .S_A(S_A),
    .S_DQM(S_DQM),
    .S_DQ(S_DQ)
    );
//133.333333MHz
//133333333Hz/115200bps=1157
parameter B115K2=11'd1157,TXFUNC=6'd16;
reg [31:0] i;
reg [7:0] Go;
reg [31:0] T;
reg [31:0] C1;
reg [31:0] Cnt;
reg [15:0] rd_back_data1;
reg [15:0] rd_back_data2;
reg [15:0] rd_back_data3;
reg [15:0] rd_back_data4;
always @(posedge clk_133MHz_210 or negedge rst_n)
if(!rst_n)	begin
				i<=6'd0;
				sdram_rw_addr<=24'd0;
				sdram_in_data1<=16'h0000;
				sdram_in_data2<=16'h0000;
				sdram_in_data3<=16'h0000;
				sdram_in_data4<=16'h0000;
				sdram_rw_req<=2'b00;
				Go<=6'd0;
				C1<=11'd0;
				T<=11'd0;
				Cnt<=32'd0;
				led<=0;
			end
else	case(i)
			0: //Write data to SDRAM.
				if(sdram_wr_done) begin sdram_rw_req[1]<=1'b0; i<=i+1'b1; end
				else begin 
						sdram_rw_req[1]<=1'b1; 
						rd_back_data1<=0;
						rd_back_data2<=0;
						rd_back_data3<=0;
						rd_back_data4<=0;
					end
			1: //Read data back from SDRAM.
				if(sdram_rd_done) begin 
									rd_back_data1<=sdram_out_data1; 
									rd_back_data2<=sdram_out_data2; 
									rd_back_data3<=sdram_out_data3; 
									rd_back_data4<=sdram_out_data4; 
									sdram_rw_req[0]<=1'b0; 
									i<=i+1'b1; 
								end
				else begin sdram_rw_req[0]<=1'b1; end
				
			2: //Compare 1st word high byte.
				if(rd_back_data1==sdram_in_data1) begin
						T<={2'b11,rd_back_data1[15:8],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hEE,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
				
			3: //Compare 1st word low byte.
				if(rd_back_data1==sdram_in_data1) begin
						T<={2'b11,rd_back_data1[7:0],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hFF,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
			4: //Compare 2st word high byte.
				if(rd_back_data2==sdram_in_data2) begin
						T<={2'b11,rd_back_data2[15:8],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hEE,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
				
			5: //Compare 2st word low byte.
				if(rd_back_data2==sdram_in_data2) begin
						T<={2'b11,rd_back_data2[7:0],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hFF,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
					
			6: //Compare 3st word high byte.
				if(rd_back_data3==sdram_in_data3) begin
						T<={2'b11,rd_back_data3[15:8],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hEE,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
				
			7: //Compare 3st word low byte.
				if(rd_back_data3==sdram_in_data3) begin
						T<={2'b11,rd_back_data3[7:0],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hFF,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
					
			8: //Compare 4st word high byte.
				if(rd_back_data4==sdram_in_data4) begin
						T<={2'b11,rd_back_data4[15:8],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hEE,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
				
			9: //Compare 4st word low byte.
				if(rd_back_data4==sdram_in_data4) begin
						T<={2'b11,rd_back_data4[7:0],1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				else begin
						T<={2'b11,8'hFF,1'b0};
						//i<=TXFUNC;
						i<=28; //stop if error occured.
						Go<=i+1'b1;
					end
				
			10: //1s delay. 32'd133333333 //500ms  32'd66,666,666
				if(Cnt==32'd2222222) 	begin 
											Cnt<=32'd0; i<=6'd0;

				//OLED:128x64
				//128/8=8, 64/16=4. => 8*4=32.
											//increase address.
											//480*800=384000.
											if(sdram_rw_addr==384000-1)
												begin
													sdram_rw_addr<=24'd0;
													i<=6'd29;
												end
											else
												//sdram_rw_addr<=sdram_rw_addr+1'b1;
												sdram_rw_addr<=sdram_rw_addr+4;
											//increase data.
											sdram_in_data1<=sdram_in_data1+1'b1;
											sdram_in_data2<=sdram_in_data2+1'b1;
											sdram_in_data3<=sdram_in_data3+1'b1;
											sdram_in_data4<=sdram_in_data4+1'b1;
										end
				else begin Cnt<=Cnt+1'b1; end
				
			6'd16,6'd17,6'd18,6'd19,6'd20,6'd21,6'd22,6'd23,6'd24,6'd25,6'd26:
				if(C1==B115K2-1) begin C1<=11'd0; i<=i+1'b1; end
				else begin uart_txd<=T[i-16]; C1<=C1+1'b1; end
				
			6'd27: 
				i<=Go;
			6'd28:
				begin
				//error halt here.
				led<=1'b1;
				i<=6'd28;
				end
			6'd29:
				i<=i;
		endcase
endmodule
///////////////////////////////////////////////////////////
`else
////////////////////////////////////////////////////////
module ZSinglePhotonCounter(
    input clk,

	input photon_pulse, //E2, external photon pulse input pin.
	input sync_50Hz, //F2, External 50Hz Sync Signal.
	
	output photon_pulse_simulate, //E1, simulate signal to work as photon_pulse for testing.
	output sync_50Hz_simulate, //F1, simulate signal to work as sync_50Hz for testing.
	//use an oscilloscope to check how many clks were used.
    output clk_used, //E3, used to check time cost. 

	output uart_txd, //E4.
	
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA,

    //physical pins used to connect to SDRAM chip.
    output S_CLK,
    output S_CKE,
    output S_nCS,
    output S_nRAS,
    output S_nCAS,
    output S_nWE,
    output [12:0] S_A,
    output [1:0] S_BA,
    output [1:0] S_DQM,
    inout [15:0] S_DQ,

    //led.
    output led,

    //4 Push Buttons.
    //iButton[3]=A12, iButton[2]=B12, iButton[1]=A13, iButton[0]=C13.
    input [3:0] iButton
    //4 LEDs.
    //output [3:0] oLED
    );
//assign oLED<=4'b1111;
///////////////////////////////////////////////////////
//On-board Clock=50MHz.
wire clk_133MHz_210;
wire clk_133MHz_0;
wire rst_n;
ZsyPLL ic_PLL (// Clock in ports
    .CLK_IN1(clk),      // IN
    // Clock out ports
    .clk_133MHz_210(clk_133MHz_210),     // OUT
    .clk_133MHz_0(clk_133MHz_0),     // OUT
    // Status and control signals
    .LOCKED(rst_n));      // OUT
////////////////////////////////////////////////////////
//SDRAM IC CLK.
wire clk_to_sdram;
ODDR2 oddr2_inst(
.D0(1'b1),
.D1(1'b0),
.CE(1'b1),
.C0(clk_133MHz_0),
.C1(!clk_133MHz_0),
.R(1'b0),
.S(1'b0),
.Q(clk_to_sdram));
assign S_CLK=clk_to_sdram;
/////////////////////////////////////////////////////////////
wire ExtSyncLost;
/////////////////////////////////////////////////////////////
wire en_Page_ExtSyncLost;
assign en_Page_ExtSyncLost=ExtSyncLost;
////////////////////////////////////////////////////////////
wire en_Page_Main;
assign en_Page_Main=~ExtSyncLost;
/////////////////////////////////////////////////////////////
//reset signal for Page Main.
wire rst_Page_Main;
//reset signal for Page ExtSyncLost.
wire rst_Page_ExtSyncLost;
/////////////////////////////////////////////////////////////
wire [11:0] SDRAM_Bar_Value;
wire SRAM_Testing_Done;
/////////////////////////////////////////////////////////////
wire Rd_Done_POST;
wire [15:0] Rd_Data1_POST;
wire [15:0] Rd_Data2_POST;
wire [15:0] Rd_Data3_POST;
wire [15:0] Rd_Data4_POST;
wire Rd_Req_POST;
wire [23:0] Rd_Addr_POST;
///////////////////////////////////
wire Wr_Req_POST;
wire [23:0] Wr_Addr_POST;
wire [15:0] Wr_Data1_POST;
wire [15:0] Wr_Data2_POST;
wire [15:0] Wr_Data3_POST;
wire [15:0] Wr_Data4_POST;
wire Wr_Done_POST;
//////////////////////////////////////
wire PowerOnSelfTestDone;
ZPage_PowerOnSelfTest ic_PowerOnSelfTest(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),
    .en(1'b1),

	//to help ZTFT43_Adapter update progress bar during SDRAM Testing.
	.oSDRAM_Bar_Value(SDRAM_Bar_Value),
	.oSRAM_Testing_Done(SRAM_Testing_Done),
	
	//SDRAM Read Glue Logic.
    .oSDRAM_Rd_Addr(Rd_Addr_POST), //output, Bank(2)+Row(13)+Column(9)=(24)
    .iSDRAM_Data1(Rd_Data1_POST), //input, read back data1 from SDRAM.
    .iSDRAM_Data2(Rd_Data2_POST), //input, read back data2 from SDRAM.
    .iSDRAM_Data3(Rd_Data3_POST), //input, read back data3 from SDRAM.
    .iSDRAM_Data4(Rd_Data4_POST), //input, read back data4 from SDRAM.

    .oSDRAM_Rd_Req(Rd_Req_POST), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Rd_Done(Rd_Done_POST), //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    .oSDRAM_Wr_Addr(Wr_Addr_POST), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data1(Wr_Data1_POST), //ouptut, write data1 to SDRAM.
    .oSDRAM_Wr_Data2(Wr_Data2_POST), //ouptut, write data2 to SDRAM.
    .oSDRAM_Wr_Data3(Wr_Data3_POST), //ouptut, write data3 to SDRAM.
    .oSDRAM_Wr_Data4(Wr_Data4_POST), //ouptut, write data4 to SDRAM.

    .oSDRAM_Wr_Req(Wr_Req_POST), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Wr_Done(Wr_Done_POST), //input, SDRAM write done signal.
    
	//Test done successfully.
    .oTestDone(PowerOnSelfTestDone)
    );
/////////////////////////////////////////////////////////////
wire data_update;
wire [31:0] PulseCounter_LCD;
wire [15:0] PulseCounter_Single;
wire [31:0] PulseCounter_LCD_Accumulated;
wire [7:0] Time_Interval_Selection;
ZPulseCounter_Adapter ic_PulseCounter(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),
    .en(1'b1),
    //External Photon Pulse.
    .photon_pulse(photon_pulse),
    //50Hz sync.
    .sync_50Hz(sync_50Hz),
    .oExtSyncLost(ExtSyncLost),

	//Time Interval Selection.
	.iTime_Interval_Selection(Time_Interval_Selection),
	
	//Pulse Counter Output.
	.oDataUpdate(data_update),
    .oPulseCouter_LCD(PulseCounter_LCD),
    .oPulseCouter_Single(PulseCounter_Single),

    //Accumulated PulseCounter. Never Reset to 0.
   	.oPulseCouter_LCD_Accumulated(PulseCounter_LCD_Accumulated)
    );
///////////////////////////////////////////////////////////////////
wire [7:0] Cursor_Index;
wire [7:0] Active_Periods_Num;
wire [7:0] PulseCounter_Gain_Divider;
wire Pause;
ZPushButton_Adapter ic_PushButton_Adapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_Page_Main),
    .en(1'b1),

    //[0]: Previous,[1]:Next,[2]:Okay,[3]:Cancel.
    .iButton(iButton),
    .oCursor_Index(Cursor_Index),
    //How many SIN periods we draw on LCD.
    //Period1,Period2,Period3,Period4,Period5.
    .oActive_Periods_Num(Active_Periods_Num),

    //PulseCounter Gain Divider.
    .oPulseCounter_Gain_Divider(PulseCounter_Gain_Divider),

    //Time Interval Selection.
    .oTime_Interval_Selection(Time_Interval_Selection),

    //Pause or Run.
    //1=Pause, 0=Run.
    .oPause(Pause)
    );

///////////////////////////////////////////////////////////
//ZTFT43_Adapter: Read data from SDRAM and send to TFT4.3'' LCD.
wire Rd_Done_ZTFT43;
wire [15:0] Rd_Data1_ZTFT43;
wire [15:0] Rd_Data2_ZTFT43;
wire [15:0] Rd_Data3_ZTFT43;
wire [15:0] Rd_Data4_ZTFT43;
wire Rd_Req_ZTFT43;
wire [23:0] Rd_Addr_ZTFT43;
ZTFT43_Adapter ic_TFT43Adapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),

	//to help ZTFT43_Adapter update progress bar during SDRAM Testing.
	.iSDRAM_Bar_Value(SDRAM_Bar_Value),
	.iSRAM_Testing_Done(SRAM_Testing_Done),

	//SDRAM Glue Logic.
    .oSDRAM_Rd_Addr(Rd_Addr_ZTFT43), //output, Bank(2)+Row(13)+Column(9)=(24)
    .iSDRAM_Data1(Rd_Data1_ZTFT43), //input, read back data1 from SDRAM.
    .iSDRAM_Data2(Rd_Data2_ZTFT43), //input, read back data2 from SDRAM.
    .iSDRAM_Data3(Rd_Data3_ZTFT43), //input, read back data3 from SDRAM.
    .iSDRAM_Data4(Rd_Data4_ZTFT43), //input, read back data4 from SDRAM.

    .oSDRAM_Rd_Req(Rd_Req_ZTFT43), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Rd_Done(Rd_Done_ZTFT43), //input,[1]=1:write done, [0]=1:read done.

    //use an oscilloscope to check how many clks were used.
    .clk_used(clk_used), 
    .uart_txd(uart_txd),
    
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST),
    .BL_CTR(BL_CTR), //BackLight Ctrl.
    .LCD_CS(LCD_CS),
    .LCD_RS(LCD_RS),
    .LCD_WR(LCD_WR),
    .LCD_RD(LCD_RD),
    .LCD_DATA(LCD_DATA)
    );
  
///////////////////////////////////////////////////////////
//Page Main: ZDrawAdapter: Write data to SDRAM.
wire Wr_Req_ZDraw;
wire [23:0] Wr_Addr_ZDraw;
wire [15:0] Wr_Data1_ZDraw;
wire [15:0] Wr_Data2_ZDraw;
wire [15:0] Wr_Data3_ZDraw;
wire [15:0] Wr_Data4_ZDraw;
wire Wr_Done_ZDraw;
wire [15:0] MaxPulseCounter;
wire [15:0] MinPulseCounter;
ZDrawAdapter ic_DrawAdapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_Page_Main),
    .en(1'b1),

	//Pause or Run.
	//1=Pause, 0=Run.
	.iPause(Pause),
	
	//Cursor Index.
	.iCursor_Index(Cursor_Index),
	
    //How many SIN periods we draw on LCD.
    //Period1,Period2,Period3,Period4,Period5.
    .iActive_Periods_Num(Active_Periods_Num),

    //PulseCounter Gain Divider.
    .iPulseCounter_Gain_Divider(PulseCounter_Gain_Divider),

    //Time Interval Selection.
    .iTime_Interval_Selection(Time_Interval_Selection),
	
	//Accumulated PulseCounter.
	.iPulseCounter_Accumulated(PulseCounter_LCD_Accumulated),
	
    //Draw New PulseCounter.
    .iData_Update(data_update),
    .iPulse_Counter(PulseCounter_LCD),
    
	//SDRAM Glue Logic.
    .oSDRAM_Wr_Addr(Wr_Addr_ZDraw), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data1(Wr_Data1_ZDraw), //ouptut, write data1 to SDRAM.
    .oSDRAM_Wr_Data2(Wr_Data2_ZDraw), //ouptut, write data2 to SDRAM.
    .oSDRAM_Wr_Data3(Wr_Data3_ZDraw), //ouptut, write data3 to SDRAM.
    .oSDRAM_Wr_Data4(Wr_Data4_ZDraw), //ouptut, write data4 to SDRAM.
    .oSDRAM_Wr_Req(Wr_Req_ZDraw), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Wr_Done(Wr_Done_ZDraw), //input, SDRAM write done signal.

    .led(led)
    );
////////////////////////////////////////////////////////
//Page Main: ZShift_and_Draw: Left shift movement old history pulse counter and add new data to the tail.
wire Rd_Done_ShiftDraw;
wire [15:0] Rd_Data1_ShiftDraw;
wire [15:0] Rd_Data2_ShiftDraw;
wire [15:0] Rd_Data3_ShiftDraw;
wire [15:0] Rd_Data4_ShiftDraw;
wire Rd_Req_ShiftDraw;
wire [23:0] Rd_Addr_ShiftDraw;
///////////////////////////////////
wire Wr_Req_ShiftDraw;
wire [23:0] Wr_Addr_ShiftDraw;
wire [15:0] Wr_Data1_ShiftDraw;
wire [15:0] Wr_Data2_ShiftDraw;
wire [15:0] Wr_Data3_ShiftDraw;
wire [15:0] Wr_Data4_ShiftDraw;
wire Wr_Done_ShiftDraw;
///////////////////////////////////////
ZShift_and_Draw ic_Shift_and_Draw(
    .clk(clk_133MHz_210),
    .rst_n(rst_Page_Main),
    .en(1'b1),

	//Pause or Run.
	//1=Pause, 0=Run.
	.iPause(Pause),
	
	//New PulseCounter comes.
	.iDataUpdate(data_update),
	.iPulseCounter(PulseCounter_Single),
	.iPulseCouter_LCD(PulseCounter_LCD),

    //PulseCounter Gain Divider.
    .iPulseCounter_Gain_Divider(PulseCounter_Gain_Divider),
    
	//SDRAM Read Glue Logic.
    .oSDRAM_Rd_Addr(Rd_Addr_ShiftDraw), //output, Bank(2)+Row(13)+Column(9)=(24)
    .iSDRAM_Data1(Rd_Data1_ShiftDraw), //input, read back data1 from SDRAM.
    .iSDRAM_Data2(Rd_Data2_ShiftDraw), //input, read back data2 from SDRAM.
    .iSDRAM_Data3(Rd_Data3_ShiftDraw), //input, read back data3 from SDRAM.
    .iSDRAM_Data4(Rd_Data4_ShiftDraw), //input, read back data4 from SDRAM.

    .oSDRAM_Rd_Req(Rd_Req_ShiftDraw), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Rd_Done(Rd_Done_ShiftDraw), //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    .oSDRAM_Wr_Addr(Wr_Addr_ShiftDraw), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data1(Wr_Data1_ShiftDraw), //ouptut, write data1 to SDRAM.
    .oSDRAM_Wr_Data2(Wr_Data2_ShiftDraw), //ouptut, write data2 to SDRAM.
    .oSDRAM_Wr_Data3(Wr_Data3_ShiftDraw), //ouptut, write data3 to SDRAM.
    .oSDRAM_Wr_Data4(Wr_Data4_ShiftDraw), //ouptut, write data4 to SDRAM.

    .oSDRAM_Wr_Req(Wr_Req_ShiftDraw), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Wr_Done(Wr_Done_ShiftDraw), //input, SDRAM write done signal.

    //the Maximum & Minimum Pulse Counter with 600 points.
	.oMaxPulseCounter(MaxPulseCounter),
	.oMinPulseCounter(MinPulseCounter)
    );
////////////////////////////////////////////////
wire Wr_Req_ExtSyncLost;
wire [23:0] Wr_Addr_ExtSyncLost;
wire [15:0] Wr_Data1_ExtSyncLost;
wire [15:0] Wr_Data2_ExtSyncLost;
wire [15:0] Wr_Data3_ExtSyncLost;
wire [15:0] Wr_Data4_ExtSyncLost;
wire Wr_Done_ExtSyncLost;
ZPage_ExtSyncLost ic_ExtSyncLost(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),
    .en(en_Page_ExtSyncLost),

	//SDRAM Glue Logic.
    .oSDRAM_Wr_Addr(Wr_Addr_ExtSyncLost), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data1(Wr_Data1_ExtSyncLost), //ouptut, write data1 to SDRAM.
    .oSDRAM_Wr_Data2(Wr_Data2_ExtSyncLost), //ouptut, write data2 to SDRAM.
    .oSDRAM_Wr_Data3(Wr_Data3_ExtSyncLost), //ouptut, write data3 to SDRAM.
    .oSDRAM_Wr_Data4(Wr_Data4_ExtSyncLost), //ouptut, write data4 to SDRAM.

    .oSDRAM_Wr_Req(Wr_Req_ExtSyncLost), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Wr_Done(Wr_Done_ExtSyncLost) //input, SDRAM write done signal.
    );
///////////////////////////////////////////////
//Only connect ZPage_ExtSyncLost SDRAM RW to SDRAM when ExtSyncLost occurd.
//Otherwise connect ZDrawAdapter and ZShift_and_Draw to SDRAM.
ZSDRAM_RW_Arbit ic_RW_Arbit(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),
    .en(1'b1),

	//Global Flag.
	.iFlag_ExtSyncLost(en_Page_ExtSyncLost),
	
	//to reset Page Main.
	.oRstPageMain(rst_Page_Main),
	//to reset Page ExtSyncLost.
	.oRstPageExtSyncLost(rst_Page_ExtSyncLost),
	
    //Read Port-1. (ZTFT43_Adapter SDRAM Read.)
    .iRd_Req1(Rd_Req_ZTFT43),
    .iRd_Addr1(Rd_Addr_ZTFT43),
    .oRd_Done1(Rd_Done_ZTFT43),
    .oRd_Data11(Rd_Data1_ZTFT43),
    .oRd_Data12(Rd_Data2_ZTFT43),
    .oRd_Data13(Rd_Data3_ZTFT43),
    .oRd_Data14(Rd_Data4_ZTFT43),
    
    //Read Port-2. (ZShift_and_Draw, Read.)
    .iRd_Req2(Rd_Req_ShiftDraw),
    .iRd_Addr2(Rd_Addr_ShiftDraw),
    .oRd_Done2(Rd_Done_ShiftDraw),
    .oRd_Data21(Rd_Data1_ShiftDraw),
    .oRd_Data22(Rd_Data2_ShiftDraw),
    .oRd_Data23(Rd_Data3_ShiftDraw),
    .oRd_Data24(Rd_Data4_ShiftDraw),

    //Write Port-1.  (ZDraw_Adapter, Write.)
    .iWr_Req1(Wr_Req_ZDraw),
    .iWr_Addr1(Wr_Addr_ZDraw),
    .iWr_Data11(Wr_Data1_ZDraw),
    .iWr_Data12(Wr_Data2_ZDraw),
    .iWr_Data13(Wr_Data3_ZDraw),
    .iWr_Data14(Wr_Data4_ZDraw),
    .oWr_Done1(Wr_Done_ZDraw),

    //Write Port-2. (ZShift_and_Draw, Write.)
    .iWr_Req2(Wr_Req_ShiftDraw),
    .iWr_Addr2(Wr_Addr_ShiftDraw),
    .iWr_Data21(Wr_Data1_ShiftDraw),
    .iWr_Data22(Wr_Data2_ShiftDraw),
    .iWr_Data23(Wr_Data3_ShiftDraw),
    .iWr_Data24(Wr_Data4_ShiftDraw),
    .oWr_Done2(Wr_Done_ShiftDraw),

    //Write Port-3. (ZPage_ExtSyncLost, Write.)
    .iWr_Req_ExtSyncLost(Wr_Req_ExtSyncLost),
    .iWr_Addr_ExtSyncLost(Wr_Addr_ExtSyncLost),
    .iWr_Data1_ExtSyncLost(Wr_Data1_ExtSyncLost),
    .iWr_Data2_ExtSyncLost(Wr_Data2_ExtSyncLost),
    .iWr_Data3_ExtSyncLost(Wr_Data3_ExtSyncLost),
    .iWr_Data4_ExtSyncLost(Wr_Data4_ExtSyncLost),
    .oWr_Done_ExtSyncLost(Wr_Done_ExtSyncLost),

	//PowerOnSelfTest Done Signal.
	.iPOSTDone(PowerOnSelfTestDone),
    //Write Port. (ZPage_PowerOnSelfTest, Write.)
    .iWr_Req_POST(Wr_Req_POST),
    .iWr_Addr_POST(Wr_Addr_POST),
    .iWr_Data1_POST(Wr_Data1_POST),
    .iWr_Data2_POST(Wr_Data2_POST),
    .iWr_Data3_POST(Wr_Data3_POST),
    .iWr_Data4_POST(Wr_Data4_POST),
    .oWr_Done_POST(Wr_Done_POST),
    //Read Port. (ZPage_PowerOnSelfTest, Read.)
    .iRd_Req_POST(Rd_Req_POST),
    .iRd_Addr_POST(Rd_Addr_POST),
    .oRd_Done_POST(Rd_Done_POST),
    .oRd_Data1_POST(Rd_Data1_POST),
    .oRd_Data2_POST(Rd_Data2_POST),
    .oRd_Data3_POST(Rd_Data3_POST),
    .oRd_Data4_POST(Rd_Data4_POST),

	//physical pins used to connect to SDRAM chip.
    .S_CKE(S_CKE),
    .S_nCS(S_nCS),
    .S_nRAS(S_nRAS),
    .S_nCAS(S_nCAS),
    .S_nWE(S_nWE),
    .S_BA(S_BA),
    .S_A(S_A),
    .S_DQM(S_DQM),
    .S_DQ(S_DQ)
    );
//////////////////////////////////////////////////////
//Test Signal.
ZTestSignal ic_TestSignal(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),

	.photon_pulse_simulate(photon_pulse_simulate),
	.sync_50Hz_simulate(sync_50Hz_simulate)
    );

 /*(
//FIFO for PulseCounter.
wire [31:0] din_FIFO;
wire wr_fifo;
wire rd_fifo;
wire [31:0] dout_FIFO;
wire fifo_is_empty;
wire fifo_is_full;
ZPulseCounter_FIFO ic_PulseCounter_FIFO (
  .rst(rst_n), // input rst
  .wr_clk(clk_133MHz_210), // input wr_clk
  .rd_clk(clk_133MHz_210), // input rd_clk
  .din(din_FIFO), // input [31 : 0] din
  .wr_en(wr_fifo), // input wr_en
  .rd_en(rd_fifo), // input rd_en
  .dout(dout_FIFO), // output [31 : 0] dout
  .full(fifo_is_full), // output full
  .empty(fifo_is_empty) // output empty
);

//Pulse Counter, Write to FIFO.
wire data_update;
wire [31:0] dout_PulseCounter;
ZPulseCounter_Adapter ic_PulseCounter_Adapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1), //Always Enabled.
    
    //External Photon Pulse.
    .photon_pulse(photon_pulse),
    
    //50Hz sync.
    .sync_50Hz(sync_50Hz_rising),

	//FIFO Glue Logic (Writing).
	.fifo_is_full(fifo_is_full),
	.wr_fifo(wr_fifo),
    .dout(din_FIFO)
    );
*/

 /*
//60Hz Refresh Rate.
//133MHz/60Hz=2_216_666/2=1108333
reg [23:0] cnt_60Hz;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_60Hz<=0;
			end
else begin
		if(cnt_60Hz==2_216_666-1)
			cnt_60Hz<=0;
		else
			cnt_60Hz<=cnt_60Hz+1;
	end
*/

//driven by step i.
/*
reg [15:0] i;
reg [31:0] CNT1;
always @(posedge clk_133MHz_210 or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				SDRAM_Refresh_Schedule<=1'b0;
				SDRAM_Draw_Schedule<=1'b0; 
			end
else begin
		case(i)
			0: //Draw will write SDRAM. (To adapt ZDrawAdapter Module.)
				begin 
					select_Mux<=1;
					i<=i+1'b1; 
				end
				
			1: //Waiting Draw Module Init Ready.
			//This init will clear screen with Green Color.
			//Need to schedule Refresh to show.
				if(Draw_Init_Ready) begin i<=i+1'b1; end
								
			2: //Refresh will read SDRAM.
				begin 
					select_Mux<=0;
					i<=i+1'b1; 
				end

			3: //Waiting Refresh Module Init Ready.
				if(Refresh_Init_Ready) begin i<=i+1'b1; end		

			4: //2s Full screen Red Color to represent screen interface works well.
					//t=2s, f=1/t=1/2s=0.5Hz
					//80MHz/0.5Hz=160_000_000
					if(CNT1==160_000_000) begin CNT1<=0; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; end

			5: //Schedule Refresh Module.
				if(SDRAM_Refresh_Done) begin 
										SDRAM_Refresh_Schedule<=1'b0; 
										i<=i+1;
									 end
				else begin 
						SDRAM_Refresh_Schedule<=1'b1; 
						select_Mux<=0;
					end
			6: //2s Full screen Green Color to represent SDRAM interface works well. 
				//t=2s, f=1/t=1/2s=0.5Hz
				//80MHz/0.5Hz=160_000_000
				if(CNT1==160_000_000) begin CNT1<=0; i<=i+1'b1; end
				else begin CNT1<=CNT1+1'b1; end

			7: //Schedule Draw Module.
				if(SDRAM_Draw_Done) begin 
										SDRAM_Draw_Schedule<=1'b0; 
										i<=i+1;
									end
				else begin 
						SDRAM_Draw_Schedule<=1'b1; 
						select_Mux<=1;
					end

			8: //Schedule Refresh Module.
				if(SDRAM_Refresh_Done) begin 
										SDRAM_Refresh_Schedule<=1'b0; 
										i<=i+1;
									 end
				else begin 
						SDRAM_Refresh_Schedule<=1'b1; 
						select_Mux<=0;
					end
			9:
				//t=2s, f=1/t=1/2s=0.5Hz
				//80MHz/0.5Hz=160_000_000
				if(CNT1==160_000_000) begin CNT1<=0; i<=i+1'b1; end
				else begin CNT1<=CNT1+1'b1; end
			10: //Loop.
				i<=7;
		endcase
	end
*/
endmodule
/////////////////////////////////////////////////////
`endif
/////////////////////////////////////////////////////
