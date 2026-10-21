/*
 * File: div4.v
 * Description: 4-bit unsigned divider with quotient and remainder outputs
 * Inputs: A[3:0] = dividend, B[3:0] = divisor
 * Outputs: X[3:0] = quotient, Y[3:0] = remainder
 * Authors: Blue Giraffes 
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module div4 (A, B, X, Y);   // module name and port list

    input [3:0] A;        // dividend
    input [3:0] B;        // divisor
    output reg [3:0] X;    // quotient
    output reg [3:0] Y;    // remainder

    always @(*) begin   // re-evaluate whenever an input changes
        if (B == 4'b0000) begin   // dividing by zero is undefined
            X = 4'b1111;   // flag the error with the largest quotient
            Y = A;   // pass the dividend through as the remainder
        end else begin   // normal division
            X = A / B;   // integer quotient
            Y = A % B;   // remainder
        end   // end divide-by-zero check
    end   // end always

endmodule   // end of div4
