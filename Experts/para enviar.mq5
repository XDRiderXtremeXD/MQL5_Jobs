//+------------------------------------------------------------------+
//|                                                    Datos CCI.mq5 |
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

input double Lote=0.01;
input int SL=100;//Stop Loss en Puntos
input int TP=100;//Take Profit en Puntos
input int MagicNumb=22222;

bool inicio=true;
int minutos,horas;
int Periodos[3]= {14,20,50};
ENUM_TIMEFRAMES Tiempos[3]= {PERIOD_M1,PERIOD_M5,PERIOD_M15};

int ArrayZZ[3];//guardará la cantidad de zz que están activos por cada tiempo 0=M1 1=M5 2=M15 y [0]/[[1]/[2] guardará si está activo el zz14 zz20 zz50, o sea contendrá 0/1/2/3

double ArrayCCI[4];//para trabajar con comodidad paso los valores devueltos por los indicadores a 1 -1
double ArrayRVI[4];//para trabajar con comodidad paso los valores devueltos por los indicadores a 1 -1 y 0 cuando están uno pos y el otro neg
//la cuarta casilla guardará si todos están en el mismo sentido o no

double ArrayZZvalores[3];
double ArrayCCIvalores[3];
double ArrayRVI1valores[3];
double ArrayRVI2valores[3];

string comentarios[3];//si incializa en oninit y se usa a la hora de abrir una operación saber en qué tiempo
int buy_abierto_en, sell_abierto_en;//cuando abro una operación guardo el tiempo que abrió

