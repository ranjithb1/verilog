`timescale 1ns / 1ps

module pattern_5_to_30 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [5:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 6'd5;
        else if (dout >= 6'd30)
            dout <= 6'd5;
        else
            dout <= dout + 6'd5;
    end

endmodule
