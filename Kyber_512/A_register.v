`timescale 1ns / 1ps

module A_register #(
    parameter Kyber_Security = 3  // Default value, change as needed
)(
    input write_enable,
    input read_enable,
    input loop_end,
    input start,
    input [7:0] i,
    input [2:0] inner_loop,
    input [2:0] outer_loop,
    input clk,
    input [15:0] data_in,
    output reg [15:0] data_out
);

    // Register array declaration
    reg [15:0] A [Kyber_Security - 1:0][Kyber_Security - 1:0] [255:0];
    
    always @(posedge clk)
    begin
      if(write_enable == 1'b1)
      begin
        A[outer_loop][inner_loop][i] <= data_in;
      end
      else if(read_enable == 1'b1)
      begin
        data_out <= A[inner_loop][outer_loop][i];
      end
    end


endmodule



