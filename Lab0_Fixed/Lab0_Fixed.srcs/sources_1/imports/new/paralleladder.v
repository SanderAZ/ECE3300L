`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:27:29 PM
// Design Name: 
// Module Name: paralleladder
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


module paralleladder(input[3:0] x, y, input Cin, output[3:0] s, output Cout);
    wire C3, C2, C1;
    
//  fulladder     (x,    y,    Cin, Cout, s)
    fulladder  fa1(x[0], y[0], Cin, C1,   s[0]);
    fulladder  fa2(x[1], y[1], C1,  C2,   s[1]);
    fulladder  fa3(x[2], y[2], C2,  C3,   s[2]);
    fulladder  fa4(x[3], y[3], C3,  Cout, s[3]);
endmodule
