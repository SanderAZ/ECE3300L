`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 04:22:59 PM
// Design Name: 
// Module Name: statemachine
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


module statemachine(input clk, x, output y);
    reg [2:0] S = 000; //Assume state begins in A
    
    //State Machine
    always @ (posedge clk)
        begin
        case(S)
            3'b000: begin if(x) S <= 3'b110; else S <= 3'b001; end //A
            3'b001: begin if(x) S <= 3'b010; else S <= 3'b101; end //B
            3'b010: begin if(x) S <= 3'b011; else S <= 3'b100; end //C
            3'b011: S <= 000; //D
            3'b100: S <= 000; //E
            3'b101: S <= 100; //F
            3'b110: S <= 101; //H
            default: S <= 3'b000;
            endcase
        end
        
    //OFL
    assign y = ((S == 3'b011) && (x == 1));
endmodule
