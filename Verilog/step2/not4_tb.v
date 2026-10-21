/*
 * File: not4_tb.v
 * Description: testbench for not4
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns  // time unit / precision
`include "not4.v"  // pull in the module under test

module not4_tb;  // testbench has no ports

reg [3:0] A;  // input driven by the test
wire [3:0] X;  // output observed by the test

not4 uut(A, X); // unit under test

initial begin // test sequence

    $dumpfile("not4_tb.vcd");   // waveform file name
    $dumpvars(0, not4_tb);   // record every signal

    A = 4'b0000;   // input value
    #10;   // wait 10 ns (expected X = 1111)

    A = 4'b1111;   
    #10;   // wait 10 ns (expected X = 0000)

    A = 4'b1010;   
    #10;   // wait 10 ns (expected X = 0101)

    A = 4'b0101;   
    #10;   // wait 10 ns (expected X = 1010)

    A = 4'b0110;   
    #10;   // wait 10 ns (expected X = 1001)

    A = 4'b0001;   
    #10;   // wait 10 ns (expected X = 1110)

    $display("Testing not4");   // message printed when the test ends

end   

endmodule   // end of testbench
