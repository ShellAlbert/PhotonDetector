`timescale 1ns / 1ps
module ZUARTUploadRAM(
    input iClk,
    input iRst_N,
	//Input Enable & Upload Done.
    input iEn,
	output reg oUploadDone,
	output reg oUploadBusy, //1:Busy, 0:Idle.

	//BlockRAM Read Interface.
	output reg oBlockRAM_RdReq,
	output reg [11:0] oBlockRAM_RdReq_Addr,
	input [15:0] iBlockRAM_RdData,
	input iBlockRAM_RdDone,

	//RS485 Interface.
	input iUART_Rxd,
    output oUART_Txd,
	output oUART_Dir
    );

//Read from BlockRAM -> Send out Via UART.
///////////////////////////////////////////
//DIR:=1(Tx),=0(Rx)
assign oUART_Dir=1'b1;
////////////////////////////////////////////
reg enUART_i; //internal registers.
reg [7:0] txData_i;
wire txDone_i;
wire [7:0] rxData_i;
wire rxDone_i;

ZUART_Module uart_Module(
    .iClk(iClk), //input.
    .iRst_N(iRst_N), //input.
    .iEn(enUART_i), //input.

    //tx logic.
    .iTxData(txData_i), //input.
    .oTxDone(txDone_i), //output.
	.oTxPin(oUART_Txd), //output.

	//rx logic.
	.iRxPin(iUART_Rxd), //input.
    .oRxData(rxData_i), //output.
    .oRxDone(rxDone_i) //output.  
    );

/////////////////////////////////////////////////////////
//start triggered by Tick1S.
reg [15:0] blockRAM_Data_i;
reg [15:0] checkSum_i;
//driven by step i.
reg [7:0] step_i;
reg [7:0] CNT1;
reg [7:0] CNT2;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
	step_i<=0;
	blockRAM_Data_i<=0;
	oBlockRAM_RdReq<=1'b0;
	oBlockRAM_RdReq_Addr<=0;
	checkSum_i<=0;
	oUploadDone<=1'b0;
	oUploadBusy<=1'b0;
	CNT1<=0;
end
else if(iEn) begin
	case(step_i)
	0: //Initial before uploading.
		begin
			blockRAM_Data_i<=0;
			oBlockRAM_RdReq_Addr<=0; //Read Addr:0~3000-1.
			checkSum_i<=0;
			oUploadDone<=1'b0;
			oUploadBusy<=1'b1; //uploading in progress.
			CNT1<=0;
			CNT2<=0;
			step_i<=step_i+1;
		end
	1: //Transmit data out: Sync Head: 55.
		begin
			if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
			else begin enUART_i<=1'b1; txData_i<=8'h55; end
		end
	2: //Transmit data out: Sync Head: AA.
		begin
			if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
			else begin enUART_i<=1'b1; txData_i<=8'hAA; end
		end
	3: //Transmit data out: Data Length: 00.
	begin
		if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
		else begin enUART_i<=1'b1; txData_i<=8'd0; end
	end
	4: //Transmit data out: Data Length: 60.
	begin
		if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
		else begin enUART_i<=1'b1; txData_i<=8'd60;	end
	end
	5: //Read from BlockRAM.
		begin
			if(iBlockRAM_RdDone) begin
				oBlockRAM_RdReq<=1'b0;
				blockRAM_Data_i<=iBlockRAM_RdData; //Latch data in.
				checkSum_i<=checkSum_i+iBlockRAM_RdData; //do checkSum.
				step_i<=step_i+1;
			end
			else begin
				oBlockRAM_RdReq<=1'b1;
			end
		end
	6: //Transmit data out: PulseCounter[15:8].
		begin
			if(txDone_i) begin 
				enUART_i<=1'b0; 
				step_i<=step_i+1'b1; 
			end		
			else begin 
					enUART_i<=1'b1; 
					txData_i<=blockRAM_Data_i[15:8]; //8'h19; 
				end
		end
	7: //Transmit data out: PulseCounter[7:0].
		begin
			if(txDone_i) begin 
				enUART_i<=1'b0; 
				step_i<=step_i+1'b1; 
			end		
			else begin 
					enUART_i<=1'b1; 
					txData_i<=blockRAM_Data_i[7:0]; //8'h87;
				end
		end
	8: //Loop until to read 60 PulseCounter were transmit out.
		begin
			if(CNT1==60-1) begin
				CNT1<=0;
				step_i<=step_i+1'b1; 
			end
			else begin
				CNT1<=CNT1+1;
				step_i<=5; //Repeat to Read from BlockRAM.
			end
			oBlockRAM_RdReq_Addr<=oBlockRAM_RdReq_Addr+1;
		end
	9: //Transmit data out: Checksum[15:8].
		begin
			if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
			else begin enUART_i<=1'b1; txData_i<=checkSum_i[15:8]; 	end
		end
	10: //Transmit data out: Checksum[7:0].
		begin
			if(txDone_i) begin enUART_i<=1'b0; step_i<=step_i+1'b1; end		
			else begin enUART_i<=1'b1; txData_i<=checkSum_i[7:0]; end
		end
	11: //there are 50 periods within 1 second.
		begin
			if(CNT2==50-1) begin CNT2<=0; step_i<=step_i+1'b1; end
			else begin
				CNT2<=CNT2+1;
				step_i<=1; //repeat.
			end
		end
	12: //Single Pulse Done Signal -- HIGH.
		begin oUploadDone<=1'b1; step_i<=step_i+1'b1; end
	13: //Single Pulse Done Signal -- LOW.
		begin oUploadDone<=1'b0; oUploadBusy<=1'b0; step_i<=0; end
	default:
		begin step_i<=0; end
	endcase
end
else begin
	step_i<=0;
	blockRAM_Data_i<=0;
	oBlockRAM_RdReq<=1'b0;
	oBlockRAM_RdReq_Addr<=0;
	checkSum_i<=0;
	oUploadDone<=1'b0;
	oUploadBusy<=1'b0;
	CNT1<=0;
end
/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0({iBlockRAM_RdData[15:0],oBlockRAM_RdReq_Addr[11:0],oBlockRAM_RdReq,iBlockRAM_RdDone,2'd0}), // input wire [31:0]  probe0  
	.probe1({checkSum_i[15:0],16'd0}), // input wire [31:0]  probe1 
	.probe2({step_i[7:0],txDone_i,23'd0}) // input wire [31:0]  probe2
);
*/
endmodule
