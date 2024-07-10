`timescale 1ns / 1ps

module Pol_add_sub (
    input [15:0] pol_1, pol_2,     // pol_1 is U.S & pol_2 is V
    input [2:0] control,
    input clk,
    input enable,
    output [15:0] out
);
  reg [15:0] modulus = 16'h1e01;
  
  wire [15:0] out_1; 
  wire [15:0] out_2; 
  wire [15:0] out_3;
  wire [15:0] out_4;
  reg  sel_1;
  wire sel_2;

  assign sel_2 = control[2] & control[1] & control[0];
  
  always @(pol_1 or pol_2)
  begin
    if(pol_2 >= pol_1)
    begin
      sel_1 = 1'b0;
    end
    else
    begin
      sel_1 = 1'b1;
    end
  end
  
  assign out_1 = (pol_1 + pol_2) % modulus;
  assign out_2 = (pol_2 - pol_1) % modulus;
  assign out_3 = modulus - ((pol_1 - pol_2) % modulus);
  
  mux_2_16 inst21 (out_2, out_3, sel_1, out_4);
  mux_2_16 inst22 (out_1, out_4, sel_2, out);
  

/*
  always @ (posedge clk)
  begin
    if((control == 3'b100 | control == 3'b101 | control == 3'b110) && enable == 1'b1)
    begin
      out = (pol_1 + pol_2) % modulus;
    end
    
    else if(control == 3'b111 && enable == 1'b1)
    begin
      if(pol_2 >= pol_1)
      begin
        out = (pol_2 - pol_1) % modulus;
      end
      
      else if(pol_2 < pol_1)
      begin
        out = modulus - ((pol_1 - pol_2) % modulus);
      end
    end
  end
  */
  
endmodule