`include "FIFO.v"
module fifo_tb;
  parameter DEPTH = 16;
  parameter ADDR = 4;
  parameter WIDTH = 8;
  parameter clk_period = 10; 
  reg CLK, WEN, REN, RST;
  reg [WIDTH-1:0] D;
  wire [WIDTH-1:0] Q;
  reg [WIDTH-1:0] i;
  reg a;
  FIFO dut(CLK,D,Q,WEN,REN,FULL,EMPTY);

  // Clock generation
  always
  begin
	#(clk_period/2);
	CLK=0;
	#(clk_period/2);
	CLK=1;
  end

  // Task for initial conditions
  task initialize;
    begin
      WEN = 0;
      REN = 0;
      RST = 0;
      D = 0;
    end
  endtask

  // Task for write operation
  task write_op(input [WIDTH-1:0]i,input a);
    begin
      @(posedge CLK)
        begin
          D <= i;
          WEN = a;
        end
    end
  endtask

  // Task for read operation
  task read_op;
    begin
      @(posedge CLK)
        REN <= 1;
    end
  endtask

  // Task for reset
  task reset;
    begin
      @(negedge CLK)
        RST <= 1'b1;
      @(negedge CLK)
        RST <= 1'b0;
    end
  endtask

  // Initial block to perform operations
  initial
  begin
      initialize;
      reset;
      read_op;
      for (i = 0; i < DEPTH-1; i = i + 1)
        write_op($random, 1);     
      reset;
      write_op(0, 0);
      read_op;
      reset;
      write_op($random, 1);
      write_op($random, 1);
      write_op($random, 1);
      read_op;
      $finish;
  end
endmodule
/*// WRITING INTO FIFO

task write(input [WIDTH-1:0]D);
	if (!FULL)
    	begin
		WEN<=1;
		D <= $random;
		#10;
		$display("WEN=%d,REN=%d,D=%d",WEN,REN,D);
	end
	else 
		$display("Full");
endtask 
  
// READING FROM FIFO

task read();
    if(!EMPTY) 
    begin
      REN <= 1;
      #10; 
      $display("WEN=%d,REN=%d,Q=%d",WEN,REN,Q);
    end
    else 
	    $display("Empty");
endtask

// FIFO WORKING
// (FIFO IS USED TO SYNCH TWO DIFFERNT CLOCKS. IT ACTS A BUCKET TO STORE WATER(BITS) WITHOUT FALLING OUT(LOSING).

  task fifo(int read_delay);
    WEN = 0;
    REN = 0;
    fork
      begin
        repeat(10) 
	begin 
		@(posedge clk) 
		write(); 
	end
        WEN = 0;
      end
      begin
        #read_delay;
        repeat(10) 
	begin 
		@(posedge clk) 
		read(); 
	end
        REN = 0;
      end
    join
  endtask*/

