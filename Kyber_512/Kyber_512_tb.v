`timescale 1ns / 1ps

module Kyber_512_tb(

);

    parameter Kyber_Security = 2;
     
    reg clk;
    reg start;         
    reg reset;
    
    reg [2:0] control;
    reg [15:0] message;
    wire loop_end;
    wire [15:0] dec;        
    wire [15:0] out_3;
    wire [15:0] out_4;
    wire read_enable_S;
    wire read_enable_r;
    wire [5:0] data_loop;
    wire [7:0] i;
    wire [7:0] j;
    wire ready;
    wire [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
                  INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15;
    wire [15:0] ser_data;
    wire [15:0] pol_add_sub_data;
    wire [15:0] out_6;
    wire [2:0] inner_loop;
    wire [2:0] pol_loop;
    wire write_enable_U;
    wire read_enable_U;
    wire [2:0] U_loop;
    wire write_enable_t;
    wire read_enable_t;
    wire write_enable_V;
    wire read_enable_V;
    wire [15:0] V ;
    wire V_clk;
    wire [15:0] t ;
    wire [15:0] U ;

    Kyber_512 #(
    .Kyber_Security(Kyber_Security)  
)   dut(
     clk,
     start,         //posedge trigger for starting algorithm
     reset,
     control,
     message,
     loop_end,
    dec,           //decrypted message
     out_3,
    out_4,
    read_enable_S,
    read_enable_r,
    data_loop,
    i, j, ready,
    INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
                  INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15,
    ser_data,
    pol_add_sub_data,
    out_6,
    inner_loop,
    pol_loop,
    write_enable_U,
    read_enable_U,
    U_loop,
    write_enable_t,
    read_enable_t,
    write_enable_V,
    read_enable_V,
    V, 
    V_clk,
    t, U
);

  initial 
  begin
  #0 clk = 1'b0; reset = 1'b0;
  forever #5 clk = ~clk;
  end
  
    
  always @(negedge clk) begin
    //$display("%h                       %h", out_3, out_4);
    $display("%d ", dec);
  end

  
  initial
  begin

 // Print the values in hexadecimal format
  $monitor(" ---------------------------loop_end-------------------------------  %h", loop_end); // Print the values in hexadecimal format
  
  #0 start = 1'b0; message = 1'b0; control = 3'b000;
  #10 start = 1'b1; control = 3'b100;
  #50 start = 1'b0; control = 3'b100;
  #4000;
  
  #10 start = 1'b0; control = 3'b100;
  #50 start = 1'b0; control = 3'b100;
  #4000;
  
  #10 start = 1'b0; control = 3'b100;
  #50 start = 1'b0; control = 3'b100;
  #4000;
  
  #10 start = 1'b0; control = 3'b100;
  #50 start = 1'b0; control = 3'b100;
  #4000;
  
    
  #10 control = 3'b000;                                  // This is necessary for cooldown period
  #100;
  
    #10 start = 1'b1; control = 3'b101;
  #50 start = 1'b0; control = 3'b101;
  #4000;
  
    #10 start = 1'b0; control = 3'b101;
  #50 start = 1'b0; control = 3'b101;
  #4000;
  
    #10 start = 1'b0; control = 3'b101;
  #50 start = 1'b0; control = 3'b101;
  #4000;
  
    #10 start = 1'b0; control = 3'b101;
  #50 start = 1'b0; control = 3'b101;
  #4000;
  
  #10 control = 3'b000;                                  // This is necessary for cooldown period
  #100;

//////////----------message signal encrypted--------------//////////////  
    #10 start = 1'b1; control = 3'b110;
  #50 start = 1'b0; control = 3'b110;
  #3155;
  
    #0 message = 16'd3840;
    #10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd7680;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd7680;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3841;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd3840;
	#10 message = 16'd7680;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd3839;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3841;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3841;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd3840;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd3839;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd3841;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd3841;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd3840;
	#10 message = 16'd3839;
	#10 message = 16'd3841;
	#10 message = 16'd3841;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3841;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd7680;
	#10 message = 16'd3841;
	#10 message = 16'd3841;
	#10 message = 16'd7680;
	#10 message = 16'd1;
	#10 message = 16'd0;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd3840;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd1;
	#10 message = 16'd3839;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd3840;
	#10 message = 16'd0;
	#10 message = 16'd7680;
	#10 message = 16'd7680;
	#10 message = 16'd3841;
	#10 message = 16'd0;

//////////----------message signal encrypted--------------//////////////    
    #10 start = 1'b0; control = 3'b110;
  #50 start = 1'b0; control = 3'b110;
  #4000;
  
  #10 control = 3'b000;                                  // This is necessary for cooldown period
  #100;
  
    #10 start = 1'b1; control = 3'b111;
  #50 start = 1'b0; control = 3'b111;
  #4000;
  
    #10 start = 1'b0; control = 3'b111;
  #50 start = 1'b0; control = 3'b111;
  #4900;
  
  #10 $stop;
  end
    
endmodule
