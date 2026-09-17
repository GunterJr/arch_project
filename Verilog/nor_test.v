// all I/O in args
// first try and and then try nor

module nor_test (A, B, X);

    input A, B;
    output X;

    assign X = !(A || B);

endmodule
