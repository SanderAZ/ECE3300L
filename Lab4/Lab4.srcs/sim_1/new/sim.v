`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2020 12:52:11 AM
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
    reg [7:0] delay = 156; //delay mathematically determined to be ~156; will be off by 1 unit every 4 cycles
    reg [7:0] PW = 0;
    wire PWM;

//  PWM    (delay, PW, clk, PWM);
    PWM UUT(delay, PW, clk, PWM);
    
    initial
        begin
        forever #5 clk = ~clk;
        end
    initial
        begin
        #1 PW = 100;
        end
endmodule
