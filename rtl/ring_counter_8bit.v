`timescale 1ns / 1ps

module decoder_3to8(input [2:0] a, input en, output reg [7:0] y);
always @(*) begin
    if (en)
        y = 8'b00000001 << a;
    else
        y = 8'b00000000;
end
endmodule

module counter_3bit(input clk, input rst_n, output reg [2:0] q);
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        q <= 3'b000;
    else
        q <= q + 1'b1;
end
endmodule

module ring_counter_8bit(input clk, input rst_n, output [7:0] out);
wire [2:0] q;

counter_3bit c1(clk, rst_n, q);
decoder_3to8 d1(q, 1'b1, out);

endmodule
