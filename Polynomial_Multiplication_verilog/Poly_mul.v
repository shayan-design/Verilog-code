`timescale 1ns / 1ps

module Poly_mul(

    input [15:0] input_poly1,
    input [15:0] input_poly2,
	
    input start,   
    input clk, rst,
    output [5:0] data_loop,
    
    output [15:0] NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
           NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15,
      
    output [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15
 
    );
    
    reg [15:0] modulo_ring = 16'h1e01;
    
    wire [15:0]  NTT_20, NTT_21, NTT_22, NTT_23, NTT_24, NTT_25, NTT_26, NTT_27, 
                 NTT_28, NTT_29, NTT_210, NTT_211, NTT_212, NTT_213, NTT_214, NTT_215;
           
    wire [31:0] prod_0, prod_1, prod_2, prod_3, prod_4, prod_5, prod_6, prod_7,
                prod_8, prod_9, prod_10, prod_11, prod_12, prod_13, prod_14, prod_15;
                
    reg [15:0]  mod_result_0, mod_result_1, mod_result_2, mod_result_3,
                mod_result_4, mod_result_5, mod_result_6, mod_result_7,
                mod_result_8, mod_result_9, mod_result_10, mod_result_11,
                mod_result_12, mod_result_13, mod_result_14, mod_result_15;            
    
    NTT_Transform inst0 (input_poly1, start, clk, rst, data_loop,
                       
           NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
           NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15
    );
    
    NTT_Transform inst1 (input_poly2, start, clk, rst, data_loop,
                       
           NTT_20, NTT_21, NTT_22, NTT_23, NTT_24, NTT_25, NTT_26, NTT_27, 
           NTT_28, NTT_29, NTT_210, NTT_211, NTT_212, NTT_213, NTT_214, NTT_215
    );
    
                
    multiplier_32_bit m0 (NTT_0 , NTT_20, prod_0);
    multiplier_32_bit m1 (NTT_1 , NTT_21, prod_1);
    multiplier_32_bit m2 (NTT_2 , NTT_22, prod_2);
    multiplier_32_bit m3 (NTT_3 , NTT_23, prod_3);
    
    multiplier_32_bit m4 (NTT_4 , NTT_24, prod_4);
    multiplier_32_bit m5 (NTT_5 , NTT_25, prod_5);
    multiplier_32_bit m6 (NTT_6 , NTT_26, prod_6);
    multiplier_32_bit m7 (NTT_7 , NTT_27, prod_7);
    
    multiplier_32_bit m8 (NTT_8 , NTT_28, prod_8);
    multiplier_32_bit m9 (NTT_9 , NTT_29, prod_9);
    multiplier_32_bit m10 (NTT_10 , NTT_210, prod_10);
    multiplier_32_bit m11 (NTT_11 , NTT_211, prod_11);
    
    multiplier_32_bit m12 (NTT_12 , NTT_212, prod_12);
    multiplier_32_bit m13 (NTT_13 , NTT_213, prod_13);
    multiplier_32_bit m14 (NTT_14 , NTT_214, prod_14);
    multiplier_32_bit m15 (NTT_15 , NTT_215, prod_15);
    
    always @ (prod_0 or prod_1)
    begin
      mod_result_0 <= prod_0 % modulo_ring;
      mod_result_1 <= prod_1 % modulo_ring;
      mod_result_2 <= prod_2 % modulo_ring;
      mod_result_3 <= prod_3 % modulo_ring;
      
      mod_result_4 <= prod_4 % modulo_ring;
      mod_result_5 <= prod_5 % modulo_ring;
      mod_result_6 <= prod_6 % modulo_ring;
      mod_result_7 <= prod_7 % modulo_ring;
      
      mod_result_8 <= prod_8 % modulo_ring;
      mod_result_9 <= prod_9 % modulo_ring;
      mod_result_10 <= prod_10 % modulo_ring;
      mod_result_11 <= prod_11 % modulo_ring;
      
      mod_result_12 <= prod_12 % modulo_ring;
      mod_result_13 <= prod_13 % modulo_ring;
      mod_result_14 <= prod_14 % modulo_ring;
      mod_result_15 <= prod_15 % modulo_ring;
      
    end
    
    INTT_Transform inst2 (

            mod_result_0, mod_result_8, mod_result_4, mod_result_12,
            mod_result_2, mod_result_10, mod_result_6, mod_result_14,
            mod_result_1, mod_result_9, mod_result_5, mod_result_13,
            mod_result_3, mod_result_11, mod_result_7, mod_result_15,
	
            start, clk, rst, data_loop,
    
           INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15
    );

endmodule
