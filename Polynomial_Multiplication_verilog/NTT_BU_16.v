`timescale 1ns / 1ps

// This unit can perform operations below:
// -- CT-based butterfly for handling 16bit width data 
//    and performing 16 element based NTT transform

module BU_16(
    input [15:0] 
        a_0, a_1, a_2, a_3,      //input data for handling NTT based transform
        a_4, a_5, a_6, a_7,
        a_8, a_9, a_10, a_11,
        a_12, a_13, a_14, a_15,
        
    input [15:0] shi_1, shi_2, shi_3, shi_4,
                 shi_5, shi_6, shi_7, shi_8,
                 shi_9, shi_10, shi_11, shi_12,
                 shi_13, shi_14, shi_15,           // twiddle factor
    
    input clk, rst,             //clk for synchronising data 
    output [15:0]
        ct_0, ct_1, ct_2, ct_3,
        ct_4, ct_5, ct_6, ct_7,
        ct_8, ct_9, ct_10, ct_11,
        ct_12, ct_13, ct_14, ct_15
    );
    
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
                
    //operation for stage 1
    BU stg_1_0 (a_0, a_1, shi_1, clk, rst, st1_0, st1_1);
    BU stg_1_1 (a_2, a_3, shi_1, clk, rst, st1_2, st1_3);
    BU stg_1_2 (a_4, a_5, shi_1, clk, rst, st1_4, st1_5);
    BU stg_1_3 (a_6, a_7, shi_1, clk, rst, st1_6, st1_7);
    BU stg_1_4 (a_8, a_9, shi_1, clk, rst, st1_8, st1_9);
    BU stg_1_5 (a_10, a_11, shi_1, clk, rst, st1_10, st1_11);
    BU stg_1_6 (a_12, a_13, shi_1, clk, rst, st1_12, st1_13);
    BU stg_1_7 (a_14, a_15, shi_1, clk, rst, st1_14, st1_15);
    
    //operation for stage 2
    BU stg_2_0 (st1_0, st1_2, shi_2, clk, rst, st2_0, st2_1);
    BU stg_2_1 (st1_1, st1_3, shi_3, clk, rst, st2_2, st2_3);
    
    BU stg_2_2 (st1_4, st1_6, shi_2, clk, rst, st2_4, st2_5);
    BU stg_2_3 (st1_5, st1_7, shi_3, clk, rst, st2_6, st2_7);
    
    BU stg_2_4 (st1_8, st1_10, shi_2, clk, rst, st2_8, st2_9);
    BU stg_2_5 (st1_9, st1_11, shi_3, clk, rst, st2_10, st2_11);
    
    BU stg_2_6 (st1_12, st1_14, shi_2, clk, rst, st2_12, st2_13);
    BU stg_2_7 (st1_13, st1_15, shi_3, clk, rst, st2_14, st2_15);

    //operation for stage 3
    BU stg_3_0 (st2_0, st2_4, shi_4, clk, rst, st3_0, st3_1);
    BU stg_3_1 (st2_8, st2_12, shi_4, clk, rst, st3_2, st3_3);
    
    BU stg_3_2 (st2_1, st2_5, shi_5, clk, rst, st3_4, st3_5);
    BU stg_3_3 (st2_9, st2_13, shi_5, clk, rst, st3_6, st3_7);
    
    BU stg_3_4 (st2_2, st2_6, shi_6, clk, rst, st3_8, st3_9);
    BU stg_3_5 (st2_10, st2_14, shi_6, clk, rst, st3_10, st3_11);
    
    BU stg_3_6 (st2_3, st2_7, shi_7, clk, rst, st3_12, st3_13);
    BU stg_3_7 (st2_11, st2_15, shi_7, clk, rst, st3_14, st3_15);
    
    //operation for stage 4
    BU stg_4_0 (st3_0, st3_2, shi_8, clk, rst, ct_0, ct_8);            // goes into 0 , 1
    BU stg_4_1 (st3_1, st3_3, shi_9, clk, rst, ct_4, ct_12);            // goes into 2 , 3
    
    BU stg_4_2 (st3_4, st3_6, shi_10, clk, rst, ct_2, ct_10);           // goes into 4 , 5
    BU stg_4_3 (st3_5, st3_7, shi_11, clk, rst, ct_6, ct_14);           // goes into 6 , 7
    
    BU stg_4_4 (st3_8, st3_10, shi_12, clk, rst, ct_1, ct_9);           // goes into 8 , 9
    BU stg_4_5 (st3_9, st3_11, shi_13, clk, rst, ct_5, ct_13);          // goes into 10 , 11
    
    BU stg_4_6 (st3_12, st3_14, shi_14, clk, rst, ct_3, ct_11);         // goes into 12 , 13
    BU stg_4_7 (st3_13, st3_15, shi_15, clk, rst, ct_7, ct_15);         // goes into 14 , 15
    
endmodule
