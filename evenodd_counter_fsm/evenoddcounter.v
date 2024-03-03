module evenoddcounter(clk,oe,rst,out);
input clk,oe,rst;
output reg [2:0]out;
localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
reg [2:0]state,nxt_state;
always @(posedge clk , posedge rst)
begin
	if (rst)
	begin
		state<= s0;
                
	end
	else 
		state<= nxt_state;
end

always@ (state)
begin
	case(state)
		s0: nxt_state=oe?s1:s2;
		s1: nxt_state=oe?s3:s2;
		s2: nxt_state=oe?s3:s4;
		s3: nxt_state=oe?s5:s4;
		s4: nxt_state=oe?s5:s6;
		s5: nxt_state=oe?s7:s6;
		s6: nxt_state=oe?s7:s0;
		s7: nxt_state=oe?s0:s2;
	endcase
end

always@(state)
begin
	case(state)
		s0: out=0;
		s1: out=1;
		s2: out=2;
		s3: out=3;
		s4: out=4;
		s5: out=5;
		s6: out=6;
		s7: out=7;
	endcase
end
endmodule



