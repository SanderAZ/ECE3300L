`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 10:43:19 PM
// Design Name: 
// Module Name: divider
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


module divider(input [3:0] A, B, output [3:0] Q, R);
    wire[13:0] w; // wires labelled on file available on my GitHub repository

//  subsel   (x3,    y3,   x2,    y2,   x1,   y1,   x0,   y0,   s,     Bout,  R,     r3,    r2,    r1)
    subsel s3(0,     B[3], 0,     B[2], 0,    B[1], A[3], B[0], w[0],  w[0],   ,     w[3],  w[2],  w[1]);
    subsel s2(w[3],  B[3], w[2],  B[2], w[1], B[1], A[2], B[0], w[4],  w[4],   ,     w[7],  w[6],  w[5]);
    subsel s1(w[7],  B[3], w[6],  B[2], w[5], B[1], A[1], B[0], w[8],  w[8],   ,     w[11], w[10], w[9]);
    subsel s0(w[11], B[3], w[10], B[2], w[9], B[1], A[0], B[0], w[12], w[12], w[13], R[2],  R[1],  R[0]);
    
    not(Q[3], w[0]);
    not(Q[2], w[4]);
    not(Q[1], w[8]);
    not(Q[0], w[12]);
    
 // mux_2x1  (s,     i1,    i0,    out);  
    mux_2x1 m(w[12], w[11], w[13], R[3]);
endmodule
