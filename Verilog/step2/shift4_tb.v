/*
 * File: shift4_tb.v
 * Description: testbench for shift4 (B3 = direction, B2:B1 = amount, B0 = fill)
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns  // time unit / precision
`include "shift4.v"  // pull in the module under test

module shift4_tb;  // testbench has no ports

reg [3:0] A, B;  // inputs driven by the test
wire [3:0] X, Y;  // outputs observed by the test

shift4 uut(A, B, X, Y);  // unit under test

initial begin  // test sequence

    $dumpfile("shift4_tb.vcd");  // waveform file name
    $dumpvars(0, shift4_tb);  // record every signal

    A = 4'b1011;  // value to shift
    B = 4'b0110;  // control word: left 3, fill 0 (assignment example 1)
    #10;   // wait 10 ns (expected X = 1000, Y = 0101)

    A = 4'b0101;   
    B = 4'b1101;   // control word: right 2, fill 1 (assignment example 2)
    #10;   // wait 10 ns (expected X = 1101, Y = 0100)

    A = 4'b1011;   
    B = 4'b0000;   // control word: shift by 0, nothing changes
    #10;   // wait 10 ns (expected X = 1011, Y = 0000)

    A = 4'b1011;   
    B = 4'b0111;   // control word: left 3, fill 1
    #10;   // wait 10 ns (expected X = 1111, Y = 0101)

    A = 4'b1011;   
    B = 4'b0010;   // control word: left 1, fill 0
    #10;   // wait 10 ns (expected X = 0110, Y = 0001)

    A = 4'b1011;   
    B = 4'b1011;   // control word: right 1, fill 1
    #10;   // wait 10 ns (expected X = 1101, Y = 1000)

    A = 4'b1011;   
    B = 4'b1100;   // control word: right 2, fill 0
    #10;   // wait 10 ns (expected X = 0010, Y = 1100)

    A = 4'b1111;   
    B = 4'b1110;   // control word: right 3, fill 0
    #10;   // wait 10 ns (expected X = 0001, Y = 1110)

    A = 4'b0001;   
    B = 4'b0100;   // control word: left 2, fill 0, no overflow
    #10;   // wait 10 ns (expected X = 0100, Y = 0000)

    A = 4'b0000;   
    B = 4'b1111;   // control word: right 3 of zero, fill 1
    #10;   // wait 10 ns (expected X = 1110, Y = 0000)

    $display("Testing shift4");   // message printed when the test ends

end   // end initial

endmodule   // end of testbench
