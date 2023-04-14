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
module ZDrawAdapter(
    input clk,
    input rst_n,
    input en,
    
	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.
    input iSDRAM_Draw_Req, //input, request to draw.
    output reg oSDRAM_Draw_Done, //output, indicate draw done.
 	output reg led
    );
//driven by step i.
reg [7:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				oSDRAM_Wr_Addr<=0;
				oSDRAM_Wr_Data<=0;
				oSDRAM_Wr_Req<=1'b0;
				oSDRAM_Draw_Done<=1'b0;
				led<=1'b0;
			end
else if(en) begin
			case(i)
				0: //Write Data to SDRAM.
					if(iSDRAM_Draw_Req) begin
											oSDRAM_Wr_Addr<=0;
											i<=i+1'b1;
										end
				1: //Write One Pixel Data Each Time.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=`Color_Black;
						end
				2: //480*800=384000.
					if(oSDRAM_Wr_Addr==384000-1) begin 
													oSDRAM_Wr_Addr<=0; 
													i<=i+1'b1; 
												end
					else begin 
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
							i<=1; //Loop to write.
						end
				3: //Draw A Line from (10,10) to (470,10) .
					begin 
						oSDRAM_Wr_Addr<=4810-1; //(10,10)=y*width+x=10*480+10=4810.
						i<=i+1'b1; 
					end
				4: 
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=`Color_Yellow;
						end
				5: //(470,10)=y*width+x=10*480+470=5270.
					if(oSDRAM_Wr_Addr==5270-1) begin i<=i+1; end
					else begin 
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
							i<=4;
						end
				6: //Draw A Line from (10,790) to (470,790) .
					begin 
						oSDRAM_Wr_Addr<=379210-1; //(10,790)=y*width+x=790*480+10=379210.
						i<=i+1'b1; 
					end
				7: 
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=`Color_Yellow;
						end
				8: //(470,790)=y*width+x=790*480+470=379670.
					if(oSDRAM_Wr_Addr==379670-1) begin i<=i+1; end
					else begin 
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+1'b1; 
							i<=7;
						end
				9: //Draw A Line from (10,10) to (10,790).
					begin 
						oSDRAM_Wr_Addr<=4810-1; //(10,10)=y*width+x=10*480+10=4810.
						i<=i+1'b1; 
					end
				10:
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=`Color_Yellow;
						end
				11: //(10,790)=y*width+x=790*480+10=379210.
					if(oSDRAM_Wr_Addr==379210-1) begin i<=i+1; end
					else begin 
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
							i<=10;
						end
						
				12: //Draw A Line from (470,10) to (470,790).
					begin 
						oSDRAM_Wr_Addr<=5270-1; //(470,10)=y*width+x=10*480+470=5270.
						i<=i+1'b1; 
					end
				13:
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=`Color_Yellow;
						end
				14: //(470,790)=y*width+x=790*480+470=379670.
					if(oSDRAM_Wr_Addr==379670-1) begin i<=i+1; end
					else begin 
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+480; 
							i<=13;
						end
				15: 
					begin
						oSDRAM_Draw_Done<=1'b1;
						i<=i+1'b1;
					end
				16:
					begin
						oSDRAM_Draw_Done<=1'b0;
						led<=1'b1;
						i<=0;
					end
			endcase
		end
endmodule
