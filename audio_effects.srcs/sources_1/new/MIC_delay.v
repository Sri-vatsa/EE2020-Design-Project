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
    input MIC_IN_DELAY_SWITCH,
    input CLK,
    input [11:0] MIC_IN,
    output [11:0] MIC_IN_DELAY,
    output [7:0] MIC_IN_DELAY_LED
    );
    
    wire clk_20k;
    reg [12:0] i;
    reg N;
    reg [11:0] memory [0:4999];
    
    clk_divider slw_clk_20k(CLK, 2499, clk_20k);
    
    // Storing mic data into memory array
    always @ (posedge clk_20k) begin
        if(MIC_IN_DELAY_SWITCH) begin
            memory[0] = MIC_IN;
            for (i = 0; i < 4999; i = i+1) begin
                memory[i+1] <= memory[i];
            end
        end
    end
    
    assign MIC_IN_DELAY = (MIC_IN_DELAY_SWITCH == 0) ? 0 : memory[4999];
    assign MIC_IN_DELAY_LED = (MIC_IN_DELAY_SWITCH == 0)? 0 : 8'b10000000;
    
endmodule
