`timescale 1ns / 1ps

module mux_32_16(
    
    input [31:0] a,
    input sel,
    output [15:0] b
    );
    
    
	and (net1, a[0], ~sel);
	and (net2, a[1], ~sel);
	and (net3, a[2], ~sel);
	and (net4, a[3], ~sel);
	and (net5, a[4], ~sel);
	and (net6, a[5], ~sel);
	and (net7, a[6], ~sel);
	and (net8, a[7], ~sel);
	and (net9, a[8], ~sel);
	and (net10, a[9], ~sel);
	and (net11, a[10], ~sel);
	and (net12, a[11], ~sel);
	and (net13, a[12], ~sel);
	and (net14, a[13], ~sel);
	and (net15, a[14], ~sel);
	and (net16, a[15], ~sel);
	

	and (net17, a[16], sel);
	and (net18, a[17], sel);
	and (net19, a[18], sel);
	and (net20, a[19], sel);
	and (net21, a[20], sel);
	and (net22, a[21], sel);
	and (net23, a[22], sel);
	and (net24, a[23], sel);
	and (net25, a[24], sel);
	and (net26, a[25], sel);
	and (net27, a[26], sel);
	and (net28, a[27], sel);
	and (net29, a[28], sel);
	and (net30, a[29], sel);
	and (net31, a[30], sel);
	and (net32, a[31], sel);
	
	or #1 (b[0], net1, net17);
	or #1 (b[1], net2, net18);
	or #1 (b[2], net3, net19);
	or #1 (b[3], net4, net20);
	or #1 (b[4], net5, net21);
	or #1 (b[5], net6, net22);
	or #1 (b[6], net7, net23);
	or #1 (b[7], net8, net24);
	or #1 (b[8], net9, net25);
	or #1 (b[9], net10, net26);
	or #1 (b[10], net11, net27);
	or #1 (b[11], net12, net28);
	or #1 (b[12], net13, net29);
	or #1 (b[13], net14, net30);
	or #1 (b[14], net15, net31);
	or #1 (b[15], net16, net32);


    
endmodule 

module reg_control(
    input ready_flag_II,
    input [31:0] reg_data_in,    // input
    output reg sel_sta,
    output reg pulse,
    output reg [3:0] reg_data_sel,
    output [1:0] reg_data_sel_in,
    
    
    output [15:0] Ram_data_in,
    output reg Read_Enable, Write_Enable,
    
    input [7:0] Mne_control_I,    // input
    
    output reg Trig
    );
   
    wire reg_D;
    
    initial
    begin
    pulse = 1'b0;
    Read_Enable = 1'b1;
    Write_Enable = 1'b0;
    sel_sta = 1'b0;
    end
    
    and (reg_D, ~Mne_control_I[7], ~Mne_control_I[6], ~Mne_control_I[5], ~Mne_control_I[4]);
    
    always @ (Mne_control_I)
    begin
      case ({Mne_control_I[6], Mne_control_I[5], Mne_control_I[4]})
      3'b000:  reg_data_sel = ({Mne_control_I[3], Mne_control_I[2], Mne_control_I[1], Mne_control_I[0]});      // for LDA operation purpose 
      3'b110:  reg_data_sel = 4'b0000;
      default:  reg_data_sel = 4'b0000;
      endcase
      
      if (reg_D == 1 && Mne_control_I[3] == 1 && Mne_control_I[2] == 0 && Mne_control_I[1] == 0 && Mne_control_I[0] == 0)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end   
      
      else if (reg_D == 1 && Mne_control_I[2] == 0 && Mne_control_I[1] == 0 && Mne_control_I[0] == 1)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end  
      
      else if (reg_D == 1 && Mne_control_I[2] == 0 && Mne_control_I[1] == 1 && Mne_control_I[0] == 0)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end 
      
      else if (reg_D == 1 && Mne_control_I[2] == 0 && Mne_control_I[1] == 1 && Mne_control_I[0] == 1)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end
      
      else if (reg_D == 1 && Mne_control_I[2] == 1 && Mne_control_I[1] == 0 && Mne_control_I[0] == 0)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end   
      
      else if (reg_D == 1 && Mne_control_I[2] == 1 && Mne_control_I[1] == 0 && Mne_control_I[0] == 1)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end  
      
      else if (reg_D == 1 && Mne_control_I[2] == 1 && Mne_control_I[1] == 1 && Mne_control_I[0] == 0)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end 
      
      else if (reg_D == 1 && Mne_control_I[2] == 1 && Mne_control_I[1] == 1 && Mne_control_I[0] == 1)
      begin
        #1 pulse = 1'b1;
        #2 pulse = 1'b0;
      end
    end
    
    always @ (Mne_control_I)
    begin
      if (Mne_control_I[5] == 1 && Mne_control_I[4] == 1&& Mne_control_I[3] == 0)
      #1 sel_sta = 1'b1;
      #20 sel_sta = 1'b0;
    end
    //and #1 (sel_sta, Mne_control_I[5], Mne_control_I[4], ~Mne_control_I[3] );
    
    and (reg_data_sel_in[1], Mne_control_I[5], Mne_control_I[4], ~Mne_control_I[3], Mne_control_I[2]);          // for STA operation purpose 
    and (reg_data_sel_in[0], Mne_control_I[5], Mne_control_I[4], ~Mne_control_I[3], Mne_control_I[1]);          // for STA operation purpose 
    
    always @ (Mne_control_I or sel_sta )
    begin
    
      if (Mne_control_I[5] == 1'b1 && Mne_control_I[4] == 1'b1 &&  Mne_control_I[3] == 1'b0 && sel_sta == 1'b1)
        begin
         #0 Read_Enable = 1'b0; Write_Enable = 1'b1;
         #15 Write_Enable = 1'b0;                     //time decide to which read and write decide
      end
    end
    
    always @ (ready_flag_II)
      begin
      #10 Read_Enable = 1'b1;
      end
    
    
mux_32_16 inst0 (reg_data_in, Mne_control_I[0], Ram_data_in);
    
endmodule