//+------------------------------------------------------------------+
//|                                                 CTRANSFER_EA.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

string ArraySymbolos[];
//+------------------------------------------------------------------+
//--- date for old files

input string BreakEven_Settings="Configuracion BreakEven";///*---
input int BreakEven=200; //Poner BE (Puntos)
input string Trailing_Settings="Configuracion Trailing";///*---
input int EmpezarTrailing=300;// EmpezarTrailing (Puntos)
input int PasoTrailing=200; //Paso Trailing (Puntos)
input string NombresSimbolos="-----NombresSimbolos------";
input string NombresDeLosSimbolosAnalizar="EURUSD,USDJPY,XAUUSD,AUDUSD";

input string CarpetaBusqueda="PruebaLectura";
input string CarpetaResultados="Resultados";
input bool verificar_precio=false;
input int Stop_Loss=0; //Stop Loss en Puntos
input int Take_Profit=0;// Take Profit en Puntos
input double  Lote=0.01;
input int TiempoDeActualizacion=1; //Tiempo de Actualizacion en Segundos

string TIPO_ORDEN=" ", ACTIVO=" ",SIMBOLO=" ";
double PE=0,SL,TP;
datetime TiempoEjecucion;
string ErrorDatos="";


string   file_name;      // variable for storing file names
//datetime create_date;    // file creation date
int      size=0;         // number of files
string filter;
string Observacion;

int Conteo=0;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
int OnInit()
  {

   ArrayResize(ArraySymbolos,1);
   string NombresDeLosSimbolos=NombresDeLosSimbolosAnalizar+",";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos,",",PosicionEncontrado+1);

      if(PosicionEncontrado!=-1)
        {
         ArrayResize(ArraySymbolos,Conteo+2);
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         ArraySymbolos[Conteo]=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,Sustraccion);
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }

     }
   bool SymboloPersonalizado;
   for(int i=0; i<Conteo; i++)
     {
      if(!SymbolExist(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO HA SIDO SELECCIONADO EN EL MARKET O"
               +" NO HA SIDO SELECCIONADO");
         return(INIT_PARAMETERS_INCORRECT);
        }
     }
   filter=CarpetaBusqueda+"\\*.txt";
//--- allocate memory for the array

   EventSetTimer(TiempoDeActualizacion);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   ;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   TrailingStop_BE();
//--- receive the search handle in the local folder's root
   long search_handle=FileFindFirst(filter,file_name);
