//////////////////////////////////////////////////////////////////////////////
// File:        bitshift.v
// Module:      bitshift
// Description: 4-bit Arithmetic Shift circuit with selectable direction.
//              If dir = 0, shifts right by 1 (and preserves sign).
//              If dir = 1, shifts left by 1.
// Inputs:      in  - 4-bit signed input value to be shifted
//              dir - 1-bit direction select (0 = right, 1 = left)
// Outputs:     out - 4-bit shifted output value
//////////////////////////////////////////////////////////////////////////////

module bitshift(
    input  signed [3:0] in,   // 4-bit input value to be shifted (marked signed)
    input               dir,  // direction select: 0 = right shift, 1 = left shift
    output signed [3:0] out   // 4-bit shifted output value
);

    // If dir is 1, shift in left by 1; otherwise shift in right by 1
    assign out = dir ? (in <<< 1) : (in >>> 1); 

endmodule