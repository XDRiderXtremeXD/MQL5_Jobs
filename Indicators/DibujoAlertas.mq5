//+------------------------------------------------------------------+
//|                                              RectanguloTexto.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0



enum enum_Ubicacion
  {
   Inicio=0,
   Medio=1,
   Final=2,
  };

enum tipoObjeto
  {
   rectangulo=0,
   trend=1,
   ray=2,
   fibo=3,
  };

enum posicionVertical
  {
   Arriba=0,
   Abajo=1,
  };



input string Cuadro="================= RECTANGULO =================";//=====================================================================================
input bool niveles_rectangulo=true;
input string niveles="0 0.25 0.50 0.75 1.0";
input bool ver_niveles=true;
input color ColorRectangulo_Borde=clrMagenta;//Color Linea Borde
input int Width_Rectangulo_Borde=1;//Tamaño Linea Borde
input color color_Rectangulo=clrAqua;//Color Fondo Rectangulo
input bool colorear_Despues_de_Alerta_Rectangulo=true;//Colorear despues de Alerta
input color color_Alerta_Rectangulo=clrGold;//Color Alerta
input ENUM_LINE_STYLE estilo_Rectangulo=STYLE_SOLID;//Estilo Borde Rectangulo
input bool rellenar=false;
input bool fondo=false;
input string S1="---------------- Text ------------------";//---------------------------------------
input bool Deshabilitar_Texto=false;
input enum_Ubicacion Ubicacion_X_Rectangulo=Inicio;
input enum_Ubicacion Ubicacion_Y_Rectangulo=Inicio;
input string Texto_Rectangulo="Hola";
input string Fuente_Rectangulo="Arial";
input uint  Size_Texto_Rectangulo=12;//Tamaño texto
input color color_Texto_Rectangulo=clrBlue;
input string S2="---------------- Alerta ------------------";//---------------------------------------
input bool Alertas_Cuadro=true;
input string Trend="================= TREND =================";//====================================================================
input bool Fijado_Trend=true;
input color color_Trend=clrRed;
input int Width_Trend_Borde=1;//Tamaño Linea Borde
input ENUM_LINE_STYLE estilo_Trend=STYLE_SOLID;//Estilo Trend
input bool colorear_Despues_de_Alerta_Trend=true;//Colorear despues de Alerta
input color color_Alerta_Trend=clrGold;//Color Alerta
input string S1T="---------------- Text ------------------";//---------------------------------------
input posicionVertical posicionTrend=Arriba;
input enum_Ubicacion Ubicacion_X_Trend=Inicio;
input string Texto_Trend="Hola";
input string Fuente_Trend="Arial";
input uint  Size_Texto_Trend=12;//Tamaño texto
input color color_Texto_Trend=clrBlue;
input string S2T="---------------- Alerta ------------------";//---------------------------------------
input bool Alertas_Trend=true;
input string Ray="================= RAY =================";//====================================================================
input string texto="--------- TEXTO -----------";//---------------------------------------------------------------------
input enum_Ubicacion Ubicacion_X_Ray=Inicio;
input string Texto_Ray="Hola";
input string Fuente_Ray="Arial";
input uint  Size_Texto_Ray=12;//Tamaño texto
input color color_Texto_Ray=clrAqua;
input bool colorear_Despues_de_Alerta_Ray=true;//Colorear despues de Alerta
input color color_Alerta_Ray=clrGold;//Color Alerta
input string linea_Ray="--------- LINEA -----------";//---------------------------------------------------------------------
input color color_Linea_Ray=clrAqua;
input uint grosor_Linea_Ray=1;
input ENUM_LINE_STYLE estilo_Linea_Ray=STYLE_SOLID;
input bool Alerta_Linea=true;
input string S2R="---------------- Alerta ------------------";//---------------------------------------
input bool Alertas_Ray=true;
input string Fibo="================= FIBO =================";//=====================================================================================
input string niveles_fibo="0 0.25 0.50 0.75 1.0";
input string niveles_fibo_Alarma="0 0.25 0.50 0.75 1.0";
input color color_Fibo_Niveles=clrGold;//Color Fibo Niveles
input ENUM_LINE_STYLE estilo_Fibo_Niveles=STYLE_SOLID;//Estilo Fibo Niveles
input bool colorear_Despues_de_Alerta_Fibo=true;//Colorear niveles despues de Alerta
input color color_Alerta_Fibo=clrGold;//Color Alerta
input int width_Fibo_Niveles=1;//Tamaño Linea Niveles
input color color_Fibo=clrMagenta;//Color Fibo
input ENUM_LINE_STYLE estilo_Fibo=STYLE_SOLID;//Estilo Fibo
input int width_Fibo_Borde=1;//Tamaño Linea
input string S3="---------------- Alerta ------------------";//------------------------------------------------------------------------------
input bool Alertas_Fibo=true;
input string alertas="================= ALERTAS =================";//=====================================================================================
input bool Alert_Push=true;
input bool Alert_Sound=true;
input bool Alert_Mail=false;
input string colores="================= COLORES =================";//=====================================================================================
input color color_1=clrWhite;
input color color_2=clrRed;
input color color_3=clrYellow;
input color color_4=clrMagenta;
input color color_5=clrPurple;

int sub;
int X;
int Y;

datetime tiempoRecarga=0;
string rectangle_name="Rectangulo 1004 ";
string fibo_name="Fibo 1004 ";
string trend_name="Trend 1004 ";
string ray_name="Ray 1004 ";

MqlRates RatesM1[];
double arrayNivelesFibo[];
double arrayNivelesFibo_fibo[];
double arrayNivelesFibo_fibo_Alarma[];

string coloresBoton="colores Boton 1004";
color colores_array[5];
string nameObjectOriginal="";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   colores_array[0]=color_1;
   colores_array[1]=color_2;
   colores_array[2]=color_3;
   colores_array[3]=color_4;
   colores_array[4]=color_5;
