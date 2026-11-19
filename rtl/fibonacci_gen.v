`timescale 1ns / 1ps

module fibonacci_gen (
    input  wire       clk,
    input  wire       rst_n,
    output reg  [7:0] fib_out,
    output reg        done
);

    reg [7:0] a, b;
    reg [3:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a       <= 8'd0;
            b       <= 8'd1;
            fib_out <= 8'd0;
            count   <= 4'd0;
            done    <= 1'b0;
        end else if (count < 4'd10) begin
            if (count == 4'd0) begin
                fib_out <= 8'd0;
                a       <= 8'd0;
                b       <= 8'd1;
            end else if (count == 4'd1) begin
                fib_out <= 8'd1;
            end else begin
                fib_out <= a + b;
                a       <= b;
                b       <= a + b;
            end
            count <= count + 1'b1;
            if (count == 4'd9)
                done <= 1'b1;
        end
    end

endmodule
