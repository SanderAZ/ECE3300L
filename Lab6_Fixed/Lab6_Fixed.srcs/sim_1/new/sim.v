`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 11:43:35 PM
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
reg[3:0] Datain = 0;
reg[2:0] ALUS = 0, RS = 0;
reg Enb = 1, clk = 0;
wire[3:0] Dataout;

//  rtl    (Datain, ALUS, RS, Enb, clk, Dataout);
    rtl uut(Datain, ALUS, RS, Enb, clk, Dataout);
    localparam period = 4'b1010;
    initial 
        begin
        forever #(period/2) clk = ~clk;
        end
    initial
        begin
            ALUS = 000; RS = 111; Datain = 4'd8; #1
#(period)   ALUS = 001; RS = 111; Datain = 4'd5;
#(period)               RS = 101;
#(period)               RS = 001;
#(period)               RS = 010;
#(period)               RS = 100;
#(period)               RS = 011;
#(period)               RS = 110;
#(period)   ALUS = 110; RS = 111; Datain = 4'd9;
#(period)   ALUS = 100; RS = 111; Datain = 4'd3;
#(period)   ALUS = 110; RS = 111; Datain = 4'd1;
        end
endmodule
