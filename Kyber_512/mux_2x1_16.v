`timescale 1ns / 1ps

module mux_2_16(
    input [15:0] a, b,
    input sel,
    output [15:0] out
    );
    
    assign out = (sel == 1'b0) ? a :
                 (sel == 1'b1) ? b :
                 16'b0; // default case to handle any unexpected values
    
endmodule
