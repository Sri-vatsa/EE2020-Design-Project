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

module note_music(
    input NOTE_MUSIC_SWITCH,
    input CLK,
    output [11:0] NOTE_MUSIC_OUT,
    output [4:0] NOTE_MUSIC_LED
    );
    
    wire clk_3;
    
    clk_divider slw_clk(CLK, 16000000, clk_3);
    
    reg [3:0] note_music_switch = 0;
    
    always @(posedge clk_3) begin
        if(NOTE_MUSIC_SWITCH)
            note_music_switch <= note_music_switch+1;
        else
            note_music_switch <= 0;
    end 
    
    note_sound note_sound(note_music_switch, CLK, NOTE_MUSIC_OUT, NOTE_MUSIC_LED);
    
endmodule
