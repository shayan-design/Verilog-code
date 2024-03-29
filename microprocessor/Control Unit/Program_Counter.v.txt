`timescale 1ns / 1ps 

module mux_comp(
    input L, E, G, 
    input s2,s1,s0,
    output L_out, E_out, G_out, L_E_out, L_G_out, G_E_out
    );
    
    assign G_out = (G & ~s2 & ~s1 & ~s0),
           L_out = (L & ~s2 & ~s1 & s0),
           G_E_out = ((G | E) & ~s2 & s1 & ~s0),
           L_E_out = ((L | E) & ~s2 & s1 & s0),         // map with microprocessor instruction
           E_out = (E & s2 & ~s1 & ~s0),               // D[7] D[6] D[5] D[4] D[3] D[2] D[1] D[0]
           L_G_out = ((G | L) & s2 & ~s1 & s0);        //  s[2] = (D[7] | ~D[6] | (D[6] & D[5]))
                                                       //  s[1] = (D[7] | ~D[6] | D[4]);                 // s[0] = D[3];
endmodule  

module mux_mod_sel(
    input a, b, 
    input mod_sel,
    output mod_out 
    );
    
    and (net1, ~mod_sel, a);
    and (net2, mod_sel, b);
    or (mod_out, net1, net2);
    
endmodule

module mod_16 (
    input [3:0] jump_address,
    input jump_sel,
    input clk,preset,clear,
    output [3:0] Q
    );
    
    wire [3:0] D;
    wire D0, D1, D2, D3, D4;
    
    assign D0 = ~Q[0];
    assign D1 = (~Q[1] & Q[0]) | (Q[1] & ~Q[0]);
    assign D2 = (~Q[1] & Q[2]) | (Q[2] & ~Q[0]) | (Q[1] & ~Q[2] & Q[0]); 
    assign D3 = (Q[3] & ~Q[2]) | (Q[3] & ~Q[1]) | (Q[3] & ~Q[0]) | (~Q[3] & Q[2] & Q[1] & Q[0]); 
    
    mux_mod_sel inst0 (D0, jump_address[0], jump_sel, D[0]);
    mux_mod_sel inst1 (D1, jump_address[1], jump_sel, D[1]);
    mux_mod_sel inst2 (D2, jump_address[2], jump_sel, D[2]);
    mux_mod_sel inst3 (D3, jump_address[3], jump_sel, D[3]);
    
    D_FF inst10 (D[0], clk,preset,clear, Q[0]);
    D_FF inst11 (D[1], clk,preset,clear, Q[1]);
    D_FF inst12 (D[2], clk,preset,clear, Q[2]);
    D_FF inst13 (D[3], clk,preset,clear, Q[3]);
    
endmodule


module program_counter (
    input [7:0] jump_adds_data,
    input L, E, G, 
    input s2, s1, s0,
    input jump,
    input clk_PC, preset, clear,
    output reg [7:0] address_output,
    output sel 
    );
    //wire sel;
    wire clk;
    
    not (clk, clk_PC);
    
    mux_comp jump_cnd ( L, E, G, s2,s1,s0, L_out, E_out, G_out, L_E_out, L_G_out, G_E_out);
    
    or (sel, jump, L_out, E_out, G_out, L_E_out, L_G_out, G_E_out);
    
    //address_register PC (jump_adds_data, clk,preset,clear,sel, address_output);
    
    wire [7:0] test;
    
    initial
    begin
    address_output = 8'h00;
    end
    
    //wire mod_32_clk;
    wire mod_sel_clk;
    mux_mod_sel inst0 (mod_sel_clk, clk, sel, mod_32_clk);
    
    and (mod_sel_clk, ~test[3], ~test[2], ~test[1], ~test[0]);
    
    mod_16 inst32 (jump_adds_data[7:4], sel, mod_32_clk, preset, clear, test[7:4]);
    mod_16 inst16 (jump_adds_data[3:0], sel, clk, preset, clear, test[3:0]);
    
    always @ (posedge clk)
    begin
    #5;
    address_output = test;

    end
 
endmodule