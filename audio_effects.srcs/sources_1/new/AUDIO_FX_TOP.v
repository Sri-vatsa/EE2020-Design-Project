`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AY1718 Sem 1 EE2020 Project
// Project Name: Audio Effects
// Module Name: AUDIO_FX_TOP
// Team No.: 
// Student Names: Ong Wei Kang
// Matric No.: A0155920H
// Description: 
// 
// Work Distribution:
//////////////////////////////////////////////////////////////////////////////////

module AUDIO_FX_TOP(
    input CLK,                // 100MHz FPGA clock
    input [3:0] NOTESWITCH,   // Switches for tones
    input NOTEMUSICSWITCH,    // Switch for music
    input MELODYMUSICSWITCH,   // Switch for melody
    input AUDIOSWITCH,    // Switch for hello sample
    input  J_MIC3_PIN3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_PIN1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_PIN4,   // PmodMIC3 serial clock (generated by module SPI.v)
    output J_DA2_PIN1,    // PmodDA2 sampling clock (generated by module DA2RefComp.vhd)
    output J_DA2_PIN2,    // PmodDA2 Data_A, 12-bit speaker output (generated by module DA2RefComp.vhd)
    output J_DA2_PIN3,    // PmodDA2 Data_B, not used (generated by module DA2RefComp.vhd)
    output J_DA2_PIN4,    // PmodDA2 serial clock, 50MHz clock
    output [11:0] LED
    );

    //////////////////////////////////////////////////////////////////////////////////
    // Clock Divider Module: Generate necessary clocks from 100MHz FPGA CLK
    // Please create the clock divider module and instantiate it here.
    wire clk_20k;
    wire clk_50M;
    
    clk_divider slw_clk_20k(CLK, 2499, clk_20k);
    clk_divider slw_clk_50M(CLK, 0, clk_50M);
    
    //////////////////////////////////////////////////////////////////////////////////
    // SPI Module: Converting serial data into a 12-bit parallel register
    // Do not change the codes in this area
    wire [11:0] MIC_in;
     
    SPI u1 (CLK, clk_20k, J_MIC3_PIN3, J_MIC3_PIN1, J_MIC3_PIN4, MIC_in); 
    
    /////////////////////////////////////////////////////////////////////////////////////
    // Real-time Audio Effect Features  
    wire [11:0] note_out; // Note sound output
    wire [3:0] note_LED; // Note switch's LED status
    
    wire [11:0] note_music_out; // Note music current output
    wire [4:0] note_music_LED; // Note music's LED status
    
    wire [11:0] melody_music_out; // Melody music output
    wire [5:0] melody_music_LED; // Melody music's LED status
    
    wire [12:0] hello_sample_out; // Hello sample output
    wire [6:0] hello_sample_LED; // Hello sample LED status
    
    wire [11:0] MIC_out; // MIC output after delay
    
    note_sound note_sound (NOTESWITCH, CLK, note_out, note_LED);
    note_music note_music (NOTEMUSICSWITCH, CLK, note_music_out, note_music_LED);
    melody_music melody_music (MELODYMUSICSWITCH, CLK, melody_music_out, melody_music_LED);
    audio hello_sample (AUDIOSWITCH, CLK, hello_sample_out, hello_sample_LED);
    MIC_delay MIC_delay (MIC_in, CLK, MIC_out);
    
    wire [11:0] speaker_out; // Speaker sound output to be used in DA2RefComp 
    
    assign speaker_out = (NOTESWITCH == 0 && NOTEMUSICSWITCH == 0 && MELODYMUSICSWITCH == 0 && AUDIOSWITCH == 0) ? MIC_out 
                      : ((NOTESWITCH == 0 && NOTEMUSICSWITCH == 0 && MELODYMUSICSWITCH == 0) ? hello_sample_out 
                      : ((NOTESWITCH == 0 && NOTEMUSICSWITCH == 0) ?  melody_music_out
                      : ((NOTESWITCH == 0) ? note_music_out: note_out)));
    /////////////////////////////////////////////////////////////////////////////////////
    //DAC Module: Digital-to-Analog Conversion       
    DA2RefComp u2 (clk_50M, clk_20k, speaker_out, ,1'b0, J_DA2_PIN2, J_DA2_PIN3, J_DA2_PIN4, J_DA2_PIN1,);  
    
    //////////////////////////////////////////////////////////////////////////////////
    assign LED = (note_LED == 0 && note_music_LED == 0 && melody_music_LED == 0 && hello_sample_LED == 0) ? speaker_out 
              : ((note_LED == 0 && note_music_LED == 0 && melody_music_LED == 0) ? hello_sample_LED 
              : ((note_LED == 0 && note_music_LED == 0) ? (melody_music_LED+6'b100000)
              : ((note_LED == 0) ? (note_music_LED+5'b10000) : note_LED)));
              
endmodule
