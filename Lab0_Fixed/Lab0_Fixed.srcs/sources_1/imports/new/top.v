`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:44:55 PM
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


module top(input[3:0] swx, swy, input swc, output[3:0] leds, output ledcout);
//    paralleladder(x,   y,   Cin, s,    Cout);
      paralleladder(swx, swy, swc, leds, ledcout);
endmodule
