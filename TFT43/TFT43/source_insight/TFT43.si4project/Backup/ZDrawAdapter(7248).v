`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:35 04/13/2023 
// Design Name: 
// Module Name:    ZDrawAdapter 
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
`include "ColorTable/ZRGB565_ColorTable.v"
//Power ON Timing.
//2s Full screen Red Color to represent screen interface works well.
//2s Full screen Green Color to represent SDRAM interface works well.
module ZDrawAdapter(
    input clk,
    input rst_n,
    input en,

	//Mode1~Mode4 Icon.
	input [1:0] iMode,

	//For blocking SDRAM read & write.
	output reg oBlock_OP_Done,
	//output reg oDrawInitReady, //output, draw initial ready.
    //input iDraw_Schedule, //input, schedule to draw.
    //Accumulated PulseCounter.
    input [31:0] iPulseCounter_Accumulated,

    //Draw New PulseCounter.
    input iData_Update,
    input [31:0] iPulse_Counter,
    
	//SDRAM Glue Logic.
    output [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.

    output oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.
    
    //output reg oDraw_Done, //output, indicate draw done.
 	output reg led
    );


//ZDrawCore.
reg en_ZDrawCore;
reg [3:0] Cmd_ZDrawCore;
reg [31:0] Data1_ZDrawCore;
wire Done_ZDrawCore;
ZDrawCore ic_DrawCore(
    .clk(clk),
    .rst_n(rst_n),
    .en(en_ZDrawCore),

	//0: Clear Screen.
	//1: Draw Fixed Pixel Image.
	//2: Draw RTC.
	//3: Draw SIN wave.
	//4: Draw GongPinTongBu and GuangZiMaiChong.
	//5. Draw A New Photon Counter. iData1=New Photon Counter.
	//6. Draw Random Histogram.
	//7: Draw Mode1~Mode4, iData1=0,1,2,3. Active Mode.
	.iCmd(Cmd_ZDrawCore),
	.iData1(Data1_ZDrawCore),
	.oDraw_Done(Done_ZDrawCore), //output, indicate draw done.

	//SDRAM Glue Logic.
    .oSDRAM_Wr_Addr(oSDRAM_Wr_Addr), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data(oSDRAM_Wr_Data), //ouptut, write data to SDRAM.
    .oSDRAM_Wr_Req(oSDRAM_Wr_Req), //output, SDRAM write request.
    .iSDRAM_Wr_Done(iSDRAM_Wr_Done) //input, SDRAM write done signal.
    );

//Lockin New Pulse Counter.
reg [31:0] lockInPulseCounter;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			lockInPulseCounter<=0;
		end
else begin
		if(iData_Update)
			lockInPulseCounter<=iPulse_Counter;
	end
//driven by step i.
reg [7:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				led<=1'b0;
				oBlock_OP_Done<=1'b0;
			end
else if(en) begin
			case(i)
				0: //Reserve first clock to connect SDRAM_W_Addr to sdram_rw_addr.
				//Very Significant Here!!!
					i<=i+1'b1;
				1: //0: Clear Screen.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=0; //0: Clear Screen.
						end
				2: //Draw Fixed Pixel Image.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=1; //1: Draw Fixed Pixel Image.
						end
				3: //Draw GongPinTongBu and GuangZiMaiChong.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=4; //4: Draw GongPinTongBu.
						end	
				4: //Initial Ready.
					begin 
						//oDrawInitReady<=1'b1; 
						i<=i+1'b1; 
					end
					
//////////////////////////////////////////////////////////////////////////////////
				5: //Waiting for draw schedule.
					if(1/*iDraw_Schedule*/) begin
										i<=i+1'b1;
									end
				6: //Draw RTC.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=2; //2. Draw RTC.
						end
				
				7: //Draw SIN wave.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=3; //3: Draw SIN wave.
						end
				8: //Draw New PulseCounter.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end		
					else begin
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=5; //5. Draw A New Photon Counter. iData1=New Photon Counter.
							Data1_ZDrawCore<=lockInPulseCounter;
						end
				9: //Draw Random Histogram.
					/*
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=6; //6: Draw Random Histogram.
						end
					*/
					i<=i+1'b1;
				10: //Draw Mode1~Mode4, iData1=0,1,2,3. Active Mode.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end
					else begin 
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=7; //7: Draw Mode1~Mode4, iData1=0,1,2,3. Active Mode.
							Data1_ZDrawCore<=iMode;
						end
				11: //Draw Accumulated Pulse Counter.
					if(Done_ZDrawCore) begin en_ZDrawCore<=1'b0; i<=i+1'b1; end		
					else begin
							en_ZDrawCore<=1'b1; 
							Cmd_ZDrawCore<=8; //8: Draw Accumulated Counter, iData1=Counter.
							Data1_ZDrawCore<=iPulseCounter_Accumulated;
						end
				12:
					begin 
						oBlock_OP_Done<=1'b1;
						led<=1'b0; 
						i<=i+1'b1; 
					end
				13:
					begin
						oBlock_OP_Done<=1'b0;
						i<=5; 
					end
			endcase
		end
endmodule
