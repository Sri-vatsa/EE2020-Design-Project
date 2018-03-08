`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2017 08:33:12 PM
// Design Name: 
// Module Name: Volume_Indicator_Chooser
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


module Volume_Indicator_Chooser(
    input [11:0] OUTPUT_SOUND,
    input [11:0] INPUT_SOUND,
    input VOL_CONTROL,
    input CLK,
    output [6:0] PEAK,
    output [11:0] LED
    );
    
    reg [11:0] VOLUME_MEASURED;
    
    //decide if vol indicator indicates output volume or input volume
    always @* begin
        if(VOL_CONTROL == 1)
            VOLUME_MEASURED = OUTPUT_SOUND;
        else
            VOLUME_MEASURED = INPUT_SOUND;
    end
    
    Volume_Indicator vol_indicator(VOLUME_MEASURED, CLK, PEAK, LED);
    /*
    assign LED[0] = (PEAK > 0)? 1:0;
    assign LED[1] = (PEAK > 10)? 1:0;
    assign LED[2] = (PEAK > 30)? 1:0;
    assign LED[3] = (PEAK > 40)? 1:0;
    assign LED[4] = (PEAK > 60)? 1:0;
    assign LED[5] = (PEAK > 66)? 1:0;
    assign LED[6] = (PEAK > 70)? 1:0;
    assign LED[7] = (PEAK > 74)? 1:0;
    assign LED[8] = (PEAK > 80)? 1:0;
    assign LED[9] = (PEAK > 85)? 1:0;
    assign LED[10] = (PEAK > 90)? 1:0;
    assign LED[11] = (PEAK > 94)? 1:0;
    */
    /*
    always @* begin
        if(VOL_CONTROL == 1) 
            PEAK_DISPLAY = PEAK - 60;
        else 
            PEAK_DISPLAY = PEAK;
    end
    /*
    always @* begin
            if(VOL_CONTROL == 1) begin
                LED[0] = (PEAK > 0)? 1:0;
                LED[1] = (PEAK > 10)? 1:0;
                LED[2] = (PEAK > 20)? 1:0;
                LED[3] = (PEAK > 30)? 1:0;
                LED[4] = (PEAK > 33)? 1:0;
                LED[5] = (PEAK > 36)? 1:0;
                LED[6] = (PEAK > 40)? 1:0;
                LED[7] = (PEAK > 45)? 1:0;
                LED[8] = (PEAK > 60)? 1:0;
                LED[9] = (PEAK > 75)? 1:0;
                LED[10] = (PEAK > 86)? 1:0;
                LED[11] = (PEAK > 92)? 1:0;
              end
             else begin
                PEAK = PEAK - 60; // correct for ambient noise
                LED[0] = (PEAK > 0)? 1:0;
                LED[1] = (PEAK > 2)? 1:0;
                LED[2] = (PEAK > 4)? 1:0;
                LED[3] = (PEAK > 6)? 1:0;
                LED[4] = (PEAK > 8)? 1:0;
                LED[5] = (PEAK > 10)? 1:0;
                LED[6] = (PEAK > 14)? 1:0;
                LED[7] = (PEAK > 18)? 1:0;
                LED[8] = (PEAK > 24)? 1:0;
                LED[9] = (PEAK > 28)? 1:0;
                LED[10] = (PEAK > 32)? 1:0;
                LED[11] = (PEAK > 36)? 1:0;
              end 
            end
    assign PEAK_DISPLAY = PEAK;
 */
endmodule
