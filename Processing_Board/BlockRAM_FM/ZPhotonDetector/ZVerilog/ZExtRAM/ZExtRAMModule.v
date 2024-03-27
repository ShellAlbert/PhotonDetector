module ZExtRAMModule(
    input iClk, //100MHz Clock Input.
    input iRst_N,

    //input iSDRAMClk,
    //Bank Address =2 (BA0,BA1)
    //Row Address = 12 (A0~A11)
    //Column Address = 8 (A0~A7)
    //{BankAddr, RowAddr, ColumnAddr}
    input [21:0] iRAMAddr, 

    //input data interface for writing. 
    input [31:0] iPulseCounter,
    //output data interface for reading.
    output [31:0] oPulseCounter,
    //Read & Write Request.
    //[0]=1: Read Request, [1]=1: Write Request.
    input [1:0] iRequest,
    //[0]=1: Read Done, [1]=1: Write Done.
    output reg [1:0] oDone,

    //External RAM Interface.
    output [11:0] oRAM_Addr, //A11~A0, Address Input.
    output [1:0] oRAM_BankAddr, //Bank1,Bank0.
    output oRAM_CS, //Chip Selection.
    output oRAM_WE, //Write Enable.
    output oRAM_CAS, //Column Address Strobe.
    output oRAM_RAS, //Row Address Strobe.

    //[IP_Flow 19-4751] Bus Interface 'oRAM_CLK': FREQ_HZ bus parameter is missing for output clock interface.
    //Vivado don't accept the name like XXX_CLK.
    //So I add A prefix and B suffix.
    output oRAM_ACLKB, //System Clock Input.
    output oRAM_ACLKB2, //System Clock Input.
    output oRAM_CKE, //Clock Enable.
    output [3:0] oRAM_DQM,//Data Byte Mask.
    inout [31:0] ioRAM_DQ //32 bits-Data Bus.
);

//Instance.
reg [3:0] OpReq_i; //internal variable.
wire OpDone_i; //internal variable.
ZExtRAMTiming RAM_Timing(
    .iClk(iClk), //100MHz Clock Input.
    .iRst_N(iRst_N),

    //.iSDRAMClk(iSDRAMClk),
    //iOpReq=0: Initialize and Load Mode Register.
    //iOpReq=1: AUTO-REFRESH CYCLE.
    //iOpReq=2: Single Read with Auto Precharge.
    //iOpReq=3: Single Write with Auto Precharge.
    .iOpReq(OpReq_i), //Operating Request.
    .oOpDone(OpDone_i), //Operating Done.

    //Bank Address =2 (BA0,BA1)
    //Row Address = 12 (A0~A11)
    //Column Address = 8 (A0~A7)
    //{BankAddr, RowAddr, ColumnAddr}
    .iRAMAddr(iRAMAddr), 

    //input data interface for writing. 
    .iPulseCounter(iPulseCounter),

    //output data interface for reading.
    .oPulseCounter(oPulseCounter),

    //External RAM Interface.
    .oRAM_Addr(oRAM_Addr), //A11~A0, Address Input.
    .oRAM_BankAddr(oRAM_BankAddr), //Bank1,Bank0.
    .oRAM_CS(oRAM_CS), //Chip Selection.
    .oRAM_WE(oRAM_WE), //Write Enable.
    .oRAM_CAS(oRAM_CAS), //Column Address Strobe.
    .oRAM_RAS(oRAM_RAS), //Row Address Strobe.
    .oRAM_ACLKB(oRAM_ACLKB), //System Clock Input.
    .oRAM_ACLKB2(oRAM_ACLKB2),
    .oRAM_CKE(oRAM_CKE), //Clock Enable.
    .oRAM_DQM(oRAM_DQM),//Data Byte Mask.
    .ioRAM_DQ(ioRAM_DQ) //32 bits-Data Bus.
);

