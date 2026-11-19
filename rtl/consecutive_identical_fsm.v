`timescale 1ns / 1ps

module consecutive_identical_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [1:0] din,
    output reg        match
);

    localparam [2:0] S_IDLE  = 3'd0,
                     S_PREV0 = 3'd1,
                     S_PREV1 = 3'd2,
                     S_PREV2 = 3'd3,
                     S_PREV3 = 3'd4;

    reg [2:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (din)
            2'd0:    next_state = S_PREV0;
            2'd1:    next_state = S_PREV1;
            2'd2:    next_state = S_PREV2;
            2'd3:    next_state = S_PREV3;
            default: next_state = S_IDLE;
        endcase
    end

    always @(*) begin
        case (state)
            S_PREV0: match = (din == 2'd0);
            S_PREV1: match = (din == 2'd1);
            S_PREV2: match = (din == 2'd2);
            S_PREV3: match = (din == 2'd3);
            default: match = 1'b0;
        endcase
    end

endmodule
