`timescale 1ns / 1ps

module tb_array_palindrome;
    parameter N = 5;

    integer arr1[0:N-1] = '{1, 2, 3, 2, 1}; // Palindrome sequence
    integer arr2[0:N-1] = '{1, 2, 3, 4, 5}; // Non-palindrome sequence
    integer rev_arr[0:N-1];

    task check_and_reverse(input integer src[0:N-1]);
        integer i;
        reg is_palindrome;
        begin
            is_palindrome = 1'b1;

            // Compute reversed array
            for (i = 0; i < N; i = i + 1) begin
                rev_arr[i] = src[N - 1 - i];
            end

            // Compare original vs reversed
            for (i = 0; i < N; i = i + 1) begin
                if (src[i] != rev_arr[i]) begin
                    is_palindrome = 1'b0;
                end
            end

            // Print Original
            $write("Original Array: ");
            for (i = 0; i < N; i = i + 1) $write("%0d ", src[i]);
            $write("\n");

            // Print Reversed
            $write("Reversed Array: ");
            for (i = 0; i < N; i = i + 1) $write("%0d ", rev_arr[i]);
            $write("\n");

            if (is_palindrome)
                $display("Status: PALINDROME\n");
            else
                $display("Status: NOT A PALINDROME\n");
        end
    endtask

    initial begin
        $display("--- Test Case 1 ---");
        check_and_reverse(arr1);

        $display("--- Test Case 2 ---");
        check_and_reverse(arr2);

        $finish;
    end
endmodule
