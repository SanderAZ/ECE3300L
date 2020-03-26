`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2020 02:53:20 PM
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


module top(input clk, pbgo, input[12:0] SW, output[7:0] AN, output CA, CB, CC, CD, CE, CF, CG, DP, LED);
    reg[26:0] counter = 0;
    wire tick;
    wire enb;
    wire[11:0] RN;
    wire[15:0] BCD;
    
    //26-bit counter
    always @(posedge clk)
        counter <= counter +1;
    assign tick = (counter == 0);
    assign LED = tick;
    assign enb = (tick && pbgo);

    //galois  (enb, load,   clock, seed,     rand);
    galois rng(enb, SW[12], clk,   SW[11:0], RN);
    
    //B2BCD  (clock, B,  BCD);
    //B2BCD bin1(clk,   RN, BCD);
    
    //b2bcd(input [11:0] b, input clk, output reg [15:0] bcd);
    b2bcd bin2(RN, clk, BCD);
    
    //displayinterface   (clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface disp(clk,   BCD,  AN,    CA, CB, CC, CD, CE, CF, CG, dp);
    
endmodule
