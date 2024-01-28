//+------------------------------------------------------------------+
//|                                              RatioRiskObject.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Risk_Object
  {
public:
   //--- create
   virtual bool      CrearObjeto(long x,long y,bool IsLarga,string ID,int TP_,int SL_,color colorTP_,color colorSL_,color colorOP_,double Lote_,int SizeTexto,bool Fill);
   virtual bool      CrearObjeto(string byIdentifier,bool IsLargo,double Lote_);

   virtual void      MoverObjeto();

   virtual void      SetearTiempo(datetime tiempo,int index);

   virtual void      SetearPriceOP(double Price,double PriceSL,double PriceTP);

   virtual void      SetearFiltroOP(double PriceTP,double PriceSL);

   virtual void      Seleccionar(bool Select);

   virtual void      Modificar_TP(double Value);

   virtual void      Modificar_SL(double Value);

   virtual void      Modificar_OP(double Value);

   virtual void      Delete();

   virtual bool      ExisteObj(string obj,string Identifier);

   virtual void      GenerarNombres(string stringID_);

   virtual string      GetStringID() {return stringID;};

   virtual bool      GetTipo() {return IsLarga_Risk;};

   virtual void      ModificarTextoOP();

   virtual void      ModificarTextoTP();

   virtual void      ModificarTextoSL();

private:
   string            OP_Line;
   string            SL_Cuadro;
   string            TP_Cuadro;
   string            Contexto_Cuadro;

   string            Text_TP1;
   string            Text_TP2;

   string            Text_SL1;
   string            Text_SL2;

   string            Text_OP1;
   string            Text_OP2;

   double            Price_TP;
   double            Price_OP;
   double            Price_SL;

   datetime          Time_Points[2];

   bool              IsLarga_Risk;

   string            stringID;
   double            Lote_Risk;

protected:
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object::MoverObjeto()
  {
   datetime time1=(datetime)ObjectGetInteger(0,Contexto_Cuadro,OBJPROP_TIME,0);
   datetime time2=(datetime)ObjectGetInteger(0,Contexto_Cuadro,OBJPROP_TIME,1);

   double PriceOP1=ObjectGetDouble(0,OP_Line,OBJPROP_PRICE,0);
   double PriceOP2=ObjectGetDouble(0,OP_Line,OBJPROP_PRICE,1);
   double PriceTP=ObjectGetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,1);
   double PriceSL=ObjectGetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,0);

   if(Time_Points[0]!=time1)
      SetearTiempo(time1,0);
   else
      if(Time_Points[0]!=time1)
         SetearTiempo(time1,0);

   if(Time_Points[1]!=time2)
      SetearTiempo(time2,1);
   else
      if(Time_Points[1]!=time2)
         SetearTiempo(time2,1);



   if((PriceSL<Price_SL && PriceTP<Price_TP) || (PriceSL>Price_SL && PriceTP>Price_TP))
     {
      double NewOP=PriceSL+MathAbs(Price_SL-Price_OP)*(IsLarga_Risk?1:-1);
      Modificar_OP(NewOP);
      Modificar_SL(PriceSL);
      Modificar_TP(PriceTP);
     }
   else
     {
      if(PriceSL!=Price_SL)
         Modificar_SL(PriceSL);

      if(PriceTP!=Price_TP)
         Modificar_TP(PriceTP);

      if(PriceOP1!=Price_OP)
         SetearPriceOP(PriceOP1,PriceSL,PriceTP);
      else
         if(PriceOP2!=Price_OP)
            SetearPriceOP(PriceOP2,PriceSL,PriceTP);


      SetearFiltroOP(PriceTP,PriceSL);
     }


  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::Modificar_TP(double Value)
  {
   Price_TP=Value;
   ObjectSetDouble(0,TP_Cuadro,OBJPROP_PRICE,1,Price_TP);
   ObjectSetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,1,Price_TP);
   ObjectSetDouble(0,Text_TP1,OBJPROP_PRICE,0,Price_TP);
   ObjectSetDouble(0,Text_TP2,OBJPROP_PRICE,0,Price_TP);
   ModificarTextoTP();
   ModificarTextoOP();
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::Modificar_SL(double Value)
  {

   Price_SL=Value;
   ObjectSetDouble(0,SL_Cuadro,OBJPROP_PRICE,1,Price_SL);
   ObjectSetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,0,Price_SL);
   ObjectSetDouble(0,Text_SL1,OBJPROP_PRICE,0,Price_SL);
   ObjectSetDouble(0,Text_SL2,OBJPROP_PRICE,0,Price_SL);
   ModificarTextoSL();
   ModificarTextoOP();
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::Modificar_OP(double Value)
  {
   Price_OP=Value;
   ObjectSetDouble(0,SL_Cuadro,OBJPROP_PRICE,0,Price_OP);
   ObjectSetDouble(0,TP_Cuadro,OBJPROP_PRICE,0,Price_OP);
   ObjectSetDouble(0,OP_Line,OBJPROP_PRICE,0,Price_OP);
   ObjectSetDouble(0,OP_Line,OBJPROP_PRICE,1,Price_OP);
   ObjectSetDouble(0,Text_OP1,OBJPROP_PRICE,0,Price_OP);
   ObjectSetDouble(0,Text_OP2,OBJPROP_PRICE,0,Price_OP);
   ModificarTextoTP();
   ModificarTextoSL();
   ModificarTextoOP();
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::ModificarTextoOP()
  {
   string PrecioEntrada=DoubleToString(Price_OP,Digits());
   double PointsTP=int(MathAbs(Price_TP-Price_OP)/Point());
   double PointsSL=int(MathAbs(Price_SL-Price_OP)/Point());
   string ratio=DoubleToString(PointsTP/PointsSL,2);

   string text1=PrecioEntrada+"  ";
   string text2=ratio+"  ";

   ObjectSetString(0,Text_OP1,OBJPROP_TEXT,text1);
   ObjectSetString(0,Text_OP2,OBJPROP_TEXT,text2);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::ModificarTextoTP()
  {
   int Points=int(MathAbs(Price_TP-Price_OP)/Point());
   double Dinero=NormalizeDouble(Lote_Risk*Points*SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE),2);
   double PorcentajeRiesgo=NormalizeDouble(Dinero*100/AccountInfoDouble(ACCOUNT_BALANCE),2);

   string text1="  "+IntegerToString(Points)+" | "+DoubleToString(Dinero,2)+" $";
   string text2="  "+DoubleToString(PorcentajeRiesgo,2)+" %";

   if(Time_Points[1]<Time_Points[0])
     {
      text1=text1+"|"+StringSubstr(text2,1,-1);
      text2=" ";
     }

   ObjectSetString(0,Text_TP1,OBJPROP_TEXT,text1);
   ObjectSetString(0,Text_TP2,OBJPROP_TEXT,text2);
    ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Risk_Object::ModificarTextoSL()
  {
   int Points=int(MathAbs(Price_SL-Price_OP)/Point());
   double Dinero=NormalizeDouble(Lote_Risk*Points*SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE),2);
   double PorcentajeRiesgo=NormalizeDouble(Dinero*100/AccountInfoDouble(ACCOUNT_BALANCE),2);

   string text1="  "+IntegerToString(Points)+" | "+DoubleToString(Dinero,2)+" $";
   string text2="  "+DoubleToString(PorcentajeRiesgo,2)+" %";

   if(Time_Points[1]<Time_Points[0])
     {
      text1=text1+"|"+StringSubstr(text2,1,-1);
      text2=" ";
     }

   ObjectSetString(0,Text_SL1,OBJPROP_TEXT,text1);
   ObjectSetString(0,Text_SL2,OBJPROP_TEXT,text2);
   
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object::Seleccionar(bool Select)
  {
   ObjectSetInteger(0,Contexto_Cuadro,OBJPROP_SELECTED,Select);
   ObjectSetInteger(0,OP_Line,OBJPROP_SELECTED,Select);
   ChartRedraw();
// ObjectSetInteger(0,SL_Cuadro,OBJPROP_SELECTABLE,Select);
// ObjectSetInteger(0,TP_Cuadro,OBJPROP_SELECTED,Select);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object::Delete()
  {
   ObjectDelete(0,Contexto_Cuadro);
   ObjectDelete(0,OP_Line);
   ObjectDelete(0,TP_Cuadro);
   ObjectDelete(0,SL_Cuadro);
   ObjectDelete(0,Text_OP1);
   ObjectDelete(0,Text_SL1);
   ObjectDelete(0,Text_TP1);
   ObjectDelete(0,Text_OP2);
   ObjectDelete(0,Text_SL2);
   ObjectDelete(0,Text_TP2);
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Risk_Object::ExisteObj(string obj,string Identifier)
  {
   if(StringFind(obj,Identifier,0)==-1)
      return false;

   string idSubs=StringSubstr(obj,0,StringLen(obj)-7);
   return idSubs==stringID;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object:: SetearFiltroOP(double PriceTP,double PriceSL)
  {
   if(IsLarga_Risk)
     {
      if(PriceTP<Price_OP)
         Modificar_TP(Price_OP+30*Point());
      if(PriceSL>Price_OP)
         Modificar_SL(Price_OP-30*Point());
     }
   else
     {
      if(PriceTP>Price_OP)
         Modificar_TP(Price_OP-30*Point());
      if(PriceSL<Price_OP)
         Modificar_SL(Price_OP+30*Point());
     }

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object::SetearPriceOP(double Price,double PriceSL,double PriceTP)
  {
   Modificar_OP(Price);
   ObjectSetInteger(0,OP_Line,OBJPROP_TIME,0,Time_Points[0]);
   ObjectSetInteger(0,OP_Line,OBJPROP_TIME,1,Time_Points[1]);

// Price_OP=Price;
//Price_TP=PriceTP;
// Price_SL=PriceSL;
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object:: SetearTiempo(datetime tiempo,int index)
  {
   ObjectSetInteger(0,TP_Cuadro,OBJPROP_TIME,index,tiempo);
   ObjectSetInteger(0,SL_Cuadro,OBJPROP_TIME,index,tiempo);
   ObjectSetInteger(0,OP_Line,OBJPROP_TIME,index,tiempo);

   if(index==1)
     {
      ObjectSetInteger(0,Text_SL1,OBJPROP_TIME,0,tiempo);
      ObjectSetInteger(0,Text_TP1,OBJPROP_TIME,0,tiempo);
      ObjectSetInteger(0,Text_SL2,OBJPROP_TIME,0,tiempo);
      ObjectSetInteger(0,Text_TP2,OBJPROP_TIME,0,tiempo);
     }
   else
     {
      ObjectSetInteger(0,Text_OP1,OBJPROP_TIME,0,tiempo);
      ObjectSetInteger(0,Text_OP2,OBJPROP_TIME,0,tiempo);
     }
   
   ModificarTextoSL();
   ModificarTextoTP();
   
   Time_Points[index]=tiempo;
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Object::GenerarNombres(string stringID_)
  {
   string idType=IsLarga_Risk?"Larga":"Corta";
   TP_Cuadro=stringID_+"TP"+idType;
   SL_Cuadro=stringID_+"SL"+idType;
   Contexto_Cuadro=stringID_+"CO"+idType;
   OP_Line=stringID_+"OP"+idType;

   Text_TP1=stringID_+"TT"+idType;
   Text_TP2=stringID_+"TI"+idType;

   Text_SL1=stringID_+"TS"+idType;
   Text_SL2=stringID_+"TL"+idType;

   Text_OP1=stringID_+"TO"+idType;
   Text_OP2=stringID_+"TD"+idType;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Risk_Object::CrearObjeto(long x,long y,bool IsLarga,string ID,int TP_,int SL_,color colorTP_,color colorSL_,color colorOP_,double Lote_,int SizeTexto,bool Fill_)
  {
   string font="Century Gothic";
   string tiempo=TimeToString(TimeLocal(),TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   stringID=ID+tiempo;
   IsLarga_Risk=IsLarga;
   GenerarNombres(stringID);

   if(ObjectFind(0,TP_Cuadro)!=0)
     {
      datetime time_mouse;
      double price_mouse,price_mouse_TP,price_mouse_SL;
      int subWindow_mouse;
      ChartXYToTimePrice(0,(int)x,(int)y,subWindow_mouse,time_mouse,price_mouse);
      datetime time2=time_mouse+PeriodSeconds(Period())*10;
      price_mouse_TP=price_mouse+(TP_*Point())*(IsLarga?1:-1);
      price_mouse_SL=price_mouse+(SL_*Point())*(IsLarga?-1:1);
      if(
         TrendCreate(0,OP_Line,0,time_mouse,price_mouse,time2,price_mouse,clrNONE,STYLE_SOLID,1,false,true,false,false,true,20) &&
         RectangleCreate(0,Contexto_Cuadro,0,time_mouse,price_mouse_SL,time2,price_mouse_TP,clrNONE,STYLE_SOLID,2,false,false,true,true,10) &&
         RectangleCreate(0,TP_Cuadro,0,time_mouse,price_mouse,time2,price_mouse_TP,colorTP_,STYLE_SOLID,1,Fill_,false,false,true,1) &&
         RectangleCreate(0,SL_Cuadro,0,time_mouse,price_mouse,time2,price_mouse_SL,colorSL_,STYLE_SOLID,1,Fill_,false,false,true,1) &&
         TextCreate(0,IsLarga_Risk?Text_OP1:Text_OP2,0,time_mouse,price_mouse,"H",font,SizeTexto,colorOP_,0,ANCHOR_RIGHT_UPPER,false,false,true,0) &&
         TextCreate(0,IsLarga_Risk?Text_OP2:Text_OP1,0,time_mouse,price_mouse,"H",font,SizeTexto,colorOP_,0,ANCHOR_RIGHT_LOWER,false,false,true,0) &&
         TextCreate(0,IsLarga_Risk?Text_SL2:Text_SL1,0,time2,price_mouse_SL,"H",font,SizeTexto,colorSL_,0,ANCHOR_LEFT_LOWER,false,false,true,0) &&
         TextCreate(0,IsLarga_Risk?Text_SL1:Text_SL2,0,time2,price_mouse_SL,"H",font,SizeTexto,colorSL_,0,ANCHOR_LEFT_UPPER,false,false,true,0) &&
         TextCreate(0,IsLarga_Risk?Text_TP1:Text_TP2,0,time2,price_mouse_TP,"H",font,SizeTexto,colorTP_,0,ANCHOR_LEFT_LOWER,false,false,true,0) &&
         TextCreate(0,IsLarga_Risk?Text_TP2:Text_TP1,0,time2,price_mouse_TP,"H",font,SizeTexto,colorTP_,0,ANCHOR_LEFT_UPPER,false,false,true,0)
      )
        {
         Price_OP=price_mouse;
         Price_SL=price_mouse_SL;
         Price_TP=price_mouse_TP;
         Time_Points[0]=time_mouse;
         Time_Points[1]=time2;
         stringID=ID+tiempo;
         Lote_Risk=Lote_;
         ModificarTextoOP();
         ModificarTextoSL();
         ModificarTextoTP();
         ChartRedraw();
        }
      else
        {
         Alert("No se creo el objeto");
         return false;
        }

      return true;
     }

   Alert("Esperar 1 segundo para crear otro");

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Risk_Object::CrearObjeto(string stringId,bool IsLarga,double Lote_)
  {
   IsLarga_Risk=IsLarga;
   stringID=stringId;
   Lote_Risk=Lote_;
   GenerarNombres(stringId);

   Price_OP=ObjectGetDouble(0,TP_Cuadro,OBJPROP_PRICE,0);
   Price_SL=ObjectGetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,0);
   Price_TP=ObjectGetDouble(0,Contexto_Cuadro,OBJPROP_PRICE,1);
   Time_Points[0]=(datetime)ObjectGetInteger(0,Contexto_Cuadro,OBJPROP_TIME,0);
   Time_Points[1]=(datetime)ObjectGetInteger(0,Contexto_Cuadro,OBJPROP_TIME,1);

   return true;
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

//+------------------------------------------------------------------+
