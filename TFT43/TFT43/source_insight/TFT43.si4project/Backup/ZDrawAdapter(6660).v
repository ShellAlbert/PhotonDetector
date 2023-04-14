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
module ZDrawAdapter(
    input clk,
    input rst_n,
    input en,
    
	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.
    output reg oSDRAM_Draw_Done //output, indicate draw done.
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
			end
else if(en) begin
			case(i)
				0: //Write Data to SDRAM.
					begin
						oSDRAM_Wr_Addr<=0;
						oSDRAM_Wr_Data<=16'h7FE0;
						i<=i+1'b1;
					end
				1: //Write One Pixel Data Each Time.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
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
				3: 
					begin
						oSDRAM_Draw_Done<=1'b1;
						i<=i+1'b1;
					end
				4:
					begin
						oSDRAM_Draw_Done<=1'b0;
						i<=i;
					end
			endcase
		end
endmodule
