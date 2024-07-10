`timescale 1ns / 1ps

module Pol_ser(
    input [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15,
           
    input [5:0] data_loop,
    input [7:0] i,
    input clk, reset,
    output reg [15:0] data_out
    );
    
    reg [15:0] pol_rom [255:0];
    reg [3:0] j;
    reg ready;
    
    always @(negedge clk)
    begin
      if(data_loop == 6'h31)
      begin
        j <= 4'h0;
        ready <= 1'b1;
      end
    end
    
    always @(negedge clk)
    begin
      if(ready == 1'b1 && j < 4'd15)
      begin
        pol_rom[0 + j] <= INTT_0; pol_rom[16 + j] <= INTT_1; pol_rom[32 + j] <= INTT_2; pol_rom[48 + j] <= INTT_3;
        pol_rom[64 + j] <= INTT_4; pol_rom[80 + j] <= INTT_5; pol_rom[96 + j] <= INTT_6; pol_rom[112 + j] <= INTT_7;
      
        pol_rom[128 + j] <= INTT_8; pol_rom[144 + j] <= INTT_9; pol_rom[160 + j] <= INTT_10; pol_rom[176 + j] <= INTT_11;
        pol_rom[192 + j] <= INTT_12; pol_rom[208 + j] <= INTT_13; pol_rom[224 + j] <= INTT_14; pol_rom[240 + j] <= INTT_15;
        j = j + 1;
      end 
      
      else if(ready == 1'b1 && j == 4'd15)
      begin
        pol_rom[0 + j] <= INTT_0; pol_rom[16 + j] <= INTT_1; pol_rom[32 + j] <= INTT_2; pol_rom[48 + j] <= INTT_3;
        pol_rom[64 + j] <= INTT_4; pol_rom[80 + j] <= INTT_5; pol_rom[96 + j] <= INTT_6; pol_rom[112 + j] <= INTT_7;
      
        pol_rom[128 + j] <= INTT_8; pol_rom[144 + j] <= INTT_9; pol_rom[160 + j] <= INTT_10; pol_rom[176 + j] <= INTT_11;
        pol_rom[192 + j] <= INTT_12; pol_rom[208 + j] <= INTT_13; pol_rom[224 + j] <= INTT_14; pol_rom[240 + j] <= INTT_15;
        j = 4'h0;
        ready = 1'b0;
      end
    end

    
    always @(posedge clk)
    begin
      data_out <= pol_rom[i];
    end
    
endmodule
