//+------------------------------------------------------------------+
//|                                                 Guardian MT5.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

#include<Trade\Trade.mqh>
CTrade trade;

int a=0;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };
input string Parametros_Control="**********************Parametros Control**********************";///******************************************************************************************************************************
input int Magic=1000;
input int PorcentajeBE=40;
input int MaximoDesfase_Default=5;
input uint BE_Desfase_Default=1;//BE Desfase en Puntos
input ENUM_Horas  Hora_Inicio=_2am;
input ENUM_Horas Hora_Final=_4pm;
input bool Activar_Reseteo_Horario=true;
input ENUM_Horas Hora_Reseteo=_4am;
input string Parametros_Lineas="**********************Parametros Lineas**********************";///******************************************************************************************************************************
input color ColorSell=clrAqua;
input color ColorBuy=clrMagenta;
input ENUM_LINE_STYLE StylePE=STYLE_DASHDOT;
input int WidthPE=1;
input string Simbolos_Autorizados_P="**********************Simbolos Autorizados**********************";///*****************************************************************************************************************************
input string Simbolos_Autorizados="USDJPY,XAUUSD";
input string Parametros_Spread="**********************Parametros Spread**********************";///******************************************************************************************************************************
input string Simbolos_1="USDJPY,XAUUSD";
input int Maximo_Spread_1=2;
input string Simbolos_2="USDJPY,NZDUSD";
input int Maximo_Spread_2=2;
input string Simbolos_3="";
input int Maximo_Spread_3=2;
input string Simbolos_4="";
input int Maximo_Spread_4=2;
input string Parametros_Lotaje="**********************Parametros Lotaje**********************";///******************************************************************************************************************************
input string Simbolos_LT_1="USDJPY,XAUUSD";
input double Lotaje_1=0.01;
input string Simbolos_LT_2="USDJPY,NZDUSD";
input double Lotaje_2=0.01;
input string Simbolos_LT_3="";
input double Lotaje_3=0.01;
input string Simbolos_LT_4="";
input double Lotaje_4=0.01;
input string Parametros_Stop_Loss="**********************Parametros StopLoss**********************";///******************************************************************************************************************************
input string Simbolos_SL_1="USDJPY,XAUUSD";
input int SL_1=200;
input string Simbolos_SL_2="USDJPY,NZDUSD";
input int SL_2=200;
input string Simbolos_SL_3="";
input int SL_3=200;
input string Simbolos_SL_4="";
input int SL_4=200;
input string Parametros_Take_Profit="**********************Parametros TakeProfit**********************";///******************************************************************************************************************************
input string Simbolos_TP_1="USDJPY,XAUUSD";
input int TP_1=400;
input string Simbolos_TP_2="USDJPY,NZDUSD";
input int TP_2=400;
input string Simbolos_TP_3="";
input int TP_3=400;
input string Simbolos_TP_4="";
input int TP_4=400;
input string Parametros_MaximoDesfase="**********************Parametros Maximo Desfase**********************";///******************************************************************************************************************************
input string Simbolos_MD_1="USDJPY,XAUUSD";
input int MaximoDesfase_1=5;
input string Simbolos_MD_2="";
input int MaximoDesfase_2=5;
input string Simbolos_MD_3="";
input int MaximoDesfase_3=5;
input string Simbolos_MD_4="";
input int MaximoDesfase_4=5;
input string Parametros_BE_Desfase="**********************Parametros BE Desfase**********************";///******************************************************************************************************************************
input string Simbolos_BE_1="USDJPY,XAUUSD";
input uint BE_Desfase_1=5;
input string Simbolos_BE_2="";
input uint BE_Desfase_2=5;
input string Simbolos_BE_3="";
input uint BE_Desfase_3=5;
input string Simbolos_BE_4="";
input uint BE_Desfase_4=5;


input string Parametros_Estilizador_Variados="**********************Parametros Estilizador Boton**********************";///******************************************************************************************************************************
input int DesplazarTextoDerecha=30;
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=40;
input int Boton_Desplazamiento_Y=40;
input int Separacion=10;
input int Separacion_Y=10;

ushort Dia_Reseteo=500;

struct EntradasPendientes
  {
   string            Simbolo;
   long               TipoEntrada;
   double            PE;
   double            SL;
   double            TP;
   bool              Mascara;
   double            Lote;
   ulong               Ticket;
  };

EntradasPendientes Entradas[];

string CommentExpert="Experto Guardian";

