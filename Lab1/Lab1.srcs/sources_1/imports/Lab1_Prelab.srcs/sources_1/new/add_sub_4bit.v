`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 12:30:58 PM
// Design Name: 
// Module Name: add_sub_4bit
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


module add_sub_4bit(input[3:0] a, b, input op, output[3:0] r, output Cout, Ov);
    wire[8:1] q; // [8:1] is used to follow the labelling of the image provided in the GitHub repository
    
//  add_sub    (x,    y,    Sub_in, Cin,  r,    Sub_out, Cout)
    add_sub as3(a[3], b[3], op,     q[7], r[3], q[1],    q[8]);
    add_sub as2(a[2], b[2], q[1],   q[6], r[2], q[2],    q[7]);
    add_sub as1(a[1], b[1], q[2],   q[5], r[1], q[3],    q[6]);
    add_sub as0(a[0], b[0], q[3],   q[4], r[0], q[4],    q[5]);
    
    xor(Ov, q[8], q[7]);
    buf(Cout, q[8]);
endmodule
