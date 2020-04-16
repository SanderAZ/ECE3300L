`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2020 12:16:39 AM
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
    reg pbdiv, clock = 0;
    reg[7:0] x, y;
    wire[7:0] q;
    localparam[4:0] period = 5'd20;
    
    //divider  (pbdiv, clock, x, y, q);
    divider uut(pbdiv, clock, x, y, q);
    
    initial begin forever #(period/2.0) clock = ~clock; end
    initial
        begin
        #9 x = 100; y = 55;
        #2 pbdiv = 1;
        #20 pbdiv = 0;
        end
endmodule
