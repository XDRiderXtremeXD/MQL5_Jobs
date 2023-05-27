//+------------------------------------------------------------------+
//|                                         Paneles Divergencias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_plots 0
#property indicator_separate_window
#property indicator_buffers 0


int ArregloGestion[10];
string NombresCuadros[][9];
string NombresCuadrosTextos[][9];
int Columnas=0;

struct DateTime
  {
   datetime          M1;
   datetime          M5;
   datetime          M15;
   datetime          M30;
   datetime          H1;
   datetime          H4;
   datetime          D1;
   datetime          W1;
  };

string Array_Symbolos[];
DateTime Array_SymbolosDateTime[];

string Nombres[8]= {"M1","M5","M15","M30","H1","H4","D1","W1"};

input string S4="------------Configuracion Cuadros------------";//*--
input int Anclaje_X=10;
input int Anclaje_Y=10;
input int EspacioCuadroHorizontal=0;
input int EspacioCuadroVertical=0;
input int TamanoCuadroHorizontal=60;
input int TamanoCuadroVertical=25;
input int TamanoCuadroHorizontal_PanelRegistro=80;
input int TamanoCuadroVertical_PanelRegistro=25;
input color Color_Linea_Borde=clrGray;
input color Color_Fondo_Default=clrWhite;
input string S5="------------Configuracion Texto------------";//*--
input int TamanoLetrasTexto=7;
input color Color_Texto=clrBlack;


input bool M1=true;
input bool M5=true;
input bool M15=true;
input bool M30=true;
input bool H1=true;
input bool H4=true;
input bool D1=true;
input bool W1=true;

int CharIndicator=-1;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string          InpLoadedSymbol=Symbol();   // Symbol to be load
input ENUM_TIMEFRAMES InpLoadedPeriod=PERIOD_H1;  // Period to be load
input datetime        InpStartDate=D'2021.09.01'; // Start date
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   IndicatorSetString(INDICATOR_SHORTNAME,"PANELES DIVERGENCIAS");

//---
   datetime first_date;
   SeriesInfoInteger(InpLoadedSymbol,InpLoadedPeriod,SERIES_FIRSTDATE,first_date);
   int bars=Bars(InpLoadedSymbol,InpLoadedPeriod);
   Print("First date",first_date,"-",bars,"bars");
//---


   string iName="PANELES DIVERGENCIAS";

   CharIndicator=-1;

   for(int i=0; i<ChartGetInteger(0,CHART_WINDOWS_TOTAL); i++)
     {
      for(int j=0; j<ChartIndicatorsTotal(0,i); j++)
         if(iName==ChartIndicatorName(0,i,j))
           {
            CharIndicator=i;
            break;
           }
      if(CharIndicator!=-1)
         break;
     }


   if(CharIndicator<0)
     {
      Alert("Ventana no creada");
      return(INIT_FAILED);
     }

   Columnas=0;

   if(!RegistrarSimbolo(Array_Symbolos,Array_SymbolosDateTime))
     {
      return(INIT_PARAMETERS_INCORRECT);
     }

//ActualizarDatos(Symbol(),PERIOD_CURRENT);

   GestionarColumnas();
   CrearCuadros();
//--- indicator buffers mapping

//---
   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_BUTTON);

