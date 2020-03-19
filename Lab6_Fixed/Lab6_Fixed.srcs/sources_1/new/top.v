`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:11:59 PM
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


module top(input[10:0] SW, input clk, output[7:0] AN, output[6:0] CC, output DP);
    wire tick;
    wire Enb;
    assign Enb = (tick && SW[10]);
    wire[3:0] W;
    
    reg[26:0] counter = 0;
    wire tick;
    
    always @ (posedge clk)
        counter <= counter + 1;
    assign tick = (counter == 0);
    
//  rtl   (Datain, ALUS, RS, Enb, clk, Dataout);
    rtl r1(.RS(SW[2:0]), .Datain(SW[6:3]), .ALUS(SW[9:7]), .Enb(Enb), .clk(clk), .Dataout(W[3:0]));
    
//  displayinterface(clock, SWin, anode, ca, cb, cc, cd, ce, cf, cg, dp);
    displayinterface d1(clk, {1'b0, SW[9:7], 1'b0, SW[2:0], SW[6:3], W}, AN, CC[0], CC[1], CC[2], CC[3], CC[4], CC[5], CC[6], DP);
endmodule
