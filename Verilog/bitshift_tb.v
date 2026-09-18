`timescale 1ns / 1ns
`include "bitshift.v"

module bitshift_tb;

reg signed [3:0] in;
reg dir;
wire signed [3:0] out;

bitshift uut(in, dir, out);

initial begin

    $dumpfile("bitshift_tb.vcd");
    $dumpvars(0, bitshift_tb);

    in = 4'b0110;
    dir = 0;
    #10;

    in = 4'b0110;
    dir = 1;
    #10;

    in = 4'b1000;
    dir = 0;
    #10;

    in = 4'b1000;
    dir = 1;
    #10;

    $display("Testing bitshift");

end

endmodule