//--- check if FileFindFirst() executed successfully
   if(search_handle!=INVALID_HANDLE)
     {
      //--- searching files in the loop
      do
        {
         ResetLastError();
         int file_handle=FileOpen(CarpetaBusqueda+"\\"+file_name,FILE_READ|FILE_TXT|FILE_ANSI);
         if(file_handle!=INVALID_HANDLE)
           {
            PrintFormat("El archivo %s está abierto para la lectura",file_name);
            PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
            //--- variables auxiliares
            int    str_size;
            string str;
            //--- leemos los datos desde el archivo
            while(!FileIsEnding(file_handle))
              {
               //--- averiguamos cuántos símbolos han sido utilizados para la escritura del tiempo
               str_size=FileReadInteger(file_handle,INT_VALUE);
               //--- leemos la cadena
               str=FileReadString(file_handle,str_size);
               //--- imprimimos la cadena
               if(ComprobacionOrden(str))
                 {
                  Print(TIPO_ORDEN+"  "+ACTIVO+"  "+DoubleToString(PE,Digits())+"  "+
                        DoubleToString(SL,Digits())+"   "+DoubleToString(TP,Digits())+"   "+ TimeToString(TiempoEjecucion,TIME_DATE|TIME_MINUTES));
                  if(TiempoEjecucion+PeriodSeconds(PERIOD_M1)>TimeCurrent())
                    {
                     if(EjecutarOrden())
                        Print("Ejecuto Bien");
                     WhriteFile(CarpetaResultados+"\\"+file_name,str+" "+Observacion,file_name);
                    }
                  else
                     WhriteFile(CarpetaResultados+"\\"+file_name,str+" Tiempo es menor al TiempoActual(No se abre)",file_name);
                 }
               else
                  WhriteFile(CarpetaResultados+"\\"+file_name,str+" "+ErrorDatos,file_name);
              }
            //--- cerramos el archivo
            FileClose(file_handle);
            PrintFormat("Datos leídos, archivo %s cerrado",file_name);
           }
         else
            PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",file_name,GetLastError());

         FileDelete(CarpetaBusqueda+"\\"+file_name);
        }
      while(FileFindNext(search_handle,file_name));
      //--- close the search handle
      FileFindClose(search_handle);
     }
   else
     {
      //Print("Files not found!");
      return;
     }
  }

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobacionOrden(string Texto)
  {
   Texto=Texto+",";
   bool EntraPosicion=true;
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   int NumeroComa=1;

   PosicionEncontrado=StringFind(Texto,",",PosicionEncontrado+1);

   while(PosicionEncontrado!=-1)
     {
      int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
      string Palabra=StringSubstr(Texto,PosicionEncontradoAnterior,Sustraccion);
      if(!Comprobacion_Palabra(Palabra,NumeroComa))
        {
         EntraPosicion=false;
         break ;
        }
      PosicionEncontradoAnterior=PosicionEncontrado+1;
      NumeroComa++;
      PosicionEncontrado=StringFind(Texto,",",PosicionEncontrado+1);
     }
   if(NumeroComa!=7)
     {
      Print(NumeroComa);
      EntraPosicion=false;
      ErrorDatos="ERROR falta de datos";
     }

   return EntraPosicion;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Comprobacion_Palabra(string Palabra,int NumeroComa)
  {

   if(NumeroComa==1)
     {
      if(Palabra!="BUY" && Palabra!="SELL" && Palabra!="BUYLIMIT" && Palabra!="SELLLIMIT" && Palabra!="BUYSTOP" &&
         Palabra!="SELLSTOP" && Palabra!="BUY LIMIT" && Palabra!="SELL LIMIT" && Palabra!="BUY STOP" && Palabra!="SELL STOP")
        {
         Print("ERROR EN Palabra Tipo Orden");
         ErrorDatos="ERROR EN Palabra Tipo Orden: La palabra "+Palabra+" no corresponde con los tipos de Orden";
         return false;
        }
      else
         TIPO_ORDEN=Palabra;
     }
   if(NumeroComa==2)
     {
      bool SymboloPersonalizado;
      if(!SymbolExist(Palabra,SymboloPersonalizado))
        {
         Palabra="*"+Palabra+"*";
         ErrorDatos="ERROR SYMBOLO "+Palabra+" NO ENCONTRADO";
         Print("ERROR SYMBOLO ",Palabra," NO ENCONTRADO");
         return(false);
        }
      else
        {
         if(!VerificarSimbolo(Palabra))
           {
            Print("Symbolo no pertenece a los parametros seleccionados");
            ErrorDatos="ERROR SYMBOLO "+Palabra+" NO ESTA SELECCIONADO EN LOS PARAMETROS";
            return(false);
           }
         SIMBOLO=Palabra;
        }
      ACTIVO=Palabra;
     }
   if(NumeroComa==3)
     {
      if(!IsNumber(Palabra))
        {
         ErrorDatos="No es numero el PE";
         Print("No es numero ",NumeroComa);
         return false;
        }
      PE=StringToDouble(Palabra);
     }
   if(NumeroComa==4)
     {
      if(!IsNumber(Palabra))
        {
         ErrorDatos="No es numero el SL";
         Print("No es numero ",NumeroComa);
         return false;
        }
      SL=StringToDouble(Palabra);
      if(Palabra==",")
         SL=0;
     }
   if(NumeroComa==5)
     {
      if(!IsNumber(Palabra))
        {
         ErrorDatos="No es numero el TP";
         Print("No es numero ",NumeroComa);
         return false;
        }
      TP=StringToDouble(Palabra);
      if(Palabra==",")
         TP=0;
     }
   if(NumeroComa==6)
     {
      if(!IsFormatDateTime(Palabra))
        {
         ErrorDatos="No es numero es el Formato de Datetime";
         Print("No es datetime ");
         return false;
        }
      TiempoEjecucion=StringToTime(Palabra);
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsNumber(string s)
  {
   for(int iPos = StringLen(s) - 1; iPos >= 0; iPos--)
     {
      int c = StringGetCharacter(s, iPos);
      if((c < '0' || c > '9') && c != '.')
         return false;
     }
   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsFormatDateTime(string Text)
  {
   for(int Pos = 0; Pos <StringLen(Text); Pos++)
     {
      int c = StringGetCharacter(Text, Pos);
      if(Pos<4)
        {
         if(c < '0' || c > '9')
            return false;
        }
      else
         if(Pos==4)
           {
            if(c!='-')
               return false;
           }
         else
            if(Pos<7)
              {
               if(c < '0' || c > '9')
                  return false;
              }
            else
               if(Pos==7)
                 {
                  if(c!='-')
                     return false;
                 }
               else
                  if(Pos<10)
                    {
                     if(c < '0' || c > '9')
                        return false;
                    }
                  else
                     if(Pos==10)
                       {
                        if(c!=' ')
                           return false;
                       }
                     else
                        if(Pos<13)
                          {
                           if(c < '0' || c > '9')
                              return false;
                          }
                        else
                           if(Pos==13)
                             {
                              if(c!=':')
                                 return false;
                             }
                           else
                              if(Pos<16)
                                {
                                 if(c < '0' || c > '9')
                                    return false;
                                }

                              else
                                 if(Pos==16)
                                   {
                                    if(c!=':')
                                       return false;
                                   }
                                 else
                                    if(Pos<19)
                                      {
                                       if(c < '0' || c > '9')
                                          return false;
                                      }
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EjecutarOrden()
  {
   double Ask=SymbolInfoDouble(SIMBOLO,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(SIMBOLO,SYMBOL_BID);
   double POINT=SymbolInfoDouble(SIMBOLO,SYMBOL_POINT);
   double TAKEPROFIT=0,STOPLOSS=0;
   int Digitos=int(SymbolInfoInteger(SIMBOLO,SYMBOL_DIGITS));
   PE=NormalizeDouble(PE,Digitos);

   if(TIPO_ORDEN=="BUY")
     {
      if(verificar_precio==true && PE!=0)
        {
         if((SL>PE && SL!=0) || (TP<PE && TP!=0))
           {
            Observacion="Parametros SL o TP estan mal con respecto al precio de entrada";
            return false;
           }
         if(PE>Ask)
           {
            Calcular_SL_TP(SL,TP,PE,POINT,true,Digitos);
            Comprobar(trade.BuyStop(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
           }
         else
           {
            Calcular_SL_TP(SL,TP,PE,POINT,true,Digitos);
            Comprobar(trade.BuyLimit(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
           }
        }
      else
        {
         Calcular_SL_TP(SL,TP,Ask,POINT,true,Digitos);
         Comprobar(trade.Buy(Lote,SIMBOLO,Ask,SL,TP,"Expert Transfer"));
        }
     }
   if(TIPO_ORDEN=="SELL")
     {
      if(verificar_precio==true && PE!=0)
        {
         if((SL<PE && SL!=0) || (TP>PE && TP!=0))
           {
            Observacion="Parametros SL o TP estan mal con respecto al precio de entrada";
            return false;
           }
         if(PE<Bid)
           {
            Calcular_SL_TP(SL,TP,PE,POINT,false,Digitos);
            Comprobar(trade.SellStop(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
           }
         else
           {
            Calcular_SL_TP(SL,TP,PE,POINT,false,Digitos);
            Comprobar(trade.SellLimit(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
           }
        }
      else
        {
         Calcular_SL_TP(SL,TP,Bid,POINT,false,Digitos);
         Comprobar(trade.Sell(Lote,SIMBOLO,Bid,SL,TP,"Expert Transfer"));
        }
     }
   if(TIPO_ORDEN=="SELLLIMIT" || TIPO_ORDEN=="SELL LIMIT")
     {
      if((SL<PE && SL!=0) || (TP>PE && TP!=0) || PE==0)
        {
         Observacion="Parametros SL o TP o PE estan mal";
         return false;
        }
      Calcular_SL_TP(SL,TP,PE,POINT,false,Digitos);
      Comprobar(trade.SellLimit(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
     }
   if(TIPO_ORDEN=="SELLSTOP"|| TIPO_ORDEN=="SELL STOP")
     {
      if((SL<PE && SL!=0) || (TP>PE && TP!=0) || PE==0)
        {
         Observacion="Parametros SL o TP o PE estan mal";
         return false;
        }
      Calcular_SL_TP(SL,TP,PE,POINT,false,Digitos);
      Comprobar(trade.SellStop(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
     }
   if(TIPO_ORDEN=="BUYLIMIT"|| TIPO_ORDEN=="BUY LIMIT")
     {
      if((SL>PE && SL!=0) || (TP<PE && TP!=0) || PE==0)
        {
         Observacion="Parametros SL o TP o PE estan mal";
         return false;
        }
      Calcular_SL_TP(SL,TP,PE,POINT,true,Digitos);
      Comprobar(trade.BuyLimit(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
     }
   if(TIPO_ORDEN=="BUYSTOP"|| TIPO_ORDEN=="BUY STOP")
     {
      if((SL>PE && SL!=0) || (TP<PE && TP!=0) || PE==0)
        {
         Observacion="Parametros SL o TP o PE estan mal";
         return false;
        }
      Calcular_SL_TP(SL,TP,PE,POINT,true,Digitos);
      Comprobar(trade.BuyStop(Lote,PE,SIMBOLO,SL,TP,ORDER_TIME_GTC,0,"Expert Transfer"));
     }

   return true;

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void WhriteFile(string Destino,string Datos,string FileName)
  {

   ResetLastError();

   int file_handle=FileOpen(Destino,FILE_READ|FILE_WRITE|FILE_TXT|FILE_ANSI);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("El archivo %s está abierto para la escritura",FileName);
      PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
      //--- la cadena está formada, la escribimos en el archivo
      FileWriteString(file_handle,Datos);
      //--- cerramos el archivo
      FileClose(file_handle);
      PrintFormat("Datos grabados, el archivo %s cerrado",FileName);
     }
   else
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",FileName,GetLastError());

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Comprobar(bool operacion)
  {
   if(!operacion)
      Observacion="ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError());
   else
      Observacion=" Ticket Transaccion:"+string(trade.ResultDeal())+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode());

   Print(Observacion);
  }




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarSimbolo(string Simbolo)
  {

   for(int i=0; i<Conteo; i++)
     {
      if(Simbolo==ArraySymbolos[i])
         return true;
     }
   return false;
  }





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Calcular_SL_TP(double &StopLoss,double &TakeProfit,double PrecioEntrada,double POINT,bool IsBUY,int Digitos)
  {
   char Signo=IsBUY?1:-1;
   StopLoss=StopLoss!=0?StopLoss:(Stop_Loss==0?0:PrecioEntrada-Stop_Loss*POINT*Signo);
   TakeProfit=TakeProfit!=0?TakeProfit:(Take_Profit==0?0:PrecioEntrada+Take_Profit*POINT*Signo);
   StopLoss=NormalizeDouble(StopLoss,Digitos);
   TakeProfit=NormalizeDouble(TakeProfit,Digitos);
  }




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop_BE()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones;i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket!=0)
        {
         long Tipo_Posicion=PositionGetInteger(POSITION_TYPE);
         
         if(Tipo_Posicion==POSITION_TYPE_BUY)
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)+EmpezarTrailing*Point()<=PositionGetDouble(POSITION_PRICE_CURRENT) && EmpezarTrailing>0 && PasoTrailing>0)
              {
                double Evalua=PositionGetDouble(POSITION_PRICE_CURRENT)-PasoTrailing*Point();
                if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)<Evalua){
                trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                }
              }
              
              if(  PositionGetDouble(POSITION_PRICE_CURRENT)-BreakEven*Point()>=PositionGetDouble(POSITION_PRICE_OPEN) && (PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)
               || PositionGetDouble(POSITION_SL)==0) && BreakEven>0){
              trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP));
              }
           }
         else
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)-EmpezarTrailing*Point()>=PositionGetDouble(POSITION_PRICE_CURRENT)  && EmpezarTrailing>0 && PasoTrailing>0)
              {
                double Evalua=PositionGetDouble(POSITION_PRICE_CURRENT)+PasoTrailing*Point();
                if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)>Evalua){
                trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                }
              }
              if(  PositionGetDouble(POSITION_PRICE_CURRENT)+BreakEven*Point()<=PositionGetDouble(POSITION_PRICE_OPEN) && (PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)
               || PositionGetDouble(POSITION_SL)==0) && BreakEven>0){
              trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP));
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
