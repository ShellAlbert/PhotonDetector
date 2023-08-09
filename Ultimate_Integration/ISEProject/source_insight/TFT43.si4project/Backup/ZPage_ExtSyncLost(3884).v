`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:22 04/28/2023 
// Design Name: 
// Module Name:    ZPage_ExtSyncLost 
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
`include "../ColorTable/ZRGB565_ColorTable.v"
//Only connect ZPage_ExtSyncLost SDRAM RW to SDRAM when ExtSyncLost occurd.
//Otherwise connect ZDrawAdapter and ZShift_and_Draw to SDRAM.
module ZPage_ExtSyncLost(
    input clk,
    input rst_n,
    input en,
    
	//SDRAM Glue Logic.
    output [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output [15:0] oSDRAM_Wr_Data1, //ouptut, write data1 to SDRAM.
    output [15:0] oSDRAM_Wr_Data2, //ouptut, write data2 to SDRAM.
    output [15:0] oSDRAM_Wr_Data3, //ouptut, write data3 to SDRAM.
    output [15:0] oSDRAM_Wr_Data4, //ouptut, write data4 to SDRAM.

    output oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );

reg [15:0] addr_ROM;
reg [7:0] data_ROM;
ZROM_ExtSyncLost ic_ROM_ExtSyncLost (
  .clka(clk), // input clka
  .addra(addr_ROM), // input [15 : 0] addra
  .douta(data_ROM) // output [7 : 0] douta
);
//driven by step i.
reg [15:0] i;
reg [7:0] which_dot_matrix;
reg [31:0] addr_ZiMo3232;
reg [7:0] pixel_data1;
reg [7:0] pixel_data2;
reg [7:0] pixel_data3;
reg [7:0] pixel_data4;
reg [7:0] pixel_data;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data1<=0;
			oSDRAM_Wr_Data2<=0;
			oSDRAM_Wr_Data3<=0;
			oSDRAM_Wr_Data4<=0;
			oSDRAM_Wr_Req<=1'b0;
			oDraw_Done<=1'b0;
		end
else if(en) begin
			case(i)
				0: //Clear Screen.
					begin oSDRAM_Wr_Addr<=0; i<=i+1'b1; end
				1:
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end		
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data1<=`Color_Red;
							oSDRAM_Wr_Data2<=`Color_Red;
							oSDRAM_Wr_Data3<=`Color_Red;
							oSDRAM_Wr_Data4<=`Color_Red;
						end
				2: //Clear Screen: 480*800=384000.
				//The last one is 383996, 383997,383998,383999.
					if(oSDRAM_Wr_Addr>=383996) begin 
												oSDRAM_Wr_Addr<=0; 
												i<=i+1'b1; 
											end
					else begin 
							//0,1,2,3.....4,5,6,7......8,9,10,11.....
							//write address offset +4.
							oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; 
							i<=i-1'b1; //Loop to write next pixel.
						end
				3: //Bitmap Image: 800*350.  /8bits=35000bytes.
				//but the PCtoLCD software outputs 35200bytes.
					i<=i+1'b1; 
				4: //set start address, read data from ROM and write SDRAM.
					i<=i;
			endcase
		end
endmodule
