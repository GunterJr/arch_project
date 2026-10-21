/*
 * File: xnor4_tb.v
 * Description: testbench for xnor4
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns  // time unit / precision
`include "xnor4.v"  // pull in the module under test

module xnor4_tb;  // testbench has no ports

reg [3:0] A, B;  // inputs driven by the test
wire [3:0] X;  // output observed by the test

xnor4 uut(A, B, X);  // unit under test

initial begin  // test sequence

    $dumpfile("xnor4_tb.vcd");  // waveform file name
    $dumpvars(0, xnor4_tb);  // record every signal

    A = 4'b0000;  // first operand
    B = 4'b0000;  // second operand
    #10;   // wait 10 ns (expected X = 1111)

    A = 4'b1111;   
    B = 4'b1111;   
    #10;   // wait 10 ns (expected X = 1111)

    A = 4'b1010;   
    B = 4'b0101;   
    #10;   // wait 10 ns (expected X = 0000)

    A = 4'b1100;   
    B = 4'b1010;   
    #10;   // wait 10 ns (expected X = 1001)

    A = 4'b0110;   
    B = 4'b0011;   
    #10;   // wait 10 ns (expected X = 1010)

    A = 4'b1111;   
    B = 4'b0000;   
    #10;   // wait 10 ns (expected X = 0000)

    A = 4'b0001;   
    B = 4'b1000;   
    #10;   // wait 10 ns (expected X = 0110)

    A = 4'b1001;   
    B = 4'b1001;   
    #10;   // wait 10 ns (expected X = 1111)

    $display("Testing xnor4");   // message printed when the test ends

end   

endmodule   // end of testbench
