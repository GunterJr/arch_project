
module bitshift(
    input signed [3:0] in,   // 4-bit input value to be shifted (marked signed)
    input dir,  // direction select: 0 = right shift, 1 = left shift
    output signed [3:0] out   // 4-bit shifted output value
);

    // If dir is 1, shift in left by 1; otherwise shift in right by 1
    assign out = dir ? (in <<< 1) : (in >>> 1); 

endmodule
