//+------------------------------------------------------------------+
//|                                           SAR_CONFIRMACION_2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\Indicador_SAR_Confirmacion_2.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo_TP
  {
   Relacion_SL,
   Personalizado,
  };

enum Tipo_Operacion
  {
   Only_BUY,
   Only_SELL,
   Both,
  };

enum Tipo_Direccion
  {
   Normal,
   Contrario,
  };


input Tipo_Direccion TipoDireccion=Normal;//Tipo Direccion
input string S20="===================   OPERATIVA ===================";//=========================================================
input Tipo_Operacion TipoOperacion=Both;//Tipo Operacion
input double Lote=0.01;
input string comentario="Expert Sar";
input int magicNumber=22222;
input string S02="===================   TP Y SL ===================";//=========================================================
input Tipo_TP Tipo_TP_=Relacion_SL;//Tipo TP
double Multiplicador_SL=1;
input double TP_Relacion_SL=1;
input int TP_Personalizado=200;//TP Personalizado (si Modo Normal)
input int SL_Personalizado=200;//SL Personalizado (si Modo Contrario)
input string S0="===================   INDICADOR ===================";//=========================================================
input string S1="*********************   Configuracion SAR *********************";//***************************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S3_="********************* MA *********************";//***************************************************************
input int Ma_Periodo=50;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S5="*********************   Configuracion Color *********************";//***************************************************************
input color Color_Alcista=clrLime;
input color Color_Bajista=clrMagenta;


int Handle_1=0;

double Arrows_BUY[];
double Arrows_SELL[];
double SAR[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Handle_1=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Indicador_SAR_Confirmacion_2.ex5",S1
                    ,SAR_Step,SAR_Maximun,
                    S3_,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice,
                    S5,Color_Alcista,Color_Bajista);

   trade.SetExpertMagicNumber(magicNumber);

   ArraySetAsSeries(Arrows_BUY,true);
   ArraySetAsSeries(Arrows_SELL,true);
   ArraySetAsSeries(SAR,true);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   int Bars_Actual=iBars(Symbol(),PERIOD_CURRENT);
   static int Bars_=Bars_Actual;


   if(Bars_!=Bars_Actual)
     {
      if(BarsCalculated(Handle_1)==Bars_Actual)
        {
         if(CopyBuffer(Handle_1,1,0,3,Arrows_SELL)>0 && CopyBuffer(Handle_1,0,0,3,Arrows_BUY)>0 && CopyBuffer(Handle_1,2,0,3,SAR)>0)
           {
            TS_SAR(SAR[1]);

            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

            if(TipoOperacion==Only_SELL || TipoOperacion==Both)
               if(Arrows_SELL[1]!=EMPTY_VALUE)
                 {
                  double SL=SAR[1];
                  if(SL!=EMPTY_VALUE)
                    {

                     if(Bid<SL)
                       {
                        if(TipoDireccion==Normal)
                          {
                           int Puntos=int(int(MathAbs(Bid-SL)/Point())*Multiplicador_SL);
                           double TP=0;
                           if(Tipo_TP_==Relacion_SL)
                              TP=TP_Relacion_SL==0?0:NormalizeDouble(Bid-Puntos*Point()*TP_Relacion_SL,Digits());
                           else
                              TP=TP_Personalizado==0?0:NormalizeDouble(Bid-TP_Personalizado*Point(),Digits());

                           if(!trade.Sell(Lote,Symbol(),Bid,SL,TP,comentario))
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }
                        else
                          {
                           int Puntos=int(int(MathAbs(Ask-SL)/Point())*Multiplicador_SL);
                           double SL_=0;
                           double TP=SL;

                           if(Tipo_TP_==Relacion_SL)
                              SL_=TP_Relacion_SL==0?0:NormalizeDouble(Ask-Puntos*Point()/TP_Relacion_SL,Digits());
                           else
                              SL_=SL_Personalizado==0?0:NormalizeDouble(Ask-SL_Personalizado*Point(),Digits());

                           if(!trade.Buy(Lote,Symbol(),Ask,SL_,TP,comentario))
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }

                       }
                    }
                 }

            if(TipoOperacion==Only_BUY || TipoOperacion==Both)
               if(Arrows_BUY[1]!=EMPTY_VALUE)
                 {
                  double SL=SAR[1];
                  if(SL!=EMPTY_VALUE)
                    {
                     if(Ask>SL)
                       {
                        if(TipoDireccion==Normal)
                          {
                           int Puntos=int(int(MathAbs(Ask-SL)/Point())*Multiplicador_SL);

                           double TP=0;
                           if(Tipo_TP_==Relacion_SL)
                              TP=TP_Relacion_SL==0?0:NormalizeDouble(Ask+Puntos*Point()*TP_Relacion_SL,Digits());
                           else
                              TP=TP_Personalizado==0?0:NormalizeDouble(Ask+TP_Personalizado*Point(),Digits());

                           if(!trade.Buy(Lote,Symbol(),Ask,SL,TP,comentario))
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }
                        else
                          {
                           int Puntos=int(int(MathAbs(Bid-SL)/Point())*Multiplicador_SL);
                           double SL_=0;
                           double TP=SL;
                           if(Tipo_TP_==Relacion_SL)
                              SL_=TP_Relacion_SL==0?0:NormalizeDouble(Bid+Puntos*Point()/TP_Relacion_SL,Digits());
                           else
                              SL_=SL_Personalizado==0?0:NormalizeDouble(Bid+SL_Personalizado*Point(),Digits());

                           if(!trade.Sell(Lote,Symbol(),Bid,SL_,TP,comentario))
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
void TS_SAR(double sar) // FUNCION DEL TS Y BREAK VEN
  {
   if(sar==EMPTY_VALUE)
      return;

   sar=NormalizeDouble(sar,Digits());

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         double precio=PositionGetDouble(POSITION_PRICE_CURRENT);

         if(sar<precio && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (sar>=PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL) ==0))
            if(!trade.PositionModify(Ticket,sar,PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

         if(sar>precio && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL  && (sar<=PositionGetDouble(POSITION_SL)  || PositionGetDouble(POSITION_SL) ==0))
            if(!trade.PositionModify(Ticket,sar,PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
