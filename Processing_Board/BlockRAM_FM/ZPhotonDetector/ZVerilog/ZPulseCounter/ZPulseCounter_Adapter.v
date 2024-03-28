module ZPulseCounter_Adapter(
input iClk,
input iRst_N,

//New Pulse Counter.
input iNewDataUpdate,
input [15:0] iNewPulseCounter,

//Write to BlockRAM.
output reg oWrReq,
output reg [11:0] oWrReq_Addr,
output reg [15:0] oWrReq_Data,
input iWrDone,

//Start A New Sample.
input iTickReSample,

//indicate already written 3000 numbers of PulseCounter.
input iUploadBusy, //iUploadBusy,1:Busy,0:Idle.
output reg oUploadEn,
input iUploadDone,

//Connect this port to a physical pin to measure how many clocks a series of actions take.
output reg oClkUsed
);
reg [15:0] iTestData;

//driven by step_i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
	step_i<=0;
	oWrReq_Addr<=0;
	oWrReq<=0;
	iTestData<=0;
	oClkUsed<=1'b0;
end
else begin
	case(step_i)
	0: //Start A New Sample when not in process of uploading.
		begin
			if(iTickReSample && !iUploadBusy) begin
				oWrReq_Addr<=0;
				iTestData<=0;
				step_i<=step_i+1;

				oClkUsed<=1'b1; //Test at physical pin.
			end
		end
	1: //Waiting New Pulse Counter.
		begin
			if(iNewDataUpdate) begin
				//oWrReq_Data<=iTestData; //Latch Data In.
				oWrReq_Data<=iNewPulseCounter; //Latch Data In.
				step_i<=step_i+1;
			end
		end
	2: //Generate Write Request & Waiting for Write Done.
		begin
			if(iWrDone) begin
				oWrReq<=0;
				step_i<=step_i+1;
			end
			else begin
				oWrReq<=1;
			end
		end
	3: //increase write address for next time.
		begin
			if(oWrReq_Addr==3000-1) begin
				oWrReq_Addr<=0;
				step_i<=step_i+1;
			end
			else begin
				oWrReq_Addr<=oWrReq_Addr+1;
				iTestData<=iTestData+1; //Increase Test Data.
				step_i<=1; //Next Pulse Counter.
			end
		end
	4: //Start to upload via UART.
		begin
			if(iUploadDone) begin oUploadEn<=1'b0; step_i<=step_i+1; end
			else begin oUploadEn<=1'b1; end
		end
	5: 
		begin
			oClkUsed<=1'b0; //Test at physical pin.
			step_i<=0;
		end
	default:
		begin
			step_i<=0;
		end
	endcase
end
/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0({iNewPulseCounter[15:0],oWrReq_Data[15:0]}), // input wire [31:0]  probe0  
	.probe1({oWrReq_Addr[11:0],oWrReq,iWrDone,18'd0}), // input wire [31:0]  probe1 
	.probe2({
		iNewDataUpdate,
		iTestData[15:0],
		step_i[7:0],
        oWrFrameDone,
        6'd0
    }) // input wire [31:0]  probe2
);
*/
endmodule