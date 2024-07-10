`timescale 1ns / 1ps

module IBU(
    input [15:0] a, b, inv_shi, 
    input clk, rst,
    output reg [15:0] IB_1,
    output reg [15:0] IB_2
    );
    
    
    //Initiliaze modulus ring 
    reg [15:0] mod_ring = 16'h1e01;
    reg [15:0] sub;
    wire [31:0] prod;
    
    always@ (a or b)
    begin
      if(a > b)
        sub = (a - b);
      else
        sub = (mod_ring - (b - a));
    end 
    
    multiplier_32_bit m0 (sub , inv_shi, prod);
    
    always@ (posedge clk or posedge rst)
    begin
      if(rst)
        begin
          IB_1 <= 0;
          IB_2 <= 0;
        end
      else
        begin
          IB_1 <= (a + b) % mod_ring;
          IB_2 <= prod % mod_ring;
        end
    end
    
endmodule