string ArraySymbolos_1[],ArraySymbolos_2[],ArraySymbolos_3[],ArraySymbolos_4[],ArraySimbolos_Autorizados[];
string ArraySymbolos_TP_1[],ArraySymbolos_TP_2[],ArraySymbolos_TP_3[],ArraySymbolos_TP_4[];
string ArraySymbolos_SL_1[],ArraySymbolos_SL_2[],ArraySymbolos_SL_3[],ArraySymbolos_SL_4[];
string ArraySymbolos_LT_1[],ArraySymbolos_LT_2[],ArraySymbolos_LT_3[],ArraySymbolos_LT_4[];
string ArraySymbolos_MD_1[],ArraySymbolos_MD_2[],ArraySymbolos_MD_3[],ArraySymbolos_MD_4[];
string ArraySymbolos_BE_1[],ArraySymbolos_BE_2[],ArraySymbolos_BE_3[],ArraySymbolos_BE_4[];


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   ArrayResize(Entradas,50);
   for(int i=0; i<ArraySize(Entradas); i++)
      Entradas[i].Mascara=false;

   if(!RegistrarSimbolo(Simbolos_1,ArraySymbolos_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   Print("Entra2");
   if(!RegistrarSimbolo(Simbolos_2,ArraySymbolos_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_3,ArraySymbolos_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_4,ArraySymbolos_4,0))
      return(INIT_PARAMETERS_INCORRECT);


   if(!RegistrarSimbolo(Simbolos_TP_1,ArraySymbolos_TP_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_TP_2,ArraySymbolos_TP_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_TP_3,ArraySymbolos_TP_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_TP_4,ArraySymbolos_TP_4,0))
      return(INIT_PARAMETERS_INCORRECT);

   if(!RegistrarSimbolo(Simbolos_SL_1,ArraySymbolos_SL_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_SL_2,ArraySymbolos_SL_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_SL_3,ArraySymbolos_SL_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_SL_4,ArraySymbolos_SL_4,0))
      return(INIT_PARAMETERS_INCORRECT);

   if(!RegistrarSimbolo(Simbolos_LT_1,ArraySymbolos_LT_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_LT_2,ArraySymbolos_LT_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_LT_3,ArraySymbolos_LT_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_LT_4,ArraySymbolos_LT_4,0))
      return(INIT_PARAMETERS_INCORRECT);

   if(!RegistrarSimbolo(Simbolos_MD_1,ArraySymbolos_MD_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_MD_2,ArraySymbolos_MD_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_MD_3,ArraySymbolos_MD_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_MD_4,ArraySymbolos_MD_4,0))
      return(INIT_PARAMETERS_INCORRECT);
    
   if(!RegistrarSimbolo(Simbolos_BE_1,ArraySymbolos_BE_1,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_BE_2,ArraySymbolos_BE_2,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_BE_3,ArraySymbolos_BE_3,0))
      return(INIT_PARAMETERS_INCORRECT);
   if(!RegistrarSimbolo(Simbolos_BE_4,ArraySymbolos_BE_4,0))
      return(INIT_PARAMETERS_INCORRECT);

   a=1;
   if(!RegistrarSimbolo(Simbolos_Autorizados,ArraySimbolos_Autorizados,0))
      return(INIT_PARAMETERS_INCORRECT);

   Print("Size Array :",ArraySize(ArraySimbolos_Autorizados));

   if(!ChequearLote())
      return INIT_FAILED;

   CrearBotones();

   EventSetMillisecondTimer(1);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   BorrarLineas();

   for(int j=0; j<ArraySize(ArraySimbolos_Autorizados)+2; j++)
     {
      if(ObjectFind(0,"Borrar Memoria"+string(j))==0)
         ObjectDelete(0,"Borrar Memoria"+string(j));
     }
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {


  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   ReseteoPorHora();

   for(int j=0; j<ArraySize(ArraySimbolos_Autorizados)+1; j++)
     {
      string nombre_objeto="Borrar Memoria"+string(j);
      bool STATEACTUAL=ObjectGetInteger(0,nombre_objeto,OBJPROP_STATE,0);

      if(STATEACTUAL==true)
        {
         string Simbolo=ObjectGetString(0,nombre_objeto,OBJPROP_TEXT,0);
         BorrarLineas(Simbolo);
         Reiniciar(Simbolo);
         ObjectSetInteger(0,nombre_objeto,OBJPROP_STATE,false);
        }
     }
   ChartRedraw();

   for(int i=0; i<ArraySize(Entradas); i++)
     {
      ResetLastError();
      if(Entradas[i].Mascara==true)
        {
         double Ask_=SymbolInfoDouble(Entradas[i].Simbolo,SYMBOL_ASK);
         double Bid_=SymbolInfoDouble(Entradas[i].Simbolo,SYMBOL_BID);

         if(Entradas[i].TipoEntrada==ORDER_TYPE_BUY_LIMIT || Entradas[i].TipoEntrada==ORDER_TYPE_BUY_STOP)
           {
            if((Bid_>=Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_BUY_STOP) ||
               (Bid_<=Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_BUY_LIMIT))
              {
               double Point_=SymbolInfoDouble(Entradas[i].Simbolo,SYMBOL_POINT);
               long Spread=SymbolInfoInteger(Entradas[i].Simbolo,SYMBOL_SPREAD);
               int MaximoSpread=Evaluar_Simbolos_Spread(Entradas[i].Simbolo);
               int MaximoDesfase_=Evaluar_Simbolos_MaximoDesfase(Entradas[i].Simbolo);

               if(Bid_>Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_BUY_STOP && Entradas[i].PE+Point_*(MaximoDesfase_+1)<Bid_)
                 {
                  Print("ERROR NO ABRIO ORDEN MERCADO: POR SUPERAR EL DESFASE PERMITIDO - TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket);
                  Entradas[i].Mascara=false;
                  BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                 }
               else
                  if(Bid_<Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_BUY_LIMIT && Entradas[i].PE-Point_*(MaximoDesfase_+1)>Bid_)
                    {
                     Print("ERROR NO ABRIO ORDEN MERCADO: POR SUPERAR EL DESFASE PERMITIDO - TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket);
                     Entradas[i].Mascara=false;
                     BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                    }

                  else
                     if(Spread<=MaximoSpread && EvaluaHorario(Hora_Inicio,Hora_Final)==true)
                       {
                        bool Ejecuto=trade.Buy(Entradas[i].Lote,Entradas[i].Simbolo,Ask_,0,0,CommentExpert);

                        if(Ejecuto==false)
                          {
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket,
                                 " ResultCode()= ",trade.ResultRetcode());
                           Entradas[i].Mascara=false;
                           BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                          }
                        else
                          {
                           int Digitos=(int)SymbolInfoInteger(Entradas[i].Simbolo,SYMBOL_DIGITS);
                           BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                           ulong Resultado=trade.ResultOrder();
                           Print("Se Abrio Orden del TICKET de la Operacion Pendiente",Entradas[i].Ticket," con TICKET Orden: ",
                                 Resultado," ResultCode()= ",trade.ResultRetcode());

                           Colocar_TP_SL(Resultado,Entradas[i].PE,Entradas[i].TP,Entradas[i].SL,Digitos,Spread,Point_,Ask_,Bid_,true);

                           Entradas[i].Mascara=false;
                           continue;
                          }
                       }
                     else
                       {
                        if(EvaluaHorario(Hora_Inicio,Hora_Final)==true)
                           Print("Se borro Orden por Spread=",Spread," TICKET=",Entradas[i].Ticket);
                        else
                           Print("Se borro Orden Porque esta fuera del Horario TICKET=",Entradas[i].Ticket);
                        BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                        Entradas[i].Mascara=false;
                        continue;
                       }
              }
           }
         else
           {
            if((Bid_<=Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_SELL_STOP) ||
               (Bid_>=Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_SELL_LIMIT))
              {

               long Spread=SymbolInfoInteger(Entradas[i].Simbolo,SYMBOL_SPREAD);
               int MaximoSpread=Evaluar_Simbolos_Spread(Entradas[i].Simbolo);
               double Point_=SymbolInfoDouble(Entradas[i].Simbolo,SYMBOL_POINT);
               int MaximoDesfase_=Evaluar_Simbolos_MaximoDesfase(Entradas[i].Simbolo);


               if(Bid_>Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_SELL_LIMIT && Entradas[i].PE+Point_*(MaximoDesfase_+1)<Bid_)
                 {
                  Print("ERROR NO ABRIO ORDEN MERCADO: POR SUPERAR EL DESFASE PERMITIDO - TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket);
                  Entradas[i].Mascara=false;
                  BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                 }
               else
                  if(Bid_<Entradas[i].PE && Entradas[i].TipoEntrada==ORDER_TYPE_SELL_STOP && Entradas[i].PE-Point_*(MaximoDesfase_+1)>Bid_)
                    {
                     Print("ERROR NO ABRIO ORDEN MERCADO: POR SUPERAR EL DESFASE PERMITIDO - TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket);
                     Entradas[i].Mascara=false;
                     BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                    }

                  else
                     if(Spread<=MaximoSpread && EvaluaHorario(Hora_Inicio,Hora_Final)==true)
                       {
                        bool Ejecuto=trade.Sell(Entradas[i].Lote,Entradas[i].Simbolo,Bid_,0,0,CommentExpert);

                        if(Ejecuto==false)
                          {
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," TICKET DE LA ORDEN PENDIENTE:",Entradas[i].Ticket,
                                 " ResultCode()= ",trade.ResultRetcode());
                           Entradas[i].Mascara=false;
                           BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                          }
                        else
                          {
                           int Digitos=(int)SymbolInfoInteger(Entradas[i].Simbolo,SYMBOL_DIGITS);
                           ulong Resultado=trade.ResultOrder();
                           BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                           Print("Se Abrio Orden del TICKET de la Operacion Pendiente",Entradas[i].Ticket," con TICKET ORDEN: ",
                                 Resultado," ResultCode()= ",trade.ResultRetcode());

                           Colocar_TP_SL(Resultado,Entradas[i].PE,Entradas[i].TP,Entradas[i].SL,Digitos,Spread,Point_,Ask_,Bid_,false);


                           Entradas[i].Mascara=false;
                           continue;
                          }
                       }
                     else
                       {
                        if(EvaluaHorario(Hora_Inicio,Hora_Final)==true)
                           Print("Se borro Orden por Spread=",Spread," TICKET=",Entradas[i].Ticket);
                        else
                           Print("Se borro Orden porque esta fuera del Horario TICKET=",Entradas[i].Ticket);
                        Entradas[i].Mascara=false;
                        BorrarLinea("HLINE "+string(Entradas[i].Ticket));
                        continue;
                       }
              }
           }

        }
     }

   RegistrarOrdenes();
   ControlarPosiciones_BE();

  }
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarSimbolo(string Simbolos, string &ArraySymbolos[], int Conteo)
  {
   if(Simbolos=="")
     {
      return true;
     }
   string NombresDeLosSimbolos=Simbolos+",";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos,",",PosicionEncontrado+1);

      if(PosicionEncontrado!=-1)
        {
         ArrayResize(ArraySymbolos,Conteo+1,0);
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         ArraySymbolos[Conteo]=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,Sustraccion);
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }
     }
   bool SymboloPersonalizado=true;
   for(int i=0; i<ArraySize(ArraySymbolos); i++)
     {
      bool Personalizado=false;
      if(!SymbolExist(ArraySymbolos[i],Personalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(false);
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Evaluar_Simbolos_Spread(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_1); i++)
     {
      if(ArraySymbolos_1[i]==Simbolo)
         return Maximo_Spread_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_2); i++)
     {
      if(ArraySymbolos_2[i]==Simbolo)
         return Maximo_Spread_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_3); i++)
     {
      if(ArraySymbolos_3[i]==Simbolo)
         return Maximo_Spread_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_4); i++)
     {
      if(ArraySymbolos_4[i]==Simbolo)
         return Maximo_Spread_4;
     }

   return 0;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Evaluar_Simbolos_MaximoDesfase(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_MD_1); i++)
     {
      if(ArraySymbolos_MD_1[i]==Simbolo)
         return MaximoDesfase_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_MD_2); i++)
     {
      if(ArraySymbolos_MD_2[i]==Simbolo)
         return MaximoDesfase_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_MD_3); i++)
     {
      if(ArraySymbolos_MD_3[i]==Simbolo)
         return MaximoDesfase_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_MD_4); i++)
     {
      if(ArraySymbolos_MD_4[i]==Simbolo)
         return MaximoDesfase_4 ;
     }

   return MaximoDesfase_Default;
  }
  

