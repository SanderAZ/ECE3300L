`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:32:31 PM
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
    reg [3:0] x, y;
    reg Cin;
    wire [3:0] s;
    wire Cout;
    
 // paralleladder    (x, y, Cin, s, Cout)
    paralleladder uut(x, y, Cin, s, Cout);
    
    initial
        begin
        x = 0; y = 0; Cin = 0;
#1      x = 3; y = 4; Cin = 0;        
#1      x = 3; y = 4; Cin = 1;        
#1      x = 7; y = 7; Cin = 1;        
#1      x = 15; y = 4; Cin = 0;       
        end 
endmodule
