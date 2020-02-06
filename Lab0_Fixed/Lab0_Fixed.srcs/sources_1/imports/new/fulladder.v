`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:25:41 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(input x, y, Cin, output Cout, s);
    wire a1, a2, a3;
    xor(s, x, y, Cin);
    and(a1, x, y);
    and(a2, x, Cin);
    and(a3, y, Cin);
    or(Cout, a1, a2, a3);
endmodule
