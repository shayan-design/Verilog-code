`timescale 1ns / 1ps

module Mnemonics_control (
    input clk, preset,
    input start,
    input [7:0] Mnemonics,
    output [7:0] Mne_control_I, Mne_control_II,
    output Halt,
    output reg Trig, ready_flag_II,
    output s0, s1
    );
    
    initial
    begin
      Trig = 1'b0;
      ready_flag_II = 1'b0;
    end
    
    and (Halt, Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]);
    
    //wire s0, s1;
    
    
    or (s1, Mnemonics[7], Mnemonics[6]);
    or (s0, Mnemonics[7], Mnemonics[6]);
    
    //
    D_FF inst0 (Mnemonics[7], clk, preset, s0, Mne_control_I[7]);
    D_FF inst1 (Mnemonics[6], clk, preset, s0, Mne_control_I[6]);
    D_FF inst2 (Mnemonics[5], clk, preset, s0, Mne_control_I[5]);
    D_FF inst3 (Mnemonics[4], clk, preset, s0, Mne_control_I[4]);
   
    D_FF inst4 (Mnemonics[3], clk, preset, s0, Mne_control_I[3]);
    D_FF inst5 (Mnemonics[2], clk, preset, s0, Mne_control_I[2]);
    D_FF inst6 (Mnemonics[1], clk, preset, s0, Mne_control_I[1]);
    D_FF inst7 (Mnemonics[0], clk, preset, s0, Mne_control_I[0]);
    //
    
    /*
    and (Mne_control_I[7], Mnemonics[7], s0);
    and (Mne_control_I[6], Mnemonics[6], s0);
    and (Mne_control_I[5], Mnemonics[5], s0);
    and (Mne_control_I[4], Mnemonics[4], s0);
    and (Mne_control_I[3], Mnemonics[3], s0);
    and (Mne_control_I[2], Mnemonics[2], s0);
    and (Mne_control_I[1], Mnemonics[1], s0);
    and (Mne_control_I[0], Mnemonics[0], s0);
    */
    
    and (Mne_control_II[7], Mnemonics[7], s1);
    and (Mne_control_II[6], Mnemonics[6], s1);
    and (Mne_control_II[5], Mnemonics[5], s1);
    and (Mne_control_II[4], Mnemonics[4], s1);
    and (Mne_control_II[3], Mnemonics[3], s1);
    and (Mne_control_II[2], Mnemonics[2], s1);
    and (Mne_control_II[1], Mnemonics[1], s1);
    and (Mne_control_II[0], Mnemonics[0], s1);
    

    always @ (start or Mnemonics)
    begin
      
      if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0000 )
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0001 )
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0010 )
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0011 )
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0100)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end 
      /*  
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0101)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0110)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0111)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5]} == 3'b101)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5]} == 3'b110)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4], Mnemonics[3]} == 5'b10011)
        begin
          #1 Trig = 1'b1;
          #200 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4], Mnemonics[3]} == 5'b10010)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b1000)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b1001)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
       */   
    end
    
    always @ (start or Mnemonics)
    begin
        if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0101)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0110)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b0111)
        begin
          #0 ready_flag_II = 1'b0;
          #30 ready_flag_II = 1'b1;
          #20 ready_flag_II = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5]} == 3'b101)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5]} == 3'b110)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4], Mnemonics[3]} == 5'b10011)
        begin
          #1 Trig = 1'b1;
          #200 Trig = 1'b0;
        end 
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4], Mnemonics[3]} == 5'b10010)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b1000)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
        
        else if (start == 1'b1 &&  {Mnemonics[7], Mnemonics[6], Mnemonics[5], Mnemonics[4]} == 4'b1001)
        begin
          #1 Trig = 1'b1;
          #10 Trig = 1'b0;
        end
    end
    
endmodule