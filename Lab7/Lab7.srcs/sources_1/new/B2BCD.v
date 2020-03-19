`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2020 02:15:40 AM
// Design Name: 
// Module Name: B2BCD
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


module B2BCD(input clk, input [11:0]B, output reg[15:0] BCD);
wire Z;
reg[11:0] R = 0;
reg[3:0]C, DC = 12;
reg[3:0] D0 = 0, D1 = 0, D2 = 0, D3 = 0;
reg[1:0] S = 0;

//State Machine
always @ (posedge clk)
    case(S)
    0: begin S = 1; C[3] = 1; C[2] = 0; C[1] = 0; C[0] = 0; end
    1: if(Z == 1)
        begin S = 0; C[3] = 0; C[2] = 0; C[1] = 0; C[0] = 1; end
       else
        begin S = 2; C[3] = 0; C[2] = 0; C[1] = 1; C[0] = 0; end
    2: begin S = 1; C[3] = 0; C[2] = 1; C[1] = 0; C[0] = 0; end
    default: S = 0;
    endcase

//Down Counter
always @ (posedge clk)
    begin
    if(C[3]) DC <= 12;
    if(C[2]) DC <= DC - 1;
    end
assign Z = (DC == 0);

//Register
always @ (posedge clk)
    if(C[3]) R <= B;

//Shift Registers
always @ (posedge clk)
    begin
    if(C[2])
        {D3, D2, D1, D0, R} = {D3, D2, D1, D0, R} << 1;
    if(C[3])
        {D3, D2, D1, D0} <= 16'd0;
    if(D0 > 4 && C[1]) D0 <= D0 + 3;
    if(D1 > 4 && C[1]) D1 <= D1 + 3;
    if(D2 > 4 && C[1]) D2 <= D2 + 3;
    if(D3 > 4 && C[1]) D3 <= D3 + 3;
    if(C[0])
        BCD <= {D3, D2, D1, D0};
    end
endmodule
