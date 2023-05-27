//+------------------------------------------------------------------+
//|                                           Experto Crash Boom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "EA Advisor para:"
#property description "- CRASH 1000"
#property description "- CRASH 500"
#property description "- BOOM 1000"
#property description "- BOOM 500"


enum Tipo_Martingala
  {
   _5_a_5=0,// 5 a 5
   _1_a_1=1, // 1 a 1
  };

enum Modo_Aumento_M
  {
   Modo_Multiplicador=0, //Multiplicador
   Modo_Personalizado=1, // Personalizado
  };

////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2021.10.30 00:00';
double CuentasCompartidas[1]= {3282173};
string NombrePersonaCompartida[1]= {"Angelo Chumpitaz"};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[2]= {2192242,1974851};
string CuentasBroker= "Deriv Limited";
////////////////////////////////////////////////////////////////////////

#include<Trade\Trade.mqh>
CTrade trade;


int Handle=0;

enum esquina
  {
   Arriba_Derecha=0,
   Arriba_Izquierda=1,
   Abajo_Derecha=2,
  };

enum MODO
  {
   UP=0,
   DOWN=1,
  };

enum ModoGrafico
  {
   Trend_4_Points=0,//4 Trend Points
   Future_4_Points=1,//4 Future Points
   Trend_Future_8_Points=2,//8 Trend+Future Points
   Trend_4_Lines=3,//4 Trend Lines
   Future_4_Lines=4,//4 Future Lines
   Trend_8_Future_Lines=5,//8 Trend+Future Lines
   Trend_2_Riboons=6,//2 Trend Ribons
   Future_2_Ribons=7,//2 Future Ribons
   Trend_4_Future_Ribons=8,//4 Trend+Future Ribons
   Trend_1_Cloud=9,//1 Trend Cloud
   Future_1_Cloud=10,//1 Future Cloud
   Trend_2_Future_Clouds=11,//2 Trend+Future Clouds
   Glow_Rocks=12,//Glow Rocks
   Sunny_Hills=13,//Sunny Hills
   Sunny_Lakes=14,//Sunny Lakes
   Sunny_Rivers=15,//Sunny Rivers
   Moon_Hills=16,//Moon Hills
   Moon_Lakes=17,//Moon Lakes
   Moon_Rivers=18,//Moon Rivers
   Moon_Canyons=19,//Moon Canyons
  };

enum ModoPrice
  {
   Highest=0,//{>}Highest
   Weighted=1,//{~}Weighted
   Lowest=2,//{<}Lowest
  };


input Tipo_Martingala Modo_Martingala=_1_a_1;
input int PuntosMinimo=10;// Puntos Minimo para Considerar vela positiva
input double Lotes=1;
input int TP=5;//Take Profit en velas
input int SL=8;//Stop Loss en velas
input int MagicNumber=20212021;
input Modo_Aumento_M Modo_Martingala_Aumento=Modo_Personalizado;
input string S1_1="-----------------------   Modo Martingala (MULTIPLICADOR)  ---------------------";//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Multiplicador_Martingala=2;
input int Maximo_Martingala_Conteo=5;
input string S1_2="-----------------------   Modo Martingala (PERSONALIZADO)  ---------------------";//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string HedgeLot="1=1;3=2;10=4";
/////////////////////////////////////////////INCIOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO/////////
input string S___="PARAMETROS INDICADOR - PARAMETROS INDICADOR - PARAMETROS INDICADOR - PARAMETROS INDICADOR - PARAMETROS INDICADOR - PARAMETROS INDICADOR - PARAMETROS INDICADOR - ";//------------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-----------------////////////////////////////////////////////////------------------
MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input string Ind0="-------------------- CONFIGURACION SEÑALES ------------------------";//----------------------------------------
input bool Signal_Pattern_Arrow=true; // Cronex
input bool Cruce_de_Emas=true; //Cruce de Emas
input bool MACD_Patron=true;//Silencer Strategy Levels
input string Ind1="-------------------- CRONEX ------------------------";//----------------------------------------
input string Nombre_Indicador_1="PROYECTO LUIS/cronex_MACD_Trend Impulse (2)";
input int MACD_CRONEX=34;
input int CRONEX=9;
input string Ind2="-------------------- ARROWS ------------------------";//----------------------------------------
input string Nombre_Indicador_2="PROYECTO LUIS/Boom Crash - RSI-Strike - 2021 MT5 (1)";
input int tres_=2;//3
input int RSI_Period2=4;
input ENUM_APPLIED_PRICE RSI_Price1=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Precie=PRICE_CLOSE;
input int cuatro_=3;//4
input int RSI_Period4=6;
input ENUM_APPLIED_PRICE RSI_Price3=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price4=PRICE_CLOSE;
input int cinco=4;//5
input int RSI_Period5=8;
input ENUM_APPLIED_PRICE RSI_Price5=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price6=PRICE_CLOSE;
input int nueve_=5;//9
input int RSI_Period8=10;
input ENUM_APPLIED_PRICE RSI_Price7=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price8=PRICE_CLOSE;
input string Ind3="-------------------- TREND TMA ------------------------";//----------------------------------------
input string Nombre_Indicador_3="PROYECTO LUIS/WT_SuperT-MA_v4.7(1) (1)";
input esquina EsquinaPublicidad=Arriba_Derecha;
input string S1="-----------------------------------------------";//--------------------------------
input ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;
input ENUM_MA_METHOD TipoMA=MODE_SMA;
input ENUM_APPLIED_PRICE Tipo_Precio=PRICE_CLOSE;// Tipo precio (sólo se tiene en cuenta cuando tipoMA<>TMA)
input int PeriodosMA=20;
input string S2="-------------------------------------------------------";//--------------------------------
input int PeriodosATR=110;
input double Multiplicador=2.6;
input string S3="-------------------------------------------------------";//--------------------------------
input int MaxVelasHistorico=1000;
input string S6="-----------------------   CONFIGURACION MEDIAS MOVILES (Cruce Emas)  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Fast_Periodo=14;
input int Fast_Shift=0;
input ENUM_MA_METHOD Fast_Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Fast_AppliedPrice=PRICE_CLOSE;
input int Slow_Periodo=50;
input int Slow_Shift=0;
input ENUM_MA_METHOD Slow_Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Slow_AppliedPrice=PRICE_CLOSE;
input string S6_="-----------------------   CONFIGURACION MEDIAS MOVILES (MACD PATRON)  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Fast_Periodo_=14;
input int Fast_Shift_=0;
input ENUM_MA_METHOD Fast_Ma_Method_=MODE_EMA;
input ENUM_APPLIED_PRICE Fast_AppliedPrice_=PRICE_CLOSE;
input int Slow_Periodo_=16;
input int Slow_Shift_=0;
input ENUM_MA_METHOD Slow_Ma_Method_=MODE_EMA;
input ENUM_APPLIED_PRICE Slow_AppliedPrice_=PRICE_CLOSE;
input string S7="-----------------------   VOLUMEN M5  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Nombre_Indicador_4="waddah_attar_explosion";
input int Fast_MA = 20;       // Period of the fast MACD moving average
input int Slow_MA = 40;       // Period of the slow MACD moving average
input int BBPeriod=20;        // Bollinger period
input double BBDeviation=2.0; // Number of Bollinger deviations
input int  Sensetive=150;
input int  DeadZonePip=400;
input int  ExplosionPower=15;
input int  TrendPower=150;
input bool AlertWindow=false;
input int  AlertCount=2;
input bool AlertLong=false;
input bool AlertShort=false;
input bool AlertExitLong=false;
input bool AlertExitShort=false;
input double IndicatorLevel=20;

