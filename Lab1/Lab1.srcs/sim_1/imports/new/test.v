`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 12:44:41 PM
// Design Name: 
// Module Name: test
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


module test();
    reg[3:0] a, b;
    reg Op;
    
    wire[3:0] r;
    wire Cout, Ov;
    
//  add_sub_4bit    (a, b, op, r, Cout, Ov)
    add_sub_4bit uut(a, b, Op, r, Cout, Ov);
    
//  Op= 0 is +, 1 is -
    initial
        begin
        a = 3 ; b = 2 ; Op = 0;
#1      a = 7 ; b = 5 ; Op = 1;
#1      a = -1; b = -5; Op = 0;
#1      a = 3 ; b = 2 ; Op = 1;
#1      a = -3; b = -2; Op = 1;
#1      a = -8; b = 2 ; Op = 1;
#1      a = 5 ; b = 5 ; Op = 0;
        end
endmodule
