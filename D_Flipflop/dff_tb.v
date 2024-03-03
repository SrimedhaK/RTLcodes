`include "dff.v"
module dff_tb();
reg d,clk,rst;
wire q;
dff uut(.d(d),.clk(clk),.rst(rst),.q(q));
initial begin

	clk=1'b0;
	forever #100 clk=~clk;
end

initial begin
	$monitor("clk=%d,d=%d,q=%d",clk,d,q);
end
initial begin
	rst=1;
	d=0;
	#100;
	rst=0;
	d=1;
	#100;
	d=0;
	#100;
	d=1;
	$finish(600);


end
endmodule


