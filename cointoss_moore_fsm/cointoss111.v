module cointoss111(input clk,rst,x,output reg y);
reg [2:0] state,nxt_state;
parameter a=3'b000,b=3'b001,c=3'b010,d=3'b011;
always@(posedge clk)
begin
	if(rst)
		state<=a;
	else
		state<=nxt_state;
end

always@(*)
begin
	case(state)
		a:begin
			if(x)
				nxt_state=b;
			else
				nxt_state=a;
		  end
		b:begin
			if(x)
				nxt_state=c;
			else
				nxt_state=a;
		  end
		c:begin
			if(x)
				nxt_state=d;
			else
				nxt_state=a;
		  end
		d:begin
			if(x)
				nxt_state=d;
			else
				nxt_state=a;
		  end
	  endcase
	  y<=(nxt_state==d);
  end
  endmodule
