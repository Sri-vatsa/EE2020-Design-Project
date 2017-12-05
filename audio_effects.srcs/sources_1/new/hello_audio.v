`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 10:08:09 PM
// Design Name: 
// Module Name: hello_audio
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


module hello_audio(
    input [1:0] HELLO_SWITCH, 
    input CLK,
    output [12:0] AUDIOOUT,
    output [7:0] HELLO_SAMPLE_LED
    );
    
    reg [12:0] address = 0;
    wire clk_18k;
    wire clk_16k;
    wire clk_14k;
    reg slw_clk;
    
    clk_divider clk18k(CLK, 2777, clk_18k); //18k clock
    clk_divider clk16k(CLK, 3124, clk_16k); // 16k clock
    clk_divider clk14k(CLK, 3570, clk_14k); // 14k clock
    
    always @* begin
        if(HELLO_SWITCH == 3)
            slw_clk = clk_18k;
        else if (HELLO_SWITCH == 2)
            slw_clk = clk_14k;
        else
            slw_clk = clk_16k;
    end
   
    always @ (posedge slw_clk) begin
        if(HELLO_SWITCH >= 1)
            address <= address + 1;
        else
            address <= 0;
    end
    
    hello_ROM hello_sample(address, AUDIOOUT);
    assign HELLO_SAMPLE_LED = (HELLO_SWITCH == 1) ? 8'b01000000 :
                              ((HELLO_SWITCH == 2) ? 8'b10000000 :
                              ((HELLO_SWITCH == 3) ? 8'b11000000 :
                              0));
    
endmodule
