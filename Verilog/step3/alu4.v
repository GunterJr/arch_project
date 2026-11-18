/*
 * File: alu4.v
 * Description: 4-bit Integer ALU integrating 12 logic and arithmetic modules under a control unit
 * Inputs: A[3:0], B[3:0] = 4-bit operands; Cin = carry-in; OP[3:0] = operation code
 * Outputs: X[3:0] = primary result; Y[3:0] = secondary result (upper product/remainder/shift overflow); Cout = carry-out
 * Authors: Blue Giraffes
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Final Step
 */

`include "and4.v"
`include "nand4.v"
`include "or4.v"
`include "nor4.v"
`include "xor4.v"
`include "xnor4.v"
`include "not4.v"
`include "shift4.v"
`include "add4.v"
`include "sub4.v"
`include "mul4.v"
`include "div4.v"

module alu4 (A, B, Cin, OP, X, Y, Cout); // module name and port list

    input [3:0] A;    // first 4-bit operand
    input [3:0] B;    // second 4-bit operand
    input Cin;    // carry-in bit for addition/subtraction
    input [3:0] OP;    // 4-bit operation code selector
    output reg [3:0] X;    // primary 4-bit output
    output reg [3:0] Y;    // secondary 4-bit output
    output reg Cout;     // carry-out / borrow-out flag

    // Internal wires to capture outputs from all 12 submodules
    wire [3:0] w_and, w_nand, w_or, w_nor, w_xor, w_xnor, w_not;
    wire [3:0] w_shift_x, w_shift_y;
    wire [3:0] w_add_x, w_sub_x;
    wire w_add_cout, w_sub_cout;
    wire [3:0] w_mul_x, w_mul_y;
    wire [3:0] w_div_x, w_div_y;

    // Instantiate the 12 Step-2 ALU submodules
    and4   u_and   (A, B, w_and);   // 0000: Bitwise AND
    nand4  u_nand  (A, B, w_nand);   // 0001: Bitwise NAND
    or4    u_or    (A, B, w_or);   // 0010: Bitwise OR
    nor4   u_nor   (A, B, w_nor);    // 0011: Bitwise NOR
    xor4   u_xor   (A, B, w_xor);   // 0100: Bitwise XOR
    xnor4  u_xnor  (A, B, w_xnor);    // 0101: Bitwise XNOR
    not4   u_not   (A, w_not);   // 0110: Bitwise NOT (on A)
    shift4 u_shift (A, B, w_shift_x, w_shift_y);   // 0111: Arithmetic Shift
    add4   u_add   (A, B, Cin, w_add_x, w_add_cout); // 1000: Addition
    sub4   u_sub   (A, B, Cin, w_sub_x, w_sub_cout); // 1001: Subtraction
    mul4   u_mul   (A, B, w_mul_x, w_mul_y);       // 1010: Multiplication
    div4   u_div   (A, B, w_div_x, w_div_y);       // 1011: Division

    // Control Unit: Multiplexes submodule outputs based on OP[3:0]
    always @(*) begin
        // Default outputs to prevent unintended latches
        X = 4'b0000;
        Y = 4'b0000;
        Cout = 1'b0;

        case (OP)
            4'b0000: begin // AND
                X = w_and;
            end
            4'b0001: begin // NAND
                X = w_nand;
            end
            4'b0010: begin // OR
                X = w_or;
            end
            4'b0011: begin // NOR
                X = w_nor;
            end
            4'b0100: begin // XOR
                X = w_xor;
            end
            4'b0101: begin // XNOR
                X = w_xnor;
            end
            4'b0110: begin // NOT
                X = w_not;
            end
            4'b0111: begin // Arithmetic Shift
                X = w_shift_x;
                Y = w_shift_y; // overflow bits shifted out of A
            end
            4'b1000: begin // Addition
                X = w_add_x;
                Cout = w_add_cout;
            end
            4'b1001: begin // Subtraction
                X = w_sub_x;
                Cout = w_sub_cout;
            end
            4'b1010: begin // Multiplication
                X = w_mul_x; // lower 4 bits of product
                Y = w_mul_y; // upper 4 bits of product
            end
            4'b1011: begin // Division
                X = w_div_x; // quotient
                Y = w_div_y; // remainder
            end
            default: begin // Unused opcodes (1100 - 1111)
                X = 4'b0000;
                Y = 4'b0000;
                Cout = 1'b0;
            end
        endcase
    end // end always

endmodule // end of alu4
