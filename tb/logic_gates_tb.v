`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 10:39:45
// Design Name: 
// Module Name: logic_gates_tb
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

module gates_tb;
    reg a, b;
    wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;

    gates dut(a, b, y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor);

    initial begin
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 
   $finish;
    end
endmodule