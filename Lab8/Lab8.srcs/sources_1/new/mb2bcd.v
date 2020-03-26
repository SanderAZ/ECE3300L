`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2020 03:28:07 PM
// Design Name: 
// Module Name: mb2bcd
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


module b2bcd(input [11:0] b, input clk, output reg [15:0] bcd);
reg[3:0] i;
wire z;
reg[1:0] s =0;
reg c3=0,c2=0,c1=0,c0=0;
reg [3:0] d0,d1,d2,d3;
reg [11:0] r;

always @(posedge clk)
    begin
    if (c3) i <=11;
    else if(c2) i <= i-1;
    end

assign z = ( i == 0);

always @(posedge clk)
    begin
    if(c3) r <= b;
    else if(c2) r <= r << 1;
    end 

always @(posedge clk)
begin
    case(s)
        0: begin s <= 1; c3<=1;c2<=0;c1<=0;c0<=0;end
        1: begin 
            if(z)
               begin s <= 0; c3 <=0; c2 <=0;c1<=0;c0<=1; end
            else
               begin s <= 2; c3<=0;c2<=0;c1<=1;c0<=0; end
           end
        2: begin s <= 1; c3 <= 0; c2<=1;c1<=0;c0<=0; end
        default: begin s <= 0; c3<=1;c2<=0;c1<=0;c0<=0; end
    endcase
 end
 
 always @(posedge clk)
    begin
        if(c3) d0 <= 0;
        else if( c2) d0 <= {d0[2:0] , r[11]};
        else if (c1 & (d0 > 4'd4)) d0 <= d0 + 4'd3;
    end         

 always @(posedge clk)
    begin
    if(c3) d1 <= 0;
    else if( c2) d1 <= {d1[2:0] , d0[3]};
    else if (c1 & (d1 > 4'd4)) d1 <= d1 + 4'd3;
    end         

 always @(posedge clk)
    begin
    if(c3) d2 <= 0;
    else if( c2) d2 <= {d2[2:0] , d1[3]};
    else if (c1 & (d2 > 4'd4)) d2 <= d2 + 4'd3;
    end         

 always @(posedge clk)
 begin
    if(c3) d3 <= 0;
    else if( c2) d3 <= {d3[2:0] , d2[3]};
    else if (c1 & (d3 > 4'd4)) d3 <= d3 + 4'd3;
 end         

always @(posedge clk)
    if(c0) bcd <= {d3,d2,d1,d0};

endmodule