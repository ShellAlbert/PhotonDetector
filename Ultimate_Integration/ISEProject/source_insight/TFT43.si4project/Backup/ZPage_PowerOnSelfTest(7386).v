`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:43 05/05/2023 
// Design Name: 
// Module Name:    ZPage_SDRAM_Testing 
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
module ZPage_PowerOnSelfTest(
    input clk,
    input rst_n,
    input en,
    
	//SDRAM Read Glue Logic.
    output reg [23:0] oSDRAM_Rd_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iSDRAM_Data1, //input, read back data1 from SDRAM.
    input [15:0] iSDRAM_Data2, //input, read back data2 from SDRAM.
    input [15:0] iSDRAM_Data3, //input, read back data3 from SDRAM.
    input [15:0] iSDRAM_Data4, //input, read back data4 from SDRAM.

    output reg oSDRAM_Rd_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Rd_Done, //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    output reg [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output reg [15:0] oSDRAM_Wr_Data1, //ouptut, write data1 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data2, //ouptut, write data2 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data3, //ouptut, write data3 to SDRAM.
    output reg [15:0] oSDRAM_Wr_Data4, //ouptut, write data4 to SDRAM.

    output reg oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.
    
	//Test done successfully.
    output reg oTestDone
    );

reg [15:0] addr_ROM;
wire [7:0] data_ROM;
ZROM_PowerOnSelfTest ic_ROM_PowerOnSelfTest (
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

			oTestDone<=1'b0;
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
				11: //stop here.
					begin
						oTestDone<=1'b1;
						i<=i+1'b1;
					end
			endcase
		 end
	else begin //if(en)
			i<=0;
			oTestDone<=1'b0;
		end
endmodule
