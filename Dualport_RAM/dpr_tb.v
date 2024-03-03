`include "dual_ram.v"
module dpr_tb();
reg clk1,clk2,wen1,wen2;
parameter a_width=4;
parameter d_width=8;
parameter a_depth=16;
reg [d_width-1:0]d1,d2; 
reg [a_width-1:0]a1,a2;
wire [d_width-1:0]q1,q2; 
integer i;
reg [7:0]D1,D2;
reg [3:0]A1,A2;
parameter clk_period=20;
parameter write_delay=10;
parameter read_delay=10;

dpr dut(clk1,clk2,d1,d2,a1,a2,wen1,wen2,q1,q2); 
always
begin
	#(clk_period/2);
	clk1=0;
	#(clk_period/2);
	clk1=1;
end

always
begin
	#(clk_period/2);
	clk2=1;
	#(clk_period/2);
	clk2=0;
end


// task for initializiing the initial conditions to start from

task initialize;
	begin
		wen1=0;
		wen2=0;
		d1=0;
		d2=0;
		a1=0;
		a2=0;
	end
endtask

// task for writing data into memory_port1

task mem_writeA(input [3:0]A1, input [7:0]D1);
begin 
	@(posedge clk1)
	begin
		wen1<=1;
		a1<=A1;
		d1<=D1;
		#(write_delay);
	end
end
endtask

// task for writing data into memory_port2

task mem_writeB(input [3:0]A2, input [7:0]D2);
begin 
	@(posedge clk2)
	begin
		wen2<=1;
		a2<=A2;
		d2<=D2;
		#(write_delay);
	end
end
endtask

// task for reading data from the memory_port1

task mem_readA(input [3:0]A1);
begin 
	@(posedge clk1)
	begin
		wen1<=0;
		a1<=A1;
		#(read_delay);
	end
end
endtask

// task for reading data from the memory_port2

task mem_readB(input [3:0]A2);
begin 
	@(posedge clk2)
	begin
		wen2<=0;
		a2<=A2;
		#(read_delay);
	end
end
endtask


initial begin
	initialize;
	for ( i=0;i<a_depth;i=i+1)
	begin
		if (i%2==0)
		begin
			A1=i;
			D1=i+2;
			mem_writeA(A1,D1);
			mem_readA(A1);
		end
		else 
		begin
			A2=i;
			D2=i+2;
			mem_writeB(A2,D2);	
			mem_readB(A2);

		end
	end
	$finish;
        $monitor("time=%d,d1=%d,d2=%d,a1=%d,a2=%d,wen1=%d,wen2=%d,q1=%d,q2=%d",$time,d1,d2,a1,a2,wen1,wen2,q1,q2);
end
	
endmodule

