`timescale 1ns / 1ns
`include "not_test.v"

module not_tb;

reg A;
wire X;

not_test uut(A, X);

initial begin

	$dumpfile("not_tb.vcd");
	$dumpvars(0, not_tb);

	A = 0;
	#20;

	A = 1;
	#20;

	$display("Testing not");

end

endmodule

