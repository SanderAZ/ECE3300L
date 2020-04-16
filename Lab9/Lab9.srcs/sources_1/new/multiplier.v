`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 11:41:07 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(input go, clock, input[5:0] x, y, output reg[11:0] p);
    reg s = 0, C2 = 0, C1 = 0, C0 = 0, Z = 0;
    reg[11:0] Bq = 0, Pq = 0;
    reg[5:0] Q = 0;
    
    //State Machine
    always @ (posedge clock)
        begin
        case(s)
            0: if(go == 1) s <= 1; else s <= 0;
            1: if(Z == 1) s <= 0; else s <= 1;
            default: s <= 0;
            endcase
        end
        
    //OFL
    always @ (*)
        begin
        if(s == 0 & go == 1) C0 <= 1;
        else C0 <= 0;
        if(s == 1 & Z == 0) C1 <= 1;
        else C1 <= 0;
        if(s == 1 & Z == 1) C2 <= 1;
        else C2 <= 0;
        end
    
    //Decrementer
    always @ (posedge clock)
        begin
        if(C0) Q <= x;
        if(C1) Q <= Q-1;
        end
        
    //XOR (0 detector)
    always @ (*) 
        if(Q ==0) Z <= 1; 
        else Z <= 0;
    
        //Multiplicator...?
    always @ (posedge clock)
        begin
        if(C0) begin Bq <= {6'd0, y}; Pq <= 0; end
        if(C1) Pq <= Pq + Bq;
        end
        
    always @ (posedge clock) if(C2) p <= Pq;
endmodule

