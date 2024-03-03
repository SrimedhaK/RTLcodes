`include "mux81.v"
module mux81_tb();
  reg [7:0]a;
  reg [2:0]s;
  wire y;
 // integer x;
  mux uut(a,s,y);
  initial begin
	  $monitor("a=%d,s=%d,y=%d",a,s,y);
	  a=8'b00000101;
	  s=3'b000;
	  #100;

	  a=8'b00000110;
	  s=3'b101;
	  #100;
	  
	  a=8'b01110000;
	  s=3'b111;
  end
  initial
	  #500 $finish;
endmodule
