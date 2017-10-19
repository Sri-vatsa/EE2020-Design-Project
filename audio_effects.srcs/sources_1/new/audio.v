`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2017 01:01:06
// Design Name: 
// Module Name: audio
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


module audio(input AUDIOSWITCH, input CLK20K, output [12:0] AUDIOOUT, output [5:0] HELLOSAMPLELED);
    
    reg [12:0] address = 0;
    
    always @ (posedge CLK20K) begin
        if(AUDIOSWITCH)
            address <= address + 1;
        else
            address <= 0;
    end
    
    hello_ROM hello_ROM(address, AUDIOOUT);
    assign HELLOSAMPLELED = (AUDIOSWITCH == 0) ? 0 : 6'b100000;
    
endmodule
