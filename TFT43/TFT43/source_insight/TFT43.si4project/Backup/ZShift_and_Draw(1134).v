`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:15:57 04/20/2023 
// Design Name: 
// Module Name:    ZShift_and_Draw 
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
module ZShift_and_Draw(
    input clk,
    input rst_n,
    input en,

	//New PulseCounter comes.
	input iDataUpdate,
	input [15:0] iPulseCounter,
    
	//SDRAM Read Glue Logic.
    output reg [23:0] oSDRAM_Rd_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    input [15:0] iSDRAM_Data, //input, read back data from SDRAM.

    output reg oSDRAM_Rd_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Rd_Done, //input,[1]=1:write done, [0]=1:read done.

	//SDRAM Write Glue Logic.
    output [23:0] oSDRAM_Wr_Addr, //output, Bank(2)+Row(13)+Column(9)=(24)
    output [15:0] oSDRAM_Wr_Data, //ouptut, write data to SDRAM.

    output oSDRAM_Wr_Req, //output, [1]=1:Write, [0]=1:Read.
    input iSDRAM_Wr_Done, //input, SDRAM write done signal.
    );

//SDRAM Space Assignment
//0~383999: (480*800-1): LCD GRAM. 
//384000~384599: (384000+600-1): Photon Counter.

//Lock in new pulse counter.
reg [15:0] lockInPulseCounter;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				lockInPulseCounter<=0;
			end
else if(iDataUpdate)	begin
							lockInPulseCounter<=iPulseCounter;
						end
//Do shift movement.
//Eliminate the oldest value and add the new pulse counter.
//Left Shift Effect.
reg [31:0] i;
reg [15:0] CNT1;
reg [15:0] rd_addr;
reg [15:0] wr_addr;
reg [15:0] ram_pulse_counter;
reg [15:0] newPulseCounter;
always @(posedge clk or negedge rst_n)
if(!rst_n)	begin
				i<=0;
				CNT1<=0;
				
				//SDRAM Read.
				oSDRAM_Rd_Req<=0;
				oSDRAM_Rd_Addr<=0;

				//SDRAM Write.
				oSDRAM_Wr_Req<=0;
				oSDRAM_Wr_Addr<=0;
				oSDRAM_Wr_Data<=0;

				newPulseCounter<=0;
			end
else if(en) begin
			case(i)
				0: //prepare address and check if there's a new pulse couter should be process.
					if(newPulseCounter!=lockInPulseCounter) begin
															newPulseCounter<=lockInPulseCounter;

															rd_addr<=384000+1;
															wr_addr<=384000; 
															i<=i+1'b1;
														end
				1: //Read.
					if(iSDRAM_Rd_Done) begin 
										oSDRAM_Rd_Req<=1'b0; 
										ram_pulse_counter<=iSDRAM_Data;
										i<=i+1'b1; 
									end
					else begin 
							oSDRAM_Rd_Req<=1'b1; 
							oSDRAM_Rd_Addr<=rd_addr;
						end
				2: //Write.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=ram_pulse_counter;
						end
				3: //Loop 600-1=599 times.
					if(CNT1==599) begin CNT1<=0; i<=i+1'b1; end
					else begin 
							CNT1<=CNT1+1'b1; 
							rd_addr<=rd_addr+1'b1;
							wr_addr<=wr_addr+1'b1;
							i<=1; //Loop to left shift.
						end
				4: //Left Shift Movement done, add the new pulse counter to the end.
				//Now rd_addr is 384599, wr_addr is 384598.
				//We write the new pulse couter to the tail so wr_addr should be 384598+1=384599.
					begin
						wr_addr<=wr_addr+1'b1;
						i<=i+1'b1;
					end
				5: //Write the new pulse counter.
					if(iSDRAM_Wr_Done) begin 
											oSDRAM_Wr_Req<=0; 
											i<=i+1'b1; 
										end
					else begin 
							oSDRAM_Wr_Req<=1; 
							oSDRAM_Wr_Data<=newPulseCounter;
						end
				6: //
					begin i<=0; end
			endcase
		 end
endmodule
