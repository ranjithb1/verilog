
module tb_mux4to1_using_mux2;
    reg a0, a1, a2, a3;
    reg s1, s0;
    wire y;
    mux4to1_using_mux2 uut (.a0(a0), .a1(a1), .a2(a2), .a3(a3), .s1(s1), .s0(s0), .y(y));
    integer i, j;

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            {a3,a2,a1,a0} = i;
            for (j = 0; j < 4; j = j + 1) begin
                {s1,s0} = j; #10;
            end
        end
        $finish;
    end
endmodule