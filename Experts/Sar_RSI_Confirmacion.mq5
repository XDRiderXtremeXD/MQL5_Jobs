//+------------------------------------------------------------------+
//|                                         Sar_RSI_Confirmacion.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                             Sar_Confirmacion.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\Indicador_SAR_RSI_Confirmacion.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo_TP
  {
   Relacion_SL,
   Personalizado,
  };

enum Tipo_SL
  {
   EMA,
   Personalizado,
  };

enum Tipo_Operacion
  {
   Only_BUY,
   Only_SELL,
   Both,
  };


input Tipo_Operacion TipoOperacion=Both;//Tipo Operacion
input double Lote=0.01;
input Tipo_TP Tipo_TP_=Relacion_SL;//Tipo TP
input Tipo_SL Tipo_SL_=EMA;
input double Multiplicador_SL=1;
input double TP_Relacion_SL=1;
input int TP_Personalizado=200;
input string comentario="Expert Sar";
input int magicNumber=22222;
input string S0="===================   INDICADOR ===================";//=========================================================
input int Cruce_Deshabilitar=3;
input string S1="*********************   Configuracion SAR *********************";//***************************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S2_="********************* MACD *********************";//***************************************************************
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S4_="********************* RSI *********************";//***************************************************************
input int RSI_Period=14;
input ENUM_APPLIED_PRICE RSI_AppliedPrice=PRICE_CLOSE;
input uint level_up=70;
input uint level_dn=30;
input string S3_="********************* MA1 *********************";//***************************************************************
input bool MA_1=true;
input int Ma_Periodo_1=20;
input int Ma_Shift_1=0;
input ENUM_MA_METHOD Ma_Method_1=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_1=PRICE_CLOSE;
input string S32_="********************* MA2 *********************";//***************************************************************
input bool MA_2=true;
input int Ma_Periodo_2=20;
input int Ma_Shift_2=0;
input ENUM_MA_METHOD Ma_Method_2=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_2=PRICE_CLOSE;
input string S5="*********************  SL DINAMICO *********************";//************************************************************************************
input bool SL_Dinamico=true;
input int TrailingStart=200;//TS Start
input int TrailingStop=150;//TS Stop
input int TrailingStep=100;//TS Step



int Handle_1=0;
int Handle_2=0;

double Arrows_1_UP[3];
double Arrows_2_UP[3];

double Arrows_1_DN[3];
double Arrows_2_DN [3];

double SL_UP_1[3];
double SL_UP_2 [3];

double SL_DN_1[3];
double SL_DN_2 [3];

