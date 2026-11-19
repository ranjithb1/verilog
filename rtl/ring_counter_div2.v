`timescale 1ns / 1ps

module ring_counter_div2 (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [7:0] ring_out
);
    reg clk_div2_flag;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div2_flag <= 1'b0;
            ring_out      <= 8'b0000_0001;
        end else begin
            clk_div2_flag <= ~clk_div2_flag;
            
            // Advance ring counter only on every 2nd clock pulse
            if (clk_div2_flag) begin
                ring_out <= {ring_out[6:0], ring_out[7]};
            end
        end
    end
endmodule
