`timescale 1ns / 1ps

module pattern_72_to_88 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [6:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 7'd72;
        else if (dout >= 7'd88)
            dout <= 7'd72;
        else
            dout <= dout + 7'd4;
    end

endmodule
