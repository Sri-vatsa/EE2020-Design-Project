`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2017 17:10:46
// Design Name: 
// Module Name: MIC_delay
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


module MIC_delay(
    input [11:0] MICIN,
    input CLK,
    output [11:0] MICOUT
    );
    
    wire clk_20k;
    reg [12:0] i;
    reg [11:0] memory [0:5000];
    
    clk_divider slw_clk_20k(CLK, 2499, clk_20k);
    
    // Storing mic data into memory array
    always @ (posedge clk_20k) begin
        memory[0] = MICIN;
        for (i = 0; i < 5000; i = i+1) begin
            memory[i+1] <= memory[i];
        end
    end
    
    assign MICOUT = memory[5000];
    
endmodule
