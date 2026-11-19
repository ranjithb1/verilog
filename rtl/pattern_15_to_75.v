`timescale 1ns / 1ps

module pattern_15_to_75 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [6:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 7'd15;
        else if (dout >= 7'd75)
            dout <= 7'd15;
        else
            dout <= dout + 7'd15;
    end

endmodule
