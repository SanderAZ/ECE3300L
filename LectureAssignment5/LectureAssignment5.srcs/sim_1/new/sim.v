`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 04:30:48 PM
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
    reg x, clk = 0;
    wire y;
    //statemachine  (clk, x, y);
    statemachine uut(clk, x, y);
    localparam[4:0] period = 5'b10100;
    
    initial begin forever #(period/2) clk = ~clk; end
    
    initial
    begin
        #1 x = 0;
        // Word 0000
        #(period*4) x = 1;
        // Word 1111
        #(period*4) x = 0;
        #(period)   x = 1;
        #(period *3) $finish;
        //Word 0111
    end
endmodule
