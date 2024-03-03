`include "padcells.v"

module pad_tb();
  reg IE,OE,a;
  wire y;
  wire pad;
  reg temp_pad;
  assign pad=(IE==1 && OE==0)?  temp_pad: 1'bz;
  pad dut(.pad(pad), .IE(IE), .OE(OE), .y(y), .a(a));
  initial
    begin
      $monitor("T=%0t IE=%b, OE=%b, temp_pad=%b, pad=%b,y=%b, a=%b",$time, IE,OE, temp_pad, pad,y,a);
      
      IE=1; OE=0;     //case1
      temp_pad=1;
      #100
      temp_pad=1;
      #100
      
      IE=0;OE=1;       //case2
      a=0;
      #100
      a=1;
      #100
      
      IE=1;OE=0;        //case1.1
      temp_pad=1;
      #100
      temp_pad=0;
      #100
      
      IE=0;OE=1;       //case2.1
      a=1;
      #100
      a=0;
      
    end
endmodule
