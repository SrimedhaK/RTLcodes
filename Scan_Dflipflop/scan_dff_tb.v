`include "scan_dff.v"

module sdff_tb();
reg D,SI,SE,CLK,R;
wire Q;
sdff uut(R,CLK,SE,SI,D,Q);
initial begin

	CLK=1'b0;
	forever #100 CLK=~CLK;
end

initial begin
	$monitor("CLK=%d,SE=%d,SI=%d,D=%d,Q=%d",CLK,SE,SI,D,Q);
end
initial begin
	R=1;
	D=0;
	#100;
	R=0;
	SE=0;
	SI=0;
	D=1;
	#100;

	SE=1;
	SI=1;
	D=0;
	#100;

	SE=1;
	SI=0;
	D=1;
	#100;

	SE=0;
	SI=1;
	D=1;
	#100;

	SE=1;
	SI=1;
	D=1;

	$finish(1000);


end
endmodule
