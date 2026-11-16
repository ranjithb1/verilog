
module bidir_buffer (input wire ctrl, inout wire a, inout b);

    bufif1 b1 (b, a, ctrl);
    bufif0 b2 (a, b, ctrl);

endmodule

