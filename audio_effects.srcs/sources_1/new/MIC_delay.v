`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2017 17:10:46
// Design Name: 
// Module Name: MIC_delay
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


module MIC_delay(
    input [3:0] MIC_IN_DELAY_SWITCH,
    input CLK,
    input [11:0] MIC_IN,
    output [11:0] MIC_IN_DELAY,
    output [11:0] MIC_IN_DELAY_LED
);

    wire clk_16k; // 0.25 second delay
    wire clk_8k; // 0.5 second delay
    wire clk_4k; // 1 second delay
    wire clk_2_7k; // 1.5 seconds delay
    reg slw_clk; // Assigned frequency

    reg [12:0] i;
    reg [11:0] memory [0:3999];
    
    clk_divider slw_clk_16k(CLK, 3124, clk_16k);
    clk_divider slk_clk_8k(CLK, 6249, clk_8k);
    clk_divider slk_clk_4k(CLK, 12499, clk_4k);
    clk_divider slw_clk_2_7k(CLK, 18518, clk_2_7k);
    
    // Assign frequency based on MIC_IN_DELAY_SWITCH
    always @* begin
        case(MIC_IN_DELAY_SWITCH)
            1: begin slw_clk = clk_16k; end
            2: begin slw_clk = clk_8k; end
            4: begin slw_clk = clk_4k; end
            8: begin slw_clk = clk_2_7k; end
            default: begin slw_clk = 0; end
        endcase
    end
    
    // Storing mic data into memory array
    always @ (posedge slw_clk) begin
        if(MIC_IN_DELAY_SWITCH == 1 || MIC_IN_DELAY_SWITCH == 2
        || MIC_IN_DELAY_SWITCH == 4 || MIC_IN_DELAY_SWITCH == 8) begin
            memory[0] = MIC_IN;
            for (i = 0; i < 3999; i = i+1) begin
                memory[i+1] <= memory[i];
            end
        end
    end
    
    assign MIC_IN_DELAY = (MIC_IN_DELAY_SWITCH == 0) ? 0 : memory[3999];
    assign MIC_IN_DELAY_LED = (MIC_IN_DELAY_SWITCH == 1) ? 12'b000100000000 
                           : ((MIC_IN_DELAY_SWITCH == 2) ? 12'b001000000000
                           : ((MIC_IN_DELAY_SWITCH == 4) ? 12'b010000000000
                           : ((MIC_IN_DELAY_SWITCH == 8) ? 12'b100000000000 : 0)));

endmodule
