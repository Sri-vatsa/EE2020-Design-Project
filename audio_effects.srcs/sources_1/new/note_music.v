`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 20:56:54
// Design Name: 
// Module Name: note_music
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

module note_music(input CLK, MUSICSWITCH, output reg [3:0] NOTEMUSICSWITCH);
    
    wire slw_clk;
    
    clk_divider slw_clk_freq(CLK, 16000000, slw_clk);
    
    always @(posedge slw_clk) begin
        NOTEMUSICSWITCH <= NOTEMUSICSWITCH+1;
    end 
      
endmodule