input string S8="-----------------------   CONFIGURACION MACD TREND SILENCER  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Nombre_Indicador_5="Boom & Crash Silencer Strategy/MACD TREND SILENCER SIGNAL";
input string S1_="================================================";//---
input string S2_="==== MACD Settings ====";//---
input string S3_="================================================";//---
input ENUM_TIMEFRAMES TimeFrame_=PERIOD_CURRENT;
input int FastMaPeriod=12;
input int SlowMAPeriod=26;
input int SignalMAPeriod=9;
input ENUM_MA_METHOD MAMethod=MODE_EMA;
input ENUM_APPLIED_PRICE AppliedPrice=PRICE_CLOSE;
input string S1__="================================================";//---
input string S2__="==== Arrows & Alerts For Signal Line Cross ====";//---
input string S3__="================================================";//---
input bool ShowSignalLineCrossArrows=false;
input bool SendSingalLineCrossAlert=false;
input bool SendSignalLineCrossTest=false;
input double gap_needed_to_trigger_alert=3.5;//gap needed to trigger alert, 0=off
input color BullishSignalLineCrossArrowColor=clrGreen;
input int BullishSignalLineCrossArrowCode=233;
input int BullishSignalLineCrossArrowWidth=2;
input color BearishSignalLineCrossArrowColor=clrRed;
input int BearishSignalLineCrossArrowCode=234;
input int BearishSignalLineCrossArrowWidth=2;
input string S1___="================================================";//---
input string S2___="==== Arrows & Alerts For Signal Line Cross ====";//---
input string S3___="================================================";//---
input bool ShowZeroLineCrossArrows=false;
input bool SendZeroLineCrossAlert=false;
input bool SendZeroLineCrossText=false;
input double gap_needer_to_trigger_alert__=2.5;//gap needer to trigger alert, 0=off
input color BullishSignalZeroCrossArrowColor=clrGreen;
input int BullishSignalZeroCrossArrowCode=139;
input int BullishSignalZeroCrossArrowWidth=2;
input color BearishSignalZeroCrossArrowColor=clrRed;
input int BearishSignalZeroCrossArrowCode=139;
input int BearishSignalZeroCrossArrowWidth=2;
input string S1____="================================================";//---
input string S2____="==== Arrow Spacing ====";//---
input string S3____="================================================";//---
input int ATRPeriodArrows=20;
input double ATRMultiplierArrows=1.25;

double Point_,TakeProfit_,StopLoss_;

datetime TimeStart;

MqlRates Rates[];

