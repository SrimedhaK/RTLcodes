module dpr(clk1,clk2,d1,d2,a1,a2,wen1,wen2,q1,q2);       
input clk1,clk2,wen1, wen2;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;

input [d_width-1:0]d1,d2;      
input [a_width-1:0]a1,a2;
output reg [7:0]q1,q2;

reg [d_width-1:0]mem[a_depth-1:0];

always@(posedge clk1)
begin
	if (wen1)
		mem[a1]<=d1;         // writing into the memory
	else 
		q1<=mem[a1];         // reading out off the memory 
end

always@(posedge clk2)
begin
	if (wen2)
		mem[a2]<=d2;         // writing into the memory
	else 
		q2<=mem[a2];         // reading out off the memory 
end

endmodule
