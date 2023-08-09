`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:21 03/22/2023 
// Design Name: 
// Module Name:    ZTFT43_Adapter 
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
//Power ON Timing.
//2s Full screen Red Color to represent screen interface works well.
//2s Full screen Green Color to represent SDRAM interface works well.

module ZTFT43_Adapter(
    input clk,
    input rst_n,
    input en,

	//SDRAM Glue Logic.
    output reg [23:0] oSDRAM_Rd_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iSDRAM_Data1, //input, read back data1 from SDRAM.
    input [15:0] iSDRAM_Data2, //input, read back data2 from SDRAM.
    input [15:0] iSDRAM_Data3, //input, read back data3 from SDRAM.
    input [15:0] iSDRAM_Data4, //input, read back data4 from SDRAM.

    output reg oSDRAM_Rd_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Rd_Done, //input,[1]=1:write done, [0]=1:read done.

    //use an oscilloscope to check how many clks were used.
    output reg clk_used, 
    output uart_txd,
    
	//physical pins connected to TFT 4.3'' screen.
    output LCD_RST,
    output BL_CTR, //BackLight Ctrl.
    output LCD_CS,
    output LCD_RS,
    output LCD_WR,
    output LCD_RD,
    output [15:0] LCD_DATA
    );

////////////////////////
reg en_Dump2UART;
wire done_Dump2UART;
reg [15:0] data_Dump2UART;
ZDataDump2UART ic_dump2UART(
    .clk(clk),
    .rst_n(rst_n),
    .en(en_Dump2UART),
    
    .data(data_Dump2UART),
    .tx_pin(uart_txd),
    .done(done_Dump2UART)
    );
/////////////////////////////////////////////////////
//PulseCounter Address Mux, Combination Logic, No clock.
/*
reg [3:0] select_PulseCounterMux;
wire [10:0] dout_PulseCounter_Addr;
ZPulseCounter_Mux10to1 ic_PulseCounter_Mux(
	//0: q7
	//1: q6
	//2: q5
	//3: q4
	//4: q3
	//5: q2
	//6: q1
	//7: q0
    .select(select_PulseCounterMux),
    
    .q0(fifo_data[3:0]), //input.
    .q1(fifo_data[7:4]),
    .q2(fifo_data[11:8]),
    .q3(fifo_data[15:12]),
    .q4(fifo_data[19:16]),
    .q5(fifo_data[23:20]),
    .q6(fifo_data[27:24]),
    .q7(fifo_data[31:28]),
    
    .dout(dout_PulseCounter_Addr) //output.
    );
 */
///////////////////////////////////////////////////////////////////


/////////////////////////////////
/*
reg en_TFT;
reg [3:0] trigger_TFT;
reg [15:0] data1_TFT;
reg [15:0] data2_TFT;
reg [15:0] data3_TFT;
reg [15:0] data4_TFT;
reg [15:0] data5_TFT;
wire done_TFT;
ZTFT43_Controller ic_TFT_Controller(
    .clk(clk),
	.rst_n(rst_n),
	.en(en_TFT),
	
	//Trigger Command.
	//0: Initial TFT Module.
	//1: Clear Screen, iData1=Color.
	//2: Draw A Point, iData1=(x), iData2=(y), iData3=(Color).
	.iTrigger(trigger_TFT), //input.
	.iData1(data1_TFT),
	.iData2(data2_TFT),
	.iData3(data3_TFT),
	.iData4(data4_TFT),
	.iData5(data5_TFT),

	//PulseCounter FIFO Reading.
	.fifo_is_empty(fifo_is_empty),
	.rd_fifo(rd_fifo),
	.fifo_data(fifo_data),

	.oDone(done_TFT),
	
	//physical pins connected to TFT 4.3'' screen.
    .LCD_RST(LCD_RST), //output.
    .BL_CTR(BL_CTR), //output, BackLight Ctrl.
    .LCD_CS(LCD_CS), //output.
    .LCD_RS(LCD_RS), //output.
    .LCD_WR(LCD_WR), //output.
    .LCD_RD(LCD_RD), //output.
    .LCD_DATA(LCD_DATA) //output.
    );
*/
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
//60Hz Refresh Rate.
//133MHz/60Hz=2_216_666/2=1108333
reg [23:0] cnt_60Hz;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				cnt_60Hz<=0;
			end
else begin
		if(cnt_60Hz==3_216_666-1)
			cnt_60Hz<=0;
		else
			cnt_60Hz<=cnt_60Hz+1;
	end
//Self Aux Logic driven by step i.
reg [15:0] i;
reg [15:0] pixel_data1;
reg [15:0] pixel_data2;
reg [15:0] pixel_data3;
reg [15:0] pixel_data4;
//480*800=384000.
reg [31:0] CNT1;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				CNT1<=0;
				oSDRAM_Rd_Addr<=0;
				oSDRAM_Rd_Req<=1'b0; 

				//to count how many clk of one refresh period cost.
				clk_used<=1'b0;
			end
else if(en) begin
			case(i)
				//////Initial TFT Module//////
				0: //Reset LCD.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd0; //0: Reset LCD.
						end
				1: //Initial All Registers.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd1; //1: Initial All Registers.
						end
				2: //LCD_CS=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd2; //2: LCD_CS, iData=1,High; iData=0,Low.
							data_TFT43<=16'd0; 
						end
				3: //Write CMD:0x1100.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd4; //4: Write command, iData=command.
							data_TFT43<=16'h1100; 
						end
				4: //Delay 120uS.
					//10MHz, 1/10MHz(s)=1000/10MHz(ms)=1000,000/10MHz(us)=1/10(us)=0.1uS
					//Here we counts to 300 to get 300us.
					//To save resources, we reuse x_addr.
					if(CNT1==9'd500) begin CNT1<=9'd0; i<=i+1'b1; end				
					else begin CNT1<=CNT1+1'b1; end
					
				5: //Write CMD:0x2900.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd4; //4: Write command, iData=command.
							data_TFT43<=16'h2900; 
						end
				6: //LCD_CS=1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd2; //2: LCD_CS, iData=1,High; iData=0,Low.
							data_TFT43<=16'd1; 
						end

				//////Clear Screen//////
				7: //LCD_CS=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd2; //2: LCD_CS, iData=1,High; iData=0,Low.
							data_TFT43<=16'd0; 
						end
					
				8: //CASET CMD.(0x2A00)=xStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
				9: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				10: //CASET CMD.(0x2A01)=xStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
				11: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				12: //CASET CMD.(0x2A02)=xEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
				13: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h01; end
					
				14: //CASET CMD.(0x2A03)=xEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
				15: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'hDF; end

				16: //RASET CMD.(0x2B00)=yStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
				17: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				18: //RASET CMD.(0x2B01)=yStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
				19: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				20: //RASET CMD.(0x2B02)=yEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
				21: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h03; end
					
				22: //RASET CMD.(0x2B03)=yEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
				23: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h1F; end

				24: //RAMWR.(2C00)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

				25: //Fill Data.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=`Color_Red; //Background Color.
						end 
				26: //Loop.
					if(CNT1==384000-1) begin CNT1<=0; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; i<=i-1'b1; end
					
				27: //Display ON CMD.(2900)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2900; end

				28: //Set SCAN dir:0x3600.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h3600; end
				29: //MY=0,MX=0,MV=0,ML=0,RGB=0,MH=0,RSMX=0,RSMY=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h0000; end
					
				30: //LCD_CS=1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end	
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd2; //2: LCD_CS, iData=1,High; iData=0,Low.
							data_TFT43<=16'd1; 
						end
				31: //2s Full screen Red Color to check if screen interface works well.
					//t=2s, f=1/t=1/2s=0.5Hz
					//80MHz/0.5Hz=160_000_000
					if(CNT1==160_000_000) begin CNT1<=0; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; end
				32:
					begin 
						//oInitReady<=1'b1; 
						i<=i+1'b1; 
					end
				/////////////////////////////////////////////////
				33: //60Hz trigger signal.
					//if the value is too short, the LCD will shadow.
					/*
					if(cnt_60Hz==3_216_666-1) begin
												clk_used<=1'b1;
												i<=i+1'b1;
											end
					*/
					if(CNT1==80_000) begin CNT1<=0; clk_used<=1'b1; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; end
				//////PreSet Write Area//////
				34: //LCD_CS=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
					
				35: //CASET CMD.(0x2A00)=xStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
				36: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				37: //CASET CMD.(0x2A01)=xStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
				38: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				39: //CASET CMD.(0x2A02)=xEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
				40: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h01; end
					
				41: //CASET CMD.(0x2A03)=xEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
				42: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'hDF; end

				43: //RASET CMD.(0x2B00)=yStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
				44: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				45: //RASET CMD.(0x2B01)=yStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
				46: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				47: //RASET CMD.(0x2B02)=yEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
				48: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h03; end
					
				49: //RASET CMD.(0x2B03)=yEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
				50: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h1F; end

				51: //RAMWR.(2C00)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end	
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end
					
				52: //Read 4 Words (Pixels) from SDRAM.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										pixel_data1<=iSDRAM_Data1;
										pixel_data2<=iSDRAM_Data2;
										pixel_data3<=iSDRAM_Data3;
										pixel_data4<=iSDRAM_Data4;
										//pixel_data1<=`Color_Pink;
										//pixel_data2<=`Color_Pink;
										//pixel_data3<=`Color_Pink;
										//pixel_data4<=`Color_Pink;
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
						end
				53: //Dump to UART to check if data read from SDRAM are right.
					/*
					if(done_Dump2UART) begin en_Dump2UART<=1'b0; i<=i+1'b1; end
					else begin en_Dump2UART<=1'b1; data_Dump2UART<=pixel_data1; end
					*/
					i<=i+1'b1;

				54: //Fast Fill Pixel Data, iData1=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data1; //1st.
						end 
				55: //Fast Fill Pixel Data, iData2=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data2; //2st.
						end 
				56: //Fast Fill Pixel Data, iData3=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data3; //3st.
						end 
				57: //Fast Fill Pixel Data, iData4=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data4; //4st.
						end 
			
				58: //480*800=384000.  (0~384000-1)   
					//Since we operate 4 words each time so the last one is 383996, 383997, 383998,383999.
					if(oSDRAM_Rd_Addr>=383996) begin oSDRAM_Rd_Addr<=0; i<=i+1'b1; end				
					else begin
							//0,1,2,3......4,5,6,7.....8,9,10,11....... we read 4 words each time.
							oSDRAM_Rd_Addr<=oSDRAM_Rd_Addr+4;
							i<=52; //Loop to draw next pixel.
						end
				59: //LCD_CS=1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
				60: 
					begin 
						clk_used<=1'b0;
						i<=33; //Loop to refresh.
					end
			endcase
		 end
endmodule
