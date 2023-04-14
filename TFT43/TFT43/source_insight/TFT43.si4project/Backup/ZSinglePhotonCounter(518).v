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
    inout [15:0] S_DQ
    );
    

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

//SDRAM.
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
reg wr_Call;
reg [23:0] sdram_addr; //SDRAM Address.
reg [15:0] sdram_in_data; //Data write to SDRAM.
reg [15:0] sdram_out_data; //Data read from SDRAM.
wire [1:0] done_SDRAM;
wire [15:0] sdram_output_data;
ZSDRAM_Module_Base ic_SDRAM(
    .clk(clk_133MHz_210), //133MHz,210 degree phase shift.
    .rst_n(rst_n),

    .iAddr(sdram_addr), //input, Bank(2)+Row(13)+Column(9)=(24)
    .iData(sdram_in_data), //input data, write to SDRAM.
    .oData(sdram_out_data), //output, read back data from SDRAM.

    .iCall({wr_Call,rd_Call}), //input, [1]=1:Write, [0]=1:Read.
    .oDone(done_SDRAM), //output,[1]=1:write done, [0]=1:read done.
    
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

//Adapter for TFT4.3" Module, Read from FIFO.
wire [23:0] SDRAM_R_Addr;
wire rd_Call;
ZTFT43_Adapter ic_Adapter(
    .clk(clk_133MHz_210),
    .rst_n(rst_n),
    .en(1'b1),

	//External 50Hz Sync Signal.
	.sync_50Hz(sync_50Hz_rising), 
    
	//FIFO Glue Logic (Reading).
	.fifo_is_empty(fifo_is_empty),
	.rd_fifo(rd_fifo),
	.fifo_data(dout_FIFO), 

	//SDRAM Glue Logic.
    .oSDRAM_Addr(SDRAM_R_Addr), //output, Bank(2)+Row(13)+Column(9)=(24)
    .iSDRAM_Data(sdram_out_data), //input, read back data from SDRAM.

    .oSDRAM_Call(rd_Call), //output, [1]=1:Write, [0]=1:Read.
    .oSDRAM_Done(done_SDRAM[0]), //input,[1]=1:write done, [0]=1:read done.
    
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

//SDRAM Read/Write Address Mux.
reg SDRAM_RW_Select; //1:Write, 0:Read.
always @(*)
begin
	if(SDRAM_RW_Select)
		sdram_addr<=SDRAM_W_Addr;
	else
		sdram_addr<=SDRAM_R_Addr;
end

//test SDRAM.
reg [7:0] i;
reg [7:0] Go;
reg rTXD;
assign uart_txd=rTXD;
reg [10:0] C1;
reg [10:0] T;
reg [31:0] Cnt;
reg [23:0] SDRAM_W_Addr;
reg done_WrSDRAM;
wire done_WrSDRAM_Sync;
always @(posedge clk_133MHz_210 or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				sdram_addr<=24'd0;
				sdram_in_data<=16'd0;
				wr_Call<=1'b0;
				rTXD<=1'b1;
				Go<=6'd0;
				C1<=11'd0;
				T<=11'd0;
				Cnt<=32'd0;
				done_WrSDRAM<=1'b0;
			end
else	case(i)
			6'd0: //Read Priority First.
				if(rd_Call)	begin
								SDRAM_RW_Select<=0; //1:Write, 0:Read.
							end
				else	begin
							i<=i+1'b1;
						end
			6'd1: //Write data to SDRAM.
				if(done_SDRAM[1]) begin wr_Call<=1'b0; i<=i+1'b1; end
				else begin wr_Call<=1'b1; end
		
			6'd2: //Read from Address 0 to D3.
				if(doneU2[0]) begin sdram_rd_data<=dataU2;isCall[0]<=1'b0; i<=i+1'b1; end
				else begin isCall[0]<=1'b1; end
			6'd3:
				if(sdram_rd_data==sdram_wr_data) begin
													T<={2'b11,sdram_rd_data[15:8],1'b0};
													i<=TXFUNC;
													Go<=i+1'b1;
												end
				else begin
						T<={2'b11,8'hEE,1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				
			6'd4:
				if(sdram_rd_data==sdram_wr_data) begin
													T<={2'b11,sdram_rd_data[7:0],1'b0};
													i<=TXFUNC;
													Go<=i+1'b1;
												end
				else begin
						T<={2'b11,8'hFF,1'b0};
						i<=TXFUNC;
						Go<=i+1'b1;
					end
				
			6'd5: //1s delay. 32'd133333333 //500ms  32'd66,666,666
				if(Cnt==32'd6666666) 	begin 
											Cnt<=32'd0; i<=6'd0;

				//OLED:128x64
				//128/8=8, 64/16=4. => 8*4=32.
				//LCD: 480*800=384000.
											//increase address.
											//1MB=1024*1024=1048576
											if(sdram_addr==38400-1/*1048576*/)
												begin
													sdram_addr<=0;
													i<=6'd29;
												end
											else
												sdram_addr<=sdram_addr+1'b1;
											//increase data.
											sdram_wr_data<=sdram_wr_data+1'b1;
										end
				else begin Cnt<=Cnt+1'b1; end
				
			6'd16,6'd17,6'd18,6'd19,6'd20,6'd21,6'd22,6'd23,6'd24,6'd25,6'd26:
				if(C1==B115K2-1) begin C1<=11'd0; i<=i+1'b1; end
				else begin rTXD<=T[i-16]; C1<=C1+1'b1; end
				
			6'd27: 
				i<=Go;
			6'd28:
				begin
					//error halt here.
					i<=6'd28;
				end
			6'd29:
				begin done_WrSDRAM<=1'b1; i<=i+1'b1; end
			6'd30:
				begin done_WrSDRAM<=1'b0; i<=i+1'b1; end
			6'd31:
				i<=i;
		endcase
endmodule
