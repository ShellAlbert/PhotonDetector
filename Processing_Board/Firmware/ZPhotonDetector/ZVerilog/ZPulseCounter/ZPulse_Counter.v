module ZPulse_Counter(
input iClk,
input iRst_N,
input iEn,
input iPulse, //Pulse at the Physical Pin.
input [7:0] iTimeInterval,

//output for uploading data via Network.
//new data output at rising edge of oNewDataUpdate.
output reg [15:0] oNewPulseCounter, //maximum 9999,9999.
output oNewDataUpdate
);

//the Main Clock we're using is 50MHz.
//f=50MHz
//t=1/50MHz(s)=1000/50MHz(ms)=1,000,000/50,000,000(us)=1/50uS=0.02uS=20nS
//Attention here:
//20nS is the full period time,
//_____
//     |
//     |_____
//so the half of one period is 20nS/2=10nS.

//0: 1uS. 1uS/20nS=1000nS/20nS=50.
parameter CNT_DEADLINE_1uS=50;
//actually, for 1uS, it should be 1uS/10nS=100.
//parameter CNT_DEADLINE_1uS=100;

//1: 10uS. 10uS/20nS=10,000nS/20nS=500.
parameter CNT_DEADLINE_10uS=500;
//actually, for 10uS, it should be 10uS/10nS=10,000nS/10nS=1,000.
//parameter CNT_DEADLINE_10uS=1_000;

//2: 100uS. 100uS/20nS=100,000nS/20nS=5000.
parameter CNT_DEADLINE_100uS=5_000;
//actually for 100uS, it should be 100uS/10nS=100,000nS/10nS=10,000.
//parameter CNT_DEADLINE_100uS=10_000;

//3: 1mS. 1mS/20nS=50,000.
parameter CNT_DEADLINE_1mS=50_000;
//actually for 1mS, it should be 1mS/10nS=100,000.
//parameter CNT_DEADLINE_1mS=100_000;

//4: 10mS. 10mS/20nS=500,000.
parameter CNT_DEADLINE_10mS=500_000;
//actually for 10mS, it should be 10mS/10nS=1,000,000.
//parameter CNT_DEADLINE_10mS=1_000_000;

//5: 100mS. 100mS/20nS=5,000,000.
parameter CNT_DEADLINE_100mS=5_000_000;
//actually for 100mS, it should be 100mS/10nS=10,000,000.
//parameter CNT_DEADLINE_100mS=10_000_000;

//6: 1000mS. 1S/20nS=50,000,000.
parameter CNT_DEADLINE_1S=50_000_000;
//actually for 1000mS, it should be 1S/10nS=100,000,000.
//parameter CNT_DEADLINE_1S=100_000_000;
////////////////////////////////////////////////////////////
reg [31:0] CNT_Deadline;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N)	begin
				CNT_Deadline<=CNT_DEADLINE_1S;
			end
else if(iEn)	begin
				case(iTimeInterval)
					0: CNT_Deadline<=CNT_DEADLINE_1uS;
					1: CNT_Deadline<=CNT_DEADLINE_10uS;
					2: CNT_Deadline<=CNT_DEADLINE_100uS;
					3: CNT_Deadline<=CNT_DEADLINE_1mS;
					4: CNT_Deadline<=CNT_DEADLINE_10mS;
					5: CNT_Deadline<=CNT_DEADLINE_100mS;
					6: CNT_Deadline<=CNT_DEADLINE_1S;
					default: CNT_Deadline<=CNT_DEADLINE_1S;
				endcase
			end
	else begin
			CNT_Deadline<=CNT_DEADLINE_1S;
		end
//////////////////////////////////////////////
reg [31:0] CNT;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N)	begin
				CNT<=0;
			end
else if(iEn)	begin
                    if(CNT==CNT_Deadline)
                        CNT<=0;		
                    else
                        CNT<=CNT+1'b1;
			    end
	else begin
		CNT<=0;
    end
//////////////////////////////////////////////
//output data update signal before 1 clk to avoid to be reset to zero.
assign oNewDataUpdate=(CNT==CNT_Deadline-2)?1'b1:1'b0;
//////////////////////////////////////////
//reset to zero.
wire zero_signal;
assign zero_signal=(CNT==CNT_Deadline-1)?1'b1:1'b0;
////////////////////////////////////////////////////////
always @ (posedge iClk or negedge iRst_N)
if(!iRst_N) begin
			oNewPulseCounter<=0;
		end
else if(iEn) begin
			if(zero_signal) begin
								oNewPulseCounter<=0;
							end
			else if(iPulse) begin
							////////////////////////////////////
							oNewPulseCounter<=oNewPulseCounter+1'b1; 
							//oNewPulseCounter<=16'h1987; //Fixed Value for Debugging.
						end
		 end
	else begin
			oNewPulseCounter<=0;
		end
endmodule