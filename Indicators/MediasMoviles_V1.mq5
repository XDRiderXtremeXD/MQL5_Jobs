//+------------------------------------------------------------------+
//|                                             MediasMoviles_V1.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property version   "1.00"
#property link      "https://www.dominionforex.es"
#property copyright "MediasMoviles_V1 "

#property indicator_chart_window
#property indicator_plots 0

#resource "\\Indicators\\MA_MultiTF.ex5"

ENUM_TIMEFRAMES    Periodo              = PERIOD_D1;
input string S13="============ CONF PERIODOS MA ==============";//===============================================
input int                maPeriod1        = 20;             // MA period 1
input int                maPeriod2        = 50;             // MA period 2
input int                maPeriod3        = 100;            // MA period 3
input int                maPeriod4        = 200;            // MA period 4
input string S12="============ CONF MA ==============";//===============================================
input int                Shift           = 0;              // Shift
input ENUM_MA_METHOD     InpMAMethod     = MODE_SMA;       // Moving average method
input ENUM_APPLIED_PRICE InpAppliedPrice = PRICE_CLOSE;    // Applied price
input bool               Interpolate     = true;
input  int               Bars_Calculated = 0;
input string S11="============ COLOR ==============";//===============================================
input color Color_Line_1=clrBlue;
input color Color_Line_2=clrWhite;
input color Color_Line_3=clrMagenta;
input color Color_Line_4=clrAqua;
input string S1="============ ESTILO ==============";//===============================================
input int Width=1;
input ENUM_LINE_STYLE Style=STYLE_SOLID;

int handle1=0;
int handle2=0;
int handle3=0;
int handle4=0;

string Nombre_Carpeta_MA="DATOS_MEDIAS_MOVILES_V1";

double Valores[4]= {0,0,0,0};
string Periodos[4]= {"","","",""};
double VALOR1[1];
double VALOR2[1];
double VALOR3[1];
double VALOR4[1];

string BotonExportar="Boton Exportar Media Movil";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   for(int i=0;i<4;i++)
      Valores[i]=0;

   Periodos[0]=IntegerToString(maPeriod1);
   Periodos[1]=IntegerToString(maPeriod2);
   Periodos[2]=IntegerToString(maPeriod3);
   Periodos[3]=IntegerToString(maPeriod4);

   handle1=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MA_MultiTF.ex5",Periodo, maPeriod1, Shift, InpMAMethod, InpAppliedPrice, Interpolate, Bars_Calculated, Width, Style, Color_Line_1);
   handle2=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MA_MultiTF.ex5",Periodo, maPeriod2, Shift, InpMAMethod, InpAppliedPrice, Interpolate, Bars_Calculated, Width, Style, Color_Line_2);
   handle3=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MA_MultiTF.ex5",Periodo, maPeriod3, Shift, InpMAMethod, InpAppliedPrice, Interpolate, Bars_Calculated, Width, Style, Color_Line_3);
   handle4=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MA_MultiTF.ex5",Periodo, maPeriod4, Shift, InpMAMethod, InpAppliedPrice, Interpolate, Bars_Calculated, Width, Style, Color_Line_4);

   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");

   ChartIndicatorAdd(0,0,handle1);
   ChartIndicatorAdd(0,0,handle2);
   ChartIndicatorAdd(0,0,handle3);
   ChartIndicatorAdd(0,0,handle4);

   ButtonCreate(0,BotonExportar,0,10,50,140,18,CORNER_LEFT_UPPER,"Cargando MMoviles...","Arial",10,clrWhite,clrGray,clrWhite,false,false,false,true,0);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   if(BarsCalculated(handle1)==rates_total)
      if(CopyBuffer(handle1,0,0,1,VALOR1)<=0)
         return(0);
   Valores[0]=VALOR1[0];
   if(BarsCalculated(handle2)==rates_total)
      if(CopyBuffer(handle2,0,0,1,VALOR2)<=0)
         return(0);
   Valores[1]=VALOR2[0];
   if(BarsCalculated(handle3)==rates_total)
      if(CopyBuffer(handle3,0,0,1,VALOR3)<=0)
         return(0);
   Valores[2]=VALOR3[0];
   if(BarsCalculated(handle4)==rates_total)
      if(CopyBuffer(handle4,0,0,1,VALOR4)<=0)
         return(0);
   Valores[3]=VALOR4[0];

   if(Valores[0]!=0 && Valores[1]!=0 && Valores[2]!=0 && Valores[3]!=0)
     {
      ObjectSetInteger(0,BotonExportar,OBJPROP_BGCOLOR,clrMagenta);
      ObjectSetString(0,BotonExportar,OBJPROP_TEXT,"Exportar M. Moviles");
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,BotonExportar);
   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");
   ChartIndicatorDelete(0,0,"MA_MultiTF");
  }
//+------------------------------------------------------------------+
void ExportarFuncion()
  {
   if(Valores[0]==0 || Valores[1]==0 || Valores[2]==0 || Valores[3]==0)
     {
      Alert("Todavia esta cargando las medias Moviles");
      return;
     }

   string InpFileName=Symbol()+" "+TimeToString(iTime(Symbol(),PERIOD_D1,0),TIME_DATE)+".txt"; // file name
   string File= Nombre_Carpeta_MA+"//"+InpFileName;

   if(FileIsExist(File,FILE_COMMON))
      FileDelete(File,FILE_COMMON);

   ResetLastError();
   int file_handle=FileOpen(File,FILE_READ|FILE_WRITE|FILE_TXT|FILE_COMMON);

   if(file_handle!=INVALID_HANDLE)
     {
      string comentario="";

      for(int i=0;i<4;i++)
        {
         comentario+=("Media Movil Diaria "+Periodos[i]+" = "+DoubleToString(Valores[i],Digits())+"\n");
        }


      //--- la cadena está formada, la escribimos en el archivo
      FileWriteString(file_handle,comentario);
      //--- cerramos el archivo
      FileClose(file_handle);
     }
   else
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",File,GetLastError());

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- comprobamos el evento de apretar el botón del ratón
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      //--- si hacemos clic en el objeto con el nombre buttonID
      if(clickedChartObject==BotonExportar)
        {
         //--- estado del botón - está apretado o no
         bool selected=ObjectGetInteger(0,BotonExportar,OBJPROP_STATE);

         if(selected)
           {
            ExportarFuncion();
            ObjectSetInteger(0,BotonExportar,OBJPROP_STATE,false);
           }
        }
      ChartRedraw();// volvemos a dibujar por vía forzada todos los objetos del gráfico
     }
  }
//+------------------------------------------------------------------+
