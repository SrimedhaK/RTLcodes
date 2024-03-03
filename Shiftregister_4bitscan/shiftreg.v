module shiftreg(input clk,r,pi,si,se,output po);
wire w1,w2,w3;
sdff dut1(.clk(clk),.r(r),.si(si),.se(se),.d(pi),.q(w1));
dff dut2(.clk(clk),.r(r),.d(w1),.q(w2));
dff dut3(.clk(clk),.r(r),.d(w2),.q(w3));
sdff dut4(.clk(clk),.r(r),.si(si),.se(se),.d(w3),.q(po));
endmodule

//sdff module

module sdff(input clk,r,se,si,d, output reg q);
always@(posedge clk)
begin
	if(r==1)
		q<=1'b0;
	else 
		if (!se)
			q<=d;
		else
			q<=0;
end
endmodule

module dff(input d,clk,r, output reg q);
always@(posedge clk)
begin
	if (r==1)
		q<=1'b0;
	else 
		q<=d;
end
endmodule
