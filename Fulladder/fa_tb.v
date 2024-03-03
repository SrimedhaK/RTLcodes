`include "fa.v"

module fa_tb();
reg a,b,cin;
wire S,C;
fa dut(a,b,cin,S,C);
initial begin

	a=0;
	b=0;
	cin=0;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=0;
	b=0;
	cin=1;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=0;
	b=1;
	cin=0;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=0;
	b=1;
	cin=1;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=1;
	b=0;
	cin=0;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=1;
	b=0;
	cin=1;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=1;
	b=1;
	cin=0;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);

	a=1;
	b=1;
	cin=1;
	#100;
	$display("a=%d,b=%d,cin=%d,S=%d,C=%d",a,b,cin,S,C);


end
endmodule