int Cronex_Handle,Arrows_Handle,Trend_Handle,EMA_Fast,EMA_Slow,Waddah;//,Peace_Handle,Vultur_Handle;
double Trend_Color[];
double RSI_Strike_1_Buy[],RSI_Strike_1_Sell[],RSI_Strike_2_Buy[],RSI_Strike_2_Sell[],RSI_Strike_3_Buy[],RSI_Strike_3_Sell[],RSI_Strike_4_Buy[],RSI_Strike_4_Sell[];
double MACD[],MACD_SIGNAL[],SLOW_EMA[],FAST_EMA[];
double Waddah_Color[];
double Waddah_Ema[];
double Waddah_MACD[];
double EMA_FAST[],EMA_SLOW[];
double EMA_FAST_MACD[],EMA_SLOW_MACD[];
int EMA_MACD_FAST=0;
int EMA_MACD_SLOW=0;

int MACD_TREND_SILENCER;
double MACD_TREND_SILENCER_BUY[];
double MACD_TREND_SILENCER_SELL[];

double MACD_TREND_SILENCER_N[];
double MACD_TREND_SILENCER_S[];
int password_status=-1;

datetime Tiempo=0;
double Nivel=0;

int Velas=0;
int Conteo_Martingala=0;

datetime Tiempo_Start=0;
datetime TiempoAnterior=0;
bool Signal_Bool=false;
datetime Tiempo_Start_History=0;
double Negativo=0;

struct Nivel_HedgeLote
  {
   int               Nivel;
   double               HedgeLote;
  };

Nivel_HedgeLote Array_NivelHedgeLote[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Modo_Martingala_Aumento==Modo_Personalizado)
     {
      if(!Funcion_Igualar_Nivel_Valores(HedgeLot))
         return (INIT_PARAMETERS_INCORRECT);
      if(!VerificarLotes())
         return (INIT_PARAMETERS_INCORRECT);
      if(!ComprobarLotaje())
         return (INIT_PARAMETERS_INCORRECT);
     }

   Tiempo_Start=TimeCurrent();
   Tiempo_Start_History=TimeCurrent();

   trade.SetExpertMagicNumber(MagicNumber);
   TesterHideIndicators(true);

   string broker = AccountInfoString(ACCOUNT_COMPANY);
   long account = AccountInfoInteger(ACCOUNT_LOGIN);

   printf("The name of the broker = %s", broker);
   printf("Account number =  %d", account);

   if(broker == CuentasBroker)
      for(int i=0; i<ArraySize(Cuentas); i++)
         if(account == Cuentas[i])
           {
            password_status = 1;
            Print("EA account verified");
            break;
           }
