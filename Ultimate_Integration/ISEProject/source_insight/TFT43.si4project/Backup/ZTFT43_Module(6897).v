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
	//0: Idle.
	//1: Reset LCD.
	//2: Initial All Registers.
	//3: Set Column Address, iData1 as xStart, iData2 as xEnd.
	//4: Set Page Address, iData1 as yStart, iData2 as yEnd.
	//5: GRAM Operation, iData1=0:start to read GRAM, iData1=1, start to Write GRAM.
	//6: Display Operation, iData1=0:Display OFF, iData1=1:Display ON.
	//7: Write Data, iData1 as Data.
	input [3:0] iTrigger,
	input [15:0] iData1,
	input [15:0] iData2,
	output oDone,
	
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );
 reg oDone_r;
 assign oDone=oDone_r;
////////////////////////////////
reg en_Timing;
reg [1:0] trigger_Timing;
reg [15:0] cmd_Timing;
reg [15:0] dat_Timing;
wire done_Timing;
ZTFT43_Timing ic_Timing(
    .clk(clk), //input clk.
    .rst_n(rst_n), //input reset.
    .en(en_Timing), //input Enable.
    
    //Input Trigger.
    //[10]=01:Only Write Command, iData1 as command.
    //[10]=10:Only Write Data, iData1 as data.
    //[10]=11:Write Command+Data, iData1 as command, iData2 as data.
    //[10]=00: Reset LCD.
    .iTrigger(trigger_Timing),
    .iData1(cmd_Timing),
    .iData2(dat_Timing),

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
				oDone_r<=1'b0;
			end
else if(en) 	case(iTrigger)
				4'd1: //Reset LCD.
					case(i)
						4'd0:
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else	begin 
										en_Timing<=1'b1; 
										trigger_Timing=2'b00; //reset LCD.
									end
						4'd1:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd2:
							begin oDone_r<=1'b0; i<=4'd0; end 
					endcase
				4'd2: //Initial All Registers.
					case(i)
						4'd0: //Loop to tx All configured data.
							if(index==9'd381)	begin
													index<=9'd0;
													i<=i+1'b1;
												end
							else	begin
										if(done_Timing) begin 
															en_Timing<=1'b0;
															index<=index+1'b1; //next Cfg Item.
														end
										else begin 
												en_Timing<=1'b1; 
												trigger_Timing=2'b11; //Write Command+Data.
												cmd_Timing<=regAddr;
												dat_Timing<=regData;
											end
									end
						4'd1: //Write Command.
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b01; //Write Only Command.
									cmd_Timing<=16'h1100;
								end
						4'd2: //delay 120uS.
							//10MHz, 1/10MHz(s)=1000/10MHz(ms)=1000,000/10MHz(us)=1/10(us)=0.1uS
							//Here we counts to 300 to get 300us.
							//To save resources, we reuse index.
							if(index==9'd300) begin index<=9'd0; i<=i+1'b1; end				
							else begin index<=index+1'b1; end
							
						4'd3: //Write Command.
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b01; //Write Only Command.
									cmd_Timing<=16'h2900;
								end
						4'd4: //set SCAN dir.0x3600.
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h3600;
									//MY=0,MX=0,MV=0,ML=0,RGB=0,MH=0,RSMX=0,RSMY=0.
									dat_Timing<=16'h00;
								end
						4'd5: 
							begin oDone_r<=1'b1; i<=i+1'b1; end
								
						4'd6: 
							begin oDone_r<=1'b0; i<=4'd0; end
					endcase
				4'd3: //Set Column Address, iData1 as xStart, iData2 as xEnd.
					case(i)
						4'd0: //Column Start Address (0), xStart, XS[15:8]. (480*800,0~800-1/0x31F)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2A00;
									dat_Timing<={16'h00, iData1[15:8]}; //XS[15:8].
								end
						4'd1: //Column Start Address (0), xStart, XS[7:0]. (480*800,0~800-1/0x31F)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2A01;
									dat_Timing<={16'h00, iData1[7:0]}; //XS[7:0].
								end
						4'd2: //Column End Address (0), xEnd, XE[15:8]. (480*800,0~800-1/0x31F)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2A02;
									dat_Timing<={16'h00, iData2[15:8]}; //XE[15:8].
								end
						4'd3: //Column End Address (0), xEnd, XE[7:0]. (480*800,0~800-1/0x31F)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2A03;
									dat_Timing<={16'h00, iData2[7:0]}; //XE[7:0].
								end
						4'd4:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd5:
							begin oDone_r<=1'b0; i<=4'd0; end
					endcase
				4'd4: //Set Page Start/End Address.
					case(i)
						4'd0: //Row Start Address (0), yStart, YS[15:8]. (480*800,0~480-1/0x1DF)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2B00;
									dat_Timing<={16'h00, iData1[15:8]}; //YS[15:8].
								end
						4'd1: //Row Start Address (0), yStart, YS[7:0]. (480*800,0~480-1/0x1DF)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2B01;
									dat_Timing<={16'h00, iData1[7:0]}; //YS[7:0].
								end
						4'd2: //Row End Address (0), yEnd, YE[15:8]. (480*800,0~480-1/0x1DF)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2B02;
									dat_Timing<={16'h00, iData2[15:8]}; //YE[15:8].
								end
						4'd3: //Row End Address (0), yEnd, YE[7:0]. (480*800,0~480-1/0x1DF)
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b11; //Write Command+Data.
									cmd_Timing<=16'h2B03;
									dat_Timing<={16'h00, iData2[7:0]}; //YE[7:0].
								end
						4'd4:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd5:
							begin oDone_r<=1'b0; i<=4'd0; end 
					endcase
				4'd5: //GRAM Operation, iData1=0:start to read GRAM, iData1=1, start to Write GRAM.
					case(i)
						4'd0:
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b01; //Write Only Command.
									cmd_Timing<=iData1 ? 16'h2C00 : 16'h2E00;
								end
						4'd1:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd2:
							begin oDone_r<=1'b0; i<=4'd0; end 
					endcase
				4'd6: //Display Operation, iData1=0:Display OFF, iData1=1:Display ON.
					case(i)
						4'd0:
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b01; //Write Only Command.
									cmd_Timing<=iData1 ? 16'h2900 : 16'h2800;
								end
						4'd1:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd2:
							begin oDone_r<=1'b0; i<=4'd0; end 
					endcase
				4'd7: //Write Data, iData1 as Data.
					case(i)
						4'd0:
							if(done_Timing) begin en_Timing<=1'b0; i<=i+1'b1; end
							else begin 
									en_Timing<=1'b1; 
									trigger_Timing=2'b10; //Write Only Data.
									cmd_Timing<=iData1;
								end
						4'd1:
							begin oDone_r<=1'b1; i<=i+1'b1; end
						4'd2:
							begin oDone_r<=1'b0; i<=4'd0; end 
					endcase
				4'd8:
					i<=i;
			endcase
	else	begin
				oDone_r<=1'b0;
				i<=4'd0;
			end
endmodule