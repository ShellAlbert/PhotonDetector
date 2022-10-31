`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:56 10/28/2022 
// Design Name: 
// Module Name:    ZsySPI 
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
module ZsySPI(
    input clk,
    input rst_n,
	output wire cs_n,
	output wire sclk,
	output wire dc,
	output wire sdin,
	output wire oled_rst
    );
	
//When the pin is pulled high, the input at D7~D0 is treated as display data. 
//When the pin is pulled low, the input at D7~D0 will be transferred to the command register.
parameter DC_DATA=1'b1;
parameter DC_CMD=1'b0;

//10MHz -> 100KHz.
//10MHz/100KHz/2=50
reg [7:0] clkCounter;
wire clk_100khz;

//here We use 100MHz clock to get register data fast.
reg [7:0] reg_addr;
wire [7:0] reg_data;
reg dc_reg;
wire dc_reg2;

ZsyOledRegsData inst_ZsyOledRegsData(
    .clk(clk), //input
    .rst_n(rst_n), //input 
	.addr(reg_addr),//input
    .data(reg_data), //output
    .dc_flag(dc_reg2)); //output

reg tx_en;
reg [7:0] txData;
wire tx_done;

ZsySPI_TxByte inst_ZsySPI_TxByte(
.clk(clk_100khz), //input
.rst_n(rst_n), //input 
.en(tx_en), //input
.txByte(txData),//input 
.dc_flag(dc_reg), //input 
.cs_n(cs_n), //output
.sclk(sclk), //output
.dc(dc), //output
.sdin(sdin), //output
.isDone(tx_done) //output
);


//generate 100KHz clock.
//10MHz -> 100KHz.
//10MHz/100KHz/2=50
//for fast simulation, here set 1MHz. 10MHz/1MHz/2=5.
always @ (posedge clk or negedge rst_n)
if(!rst_n) 
		clkCounter<=8'd0;
else if(clkCounter==/*8'd5-1*/8'd50-1)
		clkCounter<=8'd0;
else	
		clkCounter<=clkCounter+1'b1;
		
assign clk_100khz=(clkCounter==/*8'd5-1*/8'd50-1)?1'b1:1'b0;


//Fetch Dot Matrix data.
reg [3:0] dotMatrix_addr;
wire [127:0] dotMatrix_data_top;
wire [127:0] dotMatrix_data_btm;

reg [127:0] rdotMatrix_data_top;
reg [127:0] rdotMatrix_data_btm;
reg [4:0] byte_cnt; 

//page counter.
reg [3:0] iPage;

//column counter.
reg [7:0] iCol;

//driven by step i.
reg [4:0] i;
always @ (posedge clk_100khz or negedge rst_n)
if(!rst_n)	begin
				i<=4'd0;
				tx_en<=1'b0;
				reg_addr<=8'd0;
				iCol<=8'd0;	
				iPage<=4'd0;
				dotMatrix_addr<=4'd0;
				byte_cnt<=5'd0;
			end
else 	case(i)
			5'd0,5'd1,5'd2,5'd3,5'd4: //reserved 5 clock period to reset OLED.
				begin 
					i<=i+1'b1;
					reg_addr<=8'd0;
					iPage<=4'd0;
				end
			5'd5: //configure ALL registers.
				if(tx_done) begin 
								tx_en<=1'b0;
								if(reg_addr==8'd28) //All done.
									i<=i+1'b1;
								else 
									reg_addr<=reg_addr+1'b1;
							end
				else	begin
							tx_en<=1'b1;
							txData<=reg_data;
							dc_reg<=dc_reg2;
						end
			5'd6:begin //clear screen: Set Page address.(0~7)
					if(tx_done) begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								txData<=8'hb0+iPage;  //page 0,1,2,3,4,5,6,7.
								dc_reg<=DC_CMD;
							end
				 end
			5'd7:begin //clear screen: Set display position column address(low byte).
					if(tx_done) 	begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								txData<=8'h00;  //low byte address.
								dc_reg<=DC_CMD;
							end
				 end
			5'd8:begin //clear screen: Set display position column address(high byte).
					if(tx_done) 	begin
									tx_en<=1'b0;
									i<=i+1'b1;
										
									//init Column counter.
									iCol<=8'd0;	
								end
					else 	begin
								tx_en<=1'b1;
								txData<=8'h10;  //high byte address.
								dc_reg<=DC_CMD;
							end
				 end
			5'd9:begin //Clear Screen: Fill all columns(0~127) of pages(0~7) with zero.
					if(tx_done)	begin
									tx_en<=1'b0;
									if(iCol==8'd128)
										i<=i+1'b1;
									else
										iCol<=iCol+1'b1; //increase column address.
									end
					else begin
							tx_en<=1'b1;
							txData<=8'h00; //write 0 to GRAM.
							dc_reg<=DC_DATA;
						 end
					end
			5'd10:begin //repeat all 7 pages.
					if(iPage==4'd7)
						i<=i+1'b1;
					else begin
							iPage<=iPage+1'b1; //next page.
							i<=4'd6; //repeat.
						 end
					end
			5'd11: //set Position(0,0)
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=8'hb0+y;
								txData<=8'hb0; //(,y). //y:0~7.
								dc_reg<=DC_CMD;
							end
			5'd12: //set Position(0,0)
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=((x&8'hf0)>>4)|8'h10;
								txData<=((0&8'hf0)>>4)|8'h10; //(x,) high byte of x.
								dc_reg<=DC_CMD;
							end
			5'd13: //set position(0,0)
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
									
									//initial byte counter to 0.
									byte_cnt<=5'd0;
									rdotMatrix_data_top<=dotMatrix_data_top;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=((x&8'h0f)|8'h0f);
								txData<=((0&8'h0f)|8'h0f); //(x,) low byte of x.
								dc_reg<=DC_CMD;
							end
			5'd14://show char at(0,0). top half at (0,0). //128bit/8bit=16.
					if(tx_done)	begin
									tx_en<=1'b0;
									if(byte_cnt==5'd16)	begin
															byte_cnt<=5'd0; 
															rdotMatrix_data_btm<=dotMatrix_data_btm;
															i<=i+1'b1;
														end
									else	begin
												byte_cnt<=byte_cnt+5'd1;
												rdotMatrix_data_top<=rdotMatrix_data_top<<8;//left shift.
											end
								end
					else	begin
								dotMatrix_addr<=4'd0; /*"单",0*/
								txData<=rdotMatrix_data_top[127:120];
								dc_reg<=DC_DATA;
								tx_en<=1'b1;
							end
			5'd15: //set y(page) Position(0,1), page 0~7.
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=8'hb0+y;
								txData<=8'hb0+1'b1; //(,y). //y:0~7.
								dc_reg<=DC_CMD;
							end
			5'd16: //set x Position high byte(0,1)
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=((x&8'hf0)>>4)|8'h10;
								txData<=((0&8'hf0)>>4)|8'h10; //(x,) high byte of x.
								dc_reg<=DC_CMD;
							end
			5'd17: //set x position low byte(0,0)
					if(tx_done)	begin
									tx_en<=1'b0;
									i<=i+1'b1;
									
									//initial byte counter to 0.
									byte_cnt<=5'd0;
									rdotMatrix_data_top<=dotMatrix_data_top;
								end
					else	begin
								tx_en<=1'b1;
								//txData<=((x&8'h0f)|8'h0f);
								txData<=((0&8'h0f)|8'h0f); //(x,) low byte of x.
								dc_reg<=DC_CMD;
							end
			5'd18://show char at(0,1). bottom half at (0,1).
					if(tx_done)	begin
									tx_en<=1'b0;
									if(byte_cnt==5'd16)	begin
															i<=i+1'b1;
														end
									else	begin
												byte_cnt<=byte_cnt+5'd1;
												rdotMatrix_data_btm<=rdotMatrix_data_btm<<8;//left shift.
											end
								end
					else	begin
								dotMatrix_addr<=4'd0; /*"单",0*/
								txData<=rdotMatrix_data_btm[127:120];
								dc_reg<=DC_DATA;
								tx_en<=1'b1;
							end
			5'd19:
				i<=i;
			default:
				i<=i;
		endcase

//RESET# OLED.
assign oled_rst=(i>2)?1'b1:1'b0;

//Fetch Dot Matrix data.
ZsyDotMatrix inst_ZsyDotMatrix(
.clk(clk),
.rst_n(rst_n),
.addr(dotMatrix_addr),
.data_top(dotMatrix_data_top),
.data_btm(dotMatrix_data_btm));

endmodule
