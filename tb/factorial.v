`timescale 1ns / 1ps

module tb_factorial;
    integer num;
    integer result_iter;
    integer result_rec;

    // Iterative calculation
    function automatic integer fact_iter(input integer n);
        integer i;
        begin
            fact_iter = 1;
            for (i = 1; i <= n; i = i + 1) begin
                fact_iter = fact_iter * i;
            end
        end
    endfunction

    // Recursive calculation
    function automatic integer fact_rec(input integer n);
        begin
            if (n <= 1)
                fact_rec = 1;
            else
                fact_rec = n * fact_rec(n - 1);
        end
    endfunction

    initial begin
        for (num = 0; num <= 7; num = num + 1) begin
            result_iter = fact_iter(num);
            result_rec  = fact_rec(num);
            $display("Number: %0d | Iterative Fact: %0d | Recursive Fact: %0d", 
                      num, result_iter, result_rec);
        end
        $finish;
    end
endmodule
