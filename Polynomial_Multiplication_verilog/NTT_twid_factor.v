`timescale 1ns / 1ps

module twiddle_data(
    input start, switch, clk,
    input [5:0] data_loop,
    output reg [15:0] twid_0, twid_1, twid_2, twid_3,
           twid_4, twid_5, twid_6, twid_7,
           twid_8, twid_9, twid_10, twid_11,
           twid_12, twid_13, twid_14
    );
    
    //defining twiddle value 
    reg [15:0] shi_128 = 16'd4298, shi_64 = 16'd1213, shi_192 = 16'd5756;
    reg [15:0] shi_32 = 16'd0527, shi_160 = 16'd6832, shi_96 = 16'd1728, shi_224 = 16'd7098;
    
    reg [15:0] shi_16 = 16'd2784, shi_144 = 16'd6315, shi_80 = 16'd5033, shi_208 = 16'd2138;
    reg [15:0] shi_48 = 16'd0097, shi_176 = 16'd2132, shi_112 = 16'd2446, shi_240 = 16'd5300;
    
    //defining twiddle value 
    reg [15:0] shi_8 = 16'd6803, shi_4 = 16'd6986, shi_132 = 16'd0799;
    reg [15:0] shi_2 = 16'd2900, shi_130 = 16'd5618, shi_66 = 16'd7483, shi_194 = 16'd1587;
    
    reg [15:0] shi_1 = 16'd2689, shi_129 = 16'd5098, shi_65 = 16'd5013, shi_193 = 16'd0669;
    reg [15:0] shi_33 = 16'd3799, shi_161 = 16'd5977, shi_97 = 16'd7268, shi_225 = 16'd6918;
    
    //defining twiddle value 
    reg [15:0] shi_136 = 16'd5887, shi_68 = 16'd3411, shi_196 = 16'd5130;
    reg [15:0] shi_34 = 16'd4603, shi_162 = 16'd5119, shi_98 = 16'd7033, shi_226 = 16'd3099;
    
    reg [15:0] shi_17 = 16'd1885, shi_145 = 16'd5956, shi_81 = 16'd5248, shi_209 = 16'd4488;
    reg [15:0] shi_49 = 16'd2546, shi_177 = 16'd4964, shi_113 = 16'd0536, shi_241 = 16'd7109;
    
    //defining twiddle value
    reg [15:0] shi_72 = 16'd5835, shi_36 = 16'd0732, shi_164 = 16'd4607;
    reg [15:0] shi_18 = 16'd3892, shi_146 = 16'd6279, shi_82 = 16'd4862, shi_210 = 16'd4556;
    
    reg [15:0] shi_9 = 16'd5309, shi_137 = 16'd5512, shi_73 = 16'd3139, shi_201 = 16'd3586;
    reg [15:0] shi_41 = 16'd1959, shi_169 = 16'd1406, shi_105 = 16'd2838, shi_233 = 16'd0296;
    
    
    //defining twiddle value
    reg [15:0] shi_200 = 16'd7006, shi_100 = 16'd2508, shi_228 = 16'd2941;
    reg [15:0] shi_50 = 16'd6453, shi_178 = 16'd6584, shi_114 = 16'd0550, shi_242 = 16'd5833;
    
    reg [15:0] shi_25 = 16'd3376, shi_153 = 16'd0639, shi_89 = 16'd1115, shi_217 = 16'd7007;
    reg [15:0] shi_57 = 16'd4841, shi_185 = 16'd6470, shi_121 = 16'd3849, shi_249 = 16'd5809;

    
    //defining twiddle value
    reg [15:0] shi_40 = 16'd2645, shi_20 = 16'd2423, shi_148 = 16'd6299;
    reg [15:0] shi_10 = 16'd0869, shi_138 = 16'd1996, shi_74 = 16'd1800, shi_202 = 16'd1633;
    
    reg [15:0] shi_5 = 16'd4806, shi_133 = 16'd1979, shi_69 = 16'd7480, shi_197 = 16'd4055;
    reg [15:0] shi_37 = 16'd5713, shi_165 = 16'd5998, shi_101 = 16'd1607, shi_229 = 16'd1667;

    
    //defining twiddle value
    reg [15:0] shi_168 = 16'd5282, shi_84 = 16'd0243, shi_212 = 16'd7479;
    reg [15:0] shi_42 = 16'd2844, shi_170 = 16'd3041, shi_106 = 16'd1003, shi_234 = 16'd1853;
    
    reg [15:0] shi_21 = 16'd4066, shi_149 = 16'd1393, shi_85 = 16'd0856, shi_213 = 16'd7570;
    reg [15:0] shi_53 = 16'd7464, shi_181 = 16'd4416, shi_117 = 16'd5614, shi_245 = 16'd2951;

    //defining twiddle value
    reg [15:0] shi_104 = 16'd3654, shi_52 = 16'd1714, shi_180 = 16'd0693;
    reg [15:0] shi_26 = 16'd5118, shi_154 = 16'd6461, shi_90 = 16'd1886, shi_218 = 16'd2573;
    
    reg [15:0] shi_13 = 16'd1065, shi_141 = 16'd7175, shi_77 = 16'd1437, shi_205 = 16'd0702;
    reg [15:0] shi_45 = 16'd0542, shi_173 = 16'd2173, shi_109 = 16'd4561, shi_237 = 16'd1266;

    //defining twiddle value
    reg [15:0] shi_232 = 16'd3092, shi_116 = 16'd0584, shi_244 = 16'd6026;
    reg [15:0] shi_58 = 16'd6974, shi_186 = 16'd2990, shi_122 = 16'd2681, shi_250 = 16'd1438;
    
    reg [15:0] shi_29 = 16'd0738, shi_157 = 16'd7352, shi_93 = 16'd4198, shi_221 = 16'd0335;
    reg [15:0] shi_61 = 16'd4876, shi_189 = 16'd3280, shi_125 = 16'd0218, shi_253 = 16'd7563;
    
    //defining twiddle value
    reg [15:0] shi_24 = 16'd5408, shi_12 = 16'd1875, shi_140 = 16'd1381;
    reg [15:0] shi_6 = 16'd7462, shi_134 = 16'd3501, shi_70 = 16'd3188, shi_198 = 16'd6801;
    
    reg [15:0] shi_3 = 16'd4882, shi_131 = 16'd6025, shi_67 = 16'd7496, shi_195 = 16'd3694;
    reg [15:0] shi_35 = 16'd7360, shi_163 = 16'd2922, shi_99 = 16'd2358, shi_227 = 16'd3445;
    
    //defining twiddle value
    reg [15:0] shi_152 = 16'd1112, shi_76 = 16'd5165, shi_204 = 16'd1080;
    reg [15:0] shi_38 = 16'd6266, shi_166 = 16'd1682, shi_102 = 16'd4149, shi_230 = 16'd4801;
    
    reg [15:0] shi_19 = 16'd1717, shi_147 = 16'd5906, shi_83 = 16'd1170, shi_211 = 16'd5286;
    reg [15:0] shi_51 = 16'd6182, shi_179 = 16'd1657, shi_115 = 16'd2110, shi_243 = 16'd5200;
    
    //defining twiddle value
    reg [15:0] shi_88 = 16'd0365, shi_44 = 16'd4601, shi_172 = 16'd4204;
    reg [15:0] shi_22 = 16'd0257, shi_150 = 16'd6203, shi_86 = 16'd4501, shi_214 = 16'd4540;
    
    reg [15:0] shi_11 = 16'd2012, shi_139 = 16'd6451, shi_75 = 16'd5679, shi_203 = 16'd5805;
    reg [15:0] shi_43 = 16'd0346, shi_171 = 16'd4675, shi_107 = 16'd4924, shi_235 = 16'd2197;
    
    //defining twiddle value
    reg [15:0] shi_216 = 16'd2268, shi_108 = 16'd0528, shi_236 = 16'd3449;
    reg [15:0] shi_54 = 16'd5729, shi_182 = 16'd5637, shi_118 = 16'd5653, shi_246 = 16'd1591;
    
    reg [15:0] shi_27 = 16'd4921, shi_155 = 16'd4665, shi_91 = 16'd1036, shi_219 = 16'd5429;
    reg [15:0] shi_59 = 16'd4870, shi_187 = 16'd0535, shi_123 = 16'd0621, shi_251 = 16'd3751;
    
    //defining twiddle value
    reg [15:0] shi_56 = 16'd0330, shi_28 = 16'd4957, shi_156 = 16'd5773;
    reg [15:0] shi_14 = 16'd4784, shi_142 = 16'd7276, shi_78 = 16'd3837, shi_206 = 16'd0319;
    
    reg [15:0] shi_7 = 16'd7283, shi_135 = 16'd2259, shi_71 = 16'd1129, shi_199 = 16'd5731;
    reg [15:0] shi_39 = 16'd5322, shi_167 = 16'd7619, shi_103 = 16'd3546, shi_231 = 16'd1604;

    //defining twiddle value
    reg [15:0] shi_184 = 16'd4681, shi_92 = 16'd2881, shi_220 = 16'd0766;
    reg [15:0] shi_46 = 16'd0993, shi_174 = 16'd4959, shi_110 = 16'd6273, shi_238 = 16'd1044;
   
    reg [15:0] shi_23 = 16'd5631, shi_151 = 16'd6888, shi_87 = 16'd1994, shi_215 = 16'd5897;
    reg [15:0] shi_55 = 16'd2671, shi_183 = 16'd4544, shi_119 = 16'd6222, shi_247 = 16'd4595;
    
    //defining twiddle value
    reg [15:0] shi_120 = 16'd4928, shi_60 = 16'd5212, shi_188 = 16'd3380;
    reg [15:0] shi_30 = 16'd1155, shi_158 = 16'd2264, shi_94 = 16'd3073, shi_222 = 16'd4115;
    
    reg [15:0] shi_15 = 16'd0094, shi_143 = 16'd4600, shi_79 = 16'd6488, shi_207 = 16'd3394;
    reg [15:0] shi_47 = 16'd3452, shi_175 = 16'd4685, shi_111 = 16'd1131, shi_239 = 16'd6646;
    
    //defining twiddle value
    reg [15:0] shi_248 = 16'd1286, shi_124 = 16'd1740, shi_252 = 16'd4907;
    reg [15:0] shi_62 = 16'd3780, shi_190 = 16'd1125, shi_126 = 16'd7264, shi_254 = 16'd5088;
    
    reg [15:0] shi_31 = 16'd3765, shi_159 = 16'd5784, shi_95 = 16'd4431, shi_223 = 16'd3239;
    reg [15:0] shi_63 = 16'd2457, shi_191 = 16'd6492, shi_127 = 16'd0113, shi_255 = 16'd1771;
    
    
    //logic to developing esssential twiddle faactor
    always @(posedge clk)
    begin
      if(!start && !switch)
      begin
        twid_0 <= shi_128; twid_1 <= shi_64; twid_2 <= shi_192; 
        twid_3 <= shi_32; twid_4 <= shi_160; twid_5 <= shi_96; twid_6 <= shi_224;
        
        twid_7 <= shi_16; twid_8 <= shi_144; twid_9 <= shi_80; twid_10 <= shi_208;
        twid_11 <= shi_48; twid_12 <= shi_176; twid_13 <= shi_112; twid_14 <= shi_240;
      end
      
      else if(!start && switch && data_loop == 6'h15)
      begin
        twid_0 <= shi_8; twid_1 <= shi_64; twid_2 <= shi_192; 
        twid_3 <= shi_32; twid_4 <= shi_160; twid_5 <= shi_96; twid_6 <= shi_224;
        
        twid_7 <= shi_16; twid_8 <= shi_144; twid_9 <= shi_80; twid_10 <= shi_208;
        twid_11 <= shi_48; twid_12 <= shi_176; twid_13 <= shi_112; twid_14 <= shi_240; 
      end
      
      else if(!start && switch && data_loop == 6'h16)
      begin
        twid_0 <= shi_136; twid_1 <= shi_4; twid_2 <= shi_132; 
        twid_3 <= shi_32; twid_4 <= shi_160; twid_5 <= shi_96; twid_6 <= shi_224;
        
        twid_7 <= shi_16; twid_8 <= shi_144; twid_9 <= shi_80; twid_10 <= shi_208;
        twid_11 <= shi_48; twid_12 <= shi_176; twid_13 <= shi_112; twid_14 <= shi_240; 
      end
      
      else if(!start && switch && data_loop == 6'h17)
      begin
        twid_0 <= shi_72; twid_1 <= shi_68; twid_2 <= shi_196; 
        twid_3 <= shi_2; twid_4 <= shi_130; twid_5 <= shi_66; twid_6 <= shi_194;
        
        twid_7 <= shi_16; twid_8 <= shi_144; twid_9 <= shi_80; twid_10 <= shi_208;
        twid_11 <= shi_48; twid_12 <= shi_176; twid_13 <= shi_112; twid_14 <= shi_240; 
      end
      
      else if(!start && switch && data_loop == 6'h18)
      begin
        twid_0 <= shi_200; twid_1 <= shi_36; twid_2 <= shi_164; 
        twid_3 <= shi_34; twid_4 <= shi_162; twid_5 <= shi_98; twid_6 <= shi_226;
        
        twid_7 <= shi_1; twid_8 <= shi_129; twid_9 <= shi_65; twid_10 <= shi_193;
        twid_11 <= shi_33; twid_12 <= shi_161; twid_13 <= shi_97; twid_14 <= shi_225; 
      end

      else if(!start && switch && data_loop == 6'h19)
      begin
        twid_0 <= shi_40; twid_1 <= shi_100; twid_2 <= shi_228; 
        twid_3 <= shi_18; twid_4 <= shi_146; twid_5 <= shi_82; twid_6 <= shi_210;
        
        twid_7 <= shi_17; twid_8 <= shi_145; twid_9 <= shi_81; twid_10 <= shi_209;
        twid_11 <= shi_49; twid_12 <= shi_177; twid_13 <= shi_113; twid_14 <= shi_241; 
      end
      
      else if(!start && switch && data_loop == 6'h1a)
      begin
        twid_0 <= shi_168; twid_1 <= shi_20; twid_2 <= shi_148; 
        twid_3 <= shi_50; twid_4 <= shi_178; twid_5 <= shi_114; twid_6 <= shi_242;
        
        twid_7 <= shi_9; twid_8 <= shi_137; twid_9 <= shi_73; twid_10 <= shi_201;
        twid_11 <= shi_41; twid_12 <= shi_169; twid_13 <= shi_105; twid_14 <= shi_233; 
      end
      
      else if(!start && switch && data_loop == 6'h1b)
      begin
        twid_0 <= shi_104; twid_1 <= shi_84; twid_2 <= shi_212; 
        twid_3 <= shi_10; twid_4 <= shi_138; twid_5 <= shi_74; twid_6 <= shi_202;
        
        twid_7 <= shi_25; twid_8 <= shi_153; twid_9 <= shi_89; twid_10 <= shi_217;
        twid_11 <= shi_57; twid_12 <= shi_185; twid_13 <= shi_121; twid_14 <= shi_249; 
      end
      
      else if(!start && switch && data_loop == 6'h1c)
      begin
        twid_0 <= shi_232; twid_1 <= shi_52; twid_2 <= shi_180; 
        twid_3 <= shi_42; twid_4 <= shi_170; twid_5 <= shi_106; twid_6 <= shi_234;
        
        twid_7 <= shi_5; twid_8 <= shi_133; twid_9 <= shi_69; twid_10 <= shi_197;
        twid_11 <= shi_37; twid_12 <= shi_165; twid_13 <= shi_101; twid_14 <= shi_229; 
      end
      
      else if(!start && switch && data_loop == 6'h1d)
      begin
        twid_0 <= shi_24; twid_1 <= shi_116; twid_2 <= shi_244; 
        twid_3 <= shi_26; twid_4 <= shi_154; twid_5 <= shi_90; twid_6 <= shi_218;
        
        twid_7 <= shi_21; twid_8 <= shi_149; twid_9 <= shi_85; twid_10 <= shi_213;
        twid_11 <= shi_53; twid_12 <= shi_181; twid_13 <= shi_117; twid_14 <= shi_245; 
      end
      
      else if(!start && switch && data_loop == 6'h1e)
      begin
        twid_0 <= shi_152; twid_1 <= shi_12; twid_2 <= shi_140; 
        twid_3 <= shi_58; twid_4 <= shi_186; twid_5 <= shi_122; twid_6 <= shi_250;
        
        twid_7 <= shi_13; twid_8 <= shi_141; twid_9 <= shi_77; twid_10 <= shi_205;
        twid_11 <= shi_45; twid_12 <= shi_173; twid_13 <= shi_109; twid_14 <= shi_237; 
      end
      
      else if(!start && switch && data_loop == 6'h1f)
      begin
        twid_0 <= shi_88; twid_1 <= shi_76; twid_2 <= shi_204; 
        twid_3 <= shi_6; twid_4 <= shi_134; twid_5 <= shi_70; twid_6 <= shi_198;
        
        twid_7 <= shi_29; twid_8 <= shi_157; twid_9 <= shi_93; twid_10 <= shi_221;
        twid_11 <= shi_61; twid_12 <= shi_189; twid_13 <= shi_125; twid_14 <= shi_253; 
      end
      
      else if(!start && switch && data_loop == 6'h20)
      begin
        twid_0 <= shi_216; twid_1 <= shi_44; twid_2 <= shi_172; 
        twid_3 <= shi_38; twid_4 <= shi_166; twid_5 <= shi_102; twid_6 <= shi_230;
        
        twid_7 <= shi_3; twid_8 <= shi_131; twid_9 <= shi_67; twid_10 <= shi_195;
        twid_11 <= shi_35; twid_12 <= shi_163; twid_13 <= shi_99; twid_14 <= shi_227; 
      end
      
      else if(!start && switch && data_loop == 6'h21)
      begin
        twid_0 <= shi_56; twid_1 <= shi_108; twid_2 <= shi_236; 
        twid_3 <= shi_22; twid_4 <= shi_150; twid_5 <= shi_86; twid_6 <= shi_214;
        
        twid_7 <= shi_19; twid_8 <= shi_147; twid_9 <= shi_83; twid_10 <= shi_211;
        twid_11 <= shi_51; twid_12 <= shi_179; twid_13 <= shi_115; twid_14 <= shi_243; 
      end
      
      else if(!start && switch && data_loop == 6'h22)
      begin
        twid_0 <= shi_184; twid_1 <= shi_28; twid_2 <= shi_156; 
        twid_3 <= shi_54; twid_4 <= shi_182; twid_5 <= shi_118; twid_6 <= shi_246;
        
        twid_7 <= shi_11; twid_8 <= shi_139; twid_9 <= shi_75; twid_10 <= shi_203;
        twid_11 <= shi_43; twid_12 <= shi_171; twid_13 <= shi_107; twid_14 <= shi_235; 
      end
      
      else if(!start && switch && data_loop == 6'h23)
      begin
        twid_0 <= shi_120; twid_1 <= shi_92; twid_2 <= shi_220; 
        twid_3 <= shi_14; twid_4 <= shi_142; twid_5 <= shi_78; twid_6 <= shi_206;
        
        twid_7 <= shi_27; twid_8 <= shi_155; twid_9 <= shi_91; twid_10 <= shi_219;
        twid_11 <= shi_59; twid_12 <= shi_187; twid_13 <= shi_123; twid_14 <= shi_251; 
      end
      
      else if(!start && switch && data_loop == 6'h24)
      begin
        twid_0 <= shi_248; twid_1 <= shi_60; twid_2 <= shi_188; 
        twid_3 <= shi_46; twid_4 <= shi_174; twid_5 <= shi_110; twid_6 <= shi_238;
        
        twid_7 <= shi_7; twid_8 <= shi_135; twid_9 <= shi_71; twid_10 <= shi_199;
        twid_11 <= shi_39; twid_12 <= shi_167; twid_13 <= shi_103; twid_14 <= shi_231; 
      end
      
      else if(!start && switch && data_loop == 6'h25)
      begin
        twid_0 <= shi_248; twid_1 <= shi_124; twid_2 <= shi_252; 
        twid_3 <= shi_30; twid_4 <= shi_158; twid_5 <= shi_94; twid_6 <= shi_222;
        
        twid_7 <= shi_23; twid_8 <= shi_151; twid_9 <= shi_87; twid_10 <= shi_215;
        twid_11 <= shi_55; twid_12 <= shi_183; twid_13 <= shi_119; twid_14 <= shi_247; 
      end
      
      else if(!start && switch && data_loop == 6'h26)
      begin
        twid_0 <= shi_248; twid_1 <= shi_124; twid_2 <= shi_252; 
        twid_3 <= shi_62; twid_4 <= shi_190; twid_5 <= shi_126; twid_6 <= shi_254;
        
        twid_7 <= shi_15; twid_8 <= shi_143; twid_9 <= shi_79; twid_10 <= shi_207;
        twid_11 <= shi_47; twid_12 <= shi_175; twid_13 <= shi_111; twid_14 <= shi_239; 
      end
      
      else if(!start && switch && data_loop == 6'h27)
      begin
        twid_0 <= shi_248; twid_1 <= shi_124; twid_2 <= shi_252; 
        twid_3 <= shi_62; twid_4 <= shi_190; twid_5 <= shi_126; twid_6 <= shi_254;
        
        twid_7 <= shi_31; twid_8 <= shi_159; twid_9 <= shi_95; twid_10 <= shi_223;
        twid_11 <= shi_63; twid_12 <= shi_191; twid_13 <= shi_127; twid_14 <= shi_255; 
      end
      
    end

    
endmodule
