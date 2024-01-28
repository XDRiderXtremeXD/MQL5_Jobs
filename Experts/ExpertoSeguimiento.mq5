//+------------------------------------------------------------------+
//|                                           ExpertoSeguimiento.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

#resource "\\Indicators\\SeguimientoTendencia.ex5"



input string S4="========== Configuracion Trade ==========";//==========================================================================================
input double Lote=0.01;
input string comentario="Expert";
input int magicNumber=2222222;
input string S5="========== Configuracion Indicador ==========";//==========================================================================================
input int numMaximoEspera=7;//Numero maximo Espera MACD positivo
input int TP_points_small=100;//TP puntos pequeño
input int TP_points_largo_contra=250;//TP puntos largo en contra
input int TP_points_largo_positivo=200;//TP puntos largo en positivo
input int SL_points=200;//SL puntos
input string S7="========== Configuracion Estocastico ==========";//==========================================================================================
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int level_sobrecompra=70;//Nivel Sobre Compra
input int level_sobreventa=30;//Nivel Sobre Venta
input string S8="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=12;
input int Ema_Lenta=26;
input int MediaMovilExponencial=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S9="========== Horario Pausa ==========";//==========================================================================================
input string Start="21:48";
input string End="23:05";

int handleSeguimiento=0;

double Entrada[];
double EntradaColor[];
double SL[];
double TP1[];
double TP2[];


struct structOperaciones
  {
   double            SL;
   double            TP;
   bool              IsBuy;
  };

structOperaciones OperacionesGuardadas[];

int horaStart=0;
int minutoStart=0;
int horaEnd=0;
int minutoEnd=0;


int diaTiempo=-1;
datetime startTime=0;
datetime endTime=0;

