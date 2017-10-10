`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2017 03:24:23 PM
// Design Name: 
// Module Name: clk_50M
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


module clk_50M(
    input CLK,
    output reg SLW_CLK
    );
     
    reg [31:0] COUNT = 0;
    
    always @ (posedge CLK) begin
    COUNT <= (COUNT == 0)? 0: COUNT+1;
    SLW_CLK <= (COUNT == 0)? ~SLW_CLK : SLW_CLK;
    end
    
    
endmodule
