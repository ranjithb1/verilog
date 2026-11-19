`timescale 1ns / 1ps

module last_nonzero_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [1:0] din,
    output reg  [1:0] dout
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dout <= 2'd0;
        else if (din != 2'd0)
            dout <= din;
        else
            dout <= dout;
    end

endmodule
