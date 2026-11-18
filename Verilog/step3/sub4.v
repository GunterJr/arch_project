/*
 * File: sub4.v
 * Description: 4-bit subtractor with borrow in and borrow out (Diff = A - B - Bin)
 * Inputs:  A[3:0], B[3:0], Bin
 * Outputs: Diff[3:0], Bout (1 when the result would be negative)
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module sub4 (A, B, Bin, Diff, Bout);  // module name and port list

    input [3:0] A;  // minuend
    input [3:0] B;  // subtrahend
    input Bin;   // borrow in
    output [3:0] Diff;  // 4-bit difference
    output Bout;  // borrow out

    assign {Bout, Diff} = {1'b0, A} - {1'b0, B} - Bin;  // 5-bit subtract: top bit is the borrow

endmodule   
