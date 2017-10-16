`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2017 04:42:34 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(input CLK, [19:0] TONE, output reg SLW_CLK);
    
     reg [31:0] COUNT = 0;
       
      always @ (posedge CLK) begin
        COUNT <= (COUNT == TONE)? 0: COUNT+1;
        SLW_CLK <= (COUNT == 0)? ~SLW_CLK : SLW_CLK;
      end
    
endmodule
