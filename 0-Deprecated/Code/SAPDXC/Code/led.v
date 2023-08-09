module led(clk, rst_n, led);
input clk;
input rst_n;
output led;

reg led;

//clk=100MHz
//1KHz, 100MHz/1KHz/2=100,000/2=50,000
//2KHz, 100MHz/2KHz/2=25,000

//input clk=10MHz
//200Hz, 10MHz/200Hz/2=
parameter T1S=17'd25000;
reg [16:0] counter1;

//counter.
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	counter1<=1'd0;
else if(counter1==T1S-1) 
			counter1<=1'd0;
		else
			counter1<=counter1+1'b1;


//led.
always @ (posedge clk or negedge rst_n)
if(!rst_n)
	led<=1'd0;
else if(counter1==T1S-1)
	led<=~led;
	else
		led<=led;
		
endmodule