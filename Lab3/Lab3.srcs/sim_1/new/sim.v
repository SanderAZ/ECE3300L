`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sander Zuckerman
// 
// Create Date: 02/19/2020 07:49:38 PM
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
    reg[7:0] a, b;
    reg clk, e;
    wire[3:0] o, t;
    wire h;
    
 // bcd_adder    (a, b, clk, e, o, t, h);
    bcd_adder uut(a, b, clk, e, o, t, h);
    
    initial
        begin
            clk = 0;
                forever
                #10 clk = ~clk;
        end
    
    initial
        begin
        #1          a = 8'b01010101; b = 8'b01010101;
        #8  e = 1;
        #2  e = 0;       
        #18 e = 1;  a = 8'b10011001; b = 8'b10011001;
        #2  e = 0;      
        #18 e = 1;  a = 8'b10000111; b = 8'b01111000;
        #2  e = 0;           
        #18 e = 1;  a = 8'b00100101; b = 8'b01110101;
        #2  e = 0;           
        #18 e = 1;  a = 8'b00110011; b = 8'b01100110;
        #2  e = 0;   
        #18 e = 1;  a = 8'b01101001; b = 8'b10010110;
        #2  e = 0;
        #20 $finish;
        end
endmodule
