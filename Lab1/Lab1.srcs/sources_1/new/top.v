`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2020 10:59:39 PM
// Design Name: 
// Module Name: top
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


module top(input[3:0] swa, swb, input swop, output[3:0] ledr, output ledcout, ledov);
//  add_sub_4bit(a,   b,   op,   r,    Cout,    Ov)
    add_sub_4bit(swa, swb, swop, ledr, ledcout, ledov);
endmodule