//--- destroy timer
// EventKillTimer();
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
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearCuadros()
  {
   int Filas=ArraySize(Array_Symbolos)+1;
   ArrayResize(NombresCuadros,Filas);
   ArrayResize(NombresCuadrosTextos,Filas);

   for(int c=0; c<Filas; c++)
     {
      for(int f=0; f<Columnas; f++)
        {
         NombresCuadros[c][f]="Cuadro Panel 001 c="+(string) c+" f="+(string)f;
         NombresCuadrosTextos[c][f]="Cuadro Panel 001 c="+(string) c+" f="+(string)f+" Texto";
         int Multiplicador_Ancho=1,Multiplicador_Largo=1;
         //if(!Diferente_Tamano(c,f,4,0,Multiplicador_Ancho,4,true))
         // continue;
         //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
         //  continue;
         string Texto=Texto_Cuadro(f,c);
         int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c;
         int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f;
         int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal;//TamanoCuadroHorizontal
         int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical;// TamanoCuadroVertical
         RectLabelCreate(0,NombresCuadros[c][f],CharIndicator,X,Y,Ancho_,Largo_,Color_Fondo_Default,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,2,false,false,true,0);

         X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c+int((TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2);
         Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
         LabelCreate(0,NombresCuadrosTextos[c][f],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);

        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho)
  {
   if(EsAncho)
     {
      if(f==Point_f)
        {
         if(c>Point_c && c<Point_c+MultiplicadorCuadro)
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
        }
     }
   else
     {
      if(c==Point_c)
        {
         if(f>Point_f && f<Point_f+MultiplicadorCuadro)
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
        }
     }
   return true;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarSimbolo(string &ArraySymbolos[],DateTime &ArraySymbolosDateTime[])
  {
   int Conteo=0;
   for(int s=0; s<SymbolsTotal(true); s++)
     {
      string symbol = SymbolName(s,true);
      if(symbol==NULL)
         continue;
      Conteo++;
      ArrayResize(ArraySymbolos,Conteo);
      ArrayResize(ArraySymbolosDateTime,Conteo);
      ArraySymbolos[Conteo-1]=symbol;
     }

   for(int i=0; i<Conteo; i++)
     {
      bool SymboloPersonalizado=true;
      if(!SymbolSelect(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(false);
        }
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Texto_Cuadro(int c,int f)
  {
   if(f==0)
     {
      switch(c)
        {
         case 0:
            return "Divergencias";
         case 1:
            return Nombres[ArregloGestion[c-1]];
         case 2:
            return Nombres[ArregloGestion[c-1]];
         case 3:
            return Nombres[ArregloGestion[c-1]];
         case 4:
            return Nombres[ArregloGestion[c-1]];
         case 5:
            return Nombres[ArregloGestion[c-1]];
         case 6:
            return Nombres[ArregloGestion[c-1]];
         case 7:
            return Nombres[ArregloGestion[c-1]];
         case 8:
            return Nombres[ArregloGestion[c-1]];
        }
     }

   if(c==0 && f>=1)
      return Array_Symbolos[f-1];

   return "-";
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectLabelCreate(const long             chart_ID=0,               // chart's ID
                     const string           name="RectLabel",         // label name
                     const int              sub_window=0,             // subwindow index
                     const int              x=0,                      // X coordinate
                     const int              y=0,                      // Y coordinate
                     const int              width=50,                 // width
                     const int              height=18,                // height
                     const color            back_clr=C'236,233,216',  // background color
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // border type
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                     const color            clr=clrRed,               // flat border color (Flat)
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // flat border style
                     const int              line_width=1,             // flat border width
                     const bool             back=false,               // in the background
                     const bool             selection=false,          // highlight to move
                     const bool             hidden=true,              // hidden in the object list
                     const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a rectangle label
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create a rectangle label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set label size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border type
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set flat border color (in Flat mode)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set flat border line style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set flat border width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // chart's ID
                 const string            name="Label",             // label name
                 const int               sub_window=0,             // subwindow index
                 const int               x=0,                      // X coordinate
                 const int               y=0,                      // Y coordinate
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                 const string            text="Label",             // text
                 const string            font="Arial",             // font
                 const int               font_size=10,             // font size
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // text slope
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                 const bool              back=false,               // in the background
                 const bool              selection=false,          // highlight to move
                 const bool              hidden=true,              // hidden in the object list
                 const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a text label
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create text label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the slope angle of the text
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionarColumnas()
  {
   int i=0;
   if(M1)
     {
      ArregloGestion[i]=0;
      i++;
     }
   if(M5)
     {
      ArregloGestion[i]=1;
      i++;
     }
   if(M15)
     {
      ArregloGestion[i]=2;
      i++;
     }
   if(M30)
     {
      ArregloGestion[i]=3;
      i++;
     }
   if(H1)
     {
      ArregloGestion[i]=4;
      i++;
     }
   if(H4)
     {
      ArregloGestion[i]=5;
      i++;;
     }
   if(D1)
     {
      ArregloGestion[i]=6;
      i++;
     }
   if(W1)
     {
      ArregloGestion[i]=7;
      i++;
     }
   Columnas=i+1;

  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long& lparam,   // Parameter of type long event
                  const double& dparam, // Parameter of type double event
                  const string& sparam  // Parameter of type string events
                 )
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      //Print("Clic del ratón en el objeto con el nombre '"+sparam+"'");
      string Nombre=sparam+" ";
      int Indice=StringFind(Nombre,"c=",0);
      int IndiceFinal=StringFind(Nombre," ",Indice);
      string Columna=StringSubstr(Nombre,Indice+2,IndiceFinal-(Indice+2));
      Indice=StringFind(Nombre,"f=",0);
      IndiceFinal=StringFind(Nombre," ",Indice);
      string Fila=StringSubstr(Nombre,Indice+2,IndiceFinal-(Indice+2));
      string Simbolo=Array_Symbolos[int(StringToInteger(Columna))-1];
      string Periodo=Nombres[ArregloGestion[int(StringToInteger(Fila))-1]];

      ENUM_TIMEFRAMES TF=Periodo=="M1"?PERIOD_M1:(Periodo=="M5"?PERIOD_M5:(Periodo=="M15"?PERIOD_M15:(Periodo=="M30"?PERIOD_M30:(Periodo=="H1"?PERIOD_H1:(Periodo=="H4"?PERIOD_H4:(Periodo=="D1"?PERIOD_D1:(Periodo=="W1"?PERIOD_W1:(PERIOD_W1))))))));

      ChartSetSymbolPeriod(0,Simbolo,TF);
      Sleep(1000);
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }

   int Count=0;
//---
   MqlRates rates[];
   ArraySetAsSeries(rates,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates);

   while(copied<0 && Count<50)
     {
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates);
      Count++;
     }

   if(Count>=20)
     {
      Alert("ERROR AL SOLICITAR DATOS HISTORICOS");
     }

   return rates[0].time;
//Print("Z2");
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CheckLoadHistory(string symbol,ENUM_TIMEFRAMES period,datetime start_date)
  {
   datetime first_date=0;
   datetime times[100];
//--- check symbol & period
   if(symbol==NULL || symbol=="")
      symbol=Symbol();
   if(period==PERIOD_CURRENT)
      period=Period();
//--- check if symbol is selected in the MarketWatch
   if(!SymbolInfoInteger(symbol,SYMBOL_SELECT))
     {
      if(GetLastError()==ERR_MARKET_UNKNOWN_SYMBOL)
         return(-1);
      SymbolSelect(symbol,true);
     }

   Print("1");
//--- check if data is present
   SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date);
   if(first_date>0 && first_date<=start_date)
      return(1);
//--- don't ask for load of its own data if it is an indicator
   if(MQL5InfoInteger(MQL5_PROGRAM_TYPE)==PROGRAM_INDICATOR && Period()==period && Symbol()==symbol)
      return(-4);
   Print("2");
//--- second attempt
   if(SeriesInfoInteger(symbol,PERIOD_M1,SERIES_TERMINAL_FIRSTDATE,first_date))
     {
      //--- there is loaded data to build timeseries
      if(first_date>0)
        {
         //--- force timeseries build
         CopyTime(symbol,period,first_date+PeriodSeconds(period),1,times);
         //--- check date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(2);
        }
     }
   Print("3");
//--- max bars in chart from terminal options
   int max_bars=TerminalInfoInteger(TERMINAL_MAXBARS);
//--- load symbol history info
   datetime first_server_date=0;
      Print("3a");
   while(!SeriesInfoInteger(symbol,PERIOD_M1,SERIES_SERVER_FIRSTDATE,first_server_date) && !IsStopped())
      Sleep(5);
   
      Print("3b");
//--- fix start date for loading
   if(first_server_date>start_date)
      start_date=first_server_date;
   if(first_date>0 && first_date<first_server_date)
      Print("Warning: first server date ",first_server_date,
            " for ",symbol," does not match to first series date ",first_date);
         Print("3c");
//--- load data step by step
   int fail_cnt=0;

   Print("4");
   while(!IsStopped())
     {
      //--- wait for timeseries build
      while(!SeriesInfoInteger(symbol,period,SERIES_SYNCHRONIZED) && !IsStopped())
         Sleep(5);
      //--- ask for built bars
      int bars=Bars(symbol,period);
      if(bars>0)
        {
         if(bars>=max_bars)
            return(-2);
         //--- ask for first date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(0);
        }
      //--- copying of next part forces data loading
      int copied=CopyTime(symbol,period,bars,100,times);
      if(copied>0)
        {
         //--- check for data
         if(times[0]<=start_date)
            return(0);
         if(bars+copied>=max_bars)
            return(-2);
         fail_cnt=0;
        }
      else
        {
         //--- no more than 100 failed attempts
         fail_cnt++;
         if(fail_cnt>=100)
            return(-5);
         Sleep(10);
        }
     }
   Print("5");
//--- stopped
   return(-3);
  }
//+------------------------------------------------------------------+
//| devuelve a la cadena valor del período                           |
//+------------------------------------------------------------------+
string GetPeriodName(ENUM_TIMEFRAMES period)
  {
   if(period==PERIOD_CURRENT)
      period=Period();
//---
   switch(period)
     {
      case PERIOD_M1:
         return("M1");
      case PERIOD_M2:
         return("M2");
      case PERIOD_M3:
         return("M3");
      case PERIOD_M4:
         return("M4");
      case PERIOD_M5:
         return("M5");
      case PERIOD_M6:
         return("M6");
      case PERIOD_M10:
         return("M10");
      case PERIOD_M12:
         return("M12");
      case PERIOD_M15:
         return("M15");
      case PERIOD_M20:
         return("M20");
      case PERIOD_M30:
         return("M30");
      case PERIOD_H1:
         return("H1");
      case PERIOD_H2:
         return("H2");
      case PERIOD_H3:
         return("H3");
      case PERIOD_H4:
         return("H4");
      case PERIOD_H6:
         return("H6");
      case PERIOD_H8:
         return("H8");
      case PERIOD_H12:
         return("H12");
      case PERIOD_D1:
         return("Daily");
      case PERIOD_W1:
         return("Weekly");
      case PERIOD_MN1:
         return("Monthly");
     }
//---
   return("unknown period");
  }





//+------------------------------------------------------------------+
