`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2026 10:44:17
// Design Name: 
// Module Name: bidirectional_buffer_tb
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

module bidir_tb();

    reg ctrl;
    wire a, b;
    integer i;
    reg temp1, temp2; 

    bidir_buffer dut (.ctrl(ctrl),.a(a),.b(b));

    initial begin 
      
        for (i = 0; i < 8; i = i + 1) begin 
            {temp1, temp2, ctrl} = i;
            #10;
        end
        #10;
        $finish;
    end

    assign a = ctrl  ? temp1 : 1'bz;
    assign b = ~ctrl ? temp2 : 1'bz;
	
endmodule
