/*
 * File: div4_tb.v
 * Description: testbench for div4 (X = quotient, Y = remainder)
 * Authors: Blue Giraffes (Connor Nauert, Daniel Okoh, James Webb)
 * Course:  CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns   // time unit / precision
`include "div4.v". // pull in the module under test

module div4_tb;  // testbench has no ports

reg [3:0] A, B;   // inputs driven by the test
wire [3:0] X, Y;  // quotient and remainder observed by the test

div4 uut(A, B, X, Y);  // unit under test

initial begin. // test sequence

    $dumpfile("div4_tb.vcd");   // waveform file name
    $dumpvars(0, div4_tb);   // record every signal

    A = 4'd0;   // dividend
    B = 4'd1;   // divisor
    #10;   // wait 10 ns (expected X = 0, Y = 0)

    A = 4'd8;   
    B = 4'd2;   
    #10;   // wait 10 ns (expected X = 4, Y = 0)

    A = 4'd9;   
    B = 4'd4;   
    #10;   // wait 10 ns (expected X = 2, Y = 1)

    A = 4'd15;   
    B = 4'd4;   
    #10;   // wait 10 ns (expected X = 3, Y = 3)

    A = 4'd15;   
    B = 4'd15;   
    #10;   // wait 10 ns (expected X = 1, Y = 0)

    A = 4'd3;   
    B = 4'd7;   // 
    #10;   // wait 10 ns (expected X = 0, Y = 3)

    A = 4'd15;   
    B = 4'd1;   
    #10;   // wait 10 ns (expected X = 15, Y = 0)

    A = 4'd7;   
    B = 4'd0;   
    #10;   // wait 10 ns (expected X = 15, Y = 7) (divide by zero)

    A = 4'd0;   
    B = 4'd0;   
    #10;   // wait 10 ns (expected X = 15, Y = 0) (divide by zero)

    $display("Testing div4");   // message printed when the test ends

end   

endmodule   // end of testbench
