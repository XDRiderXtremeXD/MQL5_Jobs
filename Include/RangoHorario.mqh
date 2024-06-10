//+------------------------------------------------------------------+
//|                                                 RangoHorario.mqh |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property library
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <FormatoHoraMinuto.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class RangoHorario
  {
   struct horario_Rango
     {
      int               hora_start;
      int               minuto_start;
      int               hora_end;
      int               minuto_end;
     };

private:
   horario_Rango           Horario;
   string            nombreRangoRectangulo;
   datetime          TiempoBarLast;
   double            high_rango;
   double            low_rango;
   color             colorRectangulo;
public:
                     RangoHorario(void);
                    ~RangoHorario(void);
   //--- create
   //ONTICK
   bool              NuevoRango();
   double            GetHighRango() {return high_rango;}
   double            GetLowRango() {return low_rango;}
   //ONINIT
   bool              CrearLogicaRango(string TiempoStart_,string TiempoEnd_,string nombreRango,color colorRectangulo_);
   //ONDEINIT
   void              EliminarCuadro() {ObjectDelete(0,nombreRangoRectangulo);};
protected:
   bool              CalcularHighLowCuadro(horario_Rango &Horario_);
   bool              SacarHighLow(int indiceStart,int indiceEnd,double &high,double &low);
   bool              SacarIndices(datetime timeStart,datetime timeEnd,int &indiceStart,int &indiceEnd);
   void              SacarTiemposLapso(horario_Rango &Horario_,datetime tiempoEvalua,datetime &tiempoInicial,datetime &tiempoFinal);
   bool              CambioBarra(ENUM_TIMEFRAMES TF);
   bool              VerificarMultiploMinutos(horario_Rango &Horario_,int multiplo);
   bool              VerificarHorario(string start_,string end_,horario_Rango &Horario_);
   bool              VerificarEntero(string evaluaString,string &comentario);
   bool              VerificarHora_o_Minuto(int clockPointer,bool IsHora,string &comentario);
   datetime          ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames);
   bool              RectangleCreate(const long            chart_ID=0,        // chart's ID
                                     const string          name="Rectangle",  // rectangle name
                                     const int             sub_window=0,      // subwindow index
                                     datetime              time1=0,           // first point time
                                     double                price1=0,          // first point price
                                     datetime              time2=0,           // second point time
                                     double                price2=0,          // second point price
                                     const color           clr=clrRed,        // rectangle color
                                     const ENUM_LINE_STYLE style=STYLE_SOLID, // style of rectangle lines
                                     const int             width=1,           // width of rectangle lines
                                     const bool            fill=false,        // filling rectangle with color
                                     const bool            back=false,        // in the background
                                     const bool            selection=true,    // highlight to move
                                     const bool            hidden=true,       // hidden in the object list
                                     const long            z_order=0);         // priority for mouse click
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
RangoHorario::RangoHorario(void)
  {
   TiempoBarLast=0;
   high_rango=0;
   low_rango=0;
   colorRectangulo=clrRed;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
RangoHorario:: ~RangoHorario(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::NuevoRango()
  {
   if(CambioBarra(PERIOD_M5))
     {
      return CalcularHighLowCuadro(Horario);
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::CrearLogicaRango(string TiempoStart_,string TiempoEnd_,string nombreRango,color colorRectangulo_)
  {
   if(!VerificarHorario(TiempoStart_,TiempoEnd_,Horario))
      return false;

   if(!VerificarMultiploMinutos(Horario,5))
      return false;

   nombreRangoRectangulo="FRANJA HORARIO 2023 "+nombreRango;
   colorRectangulo=colorRectangulo_;
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::CalcularHighLowCuadro(horario_Rango &Horario_)
  {
   datetime tiempoActual=TimeCurrent();
   MqlDateTime timeCurrent_; 
   TimeToStruct(tiempoActual,timeCurrent_); 
   
   if(timeCurrent_.hour==Horario_.hora_end && timeCurrent_.min==Horario_.minuto_end)
     {
      datetime timeStart,timeEnd;
      SacarTiemposLapso(Horario_,tiempoActual,timeStart,timeEnd);
      int indiceStart,indiceEnd;
      if(!SacarIndices(timeStart,timeEnd,indiceStart,indiceEnd))
        {
         Print("No se pudo encontrar el tiempo especifico");
         return false;
        }
      double high,low;
      if(!SacarHighLow(indiceStart,indiceEnd,high,low))
         return false;
      high_rango=high;
      low_rango=low;

      if(ObjectFind(0,nombreRangoRectangulo)!=0)
         RectangleCreate(0,nombreRangoRectangulo,0,timeStart,high,timeEnd,low,colorRectangulo,STYLE_SOLID,1,false,false,false,false,true);
      else
        {
         ObjectSetInteger(0,nombreRangoRectangulo,OBJPROP_TIME,0,timeStart);
         ObjectSetInteger(0,nombreRangoRectangulo,OBJPROP_TIME,1,timeEnd);
         ObjectSetDouble(0,nombreRangoRectangulo,OBJPROP_PRICE,0,high);
         ObjectSetDouble(0,nombreRangoRectangulo,OBJPROP_PRICE,1,low);
        }
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::SacarHighLow(int indiceStart,int indiceEnd,double &high,double &low)
  {
   int IndiceMaximo=iHighest(Symbol(),PERIOD_M5,MODE_HIGH,MathAbs(indiceEnd-indiceStart),indiceEnd+1);
   int IndiceMinimo=iLowest(Symbol(),PERIOD_M5,MODE_LOW,MathAbs(indiceEnd-indiceStart),indiceEnd+1);
   if(IndiceMaximo==-1)
     {
      Print("No pudo encontrar el indice maximo rango");
      return false;
     }
   if(IndiceMinimo==-1)
     {
      Print("No pudo encontrar el indice minimo rango");
      return false;
     }

   high=iHigh(Symbol(),PERIOD_M5,IndiceMaximo);
   low=iLow(Symbol(),PERIOD_M5,IndiceMinimo);

   if(high==0)
     {
      Print("No pudo encontrar el maximo rango");
      return false;
     }
   if(low==0)
     {
      Print("No pudo encontrar el minimo rango");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::SacarIndices(datetime timeStart,datetime timeEnd,int &indiceStart,int &indiceEnd)
  {
   indiceStart=(iBarShift(Symbol(),PERIOD_M5,timeStart,true));
   indiceEnd=(iBarShift(Symbol(),PERIOD_M5,timeEnd,true));
   if(indiceStart==-1)
     {
      Print("No se pudo encontrar el tiempo inicio");
      return false;
     }
   if(indiceEnd==-1)
     {
      Print("No se pudo encontrar el tiempo final");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RangoHorario::SacarTiemposLapso(horario_Rango &Horario_,datetime tiempoEvalua,datetime &tiempoInicial,datetime &tiempoFinal)
  {
   MqlDateTime TimeEvalua;
   TimeToStruct(tiempoEvalua,TimeEvalua);
   TimeEvalua.hour=Horario_.hora_end;
   TimeEvalua.min=Horario_.minuto_end;
   TimeEvalua.sec=0;

   tiempoFinal=StructToTime(TimeEvalua);
   tiempoInicial=tiempoFinal;

   if(Horario_.hora_end<Horario_.hora_start)
      tiempoInicial=tiempoFinal-PeriodSeconds(PERIOD_D1);

   TimeToStruct(tiempoInicial,TimeEvalua);
   TimeEvalua.hour=Horario_.hora_start;
   TimeEvalua.min=Horario_.minuto_start;
   TimeEvalua.sec=0;
   tiempoInicial=StructToTime(TimeEvalua);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::CambioBarra(ENUM_TIMEFRAMES TF)
  {
   datetime TiempoBarActual=ActualizarDatos(Symbol(),TF);

   if(TiempoBarLast!=TiempoBarActual)
     {
      TiempoBarLast=TiempoBarActual;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::VerificarMultiploMinutos(horario_Rango &Horario_,int multiplo)
  {
   if(Horario_.minuto_end%multiplo!=0)
     {
      Alert("Minutos tiene que ser multiplo de 5");
      return false;
     }
   if(Horario_.minuto_start%multiplo!=0)
     {
      Alert("Minutos tiene que ser multiplo de 5");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RangoHorario::VerificarHorario(string start_,string end_,horario_Rango &Horario_)
  {
   int hora_start,minuto_start;
   if(!SacarHoraMinuto(start_,hora_start,minuto_start))
      return false;

   int hora_end,minuto_end;
   if(!SacarHoraMinuto(end_,hora_end,minuto_end))
      return false;

   Horario_.hora_start=hora_start;
   Horario_.hora_end=hora_end;
   Horario_.minuto_start=minuto_start;
   Horario_.minuto_end=minuto_end;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime RangoHorario::ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
  /* datetime daytimes[];
   ArrayResize(daytimes,1);

   int error;
   bool Actualizar_=true;
   ResetLastError();
//---- the Time[] array was sroted in the descending order
   ArrayCopySeries(daytimes,MODE_TIME,Simbolo,TimeFrames);
   error=GetLastError();


   if((error==4073 || error==4066) && Actualizar_)
     {
      Print("Actualizando Simbolo ",Simbolo," en Periodo ",EnumToString((ENUM_TIMEFRAMES) TimeFrames));
      Actualizar_=false;
     }

   if(error==4066 || error==4073)
     {
      //---- make two more attempts to read
      while((error==4066 || error==4073) && !IsStopped())
        {
         Sleep(1000);
         ArrayCopySeries(daytimes,MODE_TIME,Simbolo,TimeFrames);
         error=GetLastError();
         //---- check the current daily bar time
        }
     }
   if(Actualizar_==false)
      Print(" Simbolo Actualizado ",Simbolo);*/


   return TimeCurrent();
  }
//+------------------------------------------------------------------+
bool RangoHorario::RectangleCreate(const long            chart_ID=0,        // chart's ID
                                   const string          name="Rectangle",  // rectangle name
                                   const int             sub_window=0,      // subwindow index
                                   datetime              time1=0,           // first point time
                                   double                price1=0,          // first point price
                                   datetime              time2=0,           // second point time
                                   double                price2=0,          // second point price
                                   const color           clr=clrRed,        // rectangle color
                                   const ENUM_LINE_STYLE style=STYLE_SOLID, // style of rectangle lines
                                   const int             width=1,           // width of rectangle lines
                                   const bool            fill=false,        // filling rectangle with color
                                   const bool            back=false,        // in the background
                                   const bool            selection=true,    // highlight to move
                                   const bool            hidden=true,       // hidden in the object list
                                   const long            z_order=0)         // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a rectangle by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a rectangle! Error code = ",GetLastError());
      return(false);
     }
//--- set rectangle color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set the style of rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set width of the rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- enable (true) or disable (false) the mode of filling the rectangle
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of highlighting the rectangle for moving
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
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
