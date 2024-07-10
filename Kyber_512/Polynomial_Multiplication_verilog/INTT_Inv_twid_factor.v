`timescale 1ns / 1ps

module inv_twiddle_data(
    input start,
    input [5:0] data_loop,
    input clk,
    output reg [15:0] inv_twid_0, inv_twid_1, inv_twid_2, inv_twid_3,
           inv_twid_4, inv_twid_5, inv_twid_6, inv_twid_7,
           inv_twid_8, inv_twid_9, inv_twid_10, inv_twid_11,
           inv_twid_12, inv_twid_13, inv_twid_14
    );
    
    //defining twiddle value ----- 0000
    reg [15:0] inv_shi_0 = 16'd5910, inv_shi_1 = 16'd7568, inv_shi_2 = 16'd1189, inv_shi_3 = 16'd5224;
    reg [15:0] inv_shi_4 = 16'd4442, inv_shi_5 = 16'd3250, inv_shi_6 = 16'd1897, inv_shi_7 = 16'd3916; 
    
    reg [15:0] inv_shi_8 = 16'd2593, inv_shi_9 = 16'd417, inv_shi_10 = 16'd6556, inv_shi_11 = 16'd3901;  
    reg [15:0] inv_shi_12 = 16'd2774, inv_shi_13 = 16'd5941, inv_shi_14 = 16'd6395; 
    
    //defining twiddle value ------ 0001
    reg [15:0] inv_shi_16 = 16'd1035, inv_shi_17 = 16'd6550, inv_shi_18 = 16'd2996, inv_shi_19 = 16'd4229;
    reg [15:0] inv_shi_20 = 16'd4287, inv_shi_21 = 16'd1193, inv_shi_22 = 16'd3081, inv_shi_23 = 16'd7587; 
    
    reg [15:0] inv_shi_24 = 16'd3566, inv_shi_25 = 16'd4608, inv_shi_26 = 16'd5417, inv_shi_27 = 16'd6526;  
    reg [15:0] inv_shi_28 = 16'd4301, inv_shi_29 = 16'd2469, inv_shi_30 = 16'd2753; 
    
    //defining twiddle value ------ 0010
    reg [15:0] inv_shi_32 = 16'd3086, inv_shi_33 = 16'd1459, inv_shi_34 = 16'd3137, inv_shi_35 = 16'd5010;
    reg [15:0] inv_shi_36 = 16'd1784, inv_shi_37 = 16'd5687, inv_shi_38 = 16'd793, inv_shi_39 = 16'd2050; 
    
    reg [15:0] inv_shi_40 = 16'd6637, inv_shi_41 = 16'd1408, inv_shi_42 = 16'd2722, inv_shi_43 = 16'd6688;  
    reg [15:0] inv_shi_44 = 16'd6915, inv_shi_45 = 16'd4800, inv_shi_46 = 16'd3000;
    
    //defining twiddle value ------ 0011
    reg [15:0] inv_shi_48 = 16'd6077, inv_shi_49 = 16'd4135, inv_shi_50 = 16'd0062, inv_shi_51 = 16'd2359;
    reg [15:0] inv_shi_52 = 16'd1950, inv_shi_53 = 16'd6552, inv_shi_54 = 16'd5422, inv_shi_55 = 16'd398; 
    
    reg [15:0] inv_shi_56 = 16'd7362, inv_shi_57 = 16'd3844, inv_shi_58 = 16'd405, inv_shi_59 = 16'd2897;  
    reg [15:0] inv_shi_60 = 16'd1908, inv_shi_61 = 16'd2724, inv_shi_62 = 16'd7351;
    
    //defining twiddle value ------ 0100
    reg [15:0] inv_shi_64 = 16'd3930, inv_shi_65 = 16'd7060, inv_shi_66 = 16'd7146, inv_shi_67 = 16'd2811;
    reg [15:0] inv_shi_68 = 16'd2252, inv_shi_69 = 16'd6645, inv_shi_70 = 16'd3016, inv_shi_71 = 16'd2760; 
    
    reg [15:0] inv_shi_72 = 16'd6090, inv_shi_73 = 16'd2028, inv_shi_74 = 16'd2044, inv_shi_75 = 16'd1952;  
    reg [15:0] inv_shi_76 = 16'd4232, inv_shi_77 = 16'd7153, inv_shi_78 = 16'd5413;
    
    //defining twiddle value ------ 0101
    reg [15:0] inv_shi_80 = 16'd5484, inv_shi_81 = 16'd2757, inv_shi_82 = 16'd3006, inv_shi_83 = 16'd7335;
    reg [15:0] inv_shi_84 = 16'd1876, inv_shi_85 = 16'd2002, inv_shi_86 = 16'd1230, inv_shi_87 = 16'd5669; 
    
    reg [15:0] inv_shi_88 = 16'd3141, inv_shi_89 = 16'd3180, inv_shi_90 = 16'd1478, inv_shi_91 = 16'd7424;  
    reg [15:0] inv_shi_92 = 16'd3477, inv_shi_93 = 16'd3080, inv_shi_94 = 16'd7316;
    
    //defining twiddle value ------ 0110  
    reg [15:0] inv_shi_96 = 16'd2481, inv_shi_97 = 16'd5571, inv_shi_98 = 16'd6024, inv_shi_99 = 16'd1499;
    reg [15:0] inv_shi_100 = 16'd2395, inv_shi_101 = 16'd6511, inv_shi_102 = 16'd1775, inv_shi_103 = 16'd5964; 
    
    reg [15:0] inv_shi_104 = 16'd2880, inv_shi_105 = 16'd3532, inv_shi_106 = 16'd5999, inv_shi_107 = 16'd1415;  
    reg [15:0] inv_shi_108 = 16'd6601, inv_shi_109 = 16'd2516, inv_shi_110 = 16'd6569;
    
    //defining twiddle value ------ 0111
    reg [15:0] inv_shi_112 = 16'd4236, inv_shi_113 = 16'd5323, inv_shi_114 = 16'd4759, inv_shi_115 = 16'd321;
    reg [15:0] inv_shi_116 = 16'd3987, inv_shi_117 = 16'd185, inv_shi_118 = 16'd1656, inv_shi_119 = 16'd2799; 
    
    reg [15:0] inv_shi_120 = 16'd880, inv_shi_121 = 16'd4493, inv_shi_122 = 16'd4180, inv_shi_123 = 16'd219;  
    reg [15:0] inv_shi_124 = 16'd6300, inv_shi_125 = 16'd5806, inv_shi_126 = 16'd2273;
    
    //defining twiddle value ------ 1000
    reg [15:0] inv_shi_128 = 16'd118, inv_shi_129 = 16'd7463, inv_shi_130 = 16'd4401, inv_shi_131 = 16'd2805;
    reg [15:0] inv_shi_132 = 16'd7346, inv_shi_133 = 16'd3483, inv_shi_134 = 16'd329, inv_shi_135 = 16'd6943; 
    
    reg [15:0] inv_shi_136 = 16'd6243, inv_shi_137 = 16'd5000, inv_shi_138 = 16'd4691, inv_shi_139 = 16'd707;  
    reg [15:0] inv_shi_140 = 16'd1655, inv_shi_141 = 16'd7097, inv_shi_142 = 16'd4589;

    //defining twiddle value ------ 1001
    reg [15:0] inv_shi_144 = 16'd6415, inv_shi_145 = 16'd3120, inv_shi_146 = 16'd5508, inv_shi_147 = 16'd7139;
    reg [15:0] inv_shi_148 = 16'd6979, inv_shi_149 = 16'd6244, inv_shi_150 = 16'd506, inv_shi_151 = 16'd6616; 
    
    reg [15:0] inv_shi_152 = 16'd5108, inv_shi_153 = 16'd5795, inv_shi_154 = 16'd1220, inv_shi_155 = 16'd2563;  
    reg [15:0] inv_shi_156 = 16'd6988, inv_shi_157 = 16'd5967, inv_shi_158 = 16'd4027;
    
    //defining twiddle value ------ 1010
    reg [15:0] inv_shi_160 = 16'd4730, inv_shi_161 = 16'd2067, inv_shi_162 = 16'd3265, inv_shi_163 = 16'd217;
    reg [15:0] inv_shi_164 = 16'd111, inv_shi_165 = 16'd6825, inv_shi_166 = 16'd6288, inv_shi_167 = 16'd3615; 
    
    reg [15:0] inv_shi_168 = 16'd5828, inv_shi_169 = 16'd6678, inv_shi_170 = 16'd4640, inv_shi_171 = 16'd4837;  
    reg [15:0] inv_shi_172 = 16'd202, inv_shi_173 = 16'd7438, inv_shi_174 = 16'd2399;
    
    //defining twiddle value ------ 1011
    reg [15:0] inv_shi_176 = 16'd6014, inv_shi_177 = 16'd6074, inv_shi_178 = 16'd1683, inv_shi_179 = 16'd1968;
    reg [15:0] inv_shi_180 = 16'd3626, inv_shi_181 = 16'd201, inv_shi_182 = 16'd5702, inv_shi_183 = 16'd2875; 
    
    reg [15:0] inv_shi_184 = 16'd6048, inv_shi_185 = 16'd5881, inv_shi_186 = 16'd5685, inv_shi_187 = 16'd6812;  
    reg [15:0] inv_shi_188 = 16'd1382, inv_shi_189 = 16'd5258, inv_shi_190 = 16'd5036;
    
    //defining twiddle value ------ 1100
    reg [15:0] inv_shi_192 = 16'd1872, inv_shi_193 = 16'd3832, inv_shi_194 = 16'd1211, inv_shi_195 = 16'd2840;
    reg [15:0] inv_shi_196 = 16'd674, inv_shi_197 = 16'd6566, inv_shi_198 = 16'd7042, inv_shi_199 = 16'd4305; 
    
    reg [15:0] inv_shi_200 = 16'd1848, inv_shi_201 = 16'd7131, inv_shi_202 = 16'd1097, inv_shi_203 = 16'd1228;  
    reg [15:0] inv_shi_204 = 16'd4740, inv_shi_205 = 16'd5173, inv_shi_206 = 16'd675;
    
    //defining twiddle value ------ 1101
    reg [15:0] inv_shi_208 = 16'd7385, inv_shi_209 = 16'd4843, inv_shi_210 = 16'd6275, inv_shi_211 = 16'd5722;
    reg [15:0] inv_shi_212 = 16'd4095, inv_shi_213 = 16'd4542, inv_shi_214 = 16'd2169, inv_shi_215 = 16'd2372; 
    
    reg [15:0] inv_shi_216 = 16'd3125, inv_shi_217 = 16'd2819, inv_shi_218 = 16'd1402, inv_shi_219 = 16'd3789;  
    reg [15:0] inv_shi_220 = 16'd3074, inv_shi_221 = 16'd6949, inv_shi_222 = 16'd1846;
    
    //defining twiddle value ------ 1110
    reg [15:0] inv_shi_224 = 16'd572, inv_shi_225 = 16'd7145, inv_shi_226 = 16'd2717, inv_shi_227 = 16'd5135;
    reg [15:0] inv_shi_228 = 16'd3193, inv_shi_229 = 16'd2433, inv_shi_230 = 16'd1725, inv_shi_231 = 16'd5796; 
    
    reg [15:0] inv_shi_232 = 16'd4582, inv_shi_233 = 16'd0648, inv_shi_234 = 16'd2562, inv_shi_235 = 16'd3078;  
    reg [15:0] inv_shi_236 = 16'd2551, inv_shi_237 = 16'd4270, inv_shi_238 = 16'd1794;

    //defining twiddle value ------ 1111
    reg [15:0] inv_shi_240 = 16'd763, inv_shi_241 = 16'd413, inv_shi_242 = 16'd1704, inv_shi_243 = 16'd3882;
    reg [15:0] inv_shi_244 = 16'd7012, inv_shi_245 = 16'd2668, inv_shi_246 = 16'd2583, inv_shi_247 = 16'd4992; 
    
    reg [15:0] inv_shi_248 = 16'd6094, inv_shi_249 = 16'd0198, inv_shi_250 = 16'd2063, inv_shi_251 = 16'd4781;  
    reg [15:0] inv_shi_252 = 16'd6882, inv_shi_253 = 16'd0695, inv_shi_254 = 16'd878;

    //defining twiddle value ------  second iteration ----------
    reg [15:0] inv_shi_260 = 16'd2381, inv_shi_261 = 16'd5235, inv_shi_262 = 16'd5549, inv_shi_263 = 16'd7584;
    reg [15:0] inv_shi_264 = 16'd5543, inv_shi_265 = 16'd2648, inv_shi_266 = 16'd1366, inv_shi_267 = 16'd4897;
    
    reg [15:0] inv_shi_268 = 16'd583, inv_shi_269 = 16'd5953, inv_shi_270 = 16'd849, inv_shi_271 = 16'd7154;
    reg [15:0] inv_shi_272 = 16'd1925, inv_shi_273 = 16'd6468, inv_shi_274 = 16'd3383;
    
    
    //logic to developing esssential twiddle faactor
    always @(posedge clk)
    begin
      if(!start && data_loop == 6'h19)
      begin
        inv_twid_0 <= inv_shi_0; inv_twid_1 <= inv_shi_1; inv_twid_2 <= inv_shi_2; inv_twid_3 <= inv_shi_3; 
        inv_twid_4 <= inv_shi_4; inv_twid_5 <= inv_shi_5; inv_twid_6 <= inv_shi_6; inv_twid_7 <= inv_shi_7;

        inv_twid_8 <= inv_shi_8; inv_twid_9 <= inv_shi_9; inv_twid_10 <= inv_shi_10; inv_twid_11 <= inv_shi_11;
        inv_twid_12 <= inv_shi_12; inv_twid_13 <= inv_shi_13; inv_twid_14 <= inv_shi_14;
      end

	else if(!start && data_loop == 6'h1a)
	begin
		inv_twid_0 <= inv_shi_16; inv_twid_1 <= inv_shi_17; inv_twid_2 <= inv_shi_18; inv_twid_3 <= inv_shi_19;
		inv_twid_4 <= inv_shi_20; inv_twid_5 <= inv_shi_21; inv_twid_6 <= inv_shi_22; inv_twid_7 <= inv_shi_23;

        inv_twid_8 <= inv_shi_8; inv_twid_9 <= inv_shi_9; inv_twid_10 <= inv_shi_10; inv_twid_11 <= inv_shi_11;
        inv_twid_12 <= inv_shi_12; inv_twid_13 <= inv_shi_13; inv_twid_14 <= inv_shi_14;

	end

	else if(!start && data_loop == 6'h1b)
	begin
		inv_twid_0 <= inv_shi_32; inv_twid_1 <= inv_shi_33; inv_twid_2 <= inv_shi_34; inv_twid_3 <= inv_shi_35;
		inv_twid_4 <= inv_shi_36; inv_twid_5 <= inv_shi_37; inv_twid_6 <= inv_shi_38; inv_twid_7 <= inv_shi_39;

		inv_twid_8 <= inv_shi_24; inv_twid_9 <= inv_shi_25; inv_twid_10 <= inv_shi_26; inv_twid_11 <= inv_shi_27;
        inv_twid_12 <= inv_shi_12; inv_twid_13 <= inv_shi_13; inv_twid_14 <= inv_shi_14;

	end

	else if(!start && data_loop == 6'h1c)
	begin
		inv_twid_0 <= inv_shi_48; inv_twid_1 <= inv_shi_49; inv_twid_2 <= inv_shi_50; inv_twid_3 <= inv_shi_51;
		inv_twid_4 <= inv_shi_52; inv_twid_5 <= inv_shi_53; inv_twid_6 <= inv_shi_54; inv_twid_7 <= inv_shi_55;

		inv_twid_8 <= inv_shi_40; inv_twid_9 <= inv_shi_41; inv_twid_10 <= inv_shi_42; inv_twid_11 <= inv_shi_43;
		inv_twid_12 <= inv_shi_28; inv_twid_13 <= inv_shi_29; inv_twid_14 <= inv_shi_14;      


	end

	else if(!start && data_loop == 6'h1d)
	begin
		inv_twid_0 <= inv_shi_64; inv_twid_1 <= inv_shi_65; inv_twid_2 <= inv_shi_66; inv_twid_3 <= inv_shi_67;
		inv_twid_4 <= inv_shi_68; inv_twid_5 <= inv_shi_69; inv_twid_6 <= inv_shi_70; inv_twid_7 <= inv_shi_71;

		inv_twid_8 <= inv_shi_56; inv_twid_9 <= inv_shi_57; inv_twid_10 <= inv_shi_58; inv_twid_11 <= inv_shi_59;		
		inv_twid_12 <= inv_shi_44; inv_twid_13 <= inv_shi_45;  inv_twid_14 <= inv_shi_30;     


	end

	else if(!start && data_loop == 6'h1e)
	begin
		inv_twid_0 <= inv_shi_80; inv_twid_1 <= inv_shi_81; inv_twid_2 <= inv_shi_82; inv_twid_3 <= inv_shi_83;
		inv_twid_4 <= inv_shi_84; inv_twid_5 <= inv_shi_85; inv_twid_6 <= inv_shi_86; inv_twid_7 <= inv_shi_87;

		inv_twid_8 <= inv_shi_72; inv_twid_9 <= inv_shi_73; inv_twid_10 <= inv_shi_74; inv_twid_11 <= inv_shi_75;		
		inv_twid_12 <= inv_shi_60; inv_twid_13 <= inv_shi_61;  inv_twid_14 <= inv_shi_46;    


	end

	else if(!start && data_loop == 6'h1f)
	begin
		inv_twid_0 <= inv_shi_96; inv_twid_1 <= inv_shi_97; inv_twid_2 <= inv_shi_98; inv_twid_3 <= inv_shi_99;
		inv_twid_4 <= inv_shi_100; inv_twid_5 <= inv_shi_101; inv_twid_6 <= inv_shi_102; inv_twid_7 <= inv_shi_103;

		inv_twid_8 <= inv_shi_88; inv_twid_9 <= inv_shi_89; inv_twid_10 <= inv_shi_90; inv_twid_11 <= inv_shi_91;		
		inv_twid_12 <= inv_shi_76; inv_twid_13 <= inv_shi_77; inv_twid_14 <= inv_shi_62;        

	end

	else if(!start && data_loop == 6'h20)
	begin
		inv_twid_0 <= inv_shi_112; inv_twid_1 <= inv_shi_113; inv_twid_2 <= inv_shi_114; inv_twid_3 <= inv_shi_115;
		inv_twid_4 <= inv_shi_116; inv_twid_5 <= inv_shi_117; inv_twid_6 <= inv_shi_118; inv_twid_7 <= inv_shi_119;

		inv_twid_8 <= inv_shi_104; inv_twid_9 <= inv_shi_105; inv_twid_10 <= inv_shi_106; inv_twid_11 <= inv_shi_107;		
		inv_twid_12 <= inv_shi_92; inv_twid_13 <= inv_shi_93; inv_twid_14 <= inv_shi_78;   

	end

	else if(!start && data_loop == 6'h21)
	begin
		inv_twid_0 <= inv_shi_128; inv_twid_1 <= inv_shi_129; inv_twid_2 <= inv_shi_130; inv_twid_3 <= inv_shi_131;
		inv_twid_4 <= inv_shi_132; inv_twid_5 <= inv_shi_133; inv_twid_6 <= inv_shi_134; inv_twid_7 <= inv_shi_135;

		inv_twid_8 <= inv_shi_120; inv_twid_9 <= inv_shi_121; inv_twid_10 <= inv_shi_122; inv_twid_11 <= inv_shi_123;		
		inv_twid_12 <= inv_shi_108; inv_twid_13 <= inv_shi_109;  inv_twid_14 <= inv_shi_94; 


	end

	else if(!start && data_loop == 6'h22)
	begin
		inv_twid_0 <= inv_shi_144; inv_twid_1 <= inv_shi_145; inv_twid_2 <= inv_shi_146; inv_twid_3 <= inv_shi_147;
		inv_twid_4 <= inv_shi_148; inv_twid_5 <= inv_shi_149; inv_twid_6 <= inv_shi_150; inv_twid_7 <= inv_shi_151;

		inv_twid_8 <= inv_shi_136; inv_twid_9 <= inv_shi_137; inv_twid_10 <= inv_shi_138; inv_twid_11 <= inv_shi_139;		
		inv_twid_12 <= inv_shi_124; inv_twid_13 <= inv_shi_125; inv_twid_14 <= inv_shi_110;  

	end

	else if(!start && data_loop == 6'h23)
	begin
		inv_twid_0 <= inv_shi_160; inv_twid_1 <= inv_shi_161; inv_twid_2 <= inv_shi_162; inv_twid_3 <= inv_shi_163;
		inv_twid_4 <= inv_shi_164; inv_twid_5 <= inv_shi_165; inv_twid_6 <= inv_shi_166; inv_twid_7 <= inv_shi_167;

		inv_twid_8 <= inv_shi_152; inv_twid_9 <= inv_shi_153; inv_twid_10 <= inv_shi_154; inv_twid_11 <= inv_shi_155;		
		inv_twid_12 <= inv_shi_140; inv_twid_13 <= inv_shi_141; inv_twid_14 <= inv_shi_126;   

	end

	else if(!start && data_loop == 6'h24)
	begin
		inv_twid_0 <= inv_shi_176; inv_twid_1 <= inv_shi_177; inv_twid_2 <= inv_shi_178; inv_twid_3 <= inv_shi_179;
		inv_twid_4 <= inv_shi_180; inv_twid_5 <= inv_shi_181; inv_twid_6 <= inv_shi_182; inv_twid_7 <= inv_shi_183;

		inv_twid_8 <= inv_shi_168; inv_twid_9 <= inv_shi_169; inv_twid_10 <= inv_shi_170; inv_twid_11 <= inv_shi_171;		
		inv_twid_12 <= inv_shi_156; inv_twid_13 <= inv_shi_157; inv_twid_14 <= inv_shi_142;    

	end

	else if(!start && data_loop == 6'h25)
	begin
		inv_twid_0 <= inv_shi_192; inv_twid_1 <= inv_shi_193; inv_twid_2 <= inv_shi_194; inv_twid_3 <= inv_shi_195;
		inv_twid_4 <= inv_shi_196; inv_twid_5 <= inv_shi_197; inv_twid_6 <= inv_shi_198; inv_twid_7 <= inv_shi_199;

		inv_twid_8 <= inv_shi_184; inv_twid_9 <= inv_shi_185; inv_twid_10 <= inv_shi_186; inv_twid_11 <= inv_shi_187;		
		inv_twid_12 <= inv_shi_172; inv_twid_13 <= inv_shi_173; inv_twid_14 <= inv_shi_158;    


	end

	else if(!start && data_loop == 6'h26)
	begin
		inv_twid_0 <= inv_shi_208; inv_twid_1 <= inv_shi_209; inv_twid_2 <= inv_shi_210; inv_twid_3 <= inv_shi_211;
		inv_twid_4 <= inv_shi_212; inv_twid_5 <= inv_shi_213; inv_twid_6 <= inv_shi_214; inv_twid_7 <= inv_shi_215;

		inv_twid_8 <= inv_shi_200; inv_twid_9 <= inv_shi_201; inv_twid_10 <= inv_shi_202; inv_twid_11 <= inv_shi_203;		
		inv_twid_12 <= inv_shi_188; inv_twid_13 <= inv_shi_189; inv_twid_14 <= inv_shi_174; 


	end

	else if(!start && data_loop == 6'h27)
	begin
		inv_twid_0 <= inv_shi_224; inv_twid_1 <= inv_shi_225; inv_twid_2 <= inv_shi_226; inv_twid_3 <= inv_shi_227;
		inv_twid_4 <= inv_shi_228; inv_twid_5 <= inv_shi_229; inv_twid_6 <= inv_shi_230; inv_twid_7 <= inv_shi_231;

		inv_twid_8 <= inv_shi_216; inv_twid_9 <= inv_shi_217; inv_twid_10 <= inv_shi_218; inv_twid_11 <= inv_shi_219;		
		inv_twid_12 <= inv_shi_204; inv_twid_13 <= inv_shi_205; inv_twid_14 <= inv_shi_190;


	end

	else if(!start && data_loop == 6'h28)
	begin
		inv_twid_0 <= inv_shi_240; inv_twid_1 <= inv_shi_241; inv_twid_2 <= inv_shi_242; inv_twid_3 <= inv_shi_243;
		inv_twid_4 <= inv_shi_244; inv_twid_5 <= inv_shi_245; inv_twid_6 <= inv_shi_246; inv_twid_7 <= inv_shi_247;

		inv_twid_8 <= inv_shi_232; inv_twid_9 <= inv_shi_233; inv_twid_10 <= inv_shi_234; inv_twid_11 <= inv_shi_235;		
		inv_twid_12 <= inv_shi_220; inv_twid_13 <= inv_shi_221; inv_twid_14 <= inv_shi_206; 


	end
	
	else if(!start && data_loop == 6'h29)
	begin
		inv_twid_0 <= inv_shi_240; inv_twid_1 <= inv_shi_241; inv_twid_2 <= inv_shi_242; inv_twid_3 <= inv_shi_243;
		inv_twid_4 <= inv_shi_244; inv_twid_5 <= inv_shi_245; inv_twid_6 <= inv_shi_246; inv_twid_7 <= inv_shi_247;

		inv_twid_8 <= inv_shi_248; inv_twid_9 <= inv_shi_249; inv_twid_10 <= inv_shi_250; inv_twid_11 <= inv_shi_251;		
		inv_twid_12 <= inv_shi_236; inv_twid_13 <= inv_shi_237; inv_twid_14 <= inv_shi_222;


	end
	
	else if(!start && data_loop == 6'h2a)
	begin
		inv_twid_0 <= inv_shi_240; inv_twid_1 <= inv_shi_241; inv_twid_2 <= inv_shi_242; inv_twid_3 <= inv_shi_243;
		inv_twid_4 <= inv_shi_244; inv_twid_5 <= inv_shi_245; inv_twid_6 <= inv_shi_246; inv_twid_7 <= inv_shi_247;

		inv_twid_8 <= inv_shi_248; inv_twid_9 <= inv_shi_249; inv_twid_10 <= inv_shi_250; inv_twid_11 <= inv_shi_251;		
		inv_twid_12 <= inv_shi_252; inv_twid_13 <= inv_shi_253; inv_twid_14 <= inv_shi_238;
		
	end
	
	else if(!start && data_loop == 6'h2b)
	begin
		inv_twid_0 <= inv_shi_240; inv_twid_1 <= inv_shi_241; inv_twid_2 <= inv_shi_242; inv_twid_3 <= inv_shi_243;
		inv_twid_4 <= inv_shi_244; inv_twid_5 <= inv_shi_245; inv_twid_6 <= inv_shi_246; inv_twid_7 <= inv_shi_247;

		inv_twid_8 <= inv_shi_248; inv_twid_9 <= inv_shi_249; inv_twid_10 <= inv_shi_250; inv_twid_11 <= inv_shi_251;		
		inv_twid_12 <= inv_shi_252; inv_twid_13 <= inv_shi_253;  inv_twid_14 <= inv_shi_254;
		
	end
	
	else if(!start && data_loop == 6'h2c)
	begin
		inv_twid_0 <= inv_shi_260; inv_twid_1 <= inv_shi_261; inv_twid_2 <= inv_shi_262; inv_twid_3 <= inv_shi_263;
		inv_twid_4 <= inv_shi_264; inv_twid_5 <= inv_shi_265; inv_twid_6 <= inv_shi_266; inv_twid_7 <= inv_shi_267;

		inv_twid_8 <= inv_shi_268; inv_twid_9 <= inv_shi_269; inv_twid_10 <= inv_shi_270; inv_twid_11 <= inv_shi_271;		
		inv_twid_12 <= inv_shi_272; inv_twid_13 <= inv_shi_273;  inv_twid_14 <= inv_shi_274;
		
	end
	
	else if(!start && data_loop == 6'h2d)
	begin
		inv_twid_0 <= inv_shi_260; inv_twid_1 <= inv_shi_261; inv_twid_2 <= inv_shi_262; inv_twid_3 <= inv_shi_263;
		inv_twid_4 <= inv_shi_264; inv_twid_5 <= inv_shi_265; inv_twid_6 <= inv_shi_266; inv_twid_7 <= inv_shi_267;

		inv_twid_8 <= inv_shi_268; inv_twid_9 <= inv_shi_269; inv_twid_10 <= inv_shi_270; inv_twid_11 <= inv_shi_271;		
		inv_twid_12 <= inv_shi_272; inv_twid_13 <= inv_shi_273;  inv_twid_14 <= inv_shi_274;
		
	end
	

  end
    
endmodule
