`timescale 1ns / 1ps 

module half_adder(input a,b, output sum,carry);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule 

module full_adder2(input a,b,cin, output sum,carry);
    wire w1, w2, w3; 
    
    half_adder HA1(.a(a), .b(b), .sum(w1), .carry(w2)); 
    half_adder HA2(.a(w1), .b(cin), .sum(sum), .carry(w3)); 
    
    or OR1(carry, w2, w3); 
endmodule



