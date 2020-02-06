`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 12:04:32 PM
// Design Name: 
// Module Name: add_sub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_sub(input x, y, Sub_in, Cin, output r, Sub_out, Cout);
    wire y_not, q;
    not(y_not, y);
    buf(Sub_out, Sub_in);
    
//  mux_2x1   (s,      i1,     i0, out)    
    mux_2x1 m1(Sub_in, y_not,  y,  q);
    
 // fulladder    (x, y, Cin, Cout, s)
    fulladder fa1(x, q, Cin, Cout, r);
endmodule
