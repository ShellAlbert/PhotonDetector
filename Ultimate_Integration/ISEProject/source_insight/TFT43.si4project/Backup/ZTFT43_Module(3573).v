`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:01 03/20/2023 
// Design Name: 
// Module Name:    ZTFT43_Module 
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
module ZTFT43_Module(
    input clk,
    input rst_n,
    input en,

	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA,

    output oDone //done signal.
    );

reg en_Timing;
reg [1:0] trigger_Timing;
input [15:0] cmd_Timing;
input [15:0] dat_Timing;
reg done_Timing;
ZTFT43_Timing ic_Timing(
    .clk(clk), //input clk.
    .rst_n(rst_n), //input reset.
    .en(en_Timing), //input Enable.
    //Input Trigger.
    //[0]=1:Only Write Command.
    //[1]=1:Write Command+Data.
    .iTrigger(trigger_Timing),
    .iCommand(cmd_Timing),
    .iData(dat_Timing),

    //physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST), //output to TFT.
    .BL_CTR(BL_CTR), //output to TFT,BackLight Ctrl.
    .LCD_CS(LCD_CS), //output to TFT.
    .LCD_RS(LCD_RS), //output to TFT.
    .LCD_WR(LCD_WR), //output to TFT.
    .LCD_RD(LCD_RD), //output to TFT.
    .LCD_DATA(LCD_DATA), //output to TFT.

    .oDone(done_Timing) //output, done signal.
    );

reg [8:0] index;
wire [15:0] regAddr;
wire [15:0] regData;
ZTFT43_CfgData ic_CfgData(
    .iIndex(index), //input.
    .oRegAddr(regAddr), //output, register address.
    .oRegData(regData) //output, register data.
    );

//driven by step i.
reg [3:0] i;
always@(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
			end
else	case(i)
			4'd0:
				begin index<=9'd0; i<=i+1'b1; end
			4'd1: //initial all registers with data.
				if(index==9'd381)	begin
										index<=9'd0;
										i<=i+1'b1;
									end
				else	begin
							if(done_Timing) begin 
												en_Timing<=1'b0;
												index<=index+1'b1;
											end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b10; //Write Command+Data.
									cmd_Timing<=regAddr;
									dat_Timing<=regData;
								end
						end
						
			4'd2: //write command.
				if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
				else begin 
						en_Timing<=1'b1; 
						trigger_Timing=2'b01; //Write Only Command.
						cmd_Timing<=16'h1100;
					end
					
			4'd3: //delay 120uS.
				//10MHz, 1/10MHz(s)=1000/10MHz(ms)=1000,000/10MHz(us)=1/10(us)=0.1uS
				//Here we counts to 300 to get 300us.
				//To save resources, we reuse index.
				if(index==9'd300) begin index<=9'd0; i=i+1'b1; end				
				else begin index<=index+1'b1; end
				
			4'd4: //write command.
				if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
				else begin 
						en_Timing<=1'b1; 
						trigger_Timing=2'b01; //Write Only Command.
						cmd_Timing<=16'h2900;
					end
					
			4'd5:
		endcase
endmodule