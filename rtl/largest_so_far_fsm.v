`timescale 1ns / 1ps

module largest_so_far_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [1:0] din,
    output reg  [1:0] dout
);

    reg first_sample;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dout         <= 2'd0;
            first_sample <= 1'b1;
        end else begin
            if (first_sample) begin
                dout         <= din;
                first_sample <= 1'b0;
            end else if (din > dout) begin
                dout         <= din;
            end
        end
    end

endmodule
