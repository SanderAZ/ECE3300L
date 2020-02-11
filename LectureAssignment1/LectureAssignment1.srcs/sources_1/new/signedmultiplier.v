`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sander Zuckerman
// 
// Create Date: 02/09/2020 12:05:33 PM
// Design Name: 
// Module Name: signedmultiplier
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


module signedmultiplier(input [3:0] x, y, output[7:0] p);
    wire c0, c6;
    wire [1:0] c1, c5;
    wire [2:0] c2;
    wire [3:0] c3, c4;
    wire nx1, nx2, nx3;
    wire [11:0] carry;
    wire [5:0] s;
    
    not(nx1, x[1]);
    not(nx2, x[2]);
    not(nx3, x[3]);
 
    and(c0, x[0], y[0]);
 
    and(c1[0], x[1], y[0]);
    and(c1[1], x[0], y[1]);
 
    and(c2[0], x[2], y[0]);
    and(c2[1], x[1], y[1]);
    and(c2[2], x[0], y[2]);
    
    nand(c3[0], x[3], y[0]);
    and(c3[1], x[2], y[1]);
    and(c3[2], x[1], y[2]);
    nand(c3[3], x[0], y[3]);
    
    buf(c4[0], y[3]);
    nand(c4[1], x[3], y[1]);
    and(c4[2], x[2], y[2]);
    and(c4[3], nx1, y[3]);
    
    nand(c5[0], x[3], y[2]);
    and(c5[1], nx2, y[3]);
    
    nand(c6, nx3, y[3]);
    
    buf(p[0], c0);
    
 // fulladder    (x,     y,         Cin,       Cout,     s)
    fulladder fa00(c1[0], c1[1],    0,         carry[0], p[1]);
              
    fulladder fa01(c2[0], c2[1],    0,         carry[1], s[0]);
    fulladder fa02(c2[2], s[0],     carry[0],  carry[2], p[2]);
                
    fulladder fa03(c3[0], c3[1],    0,         carry[3], s[1]);
    fulladder fa04(c3[2], s[1],     carry[1],  carry[4], s[2]);
    fulladder fa05(c3[3], s[2],     carry[2],  carry[5], p[3]);
                
    fulladder fa06(c4[0], c4[1],    carry[3],  carry[6], s[3]);
    fulladder fa07(c4[2], s[3],     carry[4],  carry[7], s[4]);
    fulladder fa08(c4[3], s[4],     carry[5],  carry[8], p[4]);
                
    fulladder fa09(c5[0], c5[1],    carry[6],  carry[9], s[5]);
    fulladder fa10(s[5],  carry[7], carry[8],  carry[10], p[5]);
    
    fulladder fa11(c6,    carry[9], carry[10], carry[11], p[6]);
    
    fulladder fa12(1,     carry[11], 0,                 , p[7]);
endmodule
