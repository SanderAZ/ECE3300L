`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2020 11:15:07 PM
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


module top(input clk, input [15:0] SW, output[7:0] AN, output CA, CB, CC, CD, CE, CF, CG, DP);

//  displayinterface    (clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface out(clk,   SW,   AN,    CA, CB, CC, CD, CE, CF, CG, DP);
    
endmodule
