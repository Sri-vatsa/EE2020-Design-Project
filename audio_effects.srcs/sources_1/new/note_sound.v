`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 20:15:04
// Design Name: 
// Module Name: note_sound
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

module note_sound(
    input [3:0] NOTE_SWITCH,
    input CLK,
    output [11:0] NOTE_OUT,
    output reg [3:0] NOTE_LED
    );
    
    reg [23:0] note_freq;
    
    always @* begin
        case(NOTE_SWITCH)
            1: begin note_freq = 757575; NOTE_LED = 4'b0001; end // C2, 66Hz
            2: begin note_freq = 675675; NOTE_LED = 4'b0010; end // D2, 74Hz
            3: begin note_freq = 641025; NOTE_LED = 4'b0011; end // E2, 78Hz
            4: begin note_freq = 602409; NOTE_LED = 4'b0100; end // F2, 83Hz
            5: begin note_freq = 510203; NOTE_LED = 4'b0101; end // G2, 98Hz
            6: begin note_freq = 454545; NOTE_LED = 4'b0110; end // A2, 110Hz
            7: begin note_freq = 403225; NOTE_LED = 4'b0111; end // B2, 124Hz        
            8: begin note_freq = 381679; NOTE_LED = 4'b1000; end // C3, 131Hz
            9: begin note_freq = 340136; NOTE_LED = 4'b1001; end // D3, 147Hz
            10: begin note_freq = 303030; NOTE_LED = 4'b1010; end // E3, 165Hz
            11: begin note_freq = 285714; NOTE_LED = 4'b1011; end // F3, 175Hz
            12: begin note_freq = 255102; NOTE_LED = 4'b1100; end // G3, 196Hz
            13: begin note_freq = 227272; NOTE_LED = 4'b1101; end // A3, 220Hz
            14: begin note_freq = 202429; NOTE_LED = 4'b1110; end // B3, 247Hz
            15: begin note_freq = 190839; NOTE_LED = 4'b1111; end // C4, 262Hz
            default: begin note_freq = 1; NOTE_LED = 4'b0000; end // Nothing 
        endcase
    end
    
    clk_divider slw_clk_note(CLK, note_freq, NOTE_OUT);
    
    /*
    clk_divider clk_divider_note(CLK, freq, NOTE);
    
    reg [18:0] count;
    always @(posedge CLK) 
        begin
            if(count == freq)
                count <= 0;
            else
                count <= count + 1;
        end
        
    always @(posedge CLK)
        begin
            if(count == freq)
                NOTE <= ~NOTE;
        end

    reg count_freq; 
    reg [18:0] count;
    
    always @(posedge CLK)
        begin
            count_freq = (count == freq);
 
            if(count_freq | (NOTESWITCH == 0))
                count <= 0;
            else
                count <= count + 1'b1;
 
            // Use the highest bit of the counter (MSB) to drive the speaker
            if(NOTESWITCH == 0)
                NOTE <= 0;
            else if(count_freq) NOTE <= NOTE ^ 1'b1;
        end
*/
endmodule
