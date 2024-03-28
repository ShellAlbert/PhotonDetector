module ZPulse_Counter(
input iClk,
input iRst_N,
input iEn,

input iPulse, //Pulse Input.
input iTickGap,

//output for uploading data via Network.
//new data output at rising edge of oNewDataUpdate.
output reg [15:0] oNewPulseCounter, //maximum 9999,9999.
output reg oNewDataUpdate
);

//internal register for counting.
reg [15:0] PulseCounter_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
	PulseCounter_i<=0;
end
else begin
	if(iTickGap) begin
		PulseCounter_i<=0;
	end
	else if(iPulse) begin
			PulseCounter_i<=(PulseCounter_i<16'hFFFF)?(PulseCounter_i+1):(PulseCounter_i);
		end
end

//driven by step i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
	step_i<=0;
	oNewDataUpdate<=1'b0;
	oNewPulseCounter<=0;
end
else begin
	case(step_i)
	0: //TickGap arrived.
		if(iTickGap) begin
			oNewPulseCounter<=PulseCounter_i; //Latch data in.
			step_i<=step_i+1;
		end
	1: //Single Pulse Done Signal -- HIGH.
		begin
			oNewDataUpdate<=1'b1;
			step_i<=step_i+1;
		end
	2: //Single Pulse Done Signal -- LOW.
		begin
			oNewDataUpdate<=1'b0;
			oNewPulseCounter<=0;
			step_i<=0;
		end
	default:
		begin
			oNewDataUpdate<=1'b0;
			oNewPulseCounter<=0;
			step_i<=0;
		end
	endcase
end
/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0({PulseCounter_i,oNewPulseCounter}), // input wire [31:0]  probe0  
	.probe1({32'd0}), // input wire [31:0]  probe1 
	.probe2({ 
		step_i[7:0],
        iPulse,
        iTick333uS,
        iTick1S,
        oNewDataUpdate,
        20'd0
    }) // input wire [31:0]  probe2
);
*/
endmodule