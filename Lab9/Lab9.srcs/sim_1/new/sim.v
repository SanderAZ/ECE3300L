`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 11:58:19 PM
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
    reg[5:0] x, y;
    reg go = 0, clock = 0;
    wire[11:0] p;
    localparam[4:0] period = 5'd20;
    
    //multiplier  (go, clock, x, y, p);
    multiplier uut(go, clock, x, y, p);
    
    initial begin forever #(period/2.0) clock = ~clock; end
    initial
        begin
        #9 x = 11; y = 60; go = 1;
        #2 go = 0;
        #(period * 100) $finish;
        end
endmodule
