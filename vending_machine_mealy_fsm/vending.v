module vending(clk,rst,in,out);
input clk,rst;
input [2:0]in;
output reg out;
localparam idle=3'b000, s1=3'b001, s2=3'b010,s3=3'b011, s4=3'b100;
reg [2:0] state,nxt_state;
always@(posedge clk)
begin
	if(rst)
		state<= idle;
	else
		state<=nxt_state;
end

always @(state,in)
begin
	case(state)
		idle: begin 
			if(in==3'd1)
				nxt_state<=s1;
			else if(in==3'd2)
				nxt_state<=s2;
			else if(in ==3'd5)
				nxt_state<=idle;
		      end
		s1: begin
			if(in==3'd1)
				nxt_state<=s1;
			else if(in==3'd2)
				nxt_state<=s3;
		    end
	        s2: begin
			if (in ==3'd1)
				nxt_state<=s3;
			else if (in==3'd2)
				nxt_state<=s4;
		    end
		s3: begin 
			if(in==3'd2)
				nxt_state<=idle;
		    end
		s4: begin 
		    	if(in== 3'd1)
				  nxt_state<=idle;
                if(in==3'd2)
                  nxt_state<=idle;
		    end
	endcase
end
always@(*)
begin
	case(state)
		idle:begin
		       	if (in==3'd1)	
				out<=0;
			else if(in==3'd2)
				out<=0;
			else if(in==3'd5)
				out<=1;
		     end
		s1: begin
			if (in==3'd1)
				out<=0;
			else if(in==3'd2)
				out<=0;
		    end
		s2: begin
			if(in==3'd1) 
				out<=0;
			else if(in==3'd2)
				out<=0;
		    end
		s3: begin
			if(in==3'd2)
				out<=1;
		    end
		s4: begin
			if (in==3'd1)
				out<=1;
			else if (in==3'd2)
				out<=1;
		    end
	endcase
end

endmodule
