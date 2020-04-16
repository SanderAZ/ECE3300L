`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2020 04:11:39 PM
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


module top(input[15:0] SW, input clk, pb, output[7:0] AN, output CA, CB, CC, CD, CE, CF, CG, DP);
    reg[26:0] counter = 0;
    wire tick;
    wire enb;
    wire[7:0] Q;
    wire[15:0] BCD;
    
    //26-bit counter
    always @(posedge clk)
        counter <= counter +1;
    assign tick = (counter == 0);
    assign enb = (tick && pb);
    
    //divider  (pbdiv, clock, x,        y,       q);
    divider div(enb,   clk,   SW[15:8], SW[7:0], Q);
    
    //b2bcd   (b, clk, bcd);
    b2bcd bin2({4'd0, Q}, clk, BCD);
    
    //displayinterface   (clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface disp(clk,   BCD,  AN,    CA, CB, CC, CD, CE, CF, CG, dp);
    
endmodule
