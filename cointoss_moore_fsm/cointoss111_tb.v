`include "cointoss111.v"
module cointoss111_tb;
reg clk,rst;
reg x;
wire y;
integer i;
cointoss111 dut(clk,rst,x,y);
always #5 clk=~clk;
initial begin
        clk=1;
	rst=1;
	x=1;
	#10;    
	rst=0;
	for(i=0;i<50;i=i+1) 
            begin
              x <= $urandom_range(0,1);
              #10;
            end
        #20 $finish;
end
endmodule
