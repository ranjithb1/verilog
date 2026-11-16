`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 22:29:30
// Design Name: 
// Module Name: rca_4bit_tb
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

module rca_4bit_tb;

reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;
integer i,j,k;

rca_4bit uut(a,b,cin,sum,cout);

initial begin
    for(i=0;i<16;i=i+1) begin
        for(j=0;j<16;j=j+1) begin
            for(k=0;k<2;k=k+1) begin
                a=i;
                b=j;
                cin=k;
                #10;
            end
        end
    end

    $finish;
end

endmodule