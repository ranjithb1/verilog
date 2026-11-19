`timescale 1ns / 1ps

module binary_pattern_gen (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [7:0] dout
);

    reg [1:0] step;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            step <= 2'd0;
            dout <= 8'b00001111;
        end else begin
            step <= step + 1'b1;
            case (step + 1'b1)
                2'd0: dout <= 8'b00001111;
                2'd1: dout <= 8'b00110011;
                2'd2: dout <= 8'b01010101;
                2'd3: dout <= 8'b11110000;
            endcase
        end
    end

endmodule
