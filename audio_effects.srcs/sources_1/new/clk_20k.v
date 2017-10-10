`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2017 03:04:01 PM
// Design Name: 
// Module Name: clk_20k
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


module clk_20k(
    input CLK,
    output reg SLW_CLK
    );
    
    reg [31:0] COUNT = 0;
    
    always @ (posedge CLK) begin
    COUNT <= (COUNT == 2499)? 0: COUNT+1;
    SLW_CLK <= (COUNT == 0)? ~SLW_CLK : SLW_CLK;
    end
    
endmodule
