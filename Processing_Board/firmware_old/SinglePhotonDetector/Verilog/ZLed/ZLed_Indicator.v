//File: ZLed_Indicator.v
//Function: Run State Indicator.
//input: iClk, iRst_N
//output: oLed[1:0]
module ZLed_Indicator(
input iClk,
input iRst_N,
output wire[1:0] oLed);

//Slow down clock from a high frequency to a low frequency.
//100MHz/1Hz
reg [31:0] cnt1;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin  
                cnt1<=0;
            end
else begin
        if(cnt1>=31'h5F5E100)
            cnt1<=0;
        else
            cnt1<=cnt1+1;
    end

//output.
reg flag1;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
        flag1<=1'b0;
end
else begin
        if(cnt1>=31'h2FAF080)
            flag1<=~flag1;
    end
assign oLed[0]=flag1?1'b1:1'b0;
assign oLed[1]=1'b0;
endmodule