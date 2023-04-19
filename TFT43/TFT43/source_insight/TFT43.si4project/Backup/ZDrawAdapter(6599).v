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

	//output reg oDrawInitReady, //output, draw initial ready.
    //input iDraw_Schedule, //input, schedule to draw.
    
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
wire Done_ZDrawCore;
ZDrawCore ic_DrawCore(
    .clk(clk),
    .rst_n(rst_n),
    .en(en_ZDrawCore),

	//0: Clear Screen.
	//1: Draw Fixed Pixel Image.
	//2: Draw SIN wave.
	.iCmd(Cmd_ZDrawCore),
	.oDraw_Done(Done_ZDrawCore), //output, indicate draw done.

	//SDRAM Glue Logic.
    .oSDRAM_Wr_Addr(oSDRAM_Wr_Addr), //output, Bank(2)+Row(13)+Column(9)=(24)
    .oSDRAM_Wr_Data(oSDRAM_Wr_Data), //ouptut, write data to SDRAM.
    .oSDRAM_Wr_Req(oSDRAM_Wr_Req), //output, SDRAM write request.
    .iSDRAM_Wr_Done(iSDRAM_Wr_Done) //input, SDRAM write done signal.
    );


//driven by step i.
reg [7:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				//oDraw_Done<=1'b0;
				led<=1'b0;

				//oDrawInitReady<=1'b0;
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

				8: 
					begin 
						//oDraw_Done<=1'b1; 
						i<=i+1'b1; 
					end
				9:
					begin 
						//oDraw_Done<=1'b0; 
						led<=1'b0; 
						i<=5; 
					end
			endcase
		end
endmodule
