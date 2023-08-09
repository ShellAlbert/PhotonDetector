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

	//to help ZTFT43_Adapter update progress bar during SDRAM Testing.
	output reg [11:0] oSDRAM_Bar_Value, //range: 0~799.
	output reg oSDRAM_Testing_Done,
    
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

//driven by step i.
reg [15:0] i;
reg [31:0] cnt;

///////////////////////
reg [23:0] sdram_rw_addr; //SDRAM RW Address.
reg [63:0] wr_data;
reg [63:0] rd_data;
///////////////////////////////////////
reg [31:0] cnt_bar_step;
reg [15:0] color_bar;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
			i<=0;
			oSDRAM_Wr_Addr<=0;
			oSDRAM_Wr_Data1<=0;
			oSDRAM_Wr_Data2<=0;
			oSDRAM_Wr_Data3<=0;
			oSDRAM_Wr_Data4<=0;
			oSDRAM_Wr_Req<=1'b0;
			
			cnt_bar_step<=0;

			oSDRAM_Bar_Value<=0;
			oSDRAM_Testing_Done<=1'b0;
			oTestDone<=1'b0;
		end
else if(en) begin
			case(i)
				0: //prepare address and data.
					begin 
						sdram_rw_addr<=0;
						wr_data<=0;
						rd_data<=0;
						
						cnt_bar_step<=0;
						cnt<=0;
						i<=i+1'b1;
					end
				1: //write data to SDRAM.
					if(iSDRAM_Wr_Done) begin oSDRAM_Wr_Req<=0; i<=i+1'b1; end				 
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Addr<=sdram_rw_addr;
							oSDRAM_Wr_Data1<=wr_data[15:0];
							oSDRAM_Wr_Data2<=wr_data[31:16];
							oSDRAM_Wr_Data3<=wr_data[47:32];
							oSDRAM_Wr_Data4<=wr_data[63:48];
						end	
				2: //read data from SDRAM.
					if(iSDRAM_Rd_Done) begin oSDRAM_Rd_Req<=0; i<=i+1'b1; end				 
					else begin 
							oSDRAM_Rd_Req<=1; 
							oSDRAM_Rd_Addr<=sdram_rw_addr;
							rd_data[15:0]<=iSDRAM_Data1;
							rd_data[31:16]<=iSDRAM_Data2;
							rd_data[47:32]<=iSDRAM_Data3;
							rd_data[63:48]<=iSDRAM_Data4;
						end	
				3: //compare data.
					begin
						if(rd_data!=wr_data) 
							color_bar<=`Color_Red;
						else 
							color_bar<=`Color_White;
						if(cnt>=100) begin cnt<=0; i<=i+1; end
						else begin cnt<=cnt+1; end
					end
				4: //800*480=384000, +600 points history data=600*4=2400. 
				//384000+600*4=386400.
					if(sdram_rw_addr>=386400-1) begin
													sdram_rw_addr<=0;
													i<=i+1'b1;
												end
					else begin
							sdram_rw_addr<=sdram_rw_addr+1'b1;
							wr_data<=wr_data+1;
							
							//384000/800-screen-width=480.
							if(cnt_bar_step>=480) begin
													cnt_bar_step<=0;
													oSDRAM_Bar_Value<=oSDRAM_Bar_Value+1;
												end
							else
								cnt_bar_step<=cnt_bar_step+1'b1;
							///////////////////////////////////////
							i<=1; //Loop to test next address.
						end
				5: //SDRAM Testing Done.
					begin
						oSDRAM_Testing_Done<=1'b1;
						i<=i+1'b1;

						//-------------  Stop Here for Debugging  -----------------
						//i<=i;
					end
				6: //Other peripherals Testing could be added here in the future.
					begin
						i<=i+1'b1;
					end
				7:
					begin
						oTestDone<=1'b1;
						i<=i;
					end
			endcase
		 end
	else begin //if(en)
			i<=0;
			oSDRAM_Testing_Done<=1'b0;
			oTestDone<=1'b0;
		end
endmodule
