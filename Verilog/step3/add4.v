/*
 * File: add4.v
 * Description: 4-bit adder with carry in and carry out
 * Inputs:  A[3:0], B[3:0], Cin
 * Outputs: Sum[3:0], Cout
 * Authors: Blue Giraffes 
 * Course:  CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module add4 (A, B, Cin, Sum, Cout);   // module name and port list

    input [3:0] A;      // first operand
    input [3:0] B;      // second operand
    input Cin;    // carry in
    output [3:0] Sum;    // 4-bit sum
    output Cout;   // carry out

    assign {Cout, Sum} = A + B + Cin;   // 5-bit result: top bit is the carry out

endmodule   
