/*
 * File: shift4.v
 * Description: 4-bit arithmetic shifter with fill bit and overflow output
 * Inputs: A[3:0] = value to shift
 *         B[3] = direction (0 left, 1 right), B[2:1] = shift amount, B[0] = fill bit
 * Outputs: X[3:0] = shifted value, Y[3:0] = bits shifted out of A
 * Authors: Blue Giraffes 
 * Course:  CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Step 2
 */

module shift4 (A, B, X, Y);   // module name and port list

    input  [3:0] A;  // value to be shifted
    input  [3:0] B;  // control word B3 B2 B1 B0
    output reg [3:0] X;  // shifted result
    output reg [3:0] Y;  // overflow (bits shifted out)

    reg [7:0] wide;  // 8-bit workspace {Y, X} so shifted-out bits are kept
    reg [1:0] n;  // shift amount taken from B[2:1]
    reg [3:0] mask;  // marks the positions that must be filled

    always @(*) begin  // re-evaluate whenever an input changes
        n = B[2:1];  // shift amount is 0 to 3

        if (B[3] == 1'b0) begin  // B3 = 0 means shift left
            wide = {4'b0000, A} << n;  // A sits in the low half, shift toward the high half
            mask = (4'b0001 << n) - 4'b0001;  // n ones in the low bits (the vacated spots)
            X = wide[3:0] | (B[0] ? mask : 4'b0000);  // low half is X, add fill ones if B0 = 1
            Y = wide[7:4];  // high half holds the bits that left A
        end else begin   // B3 = 1 means shift right
            wide = {A, 4'b0000} >> n;  // A sits in the high half, shift toward the low half
            mask = ~(4'b1111 >> n);  // n ones in the top bits (the vacated spots)
            X = wide[7:4] | (B[0] ? mask : 4'b0000);  // high half is X, add fill ones if B0 = 1
            Y = wide[3:0];  // low half holds the bits that left A
        end   // end direction select
    end   // end always

endmodule   // end of shift4
