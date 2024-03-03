module sram16x8(clk,d,a,wen,q);       
input clk, wen;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;

input [d_width-1:0]d;      
input [a_width-1:0]a;
output reg [7:0]q;
reg [d_width-1:0]mem[a_depth-1:0];
always@(posedge clk)
begin
	if (wen==1)
		mem[a]<=d;         // writing into the memory
	else 
		q<=mem[a];         // reading out off the memory 
end
endmodule

