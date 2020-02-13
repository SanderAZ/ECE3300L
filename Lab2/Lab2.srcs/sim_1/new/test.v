`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 11:27:32 PM
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
    reg [3:0] A, B;
    wire [3:0] Q, R;

//  divider    (A, B, Q, R)
    divider uut(A, B, Q, R);
    
    initial
        begin
        A = 12; B =  3;
#1      A = 10; B = 10;
#1      A =  4; B = 12;  
#1      A = 15; B =  6;  
#1      A =  1; B = 15;
        end
endmodule
