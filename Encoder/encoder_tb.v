`include "encoder.v"
module encoder_tb;
  reg [7:0] D;
  wire [2:0] y;
  
  encoder dut(D, y);
  
  initial begin
    $monitor("D = %b::y = %b", D, y);
    
      D=10000000; // 111
      #100;
      
      D=00000001; // 000
      #100;
      
      D=00010000; //100
     
      #100;
       D=0000100; // 011
      #100;
       D=00100000;  //101
      #100;
       D=00000100;  //010  
  end
endmodule
