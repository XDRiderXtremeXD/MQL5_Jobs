//+------------------------------------------------------------------+
//|                                    Media_Movil-3_Indicadores.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

int Alligator;
int Bollinger_1;
int Bollinger_2;
int ForceIndex;
int Bollinger_ForceIndex;
int Klinger_Oscilator;
int Bollinger_Klinger;
int ADX;
int Bollinger_ADX;
int EMA_Alligator;
int Divergencia_Puntos_1;
int Divergencia_Puntos_2;
int SAR;

input string Settings_Trades="***Settings_Trades***";
input double Lotes=0.01;
input double StopLoss=30; //Stop Loss in PIPS
input double TakeProfit=30;// Take Profit in PIPS

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

input string Settings_DivergenciaPuntos_1="***Settings_DivergenciaPuntos_1***";
input int PeriodoDivergenciaPuntos_1=20;
input int DesviacionDivergenciaPuntos_1=2;

input string Settings_DivergenciaPuntos_2="***Settings_DivergenciaPuntos_2***";
input int PeriodoDivergenciaPuntos_2=10;
input int DesviacionDivergenciaPuntos_2=0;

input string Settings_Bollinger_2="***Settings_Bollinger_2***";
input int Bollinger_2_Periodo=30;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=2;
input double DistanciaBollinger2=0.00015;
input string Settings_Bollinger_EMA_Alligator="***Settings_Bollinger_EMA_Alligator***";
input int Periodo_EMA=50;
input int Shift_EMA=0;
input ENUM_MA_METHOD Mode_EMA=MODE_EMA;
input string Settings_Force_Index="***Settings_Force_Index***";
input int Force_Periodo=30;
input ENUM_MA_METHOD Force_Mode=MODE_SMA;
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_Bollinger_ForceIndex="***Settings_Bollinger_ForceIndex***";
input int Bollinger_ForceIndex_Periodo=20;
input int Bollinger_ForceIndex_Shift=0;
input int Bollinger_ForceIndex_Desviation=2;
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input string Settings_Bollinger_Klinger="***Settings_Bollinger_Klinger***";
input int Bollinger_Klinger_Periodo=20;
input int Bollinger_Klinger_Shift=0;
input int Bollinger_Klinger_Desviation=2;
input string Settings_ADX="***Settings_ADX***";
input uint    PeriodoADX=25;
input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";
input int Bollinger_ADX_Periodo=20;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;
input string Settings_Parabolic_Sar="***Settings_Parabolic_SAR***";
input double SAR_Step=0.02;
input double SAR_Maximo=0.2;
input int MaximoVelasSar=6;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double AlligatorBuffer[];
double ForceIndexBuffer[];
double KlingerBuffer[];
double ADXBuffer[];
double SARBuffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_1_Buffer_Central[];
double Bollinger_2_Buffer_DN[];
double Bollinger_2_Buffer_UP[];
double Bollinger_2_Buffer_BASE[];
double Bollinger_ForceIndex_Buffer_DN[];
double Bollinger_ForceIndex_Buffer_UP[];
double Bollinger_Klinger_Buffer_DN[];
double Bollinger_Klinger_Buffer_UP[];
double Bollinger_ADX_Buffer_DN[];
double Bollinger_ADX_Buffer_UP[];
double EMA_Buffer_Alligator[];
double Divergencia_Puntos_1_Buffer_UP[];
double Divergencia_Puntos_1_Buffer_DN[];
double Divergencia_Puntos_2_Buffer_UP[];
double Divergencia_Puntos_2_Buffer_DN[];

double Point_,TakeProfit_,StopLoss_;

datetime Sell_Tiempo=0;
datetime Buy_Tiempo=0;
datetime PrevTime_Buy=0;
datetime PrevTime_Sell=0;

