`timescale 1ns / 1ps

module mux_ram_sel_address(
    input [7:0] PC_address,
    input [7:0] register_address,   // when start = 0 Code_address will be select
    input [7:0] Code_address,
    input start,
    input sel_STA,                   // when start = 1 PC_address will be select if sel_STA = 0
    output [7:0] address
    );
    
    and (net1, Code_address[0], ~start);
    and (net2,PC_address[0], start, ~sel_STA);
    and (net3,register_address[0], start, sel_STA);
    or (address[0], net1, net2, net3);
    
    and (net4, Code_address[1], ~start);
    and (net5,PC_address[1], start, ~sel_STA);
    and (net6,register_address[1], start, sel_STA);
    or (address[1], net4, net5, net6);
    
    and (net7, Code_address[2], ~start);
    and (net8,PC_address[2], start, ~sel_STA);
    and (net9,register_address[2], start, sel_STA);
    or (address[2], net7, net8, net9);
    
    and (net10, Code_address[3], ~start);
    and (net11,PC_address[3], start, ~sel_STA);
    and (net12,register_address[3], start, sel_STA);
    or (address[3], net10, net11, net12);
    
    and (net13, Code_address[4], ~start);
    and (net14,PC_address[4], start, ~sel_STA);
    and (net15,register_address[4], start, sel_STA);
    or (address[4], net13, net14, net15);
    
    and (net16, Code_address[5], ~start);
    and (net17,PC_address[5], start, ~sel_STA);
    and (net18,register_address[5], start, sel_STA);
    or (address[5], net16, net17, net18);
    
    and (net19, Code_address[6], ~start);
    and (net20,PC_address[6], start, ~sel_STA);
    and (net21,register_address[6], start, sel_STA);
    or (address[6], net19, net20, net21);
    
    and (net22, Code_address[7], ~start);
    and (net23,PC_address[7], start, ~sel_STA);
    and (net24,register_address[7], start, sel_STA);
    or (address[7], net22, net23, net24);
    
endmodule

module mux_ram_data_in(
    input [23:0] Code_Data,
    input [15:0] Ram_data_in,
    input start,               
    output [23:0] Data_in
    );                          // if start = 0 Code_Data is select otherwise Ram_data_in
    
    and (net0, Code_Data[0], ~start);
    and (net1, Ram_data_in[0], start);
    or (Data_in[0], net0, net1);
    
	and (net0, Code_Data[0], ~start);
	and (net1, Ram_data_in[0], start);
	or (Data_in[0], net0, net1);
	
	and (net2, Code_Data[1], ~start);
	and (net3, Ram_data_in[1], start);
	or (Data_in[1], net2, net3);
	
	and (net4, Code_Data[2], ~start);
	and (net5, Ram_data_in[2], start);
	or (Data_in[2], net4, net5);
	
	and (net6, Code_Data[3], ~start);
	and (net7, Ram_data_in[3], start);
	or (Data_in[3], net6, net7);
	
	and (net8, Code_Data[4], ~start);
	and (net9, Ram_data_in[4], start);
	or (Data_in[4], net8, net9);
	
	and (net10, Code_Data[5], ~start);
	and (net11, Ram_data_in[5], start);
	or (Data_in[5], net10, net11);
	
	and (net12, Code_Data[6], ~start);
	and (net13, Ram_data_in[6], start);
	or (Data_in[6], net12, net13);
	
	and (net14, Code_Data[7], ~start);
	and (net15, Ram_data_in[7], start);
	or (Data_in[7], net14, net15);
	
	and (net16, Code_Data[8], ~start);
	and (net17, Ram_data_in[8], start);
	or (Data_in[8], net16, net17);
	
	and (net18, Code_Data[9], ~start);
	and (net19, Ram_data_in[9], start);
	or (Data_in[9], net18, net19);
	
	and (net20, Code_Data[10], ~start);
	and (net21, Ram_data_in[10], start);
	or (Data_in[10], net20, net21);
	
	and (net22, Code_Data[11], ~start);
	and (net23, Ram_data_in[11], start);
	or (Data_in[11], net22, net23);
	
	and (net24, Code_Data[12], ~start);
	and (net25, Ram_data_in[12], start);
	or (Data_in[12], net24, net25);
	
	and (net26, Code_Data[13], ~start);
	and (net27, Ram_data_in[13], start);
	or (Data_in[13], net26, net27);
	
	and (net28, Code_Data[14], ~start);
	and (net29, Ram_data_in[14], start);
	or (Data_in[14], net28, net29);
	
	and (net30, Code_Data[15], ~start);
	and (net31, Ram_data_in[15], start);
	or (Data_in[15], net30, net31);
	
    and (Data_in[16], Code_Data[16], ~start);
    and (Data_in[17], Code_Data[17], ~start);
    and (Data_in[18], Code_Data[18], ~start);
    and (Data_in[19], Code_Data[19], ~start);
    
    and (Data_in[20], Code_Data[20], ~start);
    and (Data_in[21], Code_Data[21], ~start);
    and (Data_in[22], Code_Data[22], ~start);
    and (Data_in[23], Code_Data[23], ~start);
	
    
endmodule


module microprocessor(

    input [7:0] address_input,
    input Read_En, 
    input [23:0]Code_Data, 
    input [7:0] Code_address,
    input Write_Code,
    input start,
    input clk, preset, clear,
    output [31:0] register_A1, register_B1, register_C1, register_D1,
    output [7:0] address_output,
    output [7:0] Mne_control_I,
    output [7:0] Mne_control_II,
    output [23:0] Data,
    output  ready_flag,
    output [31:0] data_I, data_II,
    output [3:0] sel,
    output Trig,
    output smaller_flag, equal_flag, greater_flag,
    output [31:0] value,
    output Write_Enable,
    output  [23:0] Ram_data_in,
    output Read_Enable,
    output [7:0] address,
    output ready_flag_II,
    output sel_STA,
    //output reg test,
    output jump_sel,
    output clk_PC,
    output Mne_0, Mne_1
    );
    //wire [23:0] Data;
    //wire [31:0] value;

    //wire [7:0] Mne_control_I, Mne_control_II;
    wire Halt;
    //wire Read_Enable;
    wire Ram_write_en;
    //wire Trig, Tr;
    //wire ready_flag_II;
    
    //wire [7:0] address;
    wire [7:0] register_address;
    //wire sel_STA;
    
    //wire [7:0] address_output; 
    
    //wire [31:0] data_I, data_II;
    //wire [3:0] sel;
    
    
    wire s2, s1, s0;
    //wire smaller_flag, equal_flag, greater_flag;
    //wire clk_PC;
    //wire ready_flag;
    
    wire Read_Ram;
    
    
    wire [15:0] reg_data_16bit;
    wire [3:0] reg_data_sel;
    wire reg_D;
    wire [1:0] reg_data_sel_in;
    wire [31:0] reg_data_in;
    wire jump;
    
    wire [15:0] Data_in;
    //wire [23:0] Ram_data_in;
    
    or #1 (clk_PC, ~ready_flag, ready_flag_II);
    
    
    assign jump = ( ~Mne_control_II[7] & Mne_control_II[6] & ~Mne_control_II[5] & ~Mne_control_II[4] &
                  Mne_control_II[3] & Mne_control_II[2] & Mne_control_II[1] & Mne_control_II[0]);

    
     assign s2 = (Mne_control_II[7] | ~Mne_control_II[6] | ( Mne_control_II[6] & Mne_control_II[5] ));
     assign s1 = (Mne_control_II[7] | ~Mne_control_II[6] | Mne_control_II[4]);
     buf (s0 , Mne_control_II[3]);
    
    
    mux_ram_sel_address inst10 (address_output, Data[7:0], Code_address, start, sel_STA, address); //address_input in term of address_output
    
    mux_ram_data_in inst25 (Code_Data, Data_in, start, Ram_data_in);
    
    
    
    Mnemonics_control inst11 (clk, preset, start, Data[23:16], Mne_control_I, Mne_control_II, Halt, Trig, ready_flag_II, Mne_0, Mne_1);  // done
    
    ALU_Control inst0 (Mne_control_II, register_A1, register_B1, register_C1, register_D1, data_I, data_II, sel);  //done   
    
    program_counter inst2 (Data[7:0], smaller_flag, equal_flag, greater_flag,
                           s2, s1, s0, jump, clk_PC, preset, clear , address_output, jump_sel );    //  jump  almost done

    
    reg_control inst3 (ready_flag_II, reg_data_in, sel_STA, reg_D, reg_data_sel, reg_data_sel_in, Data_in,
                     Read_Enable, Write_Enable, Mne_control_I, Tr);                   //done
    
    wire Read_start;
    and (Read_start, Read_Enable, start);                 
    or (Read_Ram, Read_En, Read_start);   
                 
    or (Ram_write_en, Write_Enable, Write_Code);                  
    
    RAM inst4 (address, Ram_data_in, start, Read_Ram, Ram_write_en, Data);   // Done
    
    
    register inst5 (Data[15:0], value, ready_flag, reg_data_sel,reg_D, reg_data_sel_in, register_A1,              
                   register_B1, register_C1, register_D1,reg_data_in);                                              //done
                   
                      
    ALU inst66 (data_I, data_II, clk, preset, clear, Trig, sel, equal_flag, greater_flag, smaller_flag, ready_flag, value);   // done
    

endmodule