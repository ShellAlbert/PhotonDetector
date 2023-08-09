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
				4:
					begin which_dot_matrix<=0; i<=i+1'b1; end
				5:
					begin //Since SDRAM address increase 4 each time, so here we draw from bottom to top.
						case(which_dot_matrix)
							0: //Rising Edge Symbol.
								begin
									addr_ZiMo3232<=2060; //offset of Rising Edge Symbol.
									//(436,628)
									//436+32=468, 628+32=660. =>(468,660)
									//addr=y*width+x=628*480+436=301876.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//301876/4=75469.
									oSDRAM_Wr_Addr<=301876;
								end
							1: //Gong.
								begin 
									addr_ZiMo3232<=0; //offset of Gong.
									//(436,660)
									//436+32=468, 660+32=692. =>(468,692)
									//addr=y*width+x=660*480+436=317236.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//3172836/4=79309.
									oSDRAM_Wr_Addr<=317236;
								end
							2: //Pin.
								begin 
									addr_ZiMo3232<=128; //offset of Pin.
									//(436,692)
									//436+32=468, 692+32=724. =>(468,724)
									//addr=y*width+x=692*480+436=332596.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//332596/4=83149.
									oSDRAM_Wr_Addr<=332596;
								end
							3: //Tong.
								begin 
									addr_ZiMo3232<=256; //offset of Gong.
									//(436,724)
									//436+32=468, 724+32=756. =>(468,756)
									//addr=y*width+x=724*480+436=347956.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//347956/4=86989.
									oSDRAM_Wr_Addr<=347956;
								end
							4: //Bu.
								begin 
									addr_ZiMo3232<=384; //offset of Gong.
									//(436,756)
									//436+32=468, 756+32=788. =>(468,788)
									//addr=y*width+x=756*480+436=363316.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//363316/4=90829.
									oSDRAM_Wr_Addr<=363316;
								end
							5: //Pulse Symbol.
								begin 
									addr_ZiMo3232<=2188; //offset of Guang.
									//(206,628)
									//206+32=238, 628+32=660. =>(238,660)
									//addr=y*width+x=628*480+206=301646.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//301646/4=75411.5.
									oSDRAM_Wr_Addr<=301644;
								end
							6: //Guang.
								begin 
									addr_ZiMo3232<=512; //offset of Guang.
									//(206,660)
									//206+32=238, 660+32=692. =>(238,692)
									//addr=y*width+x=660*480+206=317006.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//317004/4=79251.
									oSDRAM_Wr_Addr<=317004;
								end
							7: //Zi.
								begin 
									addr_ZiMo3232<=640; //offset of Zi.
									//(206,692)
									//206+32=238, 692+32=724. =>(238,724)
									//addr=y*width+x=692*480+206=332366.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//332364/4=83091.
									oSDRAM_Wr_Addr<=332364;
								end
							8: //Mai.
								begin 
									addr_ZiMo3232<=768; //offset of Mai.
									//(206,724)
									//206+32=238, 724+32=756. =>(238,756)
									//addr=y*width+x=724*480+206=347726.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//347724/4=86931.
									oSDRAM_Wr_Addr<=347724;
								end
							9: //Chong.
								begin 
									addr_ZiMo3232<=896; //offset of Chong.
									//(206,756)
									//206+32=238, 756+32=788. =>(238,788)
									//addr=y*width+x=756*480+206=363086.
									//SDRAM Read/Write Address must be aligned by 4 words.
									//0,4,8,12,16,20,24,28,32,36,40.......
									//363084/4=90771.
									oSDRAM_Wr_Addr<=363084;
								end
						endcase
						
						//reset counter.
						cnt_bytes<=0;
						cnt_column<=0;
						i<=i+1'b1;
					end
				2: //pre-fetch 1st byte.
					begin pixel_data1<=data_ZiMo3232; i<=i+1'b1; end
				3:
					begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
				4: //pre-fetch 2st byte.
					begin pixel_data2<=data_ZiMo3232; i<=i+1'b1; end
				5:
					begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
				6: //pre-fetch 3st byte.
					begin pixel_data3<=data_ZiMo3232; i<=i+1'b1; end
				7:
					begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
				8: //pre-fetch 4st byte.
					begin pixel_data4<=data_ZiMo3232; i<=i+1'b1; end
				9:
					begin addr_ZiMo3232<=addr_ZiMo3232+1'b1; i<=i+1'b1; end
				10:
					begin
						case(cnt_bytes)
							0: pixel_data<=pixel_data4;
							1: pixel_data<=pixel_data3;
							2: pixel_data<=pixel_data2;
							3: pixel_data<=pixel_data1;
						endcase
						i<=i+1'b1;
					end
				11: //Loop to draw 4st byte - low 4 bits.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end					 
					else begin 
							oSDRAM_Wr_Req<=1; 
							//Pink: Foreground Color.
							//Black: Background Color.
							oSDRAM_Wr_Data1<=(pixel_data&8'h01)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data2<=(pixel_data&8'h02)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data3<=(pixel_data&8'h04)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data4<=(pixel_data&8'h08)?(`Color_White):(`Screen_Color_Background);
							//oSDRAM_Wr_Data1<=`Color_Green;
						end
				12: 
					begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
				13: //Loop to draw 4st byte - high 4 bits.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
					else begin 
							oSDRAM_Wr_Req<=1; 
							//Pink: Foreground Color.
							//Black: Background Color.
							oSDRAM_Wr_Data1<=(pixel_data&8'h10)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data2<=(pixel_data&8'h20)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data3<=(pixel_data&8'h40)?(`Color_White):(`Screen_Color_Background);
							oSDRAM_Wr_Data4<=(pixel_data&8'h80)?(`Color_White):(`Screen_Color_Background);
							//oSDRAM_Wr_Data1<=`Color_Green;
						end
				14: 
					begin oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr+4; i<=i+1'b1; end
				15: //32*32, 32bits/8bits=4bytes. 4 bytes of each column.
					begin 
						if(cnt_bytes==4-1) begin cnt_bytes<=0; i<=i+1'b1; end							
						else begin 
								cnt_bytes<=cnt_bytes+1'b1; 
								i<=10; //Loop to draw next byte of this column.
							end
					end
				16: //repeat 32 times of 4 bytes = 32*4=128 bytes of one 32*32 dot matrx.
					begin
						if(cnt_column==32-1) begin cnt_column<=0; i<=i+1'b1; end		
						else begin 
								cnt_column<=cnt_column+1'b1; 
								i<=2; //Loop to draw one complete digit.
							end
						//since we operate SDRAM four words each time.
						//so the address direction is increasing. 
						//then we should -32 in next column.
						//adjust coordinate: new position: x-32 and y+480.
						oSDRAM_Wr_Addr<=oSDRAM_Wr_Addr-32+480; //Next Column.
					end
				17: //we have 10 chars to be drawn.
					if(which_dot_matrix==10-1) begin which_dot_matrix<=0;i<=i+1'b1; end
					else begin 
							which_dot_matrix<=which_dot_matrix+1'b1; 
							i<=1; //Loop to draw Next dot matrix.
						end
				18: //Generate done Signal.
					begin oDraw_Done<=1'b1; i<=i+1'b1; end
				19: //Generate done Signal.
					begin oDraw_Done<=1'b0; i<=0; end
			endcase
		end
endmodule
