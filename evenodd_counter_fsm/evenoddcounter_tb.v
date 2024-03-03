/*`include "evenoddcounter.v"
module evenoddcounter_tb;
reg clk,rst,oe;
wire [2:0] out;

parameter clock = 5;

always #(clock/2) clk<=~clk;

evenoddcounter dut(clk,oe,rst,out);

task initialize;
  begin
    rst<=1;
    clk<=0;
    oe<=0;
    #2 rst<=1;
  end
endtask

integer i;
initial 
    begin
        #5 initialize;
           for(i=0;i<50;i=i+1) 
            begin
                oe <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
endmodule*/

`include "evenoddcounter.v"
module evenoddcounter_tb;
reg clk,rst,oe;
wire [2:0] out;

parameter clock = 5;

always #(clock/2) clk<=~clk;

evenoddcounter dut(clk,oe,rst,out);

task initialize;
  begin
    rst<=0;
    clk<=0;
    oe<=0;
  end
endtask

task reset;
	begin
		@(posedge clk)
		rst=1;
		@(posedge clk)
		rst=0;
	end
endtask
task odd_even(input i);
	begin
		@(posedge clk)
		oe=i;
	end
endtask

initial 
begin
	initialize;
	reset;
	//odd transition
	odd_even(1);   //s0 to s1;
	odd_even(1);   //s1 to s3;
	odd_even(1);    // s3 to s5;
        odd_even(1);    //s5 to s7
	odd_even(1);    //s7 to s0

	// even transition
       	repeat(5)
		begin
			odd_even(0);	
		end

	//repeated transition
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1); 
	odd_even(0); 
	odd_even(1);
        odd_even(0);
	$finish;
end
endmodule


