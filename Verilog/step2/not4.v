/*
 * File: not4.v
 * Description: bitwise NOT of a 4-bit input
 * Inputs:  A[3:0]
 * Outputs: X[3:0]
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module not4 (A, X);  // module name and port list

    input  [3:0] A;   // 4-bit operand
    output [3:0] X;   // 4-bit result

    assign X = ~A;  // invert every bit of A

endmodule  
