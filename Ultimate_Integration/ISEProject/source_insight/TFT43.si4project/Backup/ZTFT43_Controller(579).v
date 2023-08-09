`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:32 03/21/2023 
// Design Name: 
// Module Name:    ZTFT43_Controller 
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

module ZTFT43_Controller(
    input clk,
	input rst_n,
	input en,
	//Trigger Command.
	//0: Initial TFT Module.
	//1: Clear Screen, (iData1=xStart:0,iData3=xEnd:0) (iData2=yStart:480,iData4=yEnd:800) iData5=Color.
	//2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
	//3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
	//4: Draw A HLine, iData1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
	//5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
	//6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
	//7: Fill Data to Write Area, iData1=data, iData2=Color.
	//8: End Area Write.
	//9: Fast draw SIN wave, iData1=(x1),iData2=(y1),iData3=(x2),iData4=(y2),iData5=(Background Color).
	//10: Fast draw PulseCounter Curve.
	input [3:0] iTrigger,
	input [15:0] iData1,
	input [15:0] iData2,
	input [15:0] iData3,
	input [15:0] iData4,
	input [15:0] iData5,

	//PulseCounter FIFO Reading.
	input fifo_is_empty,
	output reg rd_fifo,
	input [31:0] fifo_data,
	
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
/////////////////////////////////////
reg en_TFT43;
reg [3:0] trigger_TFT43;
reg [15:0] data_TFT43;
wire done_TFT43;
ZTFT43_Module ic_TFT43(
    .clk(clk), //input.
    .rst_n(rst_n), //input.
    .en(en_TFT43), //input.
    
	//0: Reset LCD.
	//1: Initial All Registers.
    //2: LCD_CS, iData=1,High; iData=0,Low.
	//3: Write data, iData=data.
	//4: Write command, iData=command.
	.iTrigger(trigger_TFT43),
	.iData(data_TFT43),
	.oDone(done_TFT43),
	
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST), //output.
    .BL_CTR(BL_CTR), //output, BackLight Ctrl.
    .LCD_CS(LCD_CS), //output.
    .LCD_RS(LCD_RS), //output.
    .LCD_WR(LCD_WR), //output.
    .LCD_RD(LCD_RD), //output.
    .LCD_DATA(LCD_DATA) //output.
    );

//M9K=9*1024bits=9216bits.
//120 Samples*7-bits *2 periods =840bits *2 periods =1680 bits.
reg [9:0] addr_SIN;
wire [6:0] data_SIN;
reg [9:0] cnt_data_SIN;
reg [9:0] cnt_SIN_Shift;
ZM9K_SIN ic_M9K_SIN (
  .clka(clk), // input clka
  .addra(addr_SIN), // input [9 : 0] addra
  .douta(data_SIN) // output [6 : 0] douta
);


//FIFO to save Pulse Counter.
reg [7:0] data_in_FIFO;
reg wr_en_FIFO;
reg rd_en_FIFO;
wire [7:0] data_out_FIFO;
wire full_FIFO;
wire empty_FIFO;

reg [7:0] PulseCounter;
ZFIFO_PulseCounter ic_FIFO_PulseCounter (
  .clk(clk), // input clk
  .rst(rst_n), // input rst
  .din(data_in_FIFO), // input [7 : 0] din
  .wr_en(wr_en_FIFO), // input wr_en
  .rd_en(rd_en_FIFO), // input rd_en
  .dout(data_out_FIFO), // output [7 : 0] dout
  .full(full_FIFO), // output full
  .empty(empty_FIFO) // output empty
);



reg [15:0] x_addr;
reg [15:0] y_addr;
reg signed [15:0] x_delta;
reg signed [15:0] y_delta;
reg x_sign;
reg y_sign;
reg signed [15:0] error;
reg signed [15:0] error2;

//bit counter.
reg [3:0] cnt_bits;
reg [7:0] data_shadow;

//driven by step i.
reg [4:0] i;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=5'd0;
				en_TFT43<=1'b0;
				x_addr<=16'd0;
				y_addr<=16'd0;
				oDone_r<=1'b0;

				addr_SIN<=10'd0;
				cnt_bits<=4'd0;
				cnt_data_SIN<=10'd0;
				cnt_SIN_Shift<=10'd0;
			end
else if(en)	begin
				case(iTrigger)
					4'd0: //0: Initial TFT Module.
						case(i)
							5'd0: //Reset LCD.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd0; end
							5'd1: //Initial All Registers.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd1; end
							5'd2: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
							5'd3: //Write CMD:0x1100.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h1100; end
							5'd4: //Delay 120uS.
								//10MHz, 1/10MHz(s)=1000/10MHz(ms)=1000,000/10MHz(us)=1/10(us)=0.1uS
								//Here we counts to 300 to get 300us.
								//To save resources, we reuse x_addr.
								if(x_addr==9'd500) begin x_addr<=9'd0; i<=i+1'b1; end				
								else begin x_addr<=x_addr+1'b1; end
							5'd5: //Write CMD:0x2900.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2900; end
							5'd6: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
							5'd7: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end
							5'd8: //Done Signal.
								begin oDone_r<=1'b0; i<=4'd0; end
						endcase
					4'd1: //1: Clear Screen, (iData1=xStart:0,iData3=xEnd:0) (iData2=yStart:480,iData4=yEnd:800) iData5=Color.
						case(i)
							5'd0: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData1[15:8]; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData1[7:0]; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData3[15:8]; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData3[7:0]; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData2[15:8]; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData2[7:0]; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData4[15:8]; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData4[7:0]; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(y_addr==(iData4-iData2+1)) begin y_addr<=16'd0; i<=i+1'b1; end
								else if(x_addr==(iData3-iData1+1)) begin x_addr<=16'd0; y_addr<=y_addr+1'b1; end
									else begin
											if(done_TFT43) begin en_TFT43<=1'b0; x_addr<=x_addr+1'b1; end
											else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData5; end //Background Color.
										end
										
							5'd19: //Display ON CMD.(2900)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2900; end

							5'd20: //Set SCAN dir:0x3600.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h3600; end
							5'd21: //MY=0,MX=0,MV=0,ML=0,RGB=0,MH=0,RSMX=0,RSMY=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h0000; end
								
							5'd22: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end

							5'd23: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd24: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd2: //2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color). xStart=xEnd,yStart=yEnd.
						case(i)
							5'd0: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData3; end //Background Color.

							5'd19: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end

							5'd20: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd21: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd3: //3: Draw A VLine, iData1=(x), iData2=(y1), iData3=(y2), iData4=(Color).
						case(i)
							5'd0: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(y_addr==(iData3-iData2+1)) begin y_addr<=16'd0; i<=i+1'b1; end
								else begin
										if(done_TFT43) begin en_TFT43<=1'b0; y_addr<=y_addr+1'b1; end
										else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData4; end //Background Color.
									end
							5'd19: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
							5'd20: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd21: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end	
						endcase
					4'd4: //4: Draw A HLine, iData1=(x1), iData2=(x2), iData3=(y), iData4=(Color).
						case(i)
							5'd0: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(x_addr==(iData2-iData1+1)) begin x_addr<=16'd0; i<=i+1'b1; end
								else begin
										if(done_TFT43) begin en_TFT43<=1'b0; x_addr<=x_addr+1'b1; end
										else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData4; end //Background Color.
									end
							5'd19: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
							5'd20: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd21: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end	
						endcase
					4'd5: //5: Draw SIN Wave, iData1=xOffset, iData2=yOffset, iData3=Color.
						//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
						//If we want to draw 5 periods on screen, so 5*120=600.
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						case(i)
							5'd0: 
								begin 
									//Initial x_addr with xOffset, y_addr with yOffset.
									x_addr<=data_SIN+250; //xOffset=250.
									y_addr<=16'd100; //yOffset=100.
									
									//LCD_CS=0.  
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,x_addr[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,x_addr[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,x_addr[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,x_addr[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,y_addr[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,y_addr[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,y_addr[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,y_addr[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=iData3; end //Background Color.

							5'd19: //We have 600 Points(120Points*5-Periods to draw).
								if(cnt_data_SIN==10'd600-1) begin 
															cnt_data_SIN<=10'd0; 
															i<=i+1'b1; 
														end
								else begin 
										cnt_data_SIN<=cnt_data_SIN+1'b1; //next Point.

										//Loop addr of SIN data.
										if(addr_SIN==10'd600-1 ) begin addr_SIN<=10'd0; end				
										else begin addr_SIN<=addr_SIN+1'b1; end

										//next point position(x,y).
										x_addr<=data_SIN+250; //xOffset=250.
										y_addr<=y_addr+'d1; //Next Y. (Pixel Gap is 1.)
										i<=5'd1; //Loop.
									end
							5'd20: 
								//LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
								
							5'd21: //Done Signal.
								begin 
									//Generate Done Signal.
									oDone_r<=1'b1; i<=i+1'b1; 

									//SIN shift accumulation here.
									if(cnt_SIN_Shift==10'd120-1)
										cnt_SIN_Shift<=10'd0;
									else
										cnt_SIN_Shift<=cnt_SIN_Shift+1'b1; 
										
									//infect addr_SIN next time.
									addr_SIN<=cnt_SIN_Shift;
									//addr_SIN<=10'd0;
								end

							5'd22: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd6: //6: PreSet Write Area, iData1=(x1), iData2=(y1), iData3=(x2), iData4=(y2).
						case(i)
							5'd0: //LCD_CS=0.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end
								
							5'd18: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd19: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd7: //7: Fill Data to Write Area, iData1=data, iData2=Color.
						case(i)
							5'd0:
								begin
									data_shadow<=iData1[7:0];
									cnt_bits<=4'd0;
									i<=i+1'b1;
								end
							5'd1:
								if(done_TFT43) begin 
													en_TFT43<=1'b0; 
													data_shadow<=data_shadow<<1;
													i<=i+1'b1; 
												end
								else begin 
										en_TFT43<=1'b1; 
										trigger_TFT43<=4'd3; 
										//Background Color=Black: 16'h0000; Yellow: 16'hFFE0;
										data_TFT43<=(data_shadow&8'h80) ? iData2 : `Color_Black;
										//data_TFT43<=16'h7E0;
									end 
							5'd2:
								if(cnt_bits==4'd8-1) begin cnt_bits<=4'd0; i<=i+1'b1; end
								else begin cnt_bits<=cnt_bits+1'b1; i<=5'd1; end
							5'd3: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd4: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd8: //8: End Area Write.
						case(i)
							5'd0: //LCD_CS=1.
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
							5'd1: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd2: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd9: //9: Fast draw SIN wave, iData1=(x1),iData2=(y1),iData3=(x2),iData4=(y2),iData5=(Background Color).
						//Single Period SIN wave is 120 points, 7-bit, 2^7=128.
						//If we want to draw 5 periods on screen, so 5*120=600.
						//Draw SIN wave in rectangle (250,100)-(250+128,100+600)=(378,700).
						case(i)
							5'd0: //LCD_CS=0.
								begin
									/*
									iData1<=250; iData2<=100; 
									iData3<=378-1; iData4<=700-1; 
									*/
									x_addr<=iData1; //xOffset.
									y_addr<=iData2; //yOffset.
									
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								end
							5'd1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							5'd2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							5'd3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							5'd4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5'd5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							5'd6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							5'd7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							5'd8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end

							5'd9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							5'd10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							5'd11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							5'd12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end
								
							5'd13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							5'd14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[15:8]}; end
								
							5'd15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							5'd16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[7:0]}; end

							5'd17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

							5'd18: //Fill Data.
								if(y_addr==iData4+1) begin 
													y_addr<=16'd0; 
													i<=i+1'b1; 
												end
								else if(x_addr==iData3+1) begin 
														x_addr<=iData1; 
														y_addr<=y_addr+1'b1; 

														//Loop address of SIN ROM.
														if(addr_SIN==10'd600-1)
															addr_SIN<=0;
														else
															addr_SIN<=addr_SIN+1'b1;
													end
									else begin
											if(done_TFT43) begin 
															en_TFT43<=1'b0; 
															x_addr<=x_addr+1'b1; 
														end
											else begin 
													en_TFT43<=1'b1; 
													trigger_TFT43<=4'd3; 
													/*
													if(x_addr==(data_SIN+250)) //xOffset=250.
														data_TFT43<=`Color_Green; //Foreground Color.
													else
														data_TFT43<=`Color_Black; //Background Color.
													*/
													//make it looks bold effect.
													case(x_addr)
														data_SIN+250,data_SIN+250+1,data_SIN+250-1,data_SIN+250+2,data_SIN+250-2:
															data_TFT43<=`Color_Green; //Foreground Color.
														default:
															data_TFT43<=`Color_Black; //Background Color.
													endcase
												end 
										end
							5'd19: //LCD_CS=1.
								begin
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end

									//To generate Left Move Effect.
									//SIN shift accumulation here.
									if(cnt_SIN_Shift==10'd120-1)
										cnt_SIN_Shift<=10'd0;
									else
										cnt_SIN_Shift<=cnt_SIN_Shift+1'b1; 
										
									//affect addr_SIN next time.
									addr_SIN<=cnt_SIN_Shift;
								end

							5'd20: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							5'd21: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd10: //9: Fast draw PulseCounter Curve, iData1=(x1),iData2=(y1),iData3=(x2),iData4=(y2),iData5=(Background Color).
						//keep same points as SIN wave, so it's 600.
						//Draw PulseCounter Curve in rectangle (10,100)-(10+190,100+600)=(200,700).
						case(i)
							0: //LCD_CS=0.
								begin
									/*
									iData1<=10; iData2<=100; 
									iData3<=200-1; iData4<=700-1; 
									*/
									x_addr<=iData1; //xOffset.
									y_addr<=iData2; //yOffset.
									
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
								end
							1: //CASET CMD.(0x2A00)=xStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
							2: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[15:8]}; end
								
							3: //CASET CMD.(0x2A01)=xStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
							4: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData1[7:0]}; end
								
							5: //CASET CMD.(0x2A02)=xEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
							6: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[15:8]}; end
								
							7: //CASET CMD.(0x2A03)=xEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
							8: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData3[7:0]}; end

							9: //RASET CMD.(0x2B00)=yStart[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
							10: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[15:8]}; end
								
							11: //RASET CMD.(0x2B01)=yStart[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
							12: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData2[7:0]}; end
								
							13: //RASET CMD.(0x2B02)=yEnd[15:8]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
							14: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[15:8]}; end
								
							15: //RASET CMD.(0x2B03)=yEnd[7:0]
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
							16: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<={8'h00,iData4[7:0]}; end

							17: //RAMWR.(2C00)
								if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
								else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end
								
							18: //Fetch one data from PulseCounter FIFO.
								if(!fifo_is_empty) begin
													rd_fifo<=1'b1;
													i<=i+1'b1;
												end
							19: //Draw Pixel.
								begin
									rd_fifo<=1'b0;
									
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin 
											en_TFT43<=1'b1; 
											trigger_TFT43<=4'd3; 
											
											//if(x_addr<100)
											//right shift 4 bits to avoid reach full-scale.
											//500(Hex), right shift 4 bits, 50(Hex)=80(Dec)
											if(x_addr<(fifo_data>>4))
												data_TFT43<=`Color_Pink; //Foreground Color.
											else
												data_TFT43<=`Color_Black; //Background Color.
										end 
								end
							20: //X Coordinate.
								if(x_addr==iData3) begin 
													x_addr<=iData1; //Reset X.
													i<=i+1'b1;
												end
								else begin
										x_addr<=x_addr+1'b1;
										i<=19; //Loop to draw current PulseCounter.
									end
							21: //Y Coordinate.
								if(y_addr==iData4) begin 
													y_addr<=iData2; //Reset Y.
													i<=i+1'b1; 
												end
								else begin
										y_addr<=y_addr+1'b1;
										i<=18; //Loop to Next PulseCounter.
									end
/*
							5'd18: //Fill Data.
								begin
									rd_fifo<=1'b0;
									
									if(y_addr==iData4+1) begin 
														y_addr<=16'd0; 
														i<=i+1'b1; 
													end
									else if(x_addr==iData3+1) begin 
															x_addr<=iData1; 
															y_addr<=y_addr+1'b1; 

															//read request when FIFO is not empty.
															if(!empty_FIFO)
																rd_en_FIFO<=1'b1;
														end
										else begin
												if(done_TFT43) begin 
																en_TFT43<=1'b0; 
																x_addr<=x_addr+1'b1; 
																rd_en_FIFO<=1'b0;
															end
												else begin 
														en_TFT43<=1'b1; 
														trigger_TFT43<=4'd3; 
														
														//if(x_addr<100)
														if(x_addr<data_out_FIFO)
															data_TFT43<=`Color_Pink; //Foreground Color.
														else
															data_TFT43<=`Color_Black; //Background Color.
													end 
											end
								end
*/
							22: //LCD_CS=1.
								begin
									if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
									else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
								end

							23: //Done Signal.
								begin oDone_r<=1'b1; i<=i+1'b1; end

							24: //Done Signal.
								begin oDone_r<=1'b0; i<=5'd0; end
						endcase
					4'd12:
						//New iTrigger Process Here.
						begin x_addr<=16'd0; y_addr<=16'd0; end
						
				endcase
			end
//////////////////////////////
/*
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				x_addr<=16'd0;
				y_addr<=16'd0;
			end
else case(i)


				
		4'd10: //Loop to Tx Data.
			if(x_addr==16'd800) begin x_addr<=16'd0; i<=i+1'b1; end
			else if(y_addr==16'd20) begin y_addr<=16'd0; x_addr<=x_addr+1'b1; end
				else begin
						if(oDone_TFT43) begin en_TFT43<=1'b0; y_addr<=y_addr+1'b1; end
						else begin 
								en_TFT43<=1'b1; 
								iTrigger_TFT43<=4'd7; //Write Data, iData1 as Data.
								iData1_TFT43<=16'h320;
							end
					end
					

	endcase
*/
//Process to write data into FIFO.
//driven by step i.
reg [7:0] iFIFO;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				iFIFO<=8'd0;
				data_in_FIFO<=8'd0;
				wr_en_FIFO<=1'b0;
			end
else case(iFIFO)
		8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9,8'd10:
			iFIFO<=iFIFO+1'b1;
		8'd11:
			begin
				if(full_FIFO==1'b1) begin 
									iFIFO<=iFIFO;
								end
				else begin 
						wr_en_FIFO<=1'b1; 
						iFIFO<=iFIFO+1'b1; 
					end 

				//data_in_FIFO<=8'd255; 8bits=0~255.
				//>>1: /2.  256/2=128.
				if(data_in_FIFO==128)
					data_in_FIFO<=0;
				else
					data_in_FIFO<=(data_in_FIFO+5); //generate RANDOM.
			end
		8'd12:
			begin wr_en_FIFO<=1'b0; iFIFO<=iFIFO+1'b1; end
		8'd13:
			begin iFIFO<=8'd0; end
	endcase

endmodule
