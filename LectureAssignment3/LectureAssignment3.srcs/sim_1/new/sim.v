`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2020 04:45:04 PM
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
    reg clk = 0, s = 0;
    wire[9:0] Q;
    
//  periodmeter    (clk, s, count)
    periodmeter uut(clk, s, Q);
    
    localparam period = 4'b1010;
    initial
        begin
        forever #(period/2) clk = ~clk;
        end
    initial
        begin
        repeat(8) begin #(period * 50) s <= ~s; end
        #100
        repeat(8) begin #(period * 250) s <= ~s; end
        #100
        repeat(8) begin #(period * 500) s <= ~s; end
        end
endmodule