bool zzpos=false,zzneg=false,zzpos2=false,zzneg2=false;//me indicarán qué debo analizar, para buy o sell
bool iniciopos,inicioneg;//cuando esté activa me marcará el inicio de las comprobaciones
double velamax, velamin;//guardará el high/low de la vela para tenerlo de referencia


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   buy_abierto_en=0;
   sell_abierto_en=0;
   int b=0;
   while(b<=2)
     {
      comentarios[b]=EnumToString(Tiempos[b]);
      b=b+1;
     }
   zzpos=false;
   zzneg=false;
   iniciopos=false;
   inicioneg=false;
   trade.SetExpertMagicNumber(MagicNumb);
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
   //Comment("ZZNEG ",zzneg2," ",zzneg3,"\nZZPOS ",zzpos2," ",zzpos3);

   if(isNewBar())//la única manera que yo controlo el inicio de una nueva vela es así, por lo cual es el momento en que analizo las horas/minutos
     {

      MqlDateTime stm;
      datetime tm=TimeCurrent(stm);
      horas =stm.hour;
      minutos= stm.min;


      //explicación de la lógica del algoritmo:
      //en cada bloque de tiempo cargo los indicadores. Sólo accederé a ellos cuando la carga de los indicadores sea true, evitando asi los EMPTY__VALUE de tiempos superiores todavía sin datos
      //una vez confirmado eso sacaremos el valor de zz. en los dos primeros tiempos M1 M5 zz se analizará cuando esté confirmado (valor3) mientras que en el siguiente tiempo se analizará
      //en el valor 1 siempre que la velamax/min coincida

      //se pasará de un bloque de tiempo al siguiente siempre que cumplan las condiciones, en caso contrario zzneg/zzpos se anula y se queda a la espera de otro zz válido en M1




      if(cargarindicadores(PERIOD_M1,3))//solo se accede cuando todos los valores son validos, que no existe ningún EMPTY_VALUE
        {
         if(CopiarDatosZZ(PERIOD_M1,3,ArrayZZvalores,1))  //sacamos los valores de zz positivo
           {
            iniciopos= analiza_zz(0,3);//0=M1 y los analizamos para cargar el resultado en zz
            if(iniciopos) //si es positivo tenemos que mirar los datos para confirmar la validez
              {
               iniciopos= validandoindicadores(ArrayZZ[0],1);
              }
           }
         if(!iniciopos)//si no es positivo miramos negativo
           {
            if(CopiarDatosZZ(PERIOD_M1,3,ArrayZZvalores,0)) //sacamos los valores de zz positivo
              {
               inicioneg=analiza_zz(0,3);// los analizamos para cargar el resultado
               if(inicioneg) //si es negativo tenemos que mirar los datos para confirmar la validez
                 {
                  inicioneg =validandoindicadores(ArrayZZ[0],0);
                 }
              }//fin inicioneg
           }//y en caso de ninguno ser true no se actuará

         //guardar el valor de la vela es para que, a la hora de analizar tiempos mayores estar seguro que analizo el momento adecuado
         //por eso tanto zzpos como velamax o zzneg y velamin serán imprescindibles para entrar.
         //Y por supuesto, si está activo uno, el opuesto se anula
         if(iniciopos)
           {
            inicioneg=false;
            zzneg=false;
            zzpos=true;
            iniciopos=false;
            velamax=iHigh(_Symbol,PERIOD_M1,3);
           }
         if(inicioneg)
           {
            iniciopos=false;
            zzpos=false;
            zzneg=true;
            inicioneg=false;
            velamin=iLow(_Symbol,PERIOD_M1,3);
           }
        }//fin cargarindicadores

      //---------------------------zona m5 -----------------------------------------------------
      if(minutos == 0 || minutos == 5 || minutos == 10 || minutos == 15 || minutos == 20 || minutos == 25 || minutos == 30 ||
         minutos == 35 || minutos == 40 || minutos == 45 || minutos == 50 || minutos == 55)
        {
         if(cargarindicadores(PERIOD_M5,3))//solo se accede cuando todos los valores son validos, que no existe ningún EMPTY_VALUE
           {
            if(CopiarDatosZZ(PERIOD_M5,3,ArrayZZvalores,1) && velamax)   //sacamos los valores de zz positivo
              {
               bool ZZ= analiza_zz(1,3);//los analizamos para cargar el resultado en zz
               if(ZZ)
                 {
                  ZZ =validandoindicadores(ArrayZZ[1],1);
                  if(ZZ)
                    {
                     zzpos2=true;
                     zzneg2=false;
                    }

                 }
              }//fin zzpos
            if(CopiarDatosZZ(PERIOD_M5,3,ArrayZZvalores,0) && velamin)   //sacamos los valores de zz positivo
              {
               bool ZZ=analiza_zz(1,3);//los analizamos para cargar el resultado
               if(ZZ)
                 {
                  ZZ =validandoindicadores(ArrayZZ[1],0);
                  if(ZZ)
                    {
                     zzneg2=true;
                     zzpos2=false;
                    }
                 }
              }//fin copia datos
           }
        }//fin m5------------------------------------------------NO BORRAR

      //---------------------------zona m15 -----------------------------------------------------
      if(minutos == 0  || minutos == 15  || minutos == 30 || minutos == 45)
        {
         if(cargarindicadores(PERIOD_M15,1))//solo se accede cuando todos los valores son validos, que no existe ningún EMPTY_VALUE
           {
            //primero cerramos si se da la ocasión y despues mirmos de abrir nuevas operaciones
            /*  if(buy_abierto_en==2)//coincide el tiempo con el que abrió la operacion
                {
                 if(condiciones_cierre(1))//si se dan las condiciones de cierre cerramos
                   {
                    Cerrar(2,1);
                    buy_abierto_en=0;
                   }
                }
              if(sell_abierto_en==2)
                {
                 if(condiciones_cierre(0))
                   {
                    Cerrar(2,0);
                    sell_abierto_en=0;
                   }
                }*/

            if(zzpos)
               if(CopiarDatosZZ(PERIOD_M15,1,ArrayZZvalores,1) && velamax)   //sacamos los valores de zz positivo
                 {
                  bool ZZ= analiza_zz(2,1);// los analizamos para cargar el resultado en zz
                  if(ZZ)
                    {
                     ZZ= validandoindicadores(ArrayZZ[2],1);
                     if(ZZ && ArrayZZ[2]==3 && ArrayCCI[3]==3)
                       {
                        if(zzpos2)
                           if(Abrir(2,0,sell_abierto_en))
                             {
                              sell_abierto_en=2;
                             }
                       }
                    }
                 }
            //fin zzpos
            if(zzneg)
               if(CopiarDatosZZ(PERIOD_M15,1,ArrayZZvalores,0) && velamin) //sacamos los valores de zz positivo
                 {
                  bool ZZ=analiza_zz(2,1);// los analizamos para cargar el resultado
                  if(ZZ)
                    {
                     ZZ =validandoindicadores(ArrayZZ[2],0);
                     //si el valor devuelto en arrayzz es 1 debemos comprobar si es punto de cierre
                     if(ZZ && ArrayZZ[2]==3 && ArrayCCI[3]==3)
                       {
                        if(zzneg2)
                           if(Abrir(2,1,buy_abierto_en))
                             {
                              buy_abierto_en=2;
                             }
                       }

                    }
                 }//fin zzneg
           }//fin copia datos
        }//fin m15------------------------------------------------NO BORRAR
     }//fin isnewbar()
  }//fin inTIck
