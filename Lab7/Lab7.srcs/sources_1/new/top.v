`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2020 04:30:29 PM
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


module top(input clk, input [11:0] SW, output CA, CB, CC, CD, CE, CF, CG, output[7:0] AN, output DP);
    wire[15:0] BCD;
    
//  B2BCD   (clock, B,  BCD);
    B2BCD m1(clk,   SW, BCD);
    
//  displayinterface   (clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface m2(clk,   BCD,  AN,    CA, CB, CC, CD, CE, CF, CG, DP);
endmodule

