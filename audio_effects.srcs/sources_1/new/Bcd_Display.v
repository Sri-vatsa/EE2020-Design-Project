`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 02:15:58 AM
// Design Name: 
// Module Name: Bcd_Display
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


module Bcd_Display(
    input CLK,
    input [6:0] DISPLAY,
    output reg [3:0] DIGITS,
    output reg [6:0] SEGMENTS
    ); 
    wire [6:0] VOL_DISPLAY = DISPLAY ; // account for ambient noise
    reg [3:0] BCD_LED;
    reg [19:0] REFRESH_RATE; // the first 19-bit for creating refresh rate
    // the other 2-bit for creating 4 LED-activating signals
    wire [1:0] LED_activating_counter; 
                                 
    always @(posedge CLK)
    begin         
        REFRESH_RATE <= REFRESH_RATE + 1; 
    end 
                          
    assign LED_activating_counter = REFRESH_RATE[19:18];
                          
    // decoder to generate DIGITS 
    always @ (CLK) begin
    
        case(LED_activating_counter)
            2'b00: begin
                   DIGITS = 4'b0111; 
                   // activate LED1 and Deactivate LED2, LED3, LED4
                   BCD_LED = VOL_DISPLAY/1000;      
                   end
                   
            2'b01: begin
                   DIGITS = 4'b1011; 
                   // activate LED2 and Deactivate LED1, LED3, LED4
                   BCD_LED = (VOL_DISPLAY % 1000)/100;              
                   end
                              
            2'b10: begin
                   DIGITS = 4'b1101; 
                   // activate LED3 and Deactivate LED2, LED1, LED4
                   BCD_LED = ((VOL_DISPLAY % 1000)%100)/10;
                   end
                   
            2'b11: begin
                   DIGITS = 4'b1110; 
                   // activate LED4 and Deactivate LED2, LED3, LED1
                   BCD_LED = ((VOL_DISPLAY % 1000)%100)%10; 
                   end
        endcase
    end
    
    // DIGITS patterns of the 7-segment LED display 
    always @ (CLK) begin
        case(BCD_LED)
            4'b0000: SEGMENTS = 7'b0000001; // "0"     
            4'b0001: SEGMENTS = 7'b1001111; // "1" 
            4'b0010: SEGMENTS = 7'b0010010; // "2" 
            4'b0011: SEGMENTS = 7'b0000110; // "3" 
            4'b0100: SEGMENTS = 7'b1001100; // "4" 
            4'b0101: SEGMENTS = 7'b0100100; // "5" 
            4'b0110: SEGMENTS = 7'b0100000; // "6" 
            4'b0111: SEGMENTS = 7'b0001111; // "7" 
            4'b1000: SEGMENTS = 7'b0000000; // "8"     
            4'b1001: SEGMENTS = 7'b0000100; // "9" 
            default: SEGMENTS = 7'b0000001; // "0"
        endcase
    end
    
endmodule
