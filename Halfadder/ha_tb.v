`include "ha.v"

module ha_tb();
reg a,b;
wire s,c;
ha dut(a,b,s,c);
initial begin

	a=0;
	b=0;
	#100;
	$display("a=%d,b=%d,s=%d,c=%d",a,b,s,c);

	a=0;
	b=1;
	#100;
	$display("a=%d,b=%d,s=%d,c=%d",a,b,s,c);

	a=1;
	b=0;
	#100;
	$display("a=%d,b=%d,s=%d,c=%d",a,b,s,c);

	a=1;
	b=1;
	#100;
	$display("a=%d,b=%d,s=%d,c=%d",a,b,s,c);
end
endmodule



