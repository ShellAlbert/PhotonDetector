module ZExtRAMSchedule(
    input iClk, //100MHz Clock Input.
    input iRst_N,

    //Bank Address =2 (BA0,BA1)
    //Row Address = 12 (A0~A11)
    //Column Address = 8 (A0~A7)
    //{BankAddr, RowAddr, ColumnAddr}
    output reg [21:0] oRAMAddr, 

    //output data that write to ExtRAM.
    output reg [31:0] oWrData,
    //input data that read from ExtRAM.
    input [31:0] iRdData,

    //Read & Write Request.
    //[0]=1: Read Request, [1]=1: Write Request.
    output reg [1:0] oRequest,
    //[0]=1: Read Done, [1]=1: Write Done.
    input [1:0] iDone,

    //LED Indicator.
    output reg oLED
);

//The Main Clock is 100MHz,
//so t=(1/100MHz)S=(1000/100MHz)mS=(1000,000/100MHz)us=(1/100)uS=0.01uS=10nS
//5s=5000ms=5000,000us
parameter T5S=500_000_000; //5000,000us/0.01us=500_000_000
parameter T1S=100_000_000; //1000,000uS/0.01uS=100_000_000
parameter T100mS=2_000_000; //100mS=100_000uS/0.01uS=10_000_000
reg [31:0] C1;

reg [31:0] WrData_r;
//Temporary Register.
reg [31:0] RdData_r;
reg errFlag;
//driven by step i.
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    step_i<=0;
    oLED<=1'b0;
    oRAMAddr<=0;
    oWrData<=0;
    oRequest<=2'b00;
    ////////////////////////////////////
    RdData_r<=0;
    WrData_r<=32'h19870901;
    C1<=0;
    errFlag<=0;
end
else begin
    case(step_i)
        0: //Delay 5S.
            begin
                if(C1==10-1) begin
                    C1<=0;
                    step_i<=step_i+1;
                end
                else begin
                    C1<=C1+1;
                end
            end
        1: //write data to ExtRAM.
            begin
                if(iDone[1]) begin
                    oRequest[1]<=1'b0;
                    step_i<=step_i+1;
                end
                else begin
                    oRAMAddr<={2'b00,12'd0,8'h01};
                    oWrData<=WrData_r;
                    oRequest[1]<=1'b1; //Write Request.
                end
            end
        2: //read data from ExtRAM.
            begin
                if(iDone[0]) begin
                    oRequest[0]<=1'b0;
                    RdData_r<=iRdData; //Lock data in.
                    step_i<=step_i+1;
                end
                else begin
                    oRAMAddr<={2'b00,12'd0,8'd01};
                    oRequest[0]<=1'b1; //Read Request.
                end
            end
        3:
            begin
                if(RdData_r==WrData_r) begin
                    errFlag<=0;
                    step_i<=1; //repeat to write.
                    WrData_r<=WrData_r;
                end
                else begin
                    errFlag<=1;
                    step_i<=1; //repeat to write.
                    WrData_r<=WrData_r;
                end
            end
        4:
            begin
                if(errFlag) begin
                    step_i<=5; //Death Flash.
                end
                else begin
                    step_i<=6; //Normal Flash.
                end
            end
        5: //Dead Flash.
        begin
            if(C1==T100mS-1) begin
                C1<=0;
                oLED<=!oLED;
            end
            else begin
                C1<=C1+1;
            end
        end
        6: //Normal Flash.
        begin
            if(C1==T1S-1) begin
                C1<=0;
                oLED<=!oLED;
            end
            else begin
                C1<=C1+1;
            end
        end
        default:
            begin
                oLED<=0;
                step_i<=0;
            end
    endcase
end

/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0(RdData_r), // input wire [31:0]  probe0  
	.probe1(WrData_r), // input wire [31:0]  probe1 
	.probe2({ 
        step_i[7:0],
        oRequest[1:0],
        iDone[1:0],
        errFlag,
        C1[15:0],
        3'd0
    }) // input wire [31:0]  probe2
);
*/
endmodule