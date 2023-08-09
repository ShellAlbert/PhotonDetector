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
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data1, //ouptut, write data1 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data2, //ouptut, write data2 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data3, //ouptut, write data3 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data4, //ouptut, write data4 to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done //input, SDRAM write done signal.
    );

reg [15:0] addr_ROM;
wire [7:0] data_ROM;
ZROM_ExtSyncLost ic_ROM_ExtSyncLost (
  .clka(clk), // input clka
  .addra(addr_ROM), // input [15 : 0] addra
  .douta(data_ROM) // output [7 : 0] douta
);

//driven by step i.
reg [15:0] i;
reg [7:0] which_dot_matrix;
reg [31:0] addr_ZiMo3232;
reg [31:0] offset_x;
reg [31:0] offset_y;
reg [31:0] cnt_1Hz;
reg flag_flash;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data1<=0;
			oSDRAM_Wr_Data2<=0;
			oSDRAM_Wr_Data3<=0;
			oSDRAM_Wr_Data4<=0;
			oSDRAM_Wr_Req<=1'b0;

			//800*480.
			//800*352.
			offset_x<=64;
			offset_y<=0;
			cnt_1Hz<=0;
			flag_flash<=1'b0;
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
				//because 350/4=87.5, so PCtoLCD forced it to 352.
				//so 800*352/8=35200.
				//but the PCtoLCD software outputs 35200bytes.
				//so the real size is 800*352=281600bits/8=35200bytes.
				//Image2Lcd v3.2
				//Output data type: C Language Array(*.c)
				//Scan Mode: Vertical Scan.
				//Output Gray: Single.
				//Max width&height: 800x350.
				//Pixel Data Order Reverse with one byte.
				//scan from bottom to top.
					begin
						offset_x<=64;
						offset_y<=0;
						addr_ROM<=0; 
						
						if(flag_flash) 
							i<=i+1'b1;
						else
							i<=11;
					end
				4: //set start address, read data from ROM and write SDRAM.
					begin 
						oSDRAM_Wr_Addr<=offset_x+offset_y;
						i<=i+1'b1; 
					end
				5: //Low 4 bits.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data1<=(data_ROM&8'h01)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data2<=(data_ROM&8'h02)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data3<=(data_ROM&8'h04)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data4<=(data_ROM&8'h08)?(`Color_White):(`Color_Red);
						end
				6: 
					begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
				7: //High 4 bits.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end		 
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data1<=(data_ROM&8'h10)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data2<=(data_ROM&8'h20)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data3<=(data_ROM&8'h40)?(`Color_White):(`Color_Red);
							oSDRAM_Wr_Data4<=(data_ROM&8'h80)?(`Color_White):(`Color_Red);
						end	
				8:
					begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
				9: //offset_x=64, 64+352=416.
					if(offset_x>=416) begin offset_x<=64; i<=i+1'b1; end
					else begin 
						offset_x<=offset_x+8; 
						addr_ROM<=addr_ROM+1'b1; 
						i<=5;
					end
				10: //repeat 800 columns. 800*480=384000.
					if(offset_y>=384000-1) begin offset_y<=0; i<=i+1'b1; end
					else begin 
							offset_y<=offset_y+480;
							i<=4; 
						end
				11: //
					if(cnt_1Hz>=40_000_000) begin
											cnt_1Hz<=0;
											flag_flash<=~flag_flash;
											i<=0;
										 end
					else begin cnt_1Hz<=cnt_1Hz+1'b1; end
			endcase
		end
	else begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data1<=0;
			oSDRAM_Wr_Data2<=0;
			oSDRAM_Wr_Data3<=0;
			oSDRAM_Wr_Data4<=0;
			oSDRAM_Wr_Req<=1'b0;

			//800*480.
			//800*352.
			offset_x<=64;
			offset_y<=0;
			cnt_1Hz<=0;
			flag_flash<=1'b0;
		end
endmodule
