module mux2to1 (
    input a0, a1, s,
    output y
);

    assign y = s ? a1 : a0;

endmodule


module mux4to1_using_mux2 (
    input a0, a1, a2, a3, s1, s0,
    output y
);

    wire w1, w2;

    mux2to1 mux1 (.a0(a0), .a1(a1), .s(s0), .y(w1));
    mux2to1 mux2 (.a0(a2), .a1(a3), .s(s0), .y(w2));
    mux2to1 mux3 (.a0(w1), .a1(w2), .s(s1), .y(y));

endmodule