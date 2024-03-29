`timescale 1ns / 1ps

module D_FF_new(
    input wire D,clk,preset,clear,
    output reg Q,Qn
    );
    
    initial 
    begin
      Q = 0;
      Qn = 1;
    end
    
    always @ ( clk or preset or clear or D)
    begin
      if (clk == 1 && preset == 1 && clear == 0)
        begin
          Q <= 1;
          Qn <= 0;
        end
        
      else if (clk == 1 && preset == 0 && clear == 1)
        begin
          Q <= 0;
          Qn <= 1;
        end
      else if (clk == 1 && preset == 1 && clear == 1)
        begin
          Q <= 1'b0;
          Qn <= 1'b1;
        end
      else if (clk == 1 && preset == 0 && clear == 0)
        begin
          Q <= D;
          Qn <= ~D;
        end
    end
endmodule
   
module D_FF (
    input D,clk,preset,clear,
    output Q
    );
    
    wire net1,Qn,Q_not;
    D_FF_new master (D,~clk,preset,clear,net1,Qn);
    D_FF_new slave (net1,clk,preset,clear,Q,Q_not); 
    
endmodule

module T_FF (
    input T,clk,preset,clear,
    output Q
    );
    
    wire D,Q_not; 
    xor (D,T,Q);
    
    D_FF inst6 (D,clk,preset,clear,Q);
    
endmodule

module PIPO_1x2 (                       //    L    load    output 
    input b,rslt,                      //     0      0       hold
    input load,L,clk,preset,clear,     //     x      1       b 
    output sub_in                      //     1      0       rslt
    );
    
    wire D;
    assign D = (b & load) | (rslt & L & ~load) | (sub_in & ~L & ~load);
    D_FF inst0 (D,clk,preset,clear,sub_in);
    
endmodule

module PIPO_16x2(
    input [15:0] b,rslt,
    input load,L,clk,preset,clear,
    output [15:0] sub_in
    );
    

    PIPO_1x2 inst0 (b[0],rslt[0],load,L,clk,preset,clear,sub_in[0]);
    PIPO_1x2 inst1 (b[1],rslt[1],load,L,clk,preset,clear,sub_in[1]);
    PIPO_1x2 inst2 (b[2],rslt[2],load,L,clk,preset,clear,sub_in[2]);
    PIPO_1x2 inst3 (b[3],rslt[3],load,L,clk,preset,clear,sub_in[3]);
    
    PIPO_1x2 inst4 (b[4],rslt[4],load,L,clk,preset,clear,sub_in[4]);
    PIPO_1x2 inst5 (b[5],rslt[5],load,L,clk,preset,clear,sub_in[5]);
    PIPO_1x2 inst6 (b[6],rslt[6],load,L,clk,preset,clear,sub_in[6]);
    PIPO_1x2 inst7 (b[7],rslt[7],load,L,clk,preset,clear,sub_in[7]);
    
    PIPO_1x2 inst8 (b[8],rslt[8],load,L,clk,preset,clear,sub_in[8]);
    PIPO_1x2 inst9 (b[9],rslt[9],load,L,clk,preset,clear,sub_in[9]);
    PIPO_1x2 inst10 (b[10],rslt[10],load,L,clk,preset,clear,sub_in[10]);
    PIPO_1x2 inst11 (b[11],rslt[11],load,L,clk,preset,clear,sub_in[11]);
    
    PIPO_1x2 inst12 (b[12],rslt[12],load,L,clk,preset,clear,sub_in[12]);
    PIPO_1x2 inst13 (b[13],rslt[13],load,L,clk,preset,clear,sub_in[13]);
    PIPO_1x2 inst14 (b[14],rslt[14],load,L,clk,preset,clear,sub_in[14]);
    PIPO_1x2 inst15 (b[15],rslt[15],load,L,clk,preset,clear,sub_in[15]);

endmodule


module PIPO_16x1(
    input inval,clk,sel,preset,clear,      // inval = value intake
    output [15:0] Q                            // sel = select wether value intake or not , sel = 1 value intake
    );

    wire Q0;
    
    assign Q0 = (Q[0] & ~sel) | (inval & sel);
    
    D_FF inst0 (Q0,clk,preset,clear,Q[15]);
    D_FF inst1 (Q[15],clk,preset,clear,Q[14]);
    D_FF inst2 (Q[14],clk,preset,clear,Q[13]);
    D_FF inst3 (Q[13],clk,preset,clear,Q[12]);
    
    D_FF inst4 (Q[12],clk,preset,clear,Q[11]);
    D_FF inst5 (Q[11],clk,preset,clear,Q[10]);
    D_FF inst6 (Q[10],clk,preset,clear,Q[9]);
    D_FF inst7 (Q[9],clk,preset,clear,Q[8]);
    
    D_FF inst8 (Q[8],clk,preset,clear,Q[7]);
    D_FF inst9 (Q[7],clk,preset,clear,Q[6]);
    D_FF inst10 (Q[6],clk,preset,clear,Q[5]);
    D_FF inst11 (Q[5],clk,preset,clear,Q[4]);
    
    D_FF inst12 (Q[4],clk,preset,clear,Q[3]);
    D_FF inst13 (Q[3],clk,preset,clear,Q[2]);
    D_FF inst14 (Q[2],clk,preset,clear,Q[1]);
    D_FF inst15 (Q[1],clk,preset,clear,Q[0]);
    
endmodule

module SIPO (
    input L,clk,sel,preset,clear,
    output [15:0] Q
    );
    
    wire clk_1;
    and #2 (clk_1,clk,sel);
    
    D_FF inst0 (L,clk_1,preset,clear,Q[0]);
    D_FF inst1 (Q[0],clk_1,preset,clear,Q[1]);
    D_FF inst2 (Q[1],clk_1,preset,clear,Q[2]);
    D_FF inst3 (Q[2],clk_1,preset,clear,Q[3]);
    
    D_FF inst4 (Q[3],clk_1,preset,clear,Q[4]);
    D_FF inst5 (Q[4],clk_1,preset,clear,Q[5]);
    D_FF inst6 (Q[5],clk_1,preset,clear,Q[6]);
    D_FF inst7 (Q[6],clk_1,preset,clear,Q[7]);
    
    D_FF inst8 (Q[7],clk_1,preset,clear,Q[8]);
    D_FF inst9 (Q[8],clk_1,preset,clear,Q[9]);
    D_FF inst10 (Q[9],clk_1,preset,clear,Q[10]);
    D_FF inst11 (Q[10],clk_1,preset,clear,Q[11]);
    
    D_FF inst12 (Q[11],clk_1,preset,clear,Q[12]);
    D_FF inst13 (Q[12],clk_1,preset,clear,Q[13]);
    D_FF inst14 (Q[13],clk_1,preset,clear,Q[14]);
    D_FF inst15 (Q[14],clk_1,preset,clear,Q[15]);
    
endmodule

// 32bit comparator
module comparator(                  // a < b means L
    input a,b,enable,               // a > b means G
    output L,E,G
    );
    wire net1;
    xnor (net1,a,b);
    and (E,net1,enable);
    and (G,a,~b,enable);
    and (L,~a,b,enable); 
    
endmodule

module comparator_16_bit(
    input [15:0] a,b,
    input enable,
    output L,E,G
    
    );
    

    wire [15:0] B;
    wire [15:0] l,g;
    
    comparator inst15 (a[15],b[15],enable,l[15],B[15],g[15]);
    comparator inst14 (a[14],b[14],B[15],l[14],B[14],g[14]);
    comparator inst13 (a[13],b[13],B[14],l[13],B[13],g[13]);
    comparator inst12 (a[12],b[12],B[13],l[12],B[12],g[12]);
    
    comparator inst11 (a[11],b[11],B[12],l[11],B[11],g[11]);
    comparator inst10 (a[10],b[10],B[11],l[10],B[10],g[10]);
    comparator inst9 (a[9],b[9],B[10],l[9],B[9],g[9]);
    comparator inst8 (a[8],b[8],B[9],l[8],B[8],g[8]);
    
    comparator inst7 (a[7],b[7],B[8],l[7],B[7],g[7]);
    comparator inst6 (a[6],b[6],B[7],l[6],B[6],g[6]);
    comparator inst5 (a[5],b[5],B[6],l[5],B[5],g[5]);
    comparator inst4 (a[4],b[4],B[5],l[4],B[4],g[4]);
    
    comparator inst3 (a[3],b[3],B[4],l[3],B[3],g[3]);
    comparator inst2 (a[2],b[2],B[3],l[2],B[2],g[2]);
    comparator inst1 (a[1],b[1],B[2],l[1],B[1],g[1]);
    comparator inst0 (a[0],b[0],B[1],l[0],E,g[0]);
    
    or (L,l[15],l[14],l[13],l[12],l[11],l[10],l[9],l[8],l[7],l[6],l[5],l[4],l[3],l[2],l[1],l[0]);
    or (G,g[15],g[14],g[13],g[12],g[11],g[10],g[9],g[8],g[7],g[6],g[5],g[4],g[3],g[2],g[1],g[0]);
    
endmodule     

module comparator_32_bit(
    input [31:0] a , b,
    output L,E,G
    );
    wire L0,L1,G0,G1,E0,E1;
    reg enb = 1'b1;
    
    comparator_16_bit comp_31x16 (a[31:16],b[31:16],enb,L0,E0,G0);
    comparator_16_bit comp_15x0 (a[15:0],b[15:0],E0,L1,E,G1);
    
    or (L,L0,L1);
    or (G,G0,G1);
    
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

// multiplex for division circuit
module mul_16x1_div (
    input [15:0] a,b,
    input sel,
    output [15:0] out
    );
    
    assign out[0] = (a[0] & ~sel) | (b[0] & sel),
           out[1] = (a[1] & ~sel) | (b[1] & sel),
           out[2] = (a[2] & ~sel) | (b[2] & sel),
           out[3] = (a[3] & ~sel) | (b[3] & sel),
           out[4] = (a[4] & ~sel) | (b[4] & sel),
           out[5] = (a[5] & ~sel) | (b[5] & sel),
           out[6] = (a[6] & ~sel) | (b[6] & sel),
           out[7] = (a[7] & ~sel) | (b[7] & sel),
           out[8] = (a[8] & ~sel) | (b[8] & sel),
           out[9] = (a[9] & ~sel) | (b[9] & sel),
           out[10] = (a[10] & ~sel) | (b[10] & sel),
           out[11] = (a[11] & ~sel) | (b[11] & sel),
           out[12] = (a[12] & ~sel) | (b[12] & sel),
           out[13] = (a[13] & ~sel) | (b[13] & sel),
           out[14] = (a[14] & ~sel) | (b[14] & sel),
           out[15] = (a[15] & ~sel) | (b[15] & sel);
    
endmodule

module sub_clk_out (
    input [15:0] a,
    input clk,preset,clear,
    output [15:0] out
    );

    D_FF inst0 (a[0],clk,preset,clear,out[0]);
    D_FF inst1 (a[1],clk,preset,clear,out[1]);
    D_FF inst2 (a[2],clk,preset,clear,out[2]);
    D_FF inst3 (a[3],clk,preset,clear,out[3]);
    
    D_FF inst4 (a[4],clk,preset,clear,out[4]);
    D_FF inst5 (a[5],clk,preset,clear,out[5]);
    D_FF inst6 (a[6],clk,preset,clear,out[6]);
    D_FF inst7 (a[7],clk,preset,clear,out[7]);
    
    D_FF inst8 (a[8],clk,preset,clear,out[8]);
    D_FF inst9 (a[9],clk,preset,clear,out[9]);
    D_FF inst10 (a[10],clk,preset,clear,out[10]);
    D_FF inst11 (a[11],clk,preset,clear,out[11]);
    
    D_FF inst12 (a[12],clk,preset,clear,out[12]);
    D_FF inst13 (a[13],clk,preset,clear,out[13]);
    D_FF inst14 (a[14],clk,preset,clear,out[14]);
    D_FF inst15 (a[15],clk,preset,clear,out[15]);
    
endmodule

module full_adder(
    input a,b,cin,
    output sum,carry
    );
    
    assign sum = a^b^cin,
           carry = ((a^b)&cin)|(a&b);
           
endmodule

    // Subtractor circuit 
module sub_16_bit (a, b,cin, carry, rslt);   // a msut be greater than b  ... a >= b

    input [15:0] a, b;
    input cin;
    output carry;
    output [15:0] rslt;
    
    full_adder inst0 (a[0],~b[0],cin,rslt[0],carry_0);
    full_adder inst1 (a[1],~b[1],carry_0,rslt[1],carry_1);
    full_adder inst2 (a[2],~b[2],carry_1,rslt[2],carry_2);
    full_adder inst3 (a[3],~b[3],carry_2,rslt[3],carry_3);
    
    full_adder inst4 (a[4],~b[4],carry_3,rslt[4],carry_4);
    full_adder inst5 (a[5],~b[5],carry_4,rslt[5],carry_5);
    full_adder inst6 (a[6],~b[6],carry_5,rslt[6],carry_6);
    full_adder inst7 (a[7],~b[7],carry_6,rslt[7],carry_7);
    
    full_adder inst8(a[8],~b[8],carry_7,rslt[8],carry_8);
    full_adder inst9(a[9],~b[9],carry_8,rslt[9],carry_9);
    full_adder inst10(a[10],~b[10],carry_9,rslt[10],carry_10);
    full_adder inst11(a[11],~b[11],carry_10,rslt[11],carry_11);
    
    full_adder inst12(a[12],~b[12],carry_11,rslt[12],carry_12);
    full_adder inst13(a[13],~b[13],carry_12,rslt[13],carry_13);
    full_adder inst14(a[14],~b[14],carry_13,rslt[14],carry_14);
    full_adder inst15(a[15],~b[15],carry_14,rslt[15],carry);
    
endmodule

module sub_32_bit (a, b, rslt);
    
    input [31:0] a,b; 
    output [31:0] rslt;
    
    wire carry,carry_2;
    reg cin = 1'b1;
    sub_16_bit sub_1x15 (a[15:0], b[15:0], cin ,carry, rslt[15:0]);
    sub_16_bit sub_16x32 (a[31:16], b[31:16], carry ,carry_2, rslt[31:16]);
    
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

module adder_32_bit (            // 32 bit adder
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

// 32 bit multiplier 
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

module tic_tac (
    input start,              // when start = 1 it means ready to take value
    input clk,preset,clear,
    output ready,clr,load      
    );
    
    wire D0,D1,D2 ;
    
    assign D0 = (load & clr),
           D1 = (~load & clr),
           D2 = (ready);
    
    D_FF inst0  (D0,clk,start,clear, ready );
    D_FF inst1 (D1,clk,preset,start, load );
    D_FF inst2 (D2,clk,preset,start, clr);
    
endmodule

module mod_18(
    input clk,preset,clear,
    output [4:0] Q
    );
    wire [4:0] D;
    
    assign D[0] =  ~Q[0],
           D[1] = (~Q[1] & Q[0]) | (Q[1] & ~Q[0]),
           D[2] = (Q[2] & ~Q[1]) | (Q[2] & ~Q[0]) | (~Q[2] & Q[1] & Q[0]),
           D[3] = (Q[3] & ~Q[2]) | (Q[3] & ~Q[1]) | (Q[3] & ~Q[0]) | (~Q[3] & Q[2] & Q[1] & Q[0]),
           D[4] = (Q[3] & Q[2] & Q[1] & Q[0]) | (Q[4] & ~Q[1]) | (Q[4] & ~Q[3] & ~Q[2] & Q[1] & ~Q[0]);
           
           D_FF inst0 (D[0],clk,preset,clear,Q[0]);
           D_FF inst1 (D[1],clk,preset,clear,Q[1]);
           D_FF inst2 (D[2],clk,preset,clear,Q[2]);
           D_FF inst3 (D[3],clk,preset,clear,Q[3]);
           D_FF inst4 (D[4],clk,preset,clear,Q[4]);
    
endmodule

module division_16_bit (
    input [15:0] a,b,
    input clk,preset,clear,Trig,
    output [15:0] rslt,       // rslt = remainder 
    output [15:0] div_rslt
    );
    
    wire [15:0] Q;
    wire [15:0] u,out,b_out,rslt_clk;
    wire [31:0] rslt_32;
    wire [31:0] c;
    wire L_in,clr,load,carry;
    wire L,E,G;
    
    //
    wire loop_start, loop_enable, display_clk_hold, Y ;
    wire [4:0] loop_val;
    
    //
    wire net101, net201, net303;
    wire L_E;
    or (net303, loop_enable, Trig);
    assign net101 = L_in & ~net303;
    assign net201 = ~net303 & eq_out;
    or (eq_out, net101, net201);
    and (L_E, E, eq_out);
    //
    
    or #1 (Y, Trig, loop_enable);
    
    T_FF start_trig (~preset,Y,preset,clear, loop_start);
    
    mod_18 loop_18 (clk,preset,~loop_start, loop_val);
    
    assign loop_enable = loop_val[4] & ~loop_val[3] & ~loop_val[2] & loop_val[1] & loop_val[0] ; 
    
    and (display_clk_hold, loop_start , clk) ;
    //
    
    tic_tac inst66 (~loop_start,clk,preset,clear,ready,clr,load);   // when start = 1 it means ready to take value
    
    PIPO_16x1 inst0 (~preset,clk,load,preset,clr,Q);     // L    inval
    multiplier_32_bit inst1 (b , Q, c);
    
    sub_16_bit inst3 (b, b, ~preset, carry, u);
   
    mul_16x1_div inst9 (u,c[15:0], L_in ,out);         // L
    
    sub_16_bit inst2 (b_out, out, ~preset, carry, rslt);
    sub_clk_out inst31 (rslt,clk,preset,clr,rslt_clk);
    PIPO_16x2 inst48 (a,rslt,load,L_in ,clk,preset,clr,b_out);   // L
    
    assign rslt_32 = {u,rslt_clk};
    
    comparator_32_bit inst4 (c , rslt_32 ,L,E,G);
    
    // result display in this module
    SIPO display (L_in,display_clk_hold,~preset,preset,clr,div_rslt);          // ~preset means high so value can intake
    
    D_FF inst10 (L,clk,preset,start, net1 );
    and  (net2,net1,E);
    or #1 (L_in,net2,L, L_E);
    
endmodule


module mux_sel_val(
    input  [15:0] b, a,
    input sel_3, sel_2, sel_1, sel_0,
    output [31:0] out
    );
    
	and (out[0], sel_3, sel_2, sel_1, sel_0, a[0]);
	and (out[1], sel_3, sel_2, sel_1, sel_0, a[1]);
	and (out[2], sel_3, sel_2, sel_1, sel_0, a[2]);
	and (out[3], sel_3, sel_2, sel_1, sel_0, a[3]);
	and (out[4], sel_3, sel_2, sel_1, sel_0, a[4]);
	and (out[5], sel_3, sel_2, sel_1, sel_0, a[5]);
	and (out[6], sel_3, sel_2, sel_1, sel_0, a[6]);
	and (out[7], sel_3, sel_2, sel_1, sel_0, a[7]);
	and (out[8], sel_3, sel_2, sel_1, sel_0, a[8]);
	and (out[9], sel_3, sel_2, sel_1, sel_0, a[9]);
	and (out[10], sel_3, sel_2, sel_1, sel_0, a[10]);
	and (out[11], sel_3, sel_2, sel_1, sel_0, a[11]);
	and (out[12], sel_3, sel_2, sel_1, sel_0, a[12]);
	and (out[13], sel_3, sel_2, sel_1, sel_0, a[13]);
	and (out[14], sel_3, sel_2, sel_1, sel_0, a[14]);
	and (out[15], sel_3, sel_2, sel_1, sel_0, a[15]);
	and (out[16], sel_3, sel_2, sel_1, sel_0, b[0]);
	and (out[17], sel_3, sel_2, sel_1, sel_0, b[1]);
	and (out[18], sel_3, sel_2, sel_1, sel_0, b[2]);
	and (out[19], sel_3, sel_2, sel_1, sel_0, b[3]);
	and (out[20], sel_3, sel_2, sel_1, sel_0, b[4]);
	and (out[21], sel_3, sel_2, sel_1, sel_0, b[5]);
	and (out[22], sel_3, sel_2, sel_1, sel_0, b[6]);
	and (out[23], sel_3, sel_2, sel_1, sel_0, b[7]);
	and (out[24], sel_3, sel_2, sel_1, sel_0, b[8]);
	and (out[25], sel_3, sel_2, sel_1, sel_0, b[9]);
	and (out[26], sel_3, sel_2, sel_1, sel_0, b[10]);
	and (out[27], sel_3, sel_2, sel_1, sel_0, b[11]);
	and (out[28], sel_3, sel_2, sel_1, sel_0, b[12]);
	and (out[29], sel_3, sel_2, sel_1, sel_0, b[13]);
	and (out[30], sel_3, sel_2, sel_1, sel_0, b[14]);
	and (out[31], sel_3, sel_2, sel_1, sel_0, b[15]);
    
endmodule

module bit_logical(
    input [31:0] a, b,
    output [31:0] out_1, out_2, out_3, out_4, out_5, out_6,
           out_7, out_8, out_9, out_10, out_11
    );
    
    assign out_1 = a & b;
    assign out_2 = a | b;
    assign out_3 = ~(a & b);
    assign out_4 = ~(a | b);
    
    assign out_5 = (a ^ b);
    assign out_6 = ~(a ^ b);
    assign out_7 = (~a);
    
    assign out_8 = a && b;
    assign out_9 = a || b;
    assign out_10 = (a << 1);
    assign out_11 = (a >> 1);

endmodule

module ALU_out_sel(
    input [31:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12,
                  out_13, out_14, out_15, out_16,
    output [31:0] value
    );
                  
	or (value[0], out_1[0], out_2[0], out_3[0], out_4[0], out_5[0], out_6[0], out_7[0], out_8[0], out_9[0], out_10[0], out_11[0], out_12[0],
		out_13[0], out_14[0], out_15[0], out_16[0]);
	or (value[1], out_1[1], out_2[1], out_3[1], out_4[1], out_5[1], out_6[1], out_7[1], out_8[1], out_9[1], out_10[1], out_11[1], out_12[1],
		out_13[1], out_14[1], out_15[1], out_16[1]);
	or (value[2], out_1[2], out_2[2], out_3[2], out_4[2], out_5[2], out_6[2], out_7[2], out_8[2], out_9[2], out_10[2], out_11[2], out_12[2],
		out_13[2], out_14[2], out_15[2], out_16[2]);
	or (value[3], out_1[3], out_2[3], out_3[3], out_4[3], out_5[3], out_6[3], out_7[3], out_8[3], out_9[3], out_10[3], out_11[3], out_12[3],
		out_13[3], out_14[3], out_15[3], out_16[3]);
	or (value[4], out_1[4], out_2[4], out_3[4], out_4[4], out_5[4], out_6[4], out_7[4], out_8[4], out_9[4], out_10[4], out_11[4], out_12[4],
		out_13[4], out_14[4], out_15[4], out_16[4]);
	or (value[5], out_1[5], out_2[5], out_3[5], out_4[5], out_5[5], out_6[5], out_7[5], out_8[5], out_9[5], out_10[5], out_11[5], out_12[5],
		out_13[5], out_14[5], out_15[5], out_16[5]);
	or (value[6], out_1[6], out_2[6], out_3[6], out_4[6], out_5[6], out_6[6], out_7[6], out_8[6], out_9[6], out_10[6], out_11[6], out_12[6],
		out_13[6], out_14[6], out_15[6], out_16[6]);
	or (value[7], out_1[7], out_2[7], out_3[7], out_4[7], out_5[7], out_6[7], out_7[7], out_8[7], out_9[7], out_10[7], out_11[7], out_12[7],
		out_13[7], out_14[7], out_15[7], out_16[7]);
	or (value[8], out_1[8], out_2[8], out_3[8], out_4[8], out_5[8], out_6[8], out_7[8], out_8[8], out_9[8], out_10[8], out_11[8], out_12[8],
		out_13[8], out_14[8], out_15[8], out_16[8]);
	or (value[9], out_1[9], out_2[9], out_3[9], out_4[9], out_5[9], out_6[9], out_7[9], out_8[9], out_9[9], out_10[9], out_11[9], out_12[9],
		out_13[9], out_14[9], out_15[9], out_16[9]);
	or (value[10], out_1[10], out_2[10], out_3[10], out_4[10], out_5[10], out_6[10], out_7[10], out_8[10], out_9[10], out_10[10], out_11[10], out_12[10],
		out_13[10], out_14[10], out_15[10], out_16[10]);
	or (value[11], out_1[11], out_2[11], out_3[11], out_4[11], out_5[11], out_6[11], out_7[11], out_8[11], out_9[11], out_10[11], out_11[11], out_12[11],
		out_13[11], out_14[11], out_15[11], out_16[11]);
	or (value[12], out_1[12], out_2[12], out_3[12], out_4[12], out_5[12], out_6[12], out_7[12], out_8[12], out_9[12], out_10[12], out_11[12], out_12[12],
		out_13[12], out_14[12], out_15[12], out_16[12]);
	or (value[13], out_1[13], out_2[13], out_3[13], out_4[13], out_5[13], out_6[13], out_7[13], out_8[13], out_9[13], out_10[13], out_11[13], out_12[13],
		out_13[13], out_14[13], out_15[13], out_16[13]);
	or (value[14], out_1[14], out_2[14], out_3[14], out_4[14], out_5[14], out_6[14], out_7[14], out_8[14], out_9[14], out_10[14], out_11[14], out_12[14],
		out_13[14], out_14[14], out_15[14], out_16[14]);
	or (value[15], out_1[15], out_2[15], out_3[15], out_4[15], out_5[15], out_6[15], out_7[15], out_8[15], out_9[15], out_10[15], out_11[15], out_12[15],
		out_13[15], out_14[15], out_15[15], out_16[15]);
	or (value[16], out_1[16], out_2[16], out_3[16], out_4[16], out_5[16], out_6[16], out_7[16], out_8[16], out_9[16], out_10[16], out_11[16], out_12[16],
		out_13[16], out_14[16], out_15[16], out_16[16]);
	or (value[17], out_1[17], out_2[17], out_3[17], out_4[17], out_5[17], out_6[17], out_7[17], out_8[17], out_9[17], out_10[17], out_11[17], out_12[17],
		out_13[17], out_14[17], out_15[17], out_16[17]);
	or (value[18], out_1[18], out_2[18], out_3[18], out_4[18], out_5[18], out_6[18], out_7[18], out_8[18], out_9[18], out_10[18], out_11[18], out_12[18],
		out_13[18], out_14[18], out_15[18], out_16[18]);
	or (value[19], out_1[19], out_2[19], out_3[19], out_4[19], out_5[19], out_6[19], out_7[19], out_8[19], out_9[19], out_10[19], out_11[19], out_12[19],
		out_13[19], out_14[19], out_15[19], out_16[19]);
	or (value[20], out_1[20], out_2[20], out_3[20], out_4[20], out_5[20], out_6[20], out_7[20], out_8[20], out_9[20], out_10[20], out_11[20], out_12[20],
		out_13[20], out_14[20], out_15[20], out_16[20]);
	or (value[21], out_1[21], out_2[21], out_3[21], out_4[21], out_5[21], out_6[21], out_7[21], out_8[21], out_9[21], out_10[21], out_11[21], out_12[21],
		out_13[21], out_14[21], out_15[21], out_16[21]);
	or (value[22], out_1[22], out_2[22], out_3[22], out_4[22], out_5[22], out_6[22], out_7[22], out_8[22], out_9[22], out_10[22], out_11[22], out_12[22],
		out_13[22], out_14[22], out_15[22], out_16[22]);
	or (value[23], out_1[23], out_2[23], out_3[23], out_4[23], out_5[23], out_6[23], out_7[23], out_8[23], out_9[23], out_10[23], out_11[23], out_12[23],
		out_13[23], out_14[23], out_15[23], out_16[23]);
	or (value[24], out_1[24], out_2[24], out_3[24], out_4[24], out_5[24], out_6[24], out_7[24], out_8[24], out_9[24], out_10[24], out_11[24], out_12[24],
		out_13[24], out_14[24], out_15[24], out_16[24]);
	or (value[25], out_1[25], out_2[25], out_3[25], out_4[25], out_5[25], out_6[25], out_7[25], out_8[25], out_9[25], out_10[25], out_11[25], out_12[25],
		out_13[25], out_14[25], out_15[25], out_16[25]);
	or (value[26], out_1[26], out_2[26], out_3[26], out_4[26], out_5[26], out_6[26], out_7[26], out_8[26], out_9[26], out_10[26], out_11[26], out_12[26],
		out_13[26], out_14[26], out_15[26], out_16[26]);
	or (value[27], out_1[27], out_2[27], out_3[27], out_4[27], out_5[27], out_6[27], out_7[27], out_8[27], out_9[27], out_10[27], out_11[27], out_12[27],
		out_13[27], out_14[27], out_15[27], out_16[27]);
	or (value[28], out_1[28], out_2[28], out_3[28], out_4[28], out_5[28], out_6[28], out_7[28], out_8[28], out_9[28], out_10[28], out_11[28], out_12[28],
		out_13[28], out_14[28], out_15[28], out_16[28]);
	or (value[29], out_1[29], out_2[29], out_3[29], out_4[29], out_5[29], out_6[29], out_7[29], out_8[29], out_9[29], out_10[29], out_11[29], out_12[29],
		out_13[29], out_14[29], out_15[29], out_16[29]);
	or (value[30], out_1[30], out_2[30], out_3[30], out_4[30], out_5[30], out_6[30], out_7[30], out_8[30], out_9[30], out_10[30], out_11[30], out_12[30],
		out_13[30], out_14[30], out_15[30], out_16[30]);
	or (value[31], out_1[31], out_2[31], out_3[31], out_4[31], out_5[31], out_6[31], out_7[31], out_8[31], out_9[31], out_10[31], out_11[31], out_12[31],
		out_13[31], out_14[31], out_15[31], out_16[31]);

    
endmodule

module ALU(
    
    input [31:0] a,b,
    input clk,preset,clear,Trig,
    input [3:0] sel,
    output equal_flag, greater_flag, smaller_flag,    // a > b then greater_flag is HIgh
    output reg ready_flag,                           // ready flag means when it high means ready to take value
    output [31:0] value
    );
    
    wire [31:0] rslt,sum,prod;
    wire [15:0] div_rslt, remain;
    wire L, E, G;
    wire [31:0] and_1, or_1, nand_1, nor_1, xor_1, xnor_1, neg_1 , log_and, log_or, shr, shl;
    wire [31:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12,
                  out_13, out_14, out_15, out_16;
    
    reg [15:0] zer = 16'h0000;
    
    sub_32_bit subtractor (a, b, rslt);     // a > b &&  00
    
    adder_32_bit adder (a , b,sum);         // 01
    
    multiplier_32_bit multiplier (a[15:0] , b[15:0], prod);       // 10
    
    division_16_bit division (a[15:0] ,b[15:0] ,clk,preset,clear,Trig, remain,div_rslt);      // 11
    
    comparator_32_bit comparison (a , b ,smaller_flag,equal_flag,greater_flag);          // if a > b     greater_flag is HIGH         //00
    
    initial
    begin
      ready_flag = 1'b1;
    end
    
    bit_logical inst67 ( a, b, and_1,  or_1, nand_1, nor_1, xor_1, xnor_1, neg_1, 
                               log_and, log_or, shl, shr);
                               
    // arithmetic operation       
    mux_sel_val inst10 (rslt[31:16], rslt[15:0], ~sel[3], ~sel[2], ~sel[1], ~sel[0], out_1);                          //Substraction operator
    mux_sel_val inst11 (sum[31:16], sum[15:0], ~sel[3], ~sel[2], ~sel[1], sel[0], out_2);                             //ADD operator
    mux_sel_val inst12 (prod[31:16], prod[15:0], ~sel[3], ~sel[2], sel[1], ~sel[0], out_3);                           //Multiplication operator
    mux_sel_val inst13 (remain, div_rslt, ~sel[3], ~sel[2], sel[1], sel[0], out_4);       // Division operator   0012_4567: remainder = 0012, quotient = 4567
    mux_sel_val inst125 (zer, div_rslt, ~sel[3], sel[2], ~sel[1], ~sel[0], out_5);                                    //modulo operator
    
    //bitwise operation
    mux_sel_val inst14 (and_1[31:16], and_1[15:0], ~sel[3], sel[2], ~sel[1], sel[0], out_6);                          // bitwise AND operation
    mux_sel_val inst15 (or_1[31:16], or_1[15:0], ~sel[3], sel[2], sel[1], ~sel[0], out_7);                            // bitwise OR operation
    mux_sel_val inst16 (nand_1[31:16], nand_1[15:0], ~sel[3], sel[2], sel[1], sel[0], out_8);                         // bitwise NAND operation
    mux_sel_val inst17 (nor_1[31:16], nor_1[15:0], sel[3], ~sel[2], ~sel[1], ~sel[0], out_9);                         // bitwise NOR operation
    
    mux_sel_val inst18 (xor_1[31:16], xor_1[15:0], sel[3], ~sel[2], ~sel[1], sel[0], out_10);                         // bitwise XOR operation 
    mux_sel_val inst19 (xnor_1[31:16], xnor_1[15:0], sel[3], ~sel[2], sel[1], ~sel[0], out_11);                       // bitwise XNOR operation 
    mux_sel_val inst20 (neg_1[31:16], neg_1[15:0], sel[3], ~sel[2], sel[1], sel[0], out_12);                          // bitwise not operation
    
    //logical operation
    mux_sel_val inst21 (log_and[31:16], log_and[15:0], sel[3], sel[2], ~sel[1], ~sel[0], out_13);                     // logical AND
    mux_sel_val inst22 (log_or[31:16], log_or[15:0], sel[3], sel[2], ~sel[1], sel[0], out_14);                        // logical OR
    mux_sel_val inst23 (shl[31:16], shl[15:0], sel[3], sel[2], sel[1], ~sel[0], out_15);                      // shift left of a      eg :- 0011   to   0110
    mux_sel_val inst24 (shr[31:16], shr[15:0], sel[3], sel[2], sel[1], sel[0], out_16);                       // shift right of a     eg :- 1011   to   0101
    
    
    ALU_out_sel inst88 ( out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12,
                  out_13, out_14, out_15, out_16,  value);
    
    always @ (sel or Trig)
    begin
    
        //ready instruction
        if (sel == 4'b0011 && Trig == 1'b1 )
        begin
          #10 ready_flag = 1'b0;
          #170 ready_flag = 1'b1;
        end
        
        else if (sel == 4'b0100 && Trig == 1'b1)
        begin
          #10 ready_flag = 1'b0;
          #170 ready_flag = 1'b1;
        end 
        
        else if (Trig == 1'b1)
        begin
          #10 ready_flag = 1'b0;
          #20 ready_flag = 1'b1;
        end
      
    end
    
endmodule