datetime startTimeLast=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArrayResize(OperacionesGuardadas,0);

   handleSeguimiento=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\SeguimientoTendencia",
                             numMaximoEspera,
                             TP_points_small,
                             TP_points_largo_contra,
                             TP_points_largo_positivo,
                             SL_points,
                             S7,
                             K_Periodo,
                             D_Periodo,
                             Slowing,
                             Ma_Method_EST,
                             STO_EST,
                             level_sobrecompra,
                             level_sobreventa,
                             S8,
                             Ema_Rapida,
                             Ema_Lenta,
                             MediaMovilExponencial,
                             Applied_Price_MACD);

   trade.SetExpertMagicNumber(magicNumber);

   if(!SacarHoraMinuto(Start,horaStart,minutoStart))
      return INIT_PARAMETERS_INCORRECT;
   if(!SacarHoraMinuto(End,horaEnd,minutoEnd))
      return INIT_PARAMETERS_INCORRECT;

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
   if(!SacarTiempoStartEnd())
      return;

   int BarsActual=iBars(Symbol(),PERIOD_CURRENT);
   static int BarsLast=BarsActual;
   static bool fueraHorario=false;

   if(EstaEnElHorarioPausa(TimeCurrent()))
     {
      fueraHorario=false;
      if(startTimeLast<startTime && TimeCurrent()>=startTime)
        {
         CerrarOperacionesYGuardar();
         startTimeLast=startTime;
        }
     }
   else
      if(fueraHorario==false)
        {
         fueraHorario=true;
         AbrirOperacionesGuardadasYliberarData();
        }



   if(BarsLast!=BarsActual)
     {
      if(SetValuesBuffers(3,BarsActual))
        {
         if(Entrada[1]!=EMPTY_VALUE)
           {
            bool isBuy=(EntradaColor[1]==1);
            if(!EstaEnElHorarioPausa(TimeCurrent()))
              {
               if(TP1[1]!=EMPTY_VALUE)
                  Operar(isBuy,SL[1],TP1[1]);
               if(TP2[1]!=EMPTY_VALUE)
                  Operar(isBuy,SL[1],TP2[1]);

               CerrarOperacionesContrarias(isBuy);
              }
            else
               BorrarOperacionesGuardadasContrarias(isBuy);
           }
         BarsLast=BarsActual;
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetValuesBuffers(int toCopy,int bars)
  {
//--- check if all data calculated
   if(BarsCalculated(handleSeguimiento)<bars)
      return(false);
//--- we can copy not all data
//--- try to copy
   if(CopyBuffer(handleSeguimiento,0,0,toCopy,Entrada)<=0)
      return(false);
   if(CopyBuffer(handleSeguimiento,1,0,toCopy,EntradaColor)<=0)
      return(false);
   if(CopyBuffer(handleSeguimiento,2,0,toCopy,SL)<=0)
      return(false);
   if(CopyBuffer(handleSeguimiento,3,0,toCopy,TP1)<=0)
      return(false);
   if(CopyBuffer(handleSeguimiento,4,0,toCopy,TP2)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
void Operar(bool IsBuy,double SL_,double TP)
  {
   if(!IsBuy)
     {
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      if(!trade.Sell(Lote,Symbol(),Bid,SL_,TP,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      if(!trade.Buy(Lote,Symbol(),Ask,SL_,TP,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperacionesContrarias(bool isBuy)
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==magicNumber)
            if(isBuy?(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL):(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY))
               trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperacionesYGuardar()
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==magicNumber)
           {
            GuardarOperacion();
            trade.PositionClose(ticket,-1);
           }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AbrirOperacionesGuardadasYliberarData()
  {
   int total=ArraySize(OperacionesGuardadas);

   for(int i = total-1; i >= 0; i--)
      Operar(OperacionesGuardadas[i].IsBuy,OperacionesGuardadas[i].SL,OperacionesGuardadas[i].TP);

   ArrayResize(OperacionesGuardadas,0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GuardarOperacion()
  {
   bool IsBuy=PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY;
   double SL_=PositionGetDouble(POSITION_SL);
   double TP=PositionGetDouble(POSITION_TP);

   int Size=ArraySize(OperacionesGuardadas);
   ArrayResize(OperacionesGuardadas,Size+1);
   OperacionesGuardadas[Size].IsBuy=IsBuy;
   OperacionesGuardadas[Size].SL=SL_;
   OperacionesGuardadas[Size].TP=TP;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BorrarOperacionesGuardadasContrarias(bool IsBuy)
  {
   int total=ArraySize(OperacionesGuardadas);

   structOperaciones OperacionesGuardadasCopy[];
   ArrayResize(OperacionesGuardadasCopy,0);

   for(int i = total-1; i >= 0; i--)
     {
      if(OperacionesGuardadas[i].IsBuy==IsBuy)
        {
         int size=ArraySize(OperacionesGuardadasCopy);
         ArrayResize(OperacionesGuardadasCopy,size+1);
         OperacionesGuardadasCopy[size].IsBuy=IsBuy;
         OperacionesGuardadasCopy[size].SL=OperacionesGuardadas[i].SL;
         OperacionesGuardadasCopy[size].TP=OperacionesGuardadas[i].TP;
        }
     }
   ArrayCopy(OperacionesGuardadas,OperacionesGuardadasCopy,0,0,WHOLE_ARRAY);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SacarHoraMinuto(string horaMinuto,int &hora,int &minuto)
  {
   string hora_minuto[];
   StringSplit(horaMinuto,':',hora_minuto);
   if(ArraySize(hora_minuto)!=2)
      return false;

   string comentario_="";

   if(!VerificarEntero(hora_minuto[0],comentario_))
     {
      Alert(comentario_+" en "+horaMinuto);
      return false;
     }

   if(!VerificarEntero(hora_minuto[1],comentario_))
     {
      Alert(comentario_+" en "+horaMinuto);
      return false;
     }

   hora=(int)StringToInteger(hora_minuto[0]);
   minuto=(int)StringToInteger(hora_minuto[1]);



   if(!VerificarHora_o_Minuto(hora,true,comentario_))
     {
      Alert(comentario_+" en ",horaMinuto);
      return false;
     }

   if(!VerificarHora_o_Minuto(minuto,false,comentario_))
     {
      Alert(comentario_+" en ",horaMinuto);
      return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarEntero(string evaluaString,string &comentario_)
  {
   for(int i=0; i<StringLen(evaluaString); i++)
     {
      ushort char_=StringGetCharacter(evaluaString,i);
      if(!('0'<=char_ && char_<='9'))
        {
         comentario_="Los valores hora o minuto deben de ser valores enteros";
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarHora_o_Minuto(int clockPointer,bool IsHora,string &comentario_)
  {
   comentario_=IsHora?("Hora es mayor a 23"):("Minuto es mayor a 59");
   return (clockPointer<(IsHora?(24):(60)));
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool SacarTiempoStartEnd()
  {
   MqlDateTime timeActual;
   TimeToStruct(TimeCurrent(),timeActual);
   int diaActual=timeActual.day_of_year;

   if(diaTiempo!=diaActual)
     {
      timeActual.sec=0;

      timeActual.min=minutoStart;
      timeActual.hour=horaStart;

      startTime=StructToTime(timeActual);

      timeActual.min=minutoEnd;
      timeActual.hour=horaEnd;

      endTime=StructToTime(timeActual);

      diaTiempo=diaActual;
     }

   return (diaTiempo!=-1);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EstaEnElHorarioPausa(datetime tiempoEvalua)
  {
   if(startTime<endTime)
     {
      if(startTime<=tiempoEvalua && tiempoEvalua<endTime)
         return true;
     }
   else
     {
      if(startTime<=tiempoEvalua || tiempoEvalua<endTime)
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
