`timescale 1ns / 1ns
`include "nor_test.v"

module nor_tb;

reg A, B;
wire X;

nor_test uut(A, B, X);

initial begin

    $dumpfile("nor_tb.vcd");
    $dumpvars(0, nor_tb);

    A = 0;
    B = 0;
    #10;

    A = 0;
    B = 1;
    #10;

    A = 1;
    B = 0;
    #10;

    A = 1;
    B = 1;
    #10;    
    
    $display("Testing nor");

end

endmodule
