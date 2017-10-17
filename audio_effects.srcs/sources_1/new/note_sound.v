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
    input wire [3:0] NOTESWITCH,
    output reg [23:0] NOTEFREQ,
    output reg [3:0] NOTELED
);

    always @*
        begin
            case(NOTESWITCH)
                1: begin NOTEFREQ = 381679; NOTELED = 4'b0001; end // C1
                2: begin NOTEFREQ = 340136; NOTELED = 4'b0010; end // D1
                3: begin NOTEFREQ = 303030; NOTELED = 4'b0011; end // E1
                4: begin NOTEFREQ = 285714; NOTELED = 4'b0100; end // F1
                5: begin NOTEFREQ = 255102; NOTELED = 4'b0101; end // G1
                6: begin NOTEFREQ = 227272; NOTELED = 4'b0110; end // A1
                7: begin NOTEFREQ = 202429; NOTELED = 4'b0111; end // B1
                8: begin NOTEFREQ = 190839; NOTELED = 4'b1000; end // C2
                9: begin NOTEFREQ = 170068; NOTELED = 4'b1001; end // D2
                10: begin NOTEFREQ = 151515; NOTELED = 4'b1010; end // E2
                11: begin NOTEFREQ = 143266; NOTELED = 4'b1011; end // F2
                12: begin NOTEFREQ = 127551; NOTELED = 4'b1100; end // G2
                13: begin NOTEFREQ = 113636; NOTELED = 4'b1101; end // A2
                14: begin NOTEFREQ = 101214; NOTELED = 4'b1110; end // B2
                15: begin NOTEFREQ = 95602; NOTELED = 4'b1111; end // C3
                default: begin NOTEFREQ = 1; NOTELED = 4'b0000; end // Nothing 
            endcase
        end
    
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
