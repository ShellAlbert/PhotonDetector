//File: ZLed_Indicator.v
//Function: Run State Indicator.
//input: iClk, iRst_N
//output: oLed[1:0]
module ZLed_Indicator #
(
    //CAUTION: CNT_1mS_MAX must be the same as CNT_1S_MAX.
    parameter CNT_1uS_MAX='d50, //1uS/20nS=1000nS/20nS=50)
    parameter CNT_1mS_MAX='d999, //1mS=1000uS.
    //parameter CNT_1mS_MAX='d1500,
    parameter CNT_1S_MAX='d999 //3S=3000mS.
    //parameter CNT_1S_MAX='d1500

)
(
input iClk,
input iRst_N,
input iNewDataUpdate,
output wire[1:0] oLED
);

reg [1:0] oLED_r;
//3s generation.
//we desire LED brightness changes from lowest to highest with 3s.
//f=50MHz, t=1000/50,000,000(ms)=1000,0000/50,000,000(us)=1/50us=20nS
reg [31:0] cnt_1S;
reg [31:0] cnt_1mS;
reg [31:0] cnt_1uS;
//1uS Timer.
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin  
    cnt_1uS<=0;
end
else begin
    if(cnt_1uS==CNT_1uS_MAX)
        cnt_1uS<=0;
    else 
        cnt_1uS<=cnt_1uS+1;
end
//1mS Timer.
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin  
    cnt_1mS<=0;
end
else begin
    if(cnt_1mS==CNT_1mS_MAX && cnt_1uS==CNT_1uS_MAX)
        cnt_1mS<=0;
    else if(cnt_1uS==CNT_1uS_MAX) //1000 times*1uS=1mS.
        cnt_1mS<=cnt_1mS+1;
end
//1S Timer.
reg on_off_flag;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin  
    cnt_1S<=0;
    on_off_flag=1;
end
else begin
    if(cnt_1S==CNT_1S_MAX && cnt_1mS==CNT_1mS_MAX && cnt_1uS==CNT_1uS_MAX) begin
        cnt_1S<=0;
        on_off_flag<=~on_off_flag;
    end
    else if(cnt_1mS==CNT_1mS_MAX && cnt_1uS==CNT_1uS_MAX)
        cnt_1S<=cnt_1S+1;
end

always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin  
    oLED_r[0]<=1'b0;
end
else begin
    if((on_off_flag==0 && cnt_1mS<cnt_1S) || (on_off_flag==1 && cnt_1mS>cnt_1S))
        oLED_r[0]<=1'b1;
    else 
        oLED_r[0]<=1'b0;
end

/////////////////////////////////////
//LED1 is used to indicate a new data updated.
reg [31:0] CNT;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
        CNT<=0;
        oLED_r[1]<=1'b0;
    end
else begin
        if(iNewDataUpdate) begin
            CNT<=CNT+1;
            oLED_r[1]<=~oLED_r[1];
        end
        else begin
            CNT<=0;
        end
end

assign oLED[0]=oLED_r[0];
assign oLED[1]=oLED_r[1];
endmodule