`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 03:06:10 PM
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
    reg x, clk;
    wire[2:0] y;
    wire Qmp, Qmn;
    
    
    //Gated D-Latch
 // D_latch    (D, G,   Q)
    D_latch GDL(x, clk, y[2]);
    
    //Posedge D-Latch
 // D_latch   (D,   G,    Q)
    D_latch PM(x,   ~clk, Qmp);  //Master
    D_latch PS(Qmp, clk,  y[1]); //Slave
    
     //Negedge D-Latch
 // D_latch   (D,   G,    Q)
    D_latch NM(x,   clk,  Qmn);  //Master
    D_latch NS(Qmn, ~clk, y[0]); //Slave
    
    //Inputs are manually timed
    initial
        begin
        clk = 0; x = 0;
 #5              x = 1;
 #5     clk = 1;
 #3              x = 0;
 #2              x = 1;
 #1              x = 0;
 #4     clk = 0;
 #1              x = 1;
 #2              x = 0;
 #4              x = 1;
 #1              x = 0;
 #2     clk = 1;
 #2              x = 1;
 #3              x = 0;
 #1              x = 1;
 #4     clk = 0;
 #3              x = 0;
        end
endmodule
