// all I/O in args
// first try and and then try nand

module nand_test (A, B, X);

    input A, B;
    output X;

    assign X = !(A && B);

endmodule