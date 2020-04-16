`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 04:05:49 PM
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


module top(input [11:0] SW, input clk, pbgo, output [7:0] AN, output CA, CB, CC, CD, CE, CF, CG, DP);
    reg[26:0] counter = 0;
    wire tick;
    wire enb;
    wire[11:0] P;
    wire[15:0] BCD;
    
    //26-bit counter
    always @(posedge clk)
        counter <= counter +1;
    assign tick = (counter == 0);
    assign enb = (tick && pbgo);
    
    //multiplier (go,  clock, x,       y,        p);
    multiplier m1(enb, clk,   SW[5:0], SW[11:6], P);
    
    //b2bcd   (b, clk, bcd);
    b2bcd bin2(P, clk, BCD);
    
    //displayinterface   (clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface disp(clk,   BCD,  AN,    CA, CB, CC, CD, CE, CF, CG, dp);
endmodule