uint Evaluar_Simbolos_BE_Desfase(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_BE_1); i++)
     {
      if(ArraySymbolos_BE_1[i]==Simbolo)
         return BE_Desfase_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_BE_2); i++)
     {
      if(ArraySymbolos_BE_2[i]==Simbolo)
         return BE_Desfase_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_BE_3); i++)
     {
      if(ArraySymbolos_BE_3[i]==Simbolo)
         return BE_Desfase_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_BE_4); i++)
     {
      if(ArraySymbolos_BE_4[i]==Simbolo)
         return BE_Desfase_4 ;
     }

   return BE_Desfase_Default;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Evaluar_TP(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_TP_1); i++)
     {
      if(ArraySymbolos_TP_1[i]==Simbolo)
         return TP_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_TP_2); i++)
     {
      if(ArraySymbolos_TP_2[i]==Simbolo)
         return TP_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_TP_3); i++)
     {
      if(ArraySymbolos_TP_3[i]==Simbolo)
         return TP_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_TP_4); i++)
     {
      if(ArraySymbolos_TP_4[i]==Simbolo)
         return TP_4;
     }

   return 0;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Evaluar_SL(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_SL_1); i++)
     {
      if(ArraySymbolos_SL_1[i]==Simbolo)
         return SL_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_SL_2); i++)
     {
      if(ArraySymbolos_SL_2[i]==Simbolo)
         return SL_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_SL_3); i++)
     {
      if(ArraySymbolos_SL_3[i]==Simbolo)
         return SL_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_SL_4); i++)
     {
      if(ArraySymbolos_SL_4[i]==Simbolo)
         return SL_4;
     }

   return 0;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Evaluar_Lotes(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySymbolos_LT_1); i++)
     {
      if(ArraySymbolos_LT_1[i]==Simbolo)
         return Lotaje_1;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_2); i++)
     {
      if(ArraySymbolos_LT_2[i]==Simbolo)
         return Lotaje_2;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_3); i++)
     {
      if(ArraySymbolos_LT_3[i]==Simbolo)
         return Lotaje_3;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_4); i++)
     {
      if(ArraySymbolos_LT_4[i]==Simbolo)
         return Lotaje_4;
     }

   return 0.01;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Evaluar_Simbolo(string Simbolo)
  {

   for(int i=0; i<ArraySize(ArraySimbolos_Autorizados); i++)
     {
      if(ArraySimbolos_Autorizados[i]==Simbolo)
         return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarLineas(string Simbolo,double PE,ulong Ticket,color Color)
  {
   long currChart,prevChart=ChartFirst();
   int i=0,limit=100;

   while(i<limit)// We have certainly not more than 100 open charts
     {
      if(ChartSymbol(prevChart)==Simbolo)
        {
         if(ObjectCreate(prevChart,"HLINE "+string(Ticket),OBJ_HLINE,0,TimeCurrent(),PE))
           {
            ObjectSetInteger(prevChart,"HLINE "+string(Ticket),OBJPROP_COLOR,Color);
            ObjectSetInteger(prevChart,"HLINE "+string(Ticket),OBJPROP_STYLE,StylePE);
            ObjectSetInteger(prevChart,"HLINE "+string(Ticket),OBJPROP_WIDTH,WidthPE);
            ObjectSetInteger(prevChart,"HLINE "+string(Ticket),OBJPROP_SELECTABLE,false);
            ChartRedraw(prevChart);
           }
        }
      currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
      if(currChart<0)
         break;          // Have reached the end of the chart list
      //Print(i,ChartSymbol(currChart)," ID =",currChart);
      prevChart=currChart;// let's save the current chart ID for the ChartNext()
      i++;// Do not forget to increase the counter
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BorrarLineas()
  {

   int SizeArray=ArraySize(Entradas);
   for(int j=0; j<SizeArray; j++)
     {
      if(Entradas[j].Mascara==true)
        {
         BorrarLinea("HLINE "+string(Entradas[j].Ticket));
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BorrarLineas(string Simbolo)
  {

   int SizeArray=ArraySize(Entradas);
   for(int j=0; j<SizeArray; j++)
     {
      if(Simbolo=="TODOS")
         BorrarLineas();
      else
        {
         if(Entradas[j].Mascara==true && Entradas[j].Simbolo==Simbolo)
            BorrarLinea("HLINE "+string(Entradas[j].Ticket));
        }

     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BorrarLinea(string NombreLinea)
  {

   long currChart,prevChart=ChartFirst();
   int i=0,limit=100;
//Print("ChartFirst =",ChartSymbol(prevChart)," ID =",prevChart);

   while(i<limit)// We have certainly not more than 100 open charts
     {
      if(ObjectFind(prevChart,NombreLinea)==0)
        {
         ObjectDelete(prevChart,NombreLinea);
        }
      ChartRedraw(prevChart);
      currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
      if(currChart<0)
         break;          // Have reached the end of the chart list
      //Print(i,ChartSymbol(currChart)," ID =",currChart);
      prevChart=currChart;// let's save the current chart ID for the ChartNext()
      i++;// Do not forget to increase the counter
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // chart's ID
                  const string            name="Button",            // button name
                  const int               sub_window=0,             // subwindow index
                  const int               x=0,                      // X coordinate
                  const int               y=0,                      // Y coordinate
                  const int               width=50,                 // button width
                  const int               height=18,                // button height
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                  const string            text="Button",            // text
                  const string            font="Arial",             // font
                  const int               font_size=10,             // font size
                  const color             clr=clrBlack,             // text color
                  const color             back_clr=C'236,233,216',  // background color
                  const color             border_clr=clrNONE,       // border color
                  const bool              state=false,              // pressed/released
                  const bool              back=false,               // in the background
                  const bool              selection=false,          // highlight to move
                  const bool              hidden=true,              // hidden in the object list
                  const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ",GetLastError());
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Reiniciar()
  {
   int SizeArray=ArraySize(Entradas);
   for(int j=0; j<SizeArray; j++)
      Entradas[j].Mascara=false;

   Print("Memoria Borrada");

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Reiniciar(string Simbolo)
  {
   int SizeArray=ArraySize(Entradas);
   for(int j=0; j<SizeArray; j++)
     {
      if(Entradas[j].Mascara==true)
        {
         if(Simbolo=="TODOS")
           {
            Reiniciar();
           }
         else
            if(Entradas[j].Simbolo==Simbolo)
               Entradas[j].Mascara=false;
        }
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   Print("Memoria Borrada de ",Simbolo);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   bool EntraHorario=false;
   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<Cierre))
      EntraHorario=true;
   else
      if(Apertura<Cierre && TiempoActual.hour>=Apertura && TiempoActual.hour<Cierre)
         EntraHorario=true;

   return EntraHorario;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ReseteoPorHora()
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   if(Activar_Reseteo_Horario && Dia_Reseteo!=TiempoActual.day_of_year)
      if(TiempoActual.hour==Hora_Reseteo)
        {
         BorrarLineas();
         Reiniciar();
         Dia_Reseteo=ushort(TiempoActual.day_of_year);
        }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearBotones()
  {
//--- create timer

   int Desplace1=0,Desplace=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton

   int TotalSimbolos=ArraySize(ArraySimbolos_Autorizados);

   Print("Size: ",TotalSimbolos);

   int SeparacionY=0;
   int i=0;
   int Indice=0;
   int Indice_Simbolo=0;

   for(i; i<ArraySize(ArraySimbolos_Autorizados); i++)
     {
      SeparacionY=(i%5==0 && i!=0)?SeparacionY+20+Separacion_Y:SeparacionY;
      if(ObjectFind(0,"Borrar Memoria"+string(i))!=0)
         ButtonCreate(0,"Borrar Memoria"+string(i),0,Boton_Desplazamiento_X+Desplace+Separacion*Indice+60*Indice,Boton_Desplazamiento_Y+SeparacionY,60,20,CORNER_BOTON,ArraySimbolos_Autorizados[i],"Arial",10,clrRed,C'236,233,216',clrYellow,false,false,false,true,0);

      Indice++;
      Indice=Indice%5==0?0:Indice;
     }

   SeparacionY=(i%5==0 && i!=0)?SeparacionY+20+Separacion_Y:SeparacionY;
   if(ObjectFind(0,"Borrar Memoria"+string(i))!=0)
      ButtonCreate(0,"Borrar Memoria"+string(i),0,Boton_Desplazamiento_X+Desplace+Separacion*Indice+60*Indice,Boton_Desplazamiento_Y+SeparacionY,60,20,CORNER_BOTON,"TODOS","Arial",10,clrRed,C'236,233,216',clrYellow,false,false,false,true,0);


   for(int j=0; j<ArraySize(ArraySimbolos_Autorizados)+1; j++)
      ObjectSetInteger(0,"Borrar Memoria"+string(j),OBJPROP_STATE,false);

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ChequearLote()
  {

   for(int i=0; i<ArraySize(ArraySymbolos_LT_1); i++)
     {
      if(!EvaluarLote(ArraySymbolos_LT_1[i],Lotaje_1))
         return false;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_2); i++)
     {
      if(!EvaluarLote(ArraySymbolos_LT_2[i],Lotaje_2))
         return false;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_3); i++)
     {
      if(!EvaluarLote(ArraySymbolos_LT_3[i],Lotaje_3))
         return false;
     }

   for(int i=0; i<ArraySize(ArraySymbolos_LT_4); i++)
     {
      if(!EvaluarLote(ArraySymbolos_LT_4[i],Lotaje_4))
         return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarLote(string Simbolo,double lote)
  {

   if(lote<SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN) || lote>SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX))
     {
      Alert("Lote Incorrecto para el ",Simbolo," Lote aceptado mayor o igual a ",SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN)," y menor o igual a ",SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX));
      return false;
     }
   double Dividendo=lote/SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
   if(Dividendo - int(Dividendo)>0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RegistrarOrdenes()
  {
   int Total=OrdersTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=OrderGetTicket(i);

      if(Ticket!=0)
        {
         long OrderType_=OrderGetInteger(ORDER_TYPE);

         if(OrderType_==ORDER_TYPE_BUY_STOP ||OrderType_==ORDER_TYPE_BUY_LIMIT ||
            OrderType_==ORDER_TYPE_SELL_STOP ||OrderType_==ORDER_TYPE_SELL_LIMIT)
           {


            string Simbolo=OrderGetString(ORDER_SYMBOL);
            int SizeArray=ArraySize(Entradas);
            double Point_Simbolo=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
            int j=0;
            char Signo=(OrderType_==ORDER_TYPE_BUY_STOP ||OrderType_==ORDER_TYPE_BUY_LIMIT)?1:-1;
            bool Guardo=false;

            for(j=0; j<SizeArray; j++)
              {
               if(Entradas[j].Mascara==false)
                 {
                  if(Evaluar_Simbolo(Simbolo))
                    {
                     Guardo=true;
                     int TP=Evaluar_TP(Simbolo);
                     int SL=Evaluar_SL(Simbolo);
                     double Lote=Evaluar_Lotes(Simbolo);
                     double O_Price=OrderGetDouble(ORDER_PRICE_OPEN);
                     double TP_=TP!=0?O_Price+TP*Point_Simbolo*Signo:0;
                     double SL_=SL!=0?O_Price-SL*Point_Simbolo*Signo:0;

                     Entradas[j].PE=O_Price;
                     Entradas[j].SL=SL_;
                     Entradas[j].TP=TP_;
                     Entradas[j].Simbolo=Simbolo;
                     Entradas[j].TipoEntrada=OrderType_;
                     Entradas[j].Lote=Lote;
                     Entradas[j].Ticket=Ticket;
                     Entradas[j].Mascara=true;
                    }

                  if(!trade.OrderDelete(Ticket))
                    {
                     Print("NO BORRO ORDEN: ",GetLastError());
                     Entradas[j].Mascara=false;
                    }
                  else
                     if(Evaluar_Simbolo(Simbolo))
                       {
                        color ColorTrend=((OrderType_==ORDER_TYPE_BUY_LIMIT)|| (OrderType_==ORDER_TYPE_BUY_STOP))?ColorBuy:ColorSell;
                        DibujarLineas(Simbolo,Entradas[j].PE,Ticket,ColorTrend);
                       }
                     else
                        Print("BORRO ORDEN PORQUE NO ESTA EN LOS PARAMETROS: ");
                  break;
                 }
              }

            if(Guardo==false && Evaluar_Simbolo(Simbolo))
              {
               ArrayResize(Entradas,SizeArray+10);
               for(int z=SizeArray ; z<ArraySize(Entradas); z++)
                  Entradas[z].Mascara=false;

               if(Evaluar_Simbolo(Simbolo))
                 {
                  int TP=Evaluar_TP(Simbolo);
                  int SL=Evaluar_SL(Simbolo);
                  double Lote=Evaluar_Lotes(Simbolo);
                  double O_Price=OrderGetDouble(ORDER_PRICE_OPEN);
                  double TP_=TP!=0?O_Price+TP*Point_Simbolo*Signo:0;
                  double SL_=SL!=0?O_Price-SL*Point_Simbolo*Signo:0;

                  Entradas[j].PE=O_Price;
                  Entradas[j].SL=SL_;
                  Entradas[j].TP=TP_;
                  Entradas[j].Simbolo=Simbolo;
                  Entradas[j].TipoEntrada=OrderType_;
                  Entradas[j].Ticket=Ticket;
                  Entradas[j].Mascara=true;
                  Entradas[j].Lote=Lote;
                 }
               if(!trade.OrderDelete(Ticket))
                 {
                  Print("NO BORRO ORDEN: ",GetLastError());
                  Entradas[j].Mascara=false;
                 }
               else
                  if(Evaluar_Simbolo(Simbolo))
                    {
                     color ColorTrend=((OrderType_==ORDER_TYPE_SELL_LIMIT)|| (OrderType_==ORDER_TYPE_SELL_STOP))?ColorSell:ColorBuy;
                     DibujarLineas(Simbolo,Entradas[j].PE,Ticket,ColorTrend);
                    }
                  else
                     Print("BORRO ORDEN PORQUE NO ESTA EN LOS PARAMETROS: ");
              }
           }
        }
     }
  }




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ControlarPosiciones_BE()
  {

   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      long OrderType_=PositionGetInteger(POSITION_TYPE);
      if(PositionGetDouble(POSITION_TP)!=0)
        {
         string Simbolo=PositionGetString(POSITION_SYMBOL);
         double OrderOpenPrice=PositionGetDouble(POSITION_PRICE_OPEN);
         double Take_Profit=PositionGetDouble(POSITION_TP);
         double Stop_Loss=PositionGetDouble(POSITION_SL);
         if(OrderType_==POSITION_TYPE_BUY)
           {
            double Bid_=SymbolInfoDouble(Simbolo,SYMBOL_BID);
            int Digitos=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);
            double NivelBE=Take_Profit-OrderOpenPrice;
            NivelBE=OrderOpenPrice+(PorcentajeBE/100.0)*NivelBE;
            NivelBE=NormalizeDouble(NivelBE,Digitos);
            uint BE_Desfase_=Evaluar_Simbolos_BE_Desfase(PositionGetString(POSITION_SYMBOL));
            double SL= OrderOpenPrice+BE_Desfase_*Point();
            if((Bid_>NivelBE) && (Stop_Loss<SL || Stop_Loss==0) && Stop_Loss!=0)
              {
               trade.PositionModify(Ticket,SL,Take_Profit);
               if(!trade.PositionModify(Ticket,SL,Take_Profit))
                  Print("Orden con Ticket Posicion:",Ticket," No modifico el BE");
              }
           }
         else
            if(OrderType_==POSITION_TYPE_SELL)
              {
               double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
               int Digitos=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);
               double NivelBE=OrderOpenPrice-Take_Profit;
               NivelBE=OrderOpenPrice-(PorcentajeBE/100.0)*NivelBE;
               NivelBE=NormalizeDouble(NivelBE,Digitos);
               uint BE_Desfase_=Evaluar_Simbolos_BE_Desfase(PositionGetString(POSITION_SYMBOL));
               double SL= OrderOpenPrice-BE_Desfase_*Point();
               if((Ask_<NivelBE) && (Stop_Loss>SL|| Stop_Loss==0))
                 {
                  trade.PositionModify(Ticket,SL,Take_Profit);
                  if(!trade.PositionModify(Ticket,SL,Take_Profit))
                     Print("Orden con Ticket Posicion:",Ticket," No modifico el BE");
                 }
              }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Colocar_TP_SL(ulong Orden,double PE,double TP,double SL,int Digitos,long Spread,double Point_
                   ,double Ask_,double Bid_,bool IsBuy)
  {
    
   Print("Entro a la Funcion de Modificar el SL y TP"); 
   bool Reconocio=false;
    
   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      if(PositionGetInteger(POSITION_IDENTIFIER)==Orden)
        {
         Reconocio=true;
         if(IsBuy)
           {
            double Open_Price=PositionGetDouble(POSITION_PRICE_OPEN);
            double DiferenciaSL=PE-SL;
            double DiferenciaTP=TP-PE;
            DiferenciaSL=SL==0?0:NormalizeDouble(Open_Price-DiferenciaSL-Spread*Point_,Digitos);
            DiferenciaTP=TP==0?0:NormalizeDouble(Open_Price+DiferenciaTP,Digitos);

            if(DiferenciaTP!=PositionGetDouble(POSITION_TP) || DiferenciaSL!=PositionGetDouble(POSITION_SL))
              {
               if(!trade.PositionModify(Ticket,DiferenciaSL,DiferenciaTP))
                 {
                  Print(PositionGetString(POSITION_SYMBOL)+"  Error al Modificar Posicion con Ticket:"+(string)Ticket+" ERROR:"+(string)GetLastError()+" ResultRecode()="+ (string)trade.ResultRetcode());
                  Print("TP CALCULADO: "+DoubleToString(DiferenciaTP,Digitos)+" SL CALCULADO: "+DoubleToString(DiferenciaSL,Digitos)+" OrdenEntrada="+DoubleToString(Ask_,Digitos)+" Spread= "+(string)Spread);
                 }
              }
            break;
           }
         else
           {
            double Open_Price=PositionGetDouble(POSITION_PRICE_OPEN);
            double DiferenciaSL=SL-PE;
            double DiferenciaTP=PE-TP;
            DiferenciaSL=SL==0?0:NormalizeDouble(Open_Price+DiferenciaSL+Spread*Point_,Digitos);
            DiferenciaTP=TP==0?0:NormalizeDouble(Open_Price-DiferenciaTP,Digitos);

            if(DiferenciaTP!=PositionGetDouble(POSITION_TP) || DiferenciaSL!=PositionGetDouble(POSITION_SL))
              {
               if(!trade.PositionModify(Ticket,DiferenciaSL,DiferenciaTP))
                 {
                  Print(PositionGetString(POSITION_SYMBOL)+"  Error al Modificar Posicion con Ticket:"+(string)Ticket+" ERROR:"+(string)GetLastError()+" ResultRecode()="+ (string)trade.ResultRetcode());
                  Print("TP CALCULADO: "+DoubleToString(DiferenciaTP,Digitos)+" SL CALCULADO: "+DoubleToString(DiferenciaSL,Digitos)+" OrdenEntrada="+DoubleToString(Bid_,Digitos)+" Spread= "+(string)Spread);
                 }
              }
            break;
           }
        }
     }
    if(Reconocio==false){
    Print("No Reconocio Orden.... No Calcula SL Ni TP");
    }
    else
    Print("Si Reconocio Orden.... Si entro a la funcion Calcular SL y TP");
  }
//+------------------------------------------------------------------+
