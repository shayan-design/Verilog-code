`timescale 1ns / 1ps

// This unit can perform operations below:
// -- GS-based butterfly for handling 16bit width data 
//    and performing 16 element based INTT transform


module IBU_16(

    input [15:0] 
        a_0, a_1, a_2, a_3,      //input data for handling INTT based transform
        a_4, a_5, a_6, a_7,
        a_8, a_9, a_10, a_11,
        a_12, a_13, a_14, a_15,
        
    input [15:0] inv_shi_1,inv_shi_2, inv_shi_3, inv_shi_4,
                 inv_shi_5, inv_shi_6, inv_shi_7, inv_shi_8,
                 inv_shi_9, inv_shi_10, inv_shi_11, inv_shi_12,
                 inv_shi_13, inv_shi_14, inv_shi_15,           // twiddle factor
    
    input clk, rst,             //clk for synchronising data 
    output reg [15:0]
        gs_0, gs_1, gs_2, gs_3,
        gs_4, gs_5, gs_6, gs_7,
        gs_8, gs_9, gs_10, gs_11,
        gs_12, gs_13, gs_14, gs_15
    );
    
    reg [15:0] inv_n;
    initial
    begin
      inv_n = 16'd7201;
    end
    
    reg [15:0] mod_ring = 16'h1e01;
    
    //product for modulo ring
    wire [31:0] prod_0, prod_1, prod_2, prod_3, 
                prod_4, prod_5, prod_6, prod_7, 
                prod_8, prod_9, prod_10, prod_11, 
                prod_12, prod_13, prod_14, prod_15;
    
    // defining wire for stage 1 output
    wire [15:0] st1_0, st1_1, st1_2, st1_3,
                st1_4, st1_5, st1_6, st1_7,
                st1_8, st1_9, st1_10, st1_11,
                st1_12, st1_13, st1_14, st1_15;
                
    // defining wire for stage 2 output
    wire [15:0] st2_0, st2_1, st2_2, st2_3,
                st2_4, st2_5, st2_6, st2_7,
                st2_8, st2_9, st2_10, st2_11,
                st2_12, st2_13, st2_14, st2_15;
                
    // defining wire for stage 3 output
    wire [15:0] st3_0, st3_1, st3_2, st3_3,
                st3_4, st3_5, st3_6, st3_7,
                st3_8, st3_9, st3_10, st3_11,
                st3_12, st3_13, st3_14, st3_15;
                
    // defining wire for stage 3 output

    wire [15:0] st4_0, st4_1, st4_2, st4_3,
                st4_4, st4_5, st4_6, st4_7,
                st4_8, st4_9, st4_10, st4_11,
                st4_12, st4_13, st4_14, st4_15;

                
    //operation for stage 1
    IBU stg_1_0 (a_0, a_1, inv_shi_1, clk, rst, st1_0, st1_1);
    IBU stg_1_1 (a_2, a_3, inv_shi_2, clk, rst, st1_2, st1_3);
    IBU stg_1_2 (a_4, a_5, inv_shi_3, clk, rst, st1_4, st1_5);
    IBU stg_1_3 (a_6, a_7, inv_shi_4, clk, rst, st1_6, st1_7);
    IBU stg_1_4 (a_8, a_9, inv_shi_5, clk, rst, st1_8, st1_9);
    IBU stg_1_5 (a_10, a_11, inv_shi_6, clk, rst, st1_10, st1_11);
    IBU stg_1_6 (a_12, a_13, inv_shi_7, clk, rst, st1_12, st1_13);
    IBU stg_1_7 (a_14, a_15, inv_shi_8, clk, rst, st1_14, st1_15);
    
    //operation for stage 2
    IBU stg_2_0 (st1_0, st1_2, inv_shi_9, clk, rst, st2_0, st2_1);
    IBU stg_2_1 (st1_1, st1_3, inv_shi_9, clk, rst, st2_2, st2_3);
    
    IBU stg_2_2 (st1_4, st1_6, inv_shi_10, clk, rst, st2_4, st2_5);
    IBU stg_2_3 (st1_5, st1_7, inv_shi_10, clk, rst, st2_6, st2_7);
    
    IBU stg_2_4 (st1_8, st1_10, inv_shi_11, clk, rst, st2_8, st2_9);
    IBU stg_2_5 (st1_9, st1_11, inv_shi_11, clk, rst, st2_10, st2_11);
    
    IBU stg_2_6 (st1_12, st1_14, inv_shi_12, clk, rst, st2_12, st2_13);
    IBU stg_2_7 (st1_13, st1_15, inv_shi_12, clk, rst, st2_14, st2_15);

    //operation for stage 3
    IBU stg_3_0 (st2_0, st2_4, inv_shi_13, clk, rst, st3_0, st3_1);
    IBU stg_3_1 (st2_8, st2_12, inv_shi_14, clk, rst, st3_2, st3_3);
    
    IBU stg_3_2 (st2_1, st2_5, inv_shi_13, clk, rst, st3_4, st3_5);
    IBU stg_3_3 (st2_9, st2_13, inv_shi_14, clk, rst, st3_6, st3_7);
    
    IBU stg_3_4 (st2_2, st2_6, inv_shi_13, clk, rst, st3_8, st3_9);
    IBU stg_3_5 (st2_10, st2_14, inv_shi_14, clk, rst, st3_10, st3_11);
    
    IBU stg_3_6 (st2_3, st2_7, inv_shi_13, clk, rst, st3_12, st3_13);
    IBU stg_3_7 (st2_11, st2_15, inv_shi_14, clk, rst, st3_14, st3_15);
    
    //operation for stage 4
    IBU stg_4_0 (st3_0, st3_2, inv_shi_15, clk, rst, st4_0, st4_8);            // goes into 0 , 1
    IBU stg_4_1 (st3_1, st3_3, inv_shi_15, clk, rst, st4_4, st4_12);            // goes into 2 , 3
    
    IBU stg_4_2 (st3_4, st3_6, inv_shi_15, clk, rst, st4_2, st4_10);           // goes into 4 , 5
    IBU stg_4_3 (st3_5, st3_7, inv_shi_15, clk, rst, st4_6, st4_14);           // goes into 6 , 7
    
    IBU stg_4_4 (st3_8, st3_10, inv_shi_15, clk, rst, st4_1, st4_9);           // goes into 8 , 9
    IBU stg_4_5 (st3_9, st3_11, inv_shi_15, clk, rst, st4_5, st4_13);          // goes into 10 , 11
    
    IBU stg_4_6 (st3_12, st3_14, inv_shi_15, clk, rst, st4_3, st4_11);         // goes into 12 , 13
    IBU stg_4_7 (st3_13, st3_15, inv_shi_15, clk, rst, st4_7, st4_15);         // goes into 14 , 15
    
    //operation for multiplying n-1
    multiplier_32_bit m0 (st4_0 , inv_n, prod_0);
    multiplier_32_bit m1 (st4_8 , inv_n, prod_8);
    multiplier_32_bit m2 (st4_4 , inv_n, prod_4);
    multiplier_32_bit m3 (st4_12 , inv_n, prod_12);
    
    multiplier_32_bit m4 (st4_2 , inv_n, prod_2);
    multiplier_32_bit m5 (st4_10 , inv_n, prod_10);
    multiplier_32_bit m6 (st4_6 , inv_n, prod_6);
    multiplier_32_bit m7 (st4_14 , inv_n, prod_14);
    
    multiplier_32_bit m8 (st4_1 , inv_n, prod_1);
    multiplier_32_bit m9 (st4_9 , inv_n, prod_9);
    multiplier_32_bit m10 (st4_5 , inv_n, prod_5);
    multiplier_32_bit m11 (st4_13 , inv_n, prod_13);
    
    multiplier_32_bit m12 (st4_3 , inv_n, prod_3);
    multiplier_32_bit m13 (st4_11 , inv_n, prod_11);
    multiplier_32_bit m14 (st4_7 , inv_n, prod_7);
    multiplier_32_bit m15 (st4_15 , inv_n, prod_15);
    
    
    
    always @ (prod_0 or prod_1)
    begin
      gs_0 <= prod_0 % mod_ring;
      gs_8 <= prod_8 % mod_ring;
      gs_4 <= prod_4 % mod_ring;
      gs_12 <= prod_12 % mod_ring;
      
      gs_2 <= prod_2 % mod_ring;
      gs_10 <= prod_10 % mod_ring;
      gs_6 <= prod_6 % mod_ring;
      gs_14 <= prod_14 % mod_ring;
      
      gs_1 <= prod_1 % mod_ring;
      gs_9 <= prod_9 % mod_ring;
      gs_5 <= prod_5 % mod_ring;
      gs_13 <= prod_13 % mod_ring;
      
      gs_3 <= prod_3 % mod_ring;
      gs_11 <= prod_11 % mod_ring;
      gs_7 <= prod_7 % mod_ring;
      gs_15 <= prod_15 % mod_ring;
    end
    
endmodule
