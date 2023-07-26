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

	//to help ZTFT43_Adapter update progress bar during SDRAM Testing.
	input [11:0] iSDRAM_Bar_Value, //range: 0~799.
	input iSDRAM_Testing_Done,

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
reg [15:0] addr_ROM;
wire [7:0] data_ROM;
ZROM_PowerOnSelfTest ic_ROM_PowerOnSelfTest (
  .clka(clk), // input clka
  .addra(addr_ROM), // input [15 : 0] addra
  .douta(data_ROM) // output [7 : 0] douta
);
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
reg [15:0] Go;
reg [15:0] xStart;
reg [15:0] xEnd;
reg [15:0] yStart;
reg [15:0] yEnd;
reg [15:0] pixel_data1;
reg [15:0] pixel_data2;
reg [15:0] pixel_data3;
reg [15:0] pixel_data4;
//480*800=384000.
reg [31:0] CNT1;
///////////////////
reg [31:0] offset_x;
reg [31:0] offset_y;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				CNT1<=0;
				oSDRAM_Rd_Addr<=0;
				oSDRAM_Rd_Req<=1'b0; 

				addr_ROM<=0; 
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
						
				8: //Display ON CMD.(2900)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2900; end

				9: //Set SCAN dir:0x3600.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h3600; end
				10: //MY=0,MX=0,MV=0,ML=0,RGB=0,MH=0,RSMX=0,RSMY=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h0000; end
					
				11: //CASET CMD.(0x2A00)=xStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
				12: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				13: //CASET CMD.(0x2A01)=xStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
				14: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				15: //CASET CMD.(0x2A02)=xEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
				16: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h01; end
					
				17: //CASET CMD.(0x2A03)=xEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
				18: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'hDF; end

				19: //RASET CMD.(0x2B00)=yStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
				20: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				21: //RASET CMD.(0x2B01)=yStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
				22: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				23: //RASET CMD.(0x2B02)=yEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
				24: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h03; end
					
				25: //RASET CMD.(0x2B03)=yEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
				26: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h1F; end

				27: //RAMWR.(2C00)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end

				//Bitmap Image: 800*480.  /8bits=48000bytes.
				//Image2Lcd v3.2
				//Output data type: C Language Array(*.c)
				//Scan Mode: Vertical Scan.
				//Output Gray: Single.
				//Max width&height: 800x480.
				//scan from bottom to top.
				28: //Fill Data-1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h01)?(`Color_Red):(`Color_Green);
						end 
				29: //Fill Data-2.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h02)?(`Color_Red):(`Color_Green);
						end 
				30: //Fill Data-3.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h04)?(`Color_Red):(`Color_Green);
						end 
				31: //Fill Data-4.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h08)?(`Color_Red):(`Color_Green);
						end 
				32: //Fill Data-5.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h10)?(`Color_Red):(`Color_Green);
						end 
				33: //Fill Data-6.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h20)?(`Color_Red):(`Color_Green);
						end 
				34: //Fill Data-7.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h40)?(`Color_Red):(`Color_Green);
						end 
				35: //Fill Data-8.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(data_ROM&8'h80)?(`Color_Red):(`Color_Green);
						end 
				36: //Loop.
					if(CNT1>=384000-1) begin CNT1<=0; i<=i+1'b1; end
					else begin 
							CNT1<=CNT1+8; 
							addr_ROM<=addr_ROM+1'b1; 
							i<=28; 
						end
				37: //LCD_CS=1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end	
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd2; //2: LCD_CS, iData=1,High; iData=0,Low.
							data_TFT43<=16'd1; 
						end
