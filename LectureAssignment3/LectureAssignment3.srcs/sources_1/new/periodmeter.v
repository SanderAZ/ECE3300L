`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2020 03:51:39 PM
// Design Name: 
// Module Name: periodmeter
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


module periodmeter(input clk, s, output reg [9:0] count);
    reg q1 = 0, q2 = 0;
    reg [9:0] c = 1;
    always @(posedge clk)
        begin
        q1 <= s;
        if(q1 & ~s) q2 <= ~q2;
        if(q2) c <= c+1;
        if(q1 & ~s & ~q2) c <= 1;
        if(q1 & ~s & q2) count <= c;
        end
endmodule
