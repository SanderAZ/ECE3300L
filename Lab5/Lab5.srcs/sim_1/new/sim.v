`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 12:29:21 AM
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
    reg clock = 0;
    reg[15:0] SWin = 0;
    wire [6:0] segment;
    wire dp;
    wire[7:0] anode;

//  displayinterface    (clock, SWin, anode, ca,         cb,         cc,         cd,         ce,         cf,         cg,         dp);
    displayinterface uut(clock, SWin, anode, segment[6], segment[5], segment[4], segment[3], segment[2], segment[1], segment[0], dp);
    
    initial 
        begin 
        forever #5 clock = ~clock; 
        end
    initial
        begin
        #20 SWin = 16'b0010001101000101; //2345
        end
endmodule
