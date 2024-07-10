`timescale 1ns / 1ps

module NTT_Transform(

    input [15:0] serial_data,
	
    input start,   
    input clk, rst,
    output [5:0] data_loop,
    
    output [15:0] NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
           NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15
    
    );
    
    wire switch;
    
    //wire [5:0] data_loop;
    

    wire [15:0]  twid_0, twid_1, twid_2, twid_3,
                 twid_4, twid_5, twid_6, twid_7,
                 twid_8, twid_9, twid_10, twid_11,
                 twid_12, twid_13, twid_14;

                 
    wire [15:0]  out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7,
                 out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15;
    
    Data_rev inst0 (

    serial_data,
	
    NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
    NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15,
    
    start,   
    clk,     
    switch,  
    data_loop,
    
    out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7,
    out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15
);

twiddle_data inst3(
    start, switch, clk,
    data_loop,
    
    twid_0, twid_1, twid_2, twid_3,
    twid_4, twid_5, twid_6, twid_7,
    twid_8, twid_9, twid_10, twid_11,
    twid_12, twid_13, twid_14
    );
    
BU_16 inst4(
        out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7,
        out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15,
        
        twid_0, twid_1, twid_2, twid_3,
        twid_4, twid_5, twid_6, twid_7,
        twid_8, twid_9, twid_10, twid_11,
        twid_12, twid_13, twid_14,           // twiddle factor
    
        clk, rst,             //clk for synchronising data 
        
        NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
        NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15
    );
    
endmodule
