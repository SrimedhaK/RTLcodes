`include "shiftreg.v"
module shiftreg_tb();

reg clk,r,pi,si;
reg se=0;
wire po;
parameter cycle=4;  // no of bits

shiftreg uut(clk,r,pi,si,se,po);

initial
begin
clk=1'b1;
forever #50 clk=~clk;
end

initial
begin
$monitor("clk=%d,se=%d,si=%d,pi=%d,po=%d",clk,se,si,pi,po);
end
task shiften();
begin
	repeat(cycle)
	begin
		se=0;
		#100;
	end
	se=1;
	#100;
end
endtask
task shiftin(input in);
 begin
	repeat(cycle)
        begin
		si=in;
		#100;
        end	
 end
endtask
initial begin
fork
	shiften();
	shiftin(1);
	#100;
	shiftin(0);
	#100;
	shiftin(1);
	#100;
join
end
initial begin
	pi=1;
	#100;
	pi=1;
	#100;
	pi=0;
	#100;
	pi=1;
	#100;
	pi=0;
$finish();
end
endmodule