///////////////////////Cuenta del desarrollador////////////////////
   if(broker=="Deriv Limited" && account==3282173)//51055646
     {
      password_status=1;
      Comment("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
     }
/////////////////////////////////////////////////////////////////

   string NombreCuentaCompartida=" ";
   if(password_status == -1)
     {
      int CuentasCompartidasEjecutar=0;

      for(int k=0; k<ArraySize(CuentasCompartidas); k++)
        {
         if(CuentasCompartidas[k]==account)
           {
            NombreCuentaCompartida=NombrePersonaCompartida[k];
            CuentasCompartidasEjecutar++;
            break;
           }
        }
      if(CuentasCompartidasEjecutar==0)
        {
         // MessageBox("CUENTA NO HABLITADA",NULL,0);
         Print("Cuenta no habilitada");
         Comment("Cuenta no habilitada");
         return(INIT_FAILED);
        }
      else
        {
         //MessageBox(NombreCuentaCompartida+" - Licencia provista por IND_CRASH_BOOM hasta "+TimeToString(UNTIL,TIME_MINUTES),NULL,0);
         Comment(NombreCuentaCompartida," - Licencia provista por Luis Felipe Amasifuén hasta ",UNTIL);

        }
     }
   else
     {
      MessageBox("CUENTA VERIFICADA// TIEMPO ILIMITADO",NULL,0);
     }


   if(StringFind(Symbol(),"Crash 500",0)!=-1)
     {
      Modo_Operacion=UP;
     }
   else
      if(StringFind(Symbol(),"Crash 1000",0)!=-1)
        {
         Modo_Operacion=UP;
        }
      else
         if(StringFind(Symbol(),"Boom 500",0)!=-1)
           {
            Modo_Operacion=DOWN;
           }
         else
            if(StringFind(Symbol(),"Boom 1000",0)!=-1)
              {
               Modo_Operacion=DOWN;
              }
            else
              {
               Alert("Simbolo no es Crash ni boom");
               return INIT_FAILED;
              }

   Cronex_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_1,MACD_CRONEX,CRONEX);
   Arrows_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_2,tres_,RSI_Period2,RSI_Price1,RSI_Precie,cuatro_,RSI_Period4,RSI_Price3,RSI_Price4,cinco,RSI_Period5,RSI_Price5,RSI_Price6,nueve_,RSI_Period8,RSI_Price7,RSI_Price8);
   Trend_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_3,0,EsquinaPublicidad, S1,TimeFrame,TipoMA,Tipo_Precio,PeriodosMA,S2,false,PeriodosATR,Multiplicador,S3,MaxVelasHistorico);

   MACD_TREND_SILENCER=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_5,S1_,S2_,S3_,TimeFrame_,FastMaPeriod,SlowMAPeriod,SignalMAPeriod,MAMethod,AppliedPrice
                               ,S1__,S2__,S3__,ShowSignalLineCrossArrows,SendSingalLineCrossAlert,SendSignalLineCrossTest, gap_needed_to_trigger_alert,BullishSignalLineCrossArrowColor
                               ,BullishSignalLineCrossArrowCode,BullishSignalLineCrossArrowWidth,BearishSignalLineCrossArrowColor,BearishSignalLineCrossArrowCode,BearishSignalLineCrossArrowWidth
                               ,S1___,S2___,S3___,ShowZeroLineCrossArrows,SendZeroLineCrossAlert,SendZeroLineCrossText,gap_needer_to_trigger_alert__,BullishSignalZeroCrossArrowColor
                               ,BullishSignalZeroCrossArrowCode,BullishSignalZeroCrossArrowWidth,BearishSignalZeroCrossArrowColor,BearishSignalZeroCrossArrowCode,BearishSignalZeroCrossArrowWidth
                               ,S1____,S2____,S3____,ATRPeriodArrows,ATRMultiplierArrows);

   EMA_Fast=iMA(NULL,PERIOD_CURRENT,Fast_Periodo,Fast_Shift,Fast_Ma_Method,Fast_AppliedPrice);
   EMA_Slow=iMA(NULL,PERIOD_CURRENT,Slow_Periodo,Slow_Shift,Slow_Ma_Method,Slow_AppliedPrice);

   EMA_MACD_FAST=iMA(NULL,PERIOD_CURRENT,Fast_Periodo_,Fast_Shift_,Fast_Ma_Method_,Fast_AppliedPrice_);
   EMA_MACD_SLOW=iMA(NULL,PERIOD_CURRENT,Slow_Periodo_,Slow_Shift_,Slow_Ma_Method_,Slow_AppliedPrice_);

   Waddah=iCustom(Symbol(),PERIOD_CURRENT,Nombre_Indicador_4,Fast_MA,Slow_MA,BBPeriod,BBDeviation,Sensetive,DeadZonePip,ExplosionPower,TrendPower,AlertWindow,AlertCount,AlertLong,AlertShort,AlertExitLong,AlertExitShort,IndicatorLevel);

   if(Waddah==INVALID_HANDLE)
     {
      return(INIT_FAILED);
     }

   if(Cronex_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del Cronex  ERROR");
      return(INIT_FAILED);
     }

   if(Arrows_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del Boom Crash - RSI-Strike - 2021 MT5 ERROR");
      return(INIT_FAILED);
     }

   if(Trend_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del WT_TMA  ERROR");
      return(INIT_FAILED);
     }

   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(Trend_Color,true);
   ArraySetAsSeries(RSI_Strike_1_Buy,true);
   ArraySetAsSeries(RSI_Strike_1_Sell,true);
   ArraySetAsSeries(RSI_Strike_2_Buy,true);
   ArraySetAsSeries(RSI_Strike_2_Sell,true);
   ArraySetAsSeries(RSI_Strike_3_Buy,true);
   ArraySetAsSeries(RSI_Strike_3_Sell,true);
   ArraySetAsSeries(RSI_Strike_4_Buy,true);
   ArraySetAsSeries(RSI_Strike_4_Sell,true);
   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(MACD_SIGNAL,true);
   ArraySetAsSeries(SLOW_EMA,true);
   ArraySetAsSeries(FAST_EMA,true);
   ArraySetAsSeries(Waddah_Color,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_BUY,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_SELL,true);
   ArraySetAsSeries(EMA_FAST_MACD,true);
   ArraySetAsSeries(EMA_SLOW_MACD,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_BUY,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_SELL,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_N,true);
   ArraySetAsSeries(MACD_TREND_SILENCER_S,true);
//ArraySetAsSeries(EMA_TOQUE1,false);
// ArraySetAsSeries(EMA_TOQUE2,false);
   ArraySetAsSeries(Waddah_Ema,true);
   ArraySetAsSeries(Waddah_MACD,true);

   TimeStart=TimeCurrent();


   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

