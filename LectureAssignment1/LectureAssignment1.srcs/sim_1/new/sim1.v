`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sander Zuckerman
// 
// Create Date: 02/09/2020 01:18:50 PM
// Design Name: 
// Module Name: sim1
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


module sim1();
    reg [3:0] x, y;
    wire [7:0] p;
//  signedmultiplier    (x, y, p);
    signedmultiplier uut(x, y, p);
    
    initial
        begin
        x =  0; y =  5;
 #1     x =  5; y = -5;
 #1     x =  4; y =  3;
 #1     x = -8; y = -4;
 #1     x = -8; y =  7;
        end
endmodule
