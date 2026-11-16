

//write code for 32 bit ripple carry adder using generate blcok 

module fa(input a, b, cin,output sum, cout);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module rca (input [31:0]a,b,input cin,output [31:0] sum,output cout);
wire [32:0]carry;

assign carry[0]=cin;
assign cout=carry[32];

genvar i;

generate
for (i=0;i<32;i=i+1) 
begin:RCA
fa FA (.a(a[i]),.b(b[i]),.cin(carry[i]),.sum(sum[i]),.cout(carry[i+1]));

end
endgenerate
endmodule
