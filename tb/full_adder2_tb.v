`timescale 1ns / 1ps

module full_adder2_tb;
reg a, b, cin;
wire sum, carry;
wire w1, w2, w3;

full_adder2 DUT(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry),.w1(w1),.w2(w2),.w3(w3));
integer i;
initial begin
    for (i = 0; i < 8; i = i + 1) begin
        {a,b,cin} = i;
        #20;
    end

    $finish;
end
endmodule