`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 11:25:11 PM
// Design Name: 
// Module Name: lab6
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


module rtl(input[3:0] Datain, input[2:0] ALUS, RS, input Enb, clk, output reg[3:0] Dataout);
    reg[3:0] F = 0;
    //Register
    always @ (posedge clk)
        begin
        if(Enb)
            begin
            case(RS)
            1: Dataout = {1'b0, Dataout[3:1]};
            2: Dataout = {Dataout[2:0], 1'b0};
            3: Dataout = {Dataout[2:0], Dataout[3]};
            4: Dataout = Dataout + 1;
            5: Dataout = Dataout - 1;
            6: Dataout = 0;
            7: Dataout = F;
            default: Dataout <= Dataout;
            endcase
            end
        end
    
    //ALU
    always @ (*)
        begin
        case(ALUS)
        0: F = Datain;
        1: F = Dataout + Datain;
        2: F = Dataout - Datain;
        3: F = Datain - Dataout;
        4: F = Datain & Dataout;
        5: F = Datain | Dataout;
        6: F = Datain ^ Dataout;
        7: F = Dataout;
        default: F <= F;
        endcase
        end
endmodule
