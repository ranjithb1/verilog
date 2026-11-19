`timescale 1ns / 1ps

module shift_reg_div3 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       din,
    output reg  [3:0] q
);
    reg [1:0] clk_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt <= 2'b00;
            q       <= 4'b0000;
        end else begin
            if (clk_cnt == 2'd2) begin
                clk_cnt <= 2'b00;
                q       <= {q[2:0], din}; // Shift on 3rd tick
            end else begin
                clk_cnt <= clk_cnt + 1'b1;
            end
        end
    end
endmodule