//4096 refresh cycles every 16ms (A2 grade) or 64 ms (Commercial, Industrial, A1 grade)
//64ms/4096=15.625uS
//So SDRAM should be refreshed every 15.625uS
//In order to keep adequate time, we choose 10uS here.

//The Main Clock is 100MHz,
//so t=(1/100MHz)S=(1000/100MHz)mS=(1000,000/100MHz)us=(1/100)uS=0.01uS=10nS
parameter TREF=1000; //10uS/0.01uS=1000

reg [15:0] C1;

//driven by step i. (* DONT_TOUCH = "TRUE" *) 
reg [7:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    step_i<=0;
    C1<=0;
    OpReq_i<=4'b0000;
    oDone<=2'b00;
end
else begin
    case (step_i)
        0: //Delay after Power On Reset.
        begin
            if(C1==16'hFF-1) begin
                C1<=0;
                step_i<=step_i+1;
            end
            else begin
                C1<=C1+1;
            end
        end
        1: //initial.
        begin
            if(OpDone_i) begin
                OpReq_i[0]<=0;
                step_i<=step_i+1;
                C1<=C1+1;
            end
            else begin
                OpReq_i[0]<=1; //iOpReq[0]: Initialize and Load Mode Register.
                C1<=C1+1;
            end
        end
        2: //schedule.
        begin
            if(C1>=TREF-1) begin
                C1<=0;
                step_i<=3; //go to refresh.
            end
            else begin
                    case({iRequest[1],iRequest[0]})
                    2'b01: //Read Request.
                        begin
                            step_i<=4; //go to read.
                            C1<=C1+1;
                        end
                    2'b10: //Write Request.
                        begin
                            step_i<=7; //go to write.
                            C1<=C1+1;
                        end
                    default:
                        begin
                            C1<=C1+1;
                        end
                    endcase
            end
        end
        3: //refresh
        begin
            if(OpDone_i) begin
                OpReq_i[1]<=0;
                step_i<=2; //go to schedule.
                C1<=C1+1;
            end
            else begin
                OpReq_i[1]<=1; //iOpReq[1]: AUTO-REFRESH CYCLE.
                C1<=C1+1;
            end
        end
        4: //read.
        begin
            if(OpDone_i) begin
                OpReq_i[2]<=0;
                step_i<=step_i+1;
                C1<=C1+1;
            end
            else begin
                OpReq_i[2]<=1; //iOpReq[2]: Single Read with Auto Precharge.
                C1<=C1+1;
            end
        end
        5: //Single Pulse Done Signal - HIGH.
        begin
            oDone[0]<=1'b1;
            C1<=C1+1;
            step_i<=step_i+1;
        end
        6: //Single Pulse Done Signal - LOW.
        begin
            oDone[0]<=1'b0;
            C1<=C1+1;
            step_i<=2; //go to schedule.
        end
        7: //write.
        begin
            if(OpDone_i) begin
                OpReq_i[3]<=0;
                step_i<=step_i+1;
                C1<=C1+1;
            end
            else begin
                OpReq_i[3]<=1; //iOpReq[3]: Single Write with Auto Precharge.
                C1<=C1+1;
            end
        end
        8: //Single Pulse Done Signal - HIGH.
        begin
            oDone[1]<=1'b1;
            C1<=C1+1;
            step_i<=step_i+1;
        end
        9: //Single Pulse Done Signal - LOW.
        begin
            oDone[1]<=1'b0;
            C1<=C1+1;
            step_i<=2; //go to schedule.
        end
    endcase
end
/*
//Integrated Logic Analyzer
ila_0 my_ila (
	.clk(iClk), // input wire clk

	.probe0(oPulseCounter), // input wire [31:0]  probe0  
	.probe1(iPulseCounter), // input wire [31:0]  probe1 
	.probe2({ 
        step_i[7:0],
        OpReq_i[3:0],
        OpDone_i,
        19'd0
    }) // input wire [31:0]  probe2
);
*/
endmodule
