`timescale 1ns / 1ps

module odd_count_parity_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [1:0] din,
    output reg        is_odd
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            is_odd <= 1'b0;
        else if (din[0] == 1'b1)
            is_odd <= ~is_odd;
    end

endmodule
