`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 12:16:20 AM
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
reg enb = 0, load = 0, clk = 0;
reg[11:0] seed = 0;
wire[11:0] rand;
//galois  (enb, load, clock, seed, rand);
galois uut(enb, load, clk,   seed, rand);

initial begin forever #10 clk = ~clk; end

initial
    begin
    seed = 12'd999; load = 1; //replace with seed to sim
    #11 load = 0;
    #9 enb = 1;
    #210 $finish; //generate 11 numbers, the first of which is the seed
    end
endmodule