/////////////////////////////////FINAL DEL CUERPO PRINCIPAL///////////////////////////////////////////////////////////
bool condiciones_cierre(uint BUYoSELL)
  {
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool validandoindicadores(uint usarZZ, uint updown)
  {
   if(actualizadatos_cci(updown))
     {
      if(updown==1)
      if(actualizadatos_rvi(updown))
        {
         return true;
        }
     }
   return false;
  }
//+----------------------------FUNCION CCI--------------------------------------+
bool actualizadatos_cci(uint updown)
  {
   int    a=0;
   while(a<=2)
     {
      if(ArrayCCIvalores[a]>0)
        {
         ArrayCCI[a]=1;
        }
      if(ArrayCCIvalores[a]<0)
        {
         ArrayCCI[a]=-1;
        }
      a=a+1;
     }//fin while carga de valor cci
   a=0;
   ArrayCCI[3]=0;
   while(a<3)
     {
      if(updown==1 && ArrayCCI[a]==1)
        {
         ArrayCCI[3]=ArrayCCI[3]+1;
        }
      if(updown==0 && ArrayCCI[a]==-1)
        {
         ArrayCCI[3]=ArrayCCI[3]+1;
        }
      a=a+1;
     }
   if(ArrayCCI[3]==3)
     {
      return true;
     }
   else
     {
      return false;
     }
  }

//+----------------------------FUNCION RVI--------------------------------------+
bool actualizadatos_rvi(uint updown)
  {
   int  a=0;
   while(a<ArraySize(ArrayRVI1valores) && a<ArraySize(ArrayRVI2valores))
     {
      if(ArrayRVI1valores[a]>0 && ArrayRVI2valores[a]>0)
        {
         ArrayRVI[a]=1;
        }
      else
        {
         if(ArrayRVI1valores[a]<0 && ArrayRVI2valores[a]<0)
           {
            ArrayRVI[a]=-1;
           }
         else
           {
            ArrayRVI[a]=0;
           }
        }
      a=a+1;
     }//fin while carga de valor rvi
   a=0;
   ArrayRVI[3]=0;
   while(a<3)
     {
      if(updown==1 && ArrayRVI[a]==1)
        {
         ArrayRVI[3]=ArrayRVI[3]+1;
        }
      if(updown==0 && ArrayRVI[a]==-1)
        {
         ArrayRVI[3]=ArrayRVI[3]+1;
        }
      a=a+1;
     }
   if(ArrayRVI[3]==3)
     {
      return true;
     }
   else
     {
      return false;
     }
  }


//+-------------------------Funcion de zigzag-----------------------------------------+
bool analiza_zz(uint tiempo, uint retroceso)
  {
   ArrayZZ[tiempo]=0;
   for(int i=0; i<ArraySize(ArrayZZvalores); i++)
     {
      if(ArrayZZvalores[i]!=0)
        {
         ArrayZZ[tiempo]=ArrayZZ[tiempo]+1;
        }
      else
        {
         i=9;
        }
     }
   if(ArrayZZ[tiempo]==3)
     {
      return true;

     }
   else
     {
      return false;
     }
  }
/*******************************************************************/
bool cargarindicadores(ENUM_TIMEFRAMES tiempo, uint retroceso)
  {
   bool BoolCCI=CopiarDatosCCI(PERIOD_M1,retroceso,ArrayCCIvalores);
   bool BoolRVI1=CopiarDatosRVI1(PERIOD_M1,retroceso,ArrayRVI1valores);
   bool BoolRVI2=CopiarDatosRVI2(PERIOD_M1,retroceso,ArrayRVI2valores);

   if(BoolCCI && BoolRVI1 && BoolRVI2)
      return true;

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarDatosZZ(ENUM_TIMEFRAMES tiempo, uint retroceso,double &arrayDataTimeFrame[],uint updown)
  {
// ITERAMOS LOS PERIODOS PARA SACAR LOS DATOS DE CADA INDICADOR
//zigzag tiene los datos guardados buffer1 positivo buffer2 negtivo
   if(updown==1)
     {
      for(int i=0; i<ArraySize(Periodos); i++)
        {
         double dato=0;
         // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
         if(!ObtenerDatoZZ(tiempo,Periodos[i],retroceso,dato,1))
            return false;
         arrayDataTimeFrame[i]=dato;
        }
     }
   if(updown==0)
     {
      for(int i=0; i<ArraySize(Periodos); i++)
        {
         double dato=0;
         // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
         if(!ObtenerDatoZZ(tiempo,Periodos[i],retroceso,dato,2))
            return false;
         arrayDataTimeFrame[i]=dato;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarDatosCCI(ENUM_TIMEFRAMES tiempo, uint retroceso,double &arrayDataTimeFrame[])
  {
// ITERAMOS LOS PERIODOS PARA SACAR LOS DATOS DE CADA INDICADOR
   for(int i=0; i<ArraySize(Periodos); i++)
     {
      double dato=0;
      // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
      if(!ObtenerDatoCCI(tiempo,Periodos[i],retroceso,dato))
         return false;
      arrayDataTimeFrame[i]=dato;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarDatosRVI1(ENUM_TIMEFRAMES tiempo, uint retroceso,double &arrayDataTimeFrame[])
  {
// ITERAMOS LOS PERIODOS PARA SACAR LOS DATOS DE CADA INDICADOR
   for(int i=0; i<ArraySize(Periodos); i++)
     {
      double dato=0;
      // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
      if(!ObtenerDatoRVI(tiempo,Periodos[i],retroceso,dato,0))
         return false;
      arrayDataTimeFrame[i]=dato;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarDatosRVI2(ENUM_TIMEFRAMES tiempo, uint retroceso,double &arrayDataTimeFrame[])
  {
// ITERAMOS LOS PERIODOS PARA SACAR LOS DATOS DE CADA INDICADOR
   for(int i=0; i<ArraySize(Periodos); i++)
     {
      double dato=0;
      // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
      if(!ObtenerDatoRVI(tiempo,Periodos[i],retroceso,dato,1))
         return false;
      arrayDataTimeFrame[i]=dato;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerDatoZZ(ENUM_TIMEFRAMES tiempo,uint periodo, uint retroceso,double &dato, uint buffer)
  {
// SE IMPLEMENTA EL HANDLE DEL INDICADOR DESEADO CON EL PERIODO Y TIEMPO
   int Handle=iCustom(_Symbol,tiempo,"Examples\\ZigZag",periodo,5,3);
   double ArrayData[];
// COPIAMOS 1 DATO DEL INDICADOR EN EL ArrayDATA, Se copiara el elemento de la posicion (retroceso)
   if(CopyBuffer(Handle,buffer,retroceso,1,ArrayData)<=0)
      return false;
// SI ESTA BIEN, EL DATO SE IGUALA AL DATO CONSEGUIDO ANTERIORMENTE
   dato=ArrayData[0];

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerDatoCCI(ENUM_TIMEFRAMES tiempo,uint periodo, uint retroceso,double &dato)
  {
// SE IMPLEMENTA EL HANDLE DEL INDICADOR DESEADO CON EL PERIODO Y TIEMPO
   int Handle=iCCI(_Symbol,tiempo,periodo,PRICE_CLOSE);
   double ArrayData[];
// COPIAMOS 1 DATO DEL INDICADOR EN EL ArrayDATA, Se copiara el elemento de la posicion (retroceso)
   if(CopyBuffer(Handle,0,retroceso,1,ArrayData)<=0)
      return false;
// SI ESTA BIEN, EL DATO SE IGUALA AL DATO CONSEGUIDO ANTERIORMENTE
   dato=ArrayData[0];

   return true;
  }
//+------------------------------------------------------------------+
bool ObtenerDatoRVI(ENUM_TIMEFRAMES tiempo,uint periodo, uint retroceso,double &dato, uint buffer)
  {
// SE IMPLEMENTA EL HANDLE DEL INDICADOR DESEADO CON EL PERIODO Y TIEMPO
   int Handle=iRVI(_Symbol,tiempo,periodo);
   double ArrayData[];
// COPIAMOS 1 DATO DEL INDICADOR EN EL ArrayDATA, Se copiara el elemento de la posicion (retroceso)
   if(CopyBuffer(Handle,buffer,retroceso,1,ArrayData)<=0)
      return false;
// SI ESTA BIEN, EL DATO SE IGUALA AL DATO CONSEGUIDO ANTERIORMENTE
   dato=ArrayData[0];

   return true;
  }

//+------------------------------------------------------------------+
void Cerrar(uint Comentario,uint BUYoSELL)
  {
   int TotalPosiciones=PositionsTotal();
   for(int b=0; b<TotalPosiciones; b++)
     {
      ulong Ticket=PositionGetTicket(b);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumb && PositionGetString(POSITION_COMMENT)==comentarios[Comentario])
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && BUYoSELL==1)
           {
            trade.PositionClose(Ticket,-1);
           }
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && BUYoSELL==0)
           {
            trade.PositionClose(Ticket,-1);
           }
        }
     }
   return;
  }
//+------------------------------------------------------------------+
bool Abrir(uint tiempo_de_llamada, uint BUYoSELL, uint abierto_en)
  {
//si ya da un valor significa que hay operaciones abiertas y debemos de averiguar si es en el mismo tiempo o superior
//en caso de la llamada ser de un tiempo menor la metemos en el tiempo mayor
   if(tiempo_de_llamada<abierto_en && abierto_en!=0)
     {
      tiempo_de_llamada=abierto_en;
     }
   if(BUYoSELL==1)
     {
      double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double SL_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      double TP_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      bool Trade=trade.Buy(Lote,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,comentarios[tiempo_de_llamada]);
      if(!Trade)
        {
         Print("ERROR ",trade.ResultRetcode());
         return false;
        }
      else
        {
         return true;
        }
     }
   if(BUYoSELL==0)
     {
      double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      double SL_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      double TP_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      bool Trade=trade.Sell(Lote,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,comentarios[tiempo_de_llamada]);
      if(!Trade)
        {
         Print("ERROR ",trade.ResultRetcode());
         return false;
        }
      else
        {
         return true;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool isNewBar()
  {
//--- memorize the time of opening of the last bar in the static variable
   static datetime last_time=0;
//--- current time
   datetime lastbar_time=(datetime)SeriesInfoInteger(Symbol(),Period(),SERIES_LASTBAR_DATE);

//--- if it is the first call of the function
   if(last_time==0)
     {
      //--- set the time and exit
      last_time=lastbar_time;
      return(false);
     }

//--- if the time differs.
   if(last_time!=lastbar_time)
     {
      //--- memorize the time and return true
      last_time=lastbar_time;
      return(true);
     }
//--- if we passed to this line, then the bar is not new; return false
   return(false);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
