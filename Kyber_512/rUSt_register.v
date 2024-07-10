`timescale 1ns / 1ps

module rUSt_register #(
    parameter Kyber_Security = 3  // Default value, change as needed
)(
    input write_enable,
    input read_enable,
    input [7:0] i,
    input [2:0] inner_loop,

    input clk,
    input [15:0] data_in,
    output reg [15:0] data_out
);

    // Register array declaration
    reg [15:0] U [Kyber_Security - 1:0][255:0];

    always @(posedge clk)
    begin
      if(write_enable == 1'b1)
      begin
        U[inner_loop][i] <= data_in;
      end
      else if(read_enable == 1'b1)
      begin
        data_out <= U[inner_loop][i];
      end
    end

endmodule





