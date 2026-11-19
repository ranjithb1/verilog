`timescale 1ns / 1ps

module seq_det_1011 (
    input  wire clk,
    input  wire rst_n,
    input  wire din,
    output reg  dout
);
    localparam S_IDLE = 2'b00,
               S_1    = 2'b01,
               S_10   = 2'b10,
               S_101  = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    // Next-state & Output logic (Mealy)
    always @(*) begin
        dout       = 1'b0;
        next_state = state;

        case (state)
            S_IDLE: begin
                if (din) next_state = S_1;
                else     next_state = S_IDLE;
            end

            S_1: begin
                if (!din) next_state = S_10;
                else      next_state = S_1;
            end

            S_10: begin
                if (din)  next_state = S_101;
                else      next_state = S_IDLE;
            end

            S_101: begin
                if (din) begin
                    dout       = 1'b1;   // Detected 1011
                    next_state = S_IDLE; // Non-overlapping resets to IDLE
                end else begin
                    next_state = S_10;
                end
            end

            default: next_state = S_IDLE;
        endcase
    end
endmodule
