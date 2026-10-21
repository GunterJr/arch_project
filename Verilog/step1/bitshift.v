
module bitshift(
    input signed [3:0] in,   
    input dir,  
    output signed [3:0] out   
);

    // If dir is 1, shift in left by 1; otherwise shift in right by 1
    assign out = dir ? (in <<< 1) : (in >>> 1); 

endmodule