datetime TimeStart;

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   EMA_Alligator=iMA(Symbol(),PERIOD_CURRENT,Periodo_EMA,Shift_EMA,Mode_EMA,Bollinger_1);
   //Bollinger_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Bollinger_1);
   //ForceIndex=iForce(Symbol(),PERIOD_CURRENT,Force_Periodo,Force_Mode,Force_Volume_Type);
   //Bollinger_ForceIndex=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ForceIndex_Periodo,Bollinger_ForceIndex_Shift,Bollinger_ForceIndex_Desviation,ForceIndex);
   //Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);
   //Bollinger_Klinger=iBands(Symbol(),PERIOD_CURRENT,Bollinger_Klinger_Periodo,Bollinger_Klinger_Shift,Bollinger_Klinger_Desviation,Klinger_Oscilator);
   ADX=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX);
   Bollinger_ADX=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX);
   Divergencia_Puntos_1=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
   ,PeriodoDivergenciaPuntos_1,0,DesviacionDivergenciaPuntos_1);
   Divergencia_Puntos_2=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
   ,PeriodoDivergenciaPuntos_2,0,DesviacionDivergenciaPuntos_2);
   SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximo);
   

   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(AlligatorBuffer,true);
  // ArraySetAsSeries(ForceIndexBuffer,true);
  // ArraySetAsSeries(ADXBuffer,true);
 //  ArraySetAsSeries(KlingerBuffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_1_Buffer_Central,true);
 //  ArraySetAsSeries(Bollinger_2_Buffer_UP,true);
 //  ArraySetAsSeries(Bollinger_2_Buffer_DN,true);
  // ArraySetAsSeries(Bollinger_2_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP,true);
 //  ArraySetAsSeries(Bollinger_Klinger_Buffer_DN,true);
 //  ArraySetAsSeries(Bollinger_Klinger_Buffer_UP,true);
 //  ArraySetAsSeries(Bollinger_ForceIndex_Buffer_DN,true);
 //  ArraySetAsSeries(Bollinger_ForceIndex_Buffer_UP,true);
   ArraySetAsSeries(EMA_Buffer_Alligator,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_UP,true);
   ArraySetAsSeries(SARBuffer,true);

   if((Digits()==5)||(Digits()==3))
     { Point_=Point()*10;}
   else
      Point_=Point();

   TakeProfit_=Point_*TakeProfit;
   StopLoss_=Point_*StopLoss;
   
   TimeStart=TimeCurrent();

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,8,Rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   CopyBuffer(SAR,0,0,3,SARBuffer);
   CopyBuffer(Bollinger_1,1,0,3,Bollinger_1_Buffer_UP);
   CopyBuffer(Bollinger_1,2,0,3,Bollinger_1_Buffer_DN);
   CopyBuffer(Bollinger_1,0,0,40,Bollinger_1_Buffer_Central);
   //CopyBuffer(Bollinger_2,1,0,4,Bollinger_2_Buffer_UP);
   //CopyBuffer(Bollinger_2,2,0,4,Bollinger_2_Buffer_DN);
   //CopyBuffer(Bollinger_2,0,0,4,Bollinger_2_Buffer_BASE);
   //CopyBuffer(ForceIndex,0,0,4,ForceIndexBuffer);
  // CopyBuffer(Bollinger_ForceIndex,2,0,4,Bollinger_ForceIndex_Buffer_DN);
  // CopyBuffer(Bollinger_ForceIndex,1,0,4,Bollinger_ForceIndex_Buffer_UP);
  // CopyBuffer(Klinger_Oscilator,0,0,4,KlingerBuffer);
   //CopyBuffer(Bollinger_Klinger,2,0,4,Bollinger_Klinger_Buffer_DN);
   //CopyBuffer(Bollinger_Klinger,1,0,4,Bollinger_Klinger_Buffer_UP);
   CopyBuffer(ADX,0,0,45,ADXBuffer);
   //CopyBuffer(Bollinger_ADX,2,0,45,Bollinger_ADX_Buffer_DN);
   CopyBuffer(Bollinger_ADX,1,0,45,Bollinger_ADX_Buffer_UP);
   CopyBuffer(EMA_Alligator,0,0,40,EMA_Buffer_Alligator);
   CopyBuffer(Divergencia_Puntos_1,0,0,7,Divergencia_Puntos_1_Buffer_UP);
   CopyBuffer(Divergencia_Puntos_1,1,0,7,Divergencia_Puntos_1_Buffer_DN);
   CopyBuffer(Divergencia_Puntos_2,0,0,7,Divergencia_Puntos_2_Buffer_UP);
   CopyBuffer(Divergencia_Puntos_2,1,0,7,Divergencia_Puntos_2_Buffer_DN);


   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   ResetLastError();

   int Buy=0,Sell=0;
    
   static datetime PrevTime=0;
   
   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Expert Final"+string (TimeStart))
      continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         Buy++;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         Sell++;
     }

   if( Buy==0 && Divergencia_Puntos_1_Buffer_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_DN[2]!=EMPTY_VALUE && Rates[5].low>EMA_Buffer_Alligator[5] &&  
      Rates[4].low>EMA_Buffer_Alligator[4] &&  Rates[3].low>EMA_Buffer_Alligator[3] &&  Rates[2].low>EMA_Buffer_Alligator[2] &&  Rates[1].low>EMA_Buffer_Alligator[1] && 
      Rates[1].close>Bollinger_1_Buffer_DN[1] && EMA_Buffer_Alligator[2]<Bollinger_1_Buffer_DN[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1;j<36;j++){
      if(EMA_Buffer_Alligator[j]>Bollinger_1_Buffer_Central[j]){
      AlertaCondicion1=false; break;
      }
      }
      bool AlertaCondicion2=false;
      for(int j=3;j<40;j++){
      if(ADXBuffer[j]>Bollinger_ADX_Buffer_UP[j] && ADXBuffer[j+1]>Bollinger_ADX_Buffer_UP[j+1] && ADXBuffer[j+2]>Bollinger_ADX_Buffer_UP[j+2] )
      {AlertaCondicion2=true; break;}
      }
      if(AlertaCondicion1 && AlertaCondicion2){
      Buy_Tiempo=Rates[0].time+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
      Print(Buy_Tiempo);
      }
     }

   if(Sell==0 && Divergencia_Puntos_1_Buffer_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_UP[2]!=EMPTY_VALUE && Rates[5].high<EMA_Buffer_Alligator[5] &&  
      Rates[4].high<EMA_Buffer_Alligator[4] &&  Rates[3].high<EMA_Buffer_Alligator[3] &&  Rates[2].high<EMA_Buffer_Alligator[2] &&  Rates[1].high<EMA_Buffer_Alligator[1]
      && Rates[1].close<Bollinger_1_Buffer_UP[1] && EMA_Buffer_Alligator[2]>Bollinger_1_Buffer_UP[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1;j<36;j++){
      if(EMA_Buffer_Alligator[j]<Bollinger_1_Buffer_Central[j]){
      AlertaCondicion1=false; break;
      }
      }
      bool AlertaCondicion2=false;
      for(int j=3;j<40;j++){
      if(ADXBuffer[j]>Bollinger_ADX_Buffer_UP[j] && ADXBuffer[j+1]>Bollinger_ADX_Buffer_UP[j+1] && ADXBuffer[j+2]>Bollinger_ADX_Buffer_UP[j+2] )
      {AlertaCondicion2=true; break;}
      }
     
      if(AlertaCondicion1 && AlertaCondicion2){
      Sell_Tiempo=Rates[0].time+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
      Print(Sell_Tiempo);
      }
     }
     
     
    if(Buy_Tiempo>Rates[0].time && SARBuffer[2]>=Rates[2].high && SARBuffer[1]<=Rates[1].low && Buy_Tiempo!=0 && Buy==0 && Rates[1].close>Bollinger_1_Buffer_Central[1] && Rates[0].open>Bollinger_1_Buffer_Central[0] 
     && PrevTime_Buy!=Rates[0].time && Bollinger_1_Buffer_Central[0]<Rates[0].close){
     bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,Bid-StopLoss_,Ask+TakeProfit_,"Expert Final"+string (TimeStart));
      if(BuyTradeBool)
        {
         if(AlertPC)
            Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMovil)
            SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMail)
            SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
        PrevTime_Buy=Rates[0].time;
        }
      else
         Print("ERROR (No abrio Operacion):",GetLastError());
     }  
         
     if(Sell_Tiempo>Rates[0].time && SARBuffer[2]<=Rates[2].low && SARBuffer[1]>=Rates[1].high && Sell_Tiempo!=0 && Sell==0 && Rates[1].close<Bollinger_1_Buffer_Central[1] && Rates[0].open<Bollinger_1_Buffer_Central[0]
     && PrevTime_Sell!=Rates[0].time && Bollinger_1_Buffer_Central[0]>Rates[0].close){ 
      bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,Ask+StopLoss_,Bid-TakeProfit_,"Expert Final"+string (TimeStart));
      if(SellTradeBool)
        {
         if(AlertPC)
            Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMovil)
            SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMail)
            SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         PrevTime_Sell=Rates[0].time;
        }
      else
         Print("ERROR (No abrio Operacion):",GetLastError());
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
