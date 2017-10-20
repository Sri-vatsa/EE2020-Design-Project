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
    input [3:0] NOTESWITCH,
    input CLK,
    output [11:0] NOTEOUT,
    output reg [3:0] NOTELED
    );
    
    reg [23:0] note_freq;
    
    always @* begin
        case(NOTESWITCH)
            1: begin note_freq = 381679; NOTELED = 4'b0001; end // C3, 131Hz
            2: begin note_freq = 340136; NOTELED = 4'b0010; end // D3, 147Hz
            3: begin note_freq = 303030; NOTELED = 4'b0011; end // E3, 165Hz
            4: begin note_freq = 285714; NOTELED = 4'b0100; end // F3, 175Hz
            5: begin note_freq = 255102; NOTELED = 4'b0101; end // G3, 196Hz
            6: begin note_freq = 227272; NOTELED = 4'b0110; end // A3, 220Hz
            7: begin note_freq = 202429; NOTELED = 4'b0111; end // B3, 247Hz
            8: begin note_freq = 190839; NOTELED = 4'b1000; end // C4, 262Hz
            9: begin note_freq = 170068; NOTELED = 4'b1001; end // D4, 294Hz
            10: begin note_freq = 151515; NOTELED = 4'b1010; end // E4, 330Hz
            11: begin note_freq = 143266; NOTELED = 4'b1011; end // F4, 349Hz
            12: begin note_freq = 127551; NOTELED = 4'b1100; end // G4, 392Hz
            13: begin note_freq = 113636; NOTELED = 4'b1101; end // A4, 440Hz
            14: begin note_freq = 101214; NOTELED = 4'b1110; end // B4, 494Hz
            15: begin note_freq = 95602; NOTELED = 4'b1111; end // C5, 523Hz
            default: begin note_freq = 1; NOTELED = 4'b0000; end // Nothing 
        endcase
    end
    
    clk_divider slw_clk_note(CLK, note_freq, NOTEOUT);
    
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
