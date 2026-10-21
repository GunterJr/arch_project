/*
 * File: mul4_tb.v
 * Description: testbench for mul4 (product = {Y, X})
 * Authors: Blue Giraffes
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns  // time unit / precision
`include "mul4.v"  // pull in the module under test

module mul4_tb;  // testbench has no ports

reg [3:0] A, B;  // inputs driven by the test
wire [3:0] X, Y;  // low and high halves of the product

mul4 uut(A, B, X, Y);  // unit under test

initial begin  // test sequence

    $dumpfile("mul4_tb.vcd");  // waveform file name
    $dumpvars(0, mul4_tb);  // record every signal

    A = 4'd0;  // multiplicand
    B = 4'd0;  // multiplier
    #10;  // wait 10 ns (expected X = 0, Y = 0)

    A = 4'd1;   
    B = 4'd1;   
    #10;   // wait 10 ns (expected X = 1, Y = 0)

    A = 4'd3;   
    B = 4'd5;   
    #10;   // wait 10 ns (expected X = 15, Y = 0)

    A = 4'd4;   
    B = 4'd4;   
    #10;   // wait 10 ns (expected X = 0, Y = 1)

    A = 4'd9;   
    B = 4'd7;   
    #10;  // wait 10 ns (expected X = 15, Y = 3)

    A = 4'd15;   
    B = 4'd15;   
    #10;  // wait 10 ns (expected X = 1, Y = 14)

    A = 4'd15;   
    B = 4'd0;   
    #10;  // wait 10 ns (expected X = 0, Y = 0)

    $display("Testing mul4");   // message printed when the test ends

end   

endmodule   // end of testbench
