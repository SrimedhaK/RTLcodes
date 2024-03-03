module FIFO(CLK,D,Q,WEN,RST,REN,FULL,EMPTY);
parameter DEPTH=16;
parameter WIDTH=8;
parameter ADDR =4;
input CLK,WEN,REN;
input RST;
input [WIDTH-1:0]D;
output reg [WIDTH-1:0]Q;
output reg FULL,EMPTY;
reg [ADDR-1:0] wr_pointer;    // POINTER REGISTER
reg [ADDR-1:0] rd_pointer;   //POINTER REGISTER
reg [WIDTH-1:0] mem [DEPTH-1:0];   //MEMORY CORE
reg [ADDR+1:0] status_counter;   //STATUS COUNTER

//WRITE ADDRESS GENERATOR 
always@(posedge CLK)
begin
	if(RST)
		wr_pointer<=0;
	else
	begin
		if (WEN)
			wr_pointer<=wr_pointer+1;
	end
end

// READ ADDRESS GENERATOR 
always@(posedge CLK)
begin
	if(RST)
		rd_pointer<=0;
	else
	begin
		if (REN)
			rd_pointer<=rd_pointer+1;
	end
end

// WRITE AND READ OPERATION
always@(posedge CLK)
begin
	if (WEN)
		mem[wr_pointer]<=D;
	if (REN)
		Q<=mem[rd_pointer];
end
//STATUS COUNTER LOGIC 
always@(posedge CLK)
begin
	if(RST)
		status_counter<=0;
	else
	begin
		if ((WEN && !REN) && (status_counter !=DEPTH))
			status_counter<= status_counter+1;
		if ((REN && !WEN) && (status_counter ==0))
			status_counter<= status_counter-1;
		if (WEN && REN)
			status_counter<= status_counter;
	end
end
assign FULL=(status_counter==DEPTH)? 1'b1:1'b0;
assign EMPTY=(status_counter==0)? 1'b1:1'b0;

endmodule
