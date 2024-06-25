`timescale 1ns / 1ps

module INTT_Transform(

    input [15:0] NTT_0, NTT_1, NTT_2, NTT_3, NTT_4, NTT_5, NTT_6, NTT_7, 
                 NTT_8, NTT_9, NTT_10, NTT_11, NTT_12, NTT_13, NTT_14, NTT_15,
	
    input start,   
    input clk, rst,
    input [5:0] data_loop,
    
    output [15:0] INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15
    );
    
 reg [15:0] INTT_ROM [255:0];
 
 
 reg [15:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7,
            out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15;

            
 wire [15:0] INT_0, INT_1, INT_2, INT_3, INT_4, INT_5, INT_6, INT_7, 
           INT_8, INT_9, INT_10, INT_11, INT_12, INT_13, INT_14, INT_15;

 
 always @(posedge  clk)
 begin
    if(!start && data_loop == 6'h1e)
    begin
       INTT_ROM[0] <= INTT_0; INTT_ROM[1] <= INTT_8; INTT_ROM[2] <= INTT_4; INTT_ROM[3] <= INTT_12;
       INTT_ROM[4] <= INTT_2; INTT_ROM[5] <= INTT_10; INTT_ROM[6] <= INTT_6; INTT_ROM[7] <= INTT_14;
       
       INTT_ROM[8] <= INTT_1; INTT_ROM[9] <= INTT_9; INTT_ROM[10] <= INTT_5; INTT_ROM[11] <= INTT_13;
       INTT_ROM[12] <= INTT_3; INTT_ROM[13] <= INTT_11; INTT_ROM[14] <= INTT_7; INTT_ROM[15] <= INTT_15;
    end

	else if(!start && data_loop == 6'h1f)
	begin
		INTT_ROM[128] <= INTT_0; INTT_ROM[129] <= INTT_8; INTT_ROM[130] <= INTT_4; INTT_ROM[131] <= INTT_12;
		INTT_ROM[132] <= INTT_2; INTT_ROM[133] <= INTT_10; INTT_ROM[134] <= INTT_6; INTT_ROM[135] <= INTT_14;

		INTT_ROM[136] <= INTT_1; INTT_ROM[137] <= INTT_9; INTT_ROM[138] <= INTT_5; INTT_ROM[139] <= INTT_13;
		INTT_ROM[140] <= INTT_3; INTT_ROM[141] <= INTT_11; INTT_ROM[142] <= INTT_7; INTT_ROM[143] <= INTT_15;
	end

	else if(!start && data_loop == 6'h20)
	begin
		INTT_ROM[64] <= INTT_0; INTT_ROM[65] <= INTT_8; INTT_ROM[66] <= INTT_4; INTT_ROM[67] <= INTT_12;
		INTT_ROM[68] <= INTT_2; INTT_ROM[69] <= INTT_10; INTT_ROM[70] <= INTT_6; INTT_ROM[71] <= INTT_14;

		INTT_ROM[72] <= INTT_1; INTT_ROM[73] <= INTT_9; INTT_ROM[74] <= INTT_5; INTT_ROM[75] <= INTT_13;
		INTT_ROM[76] <= INTT_3; INTT_ROM[77] <= INTT_11; INTT_ROM[78] <= INTT_7; INTT_ROM[79] <= INTT_15;
	end

	else if(!start && data_loop == 6'h21)
	begin
		INTT_ROM[192] <= INTT_0; INTT_ROM[193] <= INTT_8; INTT_ROM[194] <= INTT_4; INTT_ROM[195] <= INTT_12;
		INTT_ROM[196] <= INTT_2; INTT_ROM[197] <= INTT_10; INTT_ROM[198] <= INTT_6; INTT_ROM[199] <= INTT_14;

		INTT_ROM[200] <= INTT_1; INTT_ROM[201] <= INTT_9; INTT_ROM[202] <= INTT_5; INTT_ROM[203] <= INTT_13;
		INTT_ROM[204] <= INTT_3; INTT_ROM[205] <= INTT_11; INTT_ROM[206] <= INTT_7; INTT_ROM[207] <= INTT_15;
	end

	else if(!start && data_loop == 6'h22)
	begin
		INTT_ROM[32] <= INTT_0; INTT_ROM[33] <= INTT_8; INTT_ROM[34] <= INTT_4; INTT_ROM[35] <= INTT_12;
		INTT_ROM[36] <= INTT_2; INTT_ROM[37] <= INTT_10; INTT_ROM[38] <= INTT_6; INTT_ROM[39] <= INTT_14;

		INTT_ROM[40] <= INTT_1; INTT_ROM[41] <= INTT_9; INTT_ROM[42] <= INTT_5; INTT_ROM[43] <= INTT_13;
		INTT_ROM[44] <= INTT_3; INTT_ROM[45] <= INTT_11; INTT_ROM[46] <= INTT_7; INTT_ROM[47] <= INTT_15;
	end

	else if(!start && data_loop == 6'h23)
	begin
		INTT_ROM[160] <= INTT_0; INTT_ROM[161] <= INTT_8; INTT_ROM[162] <= INTT_4; INTT_ROM[163] <= INTT_12;
		INTT_ROM[164] <= INTT_2; INTT_ROM[165] <= INTT_10; INTT_ROM[166] <= INTT_6; INTT_ROM[167] <= INTT_14;

		INTT_ROM[168] <= INTT_1; INTT_ROM[169] <= INTT_9; INTT_ROM[170] <= INTT_5; INTT_ROM[171] <= INTT_13;
		INTT_ROM[172] <= INTT_3; INTT_ROM[173] <= INTT_11; INTT_ROM[174] <= INTT_7; INTT_ROM[175] <= INTT_15;
	end

	else if(!start && data_loop == 6'h24)
	begin
		INTT_ROM[96] <= INTT_0; INTT_ROM[97] <= INTT_8; INTT_ROM[98] <= INTT_4; INTT_ROM[99] <= INTT_12;
		INTT_ROM[100] <= INTT_2; INTT_ROM[101] <= INTT_10; INTT_ROM[102] <= INTT_6; INTT_ROM[103] <= INTT_14;

		INTT_ROM[104] <= INTT_1; INTT_ROM[105] <= INTT_9; INTT_ROM[106] <= INTT_5; INTT_ROM[107] <= INTT_13;
		INTT_ROM[108] <= INTT_3; INTT_ROM[109] <= INTT_11; INTT_ROM[110] <= INTT_7; INTT_ROM[111] <= INTT_15;
	end

	else if(!start && data_loop == 6'h25)
	begin
		INTT_ROM[224] <= INTT_0; INTT_ROM[225] <= INTT_8; INTT_ROM[226] <= INTT_4; INTT_ROM[227] <= INTT_12;
		INTT_ROM[228] <= INTT_2; INTT_ROM[229] <= INTT_10; INTT_ROM[230] <= INTT_6; INTT_ROM[231] <= INTT_14;

		INTT_ROM[232] <= INTT_1; INTT_ROM[233] <= INTT_9; INTT_ROM[234] <= INTT_5; INTT_ROM[235] <= INTT_13;
		INTT_ROM[236] <= INTT_3; INTT_ROM[237] <= INTT_11; INTT_ROM[238] <= INTT_7; INTT_ROM[239] <= INTT_15;
	end

	else if(!start && data_loop == 6'h26)
	begin
		INTT_ROM[16] <= INTT_0; INTT_ROM[17] <= INTT_8; INTT_ROM[18] <= INTT_4; INTT_ROM[19] <= INTT_12;
		INTT_ROM[20] <= INTT_2; INTT_ROM[21] <= INTT_10; INTT_ROM[22] <= INTT_6; INTT_ROM[23] <= INTT_14;

		INTT_ROM[24] <= INTT_1; INTT_ROM[25] <= INTT_9; INTT_ROM[26] <= INTT_5; INTT_ROM[27] <= INTT_13;
		INTT_ROM[28] <= INTT_3; INTT_ROM[29] <= INTT_11; INTT_ROM[30] <= INTT_7; INTT_ROM[31] <= INTT_15;
	end

	else if(!start && data_loop == 6'h27)
	begin
		INTT_ROM[144] <= INTT_0; INTT_ROM[145] <= INTT_8; INTT_ROM[146] <= INTT_4; INTT_ROM[147] <= INTT_12;
		INTT_ROM[148] <= INTT_2; INTT_ROM[149] <= INTT_10; INTT_ROM[150] <= INTT_6; INTT_ROM[151] <= INTT_14;

		INTT_ROM[152] <= INTT_1; INTT_ROM[153] <= INTT_9; INTT_ROM[154] <= INTT_5; INTT_ROM[155] <= INTT_13;
		INTT_ROM[156] <= INTT_3; INTT_ROM[157] <= INTT_11; INTT_ROM[158] <= INTT_7; INTT_ROM[159] <= INTT_15;
	end

	else if(!start && data_loop == 6'h28)
	begin
		INTT_ROM[80] <= INTT_0; INTT_ROM[81] <= INTT_8; INTT_ROM[82] <= INTT_4; INTT_ROM[83] <= INTT_12;
		INTT_ROM[84] <= INTT_2; INTT_ROM[85] <= INTT_10; INTT_ROM[86] <= INTT_6; INTT_ROM[87] <= INTT_14;

		INTT_ROM[88] <= INTT_1; INTT_ROM[89] <= INTT_9; INTT_ROM[90] <= INTT_5; INTT_ROM[91] <= INTT_13;
		INTT_ROM[92] <= INTT_3; INTT_ROM[93] <= INTT_11; INTT_ROM[94] <= INTT_7; INTT_ROM[95] <= INTT_15;
	end

	else if(!start && data_loop == 6'h29)
	begin
		INTT_ROM[208] <= INTT_0; INTT_ROM[209] <= INTT_8; INTT_ROM[210] <= INTT_4; INTT_ROM[211] <= INTT_12;
		INTT_ROM[212] <= INTT_2; INTT_ROM[213] <= INTT_10; INTT_ROM[214] <= INTT_6; INTT_ROM[215] <= INTT_14;

		INTT_ROM[216] <= INTT_1; INTT_ROM[217] <= INTT_9; INTT_ROM[218] <= INTT_5; INTT_ROM[219] <= INTT_13;
		INTT_ROM[220] <= INTT_3; INTT_ROM[221] <= INTT_11; INTT_ROM[222] <= INTT_7; INTT_ROM[223] <= INTT_15;
	end

	else if(!start && data_loop == 6'h2a)
	begin
		INTT_ROM[48] <= INTT_0; INTT_ROM[49] <= INTT_8; INTT_ROM[50] <= INTT_4; INTT_ROM[51] <= INTT_12;
		INTT_ROM[52] <= INTT_2; INTT_ROM[53] <= INTT_10; INTT_ROM[54] <= INTT_6; INTT_ROM[55] <= INTT_14;

		INTT_ROM[56] <= INTT_1; INTT_ROM[57] <= INTT_9; INTT_ROM[58] <= INTT_5; INTT_ROM[59] <= INTT_13;
		INTT_ROM[60] <= INTT_3; INTT_ROM[61] <= INTT_11; INTT_ROM[62] <= INTT_7; INTT_ROM[63] <= INTT_15;
	end

	else if(!start && data_loop == 6'h2b)
	begin
		INTT_ROM[176] <= INTT_0; INTT_ROM[177] <= INTT_8; INTT_ROM[178] <= INTT_4; INTT_ROM[179] <= INTT_12;
		INTT_ROM[180] <= INTT_2; INTT_ROM[181] <= INTT_10; INTT_ROM[182] <= INTT_6; INTT_ROM[183] <= INTT_14;

		INTT_ROM[184] <= INTT_1; INTT_ROM[185] <= INTT_9; INTT_ROM[186] <= INTT_5; INTT_ROM[187] <= INTT_13;
		INTT_ROM[188] <= INTT_3; INTT_ROM[189] <= INTT_11; INTT_ROM[190] <= INTT_7; INTT_ROM[191] <= INTT_15;
	end

	else if(!start && data_loop == 6'h2c)
	begin
		INTT_ROM[112] <= INTT_0; INTT_ROM[113] <= INTT_8; INTT_ROM[114] <= INTT_4; INTT_ROM[115] <= INTT_12;
		INTT_ROM[116] <= INTT_2; INTT_ROM[117] <= INTT_10; INTT_ROM[118] <= INTT_6; INTT_ROM[119] <= INTT_14;

		INTT_ROM[120] <= INTT_1; INTT_ROM[121] <= INTT_9; INTT_ROM[122] <= INTT_5; INTT_ROM[123] <= INTT_13;
		INTT_ROM[124] <= INTT_3; INTT_ROM[125] <= INTT_11; INTT_ROM[126] <= INTT_7; INTT_ROM[127] <= INTT_15;
	end

	else if(!start && data_loop == 6'h2d)
	begin
		INTT_ROM[240] <= INTT_0; INTT_ROM[241] <= INTT_8; INTT_ROM[242] <= INTT_4; INTT_ROM[243] <= INTT_12;
		INTT_ROM[244] <= INTT_2; INTT_ROM[245] <= INTT_10; INTT_ROM[246] <= INTT_6; INTT_ROM[247] <= INTT_14;

		INTT_ROM[248] <= INTT_1; INTT_ROM[249] <= INTT_9; INTT_ROM[250] <= INTT_5; INTT_ROM[251] <= INTT_13;
		INTT_ROM[252] <= INTT_3; INTT_ROM[253] <= INTT_11; INTT_ROM[254] <= INTT_7; INTT_ROM[255] <= INTT_15;
	end

    
end    


 always @(posedge  clk)
 begin
    if(!start && data_loop == 6'h2d)
    begin
       out_0 <= INTT_ROM[0]; out_1 <= INTT_ROM[16]; out_2 <= INTT_ROM[32]; out_3 <= INTT_ROM[48];
       out_4 <= INTT_ROM[64]; out_5 <= INTT_ROM[80]; out_6 <= INTT_ROM[96]; out_7 <= INTT_ROM[112];
       
       out_8 <= INTT_ROM[128]; out_9 <= INTT_ROM[144]; out_10 <= INTT_ROM[160]; out_11 <= INTT_ROM[176];
       out_12 <= INTT_ROM[192]; out_13 <= INTT_ROM[208]; out_14 <= INTT_ROM[224]; #1 out_15 <= INTT_ROM[240];
    end

	else if(!start && data_loop == 6'h2e)
	begin
		out_0 <= INTT_ROM[8]; out_1 <= INTT_ROM[24]; out_2 <= INTT_ROM[40]; out_3 <= INTT_ROM[56];
		out_4 <= INTT_ROM[72]; out_5 <= INTT_ROM[88]; out_6 <= INTT_ROM[104]; out_7 <= INTT_ROM[120];

		out_8 <= INTT_ROM[136]; out_9 <= INTT_ROM[152]; out_10 <= INTT_ROM[168]; out_11 <= INTT_ROM[184];
		out_12 <= INTT_ROM[200]; out_13 <= INTT_ROM[216]; out_14 <= INTT_ROM[232]; out_15 <= INTT_ROM[248];
	end

	else if(!start && data_loop == 6'h2f)
	begin
		out_0 <= INTT_ROM[4]; out_1 <= INTT_ROM[20]; out_2 <= INTT_ROM[36]; out_3 <= INTT_ROM[52];
		out_4 <= INTT_ROM[68]; out_5 <= INTT_ROM[84]; out_6 <= INTT_ROM[100]; out_7 <= INTT_ROM[116];

		out_8 <= INTT_ROM[132]; out_9 <= INTT_ROM[148]; out_10 <= INTT_ROM[164]; out_11 <= INTT_ROM[180];
		out_12 <= INTT_ROM[196]; out_13 <= INTT_ROM[212]; out_14 <= INTT_ROM[228]; out_15 <= INTT_ROM[244];
	end

	else if(!start && data_loop == 6'h30)
	begin
		out_0 <= INTT_ROM[12]; out_1 <= INTT_ROM[28]; out_2 <= INTT_ROM[44]; out_3 <= INTT_ROM[60];
		out_4 <= INTT_ROM[76]; out_5 <= INTT_ROM[92]; out_6 <= INTT_ROM[108]; out_7 <= INTT_ROM[124];

		out_8 <= INTT_ROM[140]; out_9 <= INTT_ROM[156]; out_10 <= INTT_ROM[172]; out_11 <= INTT_ROM[188];
		out_12 <= INTT_ROM[204]; out_13 <= INTT_ROM[220]; out_14 <= INTT_ROM[236]; out_15 <= INTT_ROM[252];
	end

	else if(!start && data_loop == 6'h31)
	begin
		out_0 <= INTT_ROM[2]; out_1 <= INTT_ROM[18]; out_2 <= INTT_ROM[34]; out_3 <= INTT_ROM[50];
		out_4 <= INTT_ROM[66]; out_5 <= INTT_ROM[82]; out_6 <= INTT_ROM[98]; out_7 <= INTT_ROM[114];

		out_8 <= INTT_ROM[130]; out_9 <= INTT_ROM[146]; out_10 <= INTT_ROM[162]; out_11 <= INTT_ROM[178];
		out_12 <= INTT_ROM[194]; out_13 <= INTT_ROM[210]; out_14 <= INTT_ROM[226]; out_15 <= INTT_ROM[242];
	end

	else if(!start && data_loop == 6'h32)
	begin
		out_0 <= INTT_ROM[10]; out_1 <= INTT_ROM[26]; out_2 <= INTT_ROM[42]; out_3 <= INTT_ROM[58];
		out_4 <= INTT_ROM[74]; out_5 <= INTT_ROM[90]; out_6 <= INTT_ROM[106]; out_7 <= INTT_ROM[122];

		out_8 <= INTT_ROM[138]; out_9 <= INTT_ROM[154]; out_10 <= INTT_ROM[170]; out_11 <= INTT_ROM[186];
		out_12 <= INTT_ROM[202]; out_13 <= INTT_ROM[218]; out_14 <= INTT_ROM[234]; out_15 <= INTT_ROM[250];
	end

	else if(!start && data_loop == 6'h33)
	begin
		out_0 <= INTT_ROM[6]; out_1 <= INTT_ROM[22]; out_2 <= INTT_ROM[38]; out_3 <= INTT_ROM[54];
		out_4 <= INTT_ROM[70]; out_5 <= INTT_ROM[86]; out_6 <= INTT_ROM[102]; out_7 <= INTT_ROM[118];

		out_8 <= INTT_ROM[134]; out_9 <= INTT_ROM[150]; out_10 <= INTT_ROM[166]; out_11 <= INTT_ROM[182];
		out_12 <= INTT_ROM[198]; out_13 <= INTT_ROM[214]; out_14 <= INTT_ROM[230]; out_15 <= INTT_ROM[246];
	end

	else if(!start && data_loop == 6'h34)
	begin
		out_0 <= INTT_ROM[14]; out_1 <= INTT_ROM[30]; out_2 <= INTT_ROM[46]; out_3 <= INTT_ROM[62];
		out_4 <= INTT_ROM[78]; out_5 <= INTT_ROM[94]; out_6 <= INTT_ROM[110]; out_7 <= INTT_ROM[126];

		out_8 <= INTT_ROM[142]; out_9 <= INTT_ROM[158]; out_10 <= INTT_ROM[174]; out_11 <= INTT_ROM[190];
		out_12 <= INTT_ROM[206]; out_13 <= INTT_ROM[222]; out_14 <= INTT_ROM[238]; out_15 <= INTT_ROM[254];
	end

	else if(!start && data_loop == 6'h35)
	begin
		out_0 <= INTT_ROM[1]; out_1 <= INTT_ROM[17]; out_2 <= INTT_ROM[33]; out_3 <= INTT_ROM[49];
		out_4 <= INTT_ROM[65]; out_5 <= INTT_ROM[81]; out_6 <= INTT_ROM[97]; out_7 <= INTT_ROM[113];

		out_8 <= INTT_ROM[129]; out_9 <= INTT_ROM[145]; out_10 <= INTT_ROM[161]; out_11 <= INTT_ROM[177];
		out_12 <= INTT_ROM[193]; out_13 <= INTT_ROM[209]; out_14 <= INTT_ROM[225]; out_15 <= INTT_ROM[241];
	end

	else if(!start && data_loop == 6'h36)
	begin
		out_0 <= INTT_ROM[9]; out_1 <= INTT_ROM[25]; out_2 <= INTT_ROM[41]; out_3 <= INTT_ROM[57];
		out_4 <= INTT_ROM[73]; out_5 <= INTT_ROM[89]; out_6 <= INTT_ROM[105]; out_7 <= INTT_ROM[121];

		out_8 <= INTT_ROM[137]; out_9 <= INTT_ROM[153]; out_10 <= INTT_ROM[169]; out_11 <= INTT_ROM[185];
		out_12 <= INTT_ROM[201]; out_13 <= INTT_ROM[217]; out_14 <= INTT_ROM[233]; out_15 <= INTT_ROM[249];
	end

	else if(!start && data_loop == 6'h37)
	begin
		out_0 <= INTT_ROM[5]; out_1 <= INTT_ROM[21]; out_2 <= INTT_ROM[37]; out_3 <= INTT_ROM[53];
		out_4 <= INTT_ROM[69]; out_5 <= INTT_ROM[85]; out_6 <= INTT_ROM[101]; out_7 <= INTT_ROM[117];

		out_8 <= INTT_ROM[133]; out_9 <= INTT_ROM[149]; out_10 <= INTT_ROM[165]; out_11 <= INTT_ROM[181];
		out_12 <= INTT_ROM[197]; out_13 <= INTT_ROM[213]; out_14 <= INTT_ROM[229]; out_15 <= INTT_ROM[245];
	end

	else if(!start && data_loop == 6'h38)
	begin
		out_0 <= INTT_ROM[13]; out_1 <= INTT_ROM[29]; out_2 <= INTT_ROM[45]; out_3 <= INTT_ROM[61];
		out_4 <= INTT_ROM[77]; out_5 <= INTT_ROM[93]; out_6 <= INTT_ROM[109]; out_7 <= INTT_ROM[125];

		out_8 <= INTT_ROM[141]; out_9 <= INTT_ROM[157]; out_10 <= INTT_ROM[173]; out_11 <= INTT_ROM[189];
		out_12 <= INTT_ROM[205]; out_13 <= INTT_ROM[221]; out_14 <= INTT_ROM[237]; out_15 <= INTT_ROM[253];
	end

	else if(!start && data_loop == 6'h39)
	begin
		out_0 <= INTT_ROM[3]; out_1 <= INTT_ROM[19]; out_2 <= INTT_ROM[35]; out_3 <= INTT_ROM[51];
		out_4 <= INTT_ROM[67]; out_5 <= INTT_ROM[83]; out_6 <= INTT_ROM[99]; out_7 <= INTT_ROM[115];

		out_8 <= INTT_ROM[131]; out_9 <= INTT_ROM[147]; out_10 <= INTT_ROM[163]; out_11 <= INTT_ROM[179];
		out_12 <= INTT_ROM[195]; out_13 <= INTT_ROM[211]; out_14 <= INTT_ROM[227]; out_15 <= INTT_ROM[243];
	end

	else if(!start && data_loop == 6'h3a)
	begin
		out_0 <= INTT_ROM[11]; out_1 <= INTT_ROM[27]; out_2 <= INTT_ROM[43]; out_3 <= INTT_ROM[59];
		out_4 <= INTT_ROM[75]; out_5 <= INTT_ROM[91]; out_6 <= INTT_ROM[107]; out_7 <= INTT_ROM[123];

		out_8 <= INTT_ROM[139]; out_9 <= INTT_ROM[155]; out_10 <= INTT_ROM[171]; out_11 <= INTT_ROM[187];
		out_12 <= INTT_ROM[203]; out_13 <= INTT_ROM[219]; out_14 <= INTT_ROM[235]; out_15 <= INTT_ROM[251];
	end

	else if(!start && data_loop == 6'h3b)
	begin
		out_0 <= INTT_ROM[7]; out_1 <= INTT_ROM[23]; out_2 <= INTT_ROM[39]; out_3 <= INTT_ROM[55];
		out_4 <= INTT_ROM[71]; out_5 <= INTT_ROM[87]; out_6 <= INTT_ROM[103]; out_7 <= INTT_ROM[119];

		out_8 <= INTT_ROM[135]; out_9 <= INTT_ROM[151]; out_10 <= INTT_ROM[167]; out_11 <= INTT_ROM[183];
		out_12 <= INTT_ROM[199]; out_13 <= INTT_ROM[215]; out_14 <= INTT_ROM[231]; out_15 <= INTT_ROM[247];
	end

	else if(!start && data_loop == 6'h3c)
	begin
		out_0 <= INTT_ROM[15]; out_1 <= INTT_ROM[31]; out_2 <= INTT_ROM[47]; out_3 <= INTT_ROM[63];
		out_4 <= INTT_ROM[79]; out_5 <= INTT_ROM[95]; out_6 <= INTT_ROM[111]; out_7 <= INTT_ROM[127];

		out_8 <= INTT_ROM[143]; out_9 <= INTT_ROM[159]; out_10 <= INTT_ROM[175]; out_11 <= INTT_ROM[191];
		out_12 <= INTT_ROM[207]; out_13 <= INTT_ROM[223]; out_14 <= INTT_ROM[239]; out_15 <=  #1 INTT_ROM[255];
	end

end
    
    wire [15:0]  inv_twid_0, inv_twid_1, inv_twid_2, inv_twid_3,
                 inv_twid_4, inv_twid_5, inv_twid_6, inv_twid_7,
                 inv_twid_8, inv_twid_9, inv_twid_10, inv_twid_11,
                 inv_twid_12, inv_twid_13, inv_twid_14;
                 
    inv_twiddle_data inst1 ( 
    
           start, data_loop, clk,
    
           inv_twid_0, inv_twid_1, inv_twid_2, inv_twid_3,
           inv_twid_4, inv_twid_5, inv_twid_6, inv_twid_7,
           inv_twid_8, inv_twid_9, inv_twid_10, inv_twid_11,
           inv_twid_12, inv_twid_13, inv_twid_14
    );
    
    //determing input logic for IBU_16
    switch_32_bit inst01 (NTT_0, out_0, data_loop, INT_0);
    switch_32_bit inst02 (NTT_1, out_1, data_loop, INT_1);
    switch_32_bit inst03 (NTT_2, out_2, data_loop, INT_2);
    switch_32_bit inst04 (NTT_3, out_3, data_loop, INT_3);
    
    switch_32_bit inst05 (NTT_4, out_4, data_loop, INT_4);
    switch_32_bit inst06 (NTT_5, out_5, data_loop, INT_5);
    switch_32_bit inst07 (NTT_6, out_6, data_loop, INT_6);
    switch_32_bit inst08 (NTT_7, out_7, data_loop, INT_7);
    
    switch_32_bit inst09 (NTT_8, out_8, data_loop, INT_8);
    switch_32_bit inst10 (NTT_9, out_9, data_loop, INT_9);
    switch_32_bit inst11 (NTT_10, out_10, data_loop, INT_10);
    switch_32_bit inst12 (NTT_11, out_11, data_loop, INT_11);
    
    switch_32_bit inst13 (NTT_12, out_12, data_loop, INT_12);
    switch_32_bit inst14 (NTT_13, out_13, data_loop, INT_13);
    switch_32_bit inst15 (NTT_14, out_14, data_loop, INT_14);
    switch_32_bit inst16 (NTT_15, out_15, data_loop, INT_15);
    
    IBU_16 inst0 (
           
           INT_0, INT_1, INT_2, INT_3, INT_4, INT_5, INT_6, INT_7, 
           INT_8, INT_9, INT_10, INT_11, INT_12, INT_13, INT_14, INT_15,
        
           inv_twid_0, inv_twid_1, inv_twid_2, inv_twid_3,
           inv_twid_4, inv_twid_5, inv_twid_6, inv_twid_7,
           inv_twid_8, inv_twid_9, inv_twid_10, inv_twid_11,
           inv_twid_12, inv_twid_13, inv_twid_14,
    
           clk, rst,          
           
           INTT_0, INTT_1, INTT_2, INTT_3, INTT_4, INTT_5, INTT_6, INTT_7, 
           INTT_8, INTT_9, INTT_10, INTT_11, INTT_12, INTT_13, INTT_14, INTT_15
    );
    
endmodule
