`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 12:01:30
// Design Name: 
// Module Name: decoder_2x4_tb
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


module decoder2x4_tb;

reg a, b, e;
wire y0, y1, y2, y3;

decoder2x4 dut (
    .a(a),
    .b(b),
    .e(e),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

initial begin
    e = 0; a = 0; b = 0; #10;

    e = 1; a = 0; b = 0; #10;
    e = 1; a = 0; b = 1; #10;
    e = 1; a = 1; b = 0; #10;
    e = 1; a = 1; b = 1; #10;

    $finish;
end

endmodule
