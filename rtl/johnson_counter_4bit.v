`timescale 1ns / 1ps

module johnson_counter_4bit (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [3:0] q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else begin
            q <= {q[2:0], ~q[3]};
        end
    end
endmodule