double MA_1_Buffer [3];
double MA_2_Buffer [3];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(!MA_1 && !MA_2)
     {
      Alert("ERROR: Almenos una media movil debe de estar activa");
      return INIT_PARAMETERS_INCORRECT;
     }


   if(MA_1)
      Handle_1=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Indicador_SAR_RSI_Confirmacion.ex5",Cruce_Deshabilitar,S1,SAR_Step,SAR_Maximun,
                       S2_,
                       Period_MACD,
                       Slow_Ema_MACD,
                       Signal_Period_MACD,
                       Applied_Price_MACD,
                       S3_,
                       Ma_Periodo_1,
                       Ma_Shift_1,
                       Ma_Method_1,
                       Ma_AppliedPrice_1,
                       S4_,
                       RSI_Period,
                       RSI_AppliedPrice,
                       level_up,
                       level_dn,
                       S32_,
                       clrNONE,
                       clrNONE);

   if(MA_2)
      Handle_2=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Indicador_SAR_RSI_Confirmacion.ex5",Cruce_Deshabilitar,S1,SAR_Step,SAR_Maximun,
                       S2_,
                       Period_MACD,
                       Slow_Ema_MACD,
                       Signal_Period_MACD,
                       Applied_Price_MACD,
                       S3_,
                       Ma_Periodo_2,
                       Ma_Shift_2,
                       Ma_Method_2,
                       Ma_AppliedPrice_2,
                       S4_,
                       RSI_Period,
                       RSI_AppliedPrice,
                       level_up,
                       level_dn,
                       S32_,
                       clrNONE,
                       clrNONE);


   trade.SetExpertMagicNumber(magicNumber);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(SL_Dinamico)
      TS_();

   int Bars_Actual=iBars(Symbol(),PERIOD_CURRENT);
   static int Bars_=Bars_Actual;


   if(Bars_!=Bars_Actual)
     {
      if((!MA_1 || (MA_1 && BarsCalculated(Handle_1)==Bars_Actual)) && (!MA_2 || (MA_2 && BarsCalculated(Handle_2)==Bars_Actual)))
        {
         if(
            (!MA_1 || (MA_1 && CopyBuffer(Handle_1,1,0,3,Arrows_1_DN)>0 && CopyBuffer(Handle_1,0,0,3,Arrows_1_UP)>0 && CopyBuffer(Handle_1,2,0,3,SL_UP_1)>0
                       && CopyBuffer(Handle_1,3,0,3,SL_DN_1)>0 && CopyBuffer(Handle_1,4,0,3,MA_1_Buffer)>0))
            &&
            (!MA_2 || (MA_2 && CopyBuffer(Handle_2,1,0,3,Arrows_2_DN)>0 && CopyBuffer(Handle_2,0,0,3,Arrows_2_UP)>0 && CopyBuffer(Handle_2,2,0,3,SL_UP_2)>0
                       && CopyBuffer(Handle_2,3,0,3,SL_DN_2)>0 && CopyBuffer(Handle_2,4,0,3,MA_2_Buffer)>0))
         )
           {

            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

            if(TipoOperacion==Only_SELL || TipoOperacion==Both)
               if((MA_1 && Arrows_1_DN[1]!=EMPTY_VALUE) || (MA_2 && Arrows_2_DN[1]!=EMPTY_VALUE))
                 {
                  double SL=(MA_1 && Arrows_1_DN[1]!=EMPTY_VALUE)?SL_UP_1[1]:SL_UP_2[1];
                  if(SL!=EMPTY_VALUE)
                    {
                     if(Bid<SL)
                       {
                        int Puntos=int(MathAbs(Bid-SL)/Point());
                        if(Tipo_SL_==EMA)
                          {
                           double MA=Arrows_1_DN[1]!=EMPTY_VALUE?MA_1_Buffer[1]:MA_2_Buffer[1];
                           Puntos=int((MA-Bid)/Point());
                          }
                        if(Puntos>=0)
                          {
                           Puntos=int(Puntos*Multiplicador_SL);
                           double TP=0;
                           if(Tipo_TP_==Relacion_SL)
                              TP=TP_Relacion_SL==0?0:NormalizeDouble(Bid-Puntos*Point()*TP_Relacion_SL,Digits());
                           else
                              TP=TP_Personalizado==0?0:NormalizeDouble(Bid-TP_Personalizado*Point(),Digits());

                           if(!trade.Sell(Lote,Symbol(),Bid,SL,TP,comentario))
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }
                       }
                    }
                 }

            if(TipoOperacion==Only_BUY || TipoOperacion==Both)
               if((MA_1 && Arrows_1_UP[1]!=EMPTY_VALUE) || (MA_2 && Arrows_2_UP[1]!=EMPTY_VALUE))
                 {
                  double SL=(MA_1 && Arrows_1_UP[1]!=EMPTY_VALUE)?SL_DN_1[1]:SL_DN_2[1];
                  if(SL!=EMPTY_VALUE)
                    {
                     if(Ask>SL)
                       {
                        int Puntos=int(MathAbs(Ask-SL)/Point());
                        if(Tipo_SL_==EMA)
                          {
                           double MA=Arrows_1_UP[1]!=EMPTY_VALUE?MA_1_Buffer[1]:MA_2_Buffer[1];
                           Puntos=int((Ask-MA)/Point());
                          }
                        if(Puntos>=0)
                          {
                           Puntos=int(Puntos*Multiplicador_SL);
                           double TP=0;
                           if(Tipo_TP_==Relacion_SL)
                              TP=TP_Relacion_SL==0?0:NormalizeDouble(Ask+Puntos*Point()*TP_Relacion_SL,Digits());
                           else
                              TP=TP_Personalizado==0?0:NormalizeDouble(Ask+TP_Personalizado*Point(),Digits());

                           if(!trade.Buy(Lote,Symbol(),Ask,SL,TP,comentario))
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }
                       }
                    }
                 }
            Bars_=Bars_Actual;
           }
        }
     }

  }
//+------------------------------------------------------------------+
void TS_() // FUNCION DEL TS Y BREAK VEN
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   uint DiferenciaStep=TrailingStart-(TrailingStart-TrailingStop)+TrailingStep;
   uint Diferencia=TrailingStop;

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (NormalizeDouble(Bid-DiferenciaStep*Point(),Digits())>=PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL) ==0) && NormalizeDouble(Bid-TrailingStart*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Bid-Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL  && (NormalizeDouble(Ask+DiferenciaStep*Point(),Digits())<=PositionGetDouble(POSITION_SL)  || PositionGetDouble(POSITION_SL) ==0) && NormalizeDouble(Ask+TrailingStart*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Ask+Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());
        }
     }
  }
//+------------------------------------------------------------------+
