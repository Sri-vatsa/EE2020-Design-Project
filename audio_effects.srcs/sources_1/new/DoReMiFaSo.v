`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2017 04:11:38 PM
// Design Name: 
// Module Name: DoReMiFaSo
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


module DoReMiFaSo(input [2:0] SWITCH, input CLK, output reg [11:0] sound);
    /*
    Do: 113635
    Re: 101214
    Mi: 90252
    Fa: 85178
    So: 75872
    */
    
    reg [19:0] tone = 19'b0;
    always @* begin
        case(SWITCH)
            1: begin tone = 113635; end // Do note
            2: begin tone = 101214; end // Re note
            3: begin tone = 90252; end // Mi note
            4: begin tone = 85178; end // Fa note
            5: begin tone = 75872; end // So note
        endcase
    end
    
    wire slw_clk;
    
    clk_divider clk(CLK, tone, slw_clk);
    
    always@(posedge slw_clk) begin
        if(tone != 0)
            sound <= sound+1;
        else
            sound = 0;
    end
endmodule