//--- indicator buffers mapping
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   ChartSetInteger(0,CHART_EVENT_OBJECT_DELETE,true);

   if(niveles_rectangulo)
      if(!extraerValoresDoubles(niveles,arrayNivelesFibo))
         return INIT_PARAMETERS_INCORRECT;

   if(!extraerValoresDoubles(niveles_fibo,arrayNivelesFibo_fibo))
      return INIT_PARAMETERS_INCORRECT;

   if(!extraerValoresDoubles(niveles_fibo_Alarma,arrayNivelesFibo_fibo_Alarma))
      return INIT_PARAMETERS_INCORRECT;

   X=(int)1;
   Y=(int)1;
   datetime Tiempo_P;
   double Precio_P;
   ChartXYToTimePrice(0,X,Y,sub,Tiempo_P,Precio_P);
   ActualizarRays(Tiempo_P,Precio_P);

   ArraySetAsSeries(RatesM1,true);
   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(tiempoRecarga!=0)
     {
      if(TimeLocal()>=tiempoRecarga)
        {
         datetime Tiempo_P=0;
         double Precio_P=0;
         ActualizarRays(Tiempo_P,Precio_P);
         tiempoRecarga=0;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EliminarBotones();
   EventKillTimer();
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

   ArraySetAsSeries(close,true);


   ArrayResize(RatesM1,3);
   int copied=CopyRates(NULL,0,0,3,RatesM1);
   static datetime tiempoM1=0;


   CheckRectangleAlerts(Alertas_Cuadro, rectangle_name, RatesM1);
   CheckFiboAlerts(Alertas_Fibo, fibo_name, RatesM1);
   CheckTrendAlerts(Alertas_Trend, trend_name, RatesM1);
   CheckRayAlerts(Alertas_Ray, ray_name, RatesM1);

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   static bool Aprieta=false;
   static bool Dibuja=false;
   static tipoObjeto tipo=rectangulo;
   static datetime Tiempo_P;
   static double Precio_P;
   static string nameColor="";
   static bool ActivarPaleta=true;


   static uint Escala=(uint)ChartGetInteger(0,CHART_SCALE,0);
   if(Escala!=ChartGetInteger(0,CHART_SCALE,0))
     {
      Escala=(uint)ChartGetInteger(0,CHART_SCALE,0);
      tiempoRecarga=TimeLocal()+1;
     }

   DinamicaActivarDibujo(sparam,Dibuja,Aprieta);

   if(id==CHARTEVENT_KEYDOWN)
      FuncionesKey(lparam,Dibuja,tipo,ActivarPaleta,nameColor);

   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      X=(int)lparam;
      Y=(int)dparam;
      ChartXYToTimePrice(0,X,Y,sub,Tiempo_P,Precio_P);

      if(((uint)sparam& 1)== 1)
         ActualizarRays(Tiempo_P,Precio_P);
     }

   if(id==6)
      EliminarObjetoRelacionadosAlObjetoEliminado(sparam,nameColor);

   if(id==10 && sparam=="1" && Dibuja)
     {
      X=(int)lparam;
      Y=(int)dparam;
      ChartXYToTimePrice(0,X,Y,sub,Tiempo_P,Precio_P);

      CrearObjecto(tipo,nameObjectOriginal,Tiempo_P,Precio_P);

      if(tipo==rectangulo)
         ModificacionRectanguloTexto(nameObjectOriginal,true,Tiempo_P,Precio_P);
      if(tipo==fibo)
         ModificacionFibo(nameObjectOriginal,Tiempo_P,Precio_P);
      if(tipo==trend)
         ModificacionTrendTexto(nameObjectOriginal,true,Tiempo_P,Precio_P);
      if(tipo==ray)
         ModificacionRayTexto(nameObjectOriginal,true,Tiempo_P,Precio_P);

      if(ActivarPaleta)
         DibujaBotonesEnObjeto(nameObjectOriginal,nameColor);
     }


   if(id==2)
     {
      ModificacionRectanguloTexto(sparam,false,Tiempo_P,Precio_P);
      ModificacionTrendTexto(sparam,false,Tiempo_P,Precio_P);
      ModificacionRayTexto(sparam,false,Tiempo_P,Precio_P);

      if(ActivarPaleta)
         DibujaBotonesEnObjeto(sparam,nameColor);
     }

   if(id==1)
     {
      if(ActivarPaleta)
         DibujaBotonesEnObjeto(sparam,nameColor);

      if(!(StringFind(sparam,coloresBoton,0)!=-1))
         if(ObjectFind(0,sparam)==0)
            if(!ObjectGetInteger(0,sparam,OBJPROP_SELECTED,0))
               EliminarBotones();

      if((StringFind(sparam,coloresBoton,0)!=-1))
        {
         color ColorCambia=(color)ObjectGetInteger(0,sparam,OBJPROP_COLOR,0);
         CambiaColor(nameColor,ColorCambia);
         ChartRedraw();
        }
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(Alert_Sound)
      Alert(Frase+" en "+Symbol());

   if(Alert_Push)
      SendNotification(Frase+" en "+Symbol());

   if(Alert_Mail)
      SendMail(Frase+" en "+Symbol(),Frase+" en "+Symbol());

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalcularAnchorRectanguloText(ENUM_ANCHOR_POINT &Anchor)
  {
   if(Ubicacion_Y_Rectangulo==Inicio)
     {
      if(Ubicacion_X_Rectangulo==Inicio)
         Anchor=ANCHOR_LEFT_UPPER;
      else
         if(Ubicacion_X_Rectangulo==Medio)
            Anchor=ANCHOR_UPPER;
         else
            Anchor=ANCHOR_RIGHT_UPPER;
     }
   else
      if(Ubicacion_Y_Rectangulo==Medio)
        {
         if(Ubicacion_X_Rectangulo==Inicio)
            Anchor=ANCHOR_LEFT;
         else
            if(Ubicacion_X_Rectangulo==Medio)
               Anchor=ANCHOR_CENTER;
            else
               Anchor=ANCHOR_RIGHT;
        }
      else
        {
         if(Ubicacion_X_Rectangulo==Inicio)
            Anchor=ANCHOR_LEFT_LOWER;
         else
            if(Ubicacion_X_Rectangulo==Medio)
               Anchor=ANCHOR_LOWER;
            else
               Anchor=ANCHOR_RIGHT_LOWER;
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificacionFibo(string nameObject,datetime Tiempo_P,double Precio_P)
  {
   if(StringFind(nameObject,fibo_name,0)!=-1 && (ObjectGetInteger(0,nameObject,OBJPROP_TYPE,0)==OBJ_FIBO))
     {
      ObjectSetDouble(0,nameObject,OBJPROP_PRICE,1,Precio_P);
      ObjectSetInteger(0,nameObject,OBJPROP_TIME,1,Tiempo_P);
      ChartRedraw(0);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificacionRectanguloTexto(string nameObject,bool clickCreate,datetime Tiempo_P,double Precio_P)
  {
   if(StringFind(nameObject,rectangle_name,0)!=-1 && (ObjectGetInteger(0,nameObject,OBJPROP_TYPE,0)==OBJ_RECTANGLE))
     {
      string IDs[2];
      string Id=StringSubstr(nameObject,StringFind(nameObject,"ID:",0)+3,-1);
      StringSplit(Id,StringGetCharacter(",",0),IDs);

      if(clickCreate)
        {
         ObjectSetDouble(0,nameObject,OBJPROP_PRICE,1,Precio_P);
         ObjectSetInteger(0,nameObject,OBJPROP_TIME,1,Tiempo_P);
        }

      double PrecioInicio=ObjectGetDouble(0,nameObject,OBJPROP_PRICE,0);
      double PrecioFinal=ObjectGetDouble(0,nameObject,OBJPROP_PRICE,1);
      datetime TiempoInicio=(datetime)ObjectGetInteger(0,nameObject,OBJPROP_TIME,0);
      datetime TiempoFinal=(datetime)ObjectGetInteger(0,nameObject,OBJPROP_TIME,1);

      ModificacionNivelesRectangulo(nameObject,TiempoInicio,TiempoFinal,PrecioInicio,PrecioFinal);

      int XI=0,XF=0;
      int YI=0,YF=0;
      ChartTimePriceToXY(0,0,TiempoInicio,PrecioInicio,XI,YI);
      ChartTimePriceToXY(0,0,TiempoFinal,PrecioFinal,XF,YF);
      int XM=XI+int((XF-XI)/2.0);
      int YM=YI+int((YF-YI)/2.0);

      datetime TiempoUbicacion=0;
      double   PrecioUbicacion=0;

      double PrecioMedio=PrecioInicio+(PrecioFinal-PrecioInicio)/2;

      ENUM_ANCHOR_POINT Anchor=ANCHOR_LEFT_LOWER;
      CalcularAnchorUbicacion(IDs[0],IDs[1],XI,YI,XM,YM,XF,YF,TiempoInicio,PrecioInicio,TiempoFinal,PrecioFinal,PrecioMedio,TiempoUbicacion,PrecioUbicacion,Anchor);

      ObjectSetDouble(0,nameObject+"Text",OBJPROP_PRICE,0,PrecioUbicacion);
      ObjectSetInteger(0,nameObject+"Text",OBJPROP_TIME,0,TiempoUbicacion);

      ChartRedraw(0);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificacionTrendTexto(string nameObject,bool clickCreate,datetime Tiempo_P,double Precio_P)
  {
   if(StringFind(nameObject,trend_name,0)!=-1 && (ObjectGetInteger(0,nameObject,OBJPROP_TYPE,0)==OBJ_TREND))
     {
      string IDs[1];
      string Id=StringSubstr(nameObject,StringFind(nameObject,"ID:",0)+3,-1);
      StringSplit(Id,StringGetCharacter(",",0),IDs);

      if(clickCreate)
        {
         ObjectSetDouble(0,nameObject,OBJPROP_PRICE,1,Precio_P);
         ObjectSetInteger(0,nameObject,OBJPROP_TIME,1,Tiempo_P);
        }

      if(Fijado_Trend)
        {
         ObjectSetDouble(0,nameObject,OBJPROP_PRICE,0,Precio_P);
         ObjectSetDouble(0,nameObject,OBJPROP_PRICE,1,Precio_P);
        }

      double PrecioInicio=ObjectGetDouble(0,nameObject,OBJPROP_PRICE,0);
      double PrecioFinal=ObjectGetDouble(0,nameObject,OBJPROP_PRICE,1);
      datetime TiempoInicio=(datetime)ObjectGetInteger(0,nameObject,OBJPROP_TIME,0);
      datetime TiempoFinal=(datetime)ObjectGetInteger(0,nameObject,OBJPROP_TIME,1);

      int XI=0,XF=0;
      int YI=0,YF=0;
      ChartTimePriceToXY(0,0,TiempoInicio,PrecioInicio,XI,YI);
      ChartTimePriceToXY(0,0,TiempoFinal,PrecioFinal,XF,YF);
      int XM=XI+int((XF-XI)/2.0);
      int YM=YI+int((YF-YI)/2.0);

      datetime TiempoUbicacion=0;
      double   PrecioUbicacion=0;

      double PrecioMedio=PrecioInicio+(PrecioFinal-PrecioInicio)/2;

      if(TiempoFinal<TiempoInicio)
        {
         datetime guarda=TiempoFinal;
         double guardaP=PrecioFinal;
         TiempoFinal=TiempoInicio;
         PrecioFinal=PrecioInicio;
         TiempoInicio=guarda;
         PrecioInicio=guardaP;
        }

      ENUM_ANCHOR_POINT Anchor=ANCHOR_LEFT_LOWER;
      CalcularAnchorUbicacionTrend(IDs[0],XI,YI,XM,YM,XF,YF,TiempoInicio,PrecioInicio,TiempoFinal,PrecioFinal,PrecioMedio,TiempoUbicacion,PrecioUbicacion,Anchor);

      ObjectSetDouble(0,nameObject+"Text",OBJPROP_PRICE,0,PrecioUbicacion);
      ObjectSetInteger(0,nameObject+"Text",OBJPROP_TIME,0,TiempoUbicacion);

      ChartRedraw(0);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificacionRayTexto(string nameObject,bool clickCreate,datetime Tiempo_P,double Precio_P)
  {
   if(StringFind(nameObject,ray_name,0)!=-1 && (ObjectGetInteger(0,nameObject,OBJPROP_TYPE,0)==OBJ_TREND))
     {
      string IDs[1];
      string Id=StringSubstr(nameObject,StringFind(nameObject,"ID:",0)+3,-1);
      StringSplit(Id,StringGetCharacter(",",0),IDs);

      if(clickCreate)
        {
         ObjectSetDouble(0,nameObject,OBJPROP_PRICE,0,Precio_P);
         ObjectSetInteger(0,nameObject,OBJPROP_TIME,0,Tiempo_P);
        }

      datetime Tiempo1=(datetime)ObjectGetInteger(0,nameObject,OBJPROP_TIME,0);
      double Price1=ObjectGetDouble(0,nameObject,OBJPROP_PRICE,0);
      int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo1,false);
      ObjectSetDouble(0,nameObject,OBJPROP_PRICE,1,Price1);
      ObjectSetDouble(0,nameObject+"Text",OBJPROP_PRICE,0,Price1);

      datetime Tiempo_U;
      double Precio_U;
      datetime Tiempo_M;
      double Precio_M;


      int X1=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
      int Y1=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
      ChartXYToTimePrice(0,X1,Y1,sub,Tiempo_U,Precio_U);

      if(Tiempo_U>Tiempo1)
         ObjectSetInteger(0,nameObject,OBJPROP_TIME,1,Tiempo_U+PeriodSeconds(Period()));

      if(IDs[0]=="Medio")
        {
         int X3=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
         int Y3=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
         ChartXYToTimePrice(0,X3,Y3,sub,Tiempo_M,Precio_M);
         if(Tiempo_M>Tiempo1)
           {
            int X_Inicio;
            int Y_Inicio;
            ChartTimePriceToXY(0,0,Tiempo1,Price1,X_Inicio,Y_Inicio);
            ChartXYToTimePrice(0,X_Inicio+((X3-X_Inicio)/2),Y3,sub,Tiempo_M,Precio_M);
           }
        }

      datetime tiempo=(IDs[0]=="Inicio"?Tiempo1:(IDs[0]=="Final"?Tiempo_U:Tiempo_M));

      if(tiempo>=Tiempo1)
         ObjectSetInteger(0,nameObject+"Text",OBJPROP_TIME,0,tiempo);

      ChartRedraw(0);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearObjecto(tipoObjeto tipo,string nameObject,datetime Tiempo_P,double Precio_P)
  {
   if(ObjectFind(0,nameObject)!=0)
     {
      if(tipo==rectangulo)
        {
         string Name_Text=nameObject+"Text";

         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo_P,false);
         if(RectangleCreate(0,nameObject,0,Tiempo_P,Precio_P,Tiempo_P,Precio_P,color_Rectangulo,estilo_Rectangulo,Width_Rectangulo_Borde,rellenar,fondo,true,true,15))
           {
            CrearNivelesRectangulo(nameObject,Tiempo_P,Precio_P);
            if(!Deshabilitar_Texto)
              {
               ENUM_ANCHOR_POINT Anchor;
               CalcularAnchorRectanguloText(Anchor);
               TextCreate(0,Name_Text,0,Tiempo_P,Precio_P,Texto_Rectangulo,Fuente_Rectangulo,Size_Texto_Rectangulo,color_Texto_Rectangulo,0,Anchor,true,true,true,10);
              }
           }
         ChartRedraw();
        }

      if(tipo==fibo)
        {
         if(FiboLevelsCreate(0,nameObject,0,Tiempo_P,Precio_P,Tiempo_P,Precio_P,color_Fibo,estilo_Fibo,width_Fibo_Borde,true,true,false,false,true,15))
            FiboLevelsSet(ArraySize(arrayNivelesFibo_fibo),arrayNivelesFibo_fibo,color_Fibo_Niveles,estilo_Fibo_Niveles,width_Fibo_Niveles,0,nameObject);
        }
      if(tipo==trend)
        {
         if(TrendCreate(0,nameObject,0,Tiempo_P,Precio_P,Tiempo_P,Precio_P,color_Trend,estilo_Trend,Width_Trend_Borde,false,true,false,false,true,15))
           {
            ENUM_ANCHOR_POINT Anchor=Ubicacion_X_Trend==Inicio?(posicionTrend==Arriba?ANCHOR_LEFT_LOWER:ANCHOR_LEFT_UPPER)
            :(Ubicacion_X_Trend==Medio?(posicionTrend==Arriba?ANCHOR_LOWER:ANCHOR_UPPER):(posicionTrend==Arriba?ANCHOR_RIGHT_LOWER:ANCHOR_RIGHT_UPPER));
            TextCreate(0,nameObject+"Text",0,Tiempo_P,Precio_P,Texto_Trend,Fuente_Trend,Size_Texto_Trend,color_Texto_Trend,0,Anchor,true,true,true,10);
           }
        }

      if(tipo==ray)
        {
         int Width_Barras=(int)ChartGetInteger(0,CHART_WIDTH_IN_BARS,0);
         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo_P,false);

         datetime Tiempo_U=0;
         double Precio_U=0;
         int X1=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
         int Y1=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
         ChartXYToTimePrice(0,X1,Y1,sub,Tiempo_U,Precio_U);

         if(TrendCreate(0,nameObject,0,Tiempo_P,Precio_P,Tiempo_U+PeriodSeconds(Period())*1,Precio_P,color_Linea_Ray,estilo_Linea_Ray,grosor_Linea_Ray,true,true,false,true,15,OBJ_ALL_PERIODS))
           {
            ENUM_ANCHOR_POINT Anchor=(Ubicacion_X_Ray==Inicio?ANCHOR_LEFT_LOWER:(Ubicacion_X_Ray==Final?ANCHOR_RIGHT_LOWER:ANCHOR_LOWER));

            datetime Tiempo_M=0;
            double Precio_M=0;

            if(Ubicacion_X_Ray==Medio)
              {
               int X3=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
               int Y3=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);

               ChartXYToTimePrice(0,X3,Y3,sub,Tiempo_M,Precio_M);
               if(Tiempo_M>Tiempo_P)
                  ChartXYToTimePrice(0,X+((X3-X)/2),Y3,sub,Tiempo_M,Precio_M);
              }

            datetime tiempo=(Ubicacion_X_Ray==Inicio?Tiempo_P:(Ubicacion_X_Ray==Final?Tiempo_U:Tiempo_M));

            TextCreate(0,nameObject+"Text",0,tiempo,Precio_P,Texto_Ray,Fuente_Ray,Size_Texto_Ray,color_Texto_Ray,0,Anchor,true,true,true,10);
           }
         ChartRedraw();

        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool extraerValoresDoubles(string niveles_,double &ArrayNivelesCuadrado[])
  {
   string nivelesArray[];
   StringSplit(niveles_, ' ',nivelesArray);
   ArrayResize(ArrayNivelesCuadrado,0);

   for(int i = 0; i < ArraySize(nivelesArray); i++)
     {
      if(!ComprobarSub(nivelesArray[i],true))
        {
         Alert("Valor ",nivelesArray[i]," no es un valor decimal");
         return false;
        }

      int size=ArraySize(ArrayNivelesCuadrado);
      ArrayResize(ArrayNivelesCuadrado,size+1);
      ArrayNivelesCuadrado[size]=StringToDouble(nivelesArray[i]);
      // Utiliza el valor double como necesites
      // Print("Valor double: ", DoubleToString(ArrayNivelesCuadrado[size],2));
     }

   if(ArraySize(ArrayNivelesCuadrado)==0)
     {
      Alert("Por lo menos debe de haber un valor valido en el parametro");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearNivelesRectangulo(string nameObject,datetime tiempoInicio,double precioInicio)
  {
   if(niveles_rectangulo)
     {
      if(FiboLevelsCreate(0,nameObject+"fibo",0,tiempoInicio,precioInicio,tiempoInicio,precioInicio,clrNONE,estilo_Rectangulo,Width_Rectangulo_Borde,false,false,false,false,true,0))
         FiboLevelsSet(ArraySize(arrayNivelesFibo),arrayNivelesFibo,color_Rectangulo,estilo_Rectangulo,Width_Rectangulo_Borde,0,nameObject+"fibo",false);

      if(ver_niveles)
         for(int i=0; i<ArraySize(arrayNivelesFibo); i++)
           {
            TextCreate(0,nameObject+DoubleToString(arrayNivelesFibo[i],2)+"t"+"l",0,tiempoInicio,precioInicio,DoubleToString(arrayNivelesFibo[i],2),"Arial",12,color_Rectangulo,0,ANCHOR_LEFT,false,false,true,0);
            TextCreate(0,nameObject+DoubleToString(arrayNivelesFibo[i],2)+"t"+"r",0,tiempoInicio,precioInicio,DoubleToString(arrayNivelesFibo[i],2),"Arial",12,color_Rectangulo,0,ANCHOR_RIGHT,false,false,true,0);
           }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificacionNivelesRectangulo(string nameObject,datetime tiempoInicio,datetime tiempoFinal,double precioInicio,double precioFinal)
  {
   if(ObjectFind(0,nameObject+"fibo")==0)
     {
      double rango=precioFinal-precioInicio;
      datetime Final=tiempoFinal>tiempoInicio?tiempoFinal:tiempoInicio;
      datetime Inicio=tiempoFinal<tiempoInicio?tiempoFinal:tiempoInicio;

      ObjectSetDouble(0,nameObject+"fibo",OBJPROP_PRICE,0,precioInicio);
      ObjectSetDouble(0,nameObject+"fibo",OBJPROP_PRICE,1,precioFinal);
      ObjectSetInteger(0,nameObject+"fibo",OBJPROP_TIME,0,tiempoInicio);
      ObjectSetInteger(0,nameObject+"fibo",OBJPROP_TIME,1,tiempoFinal);

      int Niveles=(int)ObjectGetInteger(0,nameObject+"fibo",OBJPROP_LEVELS,0);

      for(int i=0; i<Niveles; i++)
        {
         double nivel=ObjectGetDouble(0,nameObject+"fibo",OBJPROP_LEVELVALUE,i);
         double Precio=precioFinal-rango*nivel;
         if(ObjectFind(0,nameObject+DoubleToString(nivel,2)+"t"+"l")==0)
            ObjectSetDouble(0,nameObject+DoubleToString(nivel,2)+"t"+"l",OBJPROP_PRICE,0,Precio);
         if(ObjectFind(0,nameObject+DoubleToString(nivel,2)+"t"+"l")==0)
            ObjectSetInteger(0,nameObject+DoubleToString(nivel,2)+"t"+"l",OBJPROP_TIME,0,Final);

         if(ObjectFind(0,nameObject+DoubleToString(nivel,2)+"t"+"r")==0)
            ObjectSetDouble(0,nameObject+DoubleToString(nivel,2)+"t"+"r",OBJPROP_PRICE,0,Precio);
         if(ObjectFind(0,nameObject+DoubleToString(nivel,2)+"t"+"r")==0)
            ObjectSetInteger(0,nameObject+DoubleToString(nivel,2)+"t"+"r",OBJPROP_TIME,0,Inicio);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalcularAnchorUbicacion(string PosX,string PosY,int XI,int YI,int XM,int YM,int XF,int YF,datetime TiempoInicio,double PrecioInicio,datetime TiempoFinal,double PrecioFinal,double PrecioMedio,
                             datetime &TiempoUbicacion,double &PrecioUbicacion,ENUM_ANCHOR_POINT &Anchor)
  {
   if(PosY=="Inicio")
     {
      if(PosX=="Inicio")
        {
         ChartXYToTimePrice(0,XI,YI,sub,TiempoUbicacion,PrecioUbicacion);
         TiempoUbicacion=TiempoInicio;
         PrecioUbicacion=PrecioInicio;
        }
      else
         if(PosX=="Medio")
           {
            ChartXYToTimePrice(0,XM,YI,sub,TiempoUbicacion,PrecioUbicacion);
            TiempoUbicacion=TiempoUbicacion;
            PrecioUbicacion=PrecioInicio;
           }
         else
           {
            ChartXYToTimePrice(0,XF,YI,sub,TiempoUbicacion,PrecioUbicacion);
            TiempoUbicacion=TiempoFinal;
            PrecioUbicacion=PrecioInicio;
           }
     }
   else
      if(PosY=="Medio")
        {
         if(PosX=="Inicio")
           {
            ChartXYToTimePrice(0,XI,YM,sub,TiempoUbicacion,PrecioUbicacion);
            TiempoUbicacion=TiempoInicio;
            PrecioUbicacion=PrecioMedio;
           }
         else
            if(PosX=="Medio")
              {
               ChartXYToTimePrice(0,XM,YM,sub,TiempoUbicacion,PrecioUbicacion);
               TiempoUbicacion=TiempoUbicacion;
               PrecioUbicacion=PrecioMedio;
              }
            else
              {
               ChartXYToTimePrice(0,XF,YM,sub,TiempoUbicacion,PrecioUbicacion);
               TiempoUbicacion=TiempoFinal;
               PrecioUbicacion=PrecioMedio;
              }
        }
      else
        {
         if(PosX=="Inicio")
           {
            ChartXYToTimePrice(0,XI,YF,sub,TiempoUbicacion,PrecioUbicacion);
            TiempoUbicacion=TiempoInicio;
            PrecioUbicacion=PrecioFinal;
           }
         else
            if(PosX=="Medio")
              {
               ChartXYToTimePrice(0,XM,YF,sub,TiempoUbicacion,PrecioUbicacion);
               TiempoUbicacion=TiempoUbicacion;
               PrecioUbicacion=PrecioFinal;
              }
            else
              {
               ChartXYToTimePrice(0,XF,YF,sub,TiempoUbicacion,PrecioUbicacion);
               TiempoUbicacion=TiempoFinal;
               PrecioUbicacion=PrecioFinal;
              }
        }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalcularAnchorUbicacionTrend(string PosX,int XI,int YI,int XM,int YM,int XF,int YF,datetime TiempoInicio,double PrecioInicio,datetime TiempoFinal,double PrecioFinal,double PrecioMedio,
                                  datetime &TiempoUbicacion,double &PrecioUbicacion,ENUM_ANCHOR_POINT &Anchor)
  {
   if(PosX=="Inicio")
      ChartXYToTimePrice(0,XI,YI,sub,TiempoUbicacion,PrecioUbicacion);
   else
      if(PosX=="Medio")
         ChartXYToTimePrice(0,XM,YM,sub,TiempoUbicacion,PrecioUbicacion);
      else
         ChartXYToTimePrice(0,XF,YF,sub,TiempoUbicacion,PrecioUbicacion);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GenerarNombre(string prefixName,enum_Ubicacion X_,enum_Ubicacion Y_)
  {
   static int Enumeracion=0;
   if(Enumeracion==100)
      Enumeracion=0;

   string ID="ID:"+EnumToString(X_)+","+EnumToString(Y_);
   string nameObject=prefixName+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion+ID;
   Enumeracion++;

   return nameObject;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GenerarNombre(string prefixName,enum_Ubicacion X_)
  {
   static int Enumeracion=0;
   if(Enumeracion==100)
      Enumeracion=0;

   string ID="ID:"+EnumToString(X_);
   string nameObject=prefixName+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion+ID;
   Enumeracion++;

   return nameObject;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GenerarNombre(string prefixName)
  {
   static int Enumeracion=0;
   if(Enumeracion==100)
      Enumeracion=0;


   string nameObject=prefixName+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion;
   Enumeracion++;

   return nameObject;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarSub(string cadena,bool EsDouble)
  {
   ushort Digito=0;
   int Numero=0;
   int Punto=0;

   for(int i=0; i<StringLen(cadena); i++)
     {
      Digito=StringGetCharacter(cadena,i);
      if((Digito<'0' || Digito>'9') && Digito!='.')
         return false;

      if(Digito=='.')
         Punto++;

      if(Punto>=2)
         return false;

      if(Digito>='0' && Digito<='9')
         Numero++;
     }

   if(!EsDouble)
     {
      if(Punto!=0)
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarRays(datetime Tiempo_P,double Precio_P)
  {
   int total=ObjectsTotal(0,0,OBJ_TREND);
   for(int i=0; i<total; i++)
      if(StringFind(ObjectName(0,i,0,OBJ_TREND),ray_name,0)!=-1)
         ModificacionRayTexto(ObjectName(0,i,0,OBJ_TREND),false,Tiempo_P,Precio_P);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckRectangleAlerts(const bool alertEnabled, const string rectangleName, MqlRates &ratesM1[])
  {
   if(!alertEnabled)
      return;

   int rayCount = ObjectsTotal(0, 0, OBJ_RECTANGLE);
   for(int i = rayCount - 1; i >= 0; i--)
     {
      string trendName = ObjectName(0, i, 0, OBJ_RECTANGLE);
      if(nameObjectOriginal==trendName)
         continue;

      if(StringFind(trendName, rectangleName, 0) != -1)
        {
         double price1 = ObjectGetDouble(0, trendName, OBJPROP_PRICE, 0);
         double price2 = ObjectGetDouble(0, trendName, OBJPROP_PRICE, 1);
         string descripcion = ObjectGetString(0, trendName, OBJPROP_TEXT, 0);

         if(descripcion != "AlertaSonada")
           {
            if((ratesM1[1].close < price1 && ratesM1[0].close > price1) || (ratesM1[1].close > price1 && ratesM1[0].close < price1))
              {
               Alertas("RECTANGULO Precio llego al nivel " + DoubleToString(price1, Digits()));
               ObjectSetString(0, trendName, OBJPROP_TEXT, "AlertaSonada");
               if(colorear_Despues_de_Alerta_Rectangulo)
                  ObjectSetInteger(0, trendName, OBJPROP_COLOR, color_Alerta_Rectangulo);
               if(ObjectFind(0, trendName + "fibo") == 0)
                  ObjectSetInteger(0, trendName + "fibo", OBJPROP_LEVELCOLOR, 0, color_Alerta_Rectangulo);
              }
            if((ratesM1[1].close < price2 && ratesM1[0].close > price2) || (ratesM1[1].close > price2 && ratesM1[0].close < price2))
              {
               Alertas("RECTANGULO Precio llego al nivel " + DoubleToString(price2, Digits()));
               ObjectSetString(0, trendName, OBJPROP_TEXT, "AlertaSonada");
               if(colorear_Despues_de_Alerta_Rectangulo)
                  ObjectSetInteger(0, trendName, OBJPROP_COLOR, color_Alerta_Rectangulo);
               if(ObjectFind(0, trendName + "fibo") == 0)
                  ObjectSetInteger(0, trendName + "fibo", OBJPROP_LEVELCOLOR, 0, color_Alerta_Rectangulo);
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckFiboAlerts(const bool alertEnabled, const string fiboName, MqlRates &ratesM1[])
  {
   if(!alertEnabled)
      return;

   int fiboCount = ObjectsTotal(0, 0, OBJ_FIBO);
   for(int i = fiboCount - 1; i >= 0; i--)
     {
      string trendName = ObjectName(0, i, 0, OBJ_FIBO);
      if(nameObjectOriginal==trendName)
         continue;
      if(StringFind(trendName, fiboName, 0) != -1)
        {
         string descripcion = ObjectGetString(0, trendName, OBJPROP_TEXT, 0);

         if(descripcion != "AlertaSonada")
           {
            double priceInicio = ObjectGetDouble(0, trendName, OBJPROP_PRICE, 0);
            double priceFinal = ObjectGetDouble(0, trendName, OBJPROP_PRICE, 1);
            double range = priceFinal - priceInicio;

            for(int j = 0; j < ArraySize(arrayNivelesFibo_fibo_Alarma); j++)
              {
               double precioAlarma = priceFinal - range * arrayNivelesFibo_fibo_Alarma[j];

               if((ratesM1[1].close < precioAlarma && ratesM1[0].close > precioAlarma) || (ratesM1[1].close > precioAlarma && ratesM1[0].close < precioAlarma))
                 {
                  Alertas("FIBO Precio llego al nivel " + DoubleToString(arrayNivelesFibo_fibo_Alarma[j], 2));
                  ObjectSetString(0, trendName, OBJPROP_TEXT, "AlertaSonada");
                  if(colorear_Despues_de_Alerta_Fibo)
                     ObjectSetInteger(0, trendName, OBJPROP_COLOR, color_Alerta_Fibo);
                  ObjectSetInteger(0, trendName, OBJPROP_LEVELCOLOR, 0, color_Alerta_Fibo);
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckTrendAlerts(const bool alertEnabled, const string trendName,MqlRates &ratesM1[])
  {
   if(!alertEnabled)
      return;

   int trendCount = ObjectsTotal(0, 0, OBJ_TREND);
   for(int i = trendCount - 1; i >= 0; i--)
     {
      string trendObjectName = ObjectName(0, i, 0, OBJ_TREND);
      if(nameObjectOriginal==trendObjectName)
         continue;
      if(StringFind(trendObjectName, trendName, 0) != -1)
        {
         string descripcion = ObjectGetString(0, trendObjectName, OBJPROP_TEXT, 0);
         if(descripcion != "AlertaSonada")
           {
            double priceInicio = ObjectGetDouble(0, trendObjectName, OBJPROP_PRICE, 0);
            double priceFinal = ObjectGetDouble(0, trendObjectName, OBJPROP_PRICE, 1);
            datetime tiempoInicio = (datetime)ObjectGetInteger(0, trendObjectName, OBJPROP_TIME, 0);
            datetime tiempoFinal = (datetime)ObjectGetInteger(0, trendObjectName, OBJPROP_TIME, 1);
            double precioAlarma = ObjectGetValueByTime(0, trendObjectName, ratesM1[0].time, 0);

            if(precioAlarma != 0)
              {
               if((ratesM1[1].close < precioAlarma && ratesM1[0].close > precioAlarma) || (ratesM1[1].close > precioAlarma && ratesM1[0].close < precioAlarma))
                 {
                  Alertas("TREND Precio llego a " + DoubleToString(precioAlarma, Digits()));
                  ObjectSetString(0, trendObjectName, OBJPROP_TEXT, "AlertaSonada");
                  if(colorear_Despues_de_Alerta_Trend)
                     ObjectSetInteger(0, trendName, OBJPROP_COLOR, color_Alerta_Trend);
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckRayAlerts(const bool alertEnabled, const string rayName, MqlRates &ratesM1[])
  {
   if(!alertEnabled)
      return;

   int rayCount = ObjectsTotal(0, 0, OBJ_TREND);
   for(int i = rayCount - 1; i >= 0; i--)
     {
      string trendName = ObjectName(0, i, 0, OBJ_TREND);
      if(nameObjectOriginal==trendName)
         continue;
      if(StringFind(trendName, rayName, 0) != -1)
        {
         string descripcion = ObjectGetString(0, trendName, OBJPROP_TEXT, 0);
         if(descripcion != "AlertaSonada")
           {
            double precioAlarma = ObjectGetDouble(0, trendName, OBJPROP_PRICE, 0);

            if(precioAlarma != 0)
              {
               if((ratesM1[1].close < precioAlarma && ratesM1[0].close > precioAlarma) || (ratesM1[1].close > precioAlarma && ratesM1[0].close < precioAlarma))
                 {
                  Alertas("RAY Precio llego a " + DoubleToString(precioAlarma, Digits()));
                  ObjectSetString(0, trendName, OBJPROP_TEXT, "AlertaSonada");
                  if(colorear_Despues_de_Alerta_Ray)
                     ObjectSetInteger(0, trendName, OBJPROP_COLOR, color_Alerta_Ray);
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearBotones(datetime tiempoAnclaje,double precioAnclaje,int mult)
  {

   int x,y;
   ChartTimePriceToXY(0,0,tiempoAnclaje,precioAnclaje,x,y);
   for(int i=0; i<5; i++)
     {
      double precioInicio,precioFinal;
      datetime tiempoFinal,tiempoInicio;

      ChartXYToTimePrice(0,x+30*i,y,sub,tiempoInicio,precioInicio);
      ChartXYToTimePrice(0,x+30*i+30,MathMax(0,y-40*mult),sub,tiempoFinal,precioFinal);

      if(ObjectFind(0,coloresBoton+string(i))!=0)
         RectangleCreate(0,coloresBoton+string(i),0,tiempoInicio,precioAnclaje+5*Point()*mult,tiempoFinal,precioFinal+5*Point(),colores_array[i],STYLE_SOLID,1,true,false,false,true,10);
      else
        {
         ObjectSetDouble(0,coloresBoton+string(i),OBJPROP_PRICE,0,precioInicio+5*Point()*mult);
         ObjectSetDouble(0,coloresBoton+string(i),OBJPROP_PRICE,1,precioFinal+5*Point()*mult);
         ObjectSetInteger(0,coloresBoton+string(i),OBJPROP_TIME,0,tiempoInicio);
         ObjectSetInteger(0,coloresBoton+string(i),OBJPROP_TIME,1,tiempoFinal);
        }
     }
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarBotones()
  {
   for(int i=0; i<5; i++)
     {
      if(ObjectFind(0,coloresBoton+string(i))==0)
         ObjectDelete(0,coloresBoton+string(i));
     }
   ChartRedraw();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CambiaColor(string nameColor,color ColorCambia)
  {
   color ColorAnterior=(color)ObjectGetInteger(0,nameColor,OBJPROP_COLOR,0);

   ObjectSetInteger(0,nameColor,OBJPROP_COLOR,ColorCambia);
   ObjectSetInteger(0,nameColor,OBJPROP_BGCOLOR,ColorCambia);
   ObjectSetInteger(0,nameColor,OBJPROP_BORDER_COLOR,ColorCambia);

   long tipo=ObjectGetInteger(0,nameColor,OBJPROP_TYPE,0);

   if(tipo==OBJ_FIBO)
     {
      ObjectSetInteger(0,nameColor,OBJPROP_COLOR,ColorAnterior);
      for(int i=0; i<ObjectGetInteger(0,nameColor,OBJPROP_LEVELS,0); i++)
         ObjectSetInteger(0,nameColor,OBJPROP_LEVELCOLOR,i,ColorCambia);
     }
   if(tipo==OBJ_RECTANGLE)
     {
      if(ObjectFind(0,nameColor+"fibo")==0)
        {
         for(int i=0; i<ObjectGetInteger(0,nameColor+"fibo",OBJPROP_LEVELS,0); i++)
           {
            ObjectSetInteger(0,nameColor+"fibo",OBJPROP_LEVELCOLOR,i,ColorCambia);
            string nameLevel=nameColor+DoubleToString(ObjectGetDouble(0,nameColor+"fibo",OBJPROP_LEVELVALUE,i),2)+"t"+"l";
            if(ObjectFind(0,nameLevel)==0)
               ObjectSetInteger(0,nameLevel,OBJPROP_COLOR,ColorCambia);
            nameLevel=nameColor+DoubleToString(ObjectGetDouble(0,nameColor+"fibo",OBJPROP_LEVELVALUE,i),2)+"t"+"r";
            if(ObjectFind(0,nameLevel)==0)
               ObjectSetInteger(0,nameLevel,OBJPROP_COLOR,ColorCambia);
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujaBotonesEnObjeto(string objeto,string &nameColor)
  {
   if(!(StringFind(objeto,coloresBoton,0)!=-1))
      if(ObjectFind(0,objeto)==0)
         if(ObjectGetInteger(0,objeto,OBJPROP_SELECTED,0))
           {
            double PrecioInicio=ObjectGetDouble(0,objeto,OBJPROP_PRICE,0);
            double PrecioFinal=ObjectGetDouble(0,objeto,OBJPROP_PRICE,1);
            datetime TiempoInicio=(datetime)ObjectGetInteger(0,objeto,OBJPROP_TIME,0);
            datetime TiempoFinal=(datetime)ObjectGetInteger(0,objeto,OBJPROP_TIME,1);

            if(TiempoInicio>TiempoFinal)
               TiempoInicio=TiempoFinal;

            if(PrecioFinal<PrecioInicio)
               PrecioFinal=PrecioInicio;

            nameColor=objeto;

            int mult=ObjectGetInteger(0,objeto,OBJPROP_TYPE,0)==OBJ_RECTANGLE?1:-1;

            CrearBotones(TiempoInicio,PrecioFinal,mult);
            ChartRedraw();
           }
  }
//+------------------------------------------------------------------+
void FuncionesKey(long key,bool &Dibuja,tipoObjeto &tipo,bool &ActivarPaleta,string &nameColor)
  {
   if(key==68)
     {
      Comment("Dibuja");
      Dibuja=true;
      nameObjectOriginal=GenerarNombre(rectangle_name,Ubicacion_X_Rectangulo,Ubicacion_Y_Rectangulo);
      tipo=rectangulo;
     }
   if(key==72)
     {
      Comment("Dibuja");
      Dibuja=true;
      nameObjectOriginal=GenerarNombre(fibo_name);
      tipo=fibo;
     }
   if(key==71)
     {
      Comment("Dibuja");
      Dibuja=true;
      nameObjectOriginal=GenerarNombre(trend_name,Ubicacion_X_Trend);
      tipo=trend;
     }
   if(key==70)
     {
      Comment("Dibuja");
      Dibuja=true;
      nameObjectOriginal=GenerarNombre(ray_name,Ubicacion_X_Ray);
      tipo=ray;
     }
   if(key==82)
     {
      ActivarPaleta=!ActivarPaleta;
      if(!ActivarPaleta)
         EliminarBotones();
      else
         DibujaBotonesEnObjeto(nameColor,nameColor);
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DinamicaActivarDibujo(string sparam,bool &Dibuja,bool &Aprieta)
  {
   if(sparam=="1" && Dibuja)
     {
      Aprieta=true;
      ChartSetInteger(0, CHART_MOUSE_SCROLL, false);
     }

   if(Aprieta && sparam=="0" && Dibuja)
     {
      Aprieta=false;
      Dibuja=false;
      nameObjectOriginal="";
      Comment("");
      ChartSetInteger(0, CHART_MOUSE_SCROLL, true);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarObjetoRelacionadosAlObjetoEliminado(string sparam,string nameColor)
  {
   if(StringFind(sparam,rectangle_name,0)!=-1 ||
      StringFind(sparam,ray_name,0)!=-1 ||
      StringFind(sparam,trend_name,0)!=-1)
     {
      ObjectsDeleteAll(0,sparam,0,-1);
      if(sparam==nameColor)
         EliminarBotones();

      ChartRedraw();
     }
  }
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // ID del gráfico
                     const string          name="Rectangle",  // nombre del rectángulo
                     const int             sub_window=0,      // número de subventana
                     datetime              time1=0,           // hora del primer punto
                     double                price1=0,          // precio del primer punto
                     datetime              time2=0,           // hora del segundo punto
                     double                price2=0,          // precio del segundo punto
                     const color           clr=clrRed,        // color del rectángulo
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del rectángulo
                     const int             width=1,           // grosor de las líneas del rectángulo
                     const bool            fill=false,        // relleno del rectángulo con el color
                     const bool            back=false,        // al fondo
                     const bool            selection=true,    // seleccionar para mover
                     const bool            hidden=true,       // ocultar en la lista de objetos
                     const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el rectángulo según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el rectángulo! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- activar (true) o desactivar (false) el modo de relleno del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del rectángulo para mover
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
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
bool TextCreate(const long              chart_ID=0,               // ID del gráfico
                const string            name="Text",              // nombre del objeto
                const int               sub_window=0,             // número de subventana
                datetime                time=0,                   // hora del punto de anclaje
                double                  price=0,                  // precio del punto de anclaje
                const string            text="Text",              // el texto
                const string            font="Arial",             // fuente
                const int               font_size=10,             // tamaño de la fuente
                const color             clr=clrRed,               // color
                const double            angle=0.0,                // inclinación del texto
                const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                const bool              back=false,               // al fondo
                const bool              selection=false,          // seleccionar para mover
                const bool              hidden=true,              // ocultar en la lista de objetos
                const long              z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el objeto "Texto"
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Texto\"! Código del error = ",GetLastError());
      return(false);
     }
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el ángulo de inclinación del texto
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento del texto con ratón
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
bool TrendCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="TrendLine",  // Nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time1=0,           // hora del primer punto
                 double                price1=0,          // precio del primer punto
                 datetime              time2=0,           // hora del segundo punto
                 double                price2=0,          // precio del segundo punto
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray_left=false,    // continuación de la línea a la izquierda
                 const bool            ray_right=false,   // continuación de la línea a la derecha
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- establecemos las coordenadas de los puntos de anclaje si todavía no han sido establecidas
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea de tendencia según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea de tendencia! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de visualización de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la línea con ratón
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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
bool FiboLevelsCreate(const long            chart_ID=0,        // ID del gráfico
                      const string          name="FiboLevels", // nombre del objeto
                      const int             sub_window=0,      // número de subventana
                      datetime              time1=0,           // hora del primer punto
                      double                price1=0,          // precio del primer punto
                      datetime              time2=0,           // hora del segundo punto
                      double                price2=0,          // precio del segundo punto
                      const color           clr=clrRed,        // color del objeto
                      const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del objeto
                      const int             width=1,           // grosor de las líneas del objeto
                      const bool            back=false,        // al fondo
                      const bool            selection=true,    // seleccionar para mover
                      const bool            ray_left=false,    // continuación del objeto a la izquierda
                      const bool            ray_right=false,   // continuación del objeto a la derecha
                      const bool            hidden=true,       // ocultar en la lista de objetos
                      const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos los "Retrocesos de Fibonacci" según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_FIBO,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Falo al crear los \"Retrocesos de Fibonacci\"! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del objeto para mover
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear con el ratón sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiboLevelsSet(int             levels,            // número de las líneas del nivel
                   double          &values[],         // valores de las líneas del nivel
                   color           color_,         // color de las líneas del nivel
                   ENUM_LINE_STYLE style,         // estilo de las líneas del nivel
                   int             width,         // grosor de las líneas del nivel
                   const long      chart_ID=0,        // ID del gráfico
                   const string    name="FiboLevels",
                   const bool ver_Texto=true
                  ) // nombre del objeto
  {
//--- comprobamos los tamaños de los arrays
   if(levels!=ArraySize(values))
     {
      Print(__FUNCTION__,": ¡Error. La longitud del array no corresponde al número de los niveles!");
      return(false);
     }
//--- establecemos el número de los niveles
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels);
//--- establecemos las propiedades de los niveles en el ciclo
   for(int i=0; i<levels; i++)
     {
      //--- valor del nivel
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]);
      //--- color del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,color_);
      //--- estilo del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,style);
      //--- grosor del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,width);
      //--- descripción del nivel
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,ver_Texto?DoubleToString(100*values[i],1):"");
     }
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
