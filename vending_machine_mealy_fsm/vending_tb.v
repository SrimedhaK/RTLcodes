`include "vending.v"
module vending_tb;
reg clk,rst;
reg [2:0]in;
wire out;
integer i;
vending dut(clk,rst,in,out);

always #5 clk=~clk;

initial begin
	rst=1;
    clk=1;
  #10
	clk=0;
	rst=0;
	in=3'd5;
	#10;    
  for(i=0;i<50;i=i+1) 
            begin
              in <= $urandom_range(1,5);
              #10;
            end
        #20 $finish;
end
endmodule
