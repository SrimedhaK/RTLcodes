module sdff(R,CLK,SE,SI,D,Q,SO);
input D,SI,SE,CLK,R;
output SO;
output reg Q;
 always@(posedge CLK)
 begin
	 if (R==1)
		 Q=0;
	 else
		 Q=(SE?SI:D);
 end
assign SO=Q;
endmodule
 
