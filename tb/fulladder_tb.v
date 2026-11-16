`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2026 10:35:16
// Design Name: 
// Module Name: full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fulladder_tb;
reg a , b, cin ; 
wire sum, cout;

fulladder DUT(.a(a), .b(b), .cin(cin),.sum(sum) ,.cout(cout));

initial begin
    a = 0; b = 0;cin=0; #10;
   a = 0; b = 0;cin=1;#10;
    a = 0; b = 1;cin=0;#10;
    a = 0; b = 1;cin=1; #10;
    a = 1; b = 0;cin=0; #10;
    a = 1; b = 0;cin=1; #10;
    a = 1; b = 1;cin=0; #10;
    a = 1; b = 1;cin=1; #10;
$finish;
end
endmodule