//  Comment("Velas= ",Velas," Signal= ",Signal_Bool," Negativo= ",Negativo);

   if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         Alert("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         ExpertRemove();
        }
     }

   int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,60,Rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());


   CopyBuffer(Trend_Handle,3,0,3,Trend_Color);
   CopyBuffer(Cronex_Handle,0,0,3,MACD);
   CopyBuffer(Cronex_Handle,1,0,3,MACD_SIGNAL);
   CopyBuffer(Arrows_Handle,0,0,52,RSI_Strike_1_Buy);
   CopyBuffer(Arrows_Handle,1,0,52,RSI_Strike_1_Sell);
   CopyBuffer(Arrows_Handle,2,0,52,RSI_Strike_2_Buy);
   CopyBuffer(Arrows_Handle,3,0,52,RSI_Strike_2_Sell);
   CopyBuffer(Arrows_Handle,4,0,52,RSI_Strike_3_Buy);
   CopyBuffer(Arrows_Handle,5,0,52,RSI_Strike_3_Sell);
   CopyBuffer(Arrows_Handle,6,0,52,RSI_Strike_4_Buy);
   CopyBuffer(Arrows_Handle,7,0,52,RSI_Strike_4_Sell);
   CopyBuffer(EMA_Fast,0,0,6,FAST_EMA);
   CopyBuffer(EMA_Slow,0,0,6,SLOW_EMA);
   CopyBuffer(Waddah,1,0,3,Waddah_Color);
   CopyBuffer(Waddah,2,0,3,Waddah_Ema);
   CopyBuffer(Waddah,0,0,3,Waddah_MACD);
   CopyBuffer(EMA_MACD_FAST,0,0,3,EMA_FAST_MACD);
   CopyBuffer(EMA_MACD_SLOW,0,0,3,EMA_SLOW_MACD);

   CopyBuffer(MACD_TREND_SILENCER,0,0,3,MACD_TREND_SILENCER_N);
   CopyBuffer(MACD_TREND_SILENCER,1,0,3,MACD_TREND_SILENCER_S);
   CopyBuffer(MACD_TREND_SILENCER,2,0,3,MACD_TREND_SILENCER_BUY);
   CopyBuffer(MACD_TREND_SILENCER,3,0,3,MACD_TREND_SILENCER_SELL);


   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   ResetLastError();

   int Buy=0,Sell=0;

   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetSymbol(i)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
         continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         Buy++;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         Sell++;
     }
 
 
  Comment("VELAS= ",Velas," Buys= ",Buy," Sells= ",Sell," SignalBool= ",Signal_Bool);

   if(Modo_Martingala==_5_a_5)
     {
      if(Buy!=0 || Sell!=0)
        {
         if(Tiempo!=0 && Tiempo!=Rates[0].time)
           {
            if(Tiempo==Rates[1].time)
              {
               if(Rates[1].close>Rates[1].open && Modo_Operacion==UP)
                 {
                  Nivel=Rates[1].close;
                  Velas++;
                  Tiempo=Rates[0].time;
                  Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                 }
               if(Rates[1].close<Rates[1].open && Modo_Operacion==DOWN)
                 {
                  Nivel=Rates[1].close;
                  Velas++;
                  Tiempo=Rates[0].time;
                  Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                 }
              }
            else
              {
               if(Rates[1].close>Rates[1].open && Modo_Operacion==UP && Rates[1].close-Nivel>PuntosMinimo*Point())
                 {
                  Nivel=Rates[1].close;
                  Velas++;
                  Tiempo=Rates[0].time;
                  Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                 }
               if(Rates[1].close<Rates[1].open && Modo_Operacion==DOWN && Nivel-Rates[1].close>PuntosMinimo*Point())
                 {
                  Nivel=Rates[1].close;
                  Velas++;
                  Tiempo=Rates[0].time;
                  Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                 }
              }
           }
        }
      else
        {
         Tiempo=0;
         Nivel=0;
         Velas=0;
        }
      if(Velas>=TP)
        {
         for(int i=PositionsTotal()-1; i>=0; i--)
           {
            ulong Ticket=PositionGetTicket(i);
            if(PositionGetSymbol(i)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
               continue;
            trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1);
           }
        }
     }
   else
     {
      if(!Martingala_Bool_History(Tiempo_Start_History) && Signal_Bool==true)
        {
         Signal_Bool=false;
         Velas=0;
        }

      if(Signal_Bool)
        {
         if(TiempoAnterior!=Rates[0].time)
           {
            for(int i=PositionsTotal()-1; i>=0; i--)
              {
               ulong Ticket=PositionGetTicket(i);
               if((PositionGetSymbol(i)!=Symbol() || PositionGetDouble(POSITION_PROFIT)<0 || PositionGetInteger(POSITION_MAGIC)!=MagicNumber))
                  continue;
               trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1);
               Velas++;

               if(Velas<TP)
                 {
                  if(Modo_Operacion==UP)
                    {
                     Buy_Op_2();
                     Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                    }
                  if(Modo_Operacion==DOWN)
                    {
                     Sell_Op_2();
                     Print("vela numero ",Velas," en ",TimeToString(Rates[1].time,TIME_DATE|TIME_MINUTES));
                    }
                 }
               else
                 {
                  Signal_Bool=false;
                  Velas=0;
                 }
              }
           }
        }
      TiempoAnterior=Rates[0].time;
     }
