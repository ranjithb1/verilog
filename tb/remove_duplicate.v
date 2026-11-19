`timescale 1ns / 1ps

module tb_remove_duplicates;
    // Input array: 1, 2, 2, 3, 3, 4, 5
    integer in_arr[0:6] = '{1, 2, 2, 3, 3, 4, 5};
    integer out_arr[0:6];
    
    integer in_len  = 7;
    integer out_len = 0;
    integer i, j;
    reg already_exists;

    initial begin
        $display("Input Array:");
        for (i = 0; i < in_len; i = i + 1) begin
            $write("%0d ", in_arr[i]);
        end
        $write("\n");

        // Filter duplicates
        for (i = 0; i < in_len; i = i + 1) begin
            already_exists = 1'b0;
            for (j = 0; j < out_len; j = j + 1) begin
                if (in_arr[i] == out_arr[j]) begin
                    already_exists = 1'b1;
                end
            end
            if (!already_exists) begin
                out_arr[out_len] = in_arr[i];
                out_len = out_len + 1;
            end
        end

        $display("Output Array (Duplicates Removed):");
        for (i = 0; i < out_len; i = i + 1) begin
            $write("%0d ", out_arr[i]);
        end
        $write("\n");

        $finish;
    end
endmodule
