`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2020 02:35:37 AM
// Design Name: 
// Module Name: sim
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


module sim();
    reg clk = 0;
    reg[11:0] B = 0;
    wire[15:0] BCD;

//  B2BCD    (clk, B, BCD);
    B2BCD uut(clk, B, BCD);
    
    initial forever #10 clk = ~clk;
    initial
    begin
    #2000 B = 3456;
    #2000 B = 999;
    #2000 B = 75;
    #2000 B = 8;
    end  
endmodule
