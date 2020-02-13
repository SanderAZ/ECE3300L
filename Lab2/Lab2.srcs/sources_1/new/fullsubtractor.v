`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 10:18:08 PM
// Design Name: 
// Module Name: fullsubtractor
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


module fullsubtractor(input x, y, Bin, output d, Bout);
    wire [4:0] w; // wires labelled on file available on my GitHub repository
    xor(w[0], x, y);
    not(w[1], x);
    not(w[2], w[0]);
    and(w[3], Bin, w[2]);
    and(w[4], w[1], y);
    xor(d, w[0], Bin);
    or(Bout, w[3], w[4]);
endmodule
