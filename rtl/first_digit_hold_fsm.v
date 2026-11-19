`timescale 1ns / 1ps

module first_digit_hold_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [1:0] din,
    output reg  [1:0] dout
);

    reg latched;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dout    <= 2'd0;
            latched <= 1'b0;
        end else if (!latched) begin
            dout    <= din;
            latched <= 1'b1;
        end
    end

endmodule
