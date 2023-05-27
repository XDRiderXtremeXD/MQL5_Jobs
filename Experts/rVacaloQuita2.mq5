//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "";
#property link "";
#property version "";
#property strict

#define MODE_DIGITS 12
#define MODE_LOTSTEP 24
#define MODE_TICKVALUE 16
#define MODE_MINLOT 23
#define MODE_MAXLOT 25
#define MODE_POINT 11
#define MODE_ASK 10
#define MODE_BID 9
#define OP_BUY 0
#define OP_SELL 1


enum Lang
  {
   r = 0, // ESPAÑOL
   e = 1 // ENGLISH
  };

input Lang __Languale__ = r;  //Language / Idioma
Lang Languale = __Languale__;
input double __StopLossProcent__;//StopLossProcent
double StopLossProcent = __StopLossProcent__;
input bool __UseLotManual__;//UseLotManual
bool UseLotManual = __UseLotManual__;
input double __ManualLot__ = 0.01;//ManualLot
double ManualLot = __ManualLot__;
input double __Risk__ = 1;//Risk
double Risk = __Risk__;
input int __ProfitPips__ = 20;//ProfitPips
int ProfitPips = __ProfitPips__;
input int __MinPips__ = 5;//MinPips
int MinPips = __MinPips__;
input int __TimeFrame__ = 1;//TimeFrame
int TimeFrame = __TimeFrame__;
input int __LimiteMaximoOrdenes__ = 100;  //Max. Orders / Máximo nro. de órdenes
int LimiteMaximoOrdenes = __LimiteMaximoOrdenes__;
input string __pXAUUSD__ = "XAUUSD";   // Main symbol / Símbolo Principal
string pXAUUSD = __pXAUUSD__;
input string __Simbolo1__ = "GBPUSD";  // Aux 1 Symbol / Simbolo Aux 1
string Simbolo1 = __Simbolo1__;
input string __Simbolo2__ = "AUDUSD";  // Aux 2 Symbol / Simbolo Aux 2
string Simbolo2 = __Simbolo2__;
input string __Simbolo3__ = "USDCAD";  // Aux 3 Symbol / Simbolo Aux 3
string Simbolo3 = __Simbolo3__;
input string __Simbolo4__ = "USDCHF";  // Aux 4 Symbol / Simbolo Aux 4
string Simbolo4 = __Simbolo4__;

input int __pXAUUSD_Step__ = 125;//pXAUUSD_Step
int pXAUUSD_Step = __pXAUUSD_Step__;
input int __SimboloAuxiliar1_STEP__ = 25;//SimboloAuxiliar1_STEP
int SimboloAuxiliar1_STEP = __SimboloAuxiliar1_STEP__;
input int __SimboloAuxiliar2_STEP__ = 25;//SimboloAuxiliar2_STEP
int SimboloAuxiliar2_STEP = __SimboloAuxiliar2_STEP__;
input int __SimboloAuxiliar3_STEP__ = 25;//SimboloAuxiliar3_STEP
int SimboloAuxiliar3_STEP = __SimboloAuxiliar3_STEP__;
input int __SimboloAuxiliar4_STEP__ = 25;//SimboloAuxiliar4_STEP
int SimboloAuxiliar4_STEP = __SimboloAuxiliar4_STEP__;



input double __HoraInicioOperativa__ = 8; // Start Time / Hora Inicio Operativa
double HoraInicioOperativa = __HoraInicioOperativa__;
input double __HoraFinOperativa__ = 22; // End Time / Hora Fin Operativa
double HoraFinOperativa = __HoraFinOperativa__;
input int __SpeedEA__ = 50;//SpeedEA
int SpeedEA = __SpeedEA__;
input int __NumeroMagico__ = 888; // Magic Number / Número Mágico
int NumeroMagico = __NumeroMagico__;
input bool __UseUPlot__;//UseUPlot
bool UseUPlot = __UseUPlot__;

int MultiplicadorDigitosSimboloPrincipal = 0;
//bool Gb_0;
int MultiplicadorDigitosSimbolo_1 = 0;
int MultiplicadorDigitosSimbolo_2 = 0;
int MultiplicadorDigitosSimbolo_3 = 0;
int MultiplicadorDigitosSimbolo_4 = 0;

long Gl_0;
int Ii_60 = 0;
int TamanyoFuente = 7;
int ColorDatos = clrRed;
int ColorTextoLineas = clrGreen;
double LotajeSimboloPrincipal = 0;
double LotajeSimboloAuxiliar_1 = 0;
double LotajeSimboloAuxiliar_2 = 0;
double LotajeSimboloAuxiliar_3 = 0;
double LotajeSimboloAuxiliar_4 = 0;
double Gd_5;

//bool Gb_5;
double PipsVelaSimboloPrincipal = 0;
double PipsVelaSimboloAuxiliar_1 = 0;
double PipsVelaSimboloAuxiliar_2 = 0;
double PipsVelaSimboloAuxiliar_3 = 0;
double PipsVelaSimboloAuxiliar_4 = 0;
int Gi_5;
int DigitosDecimalesSimboloPrincipal = 0;
int Gi_6;
double LotajeSimPrincipal;
long HoraAperturaSimboloPrincipal;
int OrdenesTotalesSimboloPrincipal;
int Gi_A;
double Gd_9;
int DigitosDecimalesSimboloAuxiliar_1 = 0;
int Gi_B;
double LotajeSimAuxiliar_1;
long HoraAperturaSimboloAuxiliar_1;
int OrdenesTotalesSimboloAuxiliar_1;
int Gi_F;
double Gd_E;
int DigitosDecimalesSimboloAuxiliar_2 = 0;
int Gi_10;
double LotajeSimAuxiliar_2;
long HoraAperturaSimboloAuxiliar_2;
int OrdenesTotalesSimboloAuxiliar_2;
int Gi_14;
double Gd_13;
int DigitosDecimalesSimboloAuxiliar_3 = 0;
int Gi_15;
double LotajeSimAuxiliar_3;
long HoraAperturaSimboloAuxiliar_3;
int OrdenesTotalesSimboloAuxiliar_3;
int Gi_19;
double Gd_18;
int DigitosDecimalesSimboloAuxiliar_4 = 0;
int Gi_1A;
double LotajeSimAuxiliar_4;
long HoraAperturaSimboloAuxiliar_4;
int Gi_1D;
int Gi_1E;
double Gd_1D;
bool Gb_1D;
int Gi_1F;
int Gi_20;
int Gi_21;
long Gl_20;
int Gi_22;
int Gi_23;
int Gi_24;
long Gl_23;
int Gi_25;
int Gi_26;
int Gi_27;
int Gi_28;
bool Gb_27;
string ComentarioEA = "@Vacaloquita";
int OrdenEnviada = 0;
int Gi_29;
int Gi_2A;
int Gi_2B;
long Gl_2A;
int Gi_2C;
int Gi_2D;
int Gi_2E;
long Gl_2D;
int Gi_2F;
int Gi_30;
int Gi_31;
int Gi_32;
bool Gb_31;
int Gi_33;
int Gi_34;
int Gi_35;
long Gl_34;
int Gi_36;
int Gi_37;
int Gi_38;
long Gl_37;
int Gi_39;
int Gi_3A;
int Gi_3B;
int Gi_3C;
bool Gb_3B;
int Gi_3D;
int Gi_3E;
int Gi_3F;
long Gl_3E;
int Gi_40;
int Gi_41;
int Gi_42;
long Gl_41;
int Gi_43;
int Gi_44;
int Gi_45;
int Gi_46;
bool Gb_45;
int Gi_47;
int Gi_48;
int Gi_49;
long Gl_48;
int Gi_4A;
int Gi_4B;
int Gi_4C;
long Gl_4B;
int Gi_4D;
int Gi_4E;
int Gi_4F;
int Gi_50;
bool Gb_4F;
int Gi_51;
int Gi_52;
int Gi_53;
long Gl_52;
int Gi_54;
int Gi_55;
int Gi_56;
long Gl_55;
int Gi_57;
int Gi_58;
int Gi_59;
int Gi_5A;
bool Gb_59;
int Gi_5B;
int Gi_5C;
int Gi_5D;
long Gl_5C;
int Gi_5E;
int Gi_5F;
int Gi_60;
long Gl_5F;
int Gi_61;
int Gi_62;
int Gi_63;
int Gi_64;
bool Gb_63;
int Gi_65;
int Gi_66;
int Gi_67;
long Gl_66;
int Gi_68;
int Gi_69;
int Gi_6A;
long Gl_69;
int Gi_6B;
int Gi_6C;
int Gi_6D;
int Gi_6E;
bool Gb_6D;
int Gi_6F;
int Gi_70;
int Gi_71;
long Gl_70;
int Gi_72;
int Gi_73;
int Gi_74;
long Gl_73;
int Gi_75;
int Gi_76;
int Gi_77;
int Gi_78;
bool Gb_77;
int Gi_79;
int Gi_7A;
int Gi_7B;
long Gl_7A;
int Gi_7C;
int Gi_7D;
int Gi_7E;
long Gl_7D;
int Gi_7F;
int Gi_80;
int Gi_81;
int Gi_82;
bool Gb_81;
int OrdenesAbiertasNumeroMagico;
int Gi_84;
int Gi_85;
bool Gb_84;
int Gi_86;
int Gi_87;
int Gi_88;
long Gl_87;
long Gl_89;
int Gi_89;
int Gi_8A;
int Gi_8B;
int Gi_8C;
long Gl_8B;
int Gi_8D;
int Gi_8E;
int Gi_8F;
long Gl_8E;
int Gi_90;
int NumeroOrdenesBuySimboloPrincipal;
int Gi_92;
int Gi_93;
bool Gb_92;
int Gi_94;
int Gi_95;
int Gi_96;
int Gi_97;
double Gd_96;
bool Gb_96;
int Gi_98;
double Gd_99;
int Gi_9A;
int Gi_9B;
int Gi_9C;
int Gi_9D;
bool Gb_9C;
int Gi_9E;
int Gi_9F;
int Gi_A0;
long Gl_9F;
int Gi_A1;
int Gi_A2;
int Gi_A3;
long Gl_A2;
int Gi_A4;
int NumeroOrdenesSellSimboloPrincipal;
int Gi_A6;
int Gi_A7;
bool Gb_A6;
int Gi_A8;
int Gi_A9;
int Gi_AA;
int Gi_AB;
double Gd_AA;
bool Gb_AA;
double Gd_AC;
int Gi_AD;
double Gd_AE;
int Gi_AF;
int Gi_B0;
int Gi_B1;
int Gi_B2;
bool Gb_B1;
int Gi_B3;
int Gi_B4;
int Gi_B5;
long Gl_B4;
int Gi_B6;
int Gi_B7;
int Gi_B8;
long Gl_B7;
int Gi_B9;
int NumeroOrdenesBuySimboloAuxiliar1;
int Gi_BB;
int Gi_BC;
bool Gb_BB;
int Gi_BD;
int Gi_BE;
int Gi_BF;
int Gi_C0;
double Gd_BF;
bool Gb_BF;
int Gi_C1;
double Gd_C2;
int Gi_C3;
int Gi_C4;
int Gi_C5;
int Gi_C6;
bool Gb_C5;
int Gi_C7;
int Gi_C8;
int Gi_C9;
long Gl_C8;
int Gi_CA;
int Gi_CB;
int Gi_CC;
long Gl_CB;
int Gi_CD;
int NumeroOrdenesSellSimboloAuxiliar1;
int Gi_CF;
int Gi_D0;
bool Gb_CF;
int Gi_D1;
int Gi_D2;
int Gi_D3;
int Gi_D4;
double Gd_D3;
bool Gb_D3;
double Gd_D5;
int Gi_D6;
double Gd_D7;
int Gi_D8;
int Gi_D9;
int Gi_DA;
int Gi_DB;
bool Gb_DA;
int Gi_DC;
int Gi_DD;
int Gi_DE;
long Gl_DD;
int Gi_DF;
int Gi_E0;
int Gi_E1;
long Gl_E0;
int Gi_E2;
int NumeroOrdenesBuySimboloAuxiliar2;
int Gi_E4;
int Gi_E5;
bool Gb_E4;
int Gi_E6;
int Gi_E7;
int Gi_E8;
int Gi_E9;
double Gd_E8;
bool Gb_E8;
int Gi_EA;
double Gd_EB;
int Gi_EC;
int Gi_ED;
int Gi_EE;
int Gi_EF;
bool Gb_EE;
int Gi_F0;
int Gi_F1;
int Gi_F2;
long Gl_F1;
int Gi_F3;
int Gi_F4;
int Gi_F5;
long Gl_F4;
int Gi_F6;
int NumeroOrdenesSellSimboloAuxiliar2;
int Gi_F8;
int Gi_F9;
bool Gb_F8;
int Gi_FA;
int Gi_FB;
int Gi_FC;
int Gi_FD;
double Gd_FC;
bool Gb_FC;
double Gd_FE;
int Gi_FF;
double Gd_100;
int Gi_101;
int Gi_102;
int Gi_103;
int Gi_104;
bool Gb_103;
int Gi_105;
int Gi_106;
int Gi_107;
long Gl_106;
int Gi_108;
int Gi_109;
int Gi_10A;
long Gl_109;
int Gi_10B;
int NumeroOrdenesBuySimboloAuxiliar3;
int Gi_10D;
int Gi_10E;
bool Gb_10D;
int Gi_10F;
int Gi_110;
int Gi_111;
int Gi_112;
double Gd_111;
bool Gb_111;
int Gi_113;
double Gd_114;
int Gi_115;
int Gi_116;
int Gi_117;
int Gi_118;
bool Gb_117;
int Gi_119;
int Gi_11A;
int Gi_11B;
long Gl_11A;
int Gi_11C;
int Gi_11D;
int Gi_11E;
long Gl_11D;
int Gi_11F;
int NumeroOrdenesSellSimboloAuxiliar3;
int Gi_121;
int Gi_122;
bool Gb_121;
int Gi_123;
int Gi_124;
int Gi_125;
int Gi_126;
double Gd_125;
bool Gb_125;
double Gd_127;
int Gi_128;
double Gd_129;
int Gi_12A;
int Gi_12B;
int Gi_12C;
int Gi_12D;
bool Gb_12C;
int Gi_12E;
int Gi_12F;
int Gi_130;
long Gl_12F;
int Gi_131;
int Gi_132;
int Gi_133;
long Gl_132;
int Gi_134;
int NumeroOrdenesBuySimboloAuxiliar4;
int Gi_136;
int Gi_137;
bool Gb_136;
int Gi_138;
int Gi_139;
int Gi_13A;
int Gi_13B;
double Gd_13A;
bool Gb_13A;
int Gi_13C;
double Gd_13D;
int Gi_13E;
int Gi_13F;
int Gi_140;
int Gi_141;
bool Gb_140;
int Gi_142;
int Gi_143;
int Gi_144;
long Gl_143;
int Gi_145;
int Gi_146;
int Gi_147;
long Gl_146;
int Gi_148;
int NumeroOrdenesSellSimboloAuxiliar4;
int Gi_14A;
int Gi_14B;
bool Gb_14A;
int Gi_14C;
int Gi_14D;
int Gi_14E;
int Gi_14F;
double Gd_14E;
bool Gb_14E;
double Gd_150;
int Gi_151;
double Gd_152;
int Gi_153;
int Gi_154;
int Gi_155;
int Gi_156;
bool Gb_155;
int Gi_157;
int Gi_158;
int Gi_159;
long Gl_158;
int Gi_15A;
int Gi_15B;
int Gi_15C;
long Gl_15B;
int Gi_15D;
int Gi_15E;
int Gi_15F;
int Gi_160;
bool Gb_15F;
double Gd_15F;
double Gd_161;
int Gi_162;
double Gd_163;
int Gi_164;
int Gi_165;
int Gi_166;
int Gi_167;
bool Gb_166;
int Gi_168;
int Gi_169;
int Gi_16A;
long Gl_169;
int Gi_16B;
int Gi_16C;
int Gi_16D;
long Gl_16C;
int Gi_16E;
int Gi_16F;
int Gi_170;
int Gi_171;
bool Gb_170;
double Gd_170;
int Gi_172;
double Gd_173;
int Gi_174;
int Gi_175;
int Gi_176;
int Gi_177;
bool Gb_176;
int Gi_178;
int Gi_179;
int Gi_17A;
int Gi_17B;
int Gi_17C;
int Gi_17D;
int Gi_17E;
int Gi_17F;
int Gi_180;
int Gi_181;
int Gi_182;
int Gi_183;
int Gi_184;
int Gi_185;
int Gi_186;
int Gi_187;
int Gi_188;
int Gi_189;
int Gi_18A;
int Gi_18B;
double LotajeTotalOrdenesAbiertas;
int Gi_18D;
int Gi_18E;
double BeneficioTotalOrdenesAbiertas;
int Gi_190;
int Gi_191;
double Gd_190;
bool Gb_190;
int Gi_192;
double Gd_193;
int Gi_194;
double Gd_194;
double Gd_195;
int Gi_196;
bool Gb_196;
double Id_130 = 0;
int Gi_197;
double Gd_196;
double Gd_198;
int Gi_199;
double Gd_199;
double Gd_19A;
int Gi_19B;
int Gi_19C;
double Gd_19B;
bool Gb_19B;
double Gd_19D;
int Gi_19E;
double Gd_19E;
double Gd_19F;
int Gi_1A0;
int Gi_1A1;
double Gd_1A0;
bool Gb_1A0;
double Gd_1A2;
int Gi_1A3;
double Gd_1A3;
double Gd_1A4;
int Gi_1A5;
int Gi_1A6;
double Gd_1A5;
bool Gb_1A5;
double Gd_1A7;
int Gi_1A8;
double Gd_1A8;
double Gd_1A9;
int Gi_1AA;
int Gi_1AB;
double Gd_1AA;
bool Gb_1AA;
double Gd_1AC;
int Gi_1AD;
double Gd_1AD;
double Gd_1AE;
int Gi_1AF;
bool Gb_1AF;
int Gi_1B0;
int Gi_1B1;
int Gi_1B2;
int Gi_1B3;
int Gi_1B4;
int Gi_1B5;
int Gi_1B6;
int Gi_1B7;
int Gi_1B8;
int Gi_1B9;
int Gi_1BA;
int Gi_1BB;
int Gi_1BC;
int Gi_1BD;
int Gi_1BE;
int Gi_1BF;
int Gi_1C0;
int Gi_1C1;
int Gi_1C2;
int Gi_1C3;
int Gi_1C4;
int Gi_1C5;
int Gi_1C6;
int Gi_1C7;
int Gi_1C8;
int Gi_1C9;
int Gi_1CA;
int Gi_1CB;
int Gi_1CC;
int Gi_1CD;
int Gi_1CE;
int Gi_1CF;
int Gi_1D0;
int Gi_1D1;
int Gi_1D2;
int Gi_1D3;
int Gi_1D4;
int Gi_1D5;
int Gi_1D6;
int Gi_1D7;
int Gi_1D8;
int Gi_1D9;
int Gi_1DA;
int Gi_1DB;
int Gi_1DC;
int Gi_1DD;
int Gi_1DE;
int Gi_1DF;
int Gi_1E0;
int Gi_1E1;
int Gi_1E2;
int Gi_1E3;
int Gi_1E4;
int Gi_1E5;
int Gi_1E6;
int Gi_1E7;
int Gi_1E8;
int Gi_1E9;
int Gi_1EA;
int Gi_1EB;
int Gi_1EC;
int Gi_1ED;
int Gi_1EE;
int Gi_1EF;
int Gi_1F0;
int Gi_1F1;
int Gi_1F2;
int Gi_1F3;
int Gi_1F4;
int Gi_1F5;
int Gi_1F6;
int Gi_1F7;
int Gi_1F8;
int Gi_1F9;
int Gi_1FA;
int Gi_1FB;
int Gi_1FC;
int Gi_1FD;
int Gi_1FE;
int Gi_1FF;
int Gi_200;
int Gi_201;
int Gi_202;
int Gi_203;
int Gi_204;
int Gi_205;
int Gi_206;
int Gi_207;
int Gi_208;
int Gi_209;
int Gi_20A;
int Gi_20B;
int Gi_20C;
int Gi_20D;
int Gi_20E;
int Gi_20F;
int Gi_210;
int Gi_211;
double Gd_210;
double Gd_212;
int Gi_213;
double Gd_213;
double Gd_214;
int Gi_215;
int Gi_216;
int Gi_217;
double Gd_216;
double Gd_218;
int Gi_219;
double Gd_219;
double Gd_21A;
int Gi_21B;
int Gi_21C;
int Gi_21D;
int Gi_21E;
int Gi_21F;
int Gi_220;
int Gi_221;
int Gi_222;
int Gi_223;
int Gi_224;
int Gi_225;
int Gi_226;
int Gi_227;
int Gi_228;
int Gi_229;
int Gi_22A;
int Gi_22B;
int Gi_22C;
int Gi_22D;
double Gd_22C;
double Gd_22E;
int Gi_22F;
double Gd_22F;
double Gd_230;
int Gi_231;
int Gi_232;
int Gi_233;
double Gd_232;
double Gd_234;
int Gi_235;
double Gd_235;
double Gd_236;
int Gi_237;
int Gi_238;
int Gi_239;
int Gi_23A;
int Gi_23B;
int Gi_23C;
int Gi_23D;
int Gi_23E;
int Gi_23F;
int Gi_240;
int Gi_241;
int Gi_242;
int Gi_243;
int Gi_244;
int Gi_245;
int Gi_246;
int Gi_247;
int Gi_248;
int Gi_249;
double Gd_248;
double Gd_24A;
int Gi_24B;
double Gd_24B;
double Gd_24C;
int Gi_24D;
int Gi_24E;
int Gi_24F;
double Gd_24E;
double Gd_250;
int Gi_251;
double Gd_251;
double Gd_252;
int Gi_253;
int Gi_254;
int Gi_255;
int Gi_256;
int Gi_257;
int Gi_258;
int Gi_259;
int Gi_25A;
int Gi_25B;
int Gi_25C;
int Gi_25D;
int Gi_25E;
int Gi_25F;
int Gi_260;
int Gi_261;
int Gi_262;
int Gi_263;
int Gi_264;
int Gi_265;
double Gd_264;
double Gd_266;
int Gi_267;
double Gd_267;
double Gd_268;
int Gi_269;
int Gi_26A;
int Gi_26B;
double Gd_26A;
double Gd_26C;
int Gi_26D;
double Gd_26D;
double Gd_26E;
int Gi_26F;
int Gi_270;
int Gi_271;
int Gi_272;
int Gi_273;
int Gi_274;
int Gi_275;
int Gi_276;
int Gi_277;
int Gi_278;
int Gi_279;
int Gi_27A;
int Gi_27B;
int Gi_27C;
int Gi_27D;
int Gi_27E;
int Gi_27F;
int Gi_280;
int Gi_281;
double Gd_280;
double Gd_282;
int Gi_283;
double Gd_283;
double Gd_284;
int Gi_285;
int Gi_286;
int Gi_287;
double Gd_286;
double Gd_288;
int Gi_289;
double Gd_289;
double Gd_28A;
int Gi_28B;
string SimboloEXTRA = "EURAUD";
int Gi_28C;
int Gi_28D;
int Gi_28E;
int Gi_28F;
int Gi_290;
int Gi_291;
double Gd_290;
double Gd_292;
int Gi_293;
double Gd_293;
double Gd_294;
int Gi_295;
int Gi_296;
int Gi_297;
double Gd_296;
double Gd_298;
int Gi_299;
double Gd_299;
double Gd_29A;
int Gi_29B;
double Gd_29C;
int Gi_29D;
int Gi_29E;
double Gd_29D;
bool Gb_29D;
int Gi_29F;
int Gi_2A0;
double Gd_29F;
double Gd_2A1;
int Gi_2A2;
double Gd_2A2;
double Gd_2A3;
int Gi_2A4;
string SimboloActivoEnGrafico;
string TextoON;
string TextoOFF;
long Gl_2A4;
int AnchoBoton = 60;
int AltoBoton = 20;
int ColorTextoBoton = clrRed;
int ColorFondoBoton = clrBlack;
int ColorBordeBoton = clrRed;
int ColorTextoTitulos = clrAliceBlue;
int Gi_2A5;
int Gi_2A6;
int Gi_2A7;
int Gi_2A8;
double Gd_2A7;
long Gl_2A7;
int Gi_2A9;
double Gd_2AA;
int Gi_2AB;
int Gi_2AC;
double Gd_2AB;
long Gl_2AB;
int Gi_2AD;
double Gd_2AE;
int Gi_2AF;
int Gi_2B0;
long Gl_2AF;
double Gd_2AF;
int Gi_2B1;
double Gd_2B2;
int Gi_2B3;
int Gi_2B4;
long Gl_2B3;
double Gd_2B3;
int Gi_2B5;
double Gd_2B6;
int Gi_2B7;
int Gi_2B8;
long Gl_2B7;
double Gd_2B7;
int Gi_2B9;
double Gd_2BA;
int Gi_2BB;
int Gi_2BC;
long Gl_2BB;
double Gd_2BB;
int Gi_2BD;
double Gd_2BE;
int Gi_2BF;
int Gi_2C0;
double Gd_2BF;
long Gl_2BF;
int Gi_2C1;
double Gd_2C2;
int Gi_2C3;
int Gi_2C4;
double Gd_2C3;
long Gl_2C3;
int Gi_2C5;
double Gd_2C6;
int Gi_2C7;
int Gi_2C8;
double Gd_2C7;
long Gl_2C7;
int Gi_2C9;
double Gd_2CA;
int Gi_2CB;
int Gi_2CC;
double Gd_2CB;
long Gl_2CB;
int Gi_2CD;
double Gd_2CE;
int Gi_2CF;
int Gi_2D0;
double Gd_2CF;
long Gl_2CF;
int Gi_2D1;
int Gi_2D2;
int Gi_2D3;
int Gi_2D4;
double Gd_2D3;
long Gl_2D3;
int Gi_2D5;
double Gd_2D6;
int Gi_2D7;
int Gi_2D8;
double Gd_2D7;
long Gl_2D7;
int Gi_2D9;
double Gd_2DA;
int Gi_2DB;
int Gi_2DC;
long Gl_2DB;
double Gd_2DB;
int Gi_2DD;
double Gd_2DE;
int Gi_2DF;
int Gi_2E0;
long Gl_2DF;
double Gd_2DF;
int Gi_2E1;
double Gd_2E2;
int Gi_2E3;
int Gi_2E4;
long Gl_2E3;
double Gd_2E3;
int Gi_2E5;
double Gd_2E6;
int Gi_2E7;
int Gi_2E8;
long Gl_2E7;
double Gd_2E7;
int Gi_2E9;
double Gd_2EA;
int Gi_2EB;
int Gi_2EC;
double Gd_2EB;
long Gl_2EB;
int Ii_64 = 7;
int ColorFondoBotonOFF = clrBeige;
int ColorTextoBotonesBuySell = clrBeige;
int ColorBotonBUY = clrGreen;
int ColorBotonSELL = clrRed;
double BeneficioObjetivoSimboloPrincipal;
double Gd_1;
bool Gb_1;
double Gd_2;
bool Gb_2;
double Gd_3;
bool Gb_3;
double Gd_4;
bool Gb_4;
int Ii_74 = 16777215;
int Gi_0;
int Gi_1;
int Gi_3;
int Gi_8;
double Gd_8;
double Gd_A;
int Gi_D;
double Gd_D;
double Gd_F;
int Gi_12;
double Gd_12;
int Ii_98 = 0;
bool Ib_16C = true;
int Ii_170 = 7;
int Ii_174 = 0;

bool OrdenCierre;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   EventSetMillisecondTimer(SpeedEA);
   MultiplicadorDigitosSimboloPrincipal = 1;
   if((ACBA::MarketInfo(pXAUUSD, MODE_DIGITS) == 5) || (ACBA::MarketInfo(pXAUUSD, MODE_DIGITS) == 3))
      MultiplicadorDigitosSimboloPrincipal = 10;

   MultiplicadorDigitosSimbolo_1 = 1;
   if((ACBA::MarketInfo(Simbolo1, MODE_DIGITS) == 5) || (ACBA::MarketInfo(Simbolo1, MODE_DIGITS) == 3))
      MultiplicadorDigitosSimbolo_1 = 10;

   MultiplicadorDigitosSimbolo_2 = 1;
   if((ACBA::MarketInfo(Simbolo2, MODE_DIGITS) == 5) || (ACBA::MarketInfo(Simbolo2, MODE_DIGITS) == 3))
      MultiplicadorDigitosSimbolo_2 = 10;

   MultiplicadorDigitosSimbolo_3 = 1;
   if((ACBA::MarketInfo(Simbolo3, MODE_DIGITS) == 5) || (ACBA::MarketInfo(Simbolo3, MODE_DIGITS) == 3))
      MultiplicadorDigitosSimbolo_3 = 10;

   MultiplicadorDigitosSimbolo_4 = 1;
   if((ACBA::MarketInfo(Simbolo4, MODE_DIGITS) == 5) != true)
     {
      if((ACBA::MarketInfo(Simbolo4, MODE_DIGITS) != 3))
         return;
     }
   MultiplicadorDigitosSimbolo_4 = 10;

//Li_C = 0;
   return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void __OnTick__()
  {
   string Texto_SVERNUT_;
   string Boton_SVERNUT_;
   string Texto_SVERNUTt_;
   string Boton_SVERNUTt_;
   string str_4;
   string str_5;
   string str_6;
   string str_7;
   string str_8;
   string str_9;
   string str_A;
   string str_B;
   string str_C;
   string str_D;
   string str_E;
   string str_F;
   string str_10;
   string str_11;
   string str_12;
   string str_13;
   string str_14;
   string str_15;
   string str_16;
   string str_17;
   string str_18;
   string str_19;
   string str_1A;
   string str_1B;
   string str_1C;
   string str_1D;
   string str_1E;
   string str_1F;
   string str_20;
   string str_21;
   string str_22;
   string str_23;
   string str_24;
   string str_25;
   string str_26;
   string str_27;
   string str_28;
   string str_29;
   string str_2A;
   string str_2B;
   string str_2C;
   string str_2D;
   string str_2E;
   string str_2F;
   string str_30;
   string str_31;
   string str_32;
   string str_33;
   string str_34;
   string str_35;
   string str_36;
   string str_37;
   string str_38;
   string str_39;
   string str_3A;
   string str_3B;
   string str_3C;
   string str_3D;
   string str_3E;
   string str_3F;
   string str_40;
   string str_41;
   string str_42;
   string str_43;
   string SimPrincipal;
   string SimAuxiliar_1;
   string SimAuxiliar_2;
   string SimAuxiliar_3;
   string SimAuxiliar_4;
   string Sim_Principal;
   string str_4A;
   string str_4B;
   string str_4C;
   string str_4D;
   string str_4E;
   string str_4F;
   string str_50;
   string str_51;
   string str_52;
   string str_53;
   string str_54;
   string str_55;
   string str_56;
   string str_57;
   string str_58;
   string str_59;
   string str_5A;
   string str_5B;
   string str_5C;
   string str_5D;
   string str_5E;
   string str_5F;
   string str_60;
   string str_61;
   string str_62;
   string str_63;
   string str_64;
   string str_65;
   string str_66;
   string str_67;
   string str_68;
   string str_69;
   string str_6A;
   string str_6B;
   string str_6C;
   string str_6D;
   string str_6E;
   string str_6F;
   string str_70;
   string str_71;
   string str_72;
   string str_73;
   string str_74;
   string str_75;
   string str_76;
   string str_77;
   string str_78;
   string str_79;
   string str_7A;
   string str_7B;
   string str_7C;
   string str_7D;
   string str_7E;
   string str_7F;
   string str_80;
   string str_81;
   string str_82;
   string str_83;
   string str_84;
   string str_85;
   string str_86;
   string str_87;
   string str_88;
   string str_89;
   string str_8A;
   string str_8B;
   string str_8C;
   string str_8D;
   string str_8E;
   string str_8F;
   string str_90;
   string str_91;
   string str_92;
   string str_93;
   string str_94;
   string str_95;
   string str_96;
   string str_97;
   string str_98;
   string str_99;
   string str_9A;
   string str_9B;
   string str_9C;
   string str_9D;
   string str_9E;
   string str_9F;
   string str_A0;
   string str_A1;
   string str_A2;
   string str_A3;
   string str_A4;
   string str_A5;
   string str_A6;
   string str_A7;
   string str_A8;
   string str_A9;
   string str_AA;
   string str_AB;
   string str_AC;
   string str_AD;
   string str_AE;
   string str_AF;
   string str_B0;
   string str_B1;
   string str_B2;
   string str_B3;
   string str_B4;
   string str_B5;
   string str_B6;
   string str_B7;
   string str_B8;
   string str_B9;
   string str_BA;
   string str_BB;
   string str_BC;
   string str_BD;
   string str_BE;
   string str_BF;
   string str_C0;
   string str_C1;
   string str_C2;
   string str_C3;
   string str_C4;
   string str_C5;
   string str_C6;
   string str_C7;
   string str_C8;
   string str_C9;
   string str_CA;
   string str_CB;
   string str_CC;
   string str_CD;
   string str_CE;
   string str_CF;
   string str_D0;
   string str_D1;
   string str_D2;
   string str_D3;
   string str_D4;
   string str_D5;
   string str_D6;
   string str_D7;
   string str_D8;
   string str_D9;
   string str_DA;
   string str_DB;
   string str_DC;
   string str_DD;
   string str_DE;
   string str_DF;
   string str_E0;
   string str_E1;
   string str_E2;
   string str_E3;
   string str_E4;
   string RusoEtiquetaRectangulo_INFO_fon;
   string RusoTexto_INFO_Button;
   string RusoBoton_INFO_Button;
   string RusoTexto_INFO_LOGO;
   string RusoEtiqueta_INFO_LOGO;
   string RusoTexto_INFO_Line;
   string RusoEtiqueta_INFO_Line;
   string RusoTexto_INFO_txt1;
   string RusoEtiqueta_INFO_txt1;
   string RusoTexto_INFO_Line2;
   string RusoEtiqueta_INFO_Line2;
   string RusoTexto_INFO_txt2;
   string RusoEtiqueta_INFO_txt2;
   string RusoTexto_INFO_txt3;
   string RusoEtiqueta_INFO_txt3;
   string RusoTexto_INFO_txt4;
   string RusoEtiqueta_INFO_txt4;
   string RusoTexto_INFO_txt5;
   string RusoEtiqueta_INFO_txt5;
   string RusoTexto_INFO_txt7;
   string RusoEtiqueta_INFO_txt7;
   string RusoTexto_INFO_Line3;
   string RusoEtiqueta_INFO_Line3;
   string RusoTexto_INFO_txt6;
   string RusoEtiqueta_INFO_txt6;
   string RusoTexto_INFO_Line4;
   string RusoEtiqueta_INFO_Line4;
   string RusoTexto_INFO_txt8;
   string RusoEtiqueta_INFO_txt8;
   string RusoTexto_INFO_txt9;
   string RusoEtiqueta_INFO_txt9;
   string RusoTexto_INFO_txt10;
   string RusoEtiqueta_INFO_txt10;
   string RusoTexto_INFO_txt11;
   string RusoEtiqueta_INFO_txt11;
   string RusoTexto_INFO_txt12;
   string RusoEtiqueta_INFO_txt12;
   string RusoTexto_INFO_txt13;
   string RusoEtiqueta_INFO_txt13;
   string RusoTexto_INFO_txt14;
   string RusoEtiqueta_INFO_txt14;
   string RusoTexto_INFO_txt15;
   string RusoEtiqueta_INFO_txt15;
   string RusoTexto_INFO_txt16;
   string RusoEtiqueta_INFO_txt16;
   string RusoTexto_INFO_txt17;
   string RusoEtiqueta_INFO_txt17;
   string RusoTexto_INFO_txt18;
   string RusoEtiqueta_INFO_txt18;
   string RusoTexto_INFO_txt19;
   string RusoEtiqueta_INFO_txt19;
   string RusoTexto_INFO_txt20;
   string RusoEtiqueta_INFO_txt20;
   string RusoTexto_INFO_txt21;
   string RusoEtiqueta_INFO_txt21;
   string RusoTexto_INFO_txt22;
   string RusoEtiqueta_INFO_txt22;
   string RusoTexto_INFO_Line5;
   string RusoEtiqueta_INFO_Line5;
   string RusoTexto_INFO_txt23;
   string RusoEtiqueta_INFO_txt23;
   string RusoTexto_INFO_Line6;
   string RusoEtiqueta_INFO_Line6;
   string RusoTexto_INFO_txt24;
   string RusoEtiqueta_INFO_txt24;
   string RusoTexto_INFO_txt25;
   string RusoEtiqueta_INFO_txt25;
   string str_128;
   string RusoTexto_INFO_txt26;
   string RusoEtiqueta_INFO_txt26;
   string RusoTexto_INFO_txt27;
   string RusoEtiqueta_INFO_txt27;
   string RusoTexto_INFO_txt28;
   string RusoEtiqueta_INFO_txt28;
   string str_12F;
   string RusoTexto_INFO_txt29;
   string RusoEtiqueta_INFO_txt29;
   string RusoTexto_INFO_txt30;
   string RusoEtiqueta_INFO_txt30;
   string RusoTexto_INFO_txt31;
   string RusoEtiqueta_INFO_txt31;
   string str_136;
   string RusoTexto_INFO_txt32;
   string RusoEtiqueta_INFO_txt32;
   string RusoTexto_INFO_txt33;
   string RusoEtiqueta_INFO_txt33;
   string RusoTexto_INFO_txt34;
   string RusoEtiqueta_INFO_txt34;
   string str_13D;
   string RusoTexto_INFO_txt35;
   string RusoEtiqueta_INFO_txt35;
   string RusoTexto_INFO_txt36;
   string RusoEtiqueta_INFO_txt36;
   string RusoTexto_INFO_txt37;
   string RusoEtiqueta_INFO_txt37;
   string str_144;
   string RusoTexto_INFO_txt38;
   string RusoEtiqueta_INFO_txt38;
   string InglesEtiquetaRectangulo_INFO_fon;
   string InglesTexto_INFO_Button;
   string InglesBoton_INFO_Button;
   string str_149;
   string InglesTexto_INFO_LOGO;
   string InglesEtiqueta_INFO_LOGO;
   string InglesTexto_INFO_Line;
   string InglesEtiqueta_INFO_Line;
   string InglesTexto_INFO_txt1a;
   string InglesEtiqueta_INFO_txt1a;
   string InglesTexto_INFO_Linea;
   string InglesEtiqueta_INFO_Linea;
   string InglesTexto_INFO_txt1;
   string InglesEtiqueta_INFO_txt1;
   string InglesTexto_INFO_Line2;
   string InglesEtiqueta_INFO_Line2;
   string InglesTexto_INFO_txt2;
   string InglesEtiqueta_INFO_txt2;
   string InglesTexto_INFO_txt3;
   string InglesEtiqueta_INFO_txt3;
   string InglesTexto_INFO_txt7;
   string InglesEtiqueta_INFO_txt7;
   string InglesTexto_INFO_Line3;
   string InglesEtiqueta_INFO_Line3;
   string InglesTexto_INFO_txt6;
   string InglesEtiqueta_INFO_txt6;
   string InglesTexto_INFO_Line4;
   string InglesEtiqueta_INFO_Line4;
   string InglesTexto_INFO_txt8;
   string InglesEtiqueta_INFO_txt8;
   string InglesTexto_INFO_txt9;
   string InglesEtiqueta_INFO_txt9;
   string InglesTexto_INFO_txt10;
   string InglesEtiqueta_INFO_txt10;
   string InglesTexto_INFO_txt11;
   string InglesEtiqueta_INFO_txt11;
   string InglesTexto_INFO_txt12;
   string InglesEtiqueta_INFO_txt12;
   string InglesTexto_INFO_txt13;
   string InglesEtiqueta_INFO_txt13;
   string InglesTexto_INFO_txt14;
   string InglesEtiqueta_INFO_txt14;
   string InglesTexto_INFO_txt17;
   string InglesEtiqueta_INFO_txt17;
   string InglesTexto_INFO_txt18;
   string InglesEtiqueta_INFO_txt18;
   string str_174;
   string InglesEtiqueta_INFO_txt19;
   string InglesTexto_INFO_txt20;
   string InglesEtiqueta_INFO_txt20;
   string InglesTexto_INFO_txt21;
   string InglesEtiqueta_INFO_txt21;
   string InglesTexto_INFO_txt22;
   string InglesEtiqueta_INFO_txt22;
   string InglesTexto_INFO_Line5;
   string InglesEtiqueta_INFO_Line5;
   string InglesTexto_INFO_txt23;
   string InglesEtiqueta_INFO_txt23;
   string InglesTexto_INFO_Line6;
   string InglesEtiqueta_INFO_Line6;
   string InglesTexto_INFO_txt24;
   string InglesEtiqueta_INFO_txt24;
   string InglesTexto_INFO_txt25;
   string InglesEtiqueta_INFO_txt25;
   string str_186;
   string InglesTexto_INFO_txt26;
   string InglesEtiqueta_INFO_txt26;

   string RusoEtiquetaRectangulo_TRADE_fon;
   string RusoTexto_TRADE_Button;
   string RusoBoton_TRADE_Button;
   string RusoTexto_TRADE_LOGO;
   string RusoEtiqueta_TRADE_LOGO;
   string RusoTexto_TRADE_Line;
   string RusoEtiqueta_TRADE_Line;
   string RusoTexto_TRADE_Line2;
   string RusoEtiqueta_TRADE_Line2;
   string RusoTexto_TRADE_Line3;
   string RusoEtiqueta_TRADE_Line3;
   string RusoTexto_TRADE_Line4;
   string RusoEtiqueta_TRADE_Line4;
   string RusoTexto_TRADE_Line5;
   string RusoEtiqueta_TRADE_Line5;
   string RusoTexto_TRADE_Line6;
   string RusoEtiqueta_TRADE_Line6;
   string RusoTexto_TRADE_Line7;
   string RusoEtiqueta_TRADE_Line7;
   string RusoTexto_TRADE_txt;
   string RusoEtiqueta_TRADE_txt;
   string RusoTexto_TRADE_txt1;
   string RusoEtiqueta_TRADE_txt1;
   string RusoTexto_TRADEs_P1;
   string RusoBoton_TRADEs_P1;
   string RusoTexto_TRADEs_P2;
   string RusoBoton_TRADEs_P2;
   string RusoTexto_TRADEs_P3;
   string RusoBoton_TRADEs_P3;
   string RusoTexto_TRADEs_P4;
   string RusoBoton_TRADEs_P4;
   string RusoTexto_TRADEs_P5;
   string RusoBoton_TRADEs_P5;
   string RusoTexto_TRADE_txt2;
   string RusoEtiqueta_TRADE_txt2;
   string RusoTexto_TRADEs_CIERRA_ORDENES_CON_BENEFICIO;
   string RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO;
   string RusoTexto_TRADE_txt3;
   string RusoEtiqueta_TRADE_txt3;
   string RusoTexto_TRADEs_CIERRA_ORDENES_CON_PERDIDAS;
   string RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS;
   string RusoTexto_TRADE_txt4;
   string RusoEtiqueta_TRADE_txt4;
   string RusoTexto_TRADEs_CIERRA_SIMBOLO_SELECCIONADO;
   string RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO;
   string RusoTexto_TRADE_txt5;
   string RusoEtiqueta_TRADE_txt5;
   string RusoTexto_TRADE_txt6;
   string RusoEtiqueta_TRADE_txt6;
   string RusoTexto_TRADEs_CERRAR_TODO;
   string RusoBoton_TRADEs_CERRAR_TODO;
   string RusoTexto_TRADE_txt7;
   string RusoEtiqueta_TRADE_txt7;
   string RusoTexto_TRADE_txt8;
   string RusoEtiqueta_TRADE_txt8;
   string RusoTexto_TRADEs_AUTOTRADE;
   string RusoBoton_TRADEs_AUTOTRADE;
   string RusoTexto_TRADE_txt9;
   string RusoEtiqueta_TRADE_txt9;
   string RusoTexto_TRADEs_REJILLA_MAS;
   string RusoBoton_TRADEs_REJILLA_MAS;
   string RusoTexto_TRADE_txt10;
   string RusoEtiqueta_TRADE_txt10;
   string RusoTexto_TRADEs_REJILLA_MENOS;
   string RusoBoton_TRADEs_REJILLA_MENOS;
   string RusoTexto_TRADE_txt11;
   string RusoEtiqueta_TRADE_txt11;
   string RusoTexto_TRADEs_TRADING_MOBILE;
   string RusoBoton_TRADEs_TRADING_MOBILE;
   string RusoTexto_TRADE_txt12;
   string RusoEtiqueta_TRADE_txt12;
   string RusoTexto_TRADEs_CERRAR_EN_HORA_FIN;
   string RusoBoton_TRADEs_CERRAR_EN_HORA_FIN;
   string RusoTexto_TRADEs_B;
   string RusoBoton_TRADEs_B;
   string RusoTexto_TRADEs_S;
   string RusoBoton_TRADEs_S;
   string SimboloPrincipal;
   string SimboloAuxiliar_1;
   string SimboloAuxiliar_2;
   string SimboloAuxiliar_3;
   string SimboloAuxiliar_4;
   bool Velas_3VERDES_2ROJAS;
   bool Velas_3ROJAS_2VERDES;
   bool CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R;
   bool CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3V2R;
   bool CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3V2R;
   bool CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3R2V;
   bool CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3R2V;
   bool CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V;
   bool CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3R2V;
   bool CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3R2V;
   bool CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3V2R;
   bool CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3V2R;
   int Li_A0;
   int Li_9C;
   int Li_98;
   int Li_94;
   int Li_90;
   double Ld_88;
   double Ld_80;

// ####### ¿ESTAMOS EN MODO TESTING O MODO DEMO/REAL? ###############
   if(ACBA::IsTesting())
     {
      SimboloPrincipal = _Symbol;
      SimboloAuxiliar_1 = SimboloPrincipal;
      SimboloAuxiliar_2 = _Symbol;
      SimboloAuxiliar_3 = SimboloAuxiliar_2;
      SimboloAuxiliar_4 = _Symbol;
     }
   else
     {
      SimboloPrincipal = pXAUUSD;
      SimboloAuxiliar_1 = Simbolo1;
      SimboloAuxiliar_2 = Simbolo2;
      SimboloAuxiliar_3 = Simbolo3;
      SimboloAuxiliar_4 = Simbolo4;
     }
// ### <<<<FIN>>>>> #### ¿ESTAMOS EN MODO TESTING O MODO DEMO/REAL? ###############


// ########### LOTE MANUAL O LOTE CALCULADO SOBRE BALANCE #########
   if(UseLotManual)
     {
      LotajeSimboloPrincipal = ManualLot;
      LotajeSimboloAuxiliar_1 = ManualLot;
      LotajeSimboloAuxiliar_2 = ManualLot;
      LotajeSimboloAuxiliar_3 = ManualLot;
      LotajeSimboloAuxiliar_4 = ManualLot;
     }

   else
     {
      // #### CALCULO LOTAJE PARA SIMBOLO PRINCIPAL TENIENDO EN CUENTA BALANCE Y PARÁMETRO "RISK" ####
      if((ACBA::MarketInfo(SimboloPrincipal, MODE_LOTSTEP) == 0.01))
         DigitosDecimalesSimboloPrincipal = 2;
      if((ACBA::MarketInfo(SimboloPrincipal, MODE_LOTSTEP) == 0.1))
         DigitosDecimalesSimboloPrincipal = 1;
      if((ACBA::MarketInfo(SimboloPrincipal, MODE_LOTSTEP) == 1))
         DigitosDecimalesSimboloPrincipal = 0;
      BeneficioObjetivoSimboloPrincipal = ((ACBA::AccountBalance() / 100.0) * Risk);
      Gd_1 = (ACBA::MarketInfo(SimboloPrincipal, MODE_TICKVALUE) * 100);
      LotajeSimboloPrincipal = NormalizeDouble((BeneficioObjetivoSimboloPrincipal / (Gd_1 * MultiplicadorDigitosSimboloPrincipal)), DigitosDecimalesSimboloPrincipal);
      if((LotajeSimboloPrincipal < ACBA::MarketInfo(SimboloPrincipal, MODE_MINLOT)))
         LotajeSimboloPrincipal = ACBA::MarketInfo(SimboloPrincipal, MODE_MINLOT);
      if((LotajeSimboloPrincipal >= ACBA::MarketInfo(SimboloPrincipal, MODE_MAXLOT)))
         LotajeSimboloPrincipal = ACBA::MarketInfo(SimboloPrincipal, MODE_MAXLOT);

      // #### CALCULO LOTAJE PARA SIMBOLO AUXILIAR 1 TENIENDO EN CUENTA BALANCE Y PARÁMETRO "RISK" ####
      if((ACBA::MarketInfo(SimboloAuxiliar_1, MODE_LOTSTEP) == 0.01))
         DigitosDecimalesSimboloAuxiliar_1 = 2;
      if((ACBA::MarketInfo(SimboloAuxiliar_1, MODE_LOTSTEP) == 0.1))
         DigitosDecimalesSimboloAuxiliar_1 = 1;
      if((ACBA::MarketInfo(SimboloAuxiliar_1, MODE_LOTSTEP) == 1))
         DigitosDecimalesSimboloAuxiliar_1 = 0;
      Gd_1 = ((ACBA::AccountBalance() / 100.0) * Risk);
      Gd_2 = (ACBA::MarketInfo(SimboloAuxiliar_1, MODE_TICKVALUE) * 100);
      LotajeSimboloAuxiliar_1 = NormalizeDouble((Gd_1 / (Gd_2 * MultiplicadorDigitosSimbolo_1)), DigitosDecimalesSimboloAuxiliar_1);
      if((LotajeSimboloAuxiliar_1 < ACBA::MarketInfo(SimboloAuxiliar_1, MODE_MINLOT)))
         LotajeSimboloAuxiliar_1 = ACBA::MarketInfo(SimboloAuxiliar_1, MODE_MINLOT);
      if((LotajeSimboloAuxiliar_1 >= ACBA::MarketInfo(SimboloAuxiliar_1, MODE_MAXLOT)))
         LotajeSimboloAuxiliar_1 = ACBA::MarketInfo(SimboloAuxiliar_1, MODE_MAXLOT);

      // #### CALCULO LOTAJE PARA SIMBOLO AUXILIAR 2 TENIENDO EN CUENTA BALANCE Y PARÁMETRO "RISK" ####
      if((ACBA::MarketInfo(SimboloAuxiliar_2, MODE_LOTSTEP) == 0.01))
         DigitosDecimalesSimboloAuxiliar_2 = 2;
      if((ACBA::MarketInfo(SimboloAuxiliar_2, MODE_LOTSTEP) == 0.1))
         DigitosDecimalesSimboloAuxiliar_2 = 1;
      if((ACBA::MarketInfo(SimboloAuxiliar_2, MODE_LOTSTEP) == 1))
         DigitosDecimalesSimboloAuxiliar_2 = 0;
      Gd_2 = ((ACBA::AccountBalance() / 100.0) * Risk);
      Gd_3 = (ACBA::MarketInfo(SimboloAuxiliar_2, MODE_TICKVALUE) * 100);
      LotajeSimboloAuxiliar_2 = NormalizeDouble((Gd_2 / (Gd_3 * MultiplicadorDigitosSimbolo_2)), DigitosDecimalesSimboloAuxiliar_2);
      if((LotajeSimboloAuxiliar_2 < ACBA::MarketInfo(SimboloAuxiliar_2, MODE_MINLOT)))
         LotajeSimboloAuxiliar_2 = ACBA::MarketInfo(SimboloAuxiliar_2, MODE_MINLOT);
      if((LotajeSimboloAuxiliar_2 >= ACBA::MarketInfo(SimboloAuxiliar_2, MODE_MAXLOT)))
         LotajeSimboloAuxiliar_2 = ACBA::MarketInfo(SimboloAuxiliar_2, MODE_MAXLOT);

      // #### CALCULO LOTAJE PARA SIMBOLO AUXILIAR 3 TENIENDO EN CUENTA BALANCE Y PARÁMETRO "RISK" ####
      if((ACBA::MarketInfo(SimboloAuxiliar_3, MODE_LOTSTEP) == 0.01))
         DigitosDecimalesSimboloAuxiliar_3 = 2;
      if((ACBA::MarketInfo(SimboloAuxiliar_3, MODE_LOTSTEP) == 0.1))
         DigitosDecimalesSimboloAuxiliar_3 = 1;
      if((ACBA::MarketInfo(SimboloAuxiliar_3, MODE_LOTSTEP) == 1))
         DigitosDecimalesSimboloAuxiliar_3 = 0;
      Gd_3 = ((ACBA::AccountBalance() / 100.0) * Risk);
      Gd_4 = (ACBA::MarketInfo(SimboloAuxiliar_3, MODE_TICKVALUE) * 100);
      LotajeSimboloAuxiliar_3 = NormalizeDouble((Gd_3 / (Gd_4 * MultiplicadorDigitosSimbolo_3)), DigitosDecimalesSimboloAuxiliar_3);
      if((LotajeSimboloAuxiliar_3 < ACBA::MarketInfo(SimboloAuxiliar_3, MODE_MINLOT)))
         LotajeSimboloAuxiliar_3 = ACBA::MarketInfo(SimboloAuxiliar_3, MODE_MINLOT);
      if((LotajeSimboloAuxiliar_3 >= ACBA::MarketInfo(SimboloAuxiliar_3, MODE_MAXLOT)))
         LotajeSimboloAuxiliar_3 = ACBA::MarketInfo(SimboloAuxiliar_3, MODE_MAXLOT);

      // #### CALCULO LOTAJE PARA SIMBOLO AUXILIAR 4 TENIENDO EN CUENTA BALANCE Y PARÁMETRO "RISK" ####

      if((ACBA::MarketInfo(SimboloAuxiliar_4, MODE_LOTSTEP) == 0.01))
         DigitosDecimalesSimboloAuxiliar_4 = 2;
      if((ACBA::MarketInfo(SimboloAuxiliar_4, MODE_LOTSTEP) == 0.1))
         DigitosDecimalesSimboloAuxiliar_4 = 1;
      if((ACBA::MarketInfo(SimboloAuxiliar_4, MODE_LOTSTEP) == 1))
         DigitosDecimalesSimboloAuxiliar_4 = 0;
      Gd_4 = ((ACBA::AccountBalance() / 100.0) * Risk);
      Gd_5 = (ACBA::MarketInfo(SimboloAuxiliar_4, MODE_TICKVALUE) * 100);
      LotajeSimboloAuxiliar_4 = NormalizeDouble((Gd_4 / (Gd_5 * MultiplicadorDigitosSimbolo_4)), DigitosDecimalesSimboloAuxiliar_4);
      if((LotajeSimboloAuxiliar_4 < ACBA::MarketInfo(SimboloAuxiliar_4, MODE_MINLOT)))
         LotajeSimboloAuxiliar_4 = ACBA::MarketInfo(SimboloAuxiliar_4, MODE_MINLOT);
      if((LotajeSimboloAuxiliar_4 >= ACBA::MarketInfo(SimboloAuxiliar_4, MODE_MAXLOT)))
         LotajeSimboloAuxiliar_4 = ACBA::MarketInfo(SimboloAuxiliar_4, MODE_MAXLOT);
     }
// ##### <<<<< FIN >>>>>> ###### LOTE MANUAL O LOTE CALCULADO SOBRE BALANCE #########


   Velas_3VERDES_2ROJAS = false;   // "XAUUSD" "GBPUSD" "AUDUSD"-->VERDES       "USDCAD" "USDCHF" --> ROJAS
   Velas_3ROJAS_2VERDES = false;   // "XAUUSD" "GBPUSD" "AUDUSD"-->ROJAS        "USDCAD" "USDCHF" --> VERDES

// COMPROBAMOS SI LA ULTIMA VELA DE LOS 3 PRIMEROS SIMBOLOS "XAUUSD" "GBPUSD" "AUDUSD" HAN SIDO ROJAS Y DE LOS DOS SIGUIENTES "USDCAD" "USDCHF" HAN SIDO VERDES
   if((ACBA::iOpen(SimboloPrincipal, TimeFrame, 1) > ACBA::iClose(SimboloPrincipal, TimeFrame, 1)))                    //VELA ROJA
     {
      if((ACBA::iOpen(SimboloAuxiliar_1, TimeFrame, 1) > ACBA::iClose(SimboloAuxiliar_1, TimeFrame, 1)))              //VELA ROJA
        {
         if((ACBA::iOpen(SimboloAuxiliar_2, TimeFrame, 1) > ACBA::iClose(SimboloAuxiliar_2, TimeFrame, 1)))          //VELA ROJA
           {
            if((ACBA::iOpen(SimboloAuxiliar_3, TimeFrame, 1) < ACBA::iClose(SimboloAuxiliar_3, TimeFrame, 1)))      //VELA VERDE
              {
               if((ACBA::iOpen(SimboloAuxiliar_4, TimeFrame, 1) < ACBA::iClose(SimboloAuxiliar_4, TimeFrame, 1)))  //VELA VERDE
                 {
                  Velas_3ROJAS_2VERDES = true;
                 }
              }
           }
        }
     }

// COMPROBAMOS SI LA ULTIMA VELA DE LOS 3 PRIMEROS SIMBOLOS "XAUUSD" "GBPUSD" "AUDUSD" HAN SIDO VERDES Y DE LOS DOS SIGUIENTES "USDCAD" "USDCHF" HAN SIDO ROJAS
   if((ACBA::iOpen(SimboloPrincipal, TimeFrame, 1) < ACBA::iClose(SimboloPrincipal, TimeFrame, 1)))                    //VELA VERDE
     {
      if((ACBA::iOpen(SimboloAuxiliar_1, TimeFrame, 1) < ACBA::iClose(SimboloAuxiliar_1, TimeFrame, 1)))              //VELA VERDE
        {
         if((ACBA::iOpen(SimboloAuxiliar_2, TimeFrame, 1) < ACBA::iClose(SimboloAuxiliar_2, TimeFrame, 1)))          //VELA VERDE
           {
            if((ACBA::iOpen(SimboloAuxiliar_3, TimeFrame, 1) > ACBA::iClose(SimboloAuxiliar_3, TimeFrame, 1)))      //VELA ROJA
              {
               if((ACBA::iOpen(SimboloAuxiliar_4, TimeFrame, 1) > ACBA::iClose(SimboloAuxiliar_4, TimeFrame, 1)))  //VELA ROJA
                 {
                  Velas_3VERDES_2ROJAS = true;
                 }
              }
           }
        }
     }

// ### RESET A FALSE DE LAS CONDICIONES PIPS VELA
   CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R = false;
   CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3V2R = false;
   CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3V2R = false;
   CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3R2V = false;
   CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3R2V = false;
   CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V = false;
   CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3R2V = false;
   CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3R2V = false;
   CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3V2R = false;
   CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3V2R = false;

// ### SI SE CUMPLE LAS CONDICION DE Velas_3ROJAS_2VERDES --> OBTENEMOS LA ALTURA del cuerpo EN PIPS DE CADA VELA
   if(Velas_3ROJAS_2VERDES)  // "XAUUSD" "GBPUSD" "AUDUSD"-->ROJAS       "USDCAD" "USDCHF" --> VERDES
     {
      PipsVelaSimboloPrincipal = ((ACBA::iOpen(SimboloPrincipal, TimeFrame, 1) - ACBA::iClose(SimboloPrincipal, TimeFrame, 1)) / ACBA::MarketInfo(SimboloPrincipal, MODE_POINT));
      PipsVelaSimboloAuxiliar_1 = ((ACBA::iOpen(SimboloAuxiliar_1, TimeFrame, 1) - ACBA::iClose(SimboloAuxiliar_1, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_1, MODE_POINT));
      PipsVelaSimboloAuxiliar_2 = ((ACBA::iOpen(SimboloAuxiliar_2, TimeFrame, 1) - ACBA::iClose(SimboloAuxiliar_2, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_2, MODE_POINT));
      PipsVelaSimboloAuxiliar_3 = ((ACBA::iClose(SimboloAuxiliar_3, TimeFrame, 1) - ACBA::iOpen(SimboloAuxiliar_3, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_3, MODE_POINT));
      PipsVelaSimboloAuxiliar_4 = ((ACBA::iClose(SimboloAuxiliar_4, TimeFrame, 1) - ACBA::iOpen(SimboloAuxiliar_4, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_4, MODE_POINT));
     }

// ### SI SE CUMPLE LAS CONDICION DE Velas_3VERDES_2ROJAS --> OBTENEMOS LA ALTURA del cuerpo EN PIPS DE CADA VELA
   if(Velas_3VERDES_2ROJAS)  // "XAUUSD" "GBPUSD" "AUDUSD"-->VERDES       "USDCAD" "USDCHF" --> ROJAS
     {
      PipsVelaSimboloPrincipal = ((ACBA::iClose(SimboloPrincipal, TimeFrame, 1) - ACBA::iOpen(SimboloPrincipal, TimeFrame, 1)) / ACBA::MarketInfo(SimboloPrincipal, MODE_POINT));
      PipsVelaSimboloAuxiliar_1 = ((ACBA::iClose(SimboloAuxiliar_1, TimeFrame, 1) - ACBA::iOpen(SimboloAuxiliar_1, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_1, MODE_POINT));
      PipsVelaSimboloAuxiliar_2 = ((ACBA::iClose(SimboloAuxiliar_2, TimeFrame, 1) - ACBA::iOpen(SimboloAuxiliar_2, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_2, MODE_POINT));
      PipsVelaSimboloAuxiliar_3 = ((ACBA::iOpen(SimboloAuxiliar_3, TimeFrame, 1) - ACBA::iClose(SimboloAuxiliar_3, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_3, MODE_POINT));
      PipsVelaSimboloAuxiliar_4 = ((ACBA::iOpen(SimboloAuxiliar_4, TimeFrame, 1) - ACBA::iClose(SimboloAuxiliar_4, TimeFrame, 1)) / ACBA::MarketInfo(SimboloAuxiliar_4, MODE_POINT));
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "XAUUSD" > "GBPUSD" && "XAUUSD" >"AUDUSD" && "XAUUSD" > "USDCAD" && "XAUUSD" > "USDCHF" && "XAUUSD" > MinPips && Velas_3VERDES_2ROJAS
   if((PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_4)
      && Velas_3VERDES_2ROJAS
      && (PipsVelaSimboloPrincipal > MinPips))
     {
      CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "GBPUSD" > "XAUUSD" && "GBPUSD" >"AUDUSD" && "GBPUSD" > "USDCAD" && "GBPUSD" > "USDCHF" && "GBPUSD" > MinPips && Velas_3VERDES_2ROJAS
   if((PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_4)
      && Velas_3VERDES_2ROJAS
      && (PipsVelaSimboloAuxiliar_1 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3V2R = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "AUDUSD" > "GBPUSD" && "AUDUSD" >"XAUUSD" && "AUDUSD" > "USDCAD" && "AUDUSD" > "USDCHF" && "AUDUSD" > MinPips && Velas_3VERDES_2ROJAS
   if((PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_4)
      && Velas_3VERDES_2ROJAS
      && (PipsVelaSimboloAuxiliar_2 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3V2R = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "USDCAD" > "GBPUSD" && "USDCAD" >"AUDUSD" && "USDCAD" > "XAUUSD" && "USDCAD" > "USDCHF" && "USDCAD" > MinPips && Velas_3VERDES_2ROJAS
   if((PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_4)
      && Velas_3VERDES_2ROJAS
      && (PipsVelaSimboloAuxiliar_3 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3V2R = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "USDCHF" > "GBPUSD" && "USDCHF" >"AUDUSD" && "USDCHF" > "USDCAD" && "USDCHF" > "XAUUSD" && "USDCHF" > MinPips && Velas_3VERDES_2ROJAS
   if((PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloPrincipal)
      && Velas_3VERDES_2ROJAS
      && (PipsVelaSimboloAuxiliar_4 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3V2R = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "XAUUSD" > "GBPUSD" && "XAUUSD" >"AUDUSD" && "XAUUSD" > "USDCAD" && "XAUUSD" > "USDCHF" && "XAUUSD" > MinPips && Velas_3ROJAS_2VERDES
   if((PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloPrincipal > PipsVelaSimboloAuxiliar_4)
      && Velas_3ROJAS_2VERDES
      && (PipsVelaSimboloPrincipal > MinPips))
     {
      CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "GBPUSD" > "XAUUSD" && "GBPUSD" >"AUDUSD" && "GBPUSD" > "USDCAD" && "GBPUSD" > "USDCHF" && "GBPUSD" > MinPips && Velas_3ROJAS_2VERDES
   if((PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_1 > PipsVelaSimboloAuxiliar_4)
      && Velas_3ROJAS_2VERDES
      && (PipsVelaSimboloAuxiliar_1 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3R2V = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "AUDUSD" > "GBPUSD" && "AUDUSD" >"XAUUSD" && "AUDUSD" > "USDCAD" && "AUDUSD" > "USDCHF" && "AUDUSD" > MinPips && Velas_3ROJAS_2VERDES
   if((PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_2 > PipsVelaSimboloAuxiliar_4)
      && Velas_3ROJAS_2VERDES
      && (PipsVelaSimboloAuxiliar_2 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3R2V = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "USDCAD" > "GBPUSD" && "USDCAD" >"AUDUSD" && "USDCAD" > "XAUUSD" && "USDCAD" > "USDCHF" && "USDCAD" > MinPips && Velas_3ROJAS_2VERDES
   if((PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloPrincipal)
      && (PipsVelaSimboloAuxiliar_3 > PipsVelaSimboloAuxiliar_4)
      && Velas_3ROJAS_2VERDES
      && (PipsVelaSimboloAuxiliar_3 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3R2V = true;
     }

// Pincipal:"XAUUSD" -- Aux1:"GBPUSD" -- Aux2:"AUDUSD" -- Aux3:"USDCAD" -- Aux4:"USDCHF"
// Comprueba que altura cuerpo "USDCHF" > "GBPUSD" && "USDCHF" >"AUDUSD" && "USDCHF" > "USDCAD" && "USDCHF" > "XAUUSD" && "USDCHF" > MinPips && Velas_3ROJAS_2VERDES
   if((PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_1)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_2)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloAuxiliar_3)
      && (PipsVelaSimboloAuxiliar_4 > PipsVelaSimboloPrincipal)
      && Velas_3ROJAS_2VERDES
      && (PipsVelaSimboloAuxiliar_4 > MinPips))
     {
      CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3R2V = true;
     }

// ############## INICIO USEPLOT ###################
// ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA DE CADA SIMBOLO Y LO SUMA AL LOTAJE DEL SIMBOLO (LOTAJE MANUAL O LOTAJE CALCULADO CALCULADO)
   if(UseUPlot)
     {
      // ########## SIMBOLO PRINCIPAL ##########
      // ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA Y LO SUMA AL LOTAJE DEL SIMBOLO (MANUAL O CALCULADO)
      SimPrincipal = SimboloPrincipal;
      Gi_6 = -1;
      LotajeSimPrincipal = 0;
      HoraAperturaSimboloPrincipal = 0;
      OrdenesTotalesSimboloPrincipal = ACBA::OrdersTotal() - 1;
      Gi_A = OrdenesTotalesSimboloPrincipal;
      if(OrdenesTotalesSimboloPrincipal >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_A,0, 0) && ACBA::OrderSymbol() == SimPrincipal && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_6 == -1 || ACBA::OrderType() == Gi_6)
                 {
                  if(ACBA::OrderOpenTime() > HoraAperturaSimboloPrincipal)
                    {
                     HoraAperturaSimboloPrincipal = ACBA::OrderOpenTime();
                     LotajeSimPrincipal = ACBA::OrderLots();
                    }
                 }
              }
            Gi_A = Gi_A - 1;
           }
         while(Gi_A >= 0);
        }
      LotajeSimboloPrincipal = NormalizeDouble((LotajeSimboloPrincipal + LotajeSimPrincipal), DigitosDecimalesSimboloPrincipal);


      // ########## SIMBOLO AUXILIAR 1 ##########
      // ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA Y LO SUMA AL LOTAJE DEL SIMBOLO (MANUAL O CALCULADO)
      SimAuxiliar_1 = SimboloAuxiliar_1;
      Gi_B = -1;
      LotajeSimAuxiliar_1 = 0;
      HoraAperturaSimboloAuxiliar_1 = 0;
      OrdenesTotalesSimboloAuxiliar_1 = ACBA::OrdersTotal() - 1;
      Gi_F = OrdenesTotalesSimboloAuxiliar_1;
      if(OrdenesTotalesSimboloAuxiliar_1 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_F, 0, 0) && ACBA::OrderSymbol() == SimAuxiliar_1 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_B == -1 || ACBA::OrderType() == Gi_B)
                 {
                  if(ACBA::OrderOpenTime() > HoraAperturaSimboloAuxiliar_1)
                    {
                     HoraAperturaSimboloAuxiliar_1 = ACBA::OrderOpenTime();
                     LotajeSimAuxiliar_1 = ACBA::OrderLots();
                    }
                 }
              }
            Gi_F = Gi_F - 1;
           }
         while(Gi_F >= 0);
        }
      LotajeSimboloAuxiliar_1 = NormalizeDouble((LotajeSimboloAuxiliar_1 + LotajeSimAuxiliar_1), DigitosDecimalesSimboloAuxiliar_1);

      // ########## SIMBOLO AUXILIAR 2 ##########
      // ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA Y LO SUMA AL LOTAJE DEL SIMBOLO (MANUAL O CALCULADO)
      SimAuxiliar_2 = SimboloAuxiliar_2;
      Gi_10 = -1;
      LotajeSimAuxiliar_2 = 0;
      HoraAperturaSimboloAuxiliar_2 = 0;
      OrdenesTotalesSimboloAuxiliar_2 = ACBA::OrdersTotal() - 1;
      Gi_14 = OrdenesTotalesSimboloAuxiliar_2;
      if(OrdenesTotalesSimboloAuxiliar_2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_14, 0, 0) && ACBA::OrderSymbol() == SimAuxiliar_2 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_10 == -1 || ACBA::OrderType() == Gi_10)
                 {
                  if(ACBA::OrderOpenTime() > HoraAperturaSimboloAuxiliar_2)
                    {
                     HoraAperturaSimboloAuxiliar_2 = ACBA::OrderOpenTime();
                     LotajeSimAuxiliar_2 = ACBA::OrderLots();
                    }
                 }
              }
            Gi_14 = Gi_14 - 1;
           }
         while(Gi_14 >= 0);
        }
      LotajeSimboloAuxiliar_2 = NormalizeDouble((LotajeSimboloAuxiliar_2 + LotajeSimAuxiliar_2), DigitosDecimalesSimboloAuxiliar_2);

      // ########## SIMBOLO AUXILIAR 3 ##########
      // ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA Y LO SUMA AL LOTAJE DEL SIMBOLO (MANUAL O CALCULADO)
      SimAuxiliar_3 = SimboloAuxiliar_3;
      Gi_15 = -1;
      LotajeSimAuxiliar_3 = 0;
      HoraAperturaSimboloAuxiliar_3 = 0;
      OrdenesTotalesSimboloAuxiliar_3 = ACBA::OrdersTotal() - 1;
      Gi_19 = OrdenesTotalesSimboloAuxiliar_3;
      if(OrdenesTotalesSimboloAuxiliar_3 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_19, 0, 0) && ACBA::OrderSymbol() == SimAuxiliar_3 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_15 == -1 || ACBA::OrderType() == Gi_15)
                 {
                  if(ACBA::OrderOpenTime() > HoraAperturaSimboloAuxiliar_3)
                    {
                     HoraAperturaSimboloAuxiliar_3 = ACBA::OrderOpenTime();
                     LotajeSimAuxiliar_3 = ACBA::OrderLots();
                    }
                 }
              }
            Gi_19 = Gi_19 - 1;
           }
         while(Gi_19 >= 0);
        }
      LotajeSimboloAuxiliar_3 = NormalizeDouble((LotajeSimboloAuxiliar_3 + LotajeSimAuxiliar_3), DigitosDecimalesSimboloAuxiliar_3);

      // ########## SIMBOLO AUXILIAR 4 ##########
      // ## OBTIENE EL LOTAJE DE LA ÚLTIMA ORDEN ABIERTA Y LO SUMA AL LOTAJE DEL SIMBOLO (MANUAL O CALCULADO)
      SimAuxiliar_4 = SimboloAuxiliar_4;
      Gi_1A = -1;
      LotajeSimAuxiliar_4 = 0;
      HoraAperturaSimboloAuxiliar_4 = 0;
      Gi_1D = ACBA::OrdersTotal() - 1;
      Gi_1E = Gi_1D;
      if(Gi_1D >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1E, 0, 0) && ACBA::OrderSymbol() == SimAuxiliar_4 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_1A == -1 || ACBA::OrderType() == Gi_1A)
                 {
                  if(ACBA::OrderOpenTime() > HoraAperturaSimboloAuxiliar_4)
                    {
                     HoraAperturaSimboloAuxiliar_4 = ACBA::OrderOpenTime();
                     LotajeSimAuxiliar_4 = ACBA::OrderLots();
                    }
                 }
              }
            Gi_1E = Gi_1E - 1;
           }
         while(Gi_1E >= 0);
        }
      LotajeSimboloAuxiliar_4 = NormalizeDouble((LotajeSimboloAuxiliar_4 + LotajeSimAuxiliar_4), DigitosDecimalesSimboloAuxiliar_4);
     }
// ########################################## FIN USEPLOT ##########################################
// ########################################## FIN USEPLOT ##########################################
// ########################################## FIN USEPLOT ##########################################
// ########################################## FIN USEPLOT ##########################################


// ###########################################################################################################################################################
// ################################################################## I N I C I O ############################################################################
// ################################################### C O N D I C I O N    P R I N C I P A L ################################################################
// ###########################################################################################################################################################
// ###########################################################################################################################################################

// ########## SIMBOLO PRINCIPAL ##########
// ####################### BOTON AUTOTRADE está en ON (por defecto) ###########################
   if(ACBA::ObjectGetInteger(0, "TRADEs_AUTOTRADE", OBJPROP_STATE, 0) == 0 && (ACBA::TimeHour(TimeCurrent()) >= HoraInicioOperativa) && (ACBA::TimeHour(TimeCurrent()) < HoraFinOperativa))
     {
      // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      Sim_Principal = SimboloPrincipal;
      Gi_1D = -1;
      Gi_1F = 0;
      Gi_20 = ACBA::OrdersTotal() - 1;
      Gi_21 = Gi_20;
      if(Gi_20 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_21, 0, 0) && ACBA::OrderSymbol() == Sim_Principal && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_20 = ACBA::OrderOpenTime();
               if(Gl_20 >= ACBA::iTime(Sim_Principal, TimeFrame, 0))
                 {
                  if(Gi_1D == -1 || ACBA::OrderType() == Gi_1D)
                    {
                     Gi_1F = Gi_1F + 1;
                    }
                 }
              }
            Gi_21 = Gi_21 - 1;
           }
         while(Gi_21 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_1F == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_4A = SimboloPrincipal;
         Gi_20 = -1;
         Gi_22 = 0;
         Gi_23 = ACBA::OrdersHistoryTotal() - 1;
         Gi_24 = Gi_23;
         if(Gi_23 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_24, 0, 1) && ACBA::OrderSymbol() == str_4A && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_23 = ACBA::OrderOpenTime();
                  if(Gl_23 >= ACBA::iTime(str_4A, TimeFrame, 0))
                    {
                     Gl_23 = ACBA::OrderCloseTime();
                     if(Gl_23 >= ACBA::iTime(str_4A, TimeFrame, 0))
                       {
                        if(Gi_20 == -1 || ACBA::OrderType() == Gi_20)
                          {
                           Gi_22 = Gi_22 + 1;
                          }
                       }
                    }
                 }
               Gi_24 = Gi_24 - 1;
              }
            while(Gi_24 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_22 == 0)
           {
            Gi_23 = NumeroMagico;
            str_4B = SimboloPrincipal;
            Gi_25 = -1;
            Gi_26 = 0;
            Gi_27 = ACBA::OrdersTotal() - 1;
            Gi_28 = Gi_27;
            if(Gi_27 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_28, 0, 0) && ACBA::OrderSymbol() == str_4B && Gi_23 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_25 == -1 || ACBA::OrderType() == Gi_25)
                       {
                        Gi_26 = Gi_26 + 1;
                       }
                    }
                  Gi_28 = Gi_28 - 1;
                 }
               while(Gi_28 >= 0);
              }
            if(Gi_26 == 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 0, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R)
              {
               // Abre orden BUY
               OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 1 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_4C = SimboloAuxiliar_1;
      Gi_27 = -1;
      Gi_29 = 0;
      Gi_2A = ACBA::OrdersTotal() - 1;
      Gi_2B = Gi_2A;
      if(Gi_2A >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_2B, 0, 0) && ACBA::OrderSymbol() == str_4C && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_2A = ACBA::OrderOpenTime();
               if(Gl_2A >= ACBA::iTime(str_4C, TimeFrame, 0))
                 {
                  if(Gi_27 == -1 || ACBA::OrderType() == Gi_27)
                    {
                     Gi_29 = Gi_29 + 1;
                    }
                 }
              }
            Gi_2B = Gi_2B - 1;
           }
         while(Gi_2B >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_29 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_4D = SimboloAuxiliar_1;
         Gi_2A = -1;
         Gi_2C = 0;
         Gi_2D = ACBA::OrdersHistoryTotal() - 1;
         Gi_2E = Gi_2D;
         if(Gi_2D >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2E, 0, 1) && ACBA::OrderSymbol() == str_4D && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2D = ACBA::OrderOpenTime();
                  if(Gl_2D >= ACBA::iTime(str_4D, TimeFrame, 0))
                    {
                     Gl_2D = ACBA::OrderCloseTime();
                     if(Gl_2D >= ACBA::iTime(str_4D, TimeFrame, 0))
                       {
                        if(Gi_2A == -1 || ACBA::OrderType() == Gi_2A)
                          {
                           Gi_2C = Gi_2C + 1;
                          }
                       }
                    }
                 }
               Gi_2E = Gi_2E - 1;
              }
            while(Gi_2E >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_2C == 0)
           {
            Gi_2D = NumeroMagico;
            str_4E = SimboloAuxiliar_1;
            Gi_2F = -1;
            Gi_30 = 0;
            Gi_31 = ACBA::OrdersTotal() - 1;
            Gi_32 = Gi_31;
            if(Gi_31 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_32, 0, 0) && ACBA::OrderSymbol() == str_4E && Gi_2D == ACBA::OrderMagicNumber())
                    {
                     if(Gi_2F == -1 || ACBA::OrderType() == Gi_2F)
                       {
                        Gi_30 = Gi_30 + 1;
                       }
                    }
                  Gi_32 = Gi_32 - 1;
                 }
               while(Gi_32 >= 0);
              }
            if(Gi_30 == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_1, 0, LotajeSimboloAuxiliar_1) > 0) && CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3V2R)
              {
               // Abre orden BUY
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 0, LotajeSimboloAuxiliar_1, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 2 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_4F = SimboloAuxiliar_2;
      Gi_31 = -1;
      Gi_33 = 0;
      Gi_34 = ACBA::OrdersTotal() - 1;
      Gi_35 = Gi_34;
      if(Gi_34 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_35, 0, 0) && ACBA::OrderSymbol() == str_4F && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_34 = ACBA::OrderOpenTime();
               if(Gl_34 >= ACBA::iTime(str_4F, TimeFrame, 0))
                 {
                  if(Gi_31 == -1 || ACBA::OrderType() == Gi_31)
                    {
                     Gi_33 = Gi_33 + 1;
                    }
                 }
              }
            Gi_35 = Gi_35 - 1;
           }
         while(Gi_35 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_33 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_50 = SimboloAuxiliar_2;
         Gi_34 = -1;
         Gi_36 = 0;
         Gi_37 = ACBA::OrdersHistoryTotal() - 1;
         Gi_38 = Gi_37;
         if(Gi_37 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_38, 0, 1) && ACBA::OrderSymbol() == str_50 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_37 = ACBA::OrderOpenTime();
                  if(Gl_37 >= ACBA::iTime(str_50, TimeFrame, 0))
                    {
                     Gl_37 = ACBA::OrderCloseTime();
                     if(Gl_37 >= ACBA::iTime(str_50, TimeFrame, 0))
                       {
                        if(Gi_34 == -1 || ACBA::OrderType() == Gi_34)
                          {
                           Gi_36 = Gi_36 + 1;
                          }
                       }
                    }
                 }
               Gi_38 = Gi_38 - 1;
              }
            while(Gi_38 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_36 == 0)
           {
            Gi_37 = NumeroMagico;
            str_51 = SimboloAuxiliar_2;
            Gi_39 = -1;
            Gi_3A = 0;
            Gi_3B = ACBA::OrdersTotal() - 1;
            Gi_3C = Gi_3B;
            if(Gi_3B >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_3C, 0, 0) && ACBA::OrderSymbol() == str_51 && Gi_37 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_39 == -1 || ACBA::OrderType() == Gi_39)
                       {
                        Gi_3A = Gi_3A + 1;
                       }
                    }
                  Gi_3C = Gi_3C - 1;
                 }
               while(Gi_3C >= 0);
              }
            if(Gi_3A == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_2, 0, LotajeSimboloAuxiliar_2) > 0) && CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3V2R)
              {
               // Abre orden BUY
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 0, LotajeSimboloAuxiliar_2, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 3 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_52 = SimboloAuxiliar_3;
      Gi_3B = -1;
      Gi_3D = 0;
      Gi_3E = ACBA::OrdersTotal() - 1;
      Gi_3F = Gi_3E;
      if(Gi_3E >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_3F, 0, 0) && ACBA::OrderSymbol() == str_52 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_3E = ACBA::OrderOpenTime();
               if(Gl_3E >= ACBA::iTime(str_52, TimeFrame, 0))
                 {
                  if(Gi_3B == -1 || ACBA::OrderType() == Gi_3B)
                    {
                     Gi_3D = Gi_3D + 1;
                    }
                 }
              }
            Gi_3F = Gi_3F - 1;
           }
         while(Gi_3F >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_3D == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_53 = SimboloAuxiliar_3;
         Gi_3E = -1;
         Gi_40 = 0;
         Gi_41 = ACBA::OrdersHistoryTotal() - 1;
         Gi_42 = Gi_41;
         if(Gi_41 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_42, 0, 1) && ACBA::OrderSymbol() == str_53 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_41 = ACBA::OrderOpenTime();
                  if(Gl_41 >= ACBA::iTime(str_53, TimeFrame, 0))
                    {
                     Gl_41 = ACBA::OrderCloseTime();
                     if(Gl_41 >= ACBA::iTime(str_53, TimeFrame, 0))
                       {
                        if(Gi_3E == -1 || ACBA::OrderType() == Gi_3E)
                          {
                           Gi_40 = Gi_40 + 1;
                          }
                       }
                    }
                 }
               Gi_42 = Gi_42 - 1;
              }
            while(Gi_42 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_40 == 0)
           {
            Gi_41 = NumeroMagico;
            str_54 = SimboloAuxiliar_3;
            Gi_43 = -1;
            Gi_44 = 0;
            Gi_45 = ACBA::OrdersTotal() - 1;
            Gi_46 = Gi_45;
            if(Gi_45 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_46, 0, 0) && ACBA::OrderSymbol() == str_54 && Gi_41 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_43 == -1 || ACBA::OrderType() == Gi_43)
                       {
                        Gi_44 = Gi_44 + 1;
                       }
                    }
                  Gi_46 = Gi_46 - 1;
                 }
               while(Gi_46 >= 0);
              }
            if(Gi_44 == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_3, 0, LotajeSimboloAuxiliar_3) > 0) && CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3R2V)
              {
               // Abre orden BUY
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 0, LotajeSimboloAuxiliar_3, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 4 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_55 = SimboloAuxiliar_4;
      Gi_45 = -1;
      Gi_47 = 0;
      Gi_48 = ACBA::OrdersTotal() - 1;
      Gi_49 = Gi_48;
      if(Gi_48 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_49, 0, 0) && ACBA::OrderSymbol() == str_55 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_48 = ACBA::OrderOpenTime();
               if(Gl_48 >= ACBA::iTime(str_55, TimeFrame, 0))
                 {
                  if(Gi_45 == -1 || ACBA::OrderType() == Gi_45)
                    {
                     Gi_47 = Gi_47 + 1;
                    }
                 }
              }
            Gi_49 = Gi_49 - 1;
           }
         while(Gi_49 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_47 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_56 = SimboloAuxiliar_4;
         Gi_48 = -1;
         Gi_4A = 0;
         Gi_4B = ACBA::OrdersHistoryTotal() - 1;
         Gi_4C = Gi_4B;
         if(Gi_4B >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_4C, 0, 1) && ACBA::OrderSymbol() == str_56 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_4B = ACBA::OrderOpenTime();
                  if(Gl_4B >= ACBA::iTime(str_56, TimeFrame, 0))
                    {
                     Gl_4B = ACBA::OrderCloseTime();
                     if(Gl_4B >= ACBA::iTime(str_56, TimeFrame, 0))
                       {
                        if(Gi_48 == -1 || ACBA::OrderType() == Gi_48)
                          {
                           Gi_4A = Gi_4A + 1;
                          }
                       }
                    }
                 }
               Gi_4C = Gi_4C - 1;
              }
            while(Gi_4C >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_4A == 0)
           {
            Gi_4B = NumeroMagico;
            str_57 = SimboloAuxiliar_4;
            Gi_4D = -1;
            Gi_4E = 0;
            Gi_4F = ACBA::OrdersTotal() - 1;
            Gi_50 = Gi_4F;
            if(Gi_4F >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_50, 0, 0) && ACBA::OrderSymbol() == str_57 && Gi_4B == ACBA::OrderMagicNumber())
                    {
                     if(Gi_4D == -1 || ACBA::OrderType() == Gi_4D)
                       {
                        Gi_4E = Gi_4E + 1;
                       }
                    }
                  Gi_50 = Gi_50 - 1;
                 }
               while(Gi_50 >= 0);
              }
            if(Gi_4E == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_4, 0, LotajeSimboloAuxiliar_4) > 0) && CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3R2V)
              {
               // Abre orden BUY
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 0, LotajeSimboloAuxiliar_4, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 <<<<<<<<<<<<<<<<<<<<<<<<


      // ################################################################################################################################################################
      // ################################################################################################################################################################
      // ################################################################################################################################################################
      // ################################################################################################################################################################

      // ########## SIMBOLO PRINCIPAL ##########
      // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_58 = SimboloPrincipal;
      Gi_4F = -1;
      Gi_51 = 0;
      Gi_52 = ACBA::OrdersTotal() - 1;
      Gi_53 = Gi_52;
      if(Gi_52 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_53, 0, 0) && ACBA::OrderSymbol() == str_58 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_52 = ACBA::OrderOpenTime();
               if(Gl_52 >= ACBA::iTime(str_58, TimeFrame, 0))
                 {
                  if(Gi_4F == -1 || ACBA::OrderType() == Gi_4F)
                    {
                     Gi_51 = Gi_51 + 1;
                    }
                 }
              }
            Gi_53 = Gi_53 - 1;
           }
         while(Gi_53 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_51 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_59 = SimboloPrincipal;
         Gi_52 = -1;
         Gi_54 = 0;
         Gi_55 = ACBA::OrdersHistoryTotal() - 1;
         Gi_56 = Gi_55;
         if(Gi_55 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_56, 0, 1) && ACBA::OrderSymbol() == str_59 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_55 = ACBA::OrderOpenTime();
                  if(Gl_55 >= ACBA::iTime(str_59, TimeFrame, 0))
                    {
                     Gl_55 = ACBA::OrderCloseTime();
                     if(Gl_55 >= ACBA::iTime(str_59, TimeFrame, 0))
                       {
                        if(Gi_52 == -1 || ACBA::OrderType() == Gi_52)
                          {
                           Gi_54 = Gi_54 + 1;
                          }
                       }
                    }
                 }
               Gi_56 = Gi_56 - 1;
              }
            while(Gi_56 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_54 == 0)
           {
            Gi_55 = NumeroMagico;
            str_5A = SimboloPrincipal;
            Gi_57 = -1;
            Gi_58 = 0;
            Gi_59 = ACBA::OrdersTotal() - 1;
            Gi_5A = Gi_59;
            if(Gi_59 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_5A, 0, 0) && ACBA::OrderSymbol() == str_5A && Gi_55 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_57 == -1 || ACBA::OrderType() == Gi_57)
                       {
                        Gi_58 = Gi_58 + 1;
                       }
                    }
                  Gi_5A = Gi_5A - 1;
                 }
               while(Gi_5A >= 0);
              }
            if(Gi_58 == 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 1, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V)
              {
               // Abre orden SELL
               OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO PRINCIPAL = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 1 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_5B = SimboloAuxiliar_1;
      Gi_59 = -1;
      Gi_5B = 0;
      Gi_5C = ACBA::OrdersTotal() - 1;
      Gi_5D = Gi_5C;
      if(Gi_5C >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_5D, 0, 0) && ACBA::OrderSymbol() == str_5B && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_5C = ACBA::OrderOpenTime();
               if(Gl_5C >= ACBA::iTime(str_5B, TimeFrame, 0))
                 {
                  if(Gi_59 == -1 || ACBA::OrderType() == Gi_59)
                    {
                     Gi_5B = Gi_5B + 1;
                    }
                 }
              }
            Gi_5D = Gi_5D - 1;
           }
         while(Gi_5D >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_5B == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_5C = SimboloAuxiliar_1;
         Gi_5C = -1;
         Gi_5E = 0;
         Gi_5F = ACBA::OrdersHistoryTotal() - 1;
         Gi_60 = Gi_5F;
         if(Gi_5F >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_60, 0, 1) && ACBA::OrderSymbol() == str_5C && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_5F = ACBA::OrderOpenTime();
                  if(Gl_5F >= ACBA::iTime(str_5C, TimeFrame, 0))
                    {
                     Gl_5F = ACBA::OrderCloseTime();
                     if(Gl_5F >= ACBA::iTime(str_5C, TimeFrame, 0))
                       {
                        if(Gi_5C == -1 || ACBA::OrderType() == Gi_5C)
                          {
                           Gi_5E = Gi_5E + 1;
                          }
                       }
                    }
                 }
               Gi_60 = Gi_60 - 1;
              }
            while(Gi_60 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_5E == 0)
           {
            Gi_5F = NumeroMagico;
            str_5D = SimboloAuxiliar_1;
            Gi_61 = -1;
            Gi_62 = 0;
            Gi_63 = ACBA::OrdersTotal() - 1;
            Gi_64 = Gi_63;
            if(Gi_63 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_64, 0, 0) && ACBA::OrderSymbol() == str_5D && Gi_5F == ACBA::OrderMagicNumber())
                    {
                     if(Gi_61 == -1 || ACBA::OrderType() == Gi_61)
                       {
                        Gi_62 = Gi_62 + 1;
                       }
                    }
                  Gi_64 = Gi_64 - 1;
                 }
               while(Gi_64 >= 0);
              }
            if(Gi_62 == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_1, 1, LotajeSimboloAuxiliar_1) > 0) && CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3R2V)
              {
               // Abre orden SELL
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 1, LotajeSimboloAuxiliar_1, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 1 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 2 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_5E = SimboloAuxiliar_2;
      Gi_63 = -1;
      Gi_65 = 0;
      Gi_66 = ACBA::OrdersTotal() - 1;
      Gi_67 = Gi_66;
      if(Gi_66 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_67, 0, 0) && ACBA::OrderSymbol() == str_5E && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_66 = ACBA::OrderOpenTime();
               if(Gl_66 >= ACBA::iTime(str_5E, TimeFrame, 0))
                 {
                  if(Gi_63 == -1 || ACBA::OrderType() == Gi_63)
                    {
                     Gi_65 = Gi_65 + 1;
                    }
                 }
              }
            Gi_67 = Gi_67 - 1;
           }
         while(Gi_67 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_65 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_5F = SimboloAuxiliar_2;
         Gi_66 = -1;
         Gi_68 = 0;
         Gi_69 = ACBA::OrdersHistoryTotal() - 1;
         Gi_6A = Gi_69;
         if(Gi_69 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_6A, 0, 1) && ACBA::OrderSymbol() == str_5F && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_69 = ACBA::OrderOpenTime();
                  if(Gl_69 >= ACBA::iTime(str_5F, TimeFrame, 0))
                    {
                     Gl_69 = ACBA::OrderCloseTime();
                     if(Gl_69 >= ACBA::iTime(str_5F, TimeFrame, 0))
                       {
                        if(Gi_66 == -1 || ACBA::OrderType() == Gi_66)
                          {
                           Gi_68 = Gi_68 + 1;
                          }
                       }
                    }
                 }
               Gi_6A = Gi_6A - 1;
              }
            while(Gi_6A >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_68 == 0)
           {
            Gi_69 = NumeroMagico;
            str_60 = SimboloAuxiliar_2;
            Gi_6B = -1;
            Gi_6C = 0;
            Gi_6D = ACBA::OrdersTotal() - 1;
            Gi_6E = Gi_6D;
            if(Gi_6D >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_6E, 0, 0) && ACBA::OrderSymbol() == str_60 && Gi_69 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_6B == -1 || ACBA::OrderType() == Gi_6B)
                       {
                        Gi_6C = Gi_6C + 1;
                       }
                    }
                  Gi_6E = Gi_6E - 1;
                 }
               while(Gi_6E >= 0);
              }
            if(Gi_6C == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_2, 1, LotajeSimboloAuxiliar_2) > 0) && CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3R2V)
              {
               // Abre orden SELL
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 1, LotajeSimboloAuxiliar_2, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 2 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 3 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_61 = SimboloAuxiliar_3;
      Gi_6D = -1;
      Gi_6F = 0;
      Gi_70 = ACBA::OrdersTotal() - 1;
      Gi_71 = Gi_70;
      if(Gi_70 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_71, 0, 0) && ACBA::OrderSymbol() == str_61 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_70 = ACBA::OrderOpenTime();
               if(Gl_70 >= ACBA::iTime(str_61, TimeFrame, 0))
                 {
                  if(Gi_6D == -1 || ACBA::OrderType() == Gi_6D)
                    {
                     Gi_6F = Gi_6F + 1;
                    }
                 }
              }
            Gi_71 = Gi_71 - 1;
           }
         while(Gi_71 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_6F == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_62 = SimboloAuxiliar_3;
         Gi_70 = -1;
         Gi_72 = 0;
         Gi_73 = ACBA::OrdersHistoryTotal() - 1;
         Gi_74 = Gi_73;
         if(Gi_73 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_74, 0, 1) && ACBA::OrderSymbol() == str_62 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_73 = ACBA::OrderOpenTime();
                  if(Gl_73 >= ACBA::iTime(str_62, TimeFrame, 0))
                    {
                     Gl_73 = ACBA::OrderCloseTime();
                     if(Gl_73 >= ACBA::iTime(str_62, TimeFrame, 0))
                       {
                        if(Gi_70 == -1 || ACBA::OrderType() == Gi_70)
                          {
                           Gi_72 = Gi_72 + 1;
                          }
                       }
                    }
                 }
               Gi_74 = Gi_74 - 1;
              }
            while(Gi_74 >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_72 == 0)
           {
            Gi_73 = NumeroMagico;
            str_63 = SimboloAuxiliar_3;
            Gi_75 = -1;
            Gi_76 = 0;
            Gi_77 = ACBA::OrdersTotal() - 1;
            Gi_78 = Gi_77;
            if(Gi_77 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_78, 0, 0) && ACBA::OrderSymbol() == str_63 && Gi_73 == ACBA::OrderMagicNumber())
                    {
                     if(Gi_75 == -1 || ACBA::OrderType() == Gi_75)
                       {
                        Gi_76 = Gi_76 + 1;
                       }
                    }
                  Gi_78 = Gi_78 - 1;
                 }
               while(Gi_78 >= 0);
              }
            if(Gi_76 == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_3, 1, LotajeSimboloAuxiliar_3) > 0) && CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3V2R)
              {
               // Abre orden SELL
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 1, LotajeSimboloAuxiliar_3, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 3 = 0 <<<<<<<<<<<<<<<<<<<<<<<<

      // ########## SIMBOLO AUXILIAR 4 ##########
      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
      str_64 = SimboloAuxiliar_4;
      Gi_77 = -1;
      Gi_79 = 0;
      Gi_7A = ACBA::OrdersTotal() - 1;
      Gi_7B = Gi_7A;
      if(Gi_7A >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_7B, 0, 0) && ACBA::OrderSymbol() == str_64 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gl_7A = ACBA::OrderOpenTime();
               if(Gl_7A >= ACBA::iTime(str_64, TimeFrame, 0))
                 {
                  if(Gi_77 == -1 || ACBA::OrderType() == Gi_77)
                    {
                     Gi_79 = Gi_79 + 1;
                    }
                 }
              }
            Gi_7B = Gi_7B - 1;
           }
         while(Gi_7B >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 >>>>>>>>>>>>>>>>>>>>>
      if(Gi_79 == 0)
        {
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>
         str_65 = SimboloAuxiliar_4;
         Gi_7A = -1;
         Gi_7C = 0;
         Gi_7D = ACBA::OrdersHistoryTotal() - 1;
         Gi_7E = Gi_7D;
         if(Gi_7D >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_7E, 0, 1) && ACBA::OrderSymbol() == str_65 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_7D = ACBA::OrderOpenTime();
                  if(Gl_7D >= ACBA::iTime(str_65, TimeFrame, 0))
                    {
                     Gl_7D = ACBA::OrderCloseTime();
                     if(Gl_7D >= ACBA::iTime(str_65, TimeFrame, 0))
                       {
                        if(Gi_7A == -1 || ACBA::OrderType() == Gi_7A)
                          {
                           Gi_7C = Gi_7C + 1;
                          }
                       }
                    }
                 }
               Gi_7E = Gi_7E - 1;
              }
            while(Gi_7E >= 0);
           }
         // >>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>>>>>>

         // >>>>>>>>>>>>>> CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 >>>>>>>>>>>>>>>>>>>>>
         if(Gi_7C == 0)
           {
            Gi_7D = NumeroMagico;
            str_66 = SimboloAuxiliar_4;
            Gi_7F = -1;
            Gi_80 = 0;
            Gi_81 = ACBA::OrdersTotal() - 1;
            Gi_82 = Gi_81;
            if(Gi_81 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_82, 0, 0) && ACBA::OrderSymbol() == str_66 && Gi_7D == ACBA::OrderMagicNumber())
                    {
                     if(Gi_7F == -1 || ACBA::OrderType() == Gi_7F)
                       {
                        Gi_80 = Gi_80 + 1;
                       }
                    }
                  Gi_82 = Gi_82 - 1;
                 }
               while(Gi_82 >= 0);
              }
            if(Gi_80 == 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_4, 1, LotajeSimboloAuxiliar_4) > 0) && CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3V2R)
              {
               // Abre orden SELL
               OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 1, LotajeSimboloAuxiliar_4, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
              }
           }
         // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS y CERRADAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< CONDICIÓN: SI ORDENES ABIERTAS EN VELA ACTUAL SIMBOLO AUXILIAR 4 = 0 <<<<<<<<<<<<<<<<<<<<<<<<
     }
// ###########################################################################################################################################################
// ##################################################################### F I N ###############################################################################
// ################################################### C O N D I C I O N    P R I N C I P A L ################################################################
// ###########################################################################################################################################################
// ###########################################################################################################################################################

// >>>>>>>>>>>>>>>> CUENTA ORDENES ABIERTAS con el mismo NUMERO MAGICO >>>>>>>>>>>>>>>>
   Gi_81 = -1;
   OrdenesAbiertasNumeroMagico = 0;
   Gi_84 = ACBA::OrdersTotal() - 1;
   Gi_85 = Gi_84;
   if(Gi_84 >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_85, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
           {
            if(Gi_81 == -1 || ACBA::OrderType() == Gi_81)
              {
               OrdenesAbiertasNumeroMagico = OrdenesAbiertasNumeroMagico + 1;
              }
           }
         Gi_85 = Gi_85 - 1;
        }
      while(Gi_85 >= 0);
     }
// <<<<<<<<<<<<<<<<<<<<<<<< CUENTA ORDENES ABIERTAS con el mismo NUMERO MAGICO <<<<<<<<<<<<<<<<<<<<<<<<

   if(OrdenesAbiertasNumeroMagico < LimiteMaximoOrdenes && (ACBA::TimeHour(TimeCurrent()) >= HoraInicioOperativa) && (ACBA::TimeHour(TimeCurrent()) < HoraFinOperativa))
     {
      // >>>>>>>>>>>>>>>> CUENTA ORDENES ABIERTAS (otra vez) con el mismo NUMERO MAGICO >>>>>>>>>>>>>>>>
      Gi_84 = -1;
      Gi_86 = 0;
      Gi_87 = ACBA::OrdersTotal() - 1;
      Gi_88 = Gi_87;
      if(Gi_87 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_88, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(Gi_84 == -1 || ACBA::OrderType() == Gi_84)
                 {
                  Gi_86 = Gi_86 + 1;
                 }
              }
            Gi_88 = Gi_88 - 1;
           }
         while(Gi_88 >= 0);
        }
      Gl_87 = AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
      Gl_89 = Gi_86;
      // <<<<<<<<<<<<<<<<<<<<<<<< CUENTA ORDENES ABIERTAS (otra vez) con el mismo NUMERO MAGICO <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> Si se cumple que Ordenes Abiertas < Limite de ordenes de la cuenta  O  Limite de ordenes de la cuenta = INDEFINIDO entonces: >>>>>>>>>>>>>>>>
      if(Gl_89 < Gl_87 || AccountInfoInteger(ACCOUNT_LIMIT_ORDERS) == 0)
        {
         //################################ boton TRADEs_REJILLA_MENOS en ON ################################
         if(ACBA::ObjectGetInteger(0, "TRADEs_REJILLA_MENOS", OBJPROP_STATE, 0) == 0)
           {

            // #################################################################################################################
            // #################################################################################################################
            // ################### GESTIONA NUEVAS ORDENES BUY y SELL EN SIMBOLO PRINCIPAL #####################################
            // #################################################################################################################
            // #################################################################################################################

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_67 = SimboloPrincipal;
            Gi_89 = -1;
            Gi_8A = 0;
            Gi_8B = ACBA::OrdersTotal() - 1;
            Gi_8C = Gi_8B;
            if(Gi_8B >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_8C, 0, 0) && ACBA::OrderSymbol() == str_67 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_8B = ACBA::OrderOpenTime();
                     if(Gl_8B >= ACBA::iTime(str_67, TimeFrame, 0))
                       {
                        if(Gi_89 == -1 || ACBA::OrderType() == Gi_89)
                          {
                           Gi_8A = Gi_8A + 1;
                          }
                       }
                    }
                  Gi_8C = Gi_8C - 1;
                 }
               while(Gi_8C >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_8A == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_68 = SimboloPrincipal;
               Gi_8B = -1;
               Gi_8D = 0;
               Gi_8E = ACBA::OrdersHistoryTotal() - 1;
               Gi_8F = Gi_8E;
               if(Gi_8E >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_8F, 0, 1) && ACBA::OrderSymbol() == str_68 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_8E = ACBA::OrderOpenTime();
                        if(Gl_8E >= ACBA::iTime(str_68, TimeFrame, 0))
                          {
                           Gl_8E = ACBA::OrderCloseTime();
                           if(Gl_8E >= ACBA::iTime(str_68, TimeFrame, 0))
                             {
                              if(Gi_8B == -1 || ACBA::OrderType() == Gi_8B)
                                {
                                 Gi_8D = Gi_8D + 1;
                                }
                             }
                          }
                       }
                     Gi_8F = Gi_8F - 1;
                    }
                  while(Gi_8F >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_8D == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL: Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_8E = NumeroMagico;
                  str_69 = SimboloPrincipal;
                  Gi_90 = 0; // ordenes BUY
                  NumeroOrdenesBuySimboloPrincipal = 0;
                  Gi_92 = ACBA::OrdersTotal() - 1;
                  Gi_93 = Gi_92;
                  if(Gi_92 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_93, 0, 0) && ACBA::OrderSymbol() == str_69 && Gi_8E == ACBA::OrderMagicNumber())
                          {
                           if(Gi_90 == -1 || ACBA::OrderType() == Gi_90)
                             {
                              NumeroOrdenesBuySimboloPrincipal = NumeroOrdenesBuySimboloPrincipal + 1;
                             }
                          }
                        Gi_93 = Gi_93 - 1;
                       }
                     while(Gi_93 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO PRINCIPAL: Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesBuySimboloPrincipal > 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 0, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: Cuenta ordenes BUY que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_92 = NumeroMagico;
                     str_6A = SimboloPrincipal;
                     Gi_94 = 0;
                     Gi_95 = 0;
                     Gi_96 = ACBA::OrdersTotal() - 1;
                     Gi_97 = Gi_96;
                     if(Gi_96 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_97, 0, 0) && ACBA::OrderSymbol() == str_6A && Gi_92 == ACBA::OrderMagicNumber())
                             {
                              Gd_96 = ACBA::OrderProfit();
                              Gd_96 = (Gd_96 + ACBA::OrderSwap());
                              if(((Gd_96 + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_94 == -1 || ACBA::OrderType() == Gi_94)
                                   {
                                    Gi_95 = Gi_95 + 1;
                                   }
                                }
                             }
                           Gi_97 = Gi_97 - 1;
                          }
                        while(Gi_97 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO PRINCIPAL: Cuenta ordenes BUY que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: SI ordenes BUY que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_95 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                        Gd_96 = ACBA::MarketInfo(SimboloPrincipal, MODE_ASK);
                        Gd_96 = ((pXAUUSD_Step * ACBA::MarketInfo(SimboloPrincipal, MODE_POINT)) + Gd_96);
                        Gi_98 = NumeroMagico;
                        str_6B = SimboloPrincipal;
                        Gd_99 = 0;
                        Gi_9A = 0;
                        Gi_9B = 0;
                        Gi_9C = ACBA::OrdersTotal() - 1;
                        Gi_9D = Gi_9C;
                        if(Gi_9C >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_9D, 0, 0) && ACBA::OrderSymbol() == str_6B && ACBA::OrderMagicNumber() == Gi_98 && ACBA::OrderType() == OP_BUY)
                                {
                                 Gi_9A = ACBA::OrderTicket();
                                 if(Gi_9A > Gi_9B)
                                   {
                                    Gi_9B = Gi_9A;
                                    Gd_99 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_9D = Gi_9D - 1;
                             }
                           while(Gi_9D >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO PRINCIPAL: Si el (PrecioAcutal + pXAUUSD_Step) <= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                        if((Gd_96 <= Gd_99))
                          {
                           OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                          }
                       }
                     // <<<<<<<<<<<<FIN<<<<<<<<<<<< SIMBOLO PRINCIPAL: SI ordenes BUY que están con BENEFICIO = 0  <<<<<<<<<<<<
                    }
                 }
               // <<<<<<< FIN <<<<<<<<<<<< SIMBOLO PRINCIPAL - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 <<<<<<<<<<<<<<<<<<<
              }
            // <<<<<<<FIN<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 <<<<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL: Cuenta ORDENES ABIERTAS en la vela actual >>>>>>>>>>>>>>>>
            str_6C = SimboloPrincipal;
            Gi_9C = -1;
            Gi_9E = 0;
            Gi_9F = ACBA::OrdersTotal() - 1;
            Gi_A0 = Gi_9F;
            if(Gi_9F >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_A0, 0, 0) && ACBA::OrderSymbol() == str_6C && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_9F = ACBA::OrderOpenTime();
                     if(Gl_9F >= ACBA::iTime(str_6C, TimeFrame, 0))
                       {
                        if(Gi_9C == -1 || ACBA::OrderType() == Gi_9C)
                          {
                           Gi_9E = Gi_9E + 1;
                          }
                       }
                    }
                  Gi_A0 = Gi_A0 - 1;
                 }
               while(Gi_A0 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL: Cuenta ORDENES ABIERTAS en la vela actual <<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL: si ORDENES ABIERTAS en la vela actual = 0 >>>>>>>>>>>>>>>>
            if(Gi_9E == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - cuenta ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_6D = SimboloPrincipal;
               Gi_9F = -1;
               Gi_A1 = 0;
               Gi_A2 = ACBA::OrdersHistoryTotal() - 1;
               Gi_A3 = Gi_A2;
               if(Gi_A2 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_A3, 0, 1) && ACBA::OrderSymbol() == str_6D && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_A2 = ACBA::OrderOpenTime();
                        if(Gl_A2 >= ACBA::iTime(str_6D, TimeFrame, 0))
                          {
                           Gl_A2 = ACBA::OrderCloseTime();
                           if(Gl_A2 >= ACBA::iTime(str_6D, TimeFrame, 0))
                             {
                              if(Gi_9F == -1 || ACBA::OrderType() == Gi_9F)
                                {
                                 Gi_A1 = Gi_A1 + 1;
                                }
                             }
                          }
                       }
                     Gi_A3 = Gi_A3 - 1;
                    }
                  while(Gi_A3 >= 0);
                 }
               // >>>>>>FIN>>>>>>>>>> SIMBOLO PRINCIPAL - cuenta ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>

               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_A1 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL: Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_A2 = NumeroMagico;
                  str_6E = SimboloPrincipal;
                  Gi_A4 = 1; // Ordenes SELL
                  NumeroOrdenesSellSimboloPrincipal = 0;
                  Gi_A6 = ACBA::OrdersTotal() - 1;
                  Gi_A7 = Gi_A6;
                  if(Gi_A6 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_A7, 0, 0) && ACBA::OrderSymbol() == str_6E && Gi_A2 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_A4 == -1 || ACBA::OrderType() == Gi_A4)
                             {
                              NumeroOrdenesSellSimboloPrincipal = NumeroOrdenesSellSimboloPrincipal + 1;
                             }
                          }
                        Gi_A7 = Gi_A7 - 1;
                       }
                     while(Gi_A7 >= 0);
                    }
                  // >>>>>>>>>FIN>>>>>>>>>>>>  SIMBOLO PRINCIPAL: Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>

                  if(NumeroOrdenesSellSimboloPrincipal > 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 1, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: Cuenta ordenes SELL que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_A6 = NumeroMagico;
                     str_6F = SimboloPrincipal;
                     Gi_A8 = 1;
                     Gi_A9 = 0;
                     Gi_AA = ACBA::OrdersTotal() - 1;
                     Gi_AB = Gi_AA;
                     if(Gi_AA >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_AB, 0, 0) && ACBA::OrderSymbol() == str_6F && Gi_A6 == ACBA::OrderMagicNumber())
                             {
                              Gd_AA = ACBA::OrderProfit();
                              Gd_AA = (Gd_AA + ACBA::OrderSwap());
                              if(((Gd_AA + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_A8 == -1 || ACBA::OrderType() == Gi_A8)
                                   {
                                    Gi_A9 = Gi_A9 + 1;
                                   }
                                }
                             }
                           Gi_AB = Gi_AB - 1;
                          }
                        while(Gi_AB >= 0);
                       }
                     // <<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL: Cuenta ordenes SELL que están con BENEFICIO <<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: SI ordenes SELL que están con BENEFICIO = 0 entonces: >>>>>>>>>>>>>>>
                     if(Gi_A9 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO PRINCIPAL: Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                        Gd_AA = ACBA::MarketInfo(SimboloPrincipal, MODE_BID);
                        Gd_AC = (pXAUUSD_Step * ACBA::MarketInfo(SimboloPrincipal, MODE_POINT));
                        Gd_AC = (Gd_AA - Gd_AC);
                        Gi_AD = NumeroMagico;
                        str_70 = SimboloPrincipal;
                        Gd_AE = 0;
                        Gi_AF = 0;
                        Gi_B0 = 0;
                        Gi_B1 = ACBA::OrdersTotal() - 1;
                        Gi_B2 = Gi_B1;
                        if(Gi_B1 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_B2, 0, 0) && ACBA::OrderSymbol() == str_70 && ACBA::OrderMagicNumber() == Gi_AD && ACBA::OrderType() == OP_SELL)
                                {
                                 Gi_AF = ACBA::OrderTicket();
                                 if(Gi_AF > Gi_B0)
                                   {
                                    Gi_B0 = Gi_AF;
                                    Gd_AE = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_B2 = Gi_B2 - 1;
                             }
                           while(Gi_B2 >= 0);
                          }
                        // <<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL: Busca el precio de apertura del ULTIMO SELL abierto <<<<<<<<<<<<<<<<<<<

                        // >>>>>>>>>> SIMBOLO PRINCIPAL: Si el (PrecioAcutal - pXAUUSD_Step) >= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                        if((Gd_AC >= Gd_AE))
                          {
                           OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                          }
                       }
                     // <<<<<<<<<<<<<<<<<<<FIN <<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL: SI ordenes SELL que están con BENEFICIO = 0 <<<<<<<<<<<<<<<<<<<
                    }
                 }
              }
            // <<<<<<<<<<<<<<<FIN<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL: si ORDENES ABIERTAS en la vela actual = 0 <<<<<<<<<<<<<<<

            // #################################################################################################################
            // #################################################################################################################
            // ################### GESTIONA NUEVAS ORDENES BUY y SELL EN SIMBOLO AUXILIAR 1 ####################################
            // #################################################################################################################
            // #################################################################################################################

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_71 = SimboloAuxiliar_1;
            Gi_B1 = -1;
            Gi_B3 = 0;
            Gi_B4 = ACBA::OrdersTotal() - 1;
            Gi_B5 = Gi_B4;
            if(Gi_B4 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_B5, 0, 0) && ACBA::OrderSymbol() == str_71 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_B4 = ACBA::OrderOpenTime();
                     if(Gl_B4 >= ACBA::iTime(str_71, TimeFrame, 0))
                       {
                        if(Gi_B1 == -1 || ACBA::OrderType() == Gi_B1)
                          {
                           Gi_B3 = Gi_B3 + 1;
                          }
                       }
                    }
                  Gi_B5 = Gi_B5 - 1;
                 }
               while(Gi_B5 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_B3 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_72 = SimboloAuxiliar_1;
               Gi_B4 = -1;
               Gi_B6 = 0;
               Gi_B7 = ACBA::OrdersHistoryTotal() - 1;
               Gi_B8 = Gi_B7;
               if(Gi_B7 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_B8, 0, 1) && ACBA::OrderSymbol() == str_72 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_B7 = ACBA::OrderOpenTime();
                        if(Gl_B7 >= ACBA::iTime(str_72, TimeFrame, 0))
                          {
                           Gl_B7 = ACBA::OrderCloseTime();
                           if(Gl_B7 >= ACBA::iTime(str_72, TimeFrame, 0))
                             {
                              if(Gi_B4 == -1 || ACBA::OrderType() == Gi_B4)
                                {
                                 Gi_B6 = Gi_B6 + 1;
                                }
                             }
                          }
                       }
                     Gi_B8 = Gi_B8 - 1;
                    }
                  while(Gi_B8 >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_B6 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 1: Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_B7 = NumeroMagico;
                  str_73 = SimboloAuxiliar_1;
                  Gi_B9 = 0;
                  NumeroOrdenesBuySimboloAuxiliar1 = 0;
                  Gi_BB = ACBA::OrdersTotal() - 1;
                  Gi_BC = Gi_BB;
                  if(Gi_BB >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_BC, 0, 0) && ACBA::OrderSymbol() == str_73 && Gi_B7 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_B9 == -1 || ACBA::OrderType() == Gi_B9)
                             {
                              NumeroOrdenesBuySimboloAuxiliar1 = NumeroOrdenesBuySimboloAuxiliar1 + 1;
                             }
                          }
                        Gi_BC = Gi_BC - 1;
                       }
                     while(Gi_BC >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 1: Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesBuySimboloAuxiliar1 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_1, 0, LotajeSimboloAuxiliar_1) > 0) && CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: Cuenta ordenes BUY que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_BB = NumeroMagico;
                     str_74 = SimboloAuxiliar_1;
                     Gi_BD = 0;
                     Gi_BE = 0;
                     Gi_BF = ACBA::OrdersTotal() - 1;
                     Gi_C0 = Gi_BF;
                     if(Gi_BF >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_C0, 0, 0) && ACBA::OrderSymbol() == str_74 && Gi_BB == ACBA::OrderMagicNumber())
                             {
                              Gd_BF = ACBA::OrderProfit();
                              Gd_BF = (Gd_BF + ACBA::OrderSwap());
                              if(((Gd_BF + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_BD == -1 || ACBA::OrderType() == Gi_BD)
                                   {
                                    Gi_BE = Gi_BE + 1;
                                   }
                                }
                             }
                           Gi_C0 = Gi_C0 - 1;
                          }
                        while(Gi_C0 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 1: Cuenta ordenes BUY que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: SI ordenes BUY que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_BE == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                        Gd_BF = ACBA::MarketInfo(SimboloAuxiliar_1, MODE_ASK);
                        Gd_BF = ((SimboloAuxiliar1_STEP * ACBA::MarketInfo(SimboloAuxiliar_1, MODE_POINT)) + Gd_BF);
                        Gi_C1 = NumeroMagico;
                        str_75 = SimboloAuxiliar_1;
                        Gd_C2 = 0;
                        Gi_C3 = 0;
                        Gi_C4 = 0;
                        Gi_C5 = ACBA::OrdersTotal() - 1;
                        Gi_C6 = Gi_C5;
                        if(Gi_C5 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_C6, 0, 0) && ACBA::OrderSymbol() == str_75 && ACBA::OrderMagicNumber() == Gi_C1 && ACBA::OrderType() == OP_BUY)
                                {
                                 Gi_C3 = ACBA::OrderTicket();
                                 if(Gi_C3 > Gi_C4)
                                   {
                                    Gi_C4 = Gi_C3;
                                    Gd_C2 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_C6 = Gi_C6 - 1;
                             }
                           while(Gi_C6 >= 0);
                          }
                        // <<<<<<<<<<<<<< SIMBOLO AUXILIAR 1: Busca el precio de apertura del ULTIMO BUY abierto <<<<<<<<<<<<<<

                        // >>>>>>>>>> SIMBOLO AUXILIAR 1: Si el (PrecioAcutal + SimboloAuxiliar1_STEP) <= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                        if((Gd_BF <= Gd_C2))
                          {
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 0, LotajeSimboloAuxiliar_1, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                          }
                       }
                    }
                 }
              }

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_76 = SimboloAuxiliar_1;
            Gi_C5 = -1;
            Gi_C7 = 0;
            Gi_C8 = ACBA::OrdersTotal() - 1;
            Gi_C9 = Gi_C8;
            if(Gi_C8 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_C9, 0, 0) && ACBA::OrderSymbol() == str_76 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_C8 = ACBA::OrderOpenTime();
                     if(Gl_C8 >= ACBA::iTime(str_76, TimeFrame, 0))
                       {
                        if(Gi_C5 == -1 || ACBA::OrderType() == Gi_C5)
                          {
                           Gi_C7 = Gi_C7 + 1;
                          }
                       }
                    }
                  Gi_C9 = Gi_C9 - 1;
                 }
               while(Gi_C9 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_C7 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_77 = SimboloAuxiliar_1;
               Gi_C8 = -1;
               Gi_CA = 0;
               Gi_CB = ACBA::OrdersHistoryTotal() - 1;
               Gi_CC = Gi_CB;
               if(Gi_CB >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_CC, 0, 1) && ACBA::OrderSymbol() == str_77 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_CB = ACBA::OrderOpenTime();
                        if(Gl_CB >= ACBA::iTime(str_77, TimeFrame, 0))
                          {
                           Gl_CB = ACBA::OrderCloseTime();
                           if(Gl_CB >= ACBA::iTime(str_77, TimeFrame, 0))
                             {
                              if(Gi_C8 == -1 || ACBA::OrderType() == Gi_C8)
                                {
                                 Gi_CA = Gi_CA + 1;
                                }
                             }
                          }
                       }
                     Gi_CC = Gi_CC - 1;
                    }
                  while(Gi_CC >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_CA == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 1: Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_CB = NumeroMagico;
                  str_78 = SimboloAuxiliar_1;
                  Gi_CD = 1;
                  NumeroOrdenesSellSimboloAuxiliar1 = 0;
                  Gi_CF = ACBA::OrdersTotal() - 1;
                  Gi_D0 = Gi_CF;
                  if(Gi_CF >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_D0, 0, 0) && ACBA::OrderSymbol() == str_78 && Gi_CB == ACBA::OrderMagicNumber())
                          {
                           if(Gi_CD == -1 || ACBA::OrderType() == Gi_CD)
                             {
                              NumeroOrdenesSellSimboloAuxiliar1 = NumeroOrdenesSellSimboloAuxiliar1 + 1;
                             }
                          }
                        Gi_D0 = Gi_D0 - 1;
                       }
                     while(Gi_D0 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 1: Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesSellSimboloAuxiliar1 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_1, 1, LotajeSimboloAuxiliar_1) > 0) && CondicionPipsVelaSimboloAuxiliar_1_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: Cuenta ordenes SELL que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_CF = NumeroMagico;
                     str_79 = SimboloAuxiliar_1;
                     Gi_D1 = 1;
                     Gi_D2 = 0;
                     Gi_D3 = ACBA::OrdersTotal() - 1;
                     Gi_D4 = Gi_D3;
                     if(Gi_D3 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_D4, 0, 0) && ACBA::OrderSymbol() == str_79 && Gi_CF == ACBA::OrderMagicNumber())
                             {
                              Gd_D3 = ACBA::OrderProfit();
                              Gd_D3 = (Gd_D3 + ACBA::OrderSwap());
                              if(((Gd_D3 + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_D1 == -1 || ACBA::OrderType() == Gi_D1)
                                   {
                                    Gi_D2 = Gi_D2 + 1;
                                   }
                                }
                             }
                           Gi_D4 = Gi_D4 - 1;
                          }
                        while(Gi_D4 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 1: Cuenta ordenes SELL que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: SI ordenes SELL que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_D2 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                        Gd_D3 = ACBA::MarketInfo(SimboloAuxiliar_1, MODE_BID);
                        Gd_D5 = (SimboloAuxiliar1_STEP * ACBA::MarketInfo(SimboloAuxiliar_1, MODE_POINT));
                        Gd_D5 = (Gd_D3 - Gd_D5);
                        Gi_D6 = NumeroMagico;
                        str_7A = SimboloAuxiliar_1;
                        Gd_D7 = 0;
                        Gi_D8 = 0;
                        Gi_D9 = 0;
                        Gi_DA = ACBA::OrdersTotal() - 1;
                        Gi_DB = Gi_DA;
                        if(Gi_DA >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_DB, 0, 0) && ACBA::OrderSymbol() == str_7A && ACBA::OrderMagicNumber() == Gi_D6 && ACBA::OrderType() == OP_SELL)
                                {
                                 Gi_D8 = ACBA::OrderTicket();
                                 if(Gi_D8 > Gi_D9)
                                   {
                                    Gi_D9 = Gi_D8;
                                    Gd_D7 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_DB = Gi_DB - 1;
                             }
                           while(Gi_DB >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 1: Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 1: Si el (PrecioActual - SimboloAuxiliar1_STEP) >= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                        if((Gd_D5 >= Gd_D7))
                          {
                           //abre nuevo SELL
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 1, LotajeSimboloAuxiliar_1, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                          }
                       }
                    }
                 }
              }

            // #################################################################################################################
            // #################################################################################################################
            // ################### GESTIONA NUEVAS ORDENES BUY y SELL EN SIMBOLO AUXILIAR 2 ####################################
            // #################################################################################################################
            // #################################################################################################################


            // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_7B = SimboloAuxiliar_2;
            Gi_DA = -1;
            Gi_DC = 0;
            Gi_DD = ACBA::OrdersTotal() - 1;
            Gi_DE = Gi_DD;
            if(Gi_DD >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_DE, 0, 0) && ACBA::OrderSymbol() == str_7B && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_DD = ACBA::OrderOpenTime();
                     if(Gl_DD >= ACBA::iTime(str_7B, TimeFrame, 0))
                       {
                        if(Gi_DA == -1 || ACBA::OrderType() == Gi_DA)
                          {
                           Gi_DC = Gi_DC + 1;
                          }
                       }
                    }
                  Gi_DE = Gi_DE - 1;
                 }
               while(Gi_DE >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_DC == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_7C = SimboloAuxiliar_2;
               Gi_DD = -1;
               Gi_DF = 0;
               Gi_E0 = ACBA::OrdersHistoryTotal() - 1;
               Gi_E1 = Gi_E0;
               if(Gi_E0 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_E1, 0, 1) && ACBA::OrderSymbol() == str_7C && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_E0 = ACBA::OrderOpenTime();
                        if(Gl_E0 >= ACBA::iTime(str_7C, TimeFrame, 0))
                          {
                           Gl_E0 = ACBA::OrderCloseTime();
                           if(Gl_E0 >= ACBA::iTime(str_7C, TimeFrame, 0))
                             {
                              if(Gi_DD == -1 || ACBA::OrderType() == Gi_DD)
                                {
                                 Gi_DF = Gi_DF + 1;
                                }
                             }
                          }
                       }
                     Gi_E1 = Gi_E1 - 1;
                    }
                  while(Gi_E1 >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_DF == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 2 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_E0 = NumeroMagico;
                  str_7D = SimboloAuxiliar_2;
                  Gi_E2 = 0;
                  NumeroOrdenesBuySimboloAuxiliar2 = 0;
                  Gi_E4 = ACBA::OrdersTotal() - 1;
                  Gi_E5 = Gi_E4;
                  if(Gi_E4 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_E5, 0, 0) && ACBA::OrderSymbol() == str_7D && Gi_E0 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_E2 == -1 || ACBA::OrderType() == Gi_E2)
                             {
                              NumeroOrdenesBuySimboloAuxiliar2 = NumeroOrdenesBuySimboloAuxiliar2 + 1;
                             }
                          }
                        Gi_E5 = Gi_E5 - 1;
                       }
                     while(Gi_E5 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 2 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesBuySimboloAuxiliar2 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_2, 0, LotajeSimboloAuxiliar_2) > 0) && CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 Cuenta ordenes BUY que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_E4 = NumeroMagico;
                     str_7E = SimboloAuxiliar_2;
                     Gi_E6 = 0;
                     Gi_E7 = 0;
                     Gi_E8 = ACBA::OrdersTotal() - 1;
                     Gi_E9 = Gi_E8;
                     if(Gi_E8 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_E9, 0, 0) && ACBA::OrderSymbol() == str_7E && Gi_E4 == ACBA::OrderMagicNumber())
                             {
                              Gd_E8 = ACBA::OrderProfit();
                              Gd_E8 = (Gd_E8 + ACBA::OrderSwap());
                              if(((Gd_E8 + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_E6 == -1 || ACBA::OrderType() == Gi_E6)
                                   {
                                    Gi_E7 = Gi_E7 + 1;
                                   }
                                }
                             }
                           Gi_E9 = Gi_E9 - 1;
                          }
                        while(Gi_E9 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 2 Cuenta ordenes BUY que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2: SI ordenes BUY que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_E7 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                        Gd_E8 = ACBA::MarketInfo(SimboloAuxiliar_2, MODE_ASK);
                        Gd_E8 = ((SimboloAuxiliar2_STEP * ACBA::MarketInfo(SimboloAuxiliar_2, MODE_POINT)) + Gd_E8);
                        Gi_EA = NumeroMagico;
                        str_7F = SimboloAuxiliar_2;
                        Gd_EB = 0;
                        Gi_EC = 0;
                        Gi_ED = 0;
                        Gi_EE = ACBA::OrdersTotal() - 1;
                        Gi_EF = Gi_EE;
                        if(Gi_EE >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_EF, 0, 0) && ACBA::OrderSymbol() == str_7F && ACBA::OrderMagicNumber() == Gi_EA && ACBA::OrderType() == OP_BUY)
                                {
                                 Gi_EC = ACBA::OrderTicket();
                                 if(Gi_EC > Gi_ED)
                                   {
                                    Gi_ED = Gi_EC;
                                    Gd_EB = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_EF = Gi_EF - 1;
                             }
                           while(Gi_EF >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 2 : Si el (PrecioActual + SimboloAuxiliar2_STEP) <= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                        if((Gd_E8 <= Gd_EB))
                          {
                           //abre nuevo BUY
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 0, LotajeSimboloAuxiliar_2, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                          }
                       }
                    }
                 }
              }

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_80 = SimboloAuxiliar_2;
            Gi_EE = -1;
            Gi_F0 = 0;
            Gi_F1 = ACBA::OrdersTotal() - 1;
            Gi_F2 = Gi_F1;
            if(Gi_F1 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_F2, 0, 0) && ACBA::OrderSymbol() == str_80 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_F1 = ACBA::OrderOpenTime();
                     if(Gl_F1 >= ACBA::iTime(str_80, TimeFrame, 0))
                       {
                        if(Gi_EE == -1 || ACBA::OrderType() == Gi_EE)
                          {
                           Gi_F0 = Gi_F0 + 1;
                          }
                       }
                    }
                  Gi_F2 = Gi_F2 - 1;
                 }
               while(Gi_F2 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_F0 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_81 = SimboloAuxiliar_2;
               Gi_F1 = -1;
               Gi_F3 = 0;
               Gi_F4 = ACBA::OrdersHistoryTotal() - 1;
               Gi_F5 = Gi_F4;
               if(Gi_F4 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_F5, 0, 1) && ACBA::OrderSymbol() == str_81 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_F4 = ACBA::OrderOpenTime();
                        if(Gl_F4 >= ACBA::iTime(str_81, TimeFrame, 0))
                          {
                           Gl_F4 = ACBA::OrderCloseTime();
                           if(Gl_F4 >= ACBA::iTime(str_81, TimeFrame, 0))
                             {
                              if(Gi_F1 == -1 || ACBA::OrderType() == Gi_F1)
                                {
                                 Gi_F3 = Gi_F3 + 1;
                                }
                             }
                          }
                       }
                     Gi_F5 = Gi_F5 - 1;
                    }
                  while(Gi_F5 >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_F3 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 2 : Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_F4 = NumeroMagico;
                  str_82 = SimboloAuxiliar_2;
                  Gi_F6 = 1;
                  NumeroOrdenesSellSimboloAuxiliar2 = 0;
                  Gi_F8 = ACBA::OrdersTotal() - 1;
                  Gi_F9 = Gi_F8;
                  if(Gi_F8 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_F9, 0, 0) && ACBA::OrderSymbol() == str_82 && Gi_F4 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_F6 == -1 || ACBA::OrderType() == Gi_F6)
                             {
                              NumeroOrdenesSellSimboloAuxiliar2 = NumeroOrdenesSellSimboloAuxiliar2 + 1;
                             }
                          }
                        Gi_F9 = Gi_F9 - 1;
                       }
                     while(Gi_F9 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 2 : Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesSellSimboloAuxiliar2 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_2, 1, LotajeSimboloAuxiliar_2) > 0) && CondicionPipsVelaSimboloAuxiliar_2_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : Cuenta ordenes SELL que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_F8 = NumeroMagico;
                     str_83 = SimboloAuxiliar_2;
                     Gi_FA = 1;
                     Gi_FB = 0;
                     Gi_FC = ACBA::OrdersTotal() - 1;
                     Gi_FD = Gi_FC;
                     if(Gi_FC >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_FD, 0, 0) && ACBA::OrderSymbol() == str_83 && Gi_F8 == ACBA::OrderMagicNumber())
                             {
                              Gd_FC = ACBA::OrderProfit();
                              Gd_FC = (Gd_FC + ACBA::OrderSwap());
                              if(((Gd_FC + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_FA == -1 || ACBA::OrderType() == Gi_FA)
                                   {
                                    Gi_FB = Gi_FB + 1;
                                   }
                                }
                             }
                           Gi_FD = Gi_FD - 1;
                          }
                        while(Gi_FD >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 2 : Cuenta ordenes SELL que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : SI ordenes SELL que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_FB == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                        Gd_FC = ACBA::MarketInfo(SimboloAuxiliar_2, MODE_BID);
                        Gd_FE = (SimboloAuxiliar2_STEP * ACBA::MarketInfo(SimboloAuxiliar_2, MODE_POINT));
                        Gd_FE = (Gd_FC - Gd_FE);
                        Gi_FF = NumeroMagico;
                        str_84 = SimboloAuxiliar_2;
                        Gd_100 = 0;
                        Gi_101 = 0;
                        Gi_102 = 0;
                        Gi_103 = ACBA::OrdersTotal() - 1;
                        Gi_104 = Gi_103;
                        if(Gi_103 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_104, 0, 0) && ACBA::OrderSymbol() == str_84 && ACBA::OrderMagicNumber() == Gi_FF && ACBA::OrderType() == OP_SELL)
                                {
                                 Gi_101 = ACBA::OrderTicket();
                                 if(Gi_101 > Gi_102)
                                   {
                                    Gi_102 = Gi_101;
                                    Gd_100 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_104 = Gi_104 - 1;
                             }
                           while(Gi_104 >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 2 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 2 : Si el (PrecioActual - SimboloAuxiliar2_STEP) >= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                        if((Gd_FE >= Gd_100))
                          {
                           //Abre nuevo Sell
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 1, LotajeSimboloAuxiliar_2, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                          }
                       }
                    }
                 }
              }

            // #################################################################################################################
            // #################################################################################################################
            // ################### GESTIONA NUEVAS ORDENES BUY y SELL EN SIMBOLO AUXILIAR 3 ####################################
            // #################################################################################################################
            // #################################################################################################################


            // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_85 = SimboloAuxiliar_3;
            Gi_103 = -1;
            Gi_105 = 0;
            Gi_106 = ACBA::OrdersTotal() - 1;
            Gi_107 = Gi_106;
            if(Gi_106 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_107, 0, 0) && ACBA::OrderSymbol() == str_85 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_106 = ACBA::OrderOpenTime();
                     if(Gl_106 >= ACBA::iTime(str_85, TimeFrame, 0))
                       {
                        if(Gi_103 == -1 || ACBA::OrderType() == Gi_103)
                          {
                           Gi_105 = Gi_105 + 1;
                          }
                       }
                    }
                  Gi_107 = Gi_107 - 1;
                 }
               while(Gi_107 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_105 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_86 = SimboloAuxiliar_3;
               Gi_106 = -1;
               Gi_108 = 0;
               Gi_109 = ACBA::OrdersHistoryTotal() - 1;
               Gi_10A = Gi_109;
               if(Gi_109 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_10A, 0, 1) && ACBA::OrderSymbol() == str_86 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_109 = ACBA::OrderOpenTime();
                        if(Gl_109 >= ACBA::iTime(str_86, TimeFrame, 0))
                          {
                           Gl_109 = ACBA::OrderCloseTime();
                           if(Gl_109 >= ACBA::iTime(str_86, TimeFrame, 0))
                             {
                              if(Gi_106 == -1 || ACBA::OrderType() == Gi_106)
                                {
                                 Gi_108 = Gi_108 + 1;
                                }
                             }
                          }
                       }
                     Gi_10A = Gi_10A - 1;
                    }
                  while(Gi_10A >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_108 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 3 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_109 = NumeroMagico;
                  str_87 = SimboloAuxiliar_3;
                  Gi_10B = 0;
                  NumeroOrdenesBuySimboloAuxiliar3 = 0;
                  Gi_10D = ACBA::OrdersTotal() - 1;
                  Gi_10E = Gi_10D;
                  if(Gi_10D >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_10E, 0, 0) && ACBA::OrderSymbol() == str_87 && Gi_109 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_10B == -1 || ACBA::OrderType() == Gi_10B)
                             {
                              NumeroOrdenesBuySimboloAuxiliar3 = NumeroOrdenesBuySimboloAuxiliar3 + 1;
                             }
                          }
                        Gi_10E = Gi_10E - 1;
                       }
                     while(Gi_10E >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 3 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesBuySimboloAuxiliar3 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_3, 0, LotajeSimboloAuxiliar_3) > 0) && CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 Cuenta ordenes BUY que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_10D = NumeroMagico;
                     str_88 = SimboloAuxiliar_3;
                     Gi_10F = 0;
                     Gi_110 = 0;
                     Gi_111 = ACBA::OrdersTotal() - 1;
                     Gi_112 = Gi_111;
                     if(Gi_111 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_112, 0, 0) && ACBA::OrderSymbol() == str_88 && Gi_10D == ACBA::OrderMagicNumber())
                             {
                              Gd_111 = ACBA::OrderProfit();
                              Gd_111 = (Gd_111 + ACBA::OrderSwap());
                              if(((Gd_111 + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_10F == -1 || ACBA::OrderType() == Gi_10F)
                                   {
                                    Gi_110 = Gi_110 + 1;
                                   }
                                }
                             }
                           Gi_112 = Gi_112 - 1;
                          }
                        while(Gi_112 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 3 Cuenta ordenes BUY que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3: SI ordenes BUY que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_110 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                        Gd_111 = ACBA::MarketInfo(SimboloAuxiliar_3, MODE_ASK);
                        Gd_111 = ((SimboloAuxiliar3_STEP * ACBA::MarketInfo(SimboloAuxiliar_3, MODE_POINT)) + Gd_111);
                        Gi_113 = NumeroMagico;
                        str_89 = SimboloAuxiliar_3;
                        Gd_114 = 0;
                        Gi_115 = 0;
                        Gi_116 = 0;
                        Gi_117 = ACBA::OrdersTotal() - 1;
                        Gi_118 = Gi_117;
                        if(Gi_117 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_118, 0, 0) && ACBA::OrderSymbol() == str_89 && ACBA::OrderMagicNumber() == Gi_113 && ACBA::OrderType() == OP_BUY)
                                {
                                 Gi_115 = ACBA::OrderTicket();
                                 if(Gi_115 > Gi_116)
                                   {
                                    Gi_116 = Gi_115;
                                    Gd_114 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_118 = Gi_118 - 1;
                             }
                           while(Gi_118 >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 3 : Si el (PrecioActual + SimboloAuxiliar3_STEP) <= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                        if((Gd_111 <= Gd_114))
                          {
                           //abre nuevo BUY
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 0, LotajeSimboloAuxiliar_3, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                          }
                       }
                    }
                 }
              }

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_8A = SimboloAuxiliar_3;
            Gi_117 = -1;
            Gi_119 = 0;
            Gi_11A = ACBA::OrdersTotal() - 1;
            Gi_11B = Gi_11A;
            if(Gi_11A >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_11B, 0, 0) && ACBA::OrderSymbol() == str_8A && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_11A = ACBA::OrderOpenTime();
                     if(Gl_11A >= ACBA::iTime(str_8A, TimeFrame, 0))
                       {
                        if(Gi_117 == -1 || ACBA::OrderType() == Gi_117)
                          {
                           Gi_119 = Gi_119 + 1;
                          }
                       }
                    }
                  Gi_11B = Gi_11B - 1;
                 }
               while(Gi_11B >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_119 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_8B = SimboloAuxiliar_3;
               Gi_11A = -1;
               Gi_11C = 0;
               Gi_11D = ACBA::OrdersHistoryTotal() - 1;
               Gi_11E = Gi_11D;
               if(Gi_11D >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_11E, 0, 1) && ACBA::OrderSymbol() == str_8B && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_11D = ACBA::OrderOpenTime();
                        if(Gl_11D >= ACBA::iTime(str_8B, TimeFrame, 0))
                          {
                           Gl_11D = ACBA::OrderCloseTime();
                           if(Gl_11D >= ACBA::iTime(str_8B, TimeFrame, 0))
                             {
                              if(Gi_11A == -1 || ACBA::OrderType() == Gi_11A)
                                {
                                 Gi_11C = Gi_11C + 1;
                                }
                             }
                          }
                       }
                     Gi_11E = Gi_11E - 1;
                    }
                  while(Gi_11E >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_11C == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 3 : Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_11D = NumeroMagico;
                  str_8C = SimboloAuxiliar_3;
                  Gi_11F = 1;
                  NumeroOrdenesSellSimboloAuxiliar3 = 0;
                  Gi_121 = ACBA::OrdersTotal() - 1;
                  Gi_122 = Gi_121;
                  if(Gi_121 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_122, 0, 0) && ACBA::OrderSymbol() == str_8C && Gi_11D == ACBA::OrderMagicNumber())
                          {
                           if(Gi_11F == -1 || ACBA::OrderType() == Gi_11F)
                             {
                              NumeroOrdenesSellSimboloAuxiliar3 = NumeroOrdenesSellSimboloAuxiliar3 + 1;
                             }
                          }
                        Gi_122 = Gi_122 - 1;
                       }
                     while(Gi_122 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 3 : Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesSellSimboloAuxiliar3 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_3, 1, LotajeSimboloAuxiliar_3) > 0) && CondicionPipsVelaSimboloAuxiliar_3_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : Cuenta ordenes SELL que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_121 = NumeroMagico;
                     str_8D = SimboloAuxiliar_3;
                     Gi_123 = 1;
                     Gi_124 = 0;
                     Gi_125 = ACBA::OrdersTotal() - 1;
                     Gi_126 = Gi_125;
                     if(Gi_125 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_126, 0, 0) && ACBA::OrderSymbol() == str_8D && Gi_121 == ACBA::OrderMagicNumber())
                             {
                              Gd_125 = ACBA::OrderProfit();
                              Gd_125 = (Gd_125 + ACBA::OrderSwap());
                              if(((Gd_125 + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_123 == -1 || ACBA::OrderType() == Gi_123)
                                   {
                                    Gi_124 = Gi_124 + 1;
                                   }
                                }
                             }
                           Gi_126 = Gi_126 - 1;
                          }
                        while(Gi_126 >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 3 : Cuenta ordenes SELL que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : SI ordenes SELL que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_124 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                        Gd_125 = ACBA::MarketInfo(SimboloAuxiliar_3, MODE_BID);
                        Gd_127 = (SimboloAuxiliar3_STEP * ACBA::MarketInfo(SimboloAuxiliar_3, MODE_POINT));
                        Gd_127 = (Gd_125 - Gd_127);
                        Gi_128 = NumeroMagico;
                        str_8E = SimboloAuxiliar_3;
                        Gd_129 = 0;
                        Gi_12A = 0;
                        Gi_12B = 0;
                        Gi_12C = ACBA::OrdersTotal() - 1;
                        Gi_12D = Gi_12C;
                        if(Gi_12C >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_12D, 0, 0) && ACBA::OrderSymbol() == str_8E && ACBA::OrderMagicNumber() == Gi_128 && ACBA::OrderType() == OP_SELL)
                                {
                                 Gi_12A = ACBA::OrderTicket();
                                 if(Gi_12A > Gi_12B)
                                   {
                                    Gi_12B = Gi_12A;
                                    Gd_129 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_12D = Gi_12D - 1;
                             }
                           while(Gi_12D >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 3 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 3 : Si el (PrecioActual - SimboloAuxiliar3_STEP) >= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                        if((Gd_127 >= Gd_129))
                          {
                           //abre nuevo SELL
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 1, LotajeSimboloAuxiliar_3, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                          }
                       }
                    }
                 }
              }

            // #################################################################################################################
            // #################################################################################################################
            // ################### GESTIONA NUEVAS ORDENES BUY y SELL EN SIMBOLO AUXILIAR 4 ####################################
            // #################################################################################################################
            // #################################################################################################################

            // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_8F = SimboloAuxiliar_4;
            Gi_12C = -1;
            Gi_12E = 0;
            Gi_12F = ACBA::OrdersTotal() - 1;
            Gi_130 = Gi_12F;
            if(Gi_12F >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_130, 0, 0) && ACBA::OrderSymbol() == str_8F && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_12F = ACBA::OrderOpenTime();
                     if(Gl_12F >= ACBA::iTime(str_8F, TimeFrame, 0))
                       {
                        if(Gi_12C == -1 || ACBA::OrderType() == Gi_12C)
                          {
                           Gi_12E = Gi_12E + 1;
                          }
                       }
                    }
                  Gi_130 = Gi_130 - 1;
                 }
               while(Gi_130 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_12E == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_90 = SimboloAuxiliar_4;
               Gi_12F = -1;
               Gi_131 = 0;
               Gi_132 = ACBA::OrdersHistoryTotal() - 1;
               Gi_133 = Gi_132;
               if(Gi_132 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_133, 0, 1) && ACBA::OrderSymbol() == str_90 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_132 = ACBA::OrderOpenTime();
                        if(Gl_132 >= ACBA::iTime(str_90, TimeFrame, 0))
                          {
                           Gl_132 = ACBA::OrderCloseTime();
                           if(Gl_132 >= ACBA::iTime(str_90, TimeFrame, 0))
                             {
                              if(Gi_12F == -1 || ACBA::OrderType() == Gi_12F)
                                {
                                 Gi_131 = Gi_131 + 1;
                                }
                             }
                          }
                       }
                     Gi_133 = Gi_133 - 1;
                    }
                  while(Gi_133 >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_131 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 4 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_132 = NumeroMagico;
                  str_91 = SimboloAuxiliar_4;
                  Gi_134 = 0;
                  NumeroOrdenesBuySimboloAuxiliar4 = 0;
                  Gi_136 = ACBA::OrdersTotal() - 1;
                  Gi_137 = Gi_136;
                  if(Gi_136 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_137, 0, 0) && ACBA::OrderSymbol() == str_91 && Gi_132 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_134 == -1 || ACBA::OrderType() == Gi_134)
                             {
                              NumeroOrdenesBuySimboloAuxiliar4 = NumeroOrdenesBuySimboloAuxiliar4 + 1;
                             }
                          }
                        Gi_137 = Gi_137 - 1;
                       }
                     while(Gi_137 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 4 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesBuySimboloAuxiliar4 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_4, 0, LotajeSimboloAuxiliar_4) > 0) && CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 Cuenta ordenes BUY que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_136 = NumeroMagico;
                     str_92 = SimboloAuxiliar_4;
                     Gi_138 = 0;
                     Gi_139 = 0;
                     Gi_13A = ACBA::OrdersTotal() - 1;
                     Gi_13B = Gi_13A;
                     if(Gi_13A >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_13B, 0, 0) && ACBA::OrderSymbol() == str_92 && Gi_136 == ACBA::OrderMagicNumber())
                             {
                              Gd_13A = ACBA::OrderProfit();
                              Gd_13A = (Gd_13A + ACBA::OrderSwap());
                              if(((Gd_13A + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_138 == -1 || ACBA::OrderType() == Gi_138)
                                   {
                                    Gi_139 = Gi_139 + 1;
                                   }
                                }
                             }
                           Gi_13B = Gi_13B - 1;
                          }
                        while(Gi_13B >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 4 Cuenta ordenes BUY que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4: SI ordenes BUY que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_139 == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                        Gd_13A = ACBA::MarketInfo(SimboloAuxiliar_4, MODE_ASK);
                        Gd_13A = ((SimboloAuxiliar4_STEP * ACBA::MarketInfo(SimboloAuxiliar_4, MODE_POINT)) + Gd_13A);
                        Gi_13C = NumeroMagico;
                        str_93 = SimboloAuxiliar_4;
                        Gd_13D = 0;
                        Gi_13E = 0;
                        Gi_13F = 0;
                        Gi_140 = ACBA::OrdersTotal() - 1;
                        Gi_141 = Gi_140;
                        if(Gi_140 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_141, 0, 0) && ACBA::OrderSymbol() == str_93 && ACBA::OrderMagicNumber() == Gi_13C && ACBA::OrderType() == OP_BUY)
                                {
                                 Gi_13E = ACBA::OrderTicket();
                                 if(Gi_13E > Gi_13F)
                                   {
                                    Gi_13F = Gi_13E;
                                    Gd_13D = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_141 = Gi_141 - 1;
                             }
                           while(Gi_141 >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 4 : Si el (PrecioAcutal + SimboloAuxiliar4_STEP) <= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                        if((Gd_13A <= Gd_13D))
                          {
                           //abre nuevo BUY
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 0, LotajeSimboloAuxiliar_4, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                          }
                       }
                    }
                 }
              }

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_94 = SimboloAuxiliar_4;
            Gi_140 = -1;
            Gi_142 = 0;
            Gi_143 = ACBA::OrdersTotal() - 1;
            Gi_144 = Gi_143;
            if(Gi_143 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_144, 0, 0) && ACBA::OrderSymbol() == str_94 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_143 = ACBA::OrderOpenTime();
                     if(Gl_143 >= ACBA::iTime(str_94, TimeFrame, 0))
                       {
                        if(Gi_140 == -1 || ACBA::OrderType() == Gi_140)
                          {
                           Gi_142 = Gi_142 + 1;
                          }
                       }
                    }
                  Gi_144 = Gi_144 - 1;
                 }
               while(Gi_144 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_142 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_95 = SimboloAuxiliar_4;
               Gi_143 = -1;
               Gi_145 = 0;
               Gi_146 = ACBA::OrdersHistoryTotal() - 1;
               Gi_147 = Gi_146;
               if(Gi_146 >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_147, 0, 1) && ACBA::OrderSymbol() == str_95 && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_146 = ACBA::OrderOpenTime();
                        if(Gl_146 >= ACBA::iTime(str_95, TimeFrame, 0))
                          {
                           Gl_146 = ACBA::OrderCloseTime();
                           if(Gl_146 >= ACBA::iTime(str_95, TimeFrame, 0))
                             {
                              if(Gi_143 == -1 || ACBA::OrderType() == Gi_143)
                                {
                                 Gi_145 = Gi_145 + 1;
                                }
                             }
                          }
                       }
                     Gi_147 = Gi_147 - 1;
                    }
                  while(Gi_147 >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_145 == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 4 : Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_146 = NumeroMagico;
                  str_96 = SimboloAuxiliar_4;
                  Gi_148 = 1;
                  NumeroOrdenesSellSimboloAuxiliar4 = 0;
                  Gi_14A = ACBA::OrdersTotal() - 1;
                  Gi_14B = Gi_14A;
                  if(Gi_14A >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_14B, 0, 0) && ACBA::OrderSymbol() == str_96 && Gi_146 == ACBA::OrderMagicNumber())
                          {
                           if(Gi_148 == -1 || ACBA::OrderType() == Gi_148)
                             {
                              NumeroOrdenesSellSimboloAuxiliar4 = NumeroOrdenesSellSimboloAuxiliar4 + 1;
                             }
                          }
                        Gi_14B = Gi_14B - 1;
                       }
                     while(Gi_14B >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 4 : Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(NumeroOrdenesSellSimboloAuxiliar4 > 0 && (ACBA::AccountFreeMarginCheck(SimboloAuxiliar_4, 1, LotajeSimboloAuxiliar_4) > 0) && CondicionPipsVelaSimboloAuxiliar_4_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : Cuenta ordenes SELL que están con BENEFICIO >>>>>>>>>>>>>>>
                     Gi_14A = NumeroMagico;
                     str_97 = SimboloAuxiliar_4;
                     Gi_14C = 1;
                     Gi_14D = 0;
                     Gi_14E = ACBA::OrdersTotal() - 1;
                     Gi_14F = Gi_14E;
                     if(Gi_14E >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_14F, 0, 0) && ACBA::OrderSymbol() == str_97 && Gi_14A == ACBA::OrderMagicNumber())
                             {
                              Gd_14E = ACBA::OrderProfit();
                              Gd_14E = (Gd_14E + ACBA::OrderSwap());
                              if(((Gd_14E + ACBA::OrderCommission()) > 0))
                                {
                                 if(Gi_14C == -1 || ACBA::OrderType() == Gi_14C)
                                   {
                                    Gi_14D = Gi_14D + 1;
                                   }
                                }
                             }
                           Gi_14F = Gi_14F - 1;
                          }
                        while(Gi_14F >= 0);
                       }
                     // <<<<<<<<<<<<<< FIN <<<<<<<<<< SIMBOLO AUXILIAR 4 : Cuenta ordenes SELL que están con BENEFICIO <<<<<<<<<<<<<<<<<<<<<<<<

                     // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : SI ordenes SELL que están con BENEFICIO = 0 entonces >>>>>>>>>>>>>>>
                     if(Gi_14D == 0)
                       {
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                        Gd_14E = ACBA::MarketInfo(SimboloAuxiliar_4, MODE_BID);
                        Gd_150 = (SimboloAuxiliar4_STEP * ACBA::MarketInfo(SimboloAuxiliar_4, MODE_POINT));
                        Gd_150 = (Gd_14E - Gd_150);
                        Gi_151 = NumeroMagico;
                        str_98 = SimboloAuxiliar_4;
                        Gd_152 = 0;
                        Gi_153 = 0;
                        Gi_154 = 0;
                        Gi_155 = ACBA::OrdersTotal() - 1;
                        Gi_156 = Gi_155;
                        if(Gi_155 >= 0)
                          {
                           do
                             {
                              if(ACBA::OrderSelect(Gi_156, 0, 0) && ACBA::OrderSymbol() == str_98 && ACBA::OrderMagicNumber() == Gi_151 && ACBA::OrderType() == OP_SELL)
                                {
                                 Gi_153 = ACBA::OrderTicket();
                                 if(Gi_153 > Gi_154)
                                   {
                                    Gi_154 = Gi_153;
                                    Gd_152 = ACBA::OrderOpenPrice();
                                   }
                                }
                              Gi_156 = Gi_156 - 1;
                             }
                           while(Gi_156 >= 0);
                          }
                        // >>>>>>>>>>>>> SIMBOLO AUXILIAR 4 : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>

                        // >>>>>>>>>> SIMBOLO AUXILIAR 4 : Si el (PrecioAcutal - SimboloAuxiliar4_STEP) >= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                        if((Gd_150 >= Gd_152))
                          {
                           //abre nueva SELL
                           OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 1, LotajeSimboloAuxiliar_4, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                          }
                       }
                    }
                 }
              }
           }


         // #################################################################################################################################################
         // #################################################################################################################################################
         // #################################################################################################################################################

         // ############################# Si el BOTON TRADEs_REJILLA_MAS está en ON #############################
         if(ACBA::ObjectGetInteger(0, "TRADEs_REJILLA_MAS", OBJPROP_STATE, 0) == 0)
           {
            // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_99 = SimboloPrincipal;
            Gi_155 = -1;
            Gi_157 = 0;
            Gi_158 = ACBA::OrdersTotal() - 1;
            Gi_159 = Gi_158;
            if(Gi_158 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_159, 0, 0) && ACBA::OrderSymbol() == str_99 && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_158 = ACBA::OrderOpenTime();
                     if(Gl_158 >= ACBA::iTime(str_99, TimeFrame, 0))
                       {
                        if(Gi_155 == -1 || ACBA::OrderType() == Gi_155)
                          {
                           Gi_157 = Gi_157 + 1;
                          }
                       }
                    }
                  Gi_159 = Gi_159 - 1;
                 }
               while(Gi_159 >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_157 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_9A = SimboloPrincipal;
               Gi_158 = -1;
               Gi_15A = 0;
               Gi_15B = ACBA::OrdersHistoryTotal() - 1;
               Gi_15C = Gi_15B;
               if(Gi_15B >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_15C, 0, 1) && ACBA::OrderSymbol() == str_9A && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_15B = ACBA::OrderOpenTime();
                        if(Gl_15B >= ACBA::iTime(str_9A, TimeFrame, 0))
                          {
                           Gl_15B = ACBA::OrderCloseTime();
                           if(Gl_15B >= ACBA::iTime(str_9A, TimeFrame, 0))
                             {
                              if(Gi_158 == -1 || ACBA::OrderType() == Gi_158)
                                {
                                 Gi_15A = Gi_15A + 1;
                                }
                             }
                          }
                       }
                     Gi_15C = Gi_15C - 1;
                    }
                  while(Gi_15C >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_15A == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_15B = NumeroMagico;
                  str_9B = SimboloPrincipal;
                  Gi_15D = 0;
                  Gi_15E = 0;
                  Gi_15F = ACBA::OrdersTotal() - 1;
                  Gi_160 = Gi_15F;
                  if(Gi_15F >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_160, 0, 0) && ACBA::OrderSymbol() == str_9B && Gi_15B == ACBA::OrderMagicNumber())
                          {
                           if(Gi_15D == -1 || ACBA::OrderType() == Gi_15D)
                             {
                              Gi_15E = Gi_15E + 1;
                             }
                          }
                        Gi_160 = Gi_160 - 1;
                       }
                     while(Gi_160 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO PRINCIPAL Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(Gi_15E > 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 0, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3V2R)
                    {
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>
                     Gd_15F = ACBA::MarketInfo(SimboloPrincipal, MODE_ASK);
                     Gd_161 = (pXAUUSD_Step * ACBA::MarketInfo(SimboloPrincipal, MODE_POINT));
                     Gd_161 = (Gd_15F - Gd_161);
                     Gi_162 = NumeroMagico;
                     str_9C = SimboloPrincipal;
                     Gd_163 = 0;
                     Gi_164 = 0;
                     Gi_165 = 0;
                     Gi_166 = ACBA::OrdersTotal() - 1;
                     Gi_167 = Gi_166;
                     if(Gi_166 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_167, 0, 0) && ACBA::OrderSymbol() == str_9C && ACBA::OrderMagicNumber() == Gi_162 && ACBA::OrderType() == OP_BUY)
                             {
                              Gi_164 = ACBA::OrderTicket();
                              if(Gi_164 > Gi_165)
                                {
                                 Gi_165 = Gi_164;
                                 Gd_163 = ACBA::OrderOpenPrice();
                                }
                             }
                           Gi_167 = Gi_167 - 1;
                          }
                        while(Gi_167 >= 0);
                       }
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL : Busca el precio de apertura del ULTIMO BUY abierto >>>>>>>>>>>>>>>

                     // >>>>>>>>>> SIMBOLO PRINCIPAL : Si el (PrecioActual - pXAUUSD_Step) >= Precio apertura Ultimo BUY -->> Entonces ABRE NUEVO BUY >>>>>>>>>>>>>>>
                     if((Gd_161 >= Gd_163))
                       {
                        //ABRE NUEVO BUY
                        OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
                       }
                    }
                 }
              }

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
            str_9D = SimboloPrincipal;
            Gi_166 = -1;
            Gi_168 = 0;
            Gi_169 = ACBA::OrdersTotal() - 1;
            Gi_16A = Gi_169;
            if(Gi_169 >= 0)
              {
               do
                 {
                  if(ACBA::OrderSelect(Gi_16A, 0, 0) && ACBA::OrderSymbol() == str_9D && ACBA::OrderMagicNumber() == NumeroMagico)
                    {
                     Gl_169 = ACBA::OrderOpenTime();
                     if(Gl_169 >= ACBA::iTime(str_9D, TimeFrame, 0))
                       {
                        if(Gi_166 == -1 || ACBA::OrderType() == Gi_166)
                          {
                           Gi_168 = Gi_168 + 1;
                          }
                       }
                    }
                  Gi_16A = Gi_16A - 1;
                 }
               while(Gi_16A >= 0);
              }
            // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

            // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS EN LA VELA ACTUAL = 0 entonces >>>>>>>>>>>>>>>>
            if(Gi_168 == 0)
              {
               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL >>>>>>>>>>>>>>>>
               str_9E = SimboloPrincipal;
               Gi_169 = -1;
               Gi_16B = 0;
               Gi_16C = ACBA::OrdersHistoryTotal() - 1;
               Gi_16D = Gi_16C;
               if(Gi_16C >= 0)
                 {
                  do
                    {
                     if(ACBA::OrderSelect(Gi_16D, 0, 1) && ACBA::OrderSymbol() == str_9E && ACBA::OrderMagicNumber() == NumeroMagico)
                       {
                        Gl_16C = ACBA::OrderOpenTime();
                        if(Gl_16C >= ACBA::iTime(str_9E, TimeFrame, 0))
                          {
                           Gl_16C = ACBA::OrderCloseTime();
                           if(Gl_16C >= ACBA::iTime(str_9E, TimeFrame, 0))
                             {
                              if(Gi_169 == -1 || ACBA::OrderType() == Gi_169)
                                {
                                 Gi_16B = Gi_16B + 1;
                                }
                             }
                          }
                       }
                     Gi_16D = Gi_16D - 1;
                    }
                  while(Gi_16D >= 0);
                 }
               // <<<<<<<<<<<<<<<<<<<<<<<< FIN <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA en el histórico ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL <<<<<<<<<<<<<<<<<<<<<<<<

               // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS y CERRADAS EN LA VELA ACTUAL = 0 entonces: >>>>>>>>>>>>>>>>
               if(Gi_16B == 0)
                 {
                  // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL : Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
                  Gi_16C = NumeroMagico;
                  str_9F = SimboloPrincipal;
                  Gi_16E = 1;
                  Gi_16F = 0;
                  Gi_170 = ACBA::OrdersTotal() - 1;
                  Gi_171 = Gi_170;
                  if(Gi_170 >= 0)
                    {
                     do
                       {
                        if(ACBA::OrderSelect(Gi_171, 0, 0) && ACBA::OrderSymbol() == str_9F && Gi_16C == ACBA::OrderMagicNumber())
                          {
                           if(Gi_16E == -1 || ACBA::OrderType() == Gi_16E)
                             {

                              Gi_16F = Gi_16F + 1;
                             }
                          }
                        Gi_171 = Gi_171 - 1;
                       }
                     while(Gi_171 >= 0);
                    }
                  // <<<<<<<<<<FIN<<<<<<<<<<<<<<  SIMBOLO PRINCIPAL : Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

                  if(Gi_16F > 0 && (ACBA::AccountFreeMarginCheck(SimboloPrincipal, 1, LotajeSimboloPrincipal) > 0) && CondicionPipsVelaSimboloPrincipal_MAYOR_RestoSimbolos3R2V)
                    {
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>
                     Gd_170 = ACBA::MarketInfo(SimboloPrincipal, MODE_BID);
                     Gd_170 = ((pXAUUSD_Step * ACBA::MarketInfo(SimboloPrincipal, MODE_POINT)) + Gd_170);
                     Gi_172 = NumeroMagico;
                     str_A0 = SimboloPrincipal;
                     Gd_173 = 0;
                     Gi_174 = 0;
                     Gi_175 = 0;
                     Gi_176 = ACBA::OrdersTotal() - 1;
                     Gi_177 = Gi_176;
                     if(Gi_176 >= 0)
                       {
                        do
                          {
                           if(ACBA::OrderSelect(Gi_177, 0, 0) && ACBA::OrderSymbol() == str_A0 && ACBA::OrderMagicNumber() == Gi_172 && ACBA::OrderType() == OP_SELL)
                             {
                              Gi_174 = ACBA::OrderTicket();
                              if(Gi_174 > Gi_175)
                                {
                                 Gi_175 = Gi_174;
                                 Gd_173 = ACBA::OrderOpenPrice();
                                }
                             }
                           Gi_177 = Gi_177 - 1;
                          }
                        while(Gi_177 >= 0);
                       }
                     // >>>>>>>>>>>>> SIMBOLO PRINCIPAL : Busca el precio de apertura del ULTIMO SELL abierto >>>>>>>>>>>>>>>

                     // >>>>>>>>>> SIMBOLO PRINCIPAL : Si el (PrecioActUal + pXAUUSD_Step) <= Precio apertura Ultimo SELL -->> Entonces ABRE NUEVO SELL >>>>>>>>>>>>>>>
                     if((Gd_170 <= Gd_173))
                       {
                        //ABRE NUEVO SELL
                        OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
                       }
                    }
                 }
              }
           }
         // ########################################################## FIN  TRADEs_REJILLA_MAS  ON ##########################################################
        }
     }

// ##############################################################################################################################################################################
// ##############################################################################################################################################################################
// ##############################################################################################################################################################################
// ##############################################################################################################################################################################

// ############################################################################################
// ########### SIMBOLO PRINCIPAL --> ESTE TROZO DE CÓDIGO NO TIENE NINGUNA FUNCIONALIDAD ######
// ############################################################################################
   Li_A0 = 0;
   Li_9C = 0;
   Li_98 = 0;
   Li_94 = 0;
   Li_90 = 0;
   Gi_176 = NumeroMagico;
   str_A1 = SimboloPrincipal;
   Gi_178 = -1;
   Gi_179 = 0;
   Gi_17A = ACBA::OrdersTotal() - 1;
   Gi_17B = Gi_17A;
   if(Gi_17A >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_17B, 0, 0) && ACBA::OrderSymbol() == str_A1 && Gi_176 == ACBA::OrderMagicNumber())
           {
            if(Gi_178 == -1 || ACBA::OrderType() == Gi_178)
              {
               Gi_179 = Gi_179 + 1;
              }
           }
         Gi_17B = Gi_17B - 1;
        }
      while(Gi_17B >= 0);
     }
   if(Gi_179 > 0)
     {
      Li_A0 = 1;
     }

// ############################################################################################
// ########### SIMBOLO AUXILIAR 1 --> ESTE TROZO DE CÓDIGO NO TIENE NINGUNA FUNCIONALIDAD ######
// ############################################################################################
   Gi_17A = NumeroMagico;
   str_A2 = SimboloAuxiliar_1;
   Gi_17C = -1;
   Gi_17D = 0;
   Gi_17E = ACBA::OrdersTotal() - 1;
   Gi_17F = Gi_17E;
   if(Gi_17E >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_17F, 0, 0) && ACBA::OrderSymbol() == str_A2 && Gi_17A == ACBA::OrderMagicNumber())
           {
            if(Gi_17C == -1 || ACBA::OrderType() == Gi_17C)
              {
               Gi_17D = Gi_17D + 1;
              }
           }
         Gi_17F = Gi_17F - 1;
        }
      while(Gi_17F >= 0);
     }
   if(Gi_17D > 0)
     {
      Li_9C = 1;
     }

// ############################################################################################
// ########### SIMBOLO AUXILIAR 2 --> ESTE TROZO DE CÓDIGO NO TIENE NINGUNA FUNCIONALIDAD ######
// ############################################################################################
   Gi_17E = NumeroMagico;
   str_A3 = SimboloAuxiliar_2;
   Gi_180 = -1;
   Gi_181 = 0;
   Gi_182 = ACBA::OrdersTotal() - 1;
   Gi_183 = Gi_182;
   if(Gi_182 >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_183, 0, 0) && ACBA::OrderSymbol() == str_A3 && Gi_17E == ACBA::OrderMagicNumber())
           {
            if(Gi_180 == -1 || ACBA::OrderType() == Gi_180)
              {
               Gi_181 = Gi_181 + 1;
              }
           }
         Gi_183 = Gi_183 - 1;
        }
      while(Gi_183 >= 0);
     }
   if(Gi_181 > 0)
     {
      Li_98 = 1;
     }

// ############################################################################################
// ########### SIMBOLO AUXILIAR 3 --> ESTE TROZO DE CÓDIGO NO TIENE NINGUNA FUNCIONALIDAD ######
// ############################################################################################
   Gi_182 = NumeroMagico;
   str_A4 = SimboloAuxiliar_3;
   Gi_184 = -1;
   Gi_185 = 0;
   Gi_186 = ACBA::OrdersTotal() - 1;
   Gi_187 = Gi_186;
   if(Gi_186 >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_187, 0, 0) && ACBA::OrderSymbol() == str_A4 && Gi_182 == ACBA::OrderMagicNumber())
           {
            if(Gi_184 == -1 || ACBA::OrderType() == Gi_184)
              {
               Gi_185 = Gi_185 + 1;
              }
           }
         Gi_187 = Gi_187 - 1;
        }
      while(Gi_187 >= 0);
     }
   if(Gi_185 > 0)
     {
      Li_94 = 1;
     }

// ############################################################################################
// ########### SIMBOLO AUXILIAR 4 --> ESTE TROZO DE CÓDIGO NO TIENE NINGUNA FUNCIONALIDAD ######
// ############################################################################################
   Gi_186 = NumeroMagico;
   str_A5 = SimboloAuxiliar_4;
   Gi_188 = -1;
   Gi_189 = 0;
   Gi_18A = ACBA::OrdersTotal() - 1;
   Gi_18B = Gi_18A;
   if(Gi_18A >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_18B, 0, 0) && ACBA::OrderSymbol() == str_A5 && Gi_186 == ACBA::OrderMagicNumber())
           {
            if(Gi_188 == -1 || ACBA::OrderType() == Gi_188)
              {
               Gi_189 = Gi_189 + 1;
              }
           }
         Gi_18B = Gi_18B - 1;
        }
      while(Gi_18B >= 0);
     }
   if(Gi_189 > 0)
     {
      Li_90 = 1;
     }

// ####################### BOTON AUTOTRADE está en ON (por defecto) ###########################
   if(ACBA::ObjectGetInteger(0, "TRADEs_AUTOTRADE", OBJPROP_STATE, 0) == 0)
     {
      // >>>>>>>>>>>>> OBTIENE EL LOTAJE TOTAL DE TODAS LAS ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_18A = -1;
      LotajeTotalOrdenesAbiertas = 0;
      Gi_18D = ACBA::OrdersTotal() - 1;
      Gi_18E = Gi_18D;
      if(Gi_18D >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_18E, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(ACBA::OrderType() == Gi_18A || Gi_18A == -1)
                 {
                  LotajeTotalOrdenesAbiertas = (LotajeTotalOrdenesAbiertas + ACBA::OrderLots());
                 }
              }
            Gi_18E = Gi_18E - 1;
           }
         while(Gi_18E >= 0);
        }
      // <<<<<<<<<<<<<<<<<<FIN<<<<<<<<<<<<<<<<<< OBTIENE EL LOTAJE TOTAL DE TODAS LAS ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<

      Ld_88 = (LotajeTotalOrdenesAbiertas * ProfitPips);

      // >>>>>>>>>>>>> OBTIENE EL BENEFICIO TOTAL DE TODAS LAS ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_18D = -1;
      BeneficioTotalOrdenesAbiertas = 0;
      Gi_190 = ACBA::OrdersTotal() - 1;
      Gi_191 = Gi_190;
      if(Gi_190 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_191, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(ACBA::OrderType() == Gi_18D || Gi_18D == -1)
                 {
                  Gd_190 = ACBA::OrderProfit();
                  Gd_190 = (Gd_190 + ACBA::OrderSwap());
                  BeneficioTotalOrdenesAbiertas = ((Gd_190 + ACBA::OrderCommission()) + BeneficioTotalOrdenesAbiertas);
                 }
              }
            Gi_191 = Gi_191 - 1;
           }
         while(Gi_191 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<FIN<<<<<<<<<<<<<<<<<< OBTIENE EL BENEFICIO TOTAL DE TODAS LAS ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>> si se cumplen las condiciones de beneficio --> CIERRA TODO >>>>>>>>>>>>>
      if((BeneficioTotalOrdenesAbiertas >= Ld_88) && (Ld_88 != 0))
        {
         Gi_190 = ACBA::OrdersTotal() - 1;
         Gi_192 = Gi_190;
         if(Gi_190 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_192, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     str_A6 = ACBA::OrderSymbol();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A6, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     str_A7 = ACBA::OrderSymbol();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A7, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_192 = Gi_192 - 1;
              }
            while(Gi_192 >= 0);
           }
         ACBA::ObjectsDeleteAll(NULL, 22);
         ACBA::ObjectsDeleteAll(NULL, 2);
        }
      // <<<<<<<<<<<<<<<<<< si se cumplen las condiciones de beneficio --> CIERRA TODO <<<<<<<<<<<<<<<<<<
     }
// ######### FIN ########## BOTON AUTOTRADE está en ON (por defecto) ###########################


   if(ACBA::ObjectGetInteger(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_STATE, 0) != 0)
     {
      // >>>>>>>>>>>>>>>>>> Si se cumplen condiciones de cierre por HORARIO >>>>>>>>>>>>>>>>>>
      if((Id_130 == 0) && (ACBA::TimeHour(TimeCurrent()) == HoraFinOperativa))
        {

         // ##################################################################################
         // ###### SIMBOLO PRINCIPAL: CIERRE ORDENES POR HORA FIN ############################
         // ##################################################################################
         str_A8 = SimboloPrincipal;
         Gi_196 = ACBA::OrdersTotal() - 1;
         Gi_197 = Gi_196;
         if(Gi_196 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_197, 0, 0) && ACBA::OrderSymbol() == str_A8 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gd_196 = ACBA::OrderProfit();
                  Gd_196 = (Gd_196 + ACBA::OrderCommission());
                  if(((Gd_196 + ACBA::OrderSwap()) > 0))
                    {
                     if(ACBA::OrderType() == OP_BUY)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A8, MODE_BID), _Digits), 10, 16777215);
                       }
                     if(ACBA::OrderType() == OP_SELL)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A8, MODE_ASK), _Digits), 10, 16777215);
                       }
                    }
                 }
               Gi_197 = Gi_197 - 1;
              }
            while(Gi_197 >= 0);
           }

         // ##################################################################################
         // ###### SIMBOLO AUXILIAR 1: CIERRE ORDENES POR HORA FIN ###########################
         // ##################################################################################
         str_A9 = SimboloAuxiliar_1;
         Gi_19B = ACBA::OrdersTotal() - 1;
         Gi_19C = Gi_19B;
         if(Gi_19B >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_19C, 0, 0) && ACBA::OrderSymbol() == str_A9 && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gd_19B = ACBA::OrderProfit();
                  Gd_19B = (Gd_19B + ACBA::OrderCommission());
                  if(((Gd_19B + ACBA::OrderSwap()) > 0))
                    {
                     if(ACBA::OrderType() == OP_BUY)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A9, MODE_BID), _Digits), 10, 16777215);
                       }
                     if(ACBA::OrderType() == OP_SELL)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_A9, MODE_ASK), _Digits), 10, 16777215);
                       }
                    }
                 }
               Gi_19C = Gi_19C - 1;
              }
            while(Gi_19C >= 0);
           }

         // ##################################################################################
         // ###### SIMBOLO AUXILIAR 2: CIERRE ORDENES POR HORA FIN ###########################
         // ##################################################################################
         str_AA = SimboloAuxiliar_2;
         Gi_1A0 = ACBA::OrdersTotal() - 1;
         Gi_1A1 = Gi_1A0;
         if(Gi_1A0 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1A1, 0, 0) && ACBA::OrderSymbol() == str_AA && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gd_1A0 = ACBA::OrderProfit();
                  Gd_1A0 = (Gd_1A0 + ACBA::OrderCommission());
                  if(((Gd_1A0 + ACBA::OrderSwap()) > 0))
                    {
                     if(ACBA::OrderType() == OP_BUY)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AA, MODE_BID), _Digits), 10, 16777215);
                       }
                     if(ACBA::OrderType() == OP_SELL)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AA, MODE_ASK), _Digits), 10, 16777215);
                       }
                    }
                 }
               Gi_1A1 = Gi_1A1 - 1;
              }
            while(Gi_1A1 >= 0);
           }

         // ##################################################################################
         // ###### SIMBOLO AUXILIAR 3: CIERRE ORDENES POR HORA FIN ###########################
         // ##################################################################################
         str_AB = SimboloAuxiliar_3;
         Gi_1A5 = ACBA::OrdersTotal() - 1;
         Gi_1A6 = Gi_1A5;
         if(Gi_1A5 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1A6, 0, 0) && ACBA::OrderSymbol() == str_AB && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gd_1A5 = ACBA::OrderProfit();
                  Gd_1A5 = (Gd_1A5 + ACBA::OrderCommission());
                  if(((Gd_1A5 + ACBA::OrderSwap()) > 0))
                    {
                     if(ACBA::OrderType() == OP_BUY)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AB, MODE_BID), _Digits), 10, 16777215);
                       }
                     if(ACBA::OrderType() == OP_SELL)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AB, MODE_ASK), _Digits), 10, 16777215);
                       }
                    }
                 }
               Gi_1A6 = Gi_1A6 - 1;
              }
            while(Gi_1A6 >= 0);
           }

         // ##################################################################################
         // ###### SIMBOLO AUXILIAR 4: CIERRE ORDENES POR HORA FIN ###########################
         // ##################################################################################
         str_AC = SimboloAuxiliar_4;
         Gi_1AA = ACBA::OrdersTotal() - 1;
         Gi_1AB = Gi_1AA;
         if(Gi_1AA >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1AB, 0, 0) && ACBA::OrderSymbol() == str_AC && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gd_1AA = ACBA::OrderProfit();
                  Gd_1AA = (Gd_1AA + ACBA::OrderCommission());
                  if(((Gd_1AA + ACBA::OrderSwap()) > 0))
                    {
                     if(ACBA::OrderType() == OP_BUY)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AC, MODE_BID), _Digits), 10, 16777215);
                       }
                     if(ACBA::OrderType() == OP_SELL)
                       {
                        ACBA::RefreshRates();
                        OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_AC, MODE_ASK), _Digits), 10, 16777215);
                       }
                    }
                 }
               Gi_1AB = Gi_1AB - 1;
              }
            while(Gi_1AB >= 0);
           }
         Id_130 = 1;
        }
      if((Id_130 == 1) && (ACBA::TimeHour(TimeCurrent()) >= HoraInicioOperativa) && (ACBA::TimeHour(TimeCurrent()) < HoraFinOperativa))
        {
         Id_130 = 0;
        }
     }

// ################################ boton TRADEs_TRADING_MOBILE en ON ################################
   if(ACBA::ObjectGetInteger(0, "TRADEs_TRADING_MOBILE", OBJPROP_STATE, 0) != 0)
     {
      // #########################################################
      // ################### SIMBOLO PRINCIPAL ###################
      // #########################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1AF = NumeroMagico;
      str_AD = SimboloPrincipal;
      Gi_1B0 = -1;
      Gi_1B1 = 0;
      Gi_1B2 = ACBA::OrdersTotal() - 1;
      Gi_1B3 = Gi_1B2;
      if(Gi_1B2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1B3, 0, 0) && ACBA::OrderSymbol() == str_AD && Gi_1AF == ACBA::OrderMagicNumber())
              {
               if(Gi_1B0 == -1 || ACBA::OrderType() == Gi_1B0)
                 {
                  Gi_1B1 = Gi_1B1 + 1;
                 }
              }
            Gi_1B3 = Gi_1B3 - 1;
           }
         while(Gi_1B3 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1B1 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1B2 = 0;
         str_AE = SimboloPrincipal;
         Gi_1B4 = 0;
         Gi_1B5 = 0;
         Gi_1B6 = ACBA::OrdersTotal() - 1;
         Gi_1B7 = Gi_1B6;
         if(Gi_1B6 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1B7, 0, 0) && ACBA::OrderSymbol() == str_AE && Gi_1B2 == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1B4 == -1 || ACBA::OrderType() == Gi_1B4)
                    {
                     Gi_1B5 = Gi_1B5 + 1;
                    }
                 }
               Gi_1B7 = Gi_1B7 - 1;
              }
            while(Gi_1B7 >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO PRINCIPAL Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES BUY ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1B5 > 0)
           {
            //NUEVA ORDEN BUY
            OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }


      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1B6 = NumeroMagico;
      str_AF = SimboloPrincipal;
      Gi_1B8 = -1;
      Gi_1B9 = 0;
      Gi_1BA = ACBA::OrdersTotal() - 1;
      Gi_1BB = Gi_1BA;
      if(Gi_1BA >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1BB, 0, 0) && ACBA::OrderSymbol() == str_AF && Gi_1B6 == ACBA::OrderMagicNumber())
              {
               if(Gi_1B8 == -1 || ACBA::OrderType() == Gi_1B8)
                 {
                  Gi_1B9 = Gi_1B9 + 1;
                 }
              }
            Gi_1BB = Gi_1BB - 1;
           }
         while(Gi_1BB >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO PRINCIPAL - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO PRINCIPAL - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1B9 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO PRINCIPAL Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1BA = 0;
         str_B0 = SimboloPrincipal;
         Gi_1BC = 1;
         Gi_1BD = 0;
         Gi_1BE = ACBA::OrdersTotal() - 1;
         Gi_1BF = Gi_1BE;
         if(Gi_1BE >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1BF, 0, 0) && ACBA::OrderSymbol() == str_B0 && Gi_1BA == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1BC == -1 || ACBA::OrderType() == Gi_1BC)
                    {
                     Gi_1BD = Gi_1BD + 1;
                    }
                 }
               Gi_1BF = Gi_1BF - 1;
              }
            while(Gi_1BF >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO PRINCIPAL Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES SELL ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1BD > 0)
           {
            //ABRE NUEVO SELL
            OrdenEnviada = ACBA::OrderSend(SimboloPrincipal, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloPrincipal, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 1 ##################
      // #########################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1BE = NumeroMagico;
      str_B1 = SimboloAuxiliar_1;
      Gi_1C0 = -1;
      Gi_1C1 = 0;
      Gi_1C2 = ACBA::OrdersTotal() - 1;
      Gi_1C3 = Gi_1C2;
      if(Gi_1C2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1C3, 0, 0) && ACBA::OrderSymbol() == str_B1 && Gi_1BE == ACBA::OrderMagicNumber())
              {
               if(Gi_1C0 == -1 || ACBA::OrderType() == Gi_1C0)
                 {
                  Gi_1C1 = Gi_1C1 + 1;
                 }
              }
            Gi_1C3 = Gi_1C3 - 1;
           }
         while(Gi_1C3 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1C1 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 1 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1C2 = 0;
         str_B2 = SimboloAuxiliar_1;
         Gi_1C4 = 0;
         Gi_1C5 = 0;
         Gi_1C6 = ACBA::OrdersTotal() - 1;
         Gi_1C7 = Gi_1C6;
         if(Gi_1C6 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1C7, 0, 0) && ACBA::OrderSymbol() == str_B2 && Gi_1C2 == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1C4 == -1 || ACBA::OrderType() == Gi_1C4)
                    {
                     Gi_1C5 = Gi_1C5 + 1;
                    }
                 }
               Gi_1C7 = Gi_1C7 - 1;
              }
            while(Gi_1C7 >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 1 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES BUY ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1C5 > 0)
           {
            //NUEVA ORDEN BUY
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1C6 = NumeroMagico;
      str_B3 = SimboloAuxiliar_1;
      Gi_1C8 = -1;
      Gi_1C9 = 0;
      Gi_1CA = ACBA::OrdersTotal() - 1;
      Gi_1CB = Gi_1CA;
      if(Gi_1CA >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1CB, 0, 0) && ACBA::OrderSymbol() == str_B3 && Gi_1C6 == ACBA::OrderMagicNumber())
              {
               if(Gi_1C8 == -1 || ACBA::OrderType() == Gi_1C8)
                 {
                  Gi_1C9 = Gi_1C9 + 1;
                 }
              }
            Gi_1CB = Gi_1CB - 1;
           }
         while(Gi_1CB >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 1 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 1 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1C9 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 1 Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1CA = 0;
         str_B4 = SimboloAuxiliar_1;
         Gi_1CC = 1;
         Gi_1CD = 0;
         Gi_1CE = ACBA::OrdersTotal() - 1;
         Gi_1CF = Gi_1CE;
         if(Gi_1CE >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1CF, 0, 0) && ACBA::OrderSymbol() == str_B4 && Gi_1CA == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1CC == -1 || ACBA::OrderType() == Gi_1CC)
                    {
                     Gi_1CD = Gi_1CD + 1;
                    }
                 }
               Gi_1CF = Gi_1CF - 1;
              }
            while(Gi_1CF >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 1 Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES SELL ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1CD > 0)
           {
            //ABRE NUEVO SELL
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_1, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_1, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 2 ##################
      // #########################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1CE = NumeroMagico;
      str_B5 = SimboloAuxiliar_2;
      Gi_1D0 = -1;
      Gi_1D1 = 0;
      Gi_1D2 = ACBA::OrdersTotal() - 1;
      Gi_1D3 = Gi_1D2;
      if(Gi_1D2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1D3, 0, 0) && ACBA::OrderSymbol() == str_B5 && Gi_1CE == ACBA::OrderMagicNumber())
              {
               if(Gi_1D0 == -1 || ACBA::OrderType() == Gi_1D0)
                 {
                  Gi_1D1 = Gi_1D1 + 1;
                 }
              }
            Gi_1D3 = Gi_1D3 - 1;
           }
         while(Gi_1D3 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1D1 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 2 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1D2 = 0;
         str_B6 = SimboloAuxiliar_2;
         Gi_1D4 = 0;
         Gi_1D5 = 0;
         Gi_1D6 = ACBA::OrdersTotal() - 1;
         Gi_1D7 = Gi_1D6;
         if(Gi_1D6 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1D7, 0, 0) && ACBA::OrderSymbol() == str_B6 && Gi_1D2 == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1D4 == -1 || ACBA::OrderType() == Gi_1D4)
                    {
                     Gi_1D5 = Gi_1D5 + 1;
                    }
                 }
               Gi_1D7 = Gi_1D7 - 1;
              }
            while(Gi_1D7 >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 2 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES BUY ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1D5 > 0)
           {
            //NUEVA ORDEN BUY
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1D6 = NumeroMagico;
      str_B7 = SimboloAuxiliar_2;
      Gi_1D8 = -1;
      Gi_1D9 = 0;
      Gi_1DA = ACBA::OrdersTotal() - 1;
      Gi_1DB = Gi_1DA;
      if(Gi_1DA >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1DB, 0, 0) && ACBA::OrderSymbol() == str_B7 && Gi_1D6 == ACBA::OrderMagicNumber())
              {
               if(Gi_1D8 == -1 || ACBA::OrderType() == Gi_1D8)
                 {
                  Gi_1D9 = Gi_1D9 + 1;
                 }
              }
            Gi_1DB = Gi_1DB - 1;
           }
         while(Gi_1DB >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 2 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 2 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1D9 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 2 Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1DA = 0;
         str_B8 = SimboloAuxiliar_2;
         Gi_1DC = 1;
         Gi_1DD = 0;
         Gi_1DE = ACBA::OrdersTotal() - 1;
         Gi_1DF = Gi_1DE;
         if(Gi_1DE >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1DF, 0, 0) && ACBA::OrderSymbol() == str_B8 && Gi_1DA == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1DC == -1 || ACBA::OrderType() == Gi_1DC)
                    {
                     Gi_1DD = Gi_1DD + 1;
                    }
                 }
               Gi_1DF = Gi_1DF - 1;
              }
            while(Gi_1DF >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 2 Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES SELL ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1DD > 0)
           {
            //ABRE NUEVO SELL
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_2, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_2, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 3 ##################
      // #########################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1DE = NumeroMagico;
      str_B9 = SimboloAuxiliar_3;
      Gi_1E0 = -1;
      Gi_1E1 = 0;
      Gi_1E2 = ACBA::OrdersTotal() - 1;
      Gi_1E3 = Gi_1E2;
      if(Gi_1E2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1E3, 0, 0) && ACBA::OrderSymbol() == str_B9 && Gi_1DE == ACBA::OrderMagicNumber())
              {
               if(Gi_1E0 == -1 || ACBA::OrderType() == Gi_1E0)
                 {
                  Gi_1E1 = Gi_1E1 + 1;
                 }
              }
            Gi_1E3 = Gi_1E3 - 1;
           }
         while(Gi_1E3 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1E1 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 3 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1E2 = 0;
         str_BA = SimboloAuxiliar_3;
         Gi_1E4 = 0;
         Gi_1E5 = 0;
         Gi_1E6 = ACBA::OrdersTotal() - 1;
         Gi_1E7 = Gi_1E6;
         if(Gi_1E6 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1E7, 0, 0) && ACBA::OrderSymbol() == str_BA && Gi_1E2 == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1E4 == -1 || ACBA::OrderType() == Gi_1E4)
                    {
                     Gi_1E5 = Gi_1E5 + 1;
                    }
                 }
               Gi_1E7 = Gi_1E7 - 1;
              }
            while(Gi_1E7 >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 3 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES BUY ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1E5 > 0)
           {
            //NUEVA ORDEN BUY
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1E6 = NumeroMagico;
      str_BB = SimboloAuxiliar_3;
      Gi_1E8 = -1;
      Gi_1E9 = 0;
      Gi_1EA = ACBA::OrdersTotal() - 1;
      Gi_1EB = Gi_1EA;
      if(Gi_1EA >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1EB, 0, 0) && ACBA::OrderSymbol() == str_BB && Gi_1E6 == ACBA::OrderMagicNumber())
              {
               if(Gi_1E8 == -1 || ACBA::OrderType() == Gi_1E8)
                 {
                  Gi_1E9 = Gi_1E9 + 1;
                 }
              }
            Gi_1EB = Gi_1EB - 1;
           }
         while(Gi_1EB >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 3 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 3 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1E9 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 3 Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1EA = 0;
         str_BC = SimboloAuxiliar_3;
         Gi_1EC = 1;
         Gi_1ED = 0;
         Gi_1EE = ACBA::OrdersTotal() - 1;
         Gi_1EF = Gi_1EE;
         if(Gi_1EE >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1EF, 0, 0) && ACBA::OrderSymbol() == str_BC && Gi_1EA == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1EC == -1 || ACBA::OrderType() == Gi_1EC)
                    {
                     Gi_1ED = Gi_1ED + 1;
                    }
                 }
               Gi_1EF = Gi_1EF - 1;
              }
            while(Gi_1EF >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 3 Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES SELL ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1ED > 0)
           {
            //ABRE NUEVO SELL
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_3, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_3, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 4 ##################
      // #########################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1EE = NumeroMagico;
      str_BD = SimboloAuxiliar_4;
      Gi_1F0 = -1;
      Gi_1F1 = 0;
      Gi_1F2 = ACBA::OrdersTotal() - 1;
      Gi_1F3 = Gi_1F2;
      if(Gi_1F2 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1F3, 0, 0) && ACBA::OrderSymbol() == str_BD && Gi_1EE == ACBA::OrderMagicNumber())
              {
               if(Gi_1F0 == -1 || ACBA::OrderType() == Gi_1F0)
                 {
                  Gi_1F1 = Gi_1F1 + 1;
                 }
              }
            Gi_1F3 = Gi_1F3 - 1;
           }
         while(Gi_1F3 >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1F1 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 4 Cuenta Ordenes BUY abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1F2 = 0;
         str_BE = SimboloAuxiliar_4;
         Gi_1F4 = 0;
         Gi_1F5 = 0;
         Gi_1F6 = ACBA::OrdersTotal() - 1;
         Gi_1F7 = Gi_1F6;
         if(Gi_1F6 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1F7, 0, 0) && ACBA::OrderSymbol() == str_BE && Gi_1F2 == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1F4 == -1 || ACBA::OrderType() == Gi_1F4)
                    {
                     Gi_1F5 = Gi_1F5 + 1;
                    }
                 }
               Gi_1F7 = Gi_1F7 - 1;
              }
            while(Gi_1F7 >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 4 Cuenta Ordenes BUY abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES BUY ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1F5 > 0)
           {
            //NUEVA ORDEN BUY
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_1F6 = NumeroMagico;
      str_BF = SimboloAuxiliar_4;
      Gi_1F8 = -1;
      Gi_1F9 = 0;
      Gi_1FA = ACBA::OrdersTotal() - 1;
      Gi_1FB = Gi_1FA;
      if(Gi_1FA >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1FB, 0, 0) && ACBA::OrderSymbol() == str_BF && Gi_1F6 == ACBA::OrderMagicNumber())
              {
               if(Gi_1F8 == -1 || ACBA::OrderType() == Gi_1F8)
                 {
                  Gi_1F9 = Gi_1F9 + 1;
                 }
              }
            Gi_1FB = Gi_1FB - 1;
           }
         while(Gi_1FB >= 0);
        }
      // <<<<<<<<<<<<<<<<<<<<<<<< SIMBOLO AUXILIAR 4 - CUENTA ORDENES ABIERTAS <<<<<<<<<<<<<<<<<<<<<<<<

      // >>>>>>>>>>>>>>>> SIMBOLO AUXILIAR 4 - si ORDENES ABIERTAS = 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_1F9 == 0)
        {
         // >>>>>>>>>>>>>>>>>>>>>>  SIMBOLO AUXILIAR 4 Cuenta Ordenes SELL abiertas >>>>>>>>>>>>>>>>>>>>>>>
         Gi_1FA = 0;
         str_C0 = SimboloAuxiliar_4;
         Gi_1FC = 1;
         Gi_1FD = 0;
         Gi_1FE = ACBA::OrdersTotal() - 1;
         Gi_1FF = Gi_1FE;
         if(Gi_1FE >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_1FF, 0, 0) && ACBA::OrderSymbol() == str_C0 && Gi_1FA == ACBA::OrderMagicNumber())
                 {
                  if(Gi_1FC == -1 || ACBA::OrderType() == Gi_1FC)
                    {
                     Gi_1FD = Gi_1FD + 1;
                    }
                 }
               Gi_1FF = Gi_1FF - 1;
              }
            while(Gi_1FF >= 0);
           }
         // <<<<<<<<<<<<<<<<<<<<<<<<  SIMBOLO AUXILIAR 4 Cuenta Ordenes SELL abiertas <<<<<<<<<<<<<<<<<<<<<<<<

         // ORDENES SELL ABIERTAS > 0 ENTONCES >>>>
         if(Gi_1FD > 0)
           {
            //ABRE NUEVO SELL
            OrdenEnviada = ACBA::OrderSend(SimboloAuxiliar_4, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloAuxiliar_4, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
           }
        }

      // ###########################################################################################################################################################################
      // ###########################################################################################################################################################################
      // ###########################################################################################################################################################################


      // #########################################################
      // ################### SIMBOLO PRINCIPAL ###################
      // #########################################################

      if((ContadorDeOrdenes(NumeroMagico, SimboloPrincipal, 0) > 0 && ContadorDeOrdenes(0, SimboloPrincipal, 1) > 0) ||
         (ContadorDeOrdenes(NumeroMagico, SimboloPrincipal, 1) > 0 && ContadorDeOrdenes(0, SimboloPrincipal, 0) > 0))
        {
         // ######### SIMBOLO PRINCIPAL -->> CIERRA TODAS LAS ORDENES #########
         Gi_20E = NumeroMagico;
         str_C5 = SimboloPrincipal;
         Gi_210 = ACBA::OrdersTotal() - 1;
         Gi_211 = Gi_210;
         if(Gi_210 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_211, 0, 0) && ACBA::OrderSymbol() == str_C5 && ACBA::OrderMagicNumber() == Gi_20E)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_C5, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_C5, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_211 = Gi_211 - 1;
              }
            while(Gi_211 >= 0);
           }

         Gi_215 = 0;
         str_C6 = SimboloPrincipal;
         Gi_216 = ACBA::OrdersTotal() - 1;
         Gi_217 = Gi_216;
         if(Gi_216 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_217, 0, 0) && ACBA::OrderSymbol() == str_C6 && ACBA::OrderMagicNumber() == Gi_215)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_C6, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_C6, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_217 = Gi_217 - 1;
              }
            while(Gi_217 >= 0);
           }
        }


      // #########################################################
      // ################### SIMBOLO AUXILIAR 1 ##################
      // #########################################################
      if((ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_1, 0) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_1, 1) > 0) ||
         (ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_1, 1) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_1, 0) > 0))
        {
         // ######### SIMBOLO AUXILIAR 1 -->> CIERRA TODAS LAS ORDENES #########
         Gi_22A = NumeroMagico;
         str_CB = SimboloAuxiliar_1;
         Gi_22C = ACBA::OrdersTotal() - 1;
         Gi_22D = Gi_22C;
         if(Gi_22C >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_22D, 0, 0) && ACBA::OrderSymbol() == str_CB && ACBA::OrderMagicNumber() == Gi_22A)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_CB, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_CB, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_22D = Gi_22D - 1;
              }
            while(Gi_22D >= 0);
           }
         Gi_231 = 0;
         str_CC = SimboloAuxiliar_1;
         Gi_232 = ACBA::OrdersTotal() - 1;
         Gi_233 = Gi_232;
         if(Gi_232 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_233, 0, 0) && ACBA::OrderSymbol() == str_CC && ACBA::OrderMagicNumber() == Gi_231)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_CC, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_CC, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_233 = Gi_233 - 1;
              }
            while(Gi_233 >= 0);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 2 ##################
      // #########################################################
      if((ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_2, 0) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_2, 1) > 0) ||
         (ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_2, 1) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_2, 0) > 0))
        {
         // ######### SIMBOLO AUXILIAR 2 -->> CIERRA TODAS LAS ORDENES #########
         Gi_246 = NumeroMagico;
         str_D1 = SimboloAuxiliar_2;
         Gi_248 = ACBA::OrdersTotal() - 1;
         Gi_249 = Gi_248;
         if(Gi_248 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_249, 0, 0) && ACBA::OrderSymbol() == str_D1 && ACBA::OrderMagicNumber() == Gi_246)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D1, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D1, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_249 = Gi_249 - 1;
              }
            while(Gi_249 >= 0);
           }
         Gi_24D = 0;
         str_D2 = SimboloAuxiliar_2;
         Gi_24E = ACBA::OrdersTotal() - 1;
         Gi_24F = Gi_24E;
         if(Gi_24E >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_24F, 0, 0) && ACBA::OrderSymbol() == str_D2 && ACBA::OrderMagicNumber() == Gi_24D)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D2, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D2, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_24F = Gi_24F - 1;
              }
            while(Gi_24F >= 0);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 3 ##################
      // #########################################################
      if((ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_3, 0) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_3, 1) > 0) ||
         (ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_3, 1) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_3, 0) > 0))
        {
         // ######### SIMBOLO AUXILIAR 3 -->> CIERRA TODAS LAS ORDENES #########
         Gi_262 = NumeroMagico;
         str_D7 = SimboloAuxiliar_3;
         Gi_264 = ACBA::OrdersTotal() - 1;
         Gi_265 = Gi_264;
         if(Gi_264 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_265, 0, 0) && ACBA::OrderSymbol() == str_D7 && ACBA::OrderMagicNumber() == Gi_262)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D7, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D7, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_265 = Gi_265 - 1;
              }
            while(Gi_265 >= 0);
           }
         Gi_269 = 0;
         str_D8 = SimboloAuxiliar_3;
         Gi_26A = ACBA::OrdersTotal() - 1;
         Gi_26B = Gi_26A;
         if(Gi_26A >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_26B, 0, 0) && ACBA::OrderSymbol() == str_D8 && ACBA::OrderMagicNumber() == Gi_269)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D8, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_D8, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_26B = Gi_26B - 1;
              }
            while(Gi_26B >= 0);
           }
        }

      // #########################################################
      // ################### SIMBOLO AUXILIAR 4 ##################
      // #########################################################
      if((ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_4, 0) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_4, 1) > 0) ||
         (ContadorDeOrdenes(NumeroMagico, SimboloAuxiliar_4, 1) > 0 && ContadorDeOrdenes(0, SimboloAuxiliar_4, 0) > 0))
        {
         // ######### SIMBOLO AUXILIAR 4 -->> CIERRA TODAS LAS ORDENES #########
         Gi_27E = NumeroMagico;
         str_DD = SimboloAuxiliar_4;
         Gi_280 = ACBA::OrdersTotal() - 1;
         Gi_281 = Gi_280;
         if(Gi_280 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_281, 0, 0) && ACBA::OrderSymbol() == str_DD && ACBA::OrderMagicNumber() == Gi_27E)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_DD, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_DD, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_281 = Gi_281 - 1;
              }
            while(Gi_281 >= 0);
           }
         Gi_285 = 0;
         str_DE = SimboloAuxiliar_4;
         Gi_286 = ACBA::OrdersTotal() - 1;
         Gi_287 = Gi_286;
         if(Gi_286 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_287, 0, 0) && ACBA::OrderSymbol() == str_DE && ACBA::OrderMagicNumber() == Gi_285)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_DE, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_DE, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_287 = Gi_287 - 1;
              }
            while(Gi_287 >= 0);
           }
        }

      // #############################################################################################################################################################
      // #############################################################################################################################################################
      // #############################################################################################################################################################
      // #############################################################################################################################################################

      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO EXTRA - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>
      Gi_28B = 0;
      str_DF = SimboloEXTRA;
      Gi_28C = -1;
      Gi_28D = 0;
      Gi_28E = ACBA::OrdersTotal() - 1;
      Gi_28F = Gi_28E;
      if(Gi_28E >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_28F, 0, 0) && ACBA::OrderSymbol() == str_DF && Gi_28B == ACBA::OrderMagicNumber())
              {
               if(Gi_28C == -1 || ACBA::OrderType() == Gi_28C)
                 {
                  Gi_28D = Gi_28D + 1;
                 }
              }
            Gi_28F = Gi_28F - 1;
           }
         while(Gi_28F >= 0);
        }
      // >>>>>>>>>>>>>>>> SIMBOLO SIMBOLO EXTRA - CUENTA ORDENES ABIERTAS >>>>>>>>>>>>>>>>

      // >>>>>>>>>>>>>>>> SIMBOLO EXTRA - si ORDENES ABIERTAS > 0 entonces >>>>>>>>>>>>>>>>
      if(Gi_28D > 0)
        {
         // ############### CIERRA TODAS LAS ORDENES ############
         Gi_28E = NumeroMagico;
         Gi_290 = ACBA::OrdersTotal() - 1;
         Gi_291 = Gi_290;
         if(Gi_290 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_291, 0, 0) && ACBA::OrderMagicNumber() == Gi_28E)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     str_E0 = ACBA::OrderSymbol();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E0, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     str_E1 = ACBA::OrderSymbol();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E1, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_291 = Gi_291 - 1;
              }
            while(Gi_291 >= 0);
           }
         // #####FIN########## CIERRA TODAS LAS ORDENES ############

         // ############### CIERRA TODAS LAS ORDENES DEL SIMBOLO EXTRA ############
         Gi_295 = 0;
         str_E2 = SimboloEXTRA;
         Gi_296 = ACBA::OrdersTotal() - 1;
         Gi_297 = Gi_296;
         if(Gi_296 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_297, 0, 0) && ACBA::OrderSymbol() == str_E2 && ACBA::OrderMagicNumber() == Gi_295)
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E2, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E2, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
               Gi_297 = Gi_297 - 1;
              }
            while(Gi_297 >= 0);
           }
         // #######FIN######## CIERRA TODAS LAS ORDENES DEL SIMBOLO EXTRA ############
        }
     }
// ################FIN ################ boton TRADEs_TRADING_MOBILE en ON ################################

// ##### CALCULA BENEFICIO DE TODAS LAS ORDENES ABIERTAS  ####
   Ld_80 = -((ACBA::AccountBalance() / 100.0) * StopLossProcent);
   Gi_29B = -1;
   Gd_29C = 0;
   Gi_29D = ACBA::OrdersTotal() - 1;
   Gi_29E = Gi_29D;
   if(Gi_29D >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(Gi_29E, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
           {
            if(ACBA::OrderType() == Gi_29B || Gi_29B == -1)
              {
               Gd_29D = ACBA::OrderProfit();
               Gd_29D = (Gd_29D + ACBA::OrderSwap());
               Gd_29C = ((Gd_29D + ACBA::OrderCommission()) + Gd_29C);
              }
           }
         Gi_29E = Gi_29E - 1;
        }
      while(Gi_29E >= 0);
     }
// ## FIN ### CALCULA BENEFICIO DE TODAS LAS ORDENES ABIERTAS  ####

//###### SI LA PÉRDIDA ES MAYOR EL MÁXIMO PORCENTUAL PERMITIDO DE PERDIDA --> CERRAMOS TODO ###########
   if((Gd_29C < Ld_80) && (Ld_80 != 0))
     {
      Gi_29D = NumeroMagico;
      Gi_29F = ACBA::OrdersTotal() - 1;
      Gi_2A0 = Gi_29F;
      if(Gi_29F >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_2A0, 0, 0) && ACBA::OrderMagicNumber() == Gi_29D)
              {
               if(ACBA::OrderType() == OP_BUY)
                 {
                  ACBA::RefreshRates();
                  str_E3 = ACBA::OrderSymbol();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E3, MODE_BID), _Digits), 10, 16777215);
                 }
               if(ACBA::OrderType() == OP_SELL)
                 {
                  ACBA::RefreshRates();
                  str_E4 = ACBA::OrderSymbol();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_E4, MODE_ASK), _Digits), 10, 16777215);
                 }
              }
            Gi_2A0 = Gi_2A0 - 1;
           }
         while(Gi_2A0 >= 0);
        }
      ACBA::ObjectsDeleteAll(NULL, 22);
      ACBA::ObjectsDeleteAll(NULL, 2);
     }
//### FIN ### SI LA PÉRDIDA ES MAYOR EL MÁXIMO PORCENTUAL PERMITIDO DE PERDIDA --> CERRAMOS TODO ###########

   if(ACBA::ObjectGetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0) == 0 && ACBA::ObjectGetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0) == 0 && ACBA::ObjectGetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0) == 0 && ACBA::ObjectGetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0) == 0 && ACBA::ObjectGetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0) == 0)
     {
      SimboloActivoEnGrafico = _Symbol;
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0) != 0)
     {
      SimboloActivoEnGrafico = SimboloPrincipal;
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0) != 0)
     {
      SimboloActivoEnGrafico = SimboloAuxiliar_1;
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0) != 0)
     {
      SimboloActivoEnGrafico = SimboloAuxiliar_2;
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0) != 0)
     {
      SimboloActivoEnGrafico = SimboloAuxiliar_3;
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0) != 0)
     {
      SimboloActivoEnGrafico = SimboloAuxiliar_4;
     }
   if(Languale == 0)  //RUSO
     {
      TextoON = "ON";
      TextoOFF = "OFF";
     }
   if(Languale == 1)  //INGLES
     {
      TextoON = "On";
      TextoOFF = "Off";
     }
   if(ACBA::ObjectGetInteger(0, "INFO_Button", OBJPROP_STATE, 0) == 0)
     {
      if(Languale == 0)  //RUSO
        {
         RusoEtiquetaRectangulo_INFO_fon = "INFO_fon";
         if(ACBA::ObjectCreate(0, RusoEtiquetaRectangulo_INFO_fon, OBJ_RECTANGLE_LABEL, 0, 0, 0))
           {
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_XDISTANCE, 240);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_YDISTANCE, 20);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_XSIZE, 220);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_YSIZE, 325);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_BGCOLOR, Ii_60);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_BORDER_TYPE, 2);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_CORNER, 3);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_COLOR, 17919);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, 8, 1);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_BACK, 0);
            ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_INFO_fon, OBJPROP_HIDDEN, 0);
           }

         RusoTexto_INFO_Button = "INFO";
         RusoBoton_INFO_Button = "INFO_Button";
         ACBA::ObjectCreate(0, RusoBoton_INFO_Button, OBJ_BUTTON, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_XDISTANCE, 70);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_YDISTANCE, 15);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_XSIZE, AnchoBoton);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_YSIZE, AltoBoton);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoBoton_INFO_Button, OBJPROP_TEXT, RusoTexto_INFO_Button);
         ACBA::ObjectSetString(0, RusoBoton_INFO_Button, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_COLOR, ColorTextoBoton);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_BGCOLOR, ColorFondoBoton);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_BORDER_COLOR, ColorBordeBoton);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoBoton_INFO_Button, OBJPROP_BACK, 0);

         RusoTexto_INFO_LOGO = "@VacaLoquiTa";
         RusoEtiqueta_INFO_LOGO = "INFO_LOGO";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_LOGO, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_YDISTANCE, 24);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_LOGO, OBJPROP_TEXT, RusoTexto_INFO_LOGO);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_LOGO, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_LOGO, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line = "______________________________";
         RusoEtiqueta_INFO_Line = "INFO_Line";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_YDISTANCE, 27);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line, OBJPROP_TEXT, RusoTexto_INFO_Line);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt1 = "Información de la cuenta";
         RusoEtiqueta_INFO_txt1 = "INFO_txt1";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt1, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_YDISTANCE, 45);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt1, OBJPROP_TEXT, RusoTexto_INFO_txt1);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt1, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt1, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line2 = "______________________________";
         RusoEtiqueta_INFO_Line2 = "INFO_Line2";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line2, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_YDISTANCE, 47);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line2, OBJPROP_TEXT, RusoTexto_INFO_Line2);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line2, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line2, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt2 = "Balance:";
         RusoEtiqueta_INFO_txt2 = "INFO_txt2";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt2, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_YDISTANCE, 65);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt2, OBJPROP_TEXT, RusoTexto_INFO_txt2);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt2, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt2, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt3 = "Equidad:";
         RusoEtiqueta_INFO_txt3 = "INFO_txt3";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt3, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_YDISTANCE, 80);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt3, OBJPROP_TEXT, RusoTexto_INFO_txt3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt3, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt3, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt4 = "Margen:";
         RusoEtiqueta_INFO_txt4 = "INFO_txt4";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt4, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_YDISTANCE, 95);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt4, OBJPROP_TEXT, RusoTexto_INFO_txt4);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt4, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt4, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt5 = "Margen Libre:";
         RusoEtiqueta_INFO_txt5 = "INFO_txt5";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt5, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_YDISTANCE, 110);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt5, OBJPROP_TEXT, RusoTexto_INFO_txt5);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt5, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt5, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt7 = "Órdenes abiertas:";
         RusoEtiqueta_INFO_txt7 = "INFO_txt7";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt7, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_YDISTANCE, 125);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt7, OBJPROP_TEXT, RusoTexto_INFO_txt7);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt7, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt7, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line3 = "______________________________";
         RusoEtiqueta_INFO_Line3 = "INFO_Line3";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line3, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_YDISTANCE, 128);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line3, OBJPROP_TEXT, RusoTexto_INFO_Line3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line3, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line3, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt6 = "Beneficio Cuenta";
         RusoEtiqueta_INFO_txt6 = "INFO_txt6";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt6, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_YDISTANCE, 145);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt6, OBJPROP_TEXT, RusoTexto_INFO_txt6);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt6, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt6, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line4 = "______________________________";
         RusoEtiqueta_INFO_Line4 = "INFO_Line4";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line4, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_YDISTANCE, 148);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line4, OBJPROP_TEXT, RusoTexto_INFO_Line4);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line4, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line4, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt8 = "Beneficio Total:";
         RusoEtiqueta_INFO_txt8 = "INFO_txt8";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt8, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_YDISTANCE, 165);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt8, OBJPROP_TEXT, RusoTexto_INFO_txt8);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt8, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt8, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt9 = "Beneficio HOY:";
         RusoEtiqueta_INFO_txt9 = "INFO_txt9";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt9, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_YDISTANCE, 180);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt9, OBJPROP_TEXT, RusoTexto_INFO_txt9);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt9, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt9, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt10 = "Beneficio AYER:";
         RusoEtiqueta_INFO_txt10 = "INFO_txt10";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt10, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_YDISTANCE, 195);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt10, OBJPROP_TEXT, RusoTexto_INFO_txt10);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt10, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt10, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt11 = "Beneficio SEMANA:";
         RusoEtiqueta_INFO_txt11 = "INFO_txt11";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt11, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_YDISTANCE, 210);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt11, OBJPROP_TEXT, RusoTexto_INFO_txt11);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt11, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt11, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt12 = "BENEFICIO MES:";
         RusoEtiqueta_INFO_txt12 = "INFO_txt12";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt12, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_YDISTANCE, 225);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt12, OBJPROP_TEXT, RusoTexto_INFO_txt12);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt12, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt12, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt13 = DoubleToString(ACBA::AccountBalance(), 2);
         RusoEtiqueta_INFO_txt13 = "INFO_txt13";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt13, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_YDISTANCE, 65);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt13, OBJPROP_TEXT, RusoTexto_INFO_txt13);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt13, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt13, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt14 = DoubleToString(ACBA::AccountEquity(), 2);
         RusoEtiqueta_INFO_txt14 = "INFO_txt14";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt14, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_YDISTANCE, 80);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt14, OBJPROP_TEXT, RusoTexto_INFO_txt14);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt14, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt14, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt15 = DoubleToString(ACBA::AccountMargin(), 2);
         RusoEtiqueta_INFO_txt15 = "INFO_txt15";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt15, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_YDISTANCE, 95);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt15, OBJPROP_TEXT, RusoTexto_INFO_txt15);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt15, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt15, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt16 = DoubleToString(ACBA::AccountFreeMargin(), 2);
         RusoEtiqueta_INFO_txt16 = "INFO_txt16";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt16, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_YDISTANCE, 110);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt16, OBJPROP_TEXT, RusoTexto_INFO_txt16);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt16, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt16, OBJPROP_BACK, 0);

         Gi_2A4 = 3;
         Gi_2A5 = -1;
         Gi_2A6 = 0;
         Gi_2A7 = ACBA::OrdersTotal() - 1;
         Gi_2A8 = Gi_2A7;
         if(Gi_2A7 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2A8, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(Gi_2A5 == -1 || ACBA::OrderType() == Gi_2A5)
                    {
                     Gi_2A6 = Gi_2A6 + 1;
                    }
                 }
               Gi_2A8 = Gi_2A8 - 1;
              }
            while(Gi_2A8 >= 0);
           }

         RusoTexto_INFO_txt17 = DoubleToString(Gi_2A6, 0);
         RusoEtiqueta_INFO_txt17 = "INFO_txt17";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt17, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_YDISTANCE, 125);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_CORNER, Gi_2A4);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt17, OBJPROP_TEXT, RusoTexto_INFO_txt17);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt17, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt17, OBJPROP_BACK, 0);

         Gi_2A7 = 3;
         Gi_2A9 = -1;
         Gd_2AA = 0;
         Gi_2AB = ACBA::OrdersTotal() - 1;
         Gi_2AC = Gi_2AB;
         if(Gi_2AB >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2AC, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2A9 || Gi_2A9 == -1)
                    {
                     Gd_2AB = ACBA::OrderProfit();
                     Gd_2AB = (Gd_2AB + ACBA::OrderSwap());
                     Gd_2AA = ((Gd_2AB + ACBA::OrderCommission()) + Gd_2AA);
                    }
                 }
               Gi_2AC = Gi_2AC - 1;
              }
            while(Gi_2AC >= 0);
           }
         RusoTexto_INFO_txt18 = DoubleToString(Gd_2AA, 2);
         RusoEtiqueta_INFO_txt18 = "INFO_txt18";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt18, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_YDISTANCE, 165);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_CORNER, Gi_2A7);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt18, OBJPROP_TEXT, RusoTexto_INFO_txt18);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt18, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt18, OBJPROP_BACK, 0);

         Gi_2AB = 3;
         Gi_2AD = -1;
         Gd_2AE = 0;
         Gi_2AF = ACBA::OrdersHistoryTotal() - 1;
         Gi_2B0 = Gi_2AF;
         if(Gi_2AF >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2B0, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2AF = ACBA::OrderCloseTime();
                  if(Gl_2AF >= ACBA::iTime(_Symbol, 1440, 0))
                    {
                     if(ACBA::OrderType() == Gi_2AD || Gi_2AD == -1)
                       {
                        Gd_2AF = ACBA::OrderProfit();
                        Gd_2AF = (Gd_2AF + ACBA::OrderSwap());
                        Gd_2AE = ((Gd_2AF + ACBA::OrderCommission()) + Gd_2AE);
                       }
                    }
                 }
               Gi_2B0 = Gi_2B0 - 1;
              }
            while(Gi_2B0 >= 0);
           }
         RusoTexto_INFO_txt19 = DoubleToString(Gd_2AE, 2);
         RusoEtiqueta_INFO_txt19 = "INFO_txt19";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt19, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_YDISTANCE, 180);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_CORNER, Gi_2AB);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt19, OBJPROP_TEXT, RusoTexto_INFO_txt19);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt19, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt19, OBJPROP_BACK, 0);

         Gi_2AF = 3;
         Gi_2B1 = -1;
         Gd_2B2 = 0;
         Gi_2B3 = ACBA::OrdersHistoryTotal() - 1;
         Gi_2B4 = Gi_2B3;
         if(Gi_2B3 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2B4, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2B3 = ACBA::OrderCloseTime();
                  if(Gl_2B3 >= ACBA::iTime(_Symbol, 1440, 1))
                    {
                     Gl_2B3 = ACBA::OrderCloseTime();
                     if(Gl_2B3 < ACBA::iTime(_Symbol, 1440, 0))
                       {
                        if(ACBA::OrderType() == Gi_2B1 || Gi_2B1 == -1)
                          {
                           Gd_2B3 = ACBA::OrderProfit();
                           Gd_2B3 = (Gd_2B3 + ACBA::OrderSwap());
                           Gd_2B2 = ((Gd_2B3 + ACBA::OrderCommission()) + Gd_2B2);
                          }
                       }
                    }
                 }
               Gi_2B4 = Gi_2B4 - 1;
              }
            while(Gi_2B4 >= 0);
           }
         RusoTexto_INFO_txt20 = DoubleToString(Gd_2B2, 2);
         RusoEtiqueta_INFO_txt20 = "INFO_txt20";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt20, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_YDISTANCE, 195);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_CORNER, Gi_2AF);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt20, OBJPROP_TEXT, RusoTexto_INFO_txt20);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt20, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt20, OBJPROP_BACK, 0);

         Gi_2B3 = 3;
         Gi_2B5 = -1;
         Gd_2B6 = 0;
         Gi_2B7 = ACBA::OrdersHistoryTotal() - 1;
         Gi_2B8 = Gi_2B7;
         if(Gi_2B7 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2B8, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2B7 = ACBA::OrderCloseTime();
                  if(Gl_2B7 >= ACBA::iTime(_Symbol, 10080, 0))
                    {
                     if(ACBA::OrderType() == Gi_2B5 || Gi_2B5 == -1)
                       {
                        Gd_2B7 = ACBA::OrderProfit();
                        Gd_2B7 = (Gd_2B7 + ACBA::OrderSwap());
                        Gd_2B6 = ((Gd_2B7 + ACBA::OrderCommission()) + Gd_2B6);
                       }
                    }
                 }
               Gi_2B8 = Gi_2B8 - 1;
              }
            while(Gi_2B8 >= 0);
           }
         RusoTexto_INFO_txt21 = DoubleToString(Gd_2B6, 2);
         RusoEtiqueta_INFO_txt21 = "INFO_txt21";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt21, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_YDISTANCE, 210);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_CORNER, Gi_2B3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt21, OBJPROP_TEXT, RusoTexto_INFO_txt21);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt21, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt21, OBJPROP_BACK, 0);

         Gi_2B7 = 3;
         Gi_2B9 = -1;
         Gd_2BA = 0;
         Gi_2BB = ACBA::OrdersHistoryTotal() - 1;
         Gi_2BC = Gi_2BB;
         if(Gi_2BB >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2BC, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2BB = ACBA::OrderCloseTime();
                  if(Gl_2BB >= ACBA::iTime(_Symbol, 43200, 0))
                    {
                     if(ACBA::OrderType() == Gi_2B9 || Gi_2B9 == -1)
                       {
                        Gd_2BB = ACBA::OrderProfit();
                        Gd_2BB = (Gd_2BB + ACBA::OrderSwap());
                        Gd_2BA = ((Gd_2BB + ACBA::OrderCommission()) + Gd_2BA);
                       }
                    }
                 }
               Gi_2BC = Gi_2BC - 1;
              }
            while(Gi_2BC >= 0);
           }
         RusoTexto_INFO_txt22 = DoubleToString(Gd_2BA, 2);
         RusoEtiqueta_INFO_txt22 = "INFO_txt22";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt22, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_YDISTANCE, 225);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_CORNER, Gi_2B7);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt22, OBJPROP_TEXT, RusoTexto_INFO_txt22);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt22, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt22, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line5 = "______________________________";
         RusoEtiqueta_INFO_Line5 = "INFO_Line5";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line5, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_YDISTANCE, 227);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line5, OBJPROP_TEXT, RusoTexto_INFO_Line5);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line5, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line5, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt23 = "Beneficio por Símbolos";
         RusoEtiqueta_INFO_txt23 = "INFO_txt23";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt23, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_YDISTANCE, 243);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt23, OBJPROP_TEXT, RusoTexto_INFO_txt23);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt23, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt23, OBJPROP_BACK, 0);

         RusoTexto_INFO_Line6 = "______________________________";
         RusoEtiqueta_INFO_Line6 = "INFO_Line6";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_Line6, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_YDISTANCE, 247);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line6, OBJPROP_TEXT, RusoTexto_INFO_Line6);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_Line6, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_Line6, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt24 = "1. ";
         RusoEtiqueta_INFO_txt24 = "INFO_txt24";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt24, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_YDISTANCE, 263);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt24, OBJPROP_TEXT, RusoTexto_INFO_txt24);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt24, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt24, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt25 = "Beneficio para " + SimboloPrincipal;
         RusoTexto_INFO_txt25 = RusoTexto_INFO_txt25 + ":";
         RusoEtiqueta_INFO_txt25 = "INFO_txt25";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt25, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_XDISTANCE, 220);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_YDISTANCE, 263);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt25, OBJPROP_TEXT, RusoTexto_INFO_txt25);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt25, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt25, OBJPROP_BACK, 0);

         Gi_2BB = 3;
         str_128 = SimboloPrincipal;
         Gi_2BD = -1;
         Gd_2BE = 0;
         Gi_2BF = ACBA::OrdersTotal() - 1;
         Gi_2C0 = Gi_2BF;
         if(Gi_2BF >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2C0, 0, 0) && str_128 == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2BD || Gi_2BD == -1)
                    {
                     Gd_2BF = ACBA::OrderProfit();
                     Gd_2BF = (Gd_2BF + ACBA::OrderSwap());
                     Gd_2BE = ((Gd_2BF + ACBA::OrderCommission()) + Gd_2BE);
                    }
                 }
               Gi_2C0 = Gi_2C0 - 1;
              }
            while(Gi_2C0 >= 0);
           }
         RusoTexto_INFO_txt26 = DoubleToString(Gd_2BE, 2);
         RusoEtiqueta_INFO_txt26 = "INFO_txt26";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt26, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_YDISTANCE, 263);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_CORNER, Gi_2BB);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt26, OBJPROP_TEXT, RusoTexto_INFO_txt26);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt26, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt26, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt27 = "2. ";
         RusoEtiqueta_INFO_txt27 = "INFO_txt27";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt27, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_YDISTANCE, 278);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt27, OBJPROP_TEXT, RusoTexto_INFO_txt27);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt27, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt27, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt28 = "Beneficio para " + SimboloAuxiliar_1;
         RusoTexto_INFO_txt28 = RusoTexto_INFO_txt28 + ":";
         RusoEtiqueta_INFO_txt28 = "INFO_txt28";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt28, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_XDISTANCE, 220);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_YDISTANCE, 278);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt28, OBJPROP_TEXT, RusoTexto_INFO_txt28);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt28, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt28, OBJPROP_BACK, 0);

         Gi_2BF = 3;
         str_12F = SimboloAuxiliar_1;
         Gi_2C1 = -1;
         Gd_2C2 = 0;
         Gi_2C3 = ACBA::OrdersTotal() - 1;
         Gi_2C4 = Gi_2C3;
         if(Gi_2C3 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2C4, 0, 0) && str_12F == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2C1 || Gi_2C1 == -1)
                    {
                     Gd_2C3 = ACBA::OrderProfit();
                     Gd_2C3 = (Gd_2C3 + ACBA::OrderSwap());
                     Gd_2C2 = ((Gd_2C3 + ACBA::OrderCommission()) + Gd_2C2);
                    }
                 }
               Gi_2C4 = Gi_2C4 - 1;
              }
            while(Gi_2C4 >= 0);
           }
         RusoTexto_INFO_txt29 = DoubleToString(Gd_2C2, 2);
         RusoEtiqueta_INFO_txt29 = "INFO_txt29";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt29, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_YDISTANCE, 278);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_CORNER, Gi_2BF);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt29, OBJPROP_TEXT, RusoTexto_INFO_txt29);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt29, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt29, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt30 = "3. ";
         RusoEtiqueta_INFO_txt30 = "INFO_txt30";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt30, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_YDISTANCE, 293);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt30, OBJPROP_TEXT, RusoTexto_INFO_txt30);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt30, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt30, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt31 = "Beneficio para " + SimboloAuxiliar_2;
         RusoTexto_INFO_txt31 = RusoTexto_INFO_txt31 + ":";
         RusoEtiqueta_INFO_txt31 = "INFO_txt31";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt31, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_XDISTANCE, 220);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_YDISTANCE, 293);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt31, OBJPROP_TEXT, RusoTexto_INFO_txt31);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt31, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt31, OBJPROP_BACK, 0);

         Gi_2C3 = 3;
         str_136 = SimboloAuxiliar_2;
         Gi_2C5 = -1;
         Gd_2C6 = 0;
         Gi_2C7 = ACBA::OrdersTotal() - 1;
         Gi_2C8 = Gi_2C7;
         if(Gi_2C7 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2C8, 0, 0) && str_136 == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2C5 || Gi_2C5 == -1)
                    {
                     Gd_2C7 = ACBA::OrderProfit();
                     Gd_2C7 = (Gd_2C7 + ACBA::OrderSwap());
                     Gd_2C6 = ((Gd_2C7 + ACBA::OrderCommission()) + Gd_2C6);
                    }
                 }
               Gi_2C8 = Gi_2C8 - 1;
              }
            while(Gi_2C8 >= 0);
           }
         RusoTexto_INFO_txt32 = DoubleToString(Gd_2C6, 2);
         RusoEtiqueta_INFO_txt32 = "INFO_txt32";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt32, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_YDISTANCE, 293);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_CORNER, Gi_2C3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt32, OBJPROP_TEXT, RusoTexto_INFO_txt32);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt32, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt32, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt33 = "4. ";
         RusoEtiqueta_INFO_txt33 = "INFO_txt33";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt33, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_YDISTANCE, 308);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt33, OBJPROP_TEXT, RusoTexto_INFO_txt33);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt33, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt33, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt34 = "Beneficio para " + SimboloAuxiliar_3;
         RusoTexto_INFO_txt34 = RusoTexto_INFO_txt34 + ":";
         RusoEtiqueta_INFO_txt34 = "INFO_txt34";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt34, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_XDISTANCE, 220);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_YDISTANCE, 308);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt34, OBJPROP_TEXT, RusoTexto_INFO_txt34);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt34, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt34, OBJPROP_BACK, 0);

         Gi_2C7 = 3;
         str_13D = SimboloAuxiliar_3;
         Gi_2C9 = -1;
         Gd_2CA = 0;
         Gi_2CB = ACBA::OrdersTotal() - 1;
         Gi_2CC = Gi_2CB;
         if(Gi_2CB >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2CC, 0, 0) && str_13D == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2C9 || Gi_2C9 == -1)
                    {
                     Gd_2CB = ACBA::OrderProfit();
                     Gd_2CB = (Gd_2CB + ACBA::OrderSwap());
                     Gd_2CA = ((Gd_2CB + ACBA::OrderCommission()) + Gd_2CA);
                    }
                 }
               Gi_2CC = Gi_2CC - 1;
              }
            while(Gi_2CC >= 0);
           }
         RusoTexto_INFO_txt35 = DoubleToString(Gd_2CA, 2);
         RusoEtiqueta_INFO_txt35 = "INFO_txt35";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt35, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_YDISTANCE, 308);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_CORNER, Gi_2C7);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt35, OBJPROP_TEXT, RusoTexto_INFO_txt35);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt35, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt35, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt36 = "5. ";
         RusoEtiqueta_INFO_txt36 = "INFO_txt36";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt36, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_YDISTANCE, 323);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt36, OBJPROP_TEXT, RusoTexto_INFO_txt36);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt36, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt36, OBJPROP_BACK, 0);

         RusoTexto_INFO_txt37 = "Beneficio para " + SimboloAuxiliar_4;
         RusoTexto_INFO_txt37 = RusoTexto_INFO_txt37 + ":";
         RusoEtiqueta_INFO_txt37 = "INFO_txt37";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt37, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_XDISTANCE, 220);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_YDISTANCE, 323);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt37, OBJPROP_TEXT, RusoTexto_INFO_txt37);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt37, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt37, OBJPROP_BACK, 0);

         Gi_2CB = 3;
         str_144 = SimboloAuxiliar_4;
         Gi_2CD = -1;
         Gd_2CE = 0;
         Gi_2CF = ACBA::OrdersTotal() - 1;
         Gi_2D0 = Gi_2CF;
         if(Gi_2CF >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2D0, 0, 0) && str_144 == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2CD || Gi_2CD == -1)
                    {
                     Gd_2CF = ACBA::OrderProfit();
                     Gd_2CF = (Gd_2CF + ACBA::OrderSwap());
                     Gd_2CE = ((Gd_2CF + ACBA::OrderCommission()) + Gd_2CE);
                    }
                 }
               Gi_2D0 = Gi_2D0 - 1;
              }
            while(Gi_2D0 >= 0);
           }
         RusoTexto_INFO_txt38 = DoubleToString(Gd_2CE, 2);
         RusoEtiqueta_INFO_txt38 = "INFO_txt38";
         ACBA::ObjectCreate(0, RusoEtiqueta_INFO_txt38, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_YDISTANCE, 323);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_CORNER, Gi_2CB);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt38, OBJPROP_TEXT, RusoTexto_INFO_txt38);
         ACBA::ObjectSetString(0, RusoEtiqueta_INFO_txt38, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, RusoEtiqueta_INFO_txt38, OBJPROP_BACK, 0);
        }

      if(Languale == 1)  //ENGLISH
        {
         InglesEtiquetaRectangulo_INFO_fon = "INFO_fon";
         if(ACBA::ObjectCreate(0, InglesEtiquetaRectangulo_INFO_fon, OBJ_RECTANGLE_LABEL, 0, 0, 0))
           {
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_XDISTANCE, 240);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_YDISTANCE, 20);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_XSIZE, 230);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_YSIZE, 270);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_BGCOLOR, Ii_60);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_BORDER_TYPE, 2);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_CORNER, 3);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_COLOR, 17919);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, 8, 1);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_BACK, 0);
            ACBA::ObjectSetInteger(0, InglesEtiquetaRectangulo_INFO_fon, OBJPROP_HIDDEN, 0);
           }

         InglesTexto_INFO_Button = "INFO";
         InglesBoton_INFO_Button = "INFO_Button";
         ACBA::ObjectCreate(0, InglesBoton_INFO_Button, OBJ_BUTTON, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_XDISTANCE, 70);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_YDISTANCE, 15);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_XSIZE, AnchoBoton);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_YSIZE, AltoBoton);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesBoton_INFO_Button, OBJPROP_TEXT, InglesTexto_INFO_Button);
         ACBA::ObjectSetString(0, InglesBoton_INFO_Button, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_COLOR, ColorTextoBoton);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_BGCOLOR, ColorFondoBoton);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_BORDER_COLOR, ColorBordeBoton);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesBoton_INFO_Button, OBJPROP_BACK, 0);

         InglesTexto_INFO_LOGO = "@VacaLoquiTa";
         InglesEtiqueta_INFO_LOGO = "INFO_LOGO";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_LOGO, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_YDISTANCE, 24);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_LOGO, OBJPROP_TEXT, InglesTexto_INFO_LOGO);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_LOGO, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_LOGO, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line = "______________________________";
         InglesEtiqueta_INFO_Line = "INFO_Line";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_YDISTANCE, 27);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line, OBJPROP_TEXT, InglesTexto_INFO_Line);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt1a = "Mforex Smart Scalper 4.0";
         InglesEtiqueta_INFO_txt1a = "INFO_txt1a";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt1a, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_YDISTANCE, 45);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt1a, OBJPROP_TEXT, InglesTexto_INFO_txt1a);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt1a, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1a, OBJPROP_BACK, 0);

         InglesTexto_INFO_Linea = "______________________________";
         InglesEtiqueta_INFO_Linea = "INFO_Linea";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Linea, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_YDISTANCE, 48);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Linea, OBJPROP_TEXT, InglesTexto_INFO_Linea);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Linea, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Linea, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt1 = "Account information";
         InglesEtiqueta_INFO_txt1 = "INFO_txt1";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt1, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_YDISTANCE, 65);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt1, OBJPROP_TEXT, InglesTexto_INFO_txt1);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt1, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt1, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line2 = "______________________________";
         InglesEtiqueta_INFO_Line2 = "INFO_Line2";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line2, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_YDISTANCE, 70);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line2, OBJPROP_TEXT, InglesTexto_INFO_Line2);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line2, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line2, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt2 = "Balance:";
         InglesEtiqueta_INFO_txt2 = "INFO_txt2";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt2, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_YDISTANCE, 88);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt2, OBJPROP_TEXT, InglesTexto_INFO_txt2);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt2, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt2, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt3 = "Equity:";
         InglesEtiqueta_INFO_txt3 = "INFO_txt3";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt3, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_YDISTANCE, 105);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt3, OBJPROP_TEXT, InglesTexto_INFO_txt3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt3, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt3, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt7 = "Open orders:";
         InglesEtiqueta_INFO_txt7 = "INFO_txt7";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt7, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_YDISTANCE, 122);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt7, OBJPROP_TEXT, InglesTexto_INFO_txt7);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt7, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt7, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line3 = "______________________________";
         InglesEtiqueta_INFO_Line3 = "INFO_Line3";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line3, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_YDISTANCE, 128);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line3, OBJPROP_TEXT, InglesTexto_INFO_Line3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line3, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line3, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt6 = "Profit on account";
         InglesEtiqueta_INFO_txt6 = "INFO_txt6";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt6, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_YDISTANCE, 145);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt6, OBJPROP_TEXT, InglesTexto_INFO_txt6);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt6, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt6, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line4 = "______________________________";
         InglesEtiqueta_INFO_Line4 = "INFO_Line4";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line4, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_YDISTANCE, 148);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line4, OBJPROP_TEXT, InglesTexto_INFO_Line4);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line4, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line4, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt8 = "Total profit:";
         InglesEtiqueta_INFO_txt8 = "INFO_txt8";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt8, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_YDISTANCE, 165);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt8, OBJPROP_TEXT, InglesTexto_INFO_txt8);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt8, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt8, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt9 = "Profit for today:";
         InglesEtiqueta_INFO_txt9 = "INFO_txt9";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt9, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_YDISTANCE, 180);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt9, OBJPROP_TEXT, InglesTexto_INFO_txt9);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt9, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt9, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt10 = "Profit for yesterday:";
         InglesEtiqueta_INFO_txt10 = "INFO_txt10";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt10, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_YDISTANCE, 195);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt10, OBJPROP_TEXT, InglesTexto_INFO_txt10);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt10, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt10, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt11 = "Profit for week:";
         InglesEtiqueta_INFO_txt11 = "INFO_txt11";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt11, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_YDISTANCE, 210);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt11, OBJPROP_TEXT, InglesTexto_INFO_txt11);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt11, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt11, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt12 = "Profit for month:";
         InglesEtiqueta_INFO_txt12 = "INFO_txt12";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt12, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_YDISTANCE, 225);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt12, OBJPROP_TEXT, InglesTexto_INFO_txt12);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt12, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt12, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt13 = DoubleToString(ACBA::AccountBalance(), 2);
         InglesEtiqueta_INFO_txt13 = "INFO_txt13";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt13, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_YDISTANCE, 88);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt13, OBJPROP_TEXT, InglesTexto_INFO_txt13);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt13, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt13, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt14 = DoubleToString(ACBA::AccountEquity(), 2);
         InglesEtiqueta_INFO_txt14 = "INFO_txt14";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt14, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_YDISTANCE, 105);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt14, OBJPROP_TEXT, InglesTexto_INFO_txt14);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt14, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt14, OBJPROP_BACK, 0);

         Gi_2CF = 3;
         Gi_2D1 = -1;
         Gi_2D2 = 0;
         Gi_2D3 = ACBA::OrdersTotal() - 1;
         Gi_2D4 = Gi_2D3;
         if(Gi_2D3 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2D4, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(Gi_2D1 == -1 || ACBA::OrderType() == Gi_2D1)
                    {
                     Gi_2D2 = Gi_2D2 + 1;
                    }
                 }
               Gi_2D4 = Gi_2D4 - 1;
              }
            while(Gi_2D4 >= 0);
           }
         InglesTexto_INFO_txt17 = DoubleToString(Gi_2D2, 0);
         InglesEtiqueta_INFO_txt17 = "INFO_txt17";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt17, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_YDISTANCE, 122);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_CORNER, Gi_2CF);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt17, OBJPROP_TEXT, InglesTexto_INFO_txt17);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt17, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt17, OBJPROP_BACK, 0);

         Gi_2D3 = 3;
         Gi_2D5 = -1;
         Gd_2D6 = 0;
         Gi_2D7 = ACBA::OrdersTotal() - 1;
         Gi_2D8 = Gi_2D7;
         if(Gi_2D7 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2D8, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2D5 || Gi_2D5 == -1)
                    {
                     Gd_2D7 = ACBA::OrderProfit();
                     Gd_2D7 = (Gd_2D7 + ACBA::OrderSwap());
                     Gd_2D6 = ((Gd_2D7 + ACBA::OrderCommission()) + Gd_2D6);
                    }
                 }
               Gi_2D8 = Gi_2D8 - 1;
              }
            while(Gi_2D8 >= 0);
           }
         InglesTexto_INFO_txt18 = DoubleToString(Gd_2D6, 2);
         InglesEtiqueta_INFO_txt18 = "INFO_txt18";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt18, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_YDISTANCE, 165);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_CORNER, Gi_2D3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt18, OBJPROP_TEXT, InglesTexto_INFO_txt18);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt18, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt18, OBJPROP_BACK, 0);

         Gi_2D7 = 3;
         Gi_2D9 = -1;
         Gd_2DA = 0;
         Gi_2DB = ACBA::OrdersHistoryTotal() - 1;
         Gi_2DC = Gi_2DB;
         if(Gi_2DB >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2DC, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2DB = ACBA::OrderCloseTime();
                  if(Gl_2DB >= ACBA::iTime(_Symbol, 1440, 0))
                    {
                     if(ACBA::OrderType() == Gi_2D9 || Gi_2D9 == -1)
                       {
                        Gd_2DB = ACBA::OrderProfit();
                        Gd_2DB = (Gd_2DB + ACBA::OrderSwap());
                        Gd_2DA = ((Gd_2DB + ACBA::OrderCommission()) + Gd_2DA);
                       }
                    }
                 }
               Gi_2DC = Gi_2DC - 1;
              }
            while(Gi_2DC >= 0);
           }
         str_174 = DoubleToString(Gd_2DA, 2);
         InglesEtiqueta_INFO_txt19 = "INFO_txt19";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt19, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_YDISTANCE, 180);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_CORNER, Gi_2D7);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt19, OBJPROP_TEXT, str_174);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt19, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt19, OBJPROP_BACK, 0);

         Gi_2DB = 3;
         Gi_2DD = -1;
         Gd_2DE = 0;
         Gi_2DF = ACBA::OrdersHistoryTotal() - 1;
         Gi_2E0 = Gi_2DF;
         if(Gi_2DF >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2E0, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2DF = ACBA::OrderCloseTime();
                  if(Gl_2DF >= ACBA::iTime(_Symbol, 1440, 1))
                    {
                     Gl_2DF = ACBA::OrderCloseTime();
                     if(Gl_2DF < ACBA::iTime(_Symbol, 1440, 0))
                       {
                        if(ACBA::OrderType() == Gi_2DD || Gi_2DD == -1)
                          {
                           Gd_2DF = ACBA::OrderProfit();
                           Gd_2DF = (Gd_2DF + ACBA::OrderSwap());
                           Gd_2DE = ((Gd_2DF + ACBA::OrderCommission()) + Gd_2DE);
                          }
                       }
                    }
                 }
               Gi_2E0 = Gi_2E0 - 1;
              }
            while(Gi_2E0 >= 0);
           }
         InglesTexto_INFO_txt20 = DoubleToString(Gd_2DE, 2);
         InglesEtiqueta_INFO_txt20 = "INFO_txt20";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt20, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_YDISTANCE, 195);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_CORNER, Gi_2DB);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt20, OBJPROP_TEXT, InglesTexto_INFO_txt20);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt20, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt20, OBJPROP_BACK, 0);

         Gi_2DF = 3;
         Gi_2E1 = -1;
         Gd_2E2 = 0;
         Gi_2E3 = ACBA::OrdersHistoryTotal() - 1;
         Gi_2E4 = Gi_2E3;
         if(Gi_2E3 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2E4, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2E3 = ACBA::OrderCloseTime();
                  if(Gl_2E3 >= ACBA::iTime(_Symbol, 10080, 0))
                    {
                     if(ACBA::OrderType() == Gi_2E1 || Gi_2E1 == -1)
                       {
                        Gd_2E3 = ACBA::OrderProfit();
                        Gd_2E3 = (Gd_2E3 + ACBA::OrderSwap());
                        Gd_2E2 = ((Gd_2E3 + ACBA::OrderCommission()) + Gd_2E2);
                       }
                    }
                 }
               Gi_2E4 = Gi_2E4 - 1;
              }
            while(Gi_2E4 >= 0);
           }
         InglesTexto_INFO_txt21 = DoubleToString(Gd_2E2, 2);
         InglesEtiqueta_INFO_txt21 = "INFO_txt21";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt21, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_YDISTANCE, 210);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_CORNER, Gi_2DF);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt21, OBJPROP_TEXT, InglesTexto_INFO_txt21);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt21, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt21, OBJPROP_BACK, 0);

         Gi_2E3 = 3;
         Gi_2E5 = -1;
         Gd_2E6 = 0;
         Gi_2E7 = ACBA::OrdersHistoryTotal() - 1;
         Gi_2E8 = Gi_2E7;
         if(Gi_2E7 >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2E8, 0, 1) && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  Gl_2E7 = ACBA::OrderCloseTime();
                  if(Gl_2E7 >= ACBA::iTime(_Symbol, 43200, 0))
                    {
                     if(ACBA::OrderType() == Gi_2E5 || Gi_2E5 == -1)
                       {
                        Gd_2E7 = ACBA::OrderProfit();
                        Gd_2E7 = (Gd_2E7 + ACBA::OrderSwap());
                        Gd_2E6 = ((Gd_2E7 + ACBA::OrderCommission()) + Gd_2E6);
                       }
                    }
                 }
               Gi_2E8 = Gi_2E8 - 1;
              }
            while(Gi_2E8 >= 0);
           }
         InglesTexto_INFO_txt22 = DoubleToString(Gd_2E6, 2);
         InglesEtiqueta_INFO_txt22 = "INFO_txt22";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt22, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_YDISTANCE, 225);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_CORNER, Gi_2E3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt22, OBJPROP_TEXT, InglesTexto_INFO_txt22);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt22, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt22, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line5 = "______________________________";
         InglesEtiqueta_INFO_Line5 = "INFO_Line5";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line5, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_YDISTANCE, 227);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line5, OBJPROP_TEXT, InglesTexto_INFO_Line5);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line5, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line5, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt23 = "Profits";
         InglesEtiqueta_INFO_txt23 = "INFO_txt23";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt23, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_YDISTANCE, 243);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt23, OBJPROP_TEXT, InglesTexto_INFO_txt23);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt23, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt23, OBJPROP_BACK, 0);

         InglesTexto_INFO_Line6 = "______________________________";
         InglesEtiqueta_INFO_Line6 = "INFO_Line6";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_Line6, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_YDISTANCE, 247);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line6, OBJPROP_TEXT, InglesTexto_INFO_Line6);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_Line6, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_Line6, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt24 = "";
         InglesEtiqueta_INFO_txt24 = "INFO_txt24";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt24, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_YDISTANCE, 263);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt24, OBJPROP_TEXT, InglesTexto_INFO_txt24);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt24, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_COLOR, ColorTextoTitulos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt24, OBJPROP_BACK, 0);

         InglesTexto_INFO_txt25 = "Profits for " + SimboloPrincipal;
         InglesTexto_INFO_txt25 = InglesTexto_INFO_txt25 + ":";
         InglesEtiqueta_INFO_txt25 = "INFO_txt25";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt25, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_XDISTANCE, 235);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_YDISTANCE, 268);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_CORNER, 3);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt25, OBJPROP_TEXT, InglesTexto_INFO_txt25);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt25, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_COLOR, ColorTextoLineas);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt25, OBJPROP_BACK, 0);

         Gi_2E7 = 3;
         str_186 = SimboloPrincipal;
         Gi_2E9 = -1;
         Gd_2EA = 0;
         Gi_2EB = ACBA::OrdersTotal() - 1;
         Gi_2EC = Gi_2EB;
         if(Gi_2EB >= 0)
           {
            do
              {
               if(ACBA::OrderSelect(Gi_2EC, 0, 0) && str_186 == ACBA::OrderSymbol() && ACBA::OrderMagicNumber() == NumeroMagico)
                 {
                  if(ACBA::OrderType() == Gi_2E9 || Gi_2E9 == -1)
                    {
                     Gd_2EB = ACBA::OrderProfit();
                     Gd_2EB = (Gd_2EB + ACBA::OrderSwap());
                     Gd_2EA = ((Gd_2EB + ACBA::OrderCommission()) + Gd_2EA);
                    }
                 }
               Gi_2EC = Gi_2EC - 1;
              }
            while(Gi_2EC >= 0);
           }
         InglesTexto_INFO_txt26 = DoubleToString(Gd_2EA, 2);
         InglesEtiqueta_INFO_txt26 = "INFO_txt26";
         ACBA::ObjectCreate(0, InglesEtiqueta_INFO_txt26, OBJ_LABEL, 0, 0, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_XDISTANCE, 85);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_YDISTANCE, 268);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_CORNER, Gi_2E7);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt26, OBJPROP_TEXT, InglesTexto_INFO_txt26);
         ACBA::ObjectSetString(0, InglesEtiqueta_INFO_txt26, OBJPROP_FONT, "Verdana");
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_FONTSIZE, TamanyoFuente);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_COLOR, ColorDatos);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_HIDDEN, 0);
         ACBA::ObjectSetInteger(0, InglesEtiqueta_INFO_txt26, OBJPROP_BACK, 0);
        }
     }

   if(ACBA::ObjectGetInteger(0, "TRADE_Button", OBJPROP_STATE, 0) != 0)
      return;

   if(Languale == 0)   // RUSO
     {
      RusoEtiquetaRectangulo_TRADE_fon = "TRADE_fon";
      if(ACBA::ObjectCreate(0, RusoEtiquetaRectangulo_TRADE_fon, OBJ_RECTANGLE_LABEL, 0, 0, 0))
        {
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_XDISTANCE, 15);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_YDISTANCE, 20);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_XSIZE, 200);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_YSIZE, 295);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_BGCOLOR, Ii_60);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_BORDER_TYPE, 2);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_CORNER, 0);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_COLOR, 17919);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, 8, 1);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_BACK, 0);
         ACBA::ObjectSetInteger(0, RusoEtiquetaRectangulo_TRADE_fon, OBJPROP_HIDDEN, 0);
        }

      RusoTexto_TRADE_Button = "TRADE";
      RusoBoton_TRADE_Button = "TRADE_Button";
      ACBA::ObjectCreate(0, RusoBoton_TRADE_Button, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_XDISTANCE, 5);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_YDISTANCE, 15);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_XSIZE, AnchoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_YSIZE, AltoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADE_Button, OBJPROP_TEXT, RusoTexto_TRADE_Button);
      ACBA::ObjectSetString(0, RusoBoton_TRADE_Button, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_BGCOLOR, ColorFondoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADE_Button, OBJPROP_BACK, 0);

      RusoTexto_TRADE_LOGO = "@VacaLoquiTa";
      RusoEtiqueta_TRADE_LOGO = "TRADE_LOGO";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_LOGO, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_XDISTANCE, 95);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_YDISTANCE, 25);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_TEXT, RusoTexto_TRADE_LOGO);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_LOGO, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line = "___________________________";
      RusoEtiqueta_TRADE_Line = "TRADE_Line";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_YDISTANCE, 28);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line, OBJPROP_TEXT, RusoTexto_TRADE_Line);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line2 = "___________________________";
      RusoEtiqueta_TRADE_Line2 = "TRADE_Line2";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line2, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_YDISTANCE, 66);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line2, OBJPROP_TEXT, RusoTexto_TRADE_Line2);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line2, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line2, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line3 = "___________________________";
      RusoEtiqueta_TRADE_Line3 = "TRADE_Line3";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line3, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_YDISTANCE, 126);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line3, OBJPROP_TEXT, RusoTexto_TRADE_Line3);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line3, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line3, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line4 = "___________________________";
      RusoEtiqueta_TRADE_Line4 = "TRADE_Line4";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line4, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_YDISTANCE, 146);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line4, OBJPROP_TEXT, RusoTexto_TRADE_Line4);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line4, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line4, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line5 = "___________________________";
      RusoEtiqueta_TRADE_Line5 = "TRADE_Line5";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line5, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_YDISTANCE, 168);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line5, OBJPROP_TEXT, RusoTexto_TRADE_Line5);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line5, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line5, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line6 = "___________________________";
      RusoEtiqueta_TRADE_Line6 = "TRADE_Line6";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line6, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_YDISTANCE, 188);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line6, OBJPROP_TEXT, RusoTexto_TRADE_Line6);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line6, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line6, OBJPROP_BACK, 0);

      RusoTexto_TRADE_Line7 = "___________________________";
      RusoEtiqueta_TRADE_Line7 = "TRADE_Line7";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_Line7, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_YDISTANCE, 286);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line7, OBJPROP_TEXT, RusoTexto_TRADE_Line7);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_Line7, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_Line7, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt = "Operar con el símbolo: ";
      RusoEtiqueta_TRADE_txt = "TRADE_txt";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_YDISTANCE, 44);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt, OBJPROP_TEXT, RusoTexto_TRADE_txt);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_COLOR, ColorTextoTitulos);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt1 = SimboloActivoEnGrafico;
      RusoEtiqueta_TRADE_txt1 = "TRADE_txt1";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt1, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_XDISTANCE, 156);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_YDISTANCE, 44);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt1, OBJPROP_TEXT, RusoTexto_TRADE_txt1);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt1, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt1, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_P1 = "1";
      RusoBoton_TRADEs_P1 = "TRADEs_P1";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_P1, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_XDISTANCE, 21);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_YDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_XSIZE, 35);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P1, OBJPROP_TEXT, RusoTexto_TRADEs_P1);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P1, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P1, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_P2 = "2";
      RusoBoton_TRADEs_P2 = "TRADEs_P2";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_P2, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_XDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_YDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_XSIZE, 35);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P2, OBJPROP_TEXT, RusoTexto_TRADEs_P2);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P2, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P2, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_P3 = "3";
      RusoBoton_TRADEs_P3 = "TRADEs_P3";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_P3, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_XDISTANCE, 99);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_YDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_XSIZE, 35);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P3, OBJPROP_TEXT, RusoTexto_TRADEs_P3);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P3, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P3, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_P4 = "4";
      RusoBoton_TRADEs_P4 = "TRADEs_P4";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_P4, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_XDISTANCE, 137);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_YDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_XSIZE, 35);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P4, OBJPROP_TEXT, RusoTexto_TRADEs_P4);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P4, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P4, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_P5 = "5";
      RusoBoton_TRADEs_P5 = "TRADEs_P5";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_P5, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_XDISTANCE, 175);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_YDISTANCE, 60);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_XSIZE, 35);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P5, OBJPROP_TEXT, RusoTexto_TRADEs_P5);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_P5, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_P5, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt2 = "Cerrar Órdenes beneficio: ";
      RusoEtiqueta_TRADE_txt2 = "TRADE_txt2";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt2, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_YDISTANCE, 82);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt2, OBJPROP_TEXT, RusoTexto_TRADE_txt2);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt2, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt2, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_CIERRA_ORDENES_CON_BENEFICIO = "";
      RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO = "TRADEs_CIERRA_ORDENES_CON_BENEFICIO";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_YDISTANCE, 82);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_TEXT, RusoTexto_TRADEs_CIERRA_ORDENES_CON_BENEFICIO);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_BENEFICIO, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt3 = "Cerrar órdenes con Pérdidas: ";
      RusoEtiqueta_TRADE_txt3 = "TRADE_txt3";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt3, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_YDISTANCE, 101);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt3, OBJPROP_TEXT, RusoTexto_TRADE_txt3);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt3, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt3, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_CIERRA_ORDENES_CON_PERDIDAS = "";
      RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS = "TRADEs_CIERRA_ORDENES_CON_PERDIDAS";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_YDISTANCE, 101);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_TEXT, RusoTexto_TRADEs_CIERRA_ORDENES_CON_PERDIDAS);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_ORDENES_CON_PERDIDAS, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt4 = "Cerrar todo del par: ";
      RusoEtiqueta_TRADE_txt4 = "TRADE_txt4";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt4, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_YDISTANCE, 120);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt4, OBJPROP_TEXT, RusoTexto_TRADE_txt4);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt4, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt4, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_CIERRA_SIMBOLO_SELECCIONADO = "";
      RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO = "TRADEs_CIERRA_SIMBOLO_SELECCIONADO";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_YDISTANCE, 120);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_TEXT, RusoTexto_TRADEs_CIERRA_SIMBOLO_SELECCIONADO);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CIERRA_SIMBOLO_SELECCIONADO, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt5 = "Operar con beneficio total";
      RusoEtiqueta_TRADE_txt5 = "TRADE_txt5";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt5, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_YDISTANCE, 142);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt5, OBJPROP_TEXT, RusoTexto_TRADE_txt5);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt5, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_COLOR, ColorTextoTitulos);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt5, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt6 = "Cerrar TODAS las órdenes: ";
      RusoEtiqueta_TRADE_txt6 = "TRADE_txt6";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt6, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_YDISTANCE, 162);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt6, OBJPROP_TEXT, RusoTexto_TRADE_txt6);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt6, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt6, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_CERRAR_TODO = "";
      RusoBoton_TRADEs_CERRAR_TODO = "TRADEs_CERRAR_TODO";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_CERRAR_TODO, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_YDISTANCE, 162);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_TEXT, RusoTexto_TRADEs_CERRAR_TODO);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_TODO, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt7 = "Configuración Trading";
      RusoEtiqueta_TRADE_txt7 = "TRADE_txt7";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt7, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_YDISTANCE, 184);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt7, OBJPROP_TEXT, RusoTexto_TRADE_txt7);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt7, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_COLOR, ColorTextoTitulos);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt7, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt8 = "Auto Trade: ";
      RusoEtiqueta_TRADE_txt8 = "TRADE_txt8";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt8, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_YDISTANCE, 205);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt8, OBJPROP_TEXT, RusoTexto_TRADE_txt8);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt8, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt8, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_AUTOTRADE = "";
      RusoBoton_TRADEs_AUTOTRADE = "TRADEs_AUTOTRADE";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_AUTOTRADE, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_YDISTANCE, 204);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_TEXT, RusoTexto_TRADEs_AUTOTRADE);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_AUTOTRADE, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt9 = "Rejilla +: ";
      RusoEtiqueta_TRADE_txt9 = "TRADE_txt9";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt9, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_YDISTANCE, 223);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt9, OBJPROP_TEXT, RusoTexto_TRADE_txt9);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt9, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt9, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_REJILLA_MAS = "";
      RusoBoton_TRADEs_REJILLA_MAS = "TRADEs_REJILLA_MAS";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_REJILLA_MAS, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_YDISTANCE, 223);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_TEXT, RusoTexto_TRADEs_REJILLA_MAS);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MAS, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt10 = "Rejilla -: ";
      RusoEtiqueta_TRADE_txt10 = "TRADE_txt10";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt10, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_YDISTANCE, 242);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt10, OBJPROP_TEXT, RusoTexto_TRADE_txt10);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt10, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt10, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_REJILLA_MENOS = "";
      RusoBoton_TRADEs_REJILLA_MENOS = "TRADEs_REJILLA_MENOS";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_YDISTANCE, 242);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_TEXT, RusoTexto_TRADEs_REJILLA_MENOS);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_REJILLA_MENOS, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt11 = "Trading Mobile: ";
      RusoEtiqueta_TRADE_txt11 = "TRADE_txt11";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt11, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_YDISTANCE, 261);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt11, OBJPROP_TEXT, RusoTexto_TRADE_txt11);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt11, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt11, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_TRADING_MOBILE = "";
      RusoBoton_TRADEs_TRADING_MOBILE = "TRADEs_TRADING_MOBILE";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_YDISTANCE, 261);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_TEXT, RusoTexto_TRADEs_TRADING_MOBILE);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_TRADING_MOBILE, OBJPROP_BACK, 0);

      RusoTexto_TRADE_txt12 = "Cerrar en Hora FIN dia: ";
      RusoEtiqueta_TRADE_txt12 = "TRADE_txt12";
      ACBA::ObjectCreate(0, RusoEtiqueta_TRADE_txt12, OBJ_LABEL, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_XDISTANCE, 20);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_YDISTANCE, 280);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt12, OBJPROP_TEXT, RusoTexto_TRADE_txt12);
      ACBA::ObjectSetString(0, RusoEtiqueta_TRADE_txt12, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_COLOR, ColorTextoLineas);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoEtiqueta_TRADE_txt12, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_CERRAR_EN_HORA_FIN = "";
      RusoBoton_TRADEs_CERRAR_EN_HORA_FIN = "TRADEs_CERRAR_EN_HORA_FIN";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_XDISTANCE, 160);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_YDISTANCE, 280);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_XSIZE, 50);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_YSIZE, 17);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_TEXT, RusoTexto_TRADEs_CERRAR_EN_HORA_FIN);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_BGCOLOR, ColorFondoBotonOFF);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_CERRAR_EN_HORA_FIN, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_B = "BUY           " + DoubleToString(LotajeSimboloPrincipal, DigitosDecimalesSimboloPrincipal);
      RusoBoton_TRADEs_B = "TRADEs_B";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_B, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_XDISTANCE, 13);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_YDISTANCE, 302);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_XSIZE, 100);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_YSIZE, 22);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_B, OBJPROP_TEXT, RusoTexto_TRADEs_B);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_B, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_COLOR, ColorTextoBotonesBuySell);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_BGCOLOR, ColorBotonBUY);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_B, OBJPROP_BACK, 0);

      RusoTexto_TRADEs_S = "SELL           " + DoubleToString(LotajeSimboloPrincipal, DigitosDecimalesSimboloPrincipal);
      RusoBoton_TRADEs_S = "TRADEs_S";
      ACBA::ObjectCreate(0, RusoBoton_TRADEs_S, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_XDISTANCE, 118);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_YDISTANCE, 302);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_XSIZE, 100);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_YSIZE, 22);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_S, OBJPROP_TEXT, RusoTexto_TRADEs_S);
      ACBA::ObjectSetString(0, RusoBoton_TRADEs_S, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_FONTSIZE, Ii_64);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_COLOR, ColorTextoBotonesBuySell);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_BGCOLOR, ColorBotonSELL);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, RusoBoton_TRADEs_S, OBJPROP_BACK, 0);
     }
//printf("OBJPROP_HIDDEN: "+OBJPROP_HIDDEN);

   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_TEXT, TextoOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_TEXT, TextoON);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_TEXT, TextoOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_TEXT, TextoON);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_TEXT, TextoOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_TEXT, TextoON);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_CERRAR_TODO", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_CERRAR_TODO", OBJPROP_TEXT, TextoOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_CERRAR_TODO", OBJPROP_TEXT, TextoON);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_AUTOTRADE", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_AUTOTRADE", OBJPROP_TEXT, TextoON);
      ACBA::ObjectSetInteger(0, "TRADEs_AUTOTRADE", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_AUTOTRADE", OBJPROP_TEXT, TextoOFF);
      ACBA::ObjectSetInteger(0, "TRADEs_AUTOTRADE", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_REJILLA_MAS", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_REJILLA_MAS", OBJPROP_TEXT, TextoON);
      ACBA::ObjectSetInteger(0, "TRADEs_REJILLA_MAS", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_REJILLA_MAS", OBJPROP_TEXT,  TextoOFF);
      ACBA::ObjectSetInteger(0, "TRADEs_REJILLA_MAS", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_REJILLA_MENOS", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_REJILLA_MENOS", OBJPROP_TEXT,TextoON);
      ACBA::ObjectSetInteger(0, "TRADEs_REJILLA_MENOS", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_REJILLA_MENOS", OBJPROP_TEXT, TextoOFF);
      ACBA::ObjectSetInteger(0, "TRADEs_REJILLA_MENOS", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }

   if(ACBA::ObjectGetInteger(0, "TRADEs_TRADING_MOBILE", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_TRADING_MOBILE", OBJPROP_TEXT, TextoOFF);
      ACBA::ObjectSetInteger(0, "TRADEs_TRADING_MOBILE", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_TRADING_MOBILE", OBJPROP_TEXT, TextoON);
      ACBA::ObjectSetInteger(0, "TRADEs_TRADING_MOBILE", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_STATE, 0) == 0)
     {
      ACBA::ObjectSetString(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_TEXT, TextoOFF);
      ACBA::ObjectSetInteger(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   else
     {
      ACBA::ObjectSetString(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_TEXT, TextoON);
      ACBA::ObjectSetInteger(0, "TRADEs_CERRAR_EN_HORA_FIN", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_BGCOLOR, ColorFondoBoton);
      return;
     }
   ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ACBA::ObjectsDeleteAll(NULL, 23);
   EventKillTimer();
   ACBA::ObjectsDeleteAll(NULL, 25);
   ACBA::ObjectsDeleteAll(NULL, 27);
   ACBA::ObjectsDeleteAll(NULL, 28);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   ACBA::RefreshRates();
   OnTick();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  {
   string Texto_SVERNUT_;
   string Boton_SVERNUT_;
   string Texto_SVERNUTt_;
   string Boton_SVERNUTt_;
   string info;
   string str_4;
   string str_5;
   string str_6;
   string str_7;
   string str_8;
   string BotonPulsado;

   if(ACBA::ObjectGetInteger(0, "INFO", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectsDeleteAll("INFO_", -1, 28);
      ACBA::ObjectsDeleteAll("INFO", -1, 23);
      Texto_SVERNUT_ = "INFO_";
      Boton_SVERNUT_ = "SVERNUT_";
      ACBA::ObjectCreate(0, Boton_SVERNUT_, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_XDISTANCE, 70);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_YDISTANCE, 15);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_XSIZE, AnchoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_YSIZE, AltoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_CORNER, 3);
      ACBA::ObjectSetString(0, Boton_SVERNUT_, OBJPROP_TEXT, Texto_SVERNUT_);
      ACBA::ObjectSetString(0, Boton_SVERNUT_, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_BGCOLOR, Ii_74);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, Boton_SVERNUT_, OBJPROP_BACK, 0);
     }
   if(ACBA::ObjectGetInteger(0, "SVERNUT_", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectsDeleteAll("INFO", -1, 25);
      ACBA::ObjectsDeleteAll("SVERNUT_", -1, 25);
     }
   if(ACBA::ObjectGetInteger(0, "TRADE_Button", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectsDeleteAll("TRADE", -1, 28);
      ACBA::ObjectsDeleteAll("TRADE", -1, 25);
      ACBA::ObjectsDeleteAll("TRADE", -1, 23);
      ACBA::ObjectsDeleteAll("TRADE", -1, 27);
      Texto_SVERNUTt_ = "TRADE";
      Boton_SVERNUTt_ = "SVERNUTt_";
      ACBA::ObjectCreate(0, Boton_SVERNUTt_, OBJ_BUTTON, 0, 0, 0);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_XDISTANCE, 5);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_YDISTANCE, 15);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_XSIZE, AnchoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_YSIZE, AltoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_CORNER, 0);
      ACBA::ObjectSetString(0, Boton_SVERNUTt_, OBJPROP_TEXT, Texto_SVERNUTt_);
      ACBA::ObjectSetString(0, Boton_SVERNUTt_, OBJPROP_FONT, "Verdana");
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_FONTSIZE, TamanyoFuente);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_COLOR, ColorTextoBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_BGCOLOR, Ii_74);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_BORDER_COLOR, ColorBordeBoton);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_HIDDEN, 0);
      ACBA::ObjectSetInteger(0, Boton_SVERNUTt_, OBJPROP_BACK, 0);
     }
   if(ACBA::ObjectGetInteger(0, "SVERNUTt_", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectsDeleteAll("TRADE", -1, 25);
      ACBA::ObjectsDeleteAll("SVERNUTt_", -1, 25);
     }
   if(ACBA::ObjectGetInteger(0,"TRADEs_B", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_B", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_B", OBJPROP_BGCOLOR, ColorBotonBUY);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_S", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_S", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_S", OBJPROP_BGCOLOR, ColorBotonSELL);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(ACBA::ObjectGetInteger(0, "TRADEs_CERRAR_TODO", OBJPROP_STATE, 0) != 0)
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CERRAR_TODO", OBJPROP_BGCOLOR, ColorFondoBoton);
     }
   else
     {
      ACBA::ObjectSetInteger(0, "TRADEs_CERRAR_TODO", OBJPROP_BGCOLOR, ColorFondoBotonOFF);
     }
   if(id != 1)
      return;

   BotonPulsado = sparam;

   if(BotonPulsado == "TRADEs_B")
     {
      OrdenEnviada = ACBA::OrderSend(SimboloActivoEnGrafico, 0, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloActivoEnGrafico, MODE_ASK), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 32768);
      ACBA::ObjectSetInteger(0, "TRADEs_B", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_S")
     {
      OrdenEnviada = ACBA::OrderSend(SimboloActivoEnGrafico, 1, LotajeSimboloPrincipal, ACBA::MarketInfo(SimboloActivoEnGrafico, MODE_BID), 10, 0, 0, ComentarioEA, NumeroMagico, 0, 17919);
      ACBA::ObjectSetInteger(0, "TRADEs_S", OBJPROP_STATE, 0);
     }

   if(BotonPulsado == "TRADEs_CIERRA_ORDENES_CON_BENEFICIO")
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_TEXT, TextoON);
      str_4 = SimboloActivoEnGrafico;
      Gi_0 = ACBA::OrdersTotal() - 1;
      Gi_1 = Gi_0;
      if(Gi_0 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_1, 0, 0) && ACBA::OrderSymbol() == str_4 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               BeneficioObjetivoSimboloPrincipal = ACBA::OrderProfit();
               BeneficioObjetivoSimboloPrincipal = (BeneficioObjetivoSimboloPrincipal + ACBA::OrderCommission());
               if(((BeneficioObjetivoSimboloPrincipal + ACBA::OrderSwap()) > 0))
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_4, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_4, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
              }
            Gi_1 = Gi_1 - 1;
           }
         while(Gi_1 >= 0);
        }
      ACBA::ObjectsDeleteAll(NULL, 22);
      ACBA::ObjectsDeleteAll(NULL, 2);
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_BENEFICIO", OBJPROP_STATE, 0);
     }

   if(BotonPulsado == "TRADEs_CIERRA_ORDENES_CON_PERDIDAS")
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_TEXT, TextoON);
      str_5 = SimboloActivoEnGrafico;
      Gi_5 = ACBA::OrdersTotal() - 1;
      Gi_6 = Gi_5;
      if(Gi_5 >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_6, 0, 0) && ACBA::OrderSymbol() == str_5 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               Gd_5 = ACBA::OrderProfit();
               Gd_5 = (Gd_5 + ACBA::OrderCommission());
               if(((Gd_5 + ACBA::OrderSwap()) < 0))
                 {
                  if(ACBA::OrderType() == OP_BUY)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_5, MODE_BID), _Digits), 10, 16777215);
                    }
                  if(ACBA::OrderType() == OP_SELL)
                    {
                     ACBA::RefreshRates();
                     OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_5, MODE_ASK), _Digits), 10, 16777215);
                    }
                 }
              }
            Gi_6 = Gi_6 - 1;
           }
         while(Gi_6 >= 0);
        }
      ACBA::ObjectsDeleteAll(NULL, 22);
      ACBA::ObjectsDeleteAll(NULL, 2);
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_ORDENES_CON_PERDIDAS", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_CIERRA_SIMBOLO_SELECCIONADO")
     {
      ACBA::ObjectSetString(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_TEXT, TextoON);
      str_6 = SimboloActivoEnGrafico;
      Gi_A = ACBA::OrdersTotal() - 1;
      Gi_B = Gi_A;
      if(Gi_A >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_B, 0, 0) && ACBA::OrderSymbol() == str_6 && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(ACBA::OrderType() == OP_BUY)
                 {
                  ACBA::RefreshRates();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_6, MODE_BID), _Digits), 10, 16777215);
                 }
               if(ACBA::OrderType() == OP_SELL)
                 {
                  ACBA::RefreshRates();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_6, MODE_ASK), _Digits), 10, 16777215);
                 }
              }
            Gi_B = Gi_B - 1;
           }
         while(Gi_B >= 0);
        }
      ACBA::ObjectsDeleteAll(NULL, 22);
      ACBA::ObjectsDeleteAll(NULL, 2);
      ACBA::ObjectSetInteger(0, "TRADEs_CIERRA_SIMBOLO_SELECCIONADO", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_CERRAR_TODO")
     {
      ACBA::ObjectSetString(0, "TRADEs_CERRAR_TODO", OBJPROP_TEXT, TextoON);
      Gi_F = ACBA::OrdersTotal() - 1;
      Gi_10 = Gi_F;
      if(Gi_F >= 0)
        {
         do
           {
            if(ACBA::OrderSelect(Gi_10, 0, 0) && ACBA::OrderMagicNumber() == NumeroMagico)
              {
               if(ACBA::OrderType() == OP_BUY)
                 {
                  ACBA::RefreshRates();
                  str_7 = ACBA::OrderSymbol();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_7, MODE_BID), _Digits), 10, 16777215);
                 }
               if(ACBA::OrderType() == OP_SELL)
                 {
                  ACBA::RefreshRates();
                  str_8 = ACBA::OrderSymbol();
                  OrdenCierre = ACBA::OrderClose(ACBA::OrderTicket(), ACBA::OrderLots(), NormalizeDouble(ACBA::MarketInfo(str_8, MODE_ASK), _Digits), 10, 16777215);
                 }
              }
            Gi_10 = Gi_10 - 1;
           }
         while(Gi_10 >= 0);
        }
      ACBA::ObjectsDeleteAll(NULL, 22);
      ACBA::ObjectsDeleteAll(NULL, 2);
      ACBA::ObjectSetInteger(0, "TRADEs_CERRAR_TODO", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P1")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P2")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P3")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P4")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P5")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P6")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P7")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P8")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P9", OBJPROP_STATE, 0);
     }
   if(BotonPulsado == "TRADEs_P9")
     {
      ACBA::ObjectSetInteger(0, "TRADEs_P2", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P3", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P4", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P5", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P6", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P7", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P8", OBJPROP_STATE, 0);
      ACBA::ObjectSetInteger(0, "TRADEs_P1", OBJPROP_STATE, 0);
     }
   ChartRedraw(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ContadorDeOrdenes(int NumeroMagicoContador, string SimboloContador, int TipoOrdenContador)
  {
   int MiNumeroMagico = NumeroMagicoContador;
   string MiSimbolo = SimboloContador;
   int MiTipoOrden = TipoOrdenContador;
   int NumeroDeOrdenes = 0;
   int TotalOrdenes = ACBA::OrdersTotal() - 1;
   int BucleOrdenes = TotalOrdenes;
   if(TotalOrdenes >= 0)
     {
      do
        {
         if(ACBA::OrderSelect(BucleOrdenes, 0, 0) && ACBA::OrderSymbol() == MiSimbolo && MiNumeroMagico == ACBA::OrderMagicNumber())
           {
            if(MiTipoOrden == -1 || ACBA::OrderType() == MiTipoOrden)
              {
               NumeroDeOrdenes = NumeroDeOrdenes + 1;
              }
           }
         BucleOrdenes = BucleOrdenes - 1;
        }
      while(BucleOrdenes >= 0);
     }

   return NumeroDeOrdenes;
  }

//== fxDreema MQL4 to MQL5 Converter ==//

//-- Global Variables
int FXD_SELECTED_TYPE = 0;// Indicates what is selected by OrderSelect, 1 for trade, 2 for pending order, 3 for history trade
ulong FXD_SELECTED_TICKET = 0;// The ticket number selected by OrderSelect
int FXD_INDICATOR_COUNTED_MEMORY = 0;// Used as a memory for IndicatorCounted() function. It needs to be outside of the function, because when OnCalculate needs to be reset, this memory must be reset as well.

// Set the missing predefined variables, which are controlled by RefreshRates
int Bars     = Bars(_Symbol, PERIOD_CURRENT);
int Digits   = _Digits;
double Point = _Point;
double Ask, Bid, Close[], High[], Low[], Open[];
long Volume[];
datetime Time[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   ACBA::RefreshRates();
   __OnTick__();
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class ACBA
  {
private:
   /**
   * _LastError is used to set custom errors that could be returned by the custom GetLastError method
   * The initial value should be -1 and everything >= 0 should be valid error code
   * When setting an error code in it, it should be the MQL5 value,
   * because then in GetLastError it will be converted to MQL4 value
   */
   static int        _LastError;
public:
                     ACBA()
     {

     };

   static double     AccountBalance()
     {
      return ::AccountInfoDouble(ACCOUNT_BALANCE);
     }

   static double     AccountEquity()
     {
      return ::AccountInfoDouble(ACCOUNT_EQUITY);
     }

   static double     AccountFreeMargin()
     {
      return ::AccountInfoDouble(ACCOUNT_MARGIN_FREE);
     }

   static double     AccountFreeMarginCheck(string symbol, int cmd, double volume)
     {
      MqlTick last_tick;

      if(::SymbolInfoTick(symbol, last_tick))
        {
         double freeMargin = ::AccountInfoDouble(ACCOUNT_MARGIN_FREE);
         double margin = 0.0;

         if(::OrderCalcMargin((ENUM_ORDER_TYPE)cmd, symbol, volume, ((cmd==0) ? last_tick.ask : last_tick.bid), margin))
           {
            return (freeMargin - margin);
           }
        }

      return 0;
     }

   static double     AccountMargin()
     {
      return ::AccountInfoDouble(ACCOUNT_MARGIN);
     }

   static bool       IsTesting()
     {
      return (bool)::MQLInfoInteger(MQL_TESTER);
     }

   static double     MarketInfo(string symbol, int type)
     {
      // For most cases below this is not needed, but OrderCalcMargin() returns error 5040 (Damaged parameter of string type) if the symbol is NULL
      if(symbol == NULL)
         symbol = ::Symbol();

      switch(type)
        {
         case 1 /* MODE_LOW                */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_LASTLOW);
         case 2 /* MODE_HIGH               */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_LASTHIGH);
         case 5 /* MODE_TIME               */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_TIME);
         case 9 /* MODE_BID                */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_BID);
         case 10 /* MODE_ASK               */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_ASK);
         case 11 /* MODE_POINT             */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_POINT);
         case 12 /* MODE_DIGITS            */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_DIGITS);
         case 13 /* MODE_SPREAD            */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_SPREAD);
         case 14 /* MODE_STOPLEVEL         */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_TRADE_STOPS_LEVEL);
         case 15 /* MODE_LOTSIZE           */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_TRADE_CONTRACT_SIZE);
         case 16 /* MODE_TICKVALUE         */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
         case 17 /* MODE_TICKSIZE          */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE);
         case 18 /* MODE_SWAPLONG          */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_SWAP_LONG);
         case 19 /* MODE_SWAPSHORT         */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_SWAP_SHORT);
         case 20 /* MODE_STARTING          */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_START_TIME);
         case 21 /* MODE_EXPIRATION        */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_EXPIRATION_TIME);
         case 22 /* MODE_TRADEALLOWED      */ :
            return (::SymbolInfoInteger(symbol, SYMBOL_TRADE_MODE) != SYMBOL_TRADE_MODE_DISABLED);
         case 23 /* MODE_MINLOT            */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_VOLUME_MIN);
         case 24 /* MODE_LOTSTEP           */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);
         case 25 /* MODE_MAXLOT            */ :
            return ::SymbolInfoDouble(symbol, SYMBOL_VOLUME_MAX);
         case 26 /* MODE_SWAPTYPE          */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_SWAP_MODE);
         case 27 /* MODE_PROFITCALCMODE    */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_TRADE_CALC_MODE);
         case 28 /* MODE_MARGINCALCMODE    */ :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_TRADE_CALC_MODE);
         case 29 /* MODE_MARGININIT        */ :
            return (double)::SymbolInfoDouble(symbol, SYMBOL_MARGIN_INITIAL);
         case 30 /* MODE_MARGINMAINTENANCE */ :
            return (double)::SymbolInfoDouble(symbol, SYMBOL_MARGIN_MAINTENANCE);
         case 31 /* MODE_MARGINHEDGED      */ :
            return (double)::SymbolInfoDouble(symbol, SYMBOL_MARGIN_HEDGED);
         case 32 /* MODE_MARGINREQUIRED    */ :
           {
            // Free margin required to open 1 lot for buying
            double margin = 0.0;

            if(::OrderCalcMargin(ORDER_TYPE_BUY, symbol, 1, ::SymbolInfoDouble(symbol, SYMBOL_ASK), margin))
               return margin;
            else
               return 0.0;
           }
         case 33 /* MODE_FREEZELEVEL */     :
            return (double)::SymbolInfoInteger(symbol, SYMBOL_TRADE_FREEZE_LEVEL);
         case 34 /* MODE_CLOSEBY_ALLOWED */ :
            return 0.0;
        }

      return 0.0;
     }

   static bool       ObjectCreate(
      long chart_id, string object_name, ENUM_OBJECT object_type, int sub_window,
      datetime time1, double price1,
      datetime time2 = 0, double price2 = 0,
      datetime time3 = 0, double price3 = 0,
      datetime time4 = 0, double price4 = 0,
      datetime time5 = 0, double price5 = 0,
      datetime time6 = 0, double price6 = 0,
      datetime time7 = 0, double price7 = 0,
      datetime time8 = 0, double price8 = 0,
      datetime time9 = 0, double price9 = 0,
      datetime time10 = 0, double price10 = 0,
      datetime time11 = 0, double price11 = 0,
      datetime time12 = 0, double price12 = 0,
      datetime time13 = 0, double price13 = 0,
      datetime time14 = 0, double price14 = 0,
      datetime time15 = 0, double price15 = 0,
      datetime time16 = 0, double price16 = 0,
      datetime time17 = 0, double price17 = 0,
      datetime time18 = 0, double price18 = 0,
      datetime time19 = 0, double price19 = 0,
      datetime time20 = 0, double price20 = 0,
      datetime time21 = 0, double price21 = 0,
      datetime time22 = 0, double price22 = 0,
      datetime time23 = 0, double price23 = 0,
      datetime time24 = 0, double price24 = 0,
      datetime time25 = 0, double price25 = 0,
      datetime time26 = 0, double price26 = 0,
      datetime time27 = 0, double price27 = 0,
      datetime time28 = 0, double price28 = 0,
      datetime time29 = 0, double price29 = 0
   )
     {
      return (bool)::ObjectCreate(
                chart_id, object_name, object_type, sub_window,
                time1, price1,
                time2, price2,
                time3, price3,
                time4, price4,
                time5, price5,
                time6, price6,
                time7, price7,
                time8, price8,
                time9, price9,
                time10, price10,
                time11, price11,
                time12, price12,
                time13, price13,
                time14, price14,
                time15, price15,
                time16, price16,
                time17, price17,
                time18, price18,
                time19, price19,
                time20, price20,
                time21, price21,
                time22, price22,
                time23, price23,
                time24, price24,
                time25, price25,
                time26, price26,
                time27, price27,
                time28, price28,
                time29, price29
             );
     }

   static bool       ObjectCreate(
      string object_name, ENUM_OBJECT object_type, int sub_window,
      datetime time1, double price1,
      datetime time2 = 0, double price2 = 0,
      datetime time3 = 0, double price3 = 0
   )
     {
      return (bool)::ObjectCreate(0, object_name, object_type, sub_window, time1, price1, time2, price2, time3, price3);
     }

   /**
   * In MQL5 the names of the constants in ENUM_OBJECT_PROPERTY_* are pretty much the same as in MQL4, so when constants are used the functions below will serve
   */
   static long       ObjectGetInteger(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_INTEGER prop_id, int prop_modifier = 0)
     {
      return ::ObjectGetInteger(chart_id, object_name, prop_id, prop_modifier);
     }
   static bool       ObjectGetInteger(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_INTEGER prop_id, int prop_modifier, long & long_var)
     {
      return ::ObjectGetInteger(chart_id, object_name, prop_id, prop_modifier, long_var);
     }
   /**
   * These overloads are used just in case when integer value is passed to prop_id.
   * It's presumed that this integer value is what represents the enumeration constants in MQL4, which representation is different in MQL5.
   */
   static long       ObjectGetInteger(long chart_id, const string object_name, int prop_id, int prop_modifier = 0)
     {
      ENUM_OBJECT_PROPERTY_INTEGER propID;

      switch(prop_id)
        {
         case 0 /* OBJPROP_PRICE1 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 0;
            break;
         case 2 /* OBJPROP_PRICE2 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 1;
            break;
         case 4 /* OBJPROP_PRICE3 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 2;
            break;
         default :
           {
            propID = ACBA::_ConvertEnumObjectPropertyInteger_(prop_id);
           }
        }

      if(propID == -1)
         return 0;

      return ::ObjectGetInteger(chart_id, object_name, propID, prop_modifier);
     }
   static bool       ObjectGetInteger(long chart_id, const string object_name, int prop_id, int prop_modifier, long & long_var)
     {
      ENUM_OBJECT_PROPERTY_INTEGER propID;

      switch(prop_id)
        {
         case 0 /* OBJPROP_PRICE1 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 0;
            break;
         case 2 /* OBJPROP_PRICE2 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 1;
            break;
         case 4 /* OBJPROP_PRICE3 */ :
            propID = OBJPROP_TIME;
            prop_modifier = 2;
            break;
         default :
           {
            propID = ACBA::_ConvertEnumObjectPropertyInteger_(prop_id);
           }
        }

      if(propID == -1)
        {
         long_var = 0;
         return true;
        }

      return ::ObjectGetInteger(chart_id, object_name, propID, prop_modifier, long_var);
     }

   /**
   * These overloads are used just in case when integer value is passed to prop_id.
   * It's presumed that this integer value is what represents the enumeration constants in MQL4, which representation is different in MQL5.
   */
   static bool       ObjectSetInteger(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_INTEGER prop_id, long prop_value)
     {
      return ::ObjectSetInteger(chart_id, object_name, prop_id, prop_value);
     }
   static bool       ObjectSetInteger(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_INTEGER prop_id, int prop_modifier, long prop_value)
     {
      return ::ObjectSetInteger(chart_id, object_name, prop_id, prop_modifier, prop_value);
     }
   static bool       ObjectSetInteger(long chart_id, const string object_name, int prop_id, long prop_value)
     {
      ENUM_OBJECT_PROPERTY_INTEGER propID = ACBA::_ConvertEnumObjectPropertyInteger_(prop_id);
      if(propID == -1)
         return false;

      return ::ObjectSetInteger(chart_id, object_name, propID, prop_value);
     }
   static bool       ObjectSetInteger(long chart_id, const string object_name, int prop_id, int prop_modifier, long prop_value)
     {
      ENUM_OBJECT_PROPERTY_INTEGER propID = ACBA::_ConvertEnumObjectPropertyInteger_(prop_id);
      if(propID == -1)
         return false;

      return ::ObjectSetInteger(chart_id, object_name, propID, prop_modifier, prop_value);
     }

   /**
   * These overloads are used just in case when integer value is passed to prop_id.
   * It's presumed that this integer value is what represents the enumeration constants in MQL4, which representation is different in MQL5.
   */
   static bool       ObjectSetString(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_STRING prop_id, string prop_value)
     {
      return ::ObjectSetString(chart_id, object_name, prop_id, prop_value);
     }
   static bool       ObjectSetString(long chart_id, const string object_name, ENUM_OBJECT_PROPERTY_STRING prop_id, int prop_modifier, string prop_value)
     {
      return ::ObjectSetString(chart_id, object_name, prop_id, prop_modifier, prop_value);
     }
   static bool       ObjectSetString(long chart_id, const string object_name, int prop_id, string prop_value)
     {
      ENUM_OBJECT_PROPERTY_STRING propID = ACBA::_ConvertEnumObjectPropertyString_(prop_id);
      if(propID == -1)
         return true;

      return ::ObjectSetString(chart_id, object_name, propID, prop_value);
     }
   static bool       ObjectSetString(long chart_id, const string object_name, int prop_id, int prop_modifier, string prop_value)
     {
      ENUM_OBJECT_PROPERTY_STRING propID = ACBA::_ConvertEnumObjectPropertyString_(prop_id);
      if(propID == -1)
         return true;

      return ::ObjectSetString(chart_id, object_name, propID, prop_modifier, prop_value);
     }

   static int        ObjectsDeleteAll(const string prefix,int sub_window = -1, int object_type = -1)
     {
      return ::ObjectsDeleteAll(0, prefix, sub_window, object_type);
     }

   static bool       OrderClose(long ticket, double lots, double price, int slippage, color arrow_color = clrNONE)
     {
      // ticket is actually position id, so find the position by its id
      int positionsTotal = ::PositionsTotal();
      bool found = false;
      long positionID = ticket;

      // try to find the position by position ID
      for(int index = positionsTotal-1; index >= 0; index--)
        {
         ticket = (long)::PositionGetTicket(index);
         if(::PositionGetInteger(POSITION_IDENTIFIER) == positionID)
           {
            found = true;
            break;
           }
        }

      /*
      // try to find the position by deal ticket
      if (!found) {
       if (::HistoryDealSelect(ticket)) {
        long posID = ::HistoryDealGetInteger(ticket, DEAL_POSITION_ID);

        for (int index = positionsTotal-1; index >= 0; index--) {
         ticket = (long)::PositionGetTicket(index);

         if (::PositionGetInteger(POSITION_IDENTIFIER) == posID) {
          found = true;
          break;
         }
        }
       }
      }
      */

      if(!found)
         return false;

      double lots0   = ::NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 5);
      string symbol  = ::PositionGetString(POSITION_SYMBOL);
      double lotstep = ::SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

      while(true)
        {
         //-- fixing -------------------------------------------------------
         lots = ::MathFloor(lots/lotstep)*lotstep;

         //-- close --------------------------------------------------------
         MqlTradeRequest request;
         MqlTradeResult result;
         ::ZeroMemory(request);
         ::ZeroMemory(result);

         request.action    = TRADE_ACTION_DEAL;
         request.price     = price;
         request.type      = (::PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? ORDER_TYPE_SELL : ORDER_TYPE_BUY ;
         request.position  = ::PositionGetInteger(POSITION_TICKET);
         request.symbol    = symbol;
         request.volume    = lots;
         request.magic     = ::PositionGetInteger(POSITION_MAGIC);
         request.deviation = (ulong)slippage;
         request.comment   = "from #" + ::IntegerToString(ticket);

         // filling type
         if(ACBA_TRADES::IsFillingTypeAllowed(symbol, SYMBOL_FILLING_FOK))
            request.type_filling = ORDER_FILLING_FOK;
         else
            if(ACBA_TRADES::IsFillingTypeAllowed(symbol, SYMBOL_FILLING_IOC))
               request.type_filling = ORDER_FILLING_IOC;
            else
               if(ACBA_TRADES::IsFillingTypeAllowed(symbol, ORDER_FILLING_RETURN))  // just in case
                  request.type_filling = ORDER_FILLING_RETURN;

         int success = ::OrderSend(request, result);

         //-- error check --------------------------------------------------
         if(!success || (result.retcode!=TRADE_RETCODE_DONE && result.retcode!=TRADE_RETCODE_PLACED && result.retcode!=TRADE_RETCODE_DONE_PARTIAL))
           {
            string errmsgpfx = "Closing trade error";
            int erraction    = ACBA_TRADES::CheckForTradingError(result.retcode, errmsgpfx);

            switch(erraction)
              {
               case 0:
                  break;    // no error
               case 1:
                  continue; // overcomable error
               case 2:
                  break;    // fatal error
              }
            return false;
           }

         //-- finish work --------------------------------------------------
         if(result.retcode == TRADE_RETCODE_DONE || result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE_PARTIAL)
           {
            //- closing: full
            if(lots0 == ::NormalizeDouble(result.volume, 5))
              {
               while(true)
                 {
                  if(!::PositionSelectByTicket(ticket))
                    {
                     break;
                    }

                  ::Sleep(10);
                 }
              }
            //- closing: partial
            else
               if(lots0 > ::NormalizeDouble(result.volume, 5))
                 {
                  while(true)
                    {
                     if(::PositionSelectByTicket(ticket) && (lots0 != ::NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 5)))
                       {
                        break;
                       }

                     ::Sleep(10);
                    }
                 }
           }

         break;
        }

      ::ResetLastError();

      return true;
     }

   static datetime   OrderCloseTime()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return (datetime)::PositionGetInteger(POSITION_TIME);

      if(ACBA_TRADES::LoadedType() == 2)
         return (datetime)::OrderGetInteger(ORDER_TIME_DONE);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return (datetime)::HistoryDealGetInteger(ticket, DEAL_TIME);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return (datetime)::HistoryOrderGetInteger(ACBA::OrderTicket(), ORDER_TIME_DONE);

      return 0;
     }

   static double     OrderCommission()
     {
      if(ACBA_TRADES::LoadedType() == 1)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = 0; index < total; index++)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_IN)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_COMMISSION);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 2)
         return 0;

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_COMMISSION);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return 0;

      return 0.0;
     }

   static double     OrderLots()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return ::PositionGetDouble(POSITION_VOLUME);

      if(ACBA_TRADES::LoadedType() == 2)
         return ::OrderGetDouble(ORDER_VOLUME_CURRENT);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_VOLUME);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return ::HistoryOrderGetDouble(ACBA::OrderTicket(), ORDER_VOLUME_CURRENT);

      return 0.0;
     }

   static long       OrderMagicNumber()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return (long)::PositionGetInteger(POSITION_MAGIC);

      if(ACBA_TRADES::LoadedType() == 2)
         return (long)::OrderGetInteger(ORDER_MAGIC);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return (long)::HistoryDealGetInteger(ticket, DEAL_MAGIC);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return (long)::HistoryOrderGetInteger(ACBA::OrderTicket(), ORDER_MAGIC);

      return 0;
     }

   static double     OrderOpenPrice()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return ::PositionGetDouble(POSITION_PRICE_OPEN);

      if(ACBA_TRADES::LoadedType() == 2)
         return ::OrderGetDouble(ORDER_PRICE_OPEN);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = 0; index < total; index++)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_IN)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_PRICE);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return ::HistoryOrderGetDouble(ACBA::OrderTicket(), ORDER_PRICE_OPEN);

      return 0.0;
     }

   static datetime   OrderOpenTime()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return (datetime)::PositionGetInteger(POSITION_TIME);

      if(ACBA_TRADES::LoadedType() == 2)
         return (datetime)::OrderGetInteger(ORDER_TIME_SETUP);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = 0; index < total; index++)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_IN)
              {
               return (datetime)::HistoryDealGetInteger(ticket, DEAL_TIME);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return (datetime)::HistoryOrderGetInteger(ACBA::OrderTicket(), ORDER_TIME_SETUP);

      return 0;
     }

   static double     OrderProfit()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return ::PositionGetDouble(POSITION_PROFIT);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_PROFIT);
              }
           }
        }

      return 0.0;
     }

   static bool       OrderSelect(long index, int select, int pool = 0)
     {
      // SELECT_BY_POS is 0, SELECT_BY_TICKET is 1. If any other value is used, it defaults to SELECT_BY_TICKET
      // MODE_TRADES is 0, MODE_HISTORY is 1

      if(pool < 0 || pool > 1)
         pool = 0;
      if(select != 0)
         select = 1;

      bool selected = false;
      int loadedTypeTrade = 1;
      int loadedTypeOrder = 2;

      ACBA::OrderTicket(0);
      ACBA_TRADES::LoadedType(0);

      // SELECT_BY_POS
      if(select == 0)
        {
         // MODE_TRADES (running trades + pending orders)
         int totalTrades = 0;
         int totalOrders = 0;

         if(pool == 1)
           {
            ::HistorySelect(0, ::TimeCurrent() + 1);

            totalTrades = ::HistoryDealsTotal();
            totalOrders = ::HistoryOrdersTotal();

            loadedTypeTrade = 3;
            loadedTypeOrder = 4;
           }
         else
           {
            totalTrades = ::PositionsTotal();
            totalOrders = ::OrdersTotal();

            loadedTypeTrade = 1;
            loadedTypeOrder = 2;
           }

         if(totalTrades == 0 && totalOrders == 0)
           {
            // nothing to select
            ACBA::_LastError_(ERR_INVALID_PARAMETER);
           }
         else
           {
            // mixed trades and orders
            int total = ::MathMax(totalTrades, totalOrders);
            int tradeIndex = 0;
            int orderIndex = 0;
            int iterationIndex = 0;

            while(true)
              {
               ulong tradeTicket = 0;
               ulong orderTicket = 0;

               if(tradeIndex < totalTrades)
                 {
                  if(pool == 1)
                    {
                     tradeTicket = ::HistoryDealGetTicket(tradeIndex);

                     if(
                        (tradeTicket == 0) // something is wrong
                        || (::HistoryDealGetInteger(tradeTicket, DEAL_ENTRY) != DEAL_ENTRY_OUT) // not that kind of a deal
                     )
                       {
                        tradeIndex++;
                        continue;
                       }

                     // However, after the OUT deal was just found, the ticket needs to be the position's ID
                     if(tradeTicket > 0)
                       {
                        tradeTicket = ::HistoryDealGetInteger(tradeTicket, DEAL_POSITION_ID);
                       }
                    }
                  else
                    {
                     tradeTicket = ::PositionGetTicket(tradeIndex);
                    }
                 }

               if(orderIndex < totalOrders)
                 {
                  if(pool == 1)
                    {
                     orderTicket            = ::HistoryOrderGetTicket(orderIndex);
                     ENUM_ORDER_STATE state = (ENUM_ORDER_STATE)::HistoryOrderGetInteger(orderTicket, ORDER_STATE);

                     if(
                        (orderTicket == 0) // something is wrong
                        || (state != ORDER_STATE_CANCELED && state != ORDER_STATE_EXPIRED) // not that kind of state
                     )
                       {
                        orderIndex++;
                        continue;
                       }
                    }
                  else
                    {
                     orderTicket = ::OrderGetTicket(orderIndex);
                    }
                 }

               iterationIndex++;

               // finished checking
               if(tradeTicket == 0 && orderTicket == 0)
                 {
                  break;
                 }
               else
                  if(tradeTicket > 0 && orderTicket == 0)
                    {
                     tradeIndex++;

                     if(iterationIndex > index)
                       {
                        ACBA::OrderTicket(tradeTicket);
                        ACBA_TRADES::LoadedType(loadedTypeTrade);
                        selected = true;

                        break;
                       }
                    }
                  else
                     if(tradeTicket == 0 && orderTicket > 0)
                       {
                        orderIndex++;

                        if(iterationIndex > index)
                          {
                           ACBA::OrderTicket(orderTicket);
                           ACBA_TRADES::LoadedType(loadedTypeOrder);
                           selected = true;

                           break;
                          }
                       }
                     else
                        if(tradeTicket <= orderTicket)
                          {
                           tradeIndex++;

                           if(iterationIndex > index)
                             {
                              ACBA::OrderTicket(tradeTicket);
                              ACBA_TRADES::LoadedType(loadedTypeTrade);
                              selected = true;

                              break;
                             }
                          }
                        else
                           if(tradeTicket > orderTicket)
                             {
                              orderIndex++;

                              if(iterationIndex > index)
                                {
                                 ACBA::OrderTicket(orderTicket);
                                 ACBA_TRADES::LoadedType(loadedTypeOrder);
                                 selected = true;

                                 break;
                                }
                             }
              }
           }
        }
      // SELECT_BY_TICKET
      else
        {
         long ticket = index;

         // Select whatever has the ticket here, the pool doesn't matter
         if(::PositionSelectByTicket(ticket))
           {
            ACBA::OrderTicket(::PositionGetInteger(POSITION_IDENTIFIER));
            ACBA_TRADES::LoadedType(1);
            selected = true;
           }
         else
            if(::OrderSelect(ticket))
              {
               ACBA::OrderTicket(ticket);
               ACBA_TRADES::LoadedType(2);
               selected = true;
              }
            else
              {
               ::HistorySelect(0, ::TimeCurrent() + 1);
               long posID = ::HistoryDealGetInteger(ticket, DEAL_POSITION_ID);

               if(posID)
                 {
                  ACBA::OrderTicket(posID);
                  ACBA_TRADES::LoadedType(3);
                  selected = true;
                 }

               if(selected == false)
                 {
                  long orderTicket = ::HistoryOrderGetInteger(ticket, ORDER_TICKET);

                  if(orderTicket)
                    {
                     ACBA::OrderTicket(ticket);
                     ACBA_TRADES::LoadedType(4);
                     selected = true;
                    }
                 }
              }
        }

      if(selected)
         ::ResetLastError();

      return selected;
     }

   static int        OrderSend(
      string   symbol,              // symbol
      int      cmd,                 // operation
      double   volume,              // volume
      double   price,               // price
      int      slippage,            // slippage
      double   sl,                  // stop loss
      double   tp,                  // take profit
      string   comment=NULL,        // comment
      long      magic=0,             // magic number
      datetime expiration=0,        // pending order expiration
      color    arrow_color=clrNONE  // color
   )
     {
      int type                       = cmd;
      ulong ticket                   = -1;
      bool successed                 = false;
      bool isPendingOrder            = (cmd > 1);
      ENUM_ORDER_TYPE_TIME type_time = ORDER_TIME_GTC;

      symbol = (symbol == NULL || symbol == "") ? ::Symbol() : symbol;

      if(isPendingOrder)
        {
         if(expiration <= 0)
           {
            expiration = 0;

            if(ACBA_TRADES::IsExpirationTypeAllowed(symbol, SYMBOL_EXPIRATION_GTC))
               type_time = ORDER_TIME_GTC;
            else
               type_time = ORDER_TIME_DAY;
           }
         else
           {
            type_time = ORDER_TIME_SPECIFIED;
           }
        }
      else
        {
         expiration = 0;
        }

      //-- we need this to prevent false-synchronous behaviour of MQL5 -----
      bool closing = false;
      double lots0 = 0;
      long type0   = type;

      if(
         (::AccountInfoInteger(ACCOUNT_MARGIN_MODE) == ACCOUNT_MARGIN_MODE_RETAIL_NETTING)
         && (type == POSITION_TYPE_BUY || type == POSITION_TYPE_SELL)
      )
        {
         if(::PositionSelect(symbol))
           {
            if((int)::PositionGetInteger(POSITION_TYPE) != type)
              {
               closing = true;
              }

            lots0 = ::NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 5);
            type0 = ::PositionGetInteger(POSITION_TYPE);
           }
        }

      while(true)
        {
         // fixing
         int digits     = (int)::SymbolInfoInteger(symbol, SYMBOL_DIGITS);
         double ask     = ::SymbolInfoDouble(symbol, SYMBOL_ASK);
         double bid     = ::SymbolInfoDouble(symbol, SYMBOL_BID);
         double lotstep = ::SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

         sl     = ::NormalizeDouble(sl, digits);
         tp     = ::NormalizeDouble(tp, digits);
         price  = ::NormalizeDouble(price, digits);
         volume = ::MathFloor(volume/lotstep) * lotstep; // MQL4's OrderSend rounds to floor

         // MQL4 gives error 130 and doesn't make pending order when outside of the requirements listed here: https://book.mql4.com/appendix/limits
         // MQL5 seems to don't have such and instead it would make a pending order or a trade. That's why these checks are needed here.
         if(isPendingOrder)
           {
            if(
               (type == ORDER_TYPE_BUY_LIMIT && price >= ask)
               || (type == ORDER_TYPE_SELL_LIMIT && price <= bid)
               || (type == ORDER_TYPE_BUY_STOP && price <= ask)
               || (type == ORDER_TYPE_SELL_STOP && price >= bid)
            )
              {
               ACBA::_LastError_(TRADE_RETCODE_INVALID_STOPS);

               return -1;
              }
           }

         // Give error 130 when the stops are wrong right away
         if(
            ((type == POSITION_TYPE_BUY || type == ORDER_TYPE_BUY_LIMIT || type == ORDER_TYPE_BUY_STOP) && ((sl > 0 && sl >= price) || (tp > 0 && tp <= price)))
            || ((type == POSITION_TYPE_SELL || type == ORDER_TYPE_SELL_LIMIT || type == ORDER_TYPE_SELL_STOP) && ((sl > 0 && sl <= price) || (tp > 0 && tp >= price)))
         )
           {
            ACBA::_LastError_(TRADE_RETCODE_INVALID_STOPS);
            return -1;
           }

         // send
         MqlTradeRequest request;
         MqlTradeResult result;
         MqlTradeCheckResult check_result;
         ::ZeroMemory(request);
         ::ZeroMemory(result);
         ::ZeroMemory(check_result);

         request.action     = (type < 2) ? TRADE_ACTION_DEAL : TRADE_ACTION_PENDING;
         request.symbol     = symbol;
         request.volume     = volume;
         request.type       = (ENUM_ORDER_TYPE)type;
         request.price      = price;
         request.deviation  = slippage;
         request.sl         = sl;
         request.tp         = tp;
         request.comment    = comment;
         request.magic      = magic;
         request.type_time  = type_time;
         request.expiration = expiration;

         //-- filling type
         if(isPendingOrder)
           {
            if(ACBA_TRADES::IsFillingTypeAllowed(symbol, ORDER_FILLING_RETURN))
               request.type_filling = ORDER_FILLING_RETURN;
            else
               if(ACBA_TRADES::IsFillingTypeAllowed(symbol, ORDER_FILLING_FOK))
                  request.type_filling = ORDER_FILLING_FOK;
               else
                  if(ACBA_TRADES::IsFillingTypeAllowed(symbol, ORDER_FILLING_IOC))
                     request.type_filling = ORDER_FILLING_IOC;
           }
         else
           {
            // in case of positions I would check for SYMBOL_FILLING_ and then set ORDER_FILLING_
            // this is because it appears that ACBA_TRADES::IsFillingTypeAllowed() works correct with SYMBOL_FILLING_, but then the position works correctly with ORDER_FILLING_
            // FOK and IOC integer values are not the same for ORDER and SYMBOL

            if(ACBA_TRADES::IsFillingTypeAllowed(symbol, SYMBOL_FILLING_FOK))
               request.type_filling = ORDER_FILLING_FOK;
            else
               if(ACBA_TRADES::IsFillingTypeAllowed(symbol, SYMBOL_FILLING_IOC))
                  request.type_filling = ORDER_FILLING_IOC;
               else
                  if(ACBA_TRADES::IsFillingTypeAllowed(symbol, ORDER_FILLING_RETURN))  // just in case
                     request.type_filling = ORDER_FILLING_RETURN;
           }

         bool success = ::OrderSend(request, result);

         //-- check security flag ------------------------------------------
         if(successed == true)
           {
            ::Print("The program will be removed because of suspicious attempt to create new positions");
            ::ExpertRemove();
            ::Sleep(10000);

            break;
           }

         if(success)
           {
            successed = true;
           }

         //-- error check --------------------------------------------------
         if(
            success == false
            || (
               result.retcode != TRADE_RETCODE_DONE
               && result.retcode != TRADE_RETCODE_PLACED
               && result.retcode != TRADE_RETCODE_DONE_PARTIAL
            )
         )
           {
            string errmsgpfx = (type > ORDER_TYPE_SELL) ? "New pending order error" : "New position error";

            int erraction = ACBA_TRADES::CheckForTradingError(result.retcode, errmsgpfx);

            switch(erraction)
              {
               case 0:
                  break;    // no error
               case 1:
                  continue; // overcomable error
               case 2:
                  break;    // fatal error
              }

            // MQL5 does not put the trading error into GetLastError, but I need it for later use in GetLastError
            ACBA::_LastError_(result.retcode);

            return -1;
           }

         //-- finish work --------------------------------------------------
         if(
            result.retcode==TRADE_RETCODE_DONE
            || result.retcode==TRADE_RETCODE_PLACED
            || result.retcode==TRADE_RETCODE_DONE_PARTIAL
         )
           {
            ticket = result.order;
            //== Whatever was created, we need to wait until MT5 updates it's cache

            //-- Synchronize: Position
            if(type <= ORDER_TYPE_SELL)
              {
               if(::AccountInfoInteger(ACCOUNT_MARGIN_MODE) == ACCOUNT_MARGIN_MODE_RETAIL_NETTING)
                 {
                  if(closing == false)
                    {
                     //- new position: 2 situations here - new position or add to position
                     //- ... because of that we will check the lot size instead of PositionSelect
                     while(true)
                       {
                        if(::PositionSelect(symbol) && (lots0 != ::NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 5)))
                          {
                           break;
                          }

                        Sleep(10);
                       }
                    }
                  else
                    {
                     //- closing position: full
                     if(lots0 == ::NormalizeDouble(result.volume, 5))
                       {
                        while(true)
                          {
                           if(!::PositionSelect(symbol))
                             {
                              break;
                             }
                           ::Sleep(10);
                          }
                       }
                     //- closing position: partial
                     else
                        if(lots0 > ::NormalizeDouble(result.volume, 5))
                          {
                           while(true)
                             {
                              if(::PositionSelect(symbol) && (lots0 != ::NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 5)))
                                {
                                 break;
                                }

                              ::Sleep(10);
                             }
                          }
                        //-- position reverse
                        else
                           if(lots0 < ::NormalizeDouble(result.volume, 5))
                             {
                              while(true)
                                {
                                 if(::PositionSelect(symbol) && (type0 != ::PositionGetInteger(POSITION_TYPE)))
                                   {
                                    break;
                                   }

                                 ::Sleep(10);
                                }
                             }
                    }
                 }
               else
                  if(::AccountInfoInteger(ACCOUNT_MARGIN_MODE) == ACCOUNT_MARGIN_MODE_RETAIL_HEDGING)
                    {
                     if(closing == false)
                       {
                        while(true)
                          {
                           if(::PositionSelectByTicket(ticket))
                             {
                              break;
                             }

                           ::Sleep(10);
                          }
                       }
                    }
              }
            //-- Synchronize: Order
            else
              {
               while(true)
                 {
                  if(ACBA_TRADES::LoadPendingOrder(result.order))
                    {
                     break;
                    }

                  ::Sleep(10);
                 }
              }
           }

         break;
        }

      if(ticket > 0)
        {
         // In MQL4 OrderSend() selects the order
         int loadedType = (isPendingOrder) ? 2 : 1; // 1 for trade, 2 for pending order
         ACBA::OrderTicket(ticket);
         ACBA_TRADES::LoadedType(loadedType);
         ::ResetLastError();
        }

      return (int)ticket;
     }

   static double     OrderSwap()
     {
      if(FXD_SELECTED_TYPE == 1)
         return ::PositionGetDouble(POSITION_SWAP);

      if(FXD_SELECTED_TYPE == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = total -1; index >= 0; index--)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_OUT)
              {
               return ::HistoryDealGetDouble(ticket, DEAL_SWAP);
              }
           }
        }

      return 0.0;
     }

   static string     OrderSymbol()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return ::PositionGetString(POSITION_SYMBOL);

      if(ACBA_TRADES::LoadedType() == 2)
         return ::OrderGetString(ORDER_SYMBOL);

      if(ACBA_TRADES::LoadedType() == 3)
        {
         ::HistorySelectByPosition(ACBA::OrderTicket());
         int total = ::HistoryDealsTotal();

         for(int index = 0; index < total; index++)
           {
            ulong ticket = ::HistoryDealGetTicket(index);
            ENUM_DEAL_ENTRY entry = (ENUM_DEAL_ENTRY)::HistoryDealGetInteger(ticket, DEAL_ENTRY);

            if(entry == DEAL_ENTRY_IN)
              {
               return ::HistoryDealGetString(ticket, DEAL_SYMBOL);
              }
           }
        }

      if(ACBA_TRADES::LoadedType() == 4)
         return ::HistoryOrderGetString(ACBA::OrderTicket(), ORDER_SYMBOL);

      return _Symbol;
     }

   static int        OrderTicket(long ticket = 0)
     {
      static int memory = 0;

      if(ticket > 0)
        {
         memory = (int)ticket;
        }

      return memory;
     }

   static int        OrderType()
     {
      if(ACBA_TRADES::LoadedType() == 1)
         return (int)::PositionGetInteger(POSITION_TYPE);
      if(ACBA_TRADES::LoadedType() == 2)
         return (int)::OrderGetInteger(ORDER_TYPE);
      if(ACBA_TRADES::LoadedType() == 3)
         return (int)::HistoryDealGetInteger(ACBA::OrderTicket(), DEAL_TYPE);
      if(ACBA_TRADES::LoadedType() == 4)
         return (int)::HistoryOrderGetInteger(ACBA::OrderTicket(), ORDER_TYPE);

      return 0; // MQL4 returns 0 if there is nothing loaded
     }

   static int        OrdersHistoryTotal()
     {
      int total = 0;

      ::HistorySelect(0, ::TimeCurrent() + 1);

      int totalDeals  = ::HistoryDealsTotal();
      int totalOrders = ::HistoryOrdersTotal();

      for(int index = 0; index < totalDeals; index++)
        {
         ulong ticket = ::HistoryDealGetTicket(index);

         if(ticket == 0)
            continue;

         if(::HistoryDealGetInteger(ticket, DEAL_ENTRY) == DEAL_ENTRY_OUT)
            total++;
        }

      for(int index = 0; index < totalOrders; index++)
        {
         ulong ticket = ::HistoryOrderGetTicket(index);

         if(ticket == 0)
            continue;

         ENUM_ORDER_STATE state = (ENUM_ORDER_STATE)::HistoryOrderGetInteger(ticket, ORDER_STATE);

         if(state == ORDER_STATE_CANCELED || state == ORDER_STATE_EXPIRED)
            total++;
        }

      return total;
     }

   static int        OrdersTotal()
     {
      return ::PositionsTotal() + ::OrdersTotal();
     }

   /**
   * Refresh the data in the predefined variables and series arrays
   * In MQL5 this function should run on every tick or calculate
   *
   * Note that when Symbol or Timeframe is changed,
   * the global arrays (Ask, Bid...) are reset to size 0,
   * and also the static variables are reset to initial values.
   */
   static bool       RefreshRates()
     {
      static bool initialized = false;
      static double prevAsk   = 0.0;
      static double prevBid   = 0.0;
      static int prevBars     = 0;
      static MqlRates ratesArray[1];

      bool isDataUpdated = false;

      if(initialized == false)
        {
         ::ArraySetAsSeries(::Close, true);
         ::ArraySetAsSeries(::High, true);
         ::ArraySetAsSeries(::Low, true);
         ::ArraySetAsSeries(::Open, true);
         ::ArraySetAsSeries(::Volume, true);

         initialized = true;
        }

      // For Bars below, if the symbol parameter is provided through a string variable, the function returns 0 immediately when the terminal is started
      ::Bars = ::Bars(::_Symbol, PERIOD_CURRENT);
      ::Ask  = ::SymbolInfoDouble(::_Symbol, SYMBOL_ASK);
      ::Bid  = ::SymbolInfoDouble(::_Symbol, SYMBOL_BID);

      if((::Bars > 0) && (::Bars > prevBars))
        {
         // Tried to resize these arrays below on every successful single result, but turns out that this is veeeery slow
         ::ArrayResize(::Time, ::Bars);
         ::ArrayResize(::Open, ::Bars);
         ::ArrayResize(::High, ::Bars);
         ::ArrayResize(::Low, ::Bars);
         ::ArrayResize(::Close, ::Bars);
         ::ArrayResize(::Volume, ::Bars);

         // Fill the missing data
         for(int i = prevBars; i < ::Bars; i++)
           {
            int success = ::CopyRates(::_Symbol, PERIOD_CURRENT, i, 1, ratesArray);

            if(success == 1)
              {
               ::Time[i]   = ratesArray[0].time;
               ::Open[i]   = ratesArray[0].open;
               ::High[i]   = ratesArray[0].high;
               ::Low[i]    = ratesArray[0].low;
               ::Close[i]  = ratesArray[0].close;
               ::Volume[i] = ratesArray[0].tick_volume;
              }
           }
        }
      else
        {
         // Update the current bar only
         int success = ::CopyRates(::_Symbol, PERIOD_CURRENT, 0, 1, ratesArray);

         if(success == 1)
           {
            ::Time[0]   = ratesArray[0].time;
            ::Open[0]   = ratesArray[0].open;
            ::High[0]   = ratesArray[0].high;
            ::Low[0]    = ratesArray[0].low;
            ::Close[0]  = ratesArray[0].close;
            ::Volume[0] = ratesArray[0].tick_volume;
           }
        }

      if(::Bars != prevBars || ::Ask != prevAsk || ::Bid != prevBid)
        {
         isDataUpdated = true;
        }

      prevBars = ::Bars;
      prevAsk  = ::Ask;
      prevBid  = ::Bid;

      return isDataUpdated;
     }

   static int        TimeHour(datetime date)
     {
      MqlDateTime tm;
      ::TimeToStruct(date,tm);

      return tm.hour;
     }

   static ENUM_OBJECT_PROPERTY_INTEGER _ConvertEnumObjectPropertyInteger_(int propID)
     {
      // The extra "case" in some rows are the MQL5 values for the particular constant
      switch(propID)
        {
         case 6 :
         case 0 :
            return OBJPROP_COLOR;
         case 7 :
         case 1 :
            return OBJPROP_STYLE;
         case 8 :
         case 2 :
            return OBJPROP_WIDTH;
         case 9 :
         case 3 :
            return OBJPROP_BACK;
         case 207 :
            return OBJPROP_ZORDER;
         case 1031 :
            return OBJPROP_FILL;
         case 208 :
            return OBJPROP_HIDDEN;
         case 4 :
            return OBJPROP_SELECTED;
         case 1028 :
            return OBJPROP_READONLY;
         case 18 : /*case 7 :*/
            return OBJPROP_TYPE;
         case 19 : /*case 8 :*/
            return OBJPROP_TIME;
         case 1000 : /*case 10 :*/
            return OBJPROP_SELECTABLE;
         case 998 : /*case 11 :*/
            return OBJPROP_CREATETIME;
         case 200 :
            return OBJPROP_LEVELS;
         case 201 :
            return OBJPROP_LEVELCOLOR;
         case 202 :
            return OBJPROP_LEVELSTYLE;
         case 203 :
            return OBJPROP_LEVELWIDTH;
         case 1036 :
            return OBJPROP_ALIGN;
         case 100 :
         case 1002 :
            return OBJPROP_FONTSIZE;
         case 1003 :
            return OBJPROP_RAY_LEFT;
         case 1004 :
            return OBJPROP_RAY_RIGHT;
         case 10 :
         case 1032 :
            return OBJPROP_RAY;
         case 11 : /*case 1005 :*/
            return OBJPROP_ELLIPSE;
         case 14 : /*case 1008 :*/
            return OBJPROP_ARROWCODE;
         case 15 : /*case 12 :*/
            return OBJPROP_TIMEFRAMES;
         case 1011 :
            return OBJPROP_ANCHOR;
         case 102 : /*case 1012 :*/
            return OBJPROP_XDISTANCE;
         case 103 : /*case 1013 :*/
            return OBJPROP_YDISTANCE;
         case 1014 :
            return OBJPROP_DIRECTION;
         case 1015 :
            return OBJPROP_DEGREE;
         case 1016 :
            return OBJPROP_DRAWLINES;
         case 1018 :
            return OBJPROP_STATE;
         case 1030 :
            return OBJPROP_CHART_ID;
         case 1019 :
            return OBJPROP_XSIZE;
         case 1020 :
            return OBJPROP_YSIZE;
         case 1033 :
            return OBJPROP_XOFFSET;
         case 1034 :
            return OBJPROP_YOFFSET;
         case 1022 :
            return OBJPROP_PERIOD;
         case 1023 :
            return OBJPROP_DATE_SCALE;
         case 1024 :
            return OBJPROP_PRICE_SCALE;
         case 1027 :
            return OBJPROP_CHART_SCALE;
         case 1025 :
            return OBJPROP_BGCOLOR;
         case 101 : /*case 1026 :*/
            return OBJPROP_CORNER;
         case 1029 :
            return OBJPROP_BORDER_TYPE;
         case 1035 :
            return OBJPROP_BORDER_COLOR;
        }

      return (ENUM_OBJECT_PROPERTY_INTEGER)-1;
     }


   static ENUM_OBJECT_PROPERTY_STRING _ConvertEnumObjectPropertyString_(int propID)
     {
      // The extra "case" in some rows are the MQL5 values for the particular constant
      switch(propID)
        {
         case 1037 :
         case 5 :
            return OBJPROP_NAME;
         case 999 :
         case 6 :
            return OBJPROP_TEXT;
         case 206 :
            return OBJPROP_TOOLTIP;
         case 205 :
            return OBJPROP_LEVELTEXT;
         case 1001 :
            return OBJPROP_FONT;
         case 1017 :
            return OBJPROP_BMPFILE;
         case 1021 :
            return OBJPROP_SYMBOL;
        }

      return (ENUM_OBJECT_PROPERTY_STRING)-1;
     }

   /**
   * In MQL4 the values are the number of minutes in the period
   * In MQL5 the values are the minutes up to M30, then it's the number of seconds in the period
   * This function converts all values that exist in MQL4, but not in MQL5
   * There are no conflict values otherwise
   */
   static ENUM_TIMEFRAMES _ConvertTimeframe_(int timeframe)
     {
      switch(timeframe)
        {
         case 60    :
            return PERIOD_H1;
         case 120   :
            return PERIOD_H2;
         case 180   :
            return PERIOD_H3;
         case 240   :
            return PERIOD_H4;
         case 360   :
            return PERIOD_H6;
         case 480   :
            return PERIOD_H8;
         case 720   :
            return PERIOD_H12;
         case 1440  :
            return PERIOD_D1;
         case 10080 :
            return PERIOD_W1;
         case 43200 :
            return PERIOD_MN1;
        }

      return (ENUM_TIMEFRAMES)timeframe;
     }
   static ENUM_TIMEFRAMES _ConvertTimeframe_(ENUM_TIMEFRAMES timeframe)
     {
      return timeframe;
     }

   /**
   * Getter
   */
   static int        _LastError_()
     {
      return _LastError;
     }
   /**
   * Setter
   */
   static void       _LastError_(int error)
     {
      _LastError = error;
     }

   /**
   * Overload for the case when numeric value is used for timeframe
   */
   static double     iClose(const string symbol, int timeframe, int shift)
     {
      return ::iClose(symbol, ACBA::_ConvertTimeframe_(timeframe), shift);
     }

   /**
   * Overload for the case when numeric value is used for timeframe
   */
   static double     iOpen(const string symbol, int timeframe, int shift)
     {
      return ::iOpen(symbol, ACBA::_ConvertTimeframe_(timeframe), shift);
     }

   /**
   * Overload for the case when numeric value is used for timeframe
   */
   static datetime   iTime(const string symbol, int timeframe, int shift)
     {
      return ::iTime(symbol, ACBA::_ConvertTimeframe_(timeframe), shift);
     }
  };
int ACBA::_LastError = -1;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class ACBA_TRADES
  {
public:
   /**
   * Constructor
   */
                     ACBA_TRADES() {};

   static int        CheckForTradingError(int error_code = -1, string msg_prefix = "")
     {
      // return 0 -> no error
      // return 1 -> overcomable error
      // return 2 -> fatal error

      static int tryout = 0;
      int tryouts = 5;   // How many times to retry
      int delay   = 1000; // Time delay between retries, in milliseconds
      int retval  = 0;

      //-- error check -----------------------------------------------------
      switch(error_code)
        {
         //-- no error
         case 0:
            retval = 0;
            break;
         //-- overcomable errors
         case TRADE_RETCODE_REQUOTE:
         case TRADE_RETCODE_REJECT:
         case TRADE_RETCODE_ERROR:
         case TRADE_RETCODE_TIMEOUT:
         case TRADE_RETCODE_INVALID_VOLUME:
         case TRADE_RETCODE_INVALID_PRICE:
         case TRADE_RETCODE_INVALID_STOPS:
         case TRADE_RETCODE_INVALID_EXPIRATION:
         case TRADE_RETCODE_PRICE_CHANGED:
         case TRADE_RETCODE_PRICE_OFF:
         case TRADE_RETCODE_TOO_MANY_REQUESTS:
         case TRADE_RETCODE_NO_CHANGES:
         case TRADE_RETCODE_CONNECTION:
            retval = 1;
            break;
         //-- critical errors
         default:
            retval = 2;
            break;
        }

      if(error_code > 0)
        {
         if(retval == 1)
           {
            Print(msg_prefix,": ",(error_code),". Retrying in ",(delay)," milliseconds..");
            Sleep(delay);
           }
         else
            if(retval == 2)
              {
               Print(msg_prefix,": ",(error_code));
              }
        }

      if(retval == 0)
        {
         tryout = 0;
        }
      else
         if(retval == 1)
           {
            tryout++;

            if(tryout > tryouts)
              {
               tryout = 0;
               retval  = 2;
              }
            else
              {
               Print("retry #", tryout, " of ", tryouts);
              }
           }

      return retval;
     }

   static bool       IsExpirationTypeAllowed(string symbol, int exp_type)
     {
      int expiration = (int)SymbolInfoInteger(symbol,SYMBOL_EXPIRATION_MODE);
      return ((expiration&exp_type) == exp_type);
     }

   static bool       IsFillingTypeAllowed(string symbol,int fill_type)
     {
      int filling=(int)SymbolInfoInteger(symbol,SYMBOL_FILLING_MODE);
      return((filling & fill_type)==fill_type);
     }

   static bool       LoadPendingOrder(long ticket)
     {
      bool success = false;

      if(::OrderSelect(ticket))
        {
         // The order could be from any type, so check the type
         // and allow only true pending orders.
         ENUM_ORDER_TYPE type = (ENUM_ORDER_TYPE)::OrderGetInteger(ORDER_TYPE);

         if(
            type == ORDER_TYPE_BUY_LIMIT
            || type == ORDER_TYPE_SELL_LIMIT
            || type == ORDER_TYPE_BUY_STOP
            || type == ORDER_TYPE_SELL_STOP
         )
           {
            ACBA_TRADES::LoadedType(2);
            ACBA::OrderTicket(ticket);
            success = true;
           }
        }

      return success;
     }

   static int        LoadedType(int type = 0)
     {
      // 1 - position
      // 2 - pending order
      // 3 - history position
      // 4 - history pending order

      static int memory;

      if(type > 0)
        {
         memory = type;
        }

      return memory;
     }
  };
bool ___RefreshRates___ = ACBA::RefreshRates();

//== fxDreema MQL4 to MQL5 Converter ==//
//+------------------------------------------------------------------+
