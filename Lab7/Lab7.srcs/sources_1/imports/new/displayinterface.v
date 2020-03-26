`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:04:46 PM
// Design Name: 
// Module Name: displayinterface
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


module displayinterface(input clock, input [15:0] SWin, output reg[7:0] anode, output reg ca, cb, cc, cd, ce, cf, cg, dp);
    reg[19:0] count = 0;
    reg[5:0]  dout = 0;
    always @ (posedge clock) count <= count + 1;
    always @ (posedge clock)
        begin
        case(count[19:17])
            0:       begin anode = 8'b11111110; dout = {1'b1, SWin[3:0],   1'b1}; end
            1:       begin anode = 8'b11111101; dout = {1'b1, SWin[7:4],   1'b1}; end
            2:       begin anode = 8'b11111011; dout = {1'b1, SWin[11:8],  1'b1}; end
            3:       begin anode = 8'b11110111; dout = {1'b1, SWin[15:12], 1'b1}; end
            4:       begin anode = 8'b11101111; dout = {6'b000001}; end   
            5:       begin anode = 8'b11011111; dout = {6'b000001}; end   
            6:       begin anode = 8'b10111111; dout = {6'b000001}; end   
            7:       begin anode = 8'b01111111; dout = {6'b000001}; end   
            default: begin anode = 8'b11111111; dout = {6'b011111}; end   
        endcase
        end
    always @ (posedge clock)
        begin
        if(dout[5])
            begin
            dp <= dout[0];
            case(dout[4:1])
                0:  {ca, cb, cc, cd, ce, cf, cg} = 7'h01;
                1:  {ca, cb, cc, cd, ce, cf, cg} = 7'h4F;
                2:  {ca, cb, cc, cd, ce, cf, cg} = 7'h12;
                3:  {ca, cb, cc, cd, ce, cf, cg} = 7'h06;
                4:  {ca, cb, cc, cd, ce, cf, cg} = 7'h4C;
                5:  {ca, cb, cc, cd, ce, cf, cg} = 7'h24;
                6:  {ca, cb, cc, cd, ce, cf, cg} = 7'h20;
                7:  {ca, cb, cc, cd, ce, cf, cg} = 7'h0F;
                8:  {ca, cb, cc, cd, ce, cf, cg} = 7'h00;
                9:  {ca, cb, cc, cd, ce, cf, cg} = 7'h04;
                10: {ca, cb, cc, cd, ce, cf, cg} = 7'h08; //A
                11: {ca, cb, cc, cd, ce, cf, cg} = 7'h60; //b
                12: {ca, cb, cc, cd, ce, cf, cg} = 7'h31; //C
                13: {ca, cb, cc, cd, ce, cf, cg} = 7'h42; //d
                14: {ca, cb, cc, cd, ce, cf, cg} = 7'h30; //E
                15: {ca, cb, cc, cd, ce, cf, cg} = 7'h38; //F
                default: {ca, cb, cc, cd, ce, cf, cg} = 7'h7F;
            endcase
            end
        else {dp, ca, cb, cc, cd, ce, cf, cg} = 8'hFF;
        end
endmodule
