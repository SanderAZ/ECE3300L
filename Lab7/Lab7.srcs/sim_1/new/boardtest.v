`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2020 05:38:59 PM
// Design Name: 
// Module Name: boardtest
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


module boardtest();
reg clk = 0;
reg[11:0] SW = 12'd2;
wire CA, CB, CC, CD, CE, CF, CG;
wire[7:0] AN;
wire DP;
//module top(input clk, input [11:0] SW, output[6:0] CC, output[7:0] AN, output DP);
    top uut(clk, SW, CA, CB, CC, CD, CE, CF, CG, AN, DP);
    
    initial forever #10 clk = ~clk;
endmodule
