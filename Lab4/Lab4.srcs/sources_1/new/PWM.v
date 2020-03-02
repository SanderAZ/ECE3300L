`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2020 12:34:06 AM
// Design Name: 
// Module Name: PWM
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


module PWM(input [7:0] delay, PW, input clk, output reg PWM);
    reg[7:0] delaycount = 0; //For the purposes of this lab, delaycount mathematically determined to be 8 bits wide
    reg[7:0] periodcount = 0;
    always @ (posedge clk)
        begin
        if(delaycount == 0)
            begin
            delaycount <= delay;
            periodcount <= periodcount + 1;
            end
        else 
            delaycount <= (delaycount - 1);
        end
     always @ (posedge clk) //Maybe make this continuous assignment?
        begin
            if(PW == 0) PWM = 0;
            else if (PW == 255) PWM = 1;
            else if(periodcount <= PW) PWM = 1;
            else PWM = 0;
        end
endmodule
