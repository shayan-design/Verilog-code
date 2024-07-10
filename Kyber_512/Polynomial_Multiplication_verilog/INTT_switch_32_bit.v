`timescale 1ns / 1ps

module switch_32_bit(
    input [15:0] a, b, 
    input [5:0] data_loop,
    output [15:0] c
    );
    
    wire enable, switch;
    
    assign enable = data_loop[5] | (data_loop[4] & data_loop[3] & (data_loop[2] | data_loop[1]));
    
    assign switch = (data_loop[5] & data_loop[4] & (~data_loop[3] | ~data_loop[1] | (data_loop[3] & ~data_loop[2]))) 
                     | (data_loop[5] & ~data_loop[4] & data_loop[3] & data_loop[2] & data_loop[1]);
                     
    assign c = (a & {16{enable & ~switch}}) | (b & {16{enable & switch}});
    
endmodule
