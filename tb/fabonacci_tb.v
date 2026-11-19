`timescale 1ns / 1ps

module tb_fibonacci;
    parameter TERMS = 10;
    integer fib_series[0:TERMS-1];
    integer i;

    // Recursive calculation function
    function automatic integer fib_rec(input integer n);
        begin
            if (n <= 0)
                fib_rec = 0;
            else if (n == 1)
                fib_rec = 1;
            else
                fib_rec = fib_rec(n - 1) + fib_rec(n - 2);
        end
    endfunction

    // Iterative array generation task
    task generate_fib_iterative(input integer count);
        integer idx;
        begin
            if (count > 0) fib_series[0] = 0;
            if (count > 1) fib_series[1] = 1;

            for (idx = 2; idx < count; idx = idx + 1) begin
                fib_series[idx] = fib_series[idx - 1] + fib_series[idx - 2];
            end
        end
    endtask

    initial begin
        $display("=== Iterative Fibonacci Series (First %0d terms) ===", TERMS);
        generate_fib_iterative(TERMS);
        for (i = 0; i < TERMS; i = i + 1) begin
            $display("Index %0d : %0d", i, fib_series[i]);
        end

        $display("\n=== Recursive Verification ===");
        for (i = 0; i < TERMS; i = i + 1) begin
            $display("fib_rec(%0d) = %0d", i, fib_rec(i));
        end

        $finish;
    end
endmodule
