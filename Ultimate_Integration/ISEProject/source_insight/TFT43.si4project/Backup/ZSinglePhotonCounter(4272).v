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
    output led
    );

assign uart_txd=1'b0;

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


//133.333333MHz
//133333333Hzsdram_addr/115200bps=1157
parameter B115K2=11'd1157,TXFUNC=6'd16;

reg [23:0] sdram_rw_addr; //SDRAM RW Address.
wire [1:0] sdram_rw_req; //SDRAM RW Request.

wire [15:0] sdram_in_data; //Data write to SDRAM.
wire [15:0] sdram_out_data; //Data read from SDRAM.

wire sdram_wr_done;
wire sdram_rd_done;
ZSDRAM_Module_Base ic_SDRAM(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),

    .iAddr(sdram_rw_addr), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData(sdram_in_data), //input data, write to SDRAM.
    .oData(sdram_out_data), //output, read back data from SDRAM.

    .iCall(sdram_rw_req), //input, [1]=1:Write, [0]=1:Read.
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
wire [23:0] SDRAM_W_Addr;
wire [23:0] SDRAM_R_Addr;
//Conflict for SDRAM Reading and Writing.
/*
wire Rd_Req;
wire Wr_Req;

wire SDRAM_Refresh_Done;
wire SDRAM_Draw_Done;
ZSDRAM_RW_Arbit ic_Arbit(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),

	//Read Request.
	.rd_req(Rd_Req),
	.rd_addr(SDRAM_R_Addr),
	.rd_done(SDRAM_Refresh_Done),
	
	//Write Request.
	.wr_req(Wr_Req),
	.wr_addr(SDRAM_W_Addr),
	.wr_done(SDRAM_Draw_Done),
	
	//Arbit Output.
	.rw_req(sdram_rw_req),
	.rw_addr(sdram_rw_addr)
    );
*/

//Sync 50Hz.
wire sync_50Hz_rising;
wire sync_50Hz_falling;
ZEdgeDetect ic_sync_50Hz(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),
    .sig_in(sync_50Hz),
    .rising_edge(sync_50Hz_rising),
    .falling_edge(sync_50Hz_falling)
    );
 
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

//ZTFT43_Adapter: Read data from SDRAM and send to TFT4.3'' LCD.
reg SDRAM_Refresh_Schedule;
wire SDRAM_Refresh_Done;
ZTFT43_Adapter ic_TFT43Adapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),

	//External 50Hz Sync Signal.
	.sync_50Hz(sync_50Hz_rising), 

    .iRefresh_Schedule(SDRAM_Refresh_Schedule), //Input, request to Refresh.
    .oRefresh_Done(SDRAM_Refresh_Done), //output, indicate refresh done.
    
	//FIFO Glue Logic (Reading).
	//.fifo_is_empty(fifo_is_empty),
	//.rd_fifo(rd_fifo),
	//.fifo_data(dout_FIFO), 

	//SDRAM Glue Logic.
    .oSDRAM_Rd_Addr(SDRAM_R_Addr), //output, Bank(2)+Row(13)+Column(9)=(24)
    .iSDRAM_Data(sdram_out_data), //input, read back data from SDRAM.

    .oSDRAM_Rd_Req(sdram_rw_req[0]), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Rd_Done(sdram_rd_done), //input,[1]=1:write done, [0]=1:read done.

    
    //use an oscilloscope to check how many clks were used.
    .clk_used(clk_used), 
    
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST),
    .BL_CTR(BL_CTR), //BackLight Ctrl.
    .LCD_CS(LCD_CS),
    .LCD_RS(LCD_RS),
    .LCD_WR(LCD_WR),
    .LCD_RD(LCD_RD),
    .LCD_DATA(LCD_DATA)
    );

//ZDrawAdapter: Write data to SDRAM.
reg SDRAM_Draw_Schedule;
wire SDRAM_Draw_Done;
ZDrawAdapter ic_DrawAdapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),

    .iDraw_Schedule(SDRAM_Draw_Schedule), //input, schedule to draw.
    
	//SDRAM Glue Logic.
    .oSDRAM_Wr_Addr(SDRAM_W_Addr), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data(sdram_in_data), //ouptut, write data to SDRAM.
    .oSDRAM_Wr_Req(sdram_rw_req[1]), //output, [1]=1:Write, [0]=1:Read.
    .iSDRAM_Wr_Done(sdram_wr_done), //input, SDRAM write done signal.

    .oDraw_Done(SDRAM_Draw_Done), //output, indicate draw done.

    .led(led)
    );
/*
ZUART_Controller ic_UART(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),
    
    .char0(dout_FIFO[3:0]),
    .char1(dout_FIFO[7:4]),
    .char2(dout_FIFO[11:8]),
    .char3(dout_FIFO[15:12]),
    .char4(dout_FIFO[19:16]),
    .char5(dout_FIFO[23:20]),
    .char6(dout_FIFO[27:24]),
    .char7(dout_FIFO[31:28]),
    .tx_pin(uart_txd)
    );
*/

//Test Signal.
ZTestSignal ic_TestSignal(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),

	.photon_pulse_simulate(photon_pulse_simulate),
	.sync_50Hz_simulate(sync_50Hz_simulate)
    );
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

//driven by step i.
reg [15:0] i;
always @(posedge clk_133MHz_210 or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				SDRAM_Refresh_Schedule<=1'b0;
				SDRAM_Draw_Schedule<=1'b0; 
			end
else begin
		case(i)
			0: //Write.
				if(SDRAM_Draw_Done) begin 
						SDRAM_Draw_Schedule<=1'b0; 
						i<=i+1;
					end
				else begin 
						SDRAM_Draw_Schedule<=1'b1; 
						sdram_rw_addr<=SDRAM_W_Addr;
					end
			1: //Refresh.
				if(SDRAM_Refresh_Done) begin 
										SDRAM_Refresh_Schedule<=1'b0; 
										i<=i+1;
									 end
				else begin 
						SDRAM_Refresh_Schedule<=1'b1; 
						sdram_rw_addr<=SDRAM_R_Addr;
					end

			2: //Loop.
				i<=0;
		endcase
	end
endmodule
