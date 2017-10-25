`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2017 21:13:11
// Design Name: 
// Module Name: melody_music
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


module melody_music(
    input MELODY_MUSIC_SWITCH,
    input CLK,
    output [11:0] NOTE_MUSIC_OUT,
    output [5:0] NOTE_MUSIC_LED
    );
    
    wire clk_4;
    
    clk_divider slw_clk(CLK, 12499999, clk_4);
    
    reg [7:0] count = 0;
    reg [3:0] note_music_switch = 0;
    
    always @(posedge clk_4) begin
        if(MELODY_MUSIC_SWITCH) begin
            count <= count+1;
            
            case(count) 
                0: begin note_music_switch <= 8; end // C4
                1: begin note_music_switch <= 0; end // Pause
                2: begin note_music_switch <= 8; end // C4
                3: begin note_music_switch <= 0; end // Pause
                4: begin note_music_switch <= 12; end // G4
                5: begin note_music_switch <= 0; end // Pause
                6: begin note_music_switch <= 12; end // G4
                7: begin note_music_switch <= 0; end // Pause
                8: begin note_music_switch <= 13; end // A4
                9: begin note_music_switch <= 0; end // Pause
                10: begin note_music_switch <= 13; end // A4
                11: begin note_music_switch <= 0; end // Pause
                12: begin note_music_switch <= 12; end // G4
                13: begin note_music_switch <= 0; end // Pause
                14: begin note_music_switch <= 0; end // Pause
                15: begin note_music_switch <= 11; end // F4
                16: begin note_music_switch <= 0; end // Pause
                17: begin note_music_switch <= 11; end // F4
                18: begin note_music_switch <= 0; end // Pause
                19: begin note_music_switch <= 10; end // E4
                20: begin note_music_switch <= 0; end // Pause
                21: begin note_music_switch <= 10; end // E4
                22: begin note_music_switch <= 0; end // Pause
                23: begin note_music_switch <= 9; end // D4
                24: begin note_music_switch <= 0; end // Pause
                25: begin note_music_switch <= 9; end // D4
                26: begin note_music_switch <= 0; end // Pause
                27: begin note_music_switch <= 8; end // C4
                28: begin note_music_switch <= 0; end // Pause
                29: begin note_music_switch <= 0; end // Pause
                30: begin note_music_switch <= 12; end // G4
                31: begin note_music_switch <= 0; end // Pause
                32: begin note_music_switch <= 12; end // G4
                33: begin note_music_switch <= 0; end // Pause
                34: begin note_music_switch <= 11; end // F4
                35: begin note_music_switch <= 0; end // Pause
                36: begin note_music_switch <= 11; end // F4
                37: begin note_music_switch <= 0; end // Pause
                38: begin note_music_switch <= 10; end // E4
                39: begin note_music_switch <= 0; end // Pause
                40: begin note_music_switch <= 10; end // E4
                41: begin note_music_switch <= 0; end // Pause
                42: begin note_music_switch <= 9; end // D4
                43: begin note_music_switch <= 0; end // Pause
                44: begin note_music_switch <= 0; end // Pause
                45: begin note_music_switch <= 12; end // G4
                46: begin note_music_switch <= 0; end // Pause
                47: begin note_music_switch <= 12; end // G4
                48: begin note_music_switch <= 0; end // Pause
                49: begin note_music_switch <= 11; end // F4
                50: begin note_music_switch <= 0; end // Pause
                51: begin note_music_switch <= 11; end // F4
                52: begin note_music_switch <= 0; end // Pause
                53: begin note_music_switch <= 10; end // E4
                54: begin note_music_switch <= 0; end // Pause
                55: begin note_music_switch <= 10; end // E4
                56: begin note_music_switch <= 0; end // Pause
                57: begin note_music_switch <= 9; end // D4
                58: begin note_music_switch <= 0; end // Pause
                59: begin note_music_switch <= 0; end // Pause
                60: begin note_music_switch <= 8; end // C4
                61: begin note_music_switch <= 0; end // Pause
                62: begin note_music_switch <= 8; end // C4
                63: begin note_music_switch <= 0; end // Pause
                64: begin note_music_switch <= 12; end // G4
                65: begin note_music_switch <= 0; end // Pause
                66: begin note_music_switch <= 12; end // G4
                67: begin note_music_switch <= 0; end // Pause
                68: begin note_music_switch <= 13; end // A4
                69: begin note_music_switch <= 0; end // Pause
                70: begin note_music_switch <= 13; end // A4
                71: begin note_music_switch <= 0; end // Pause
                72: begin note_music_switch <= 12; end // G4
                73: begin note_music_switch <= 0; end // Pause
                74: begin note_music_switch <= 0; end // Pause
                75: begin note_music_switch <= 11; end // F4
                76: begin note_music_switch <= 0; end // Pause
                77: begin note_music_switch <= 11; end // F4
                78: begin note_music_switch <= 0; end // Pause
                79: begin note_music_switch <= 10; end // E4
                80: begin note_music_switch <= 0; end // Pause
                81: begin note_music_switch <= 10; end // E4
                82: begin note_music_switch <= 0; end // Pause
                83: begin note_music_switch <= 9; end // D4
                84: begin note_music_switch <= 0; end // Pause
                85: begin note_music_switch <= 9; end // D4
                86: begin note_music_switch <= 0; end // Pause
                87: begin note_music_switch <= 8; end // C4 
                88: begin note_music_switch <= 0; end // Pause
                89: begin note_music_switch <= 0; end // Pause
                default: begin note_music_switch <= 0; end // Nothing
            endcase
        end
        
        else note_music_switch <= 0;
        
        if(count == 95) count <= 0;
    end
   
    note_sound note_sound(note_music_switch, CLK, NOTE_MUSIC_OUT, NOTE_MUSIC_LED);
    
endmodule
