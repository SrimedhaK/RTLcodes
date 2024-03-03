`include "sram.v"
module sram16x8_tb();
reg clk,wen;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;
reg [d_width-1:0]d; 
reg [a_width-1:0]a;
wire [d_width-1:0]q; 
integer i;
reg [3:0]A;
reg [7:0]D;
parameter clk_period=20;
parameter write_delay=10;
parameter read_delay=10;

sram16x8 dut(clk,d,a,wen,q);
always
begin
	#(clk_period/2);
	clk=0;
	#(clk_period/2);
	clk=1;
end

// task for initializiing the initial conditions to start from

task initialize;
	begin
		wen=0;
		d=0;
		a=0;
	end
endtask

// task for writing data into memory

task mem_write(input [3:0]A, input [7:0]D);
begin 
	@(posedge clk)
	begin
		wen<=1;
		a<=A;
		d<=D;
		#(write_delay);
	end
end
endtask


// task for reading data from the memory

task mem_read(input [3:0]A);
begin 
	@(posedge clk)
	begin
		wen<=0;
		a<=A;
		#(read_delay);
	end
end
endtask


initial begin
	initialize;
	for (i=0;i<=a_depth-1;i=i+1)
	begin
		A=i;
		D=i+2;
		mem_write(A,D);
		mem_read(A);
	end
	$finish;
end
initial begin
	$monitor("time=%d,d=%d,a=%d,wen=%d,q=%d",$time,d,a,wen,q);
end	
endmodule
