/*
 * File: mul4.v
 * Description: 4-bit multiplier with an 8-bit product split across two 4-bit outputs
 * Inputs: A[3:0], B[3:0]
 * Outputs: X[3:0] = low half of A*B, Y[3:0] = high half of A*B
 * Authors: Blue Giraffes
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module mul4 (A, B, X, Y); // module name and port list

    input [3:0] A;  // multiplicand
    input [3:0] B;  // multiplier
    output [3:0] X;  // low 4 bits of the product
    output [3:0] Y;  // high 4 bits of the product

    wire [7:0] product; // full 8-bit product (4 bits x 4 bits needs 8 bits)

    assign product = A * B;  // multiply the operands
    assign X = product[3:0];  // lower nibble
    assign Y = product[7:4];  // upper nibble

endmodule   
