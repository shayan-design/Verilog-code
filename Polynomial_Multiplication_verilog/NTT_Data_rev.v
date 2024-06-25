`timescale 1ns / 1ps

module Data_rev(

    input [15:0] serial_data,
	
	input [15:0] BU_data_0, BU_data_1, BU_data_2, BU_data_3, BU_data_4, BU_data_5,    //output data from BU unit to input in data_rec
	             BU_data_6, BU_data_7, BU_data_8, BU_data_9, BU_data_10, BU_data_11,
	             BU_data_12, BU_data_13, BU_data_14, BU_data_15,
    
    input start,   
    input clk,     
    output reg switch,  
    output reg [5:0] data_loop,
    
    output reg [15:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7,
                      out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15
);

 reg [15:0] NTT_ROM [255:0];
 
 always @(posedge  clk)
 begin
    if(!switch && !start)
    begin
       out_0 <= NTT_ROM[0]; out_1 <= NTT_ROM[1]; out_2 <= NTT_ROM[2]; out_3 <= NTT_ROM[3];
       out_4 <= NTT_ROM[4]; out_5 <= NTT_ROM[5]; out_6 <= NTT_ROM[6]; out_7 <= NTT_ROM[7];
       out_8 <= NTT_ROM[8]; out_9 <= NTT_ROM[9]; out_10 <= NTT_ROM[10]; out_11 <= NTT_ROM[11];
       out_12 <= NTT_ROM[12]; out_13 <= NTT_ROM[13]; out_14 <= NTT_ROM[14]; out_15 <= NTT_ROM[15];
    end
    
    else if(switch && !start)
    begin
      out_0 <= NTT_ROM[0];  out_1 <= NTT_ROM[16]; out_2 <= NTT_ROM[32]; out_3 <= NTT_ROM[48];
      out_4 <= NTT_ROM[64];  out_5 <= NTT_ROM[80]; out_6 <= NTT_ROM[96]; out_7 <= NTT_ROM[112];
      out_8 <= NTT_ROM[128];  out_9 <= NTT_ROM[144]; out_10 <= NTT_ROM[160]; out_11 <= NTT_ROM[176];
      out_12 <= NTT_ROM[192];  out_13 <= NTT_ROM[208]; out_14 <= NTT_ROM[224]; out_15 <= NTT_ROM[240];
    end
   
 end 
 
//////////////////////////////////////////////////////////////////////////////////////////////////

reg loading;

reg [3:0] data_index [15:0]; 

reg [3:0] i, j;

initial begin
   data_index[0] = 4'd0;
   data_index[1] = 4'd8;
   data_index[2] = 4'd4;
   data_index[3] = 4'd12;
  
   data_index[4] = 4'd2;
   data_index[5] = 4'd10;
   data_index[6] = 4'd6;
   data_index[7] = 4'd14;
 
   data_index[8] = 4'd1;
   data_index[9] = 4'd9;
   data_index[10] = 4'd5;
   data_index[11] = 4'd13;
 
   data_index[12] = 4'd3;
   data_index[13] = 4'd11;
   data_index[14] = 4'd7;
   data_index[15] = 4'd15;
end

always @(posedge start)
begin
    i <= 4'h0;
    j <= 4'h0;
    
    loading <= 1'b1;
end

always@ (posedge clk)
begin
  if(start && loading)
  begin
    NTT_ROM[data_index[i] + (data_index[j] * 16)] = serial_data;
    if(i != 4'hf)
    begin
      if(j != 4'hf)
      begin
        j <= j + 1;
      end
      else
      begin
        j <= 4'h0;
        i <= i + 1;
      end
    end
    else if(i == 4'hf && j != 4'hf)
    begin
      j <= j + 1;
    end
    
    else if(i == 4'hf && j == 4'hf)
    begin
      loading <= 1'b0;
    end
  end  

end
 //////////////////////////////////////////////////////////////////////////////////////////////////

always@ (posedge clk)
begin
    if(!switch && !start)
    begin
      NTT_ROM[0] <= NTT_ROM[16]; NTT_ROM[1] <= NTT_ROM[17]; NTT_ROM[2] <= NTT_ROM[18]; NTT_ROM[3] <= NTT_ROM[19];

      NTT_ROM[4] <= NTT_ROM[20]; NTT_ROM[5] <= NTT_ROM[21]; NTT_ROM[6] <= NTT_ROM[22]; NTT_ROM[7] <= NTT_ROM[23];
    
      NTT_ROM[8] <= NTT_ROM[24]; NTT_ROM[9] <= NTT_ROM[25]; NTT_ROM[10] <= NTT_ROM[26]; NTT_ROM[11] <= NTT_ROM[27];
    
      NTT_ROM[12] <= NTT_ROM[28]; NTT_ROM[13] <= NTT_ROM[29]; NTT_ROM[14] <= NTT_ROM[30]; NTT_ROM[15] <= NTT_ROM[31];
    
      NTT_ROM[16] <= NTT_ROM[32]; NTT_ROM[17] <= NTT_ROM[33]; NTT_ROM[18] <= NTT_ROM[34]; NTT_ROM[19] <= NTT_ROM[35];
    
      NTT_ROM[20] <= NTT_ROM[36]; NTT_ROM[21] <= NTT_ROM[37]; NTT_ROM[22] <= NTT_ROM[38]; NTT_ROM[23] <= NTT_ROM[39];
    
      NTT_ROM[24] <= NTT_ROM[40]; NTT_ROM[25] <= NTT_ROM[41]; NTT_ROM[26] <= NTT_ROM[42]; NTT_ROM[27] <= NTT_ROM[43];
    
      NTT_ROM[28] <= NTT_ROM[44]; NTT_ROM[29] <= NTT_ROM[45]; NTT_ROM[30] <= NTT_ROM[46]; NTT_ROM[31] <= NTT_ROM[47];
    
      NTT_ROM[32] <= NTT_ROM[48]; NTT_ROM[33] <= NTT_ROM[49]; NTT_ROM[34] <= NTT_ROM[50]; NTT_ROM[35] <= NTT_ROM[51];
    
      NTT_ROM[36] <= NTT_ROM[52]; NTT_ROM[37] <= NTT_ROM[53]; NTT_ROM[38] <= NTT_ROM[54]; NTT_ROM[39] <= NTT_ROM[55];
    
      NTT_ROM[40] <= NTT_ROM[56]; NTT_ROM[41] <= NTT_ROM[57]; NTT_ROM[42] <= NTT_ROM[58]; NTT_ROM[43] <= NTT_ROM[59];
    
      NTT_ROM[44] <= NTT_ROM[60]; NTT_ROM[45] <= NTT_ROM[61]; NTT_ROM[46] <= NTT_ROM[62]; NTT_ROM[47] <= NTT_ROM[63];
    
      NTT_ROM[48] <= NTT_ROM[64]; NTT_ROM[49] <= NTT_ROM[65]; NTT_ROM[50] <= NTT_ROM[66]; NTT_ROM[51] <= NTT_ROM[67];
    
      NTT_ROM[52] <= NTT_ROM[68]; NTT_ROM[53] <= NTT_ROM[69]; NTT_ROM[54] <= NTT_ROM[70]; NTT_ROM[55] <= NTT_ROM[71];
    
      NTT_ROM[56] <= NTT_ROM[72]; NTT_ROM[57] <= NTT_ROM[73]; NTT_ROM[58] <= NTT_ROM[74]; NTT_ROM[59] <= NTT_ROM[75];
    
      NTT_ROM[60] <= NTT_ROM[76]; NTT_ROM[61] <= NTT_ROM[77]; NTT_ROM[62] <= NTT_ROM[78]; NTT_ROM[63] <= NTT_ROM[79];
    
      NTT_ROM[64] <= NTT_ROM[80]; NTT_ROM[65] <= NTT_ROM[81]; NTT_ROM[66] <= NTT_ROM[82]; NTT_ROM[67] <= NTT_ROM[83];
    
      NTT_ROM[68] <= NTT_ROM[84]; NTT_ROM[69] <= NTT_ROM[85]; NTT_ROM[70] <= NTT_ROM[86]; NTT_ROM[71] <= NTT_ROM[87];
    
      NTT_ROM[72] <= NTT_ROM[88]; NTT_ROM[73] <= NTT_ROM[89]; NTT_ROM[74] <= NTT_ROM[90]; NTT_ROM[75] <= NTT_ROM[91];
    
      NTT_ROM[76] <= NTT_ROM[92]; NTT_ROM[77] <= NTT_ROM[93]; NTT_ROM[78] <= NTT_ROM[94]; NTT_ROM[79] <= NTT_ROM[95];
    
      NTT_ROM[80] <= NTT_ROM[96]; NTT_ROM[81] <= NTT_ROM[97]; NTT_ROM[82] <= NTT_ROM[98]; NTT_ROM[83] <= NTT_ROM[99];
    
      NTT_ROM[84] <= NTT_ROM[100]; NTT_ROM[85] <= NTT_ROM[101]; NTT_ROM[86] <= NTT_ROM[102]; NTT_ROM[87] <= NTT_ROM[103];
    
      NTT_ROM[88] <= NTT_ROM[104]; NTT_ROM[89] <= NTT_ROM[105]; NTT_ROM[90] <= NTT_ROM[106]; NTT_ROM[91] <= NTT_ROM[107];
    
      NTT_ROM[92] <= NTT_ROM[108]; NTT_ROM[93] <= NTT_ROM[109]; NTT_ROM[94] <= NTT_ROM[110]; NTT_ROM[95] <= NTT_ROM[111];
    
      NTT_ROM[96] <= NTT_ROM[112]; NTT_ROM[97] <= NTT_ROM[113]; NTT_ROM[98] <= NTT_ROM[114]; NTT_ROM[99] <= NTT_ROM[115];
    
      NTT_ROM[100] <= NTT_ROM[116]; NTT_ROM[101] <= NTT_ROM[117]; NTT_ROM[102] <= NTT_ROM[118]; NTT_ROM[103] <= NTT_ROM[119];
    
      NTT_ROM[104] <= NTT_ROM[120]; NTT_ROM[105] <= NTT_ROM[121]; NTT_ROM[106] <= NTT_ROM[122]; NTT_ROM[107] <= NTT_ROM[123];
    
      NTT_ROM[108] <= NTT_ROM[124]; NTT_ROM[109] <= NTT_ROM[125]; NTT_ROM[110] <= NTT_ROM[126]; NTT_ROM[111] <= NTT_ROM[127];
    
      NTT_ROM[112] <= NTT_ROM[128]; NTT_ROM[113] <= NTT_ROM[129]; NTT_ROM[114] <= NTT_ROM[130]; NTT_ROM[115] <= NTT_ROM[131];
    
      NTT_ROM[116] <= NTT_ROM[132]; NTT_ROM[117] <= NTT_ROM[133]; NTT_ROM[118] <= NTT_ROM[134]; NTT_ROM[119] <= NTT_ROM[135];
    
      NTT_ROM[120] <= NTT_ROM[136]; NTT_ROM[121] <= NTT_ROM[137]; NTT_ROM[122] <= NTT_ROM[138]; NTT_ROM[123] <= NTT_ROM[139];
    
      NTT_ROM[124] <= NTT_ROM[140]; NTT_ROM[125] <= NTT_ROM[141]; NTT_ROM[126] <= NTT_ROM[142]; NTT_ROM[127] <= NTT_ROM[143];
    
      NTT_ROM[128] <= NTT_ROM[144]; NTT_ROM[129] <= NTT_ROM[145]; NTT_ROM[130] <= NTT_ROM[146]; NTT_ROM[131] <= NTT_ROM[147];
    
      NTT_ROM[132] <= NTT_ROM[148]; NTT_ROM[133] <= NTT_ROM[149]; NTT_ROM[134] <= NTT_ROM[150]; NTT_ROM[135] <= NTT_ROM[151];
    
      NTT_ROM[136] <= NTT_ROM[152]; NTT_ROM[137] <= NTT_ROM[153]; NTT_ROM[138] <= NTT_ROM[154]; NTT_ROM[139] <= NTT_ROM[155];
    
      NTT_ROM[140] <= NTT_ROM[156]; NTT_ROM[141] <= NTT_ROM[157]; NTT_ROM[142] <= NTT_ROM[158]; NTT_ROM[143] <= NTT_ROM[159];
    
      NTT_ROM[144] <= NTT_ROM[160]; NTT_ROM[145] <= NTT_ROM[161]; NTT_ROM[146] <= NTT_ROM[162]; NTT_ROM[147] <= NTT_ROM[163];
    
      NTT_ROM[148] <= NTT_ROM[164]; NTT_ROM[149] <= NTT_ROM[165]; NTT_ROM[150] <= NTT_ROM[166]; NTT_ROM[151] <= NTT_ROM[167];
    
      NTT_ROM[152] <= NTT_ROM[168]; NTT_ROM[153] <= NTT_ROM[169]; NTT_ROM[154] <= NTT_ROM[170]; NTT_ROM[155] <= NTT_ROM[171];
    
      NTT_ROM[156] <= NTT_ROM[172]; NTT_ROM[157] <= NTT_ROM[173]; NTT_ROM[158] <= NTT_ROM[174]; NTT_ROM[159] <= NTT_ROM[175];
    
      NTT_ROM[160] <= NTT_ROM[176]; NTT_ROM[161] <= NTT_ROM[177]; NTT_ROM[162] <= NTT_ROM[178]; NTT_ROM[163] <= NTT_ROM[179];
    
      NTT_ROM[164] <= NTT_ROM[180]; NTT_ROM[165] <= NTT_ROM[181]; NTT_ROM[166] <= NTT_ROM[182]; NTT_ROM[167] <= NTT_ROM[183];
    
      NTT_ROM[168] <= NTT_ROM[184]; NTT_ROM[169] <= NTT_ROM[185]; NTT_ROM[170] <= NTT_ROM[186]; NTT_ROM[171] <= NTT_ROM[187];
    
      NTT_ROM[172] <= NTT_ROM[188]; NTT_ROM[173] <= NTT_ROM[189]; NTT_ROM[174] <= NTT_ROM[190]; NTT_ROM[175] <= NTT_ROM[191];
    
      NTT_ROM[176] <= NTT_ROM[192]; NTT_ROM[177] <= NTT_ROM[193]; NTT_ROM[178] <= NTT_ROM[194]; NTT_ROM[179] <= NTT_ROM[195];
    
      NTT_ROM[180] <= NTT_ROM[196]; NTT_ROM[181] <= NTT_ROM[197]; NTT_ROM[182] <= NTT_ROM[198]; NTT_ROM[183] <= NTT_ROM[199];
    
      NTT_ROM[184] <= NTT_ROM[200]; NTT_ROM[185] <= NTT_ROM[201]; NTT_ROM[186] <= NTT_ROM[202]; NTT_ROM[187] <= NTT_ROM[203];
    
      NTT_ROM[188] <= NTT_ROM[204]; NTT_ROM[189] <= NTT_ROM[205]; NTT_ROM[190] <= NTT_ROM[206]; NTT_ROM[191] <= NTT_ROM[207];
    
      NTT_ROM[192] <= NTT_ROM[208]; NTT_ROM[193] <= NTT_ROM[209]; NTT_ROM[194] <= NTT_ROM[210]; NTT_ROM[195] <= NTT_ROM[211];
    
      NTT_ROM[196] <= NTT_ROM[212]; NTT_ROM[197] <= NTT_ROM[213]; NTT_ROM[198] <= NTT_ROM[214]; NTT_ROM[199] <= NTT_ROM[215];
    
      NTT_ROM[200] <= NTT_ROM[216]; NTT_ROM[201] <= NTT_ROM[217]; NTT_ROM[202] <= NTT_ROM[218]; NTT_ROM[203] <= NTT_ROM[219];
    
      NTT_ROM[204] <= NTT_ROM[220]; NTT_ROM[205] <= NTT_ROM[221]; NTT_ROM[206] <= NTT_ROM[222]; NTT_ROM[207] <= NTT_ROM[223];
    
      NTT_ROM[208] <= NTT_ROM[224]; NTT_ROM[209] <= NTT_ROM[225]; NTT_ROM[210] <= NTT_ROM[226]; NTT_ROM[211] <= NTT_ROM[227];
    
      NTT_ROM[212] <= NTT_ROM[228]; NTT_ROM[213] <= NTT_ROM[229]; NTT_ROM[214] <= NTT_ROM[230]; NTT_ROM[215] <= NTT_ROM[231];
    
      NTT_ROM[216] <= NTT_ROM[232]; NTT_ROM[217] <= NTT_ROM[233]; NTT_ROM[218] <= NTT_ROM[234]; NTT_ROM[219] <= NTT_ROM[235];
    
      NTT_ROM[220] <= NTT_ROM[236]; NTT_ROM[221] <= NTT_ROM[237]; NTT_ROM[222] <= NTT_ROM[238]; NTT_ROM[223] <= NTT_ROM[239];
    
      NTT_ROM[224] <= NTT_ROM[240]; NTT_ROM[225] <= NTT_ROM[241]; NTT_ROM[226] <= NTT_ROM[242]; NTT_ROM[227] <= NTT_ROM[243];
    
      NTT_ROM[228] <= NTT_ROM[244]; NTT_ROM[229] <= NTT_ROM[245]; NTT_ROM[230] <= NTT_ROM[246]; NTT_ROM[231] <= NTT_ROM[247];
    
      NTT_ROM[232] <= NTT_ROM[248]; NTT_ROM[233] <= NTT_ROM[249]; NTT_ROM[234] <= NTT_ROM[250]; NTT_ROM[235] <= NTT_ROM[251];
    
      NTT_ROM[236] <= NTT_ROM[252]; NTT_ROM[237] <= NTT_ROM[253]; NTT_ROM[238] <= NTT_ROM[254]; NTT_ROM[239] <= NTT_ROM[255];
    end
    else if(switch && !start)
    begin
      
	NTT_ROM[0] <= NTT_ROM[1]; NTT_ROM[16] <= NTT_ROM[17]; NTT_ROM[32] <= NTT_ROM[33]; NTT_ROM[48] <= NTT_ROM[49];

	NTT_ROM[64] <= NTT_ROM[65]; NTT_ROM[80] <= NTT_ROM[81]; NTT_ROM[96] <= NTT_ROM[97]; NTT_ROM[112] <= NTT_ROM[113];

	NTT_ROM[128] <= NTT_ROM[129]; NTT_ROM[144] <= NTT_ROM[145]; NTT_ROM[160] <= NTT_ROM[161]; NTT_ROM[176] <= NTT_ROM[177];

	NTT_ROM[192] <= NTT_ROM[193]; NTT_ROM[208] <= NTT_ROM[209]; NTT_ROM[224] <= NTT_ROM[225]; NTT_ROM[240] <= NTT_ROM[241];

	NTT_ROM[1] <= NTT_ROM[2]; NTT_ROM[17] <= NTT_ROM[18]; NTT_ROM[33] <= NTT_ROM[34]; NTT_ROM[49] <= NTT_ROM[50];

	NTT_ROM[65] <= NTT_ROM[66]; NTT_ROM[81] <= NTT_ROM[82]; NTT_ROM[97] <= NTT_ROM[98]; NTT_ROM[113] <= NTT_ROM[114];

	NTT_ROM[129] <= NTT_ROM[130]; NTT_ROM[145] <= NTT_ROM[146]; NTT_ROM[161] <= NTT_ROM[162]; NTT_ROM[177] <= NTT_ROM[178];

	NTT_ROM[193] <= NTT_ROM[194]; NTT_ROM[209] <= NTT_ROM[210]; NTT_ROM[225] <= NTT_ROM[226]; NTT_ROM[241] <= NTT_ROM[242];

	NTT_ROM[2] <= NTT_ROM[3]; NTT_ROM[18] <= NTT_ROM[19]; NTT_ROM[34] <= NTT_ROM[35]; NTT_ROM[50] <= NTT_ROM[51];

	NTT_ROM[66] <= NTT_ROM[67]; NTT_ROM[82] <= NTT_ROM[83]; NTT_ROM[98] <= NTT_ROM[99]; NTT_ROM[114] <= NTT_ROM[115];

	NTT_ROM[130] <= NTT_ROM[131]; NTT_ROM[146] <= NTT_ROM[147]; NTT_ROM[162] <= NTT_ROM[163]; NTT_ROM[178] <= NTT_ROM[179];

	NTT_ROM[194] <= NTT_ROM[195]; NTT_ROM[210] <= NTT_ROM[211]; NTT_ROM[226] <= NTT_ROM[227]; NTT_ROM[242] <= NTT_ROM[243];

	NTT_ROM[3] <= NTT_ROM[4]; NTT_ROM[19] <= NTT_ROM[20]; NTT_ROM[35] <= NTT_ROM[36]; NTT_ROM[51] <= NTT_ROM[52];

	NTT_ROM[67] <= NTT_ROM[68]; NTT_ROM[83] <= NTT_ROM[84]; NTT_ROM[99] <= NTT_ROM[100]; NTT_ROM[115] <= NTT_ROM[116];

	NTT_ROM[131] <= NTT_ROM[132]; NTT_ROM[147] <= NTT_ROM[148]; NTT_ROM[163] <= NTT_ROM[164]; NTT_ROM[179] <= NTT_ROM[180];

	NTT_ROM[195] <= NTT_ROM[196]; NTT_ROM[211] <= NTT_ROM[212]; NTT_ROM[227] <= NTT_ROM[228]; NTT_ROM[243] <= NTT_ROM[244];

	NTT_ROM[4] <= NTT_ROM[5]; NTT_ROM[20] <= NTT_ROM[21]; NTT_ROM[36] <= NTT_ROM[37]; NTT_ROM[52] <= NTT_ROM[53];

	NTT_ROM[68] <= NTT_ROM[69]; NTT_ROM[84] <= NTT_ROM[85]; NTT_ROM[100] <= NTT_ROM[101]; NTT_ROM[116] <= NTT_ROM[117];

	NTT_ROM[132] <= NTT_ROM[133]; NTT_ROM[148] <= NTT_ROM[149]; NTT_ROM[164] <= NTT_ROM[165]; NTT_ROM[180] <= NTT_ROM[181];

	NTT_ROM[196] <= NTT_ROM[197]; NTT_ROM[212] <= NTT_ROM[213]; NTT_ROM[228] <= NTT_ROM[229]; NTT_ROM[244] <= NTT_ROM[245];

	NTT_ROM[5] <= NTT_ROM[6]; NTT_ROM[21] <= NTT_ROM[22]; NTT_ROM[37] <= NTT_ROM[38]; NTT_ROM[53] <= NTT_ROM[54];

	NTT_ROM[69] <= NTT_ROM[70]; NTT_ROM[85] <= NTT_ROM[86]; NTT_ROM[101] <= NTT_ROM[102]; NTT_ROM[117] <= NTT_ROM[118];

	NTT_ROM[133] <= NTT_ROM[134]; NTT_ROM[149] <= NTT_ROM[150]; NTT_ROM[165] <= NTT_ROM[166]; NTT_ROM[181] <= NTT_ROM[182];

	NTT_ROM[197] <= NTT_ROM[198]; NTT_ROM[213] <= NTT_ROM[214]; NTT_ROM[229] <= NTT_ROM[230]; NTT_ROM[245] <= NTT_ROM[246];

	NTT_ROM[6] <= NTT_ROM[7]; NTT_ROM[22] <= NTT_ROM[23]; NTT_ROM[38] <= NTT_ROM[39]; NTT_ROM[54] <= NTT_ROM[55];

	NTT_ROM[70] <= NTT_ROM[71]; NTT_ROM[86] <= NTT_ROM[87]; NTT_ROM[102] <= NTT_ROM[103]; NTT_ROM[118] <= NTT_ROM[119];

	NTT_ROM[134] <= NTT_ROM[135]; NTT_ROM[150] <= NTT_ROM[151]; NTT_ROM[166] <= NTT_ROM[167]; NTT_ROM[182] <= NTT_ROM[183];

	NTT_ROM[198] <= NTT_ROM[199]; NTT_ROM[214] <= NTT_ROM[215]; NTT_ROM[230] <= NTT_ROM[231]; NTT_ROM[246] <= NTT_ROM[247];

	NTT_ROM[7] <= NTT_ROM[8]; NTT_ROM[23] <= NTT_ROM[24]; NTT_ROM[39] <= NTT_ROM[40]; NTT_ROM[55] <= NTT_ROM[56];

	NTT_ROM[71] <= NTT_ROM[72]; NTT_ROM[87] <= NTT_ROM[88]; NTT_ROM[103] <= NTT_ROM[104]; NTT_ROM[119] <= NTT_ROM[120];

	NTT_ROM[135] <= NTT_ROM[136]; NTT_ROM[151] <= NTT_ROM[152]; NTT_ROM[167] <= NTT_ROM[168]; NTT_ROM[183] <= NTT_ROM[184];

	NTT_ROM[199] <= NTT_ROM[200]; NTT_ROM[215] <= NTT_ROM[216]; NTT_ROM[231] <= NTT_ROM[232]; NTT_ROM[247] <= NTT_ROM[248];

	NTT_ROM[8] <= NTT_ROM[9]; NTT_ROM[24] <= NTT_ROM[25]; NTT_ROM[40] <= NTT_ROM[41]; NTT_ROM[56] <= NTT_ROM[57];

	NTT_ROM[72] <= NTT_ROM[73]; NTT_ROM[88] <= NTT_ROM[89]; NTT_ROM[104] <= NTT_ROM[105]; NTT_ROM[120] <= NTT_ROM[121];

	NTT_ROM[136] <= NTT_ROM[137]; NTT_ROM[152] <= NTT_ROM[153]; NTT_ROM[168] <= NTT_ROM[169]; NTT_ROM[184] <= NTT_ROM[185];

	NTT_ROM[200] <= NTT_ROM[201]; NTT_ROM[216] <= NTT_ROM[217]; NTT_ROM[232] <= NTT_ROM[233]; NTT_ROM[248] <= NTT_ROM[249];

	NTT_ROM[9] <= NTT_ROM[10]; NTT_ROM[25] <= NTT_ROM[26]; NTT_ROM[41] <= NTT_ROM[42]; NTT_ROM[57] <= NTT_ROM[58];

	NTT_ROM[73] <= NTT_ROM[74]; NTT_ROM[89] <= NTT_ROM[90]; NTT_ROM[105] <= NTT_ROM[106]; NTT_ROM[121] <= NTT_ROM[122];

	NTT_ROM[137] <= NTT_ROM[138]; NTT_ROM[153] <= NTT_ROM[154]; NTT_ROM[169] <= NTT_ROM[170]; NTT_ROM[185] <= NTT_ROM[186];

	NTT_ROM[201] <= NTT_ROM[202]; NTT_ROM[217] <= NTT_ROM[218]; NTT_ROM[233] <= NTT_ROM[234]; NTT_ROM[249] <= NTT_ROM[250];

	NTT_ROM[10] <= NTT_ROM[11]; NTT_ROM[26] <= NTT_ROM[27]; NTT_ROM[42] <= NTT_ROM[43]; NTT_ROM[58] <= NTT_ROM[59];

	NTT_ROM[74] <= NTT_ROM[75]; NTT_ROM[90] <= NTT_ROM[91]; NTT_ROM[106] <= NTT_ROM[107]; NTT_ROM[122] <= NTT_ROM[123];

	NTT_ROM[138] <= NTT_ROM[139]; NTT_ROM[154] <= NTT_ROM[155]; NTT_ROM[170] <= NTT_ROM[171]; NTT_ROM[186] <= NTT_ROM[187];

	NTT_ROM[202] <= NTT_ROM[203]; NTT_ROM[218] <= NTT_ROM[219]; NTT_ROM[234] <= NTT_ROM[235]; NTT_ROM[250] <= NTT_ROM[251];

	NTT_ROM[11] <= NTT_ROM[12]; NTT_ROM[27] <= NTT_ROM[28]; NTT_ROM[43] <= NTT_ROM[44]; NTT_ROM[59] <= NTT_ROM[60];

	NTT_ROM[75] <= NTT_ROM[76]; NTT_ROM[91] <= NTT_ROM[92]; NTT_ROM[107] <= NTT_ROM[108]; NTT_ROM[123] <= NTT_ROM[124];

	NTT_ROM[139] <= NTT_ROM[140]; NTT_ROM[155] <= NTT_ROM[156]; NTT_ROM[171] <= NTT_ROM[172]; NTT_ROM[187] <= NTT_ROM[188];

	NTT_ROM[203] <= NTT_ROM[204]; NTT_ROM[219] <= NTT_ROM[220]; NTT_ROM[235] <= NTT_ROM[236]; NTT_ROM[251] <= NTT_ROM[252];

	NTT_ROM[12] <= NTT_ROM[13]; NTT_ROM[28] <= NTT_ROM[29]; NTT_ROM[44] <= NTT_ROM[45]; NTT_ROM[60] <= NTT_ROM[61];

	NTT_ROM[76] <= NTT_ROM[77]; NTT_ROM[92] <= NTT_ROM[93]; NTT_ROM[108] <= NTT_ROM[109]; NTT_ROM[124] <= NTT_ROM[125];

	NTT_ROM[140] <= NTT_ROM[141]; NTT_ROM[156] <= NTT_ROM[157]; NTT_ROM[172] <= NTT_ROM[173]; NTT_ROM[188] <= NTT_ROM[189];

	NTT_ROM[204] <= NTT_ROM[205]; NTT_ROM[220] <= NTT_ROM[221]; NTT_ROM[236] <= NTT_ROM[237]; NTT_ROM[252] <= NTT_ROM[253];

	NTT_ROM[13] <= NTT_ROM[14]; NTT_ROM[29] <= NTT_ROM[30]; NTT_ROM[45] <= NTT_ROM[46]; NTT_ROM[61] <= NTT_ROM[62];

	NTT_ROM[77] <= NTT_ROM[78]; NTT_ROM[93] <= NTT_ROM[94]; NTT_ROM[109] <= NTT_ROM[110]; NTT_ROM[125] <= NTT_ROM[126];

	NTT_ROM[141] <= NTT_ROM[142]; NTT_ROM[157] <= NTT_ROM[158]; NTT_ROM[173] <= NTT_ROM[174]; NTT_ROM[189] <= NTT_ROM[190];

	NTT_ROM[205] <= NTT_ROM[206]; NTT_ROM[221] <= NTT_ROM[222]; NTT_ROM[237] <= NTT_ROM[238]; NTT_ROM[253] <= NTT_ROM[254];

	NTT_ROM[14] <= NTT_ROM[15]; NTT_ROM[30] <= NTT_ROM[31]; NTT_ROM[46] <= NTT_ROM[47]; NTT_ROM[62] <= NTT_ROM[63];

	NTT_ROM[78] <= NTT_ROM[79]; NTT_ROM[94] <= NTT_ROM[95]; NTT_ROM[110] <= NTT_ROM[111]; NTT_ROM[126] <= NTT_ROM[127];

	NTT_ROM[142] <= NTT_ROM[143]; NTT_ROM[158] <= NTT_ROM[159]; NTT_ROM[174] <= NTT_ROM[175]; NTT_ROM[190] <= NTT_ROM[191];

	NTT_ROM[206] <= NTT_ROM[207]; NTT_ROM[222] <= NTT_ROM[223]; NTT_ROM[238] <= NTT_ROM[239]; NTT_ROM[254] <= NTT_ROM[255];
	
    end
    
end

always @ (posedge clk)
begin
  if(!start && data_loop > 6'd04 && data_loop < 6'd21)
    begin
      NTT_ROM[240] <= BU_data_0; NTT_ROM[241] <= BU_data_1; NTT_ROM[242] <= BU_data_2; NTT_ROM[243] <= BU_data_3;
      NTT_ROM[244] <= BU_data_4; NTT_ROM[245] <= BU_data_5; NTT_ROM[246] <= BU_data_6; NTT_ROM[247] <= BU_data_7;
      
      NTT_ROM[248] <= BU_data_8; NTT_ROM[249] <= BU_data_9; NTT_ROM[250] <= BU_data_10; NTT_ROM[251] <= BU_data_11;
      NTT_ROM[252] <= BU_data_12; NTT_ROM[253] <= BU_data_13; NTT_ROM[254] <= BU_data_14; NTT_ROM[255] <= BU_data_15;
      
    end
end

// Asynchronous reset on start signal
always @ (posedge start) 
begin
    switch <= 1'b0;       // Initialize switch to 0
    data_loop <= 6'b0000_00; // Initialize data_loop to 0
end

// Synchronous logic with clock
always @ (posedge clk) 
begin
    if(!start)
    begin
      data_loop <= data_loop + 1;
      if (data_loop > 6'h13)
          switch <= 1'b1;
    end
end

endmodule
