`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:08:23 PM
// Design Name: 
// Module Name: delaycount
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


module delaycount(input clk, output tick);
    reg[26:0] counter = 0;
    wire tick;
    
    always @ (posedge clk)
        counter <= counter + 1;
    assign tick = (counter == 0);
endmodule
