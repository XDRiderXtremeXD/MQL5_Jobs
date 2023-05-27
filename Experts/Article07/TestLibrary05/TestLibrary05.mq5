//+------------------------------------------------------------------+
//|                                                TestLibrary05.mq5 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "2016, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
//--- Including the trading panel class
#include "Program.mqh"
#resource "\\Indicators\\IndicadorMacdTrends.ex5"
string ShortIndicador="Indicador MACDTRENDS";

CProgram program;

input string S1="-----------------------   MA 1  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_1=10;
input int Ma_Shift_1=0;
input ENUM_MA_METHOD Ma_Method_1=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_1=PRICE_CLOSE;
input string S2="-----------------------   MA 2  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_2=12;
input int Ma_Shift_2=0;
input ENUM_MA_METHOD Ma_Method_2=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_2=PRICE_CLOSE;
input string S3="-----------------------   MA 3  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_3=14;
input int Ma_Shift_3=0;
input ENUM_MA_METHOD Ma_Method_3=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_3=PRICE_CLOSE;
input string S4="-----------------------   MA 4  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_4=16;
input int Ma_Shift_4=0;
input ENUM_MA_METHOD Ma_Method_4=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_4=PRICE_CLOSE;
input string S5="-----------------------   MA 5  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_5=18;
input int Ma_Shift_5=0;
input ENUM_MA_METHOD Ma_Method_5=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_5=PRICE_CLOSE;
input string S6_="-----------------------              MACD            -----------------------";//---------------------------------------------------------------------------------------------------------------
input int Fast_Ema_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S7_="-----------------------              TIMEFRAMES            -----------------------";//------------------------------------------------------------------------
input bool M1_=false;
input bool M2_=false;
input bool M3_=false;
input bool M4_=false;
input bool M5_=true;
input bool M6_=false;
input bool M10_=true;
input bool M12_=false;
input bool M15_=true;
input bool M30_=false;
input bool H1_=true;
input bool H2_=false;
input bool H3_=false;
input bool H4_=false;
input bool H6_=false;
input bool H8_=false;
input bool D1_=false;
input bool W1_=false;
input bool MN1_=false;
input string S8_="-----------------------              Configuracion Cuadros            -----------------------";//----------------------------------------------------
input int size_Cuadro_Ancho=50;
input int size_Cuadro_Largo=50;
input int cantidad_Filas=10;
input string S9_="-----------------------              Configuracion Alertas            -----------------------";//---------------------------------------------------
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

int Handle2=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(void)
  {
   Handle2=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\IndicadorMacdTrends.ex5",S1,Ma_Periodo_1, Ma_Shift_1,Ma_Method_1,Ma_AppliedPrice_1,S2,Ma_Periodo_2,Ma_Shift_2,Ma_Method_2,Ma_AppliedPrice_2,
                   S3,Ma_Periodo_3,Ma_Shift_3,Ma_Method_3,Ma_AppliedPrice_3,S4,Ma_Periodo_4,Ma_Shift_4,Ma_Method_4,Ma_AppliedPrice_4,S5,Ma_Periodo_5,Ma_Shift_5,Ma_Method_5,Ma_AppliedPrice_5,S6_,
                   Fast_Ema_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);

   if(Ma_Periodo_1>Ma_Periodo_2 || Ma_Periodo_2>Ma_Periodo_3 || Ma_Periodo_3>Ma_Periodo_4 || Ma_Periodo_4>Ma_Periodo_5)
      return INIT_PARAMETERS_INCORRECT;

   if(INVALID_HANDLE==Handle2)
     {
      Print(Handle2);
      Print("INVALID HANDLE");
      return INIT_FAILED;
     }

   program.OnInitEvent();
//--- Set up the trading panel
   if(!program.CreateExpertPanel(Handle2,0,1,size_Cuadro_Ancho,size_Cuadro_Largo,cantidad_Filas,M1_, M2_, M3_, M4_, M5_, M6_, M10_, M12_, M15_,
                                 M30_, H1_, H2_, H3_, H4_, H6_, H8_, D1_, W1_, MN1_))
     {
      ::Print(__FUNCTION__," > Failed to create graphical interface!");
      return(INIT_FAILED);
     }
   program.SetAlerts(AlertPC,AlertMovil,AlertMail);

   PonerIndicador(Handle2);

//--- Initialization successful
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   program.OnDeinitEvent(reason);
   if(reason!=REASON_CHARTCHANGE)
      IndicatorRelease(Handle2);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(void)
  {
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer(void)
  {
   program.OnTimerEvent();
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade(void)
  {
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int    id,
                  const long   &lparam,
                  const double &dparam,
                  const string &sparam)
  {
   program.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
bool PonerIndicador(int &handle)
  {
   int Total=ChartIndicatorsTotal(0,0);
   for(int i=Total-1; i>=0; i--)
     {
      string Name=ChartIndicatorName(0,0,i);
      Print(Name);
      if(Name==ShortIndicador)
         ChartIndicatorDelete(0,0,Name);
     }
   ChartIndicatorAdd(0,0,handle);
   return true;
  }
//+------------------------------------------------------------------+
