module mux(a,s,y);
 input [7:0]a;
 input [2:0]s;
 output reg y;
 always @(*)
 begin
	 case(s)
		 3'b000 : begin
			 y = a[0];
		 end

		 3'b001 : begin
			 y = a[1];
		 end

		 3'b010 : begin
			 y = a[2];
		 end

		 3'b011 : begin
			 y = a[3];
		 end

		 3'b100 : begin
			 y = a[4];
		 end

		 3'b101 : begin
			 y = a[5];
		 end

		 3'b110 : begin
			 y = a[6];
		 end

		 3'b111 : begin
			 y = a[7];
		 end
		 default : y =1'b0;
	 endcase
 end
endmodule


