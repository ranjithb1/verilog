`timescale 1ns / 1ps

module pattern_mul_3_to_48 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [5:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 6'd3;
        else if (dout >= 6'd48)
            dout <= 6'd3;
        else
            dout <= dout << 1;
    end

endmodule
