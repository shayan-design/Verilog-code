`timescale 1ns / 1ps

// This unit can perform operations below:
// -- CT-based butterfly
// -- Modular add/sub
// -- Modular mul

module BU(
    input [15:0] a, b, shi, 
    input clk, rst,
    output reg [15:0] B1,
    output reg [15:0] B2
    );

    wire [31:0] prod;
    wire [15:0] prod_mod;
    
    reg [15:0] sum_1;
    reg [15:0] sub_1;
    
    multiplier_32_bit m0 (b , shi, prod); 
    
    //modulus ring operation
    reg [15:0] mod_ring = 16'h1e01;
    assign prod_mod = prod % mod_ring;
    
    
    always@ (a or prod_mod)
    begin
       sum_1 = (a + prod_mod) % mod_ring;
    end
    
    always@ (a or prod_mod)
    begin

      if(a > prod_mod)
        sub_1 = ((a - prod_mod) % mod_ring);
      else
        sub_1 = mod_ring - ((prod_mod - a) % mod_ring);
    end 

        
    always@ (posedge clk or posedge rst)
    begin
      if(rst)
        begin
          B1 <= 0;
          B2 <= 0;
        end
      else
        begin
          B1 <= sum_1;
          B2 <= sub_1;
        end
    end
    
endmodule
