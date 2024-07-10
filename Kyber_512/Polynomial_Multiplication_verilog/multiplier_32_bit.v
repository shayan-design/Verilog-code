`timescale 1ns / 1ps

//design for 32bit multiplication

module full_adder(
    input a,b,cin,
    output sum,carry
    );
    
    assign sum = a^b^cin,
           carry = ((a^b)&cin)|(a&b);
endmodule

module four_bit(
    input [3:0] a , b , 
    input cin,
    output [3:0] sum,
    output carry 
    );
    
    wire [3:0] c;
    
    full_adder inst_0 (a[0], b[0], cin, sum[0] , c[0]);
    full_adder inst_1 (a[1], b[1], c[0], sum[1] , c[1]);
    full_adder inst_2 (a[2], b[2], c[1], sum[2] , c[2]);
    full_adder inst_3 (a[3], b[3], c[2], sum[3] , carry);
    
endmodule

module adder_32_bit (
    input [31:0] a , b,
    output [31:0] sum
    );
    reg cin = 1'b0;
    wire [7:0] c;
    
    four_bit inst0 (a[3:0], b[3:0], cin, sum[3:0], c[0] );
    four_bit inst1 (a[7:4], b[7:4], c[0], sum[7:4], c[1] );
    
    four_bit inst2 (a[11:8], b[11:8], c[1], sum[11:8], c[2] );
    four_bit inst3 (a[15:12], b[15:12], c[2], sum[15:12], c[3] );
    
    four_bit inst4 (a[19:16], b[19:16], c[3], sum[19:16], c[4] );
    four_bit inst5 (a[23:20], b[23:20], c[4], sum[23:20], c[5] );
    
    four_bit inst6 (a[27:24], b[27:24], c[5], sum[27:24], c[6] );
    four_bit inst7 (a[31:28], b[31:28], c[6], sum[31:28], c[7] );
    
endmodule

module mul_16x1 (
    input [15:0] a,
    input b,
    output [31:0] out
    );
    reg df = 1'b0;
    and (out[0],a[0],b), (out[1],a[1],b), (out[2],a[2],b), (out[3],a[3],b), (out[4],a[4],b),
        (out[5],a[5],b), (out[6],a[6],b), (out[6],a[6],b), (out[7],a[7],b), (out[8],a[8],b),
        (out[9],a[9],b), (out[10],a[10],b), (out[11],a[11],b), (out[12],a[12],b), (out[13],a[13],b),
        (out[14],a[14],b), (out[15],a[15],b), (out[16],df,b), (out[17],df,b), (out[18],df,b),
        (out[19],df,b),(out[20],df,b), (out[21],df,b),(out[22],df,b), (out[23],df,b),
        (out[24],df,b),(out[25],df,b), (out[26],df,b),(out[27],df,b), (out[28],df,b),(out[29],df,b),
        (out[30],df,b),(out[31],df,b);
    
endmodule

module multiplier_32_bit(
    input [15:0] a , b,
    output [31:0] prod 
    );
    wire [31:0] c_out0,c_out1,c_out2,c_out3,c_out4,c_out5,c_out6,c_out7,c_out8,c_out9,c_out10,
                c_out11,c_out12,c_out13,c_out14,c_out15;
                
    wire [31:0] sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;
    wire [31:0] sum10,sum11,sum12,sum13;
    wire [31:0] sum20,sum21;
                
    mul_16x1 inst0 (a,b[0],c_out0);
    mul_16x1 inst1 (a,b[1],c_out1);
    mul_16x1 inst2 (a,b[2],c_out2);
    mul_16x1 inst3 (a,b[3],c_out3);
    mul_16x1 inst4 (a,b[4],c_out4);
    mul_16x1 inst5 (a,b[5],c_out5);
    mul_16x1 inst6 (a,b[6],c_out6);
    mul_16x1 inst7 (a,b[7],c_out7);
    mul_16x1 inst8 (a,b[8],c_out8);
    mul_16x1 inst9 (a,b[9],c_out9);
    mul_16x1 inst10 (a,b[10],c_out10);
    mul_16x1 inst11 (a,b[11],c_out11);
    mul_16x1 inst12 (a,b[12],c_out12);
    mul_16x1 inst13 (a,b[13],c_out13);
    mul_16x1 inst14 (a,b[14],c_out14);
    mul_16x1 inst15 (a,b[15],c_out15);
    
    adder_32_bit sum_0 (c_out0 , c_out1 << 1 ,sum0);   // shift least significant bit to right shift
    adder_32_bit sum_1 (c_out2 , c_out3 << 1 ,sum1);   // eg :- 0011   to   0110
    adder_32_bit sum_2 (c_out4 , c_out5 << 1 ,sum2);
    adder_32_bit sum_3 (c_out6 , c_out7 << 1 ,sum3);
    
    adder_32_bit sum_4 (c_out8 , c_out9 << 1 ,sum4);
    adder_32_bit sum_5 (c_out10 , c_out11 << 1 ,sum5);
    adder_32_bit sum_6 (c_out12 , c_out13 << 1 ,sum6);
    adder_32_bit sum_7 (c_out14 , c_out15 << 1 ,sum7);
    
    
    adder_32_bit sum_8 (sum0 , sum1 << 2 ,sum10);
    adder_32_bit sum_9 (sum2 , sum3 << 2 ,sum11);
    adder_32_bit sum_10 (sum4 , sum5 << 2 ,sum12);
    adder_32_bit sum_11 (sum6 , sum7 << 2 ,sum13);
    
    
    adder_32_bit sum_12 (sum10 , sum11 << 4 ,sum20);
    adder_32_bit sum_13 (sum12 , sum13 << 4 ,sum21);
    
    
    adder_32_bit sum_14 (sum20 , sum21 << 8 ,prod);
    
    
endmodule