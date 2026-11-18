/*
 * File: alu4_tb.v
 * Description: testbench for 4-bit Integer ALU (alu4) covering all 12 opcodes
 * Authors: Blue Giraffes
 * Course: CS 3339 Computer Architecture, Texas State University
 * Project: Integer ALU, Final Step
 */

`timescale 1ns / 1ns // time unit / precision
`include "alu4.v"    // pull in the module under test

module alu4_tb; // testbench has no ports

    reg [3:0] A, B;  // operand inputs driven by the test
    reg Cin;  // carry-in driven by the test
    reg [3:0] OP;    // opcode driven by the test
    wire [3:0] X, Y;  // primary and secondary outputs observed
    wire Cout;       // carry-out observed

    alu4 uut (A, B, Cin, OP, X, Y, Cout); // unit under test

    initial begin // test sequence

        $dumpfile("alu4_tb.vcd"); // waveform file name
        $dumpvars(0, alu4_tb);   // record every signal

        // Monitor output changes in console for verification
        $monitor("Time=%0t | OP=%b | A=%b (%0d) B=%b (%0d) Cin=%b | X=%b (%0d) Y=%b (%0d) Cout=%b",
                 $time, OP, A, A, B, B, Cin, X, X, Y, Y, Cout);

        // Initialize inputs
        A = 4'b1010; // 10
        B = 4'b0110; // 6
        Cin = 1'b0;

        // 1. Test Bitwise Logic Operations
        OP = 4'b0000; // AND: 1010 & 0110 = 0010
        #10;          // wait 10 ns

        OP = 4'b0001; // NAND: ~(1010 & 0110) = 1101
        #10;          

        OP = 4'b0010; // OR: 1010 | 0110 = 1110
        #10;          

        OP = 4'b0011; // NOR: ~(1010 | 0110) = 0001
        #10;          

        OP = 4'b0100; // XOR: 1010 ^ 0110 = 1100
        #10;          

        OP = 4'b0101; // XNOR: ~(1010 ^ 0110) = 0011
        #10;          

        OP = 4'b0110; // NOT: ~1010 = 0101
        #10;          

        // Test Arithmetic Shifter 
        A = 4'b1011;  // 11
        B = 4'b0110;  // left shift by 3, fill with 0
        OP = 4'b0111; // Expected: X = 1000, Y = 0101
        #10;          

        A = 4'b0101;  // 5
        B = 4'b1101;  // right shift by 2, fill with 1
        OP = 4'b0111; // Expected: X = 1101, Y = 0100
        #10;          

        // Test Arithmetic Operations
        A = 4'b1100;  // 12
        B = 4'b0101;  // 5
        Cin = 1'b0;
        OP = 4'b1000; // ADD: 12 + 5 = 17 -> X = 0001 (1), Cout = 1
        #10;          

        Cin = 1'b1;
        OP = 4'b1000; // ADD w/ Cin: 12 + 5 + 1 = 18 -> X = 0010 (2), Cout = 1
        #10;          

        Cin = 1'b0;
        OP = 4'b1001; // SUB: 12 - 5 = 7 -> X = 0111 (7)
        #10;          

        A = 4'b0111;  // 7
        B = 4'b0101;  // 5
        OP = 4'b1010; // MUL: 7 * 5 = 35 (0010_0011)  X = 0011 (3), Y = 0010 (2)
        #10;          

        A = 4'b1110;  // 14
        B = 4'b0100;  // 4
        OP = 4'b1011; // DIV: 14 / 4 = 3 rem 2  X = 0011 (3), Y = 0010 (2)
        #10;          

        B = 4'b0000;  // 0
        OP = 4'b1011; // DIV by zero: Expected X = 1111, Y = 1110
        #10;          

        // Test Default / Unused Opcode
        OP = 4'b1111; // Expected: X = 0000, Y = 0000, Cout = 0
        #10;          

        $finish;      // end simulation
    end 

endmodule 
