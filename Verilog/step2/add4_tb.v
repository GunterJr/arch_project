/*
 * File: add4_tb.v
 * Description: testbench for add4
 * Authors: Blue Giraffes 
 * Course:  CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

`timescale 1ns / 1ns   // time unit / precision
`include "add4.v"   // pull in the module under test

module add4_tb;   // testbench has no ports

reg [3:0] A, B;   // inputs driven by the test
reg Cin;   // carry in driven by the test
wire [3:0] Sum;   // sum observed by the test
wire Cout;   // carry out observed by the test

add4 uut(A, B, Cin, Sum, Cout);   // unit under test

initial begin   // test sequence

    $dumpfile("add4_tb.vcd");   // waveform file name
    $dumpvars(0, add4_tb);   // record every signal

    A = 4'd0;   // first operand
    B = 4'd0;   // second operand
    Cin = 1'b0;   // carry in
    #10;   // wait 10 ns (expected Sum = 0, Cout = 0)

    A = 4'd5;   
    B = 4'd3;   
    Cin = 1'b0;  
    #10;   // wait 10 ns (expected Sum = 8, Cout = 0)

    A = 4'd5;   
    B = 4'd3; 
    Cin = 1'b1;  
    #10;   // wait 10 ns (expected Sum = 9, Cout = 0)

    A = 4'd9;   
    B = 4'd7;   
    Cin = 1'b0;  
    #10;   // wait 10 ns (expected Sum = 0, Cout = 1)

    A = 4'd15;  
    B = 4'd15;   
    Cin = 1'b0;   
    #10;   // wait 10 ns (expected Sum = 14, Cout = 1)

    A = 4'd15;   
    B = 4'd15;   
    Cin = 1'b1;  
    #10;   // wait 10 ns (expected Sum = 15, Cout = 1)

    A = 4'd15;   
    B = 4'd0;   
    Cin = 1'b1;  
    #10;   // wait 10 ns (expected Sum = 0, Cout = 1)

    A = 4'd8;  
    B = 4'd8;  
    Cin = 1'b0;  
    #10;   // wait 10 ns (expected Sum = 0, Cout = 1)

    $display("Testing add4");   // message printed when the test ends

end   
endmodule   
