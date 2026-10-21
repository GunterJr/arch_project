/*
 * File: sub4_tb.v
 * Description: testbench for sub4
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns  // time unit / precision
`include "sub4.v"  // pull in the module under test

module sub4_tb;  // testbench has no ports

reg [3:0] A, B;  // inputs driven by the test
reg Bin;   // driven by the test
wire [3:0] Diff;  // difference observed by the test
wire Bout;  // borrow out observed by the test

sub4 uut(A, B, Bin, Diff, Bout);  // unit under test

initial begin  // test sequence

    $dumpfile("sub4_tb.vcd");  // waveform file name
    $dumpvars(0, sub4_tb);  // record every signal

    A = 4'd0;  // minuend
    B = 4'd0;  // subtractor
    Bin = 1'b0;  // borrow in
    #10;  // wait 10 ns (expected Diff = 0, Bout = 0)

    A = 4'd9;   
    B = 4'd4;   
    Bin = 1'b0;   
    #10;   // wait 10 ns (expected Diff = 5, Bout = 0)

    A = 4'd9;   
    B = 4'd4;   
    Bin = 1'b1;   
    #10;   // wait 10 ns (expected Diff = 4, Bout = 0)

    A = 4'd4;   
    B = 4'd9;   
    Bin = 1'b0;   
    #10;   // wait 10 ns (expected Diff = 11, Bout = 1)

    A = 4'd5;   
    B = 4'd5;   
    Bin = 1'b0;   
    #10;   // wait 10 ns (expected Diff = 0, Bout = 0)

    A = 4'd5;   
    B = 4'd5;   
    Bin = 1'b1;   
    #10;   // wait 10 ns (expected Diff = 15, Bout = 1)

    A = 4'd0;   
    B = 4'd15;   
    Bin = 1'b0;   
    #10;   // wait 10 ns (expected Diff = 1, Bout = 1)

    A = 4'd15;   
    B = 4'd0;   
    Bin = 1'b0;   
    #10;   // wait 10 ns (expected Diff = 15, Bout = 0)

    $display("Testing sub4");   // message printed when the test ends

end   

endmodule   // end of testbench
