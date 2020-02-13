`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 10:32:31 PM
// Design Name: 
// Module Name: subsel
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


module subsel(input x3, y3, x2, y2, x1, y1, x0, y0, s, output Bout, R, output r3, r2, r1);
    wire [2:0] q, b;
    
 // fullsubtractor    (x,  y,  Bin,  d,    Bout);   
    fullsubtractor fs0(x0, y0, 0,    q[0], b[0]);
    fullsubtractor fs1(x1, y1, b[0], q[1], b[1]);
    fullsubtractor fs2(x2, y2, b[1], q[2], b[2]);
    fullsubtractor fs3(x3, y3, b[2], R,    Bout);
    
 // mux_2x1   (s, i1, i0,   out);
    mux_2x1 m1(s, x0, q[0], r1);
    mux_2x1 m2(s, x1, q[1], r2);
    mux_2x1 m3(s, x2, q[2], r3);
endmodule
