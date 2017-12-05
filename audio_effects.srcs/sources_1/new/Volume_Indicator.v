`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 02:15:26 AM
// Design Name: 
// Module Name: Volume_Indicator
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
module Volume_Indicator(
   input [11:0] MIC_IN,
   input CLK,
   output reg [6:0] PEAK_DISPLAY,
   output [11:0] LED
   );
   
   wire slw_clock;
   reg [11:0] sampleCount = 0;
   reg [11:0] PEAK;
                         
   clk_divider slw_clk_200(CLK, 249999, slw_clock);
              
   always @ (posedge slw_clock) begin    
    if(sampleCount == 200) begin
        PEAK = 0;           
        sampleCount = 0;
        PEAK_DISPLAY = 0;
    end
    else begin
     PEAK <= (MIC_IN > PEAK)? MIC_IN : PEAK;
     sampleCount <= sampleCount + 1;
     
     if( PEAK > 500) begin
        PEAK_DISPLAY = (PEAK >> 5); //converts to scale of ~100
     end 
     else 
        PEAK_DISPLAY = PEAK;
     end
     
     if (PEAK_DISPLAY > 100) PEAK_DISPLAY = 100; //caps the maximum value at 100 units
    end
    
    assign LED[0] = (PEAK_DISPLAY > 30)? 1:0;
    assign LED[1] = (PEAK_DISPLAY > 63)? 1:0;
    assign LED[2] = (PEAK_DISPLAY > 66)? 1:0;
    assign LED[3] = (PEAK_DISPLAY > 68)? 1:0;
    assign LED[4] = (PEAK_DISPLAY > 70)? 1:0;
    assign LED[5] = (PEAK_DISPLAY > 72)? 1:0;
    assign LED[6] = (PEAK_DISPLAY > 76)? 1:0;
    assign LED[7] = (PEAK_DISPLAY > 80)? 1:0;
    assign LED[8] = (PEAK_DISPLAY > 83)? 1:0;
    assign LED[9] = (PEAK_DISPLAY > 87)? 1:0;
    assign LED[10] = (PEAK_DISPLAY > 90)? 1:0;
    assign LED[11] = (PEAK_DISPLAY > 94)? 1:0;
    
    
    
endmodule
