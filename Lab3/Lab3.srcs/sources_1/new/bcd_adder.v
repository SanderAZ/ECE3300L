`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sander Zuckerman
// 
// Create Date: 02/19/2020 07:12:26 PM
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(input [7:0] a, b, input clk, e, output[3:0] o, t, output h);
    reg [7:0] tr;
    wire oc;
    always @ (posedge clk)
        begin
            if(e)
                tr <= a;
        end
    assign oc = ((tr[3:0] + b[3:0]) > 9)? 1:0; //Simple conditional to track if a[3:0] + b[3:0] > 9
    assign o = oc? (tr[3:0] + b[3:0] + 4'b0110) : tr[3:0] + b[3:0]; // If a[3:0] + b[3:0] > 9, add them and add 6, otherwise simply add them
    assign h = ((tr[7:4] + b[7:4] + oc) > 9)? 1:0; //Conditional to track of a[7:4] + b[7:4] and the ones carry (if any) is > 9
    assign t = h? (tr[7:4] + b[7:4] + oc + 4'b0110) : tr[7:4] + b[7:4] + oc; // If a[7:4] + b[7:4] + the ones carry > 9, add them and add 6, otherwise simply add them
endmodule
