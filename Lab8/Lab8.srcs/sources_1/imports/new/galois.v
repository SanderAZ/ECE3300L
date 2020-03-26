`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2020 11:56:42 PM
// Design Name: 
// Module Name: galois
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


module galois(input enb, load, clock, input[11:0] seed, output reg[11:0] rand);
    always @ (posedge clock)
    begin
    if(load) rand <= seed;
    else if (enb)
        begin
        rand <= {rand[0], (rand[11]^rand[0]), (rand[10]^rand[0]), rand[9:5], (rand[4]^rand[0]), rand[3:1]};
        end
    end
endmodule
