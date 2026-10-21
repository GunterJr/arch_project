/*
 * File: and4.v
 * Description: bitwise AND of two 4-bit inputs
 * Inputs:  A[3:0], B[3:0]
 * Outputs: X[3:0]
 * Authors: Blue Giraffes 
 * Course:  CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module and4 (A, B, X);   // module name and port list

    input [3:0] A;    // first 4-bit operand
    input [3:0] B;    // second 4-bit operand
    output [3:0] X;    // 4-bit result

    assign X = A & B;   // continuous assignment of the result

endmodule   // end of and4
