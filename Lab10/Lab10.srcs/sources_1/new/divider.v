`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2020 11:52:51 PM
// Design Name: 
// Module Name: divider
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


module divider(input pbdiv, clock, input[7:0] x, y, output reg[7:0] q);
    wire go, BLA;
    reg s = 0, Cout = 0;
    reg[3:0]C = 4'd0;
    reg[7:0] aq = 0, bq = 0, qq = 0, naq = 0;
    reg[8:0] sum = 0;
    
    assign go = ((x > 0) & pbdiv);
    //State machine
    always @ (posedge clock)
        case(s)
        0: if(go)  s <= 1; else s <= 0;
        1: if(BLA) s <= 0; else s <= 1;
        default: s <= 0;
        endcase
    //Mealy Outputs : Never tie to clock!
    always @(*)
        begin
        if(s == 0 & go == 0)       C <= 4'b0000;
        else if(s == 0 & go == 1)  C <= 4'b0011;
        if(s == 1 & BLA == 0)      C <= 4'b0110;
        else if(s == 1 & BLA == 1) C <= 4'b1000;
        end
        
    //A & B DFF
    always @(posedge clock)
        begin
        if(C[0]) aq <= x;
        if(C[1])
            begin
            if(C[0]) bq <= y;
            else bq <= sum[7:0];
            end
        end
    
    //PA: No clock input!
    always @(*) naq = ~aq;
    always @(*) sum = (naq + bq + 1);
    not(BLA, sum[8]);
    
    //Quotient loader
    always @(posedge clock)
        begin
        if(C[3]) q <= qq;
        if(C[0]) qq <= 0;
        if(C[2]) qq <= qq + 1;
        end
          
endmodule
