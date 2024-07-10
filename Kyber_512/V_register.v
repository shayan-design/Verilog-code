`timescale 1ns / 1ps

module V_register (
    input write_enable,
    input read_enable,
    input [7:0] i,
    
    input clk,
    input [15:0] data_in,
    output reg [15:0] data_out
);

        // Register array declaration
    reg [15:0] V [255:0];

    always @(posedge clk)
    begin
      if(write_enable == 1'b1)
      begin
        V[i] <= data_in;
      end
      else if(read_enable == 1'b1)
      begin
        data_out <= V[i];
      end
    end
    
endmodule