/*
				38: //LCD_CS=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
					
				37: //Set Bar Address.
					begin
						xStart<=12;
						xEnd<=12+8;
						yStart<=0
						yEnd<=800-1;
						i<=100;
						Go<=i+1;
					end
				38: //Fill data by iSDRAM_Bar_Value.
				39: //Check SDRAM Testing Done.
*/	

				38: //2s Full screen Red Color to check if screen interface works well.
					//t=2s, f=1/t=1/2s=0.5Hz
					//80MHz/0.5Hz=160_000_000
					if(CNT1==160_000_000) begin CNT1<=0; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; end
				39:
					begin 
						if(iSDRAM_Testing_Done) 
							i<=i+1'b1; 
					end
				/////////////////////////////////////////////////
				40: //60Hz trigger signal.
					//if the value is too short, the LCD will shadow.
					/*
					if(cnt_60Hz==3_216_666-1) begin
												clk_used<=1'b1;
												i<=i+1'b1;
											end
					*/

					/*
					if(CNT1==80_000) begin CNT1<=0; clk_used<=1'b1; i<=i+1'b1; end
					else begin CNT1<=CNT1+1'b1; end
					*/
					i<=i+1'b1;
				//////PreSet Write Area//////
				41: //LCD_CS=0.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd0; end
					
				42: //CASET CMD.(0x2A00)=xStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
				43: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				44: //CASET CMD.(0x2A01)=xStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
				45: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				46: //CASET CMD.(0x2A02)=xEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
				47: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h01; end
					
				48: //CASET CMD.(0x2A03)=xEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
				49: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'hDF; end

				50: //RASET CMD.(0x2B00)=yStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
				51: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				52: //RASET CMD.(0x2B01)=yStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
				53: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=0; end
					
				54: //RASET CMD.(0x2B02)=yEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
				55: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h03; end
					
				56: //RASET CMD.(0x2B03)=yEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
				57: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=16'h1F; end

				58: //RAMWR.(2C00)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end	
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end
					
				59: //Read 4 Words (Pixels) from SDRAM.
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
				/*
				60: //Dump to UART to check if data read from SDRAM are right.
					if(done_Dump2UART) begin en_Dump2UART<=1'b0; i<=i+1'b1; end
					else begin en_Dump2UART<=1'b1; data_Dump2UART<=pixel_data1; end
				*/

				60: //Fast Fill Pixel Data, iData1=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data1; //1st.
						end 
				61: //Fast Fill Pixel Data, iData2=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data2; //2st.
						end 
				62: //Fast Fill Pixel Data, iData3=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data3; //3st.
						end 
				63: //Fast Fill Pixel Data, iData4=Color.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end		
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; //3: Write data, iData=data.
							data_TFT43<=pixel_data4; //4st.
						end 
			
				64: //480*800=384000.  (0~384000-1)   
					//Since we operate 4 words each time so the last one is 383996, 383997, 383998,383999.
					if(oSDRAM_Rd_Addr>=383996) begin oSDRAM_Rd_Addr<=0; i<=i+1'b1; end				
					else begin
							//0,1,2,3......4,5,6,7.....8,9,10,11....... we read 4 words each time.
							oSDRAM_Rd_Addr<=oSDRAM_Rd_Addr+4;
							i<=59; //Loop to draw next pixel.
						end
				65: //LCD_CS=1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd2; data_TFT43<=16'd1; end
				66: 
					begin 
						clk_used<=1'b0;
						i<=40; //Loop to refresh.
					end
				////////////////////////////////////////////
				//set xStart/xEnd/yStart/yEnd.
				100: //CASET CMD.(0x2A00)=xStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A00; end
				101: //CASET DATA, 0x2A00=xStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=xStart[15:8]; end
					
				102: //CASET CMD.(0x2A01)=xStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A01; end
				103: //CASET DATA, 0x2A01=xStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=xStart[7:0]; end
					
				104: //CASET CMD.(0x2A02)=xEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A02; end
				105: //CASET DATA, 0x2A02=xEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=xEnd[15:8]; end
					
				106: //CASET CMD.(0x2A03)=xEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2A03; end
				107: //CASET DATA, 0x2A03=xEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=xEnd[7:0]; end

				108: //RASET CMD.(0x2B00)=yStart[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B00; end
				109: //RASET DATA, 0x2B00=yStart[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=yStart[15:8]; end
					
				110: //RASET CMD.(0x2B01)=yStart[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B01; end
				111: //RASET DATA, 0x2B01=yStart[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=yStart[7:0]; end
					
				112: //RASET CMD.(0x2B02)=yEnd[15:8]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B02; end
				113: //RASET DATA, 0x2B02=yEnd[15:8],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=yEnd[15:8]; end
					
				114: //RASET CMD.(0x2B03)=yEnd[7:0]
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2B03; end
				115: //RASET DATA, 0x2B03=yEnd[7:0],(480,800)=>(0x1DF,0x31F).
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd3; data_TFT43<=yEnd[7:0]; end

				116: //RAMWR.(2C00)
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end	
					else begin en_TFT43<=1'b1; trigger_TFT43<=4'd4; data_TFT43<=16'h2C00; end
				117:
					begin i<=Go; end

				////////////////////////////////////////////////////////////////////////
				200: //Fill Data-1.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				201: //Fill Data-2.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				202: //Fill Data-3.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				203: //Fill Data-4.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				204: //Fill Data-5.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				205: //Fill Data-6.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				206: //Fill Data-7.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				207: //Fill Data-8.
					if(done_TFT43) begin en_TFT43<=1'b0; i<=i+1'b1; end
					else begin 
							en_TFT43<=1'b1; 
							trigger_TFT43<=4'd3; 
							data_TFT43<=(`Color_Red);
						end 
				208:
					begin i<=Go; end
			endcase
		 end
endmodule
