//File: ZExt_Pulse.v
//Function: 
//Count External Pulse and Upload via UART.
//input: iClk, iRst_N, iExtPulse.
//output: 
module ZExt_Pulse(
input iClk,
input iRst_N,
input iExtPulse, //External Pulse at the Physical Pin.

output oTxd
);

//Synchronous Ext Pulse sync to system main clock domain.
reg ext_pulse_delay1;
reg ext_pulse_delay2;
wire ext_pulse_synced;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
    ext_pulse_delay1<=1'b0;
    ext_pulse_delay2<=1'b0;
end
else begin
    ext_pulse_delay1<=iExtPulse;
    ext_pulse_delay2<=ext_pulse_delay1;
end
assign ext_pulse_synced=ext_pulse_delay2;

//Upload via UART.
reg data_Update;
reg [15:0] data_Dump2UART;
reg [7:0] time_Interval_Selection;
wire done_Dump2UART;
ZUART_Data_Dump inst1_ZUART_Data_Dump(
.clk(iClk),
.rst_n(iRst_N),
.en(1'b1), //Enabled Always.

.data_update(data_Update),
.data(data_Dump2UART),

	//Time Interval Selection.
.iTime_Interval_Selection(time_Interval_Selection),

.tx_pin(oTxd),
.done(done_Dump2UART));


//self-glue-logic.
reg [31:0] step_i;
always @(posedge iClk or negedge iRst_N)
if(!iRst_N) begin
        step_i<=0;
        data_Update<=1'b0;
end
else begin
    case(step_i)
        0: 
            begin
                data_Dump2UART<=16'h2023;
                time_Interval_Selection<=8'd1;
                data_Update<=1'b1;
                step_i<=step_i+1;
            end
        1:
            begin
                data_Update<=1'b0;
                step_i<=step_i+1;
            end
        2:
            begin
                step_i<=step_i+1;
            end
        3:
            begin
                step_i<=0;
            end
    endcase
end
endmodule