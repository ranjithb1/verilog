`timescale 1ns / 1ps

module pattern_25_to_125 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [7:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 8'd25;
        else if (dout >= 8'd125)
            dout <= 8'd25;
        else
            dout <= dout + 8'd25;
    end

endmodule