//Comment("Velas= ",Velas,"   Nivel= ",Nivel);


   if(Buy==0 && Signal_Bool==false)
      if(RSI_Strike_1_Buy[0]==0 && RSI_Strike_2_Buy[0]==0  && RSI_Strike_3_Buy[0]==0 && RSI_Strike_4_Buy[0]!=0 && RSI_Strike_3_Buy[1]!=0 && MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1  && Signal_Pattern_Arrow && Modo_Operacion==UP)
        {

         bool Entra=true;
         for(int i=1; i<50; i++)
           {
            if(Rates[i].close<Rates[i].open)
               break;

            if(RSI_Strike_4_Buy[i]!=0)
              {
               Entra=false;
               break;
              }
           }
         if(Entra==true)
           {
            if(Modo_Martingala==_5_a_5)
               Buy_Op();
            else
              {
               double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
               if(ProfitCiclo+Negativo>=0)
                 {
                  Negativo=0;
                  Conteo_Martingala=0;
                 }
               else
                 {
                  Negativo=Negativo+ProfitCiclo;
                  if(ProfitCiclo<0)
                     Conteo_Martingala++;
                 }
               Tiempo_Start_History=Rates[0].time;
               Buy_Op_2();
              }
           }
        }

   if(Sell==0 && Signal_Bool==false)
      if(RSI_Strike_1_Sell[0]==0 && RSI_Strike_2_Sell[0]==0  && RSI_Strike_3_Sell[0]==0 && RSI_Strike_4_Sell[0]!=0 && RSI_Strike_3_Sell[1]!=0 && MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0  && Signal_Pattern_Arrow && Modo_Operacion==DOWN)
        {
         bool Entra=true;
         for(int i=1; i<50; i++)
           {
            if(Rates[i].open<Rates[i].close)
               break;

            if(RSI_Strike_4_Sell[i]!=0)
              {
               Entra=false;
               break;
              }
           }
         if(Entra==true)
           {
            //Print(TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
            Signal_Bool=true;
            if(Modo_Martingala==_5_a_5)
               Sell_Op();
            else
              {
               double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
               if(ProfitCiclo+Negativo>=0)
                 {
                  Negativo=0;
                  Conteo_Martingala=0;
                 }
               else
                 {
                  Negativo=Negativo+ProfitCiclo;
                  if(ProfitCiclo<0 )
                     Conteo_Martingala++;
                 }
               Tiempo_Start_History=Rates[0].time;
               Sell_Op_2();
              }
           }
        }

   if(Buy==0 && Signal_Bool==false)
      if(MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1 && FAST_EMA[3]>SLOW_EMA[3] && FAST_EMA[4]<SLOW_EMA[4] && Waddah_Color[0]==1  && Cruce_de_Emas && Modo_Operacion==UP)
        {
         if(Modo_Martingala==_5_a_5)
            Buy_Op();
         else
           {
            double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
            if(ProfitCiclo+Negativo>=0)
              {
               Negativo=0;
               Conteo_Martingala=0;
              }
            else
              {
               Negativo=Negativo+ProfitCiclo;
               if(ProfitCiclo<0 )
                  Conteo_Martingala++;
              }
            Tiempo_Start_History=Rates[0].time;
            Buy_Op_2();
           }
        }
   if(Sell==0 && Signal_Bool==false)
      if(MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0 && FAST_EMA[3]<SLOW_EMA[3] && FAST_EMA[4]>SLOW_EMA[4] && Waddah_Color[0]==2 && Cruce_de_Emas && Modo_Operacion==DOWN)
        {
         Signal_Bool=true;
         if(Modo_Martingala==_5_a_5)
            Sell_Op();
         else
           {
            double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
            if(ProfitCiclo+Negativo>=0)
              {
               Negativo=0;
               Conteo_Martingala=0;
              }
            else
              {
               Negativo=Negativo+ProfitCiclo;
               if(ProfitCiclo<0 )
                  Conteo_Martingala++;
              }
            Tiempo_Start_History=Rates[0].time;
            Sell_Op_2();
           }
        }

   if(Buy==0 && Signal_Bool==false)
      if(EMA_FAST_MACD[0]>EMA_SLOW_MACD[0] && ((MACD_TREND_SILENCER_N[0]>0 && MACD_TREND_SILENCER_N[1]<0) || (MACD_TREND_SILENCER_BUY[0]!=0 && MACD_TREND_SILENCER_BUY[1]==0)) && MACD_Patron && Modo_Operacion==UP)
        {
         if(Modo_Martingala==_5_a_5)
            Buy_Op();
         else
           {
            double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
            if(ProfitCiclo+Negativo>=0)
              {
               Negativo=0;
               Conteo_Martingala=0;
              }
            else
              {
               Negativo=Negativo+ProfitCiclo;
               if(ProfitCiclo<0 )
                  Conteo_Martingala++;
              }
            Tiempo_Start_History=Rates[0].time;
            Buy_Op_2();
           }
        }

   if(Sell==0 && Signal_Bool==false)
      if(EMA_FAST_MACD[0]<EMA_SLOW_MACD[0] && ((MACD_TREND_SILENCER_N[0]<0 && MACD_TREND_SILENCER_N[1]>0) || (MACD_TREND_SILENCER_SELL[0]!=0 && MACD_TREND_SILENCER_SELL[1]==0))  && MACD_Patron && Modo_Operacion==DOWN)
        {
         Signal_Bool=true;
         if(Modo_Martingala==_5_a_5)
            Sell_Op();
         else
           {
            double ProfitCiclo=Martingala_Profit(Tiempo_Start_History);
            if(ProfitCiclo+Negativo>=0)
              {
               Negativo=0;
               Conteo_Martingala=0;
              }
            else
              {
               Negativo=Negativo+ProfitCiclo;
               if(ProfitCiclo<0)
                  Conteo_Martingala++;
              }
            Tiempo_Start_History=Rates[0].time;
            Sell_Op_2();
           }
        }
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Martingala(datetime TiempoStart)
  {
   double Profit=0;
//--- request trade history
   HistorySelect(TiempoStart,TimeCurrent());
//--- create objects
   string   name;
   uint     total=HistoryDealsTotal();
   ulong    ticket=0;
   double   price;
   double   profit;
   datetime time;
   string   symbol;
   long     type;
   long     entry;
   int        MN;
//--- for all deals
   for(uint i=0; i<total; i++)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         //--- get deals properties
         price =HistoryDealGetDouble(ticket,DEAL_PRICE);
         time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         MN=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //--- only for current symbol
         if(symbol==Symbol() && MN==MagicNumber)
           {
            Profit+=profit;
           }
        }
     }

   if(Profit>=0)
      return true;

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Martingala_Profit(datetime TiempoStart)
  {
   double Profit=0;
//--- request trade history
   HistorySelect(TiempoStart,TimeCurrent());
//--- create objects
   uint     total=HistoryDealsTotal();
   ulong    ticket=0;
   double   price;
   double   profit;
   datetime time;
   string   symbol;
   long     type;
   long     entry;
   int        MN;
//--- for all deals
   for(uint i=0; i<total; i++)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         //--- get deals properties
         price =HistoryDealGetDouble(ticket,DEAL_PRICE);
         time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         MN=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //--- only for current symbol
         if(symbol==Symbol() && MN==MagicNumber)
           {
            Profit+=profit;
            //Print(profit);
           }
        }
     }

   return Profit;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Martingala_Bool_History(datetime TiempoStart)
  {
   double Profit=0;
//--- request trade history
   HistorySelect(TiempoStart,TimeCurrent());
//--- create objects
   string   name;
   uint     total=HistoryDealsTotal();
   ulong    ticket=0;
   double   price;
   double   profit;
   datetime time;
   string   symbol;
   long     type;
   long     entry;
   int        MN;
//--- for all deals
   for(uint i=0; i<total; i++)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         //--- get deals properties
         price =HistoryDealGetDouble(ticket,DEAL_PRICE);
         time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         MN=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //--- only for current symbol
         if(symbol==Symbol() && MN==MagicNumber)
           {
            if(profit<0)
               return false;
           }
        }
     }

   return true;
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy_Op()
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   double Lote=0;

   bool EntraMartingala=false;

   double Size=0;
   for(int i=1; i<50; i++)
     {
      if(Rates[i].close>Rates[i].open)
        {
         Size=MathAbs(Rates[i].close-Rates[i].open);
         break;
        }
     }

   if(Martingala(Tiempo_Start))
     {
      Conteo_Martingala=0;

      if(Modo_Martingala_Aumento==Modo_Multiplicador)
         Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala);
      else
         Lote=Lote_Martingala(Conteo_Martingala+1);

      Tiempo_Start=Rates[0].time-1;
      Comment(TimeToString(Tiempo_Start,TIME_DATE|TIME_MINUTES));
     }
   else
     {
      if(Modo_Martingala_Aumento==Modo_Multiplicador)
         Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala+1);
      else
         Lote=Lote_Martingala(Conteo_Martingala+1);

      EntraMartingala=true;
     }

   bool BuyTradeBool=trade.Buy(Lote,Symbol(),Ask,NormalizeDouble(Ask-Size*SL,Digits()),0,"Expert Final"+string(TimeStart));
   if(!BuyTradeBool)
      Print("ERROR (No abrio Operacion):",GetLastError());
   else
     {
      if(EntraMartingala && Conteo_Martingala<Maximo_Martingala_Conteo)
         Conteo_Martingala++;
      Tiempo=Rates[0].time;
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell_Op()
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   double Lote=0;

   bool EntraMartingala=false;

   double Size=0;
   for(int i=1; i<50; i++)
     {
      if(Rates[i].close <Rates[i].open)
        {
         Size=MathAbs(Rates[i].close-Rates[i].open);
         break;
        }
     }


   if(Martingala(Tiempo_Start))
     {
      Conteo_Martingala=0;

      if(Modo_Martingala_Aumento==Modo_Multiplicador)
         Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala);
      else
         Lote=Lote_Martingala(Conteo_Martingala+1);

      Tiempo_Start=Rates[0].time-1;
      Comment(TimeToString(Tiempo_Start,TIME_DATE|TIME_MINUTES));
     }
   else
     {
      if(Modo_Martingala_Aumento==Modo_Multiplicador)
         Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala+1);
      else
         Lote=Lote_Martingala(Conteo_Martingala+1);

      EntraMartingala=true;
     }


   bool SellTradeBool=trade.Sell(Lote,Symbol(),Bid,NormalizeDouble(Bid+Size*SL,Digits()),0,"Expert Final"+string(TimeStart));
   if(!SellTradeBool)
      Print("ERROR (No abrio Operacion):",GetLastError());
   else
     {
      if(EntraMartingala && Conteo_Martingala<Maximo_Martingala_Conteo)
         Conteo_Martingala++;
      Tiempo=Rates[0].time;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy_Op_2()
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   double Lote=0;

   bool EntraMartingala=false;

   double Size=0;
   for(int i=1; i<50; i++)
     {
      if(Rates[i].close>Rates[i].open)
        {
         Size=MathAbs(Rates[i].close-Rates[i].open);
         break;
        }
     }

   if(Modo_Martingala_Aumento==Modo_Multiplicador)
      Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala);
   else
      Lote=Lote_Martingala(Conteo_Martingala+1);

   bool BuyTradeBool=trade.Buy(Lote,Symbol(),Ask,NormalizeDouble(Ask-Size*SL,Digits()),0,"Expert Final"+string(TimeStart));
   if(!BuyTradeBool)
      Print("ERROR (No abrio Operacion):",GetLastError());
   else
     {
      Signal_Bool=true;
      Tiempo=Rates[0].time;
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell_Op_2()
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   double Lote=0;

   bool EntraMartingala=false;

   double Size=0;
   for(int i=1; i<50; i++)
     {
      if(Rates[i].close <Rates[i].open)
        {
         Size=MathAbs(Rates[i].close-Rates[i].open);
         break;
        }
     }


   if(Modo_Martingala_Aumento==Modo_Multiplicador)
      Lote=Lotes*MathPow(Multiplicador_Martingala,Conteo_Martingala);
   else
      Lote=Lote_Martingala(Conteo_Martingala+1);


   bool SellTradeBool=trade.Sell(Lote,Symbol(),Bid,NormalizeDouble(Bid+Size*SL,Digits()),0,"Expert Final"+string(TimeStart));
   if(!SellTradeBool)
      Print("ERROR (No abrio Operacion):",GetLastError());
   else
     {
      Signal_Bool=true;
      Tiempo=Rates[0].time;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Funcion_Igualar_Nivel_Valores(string Cadena)
  {
   ArrayResize(Array_NivelHedgeLote,0);
   int Size=0;
   int Conteo=0;
//string Cadena_Eva=MinimalProfit+";";
   string Cadena_Eva=Cadena+";";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(Cadena_Eva) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(Cadena_Eva,";",PosicionEncontrado+1);
      if(PosicionEncontrado!=-1)
        {
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         string Evalua_String=StringSubstr(Cadena_Eva,PosicionEncontradoAnterior,Sustraccion);
         string a=" ",b=" ";
         if(ComprobarSub(Evalua_String,a,b,true))
           {
            Size++;
            ArrayResize(Array_NivelHedgeLote,Size);
            Array_NivelHedgeLote[Size-1].Nivel=(int)a;
            Array_NivelHedgeLote[Size-1].HedgeLote=(double)b;
           }
         else
           {
            Print("Cadena String con mal planteamiento debe ser por ejemplo 1=2.3;2=2.4;etc");
            return(false);
           }
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarSub(string cadena,string &a,string &b,bool EsDouble)
  {
   int Dospuntos=0;
   ushort Digito=0;
   int segundo=0;
   int Numero=0;
   int Punto=0;

   for(int i=0; i<StringLen(cadena); i++)
     {
      Digito=StringGetCharacter(cadena,i);
      if((Digito<'0' || Digito>'9') && Digito!='=' && Digito!='.')
         return false;

      if(Dospuntos!=1 && Digito=='.')
         return false;

      if(Digito=='.')
         Punto++;

      if(Punto>=2)
         return false;

      if(Digito>='0' && Digito<='9')
         Numero++;

      if(Digito=='=')
        {
         Dospuntos++;
         a=StringSubstr(cadena,0,i);
         segundo=i+1;
         if(Numero==0)
            return false;
         Numero=0;
        }

      if(Dospuntos>=2)
        {
         return false;
        }
     }

   if(!EsDouble)
     {
      if(Punto!=0)
         return false;
     }

   b=StringSubstr(cadena,segundo,StringLen(cadena)-segundo);
//Print(a);
   if(Numero==0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLotes()
  {
   int Size=ArraySize(Array_NivelHedgeLote);
   if(Size==0)
     {
      Print("No hay valores para el lotaje");
      return false;
     }
   if(Size==1)
      return true;

   for(int i=1; i<Size; i++)
     {
      if(Array_NivelHedgeLote[i].Nivel<Array_NivelHedgeLote[i-1].Nivel)
        {
         Print("Los niveles deben de ser puestos de manera ordenada");
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Lote_Martingala(int Conteo)
  {

   int Size=ArraySize(Array_NivelHedgeLote);

   for(int i=Size-1; i>=0; i--)
     {
      if(Array_NivelHedgeLote[i].Nivel<=Conteo)
        {
         return NormalizeDouble(Array_NivelHedgeLote[i].HedgeLote,2);
        }
     }
   return (SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN));
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarLotaje()
  {
   double LotajeMaximo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   double LotajeMinimo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);

   int Size=ArraySize(Array_NivelHedgeLote);

   for(int i=Size-1; i>=0; i--)
     {
      if(LotajeMinimo>Array_NivelHedgeLote[i].HedgeLote || LotajeMaximo<Array_NivelHedgeLote[i].HedgeLote)
        {
         Print("ERROR Lotaje ",Array_NivelHedgeLote[i].HedgeLote," es menor a Lotaje minimo=(",DoubleToString(LotajeMinimo,2),") o maximo=(",DoubleToString(LotajeMaximo,2)," en nivel ",Array_NivelHedgeLote[i].Nivel);
         return false;
        }
      double Division=Array_NivelHedgeLote[i].HedgeLote/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      double Filtro=Division-int(Division);
      if(Filtro>0)
        {
         Print("ERROR Lotaje ",Array_NivelHedgeLote[i].HedgeLote," no es compatible con el paso Lotaje del Simbolo, debe ser divisible entre ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP),2));
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
