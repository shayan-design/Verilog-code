`timescale 1ns / 1ps

module Kyber_512 #(
    parameter Kyber_Security = 2   //Kyber_Security should be 2, 3, 5
)(
    input clk,
    input start,         //posedge trigger for starting algorithm
    input reset,
    input [2:0] control,
    input [15:0] message,
    output loop_end,
    output reg [15:0] dec,           //decrypted message
    output [15:0] out_3,
    output [15:0] out_4,
    output read_enable_S,
    output read_enable_r,
    output [5:0] data_loop,
    output reg [7:0] i,
    output reg [7:0] j,
    output reg ready,
    output [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
                  INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15,
    output [15:0] ser_data,
    output [15:0] pol_add_sub_data,
    output [15:0] out_6,
    output reg [2:0] inner_loop,
    output reg [2:0] pol_loop,
    output reg write_enable_U,
    output read_enable_U,
    output reg [2:0] U_loop,
    output reg write_enable_t,
    output read_enable_t,
    output reg write_enable_V,
    output reg read_enable_V,
    output wire [15:0] V,
    output wire V_clk,
    output wire [15:0] t ,
    output wire [15:0] U
);
    
/* 
    control            output
      000                Hold
      100                Key Generation
      101                Encryption for U
      110                Encryption for V
      111                Decryption
*/

/* 
        Loop condition
        
   For multiplying with A then loop --------- Kyber_Security * Kyber_Security -  1 times
   
   For multiplying with t or v then loop ---- Kyber_Security -  1 times

*/
    reg [15:0] d = 16'h00;
    
    //random number generation    
    reg [15:0] rand_num; 
    reg [15:0] rand_num_small;
    
    //handling loop for 256 unit
    //reg [7:0] i;
    //reg [7:0] j;
    reg last_bit;

//////////-----------NTT clk defining intentionaly giving posedge clk with some delay-----------//////////////////   
    wire NTT_clk;
    assign #2 NTT_clk = clk;
       
    always @(posedge NTT_clk)
    begin
      j <= i;
    end
////---------------------------------------------------------------------------------------------------------------

   // reg [15:0] input_poly1;
	//reg [15:0] input_poly2;
	
    //reg ready;

    //wire [5:0] data_loop;
    
    wire [15:0] NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
           NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15;
    
        
    //wire [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
    //       INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15;
           
    Poly_mul dut(

           out_3, out_4, ready, NTT_clk, reset, data_loop,
    
           NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
           NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15,
      
           INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15
    );
    
    
    Pol_ser inst33 (
           INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15,
           
           data_loop,
           i, clk, reset, ser_data
    );
///------------------------------------------------------------------------------------------------------------



  //-------------------------------------------------------------------
  //wire loop_end;
  
  assign loop_end = data_loop[5] & data_loop[4] & data_loop[3] & data_loop[2] & data_loop[1] & data_loop[0];
  

    //reg [2:0] inner_loop;
    reg [2:0] outer_loop;

  
  always @(posedge start or posedge loop_end)
  begin
    if (Kyber_Security <= 3)
    begin
      if(start == 1'b1)
      begin
        inner_loop <= 2'b00;
        outer_loop <= 2'b00;
      end
      else
      begin
        if(inner_loop < Kyber_Security - 1)
        begin
          inner_loop <= inner_loop + 1;
        end
        
        else if(outer_loop < Kyber_Security )
        begin
          inner_loop <= 2'b00;
          outer_loop <= outer_loop + 1;
        end
      end
    end
    
    else
    begin
      if(start == 1'b1)
      begin
        inner_loop <= 3'b00;
        outer_loop <= 3'b00;
      end
      else
      begin
        if(inner_loop < Kyber_Security - 1)
        begin
          inner_loop <= inner_loop + 1;
        end
        
        else if(outer_loop < Kyber_Security - 1)
        begin
          inner_loop <= 3'b00;
          outer_loop <= outer_loop + 1;
        end
      end
    end
  end
  
  ////////////////////////////////////////////

  
      // Declare a 3D array with dimensions [3][4][5]  or row x column x depth
//Key gen parameter
    wire [15:0] A ;
    wire [15:0] S ;
    wire [15:0] r ;
    
//Enc and Dec parameter
    //wire [15:0] t ;
    //wire [15:0] U ;
    //wire [15:0] V ;

// read and write enable for register A
    wire write_enable_A;
    wire read_enable_A;
    
    assign write_enable_A = control[2] & ~control[1] & ~control[0];
    assign read_enable_A = control[2] & ~control[1] & control[0];
    
// read and write enable for register S
    wire write_enable_S;
    //wire read_enable_S;
    
    assign write_enable_S = ~outer_loop[2] & ~outer_loop[1] & ~outer_loop[0] & (control[2] & ~control[1] & ~control[0]);

    assign read_enable_S = ((outer_loop[2] | outer_loop[1] | outer_loop[0]) & (control[2] & ~control[1] & ~control[0])) | 
                            (control[2] & control[1] & control[0]);
    
// read and write enable for register r
    wire write_enable_r;
    //wire read_enable_r;
    
    assign write_enable_r = ~outer_loop[2] & ~outer_loop[1] & ~outer_loop[0] & (control[2] & ~control[1] & control[0]);
    
    assign read_enable_r = ((outer_loop[2] | outer_loop[1] | outer_loop[0]) & (control[2] & ~control[1] & control[0])) | 
                            (control[2] & control[1] & ~control[0]);

    wire [7:0] ut_i;
    assign ij_sel = control[2] & control[1];
    
    mux_2_16 inst41 (i, j, ij_sel, ut_i);
    
    wire reg_clk;
    assign reg_clk = (clk & ~ij_sel) | (~clk & ij_sel);

//module instantiation for A
A_register #(
    .Kyber_Security(Kyber_Security) //Kyber Parameter declaration
)    
     inst_A (write_enable_A, read_enable_A, loop_end, start, i, inner_loop, outer_loop, clk, out_3, A);

//module instantiation for S
rUSt_register #(
    .Kyber_Security(Kyber_Security) //Kyber Parameter declaration
)    
     inst_S (write_enable_S, read_enable_S, ut_i, inner_loop, reg_clk, out_4, S);
     
//module instantiation for r
rUSt_register #(
    .Kyber_Security(Kyber_Security) //Kyber Parameter declaration
)    
     inst_r (write_enable_r, read_enable_r, ut_i, inner_loop, reg_clk, out_3, r);
/////---------------------------------------------------

  wire [15:0] out_1;
  wire [15:0] out_2;

  mux_2_16 inst1 (rand_num_small, r, read_enable_r, out_1);       
  mux_2_16 inst2 (rand_num_small, S, read_enable_S, out_2);
  
  mux_4_16 inst3 (rand_num, out_1, r, U, control[1:0], out_3);
  mux_4_16 inst4 (out_2, A, t, S, control[1:0], out_4);
  
/////---------------------------------------------------


/////---------------- after polynomial multiplication operation -----------------------------------

  wire [15:0] out_5;
  //wire [15:0] out_6;
  wire [15:0] reg_data;
  //wire [15:0] pol_add_sub_data;
  reg mux_2_sel;
  
  //reg [2:0] pol_loop;
  reg pol_start;
  reg U_start;
  
  initial
  begin
    pol_loop <= 3'b000;
    pol_start <= 1'b0;
  end
  
  always @(posedge start)
  begin
    pol_start <= 1'b0;

    write_enable_U <= 1'b0;
    U_loop <= 3'b000;
    U_start <= 1'b0;
  end
  
  always @(posedge loop_end)
  begin
  if(pol_start == 1'b0)
    begin
      pol_loop <= 3'b000;
      pol_start <= 1'b1;
    end
    
  else if(pol_start == 1'b1)
    begin
      if(pol_loop < Kyber_Security - 1)
      begin
        pol_loop <= pol_loop + 1;
      end
      else
      begin
        pol_loop <= 3'b000;
      end
    end
  end
  
  always @(pol_loop)
  begin
    if(pol_loop == Kyber_Security - 1)
    begin
      mux_2_sel <= 1'b1;
    end
    else
    begin
      mux_2_sel <= 1'b0;
    end
  end
  
  V_register inst23 (~mux_2_sel, mux_2_sel, i, NTT_clk, pol_add_sub_data, reg_data);
  
  mux_4_16 inst20 (rand_num_small, rand_num_small, message, V, control[1:0], out_5);
  
  mux_2_16 inst21 (out_5, reg_data, mux_2_sel, out_6);
  
  Pol_add_sub inst25 (ser_data, out_6, control, clk, ready, pol_add_sub_data);

  
/////----------------- after polynomial multiplication operation ----------------------------------

/////----------------- after polynomial storing operation ----------------------------------

// read and write enable for register A
    //reg write_enable_t;
    //reg read_enable_t;
    
// read and write enable for register U
    //reg write_enable_U;
    //reg read_enable_U;
    //reg [2:0] U_loop;
    
    assign read_enable_U = control[2] & control[1] & control[0];
    assign read_enable_t = control[2] & control[1] & ~control[0];
    
    always @(posedge clk)
    begin
      if(control == 3'b100 && pol_loop == Kyber_Security - 1)
      begin
        write_enable_t <= ready;
      end
      else if(control == 3'b101 && pol_loop == Kyber_Security - 1)
      begin
        write_enable_U <= ready;
      end
      else
      begin
        write_enable_t <= 1'b0;
        write_enable_U <= 1'b0;
      end
    end
    
    always @ (negedge loop_end)
    begin
      if(control == 3'b100 && pol_loop == Kyber_Security - 1  && U_start == 1'b1)
      begin
        U_loop <= U_loop + 1;
      end
      
      else if(control == 3'b100 && pol_loop == Kyber_Security - 1)
      begin
        U_start = 1'b1;
      end
      
      else if(control == 3'b101 && pol_loop == Kyber_Security - 1 && U_start == 1'b1)
      begin
        U_loop <= U_loop + 1;
      end
      
      else if(control == 3'b101 && pol_loop == Kyber_Security - 1 )
      begin
        U_start = 1'b1;
      end
    end
    
    always @(posedge start or posedge loop_end)
    begin
      if(control == 3'b110 && U_loop < Kyber_Security )
      begin
        
        U_loop = U_loop + 1;
      end
      
      else if(control == 3'b111 && U_loop < Kyber_Security )
      begin
        U_loop = U_loop + 1;
      end

    end
    
//module instantiation for t
rUSt_register #(
    .Kyber_Security(Kyber_Security) //Kyber Parameter declaration
)    
     inst_t (write_enable_t, read_enable_t, j, U_loop, ~clk, pol_add_sub_data, t);
     
//module instantiation for U
rUSt_register #(
    .Kyber_Security(Kyber_Security) //Kyber Parameter declaration
)    
     inst_U (write_enable_U, read_enable_U, j, U_loop, ~clk, pol_add_sub_data, U);
     
//module instantiation for V

    //wire V_clk;
    assign V_clk = (clk & control[2] & control[1] & control[0]) | (~clk & control[2] & control[1] & ~control[0]);
    
    wire [7:0] V_i;
   
    wire V_i_sel = control[2] & control[1] & control[0];
    mux_2_16 inst51 (j, i, V_i_sel, V_i);
     
    //reg write_enable_V;
    //reg read_enable_V;
    
    always @ (U_loop or pol_loop)
    begin
      if(control == 3'b110 && pol_loop == Kyber_Security - 1)
      begin
        write_enable_V = 1'b1;
      end
      
      else if(control == 3'b111 && U_loop == Kyber_Security - 1)
      begin
        read_enable_V = 1'b1;
      end
      
      else
      begin
        write_enable_V = 1'b0;
        read_enable_V = 1'b0;
      end
      
    end
    
V_register inst28 (write_enable_V, read_enable_V, V_i, V_clk, pol_add_sub_data, V);
    
/////----------------- after polynomial storing operation ----------------------------------
    
    always @(control)
    begin
      if(control == 3'b000)
      begin 
        //i <= 8'h00;
        ready <= 1'b0;
        //last_bit <= 1'b0;
      end
    end
    
    always @(ut_i)
    begin
      if(ut_i == 8'h00)
      begin
        ready <= 1'b1;
      end
    end
    
    always @ (posedge start)
    begin
      i <= 8'h00;
      last_bit <= 1'b0;
      //ready <= 1'b1;
      rand_num <= $urandom_range(0, 7680);
      rand_num_small <= $urandom_range(7679, 7683);
    end
    
    always @ (posedge loop_end)
    begin
      #5 i <= 8'h00;
         last_bit <= 1'b0;
         //ready <= 1'b1;
         rand_num <= $urandom_range(0, 7680);
         rand_num_small <= $urandom_range(7679, 7683);
    end

    
    always @(negedge clk)
    begin
      if(i != 8'd255)
      begin
        rand_num <= $urandom_range(0, 7680);
        rand_num_small <= $urandom_range(7679, 7683);
        i = i + 1;
      end 
      
      else if(i == 8'd255 && last_bit == 1'b0)
      begin
        //rand_num <= $urandom_range(0, 7680);
        //rand_num_small <= $urandom_range(7679, 7683);
        last_bit <= 1'b1;
        #10 ready <= 1'b0;                         // note:-   please correct the delay value with specific time or according to clock
      end
    end
    
///////-----------------------final decryption--------------------------------/////////////

    always @(negedge clk)
    begin
      if(pol_add_sub_data >= 1920 && pol_add_sub_data <= 5760)
      begin
        dec <= 16'h0f00;
      end
      else
      begin
        dec <= 16'h0000;
      end
    end

///////-----------------------final decryption--------------------------------/////////////
    
endmodule
