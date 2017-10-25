`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2017 01:01:06
// Design Name: 
// Module Name: audio
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


module audio(
    input AUDIO_SWITCH, 
    input CLK,
    output [12:0] AUDIO_OUT,
    output [6:0] AUDIO_LED
    );
    
    reg [12:0] address = 0;
    wire clk_18k;
    
    clk_divider slw_clk_18k(CLK, 2776, clk_18k);
    
    always @ (posedge clk_18k) begin
        if(AUDIO_SWITCH)
            address <= address + 1;
        else
            address <= 0;
    end
    
    hello_ROM hello_sample(address, AUDIO_OUT);
    assign AUDIO_LED = (AUDIO_SWITCH == 0) ? 0 : 7'b1000000;
    
endmodule
