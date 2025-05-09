`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2024 01:55:58 PM
// Design Name: 
// Module Name: qdecode
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


module qdecode(CLK100MHZ, quadA, quadB, count, switch_in, switch_out, direction_led, seg, AN, DP);
input CLK100MHZ, quadA, quadB, switch_in;
output [7:0] count;
output [6:0] seg;
output [7:0] AN;
output DP;
output direction_led, switch_out;

reg [2:0] quadA_delayed, quadB_delayed;

always @(posedge CLK100MHZ) 
begin
    quadA_delayed <= {quadA_delayed[1:0], quadA};
end
always @(posedge CLK100MHZ)
begin
    quadB_delayed <= {quadB_delayed[1:0], quadB};
end

wire count_enable = quadA_delayed[1] ^ quadA_delayed[2] ^ quadB_delayed[1] ^ quadB_delayed[2];
wire count_direction = quadA_delayed[1] ^ quadB_delayed[2];



assign switch_out = switch_in;
assign direction_led = count_direction;

reg [7:0] count;
always @(posedge CLK100MHZ)
begin
  if(count_enable)
  begin
    if(count_direction)
        count<=count+1;
    else
        count<=count-1;
  end
end

assign DP = 1;
assign AN = 8'b11101110;

hex7seg D1(.x(count), .seg(seg), .d(count_direction));

endmodule



module hex7seg(x, seg, d);
input wire [1:0]d;
input wire [6:0]x;
output reg [6:0]seg;

always @(*)
begin
    case(x)
    0: seg = 7'b0000001;
    1: seg = 7'b1001111;
    2: seg = 7'b0010010;
    3: seg = 7'b0000110;
    4: seg = 7'b1001100;
    5: seg = 7'b0100100;
    6: seg = 7'b0100000;
    7: seg = 7'b0001111;
    8: seg = 7'b0000000;
    9: seg = 7'b0000100;
    default: seg = 7'b0000001;
    endcase
    
    case(d)
    0: seg = 7'b1110001;
    1: seg = 7'b0111000;
    endcase
end
endmodule 