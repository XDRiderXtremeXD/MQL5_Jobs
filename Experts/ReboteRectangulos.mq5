//+------------------------------------------------------------------+
//|                                            ReboteRectangulos.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;


enum enum_Activacion
  {
   puntos,
   porcentaje,
  };

struct rectangunlosStruct
  {
   datetime          timeStart;
   datetime          timeEnd;
   double            high;
   double            low;
   ushort            nombre[60];
   double            ultimoPrecio;
   bool              esperar;
   bool              activado;
   int               puntosTotal;
   bool              isBuy;
  };

enum tipo_SL
  {
   puntos_sl,//puntos
   extremo_rectangulo,
  };

string nameSelected="";

string BotonCompra="boton compra 2023";
string BotonVenta="boton venta 2023";


input string S4="========== Configuracion Trade ==========";//==========================================================================================
input double Lote=0.01;
input tipo_SL tipo_StopLoss=puntos_sl;
input int SL=100;//STOP LOSS puntos(0 disable)
input int TP=100;//TAKE PROFIT puntos (0 disable)
input string comentario="Expert";
input int magicNumber=2222222;
input string S3="========== Configuracion Activacion ==========";//==========================================================================================
input color clrActivado=clrBlue;
input enum_Activacion Variable_Activacion=puntos;
input double Variable=100;
input bool Retroceso_con_variable=true;
input enum_Activacion Variable_Retroceso=puntos;
input bool EntrarEnEntrada=true;
input double VariableRetroceso=100;//Variable Retroceso (si es puntos o porcentaje)
input string S5="========== Configuracion FOLDER ==========";//==========================================================================================
input string InpFileName="dataRectangulos.bin";
input string InpDirectoryName="RectangulosFolder";


string path;

rectangunlosStruct sistemaRectangulos[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   path=InpDirectoryName+"//"+InpFileName;
   nameSelected="";
   ButtonCreate(0,BotonCompra,0,10,10,70,18,CORNER_LEFT_UPPER,"Compra","Arial",12,clrWhite,clrGreen,clrWhite,false,false,false,true,0);
   ButtonCreate(0,BotonVenta,0,90,10,70,18,CORNER_LEFT_UPPER,"Venta","Arial",12,clrWhite,clrRed,clrWhite,false,false,false,true,0);
   ArrayResize(sistemaRectangulos,0);
   LoadData();
   ChartSetInteger(0,CHART_EVENT_OBJECT_DELETE,true);
   ChartRedraw();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,BotonCompra);
   ObjectDelete(0,BotonVenta);
   WriteData(reason);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   datetime tiempoActual=TimeCurrent();
   int size=ArraySize(sistemaRectangulos);
   for(int i=0; i<size; i++)
     {
      string nombre=GetNombre(sistemaRectangulos[i].nombre);
      if(sistemaRectangulos[i].activado==false)
         if(tiempoActual>=sistemaRectangulos[i].timeStart && tiempoActual<=sistemaRectangulos[i].timeEnd)
           {
            if(PrecondicionActivacion(sistemaRectangulos[i].puntosTotal,sistemaRectangulos[i].high,sistemaRectangulos[i].low,sistemaRectangulos[i].isBuy,sistemaRectangulos[i].ultimoPrecio))
              {
               sistemaRectangulos[i].esperar=true;
               ObjectSetString(0,nombre,OBJPROP_TEXT,sistemaRectangulos[i].isBuy?"COMPRAS ESPERAR":"VENTAS ESPERAR");
              }
            bool isBuy=true;
            if(sistemaRectangulos[i].esperar)
               if(SistemaEsperar(i,isBuy))
                 {
                  Operar(isBuy,SL,TP,sistemaRectangulos[i].high,sistemaRectangulos[i].low);
                  sistemaRectangulos[i].activado=true;

                  ObjectSetInteger(0,nombre,OBJPROP_BGCOLOR,clrActivado);
                  ObjectSetInteger(0,nombre,OBJPROP_COLOR,clrActivado);
                  ObjectSetString(0,nombre,OBJPROP_TEXT,sistemaRectangulos[i].isBuy?"COMPRAS ACTIVADO":"VENTAS ACTIVADO");
                  ChartRedraw();
                 }
           }
     }

   size=ArraySize(sistemaRectangulos);
   for(int i=0; i<size; i++)
     {
      string nombre=GetNombre(sistemaRectangulos[i].nombre);
      double PrecioActual=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      if((sistemaRectangulos[i].isBuy && sistemaRectangulos[i].low>=PrecioActual) || (!sistemaRectangulos[i].isBuy && sistemaRectangulos[i].high<=PrecioActual))
        {
         ArrayRemove(sistemaRectangulos,i,1);
         ArrayResize(sistemaRectangulos,size-1);
         ObjectDelete(0,nombre);
         ChartRedraw();
         break;
        }
     }

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


   if(id==2)
     {
      if(ObjectGetInteger(0,sparam,OBJPROP_TYPE,0)==OBJ_RECTANGLE)
        {
         nameSelected=sparam;
         modificoRectangulo(sparam);
        }
     }

   if(id==1)
     {
      int rectangulos=ObjectsTotal(0,0,OBJ_RECTANGLE);
      for(int i=0; i<rectangulos; i++)
        {
         string nameRectangle=ObjectName(0,i,0,OBJ_RECTANGLE);
         if(nameRectangle!=sparam)
            ObjectSetInteger(0,nameRectangle,OBJPROP_SELECTED,false);
         else
           {
            nameSelected="";
            if(ObjectGetInteger(0,nameRectangle,OBJPROP_SELECTED,0)==false)
              {
               ObjectSetInteger(0,nameRectangle,OBJPROP_SELECTED,true);
               nameSelected=nameRectangle;
               ChartRedraw();
              }
           }
        }
     }

//--- comprobamos el evento de apretar el botón del ratón
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      string texto=ObjectGetString(0,nameSelected,OBJPROP_TEXT,0);
      //--- si hacemos clic en el objeto con el nombre buttonID
      if(texto=="")
        {
         if(clickedChartObject==BotonCompra)
           {
            if(ObjectFind(0,nameSelected)==0)
              {
               ObjectSetString(0,nameSelected,OBJPROP_TEXT,"COMPRAS");
               AgregarArray(nameSelected,true);
              }
            ObjectSetInteger(0,BotonCompra,OBJPROP_STATE,false);
           }

         if(clickedChartObject==BotonVenta)
           {
            if(ObjectFind(0,nameSelected)==0)
              {
               ObjectSetString(0,nameSelected,OBJPROP_TEXT,"VENTAS");
               AgregarArray(nameSelected,false);
              }
            ObjectSetInteger(0,BotonVenta,OBJPROP_STATE,false);
           }
        }
      ChartRedraw();// volvemos a dibujar por vía forzada todos los objetos del gráfico
     }

   if(id==6)
     {
      int size=ArraySize(sistemaRectangulos);
      for(int i=0; i<size; i++)
        {
         string nombre=GetNombre(sistemaRectangulos[i].nombre);
         if(nombre==sparam)
           {
            ArrayRemove(sistemaRectangulos,i,1);
            ArrayResize(sistemaRectangulos,size-1);
            break;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AgregarArray(string nameRectangle,bool isBuy)
  {

   int size=ArraySize(sistemaRectangulos);
      
   for(int i=0; i<size; i++)
     {
      string nombre=GetNombre(sistemaRectangulos[i].nombre);
      if(nombre==nameRectangle)
         return;
     }


   ArrayResize(sistemaRectangulos,size+1);

   double high=ObjectGetDouble(0,nameRectangle,OBJPROP_PRICE,0);
   double low=ObjectGetDouble(0,nameRectangle,OBJPROP_PRICE,1);

   double highTrue=high>low?high:low;
   double lowTrue=low<high?low:high;
   int PuntosTotal=int((highTrue-lowTrue)/Point());


   datetime tiempoStart=(datetime)ObjectGetInteger(0,nameRectangle,OBJPROP_TIME,0);
   datetime tiempoEnd=(datetime)ObjectGetInteger(0,nameRectangle,OBJPROP_TIME,1);
   datetime tiempoStartTrue=tiempoStart<tiempoEnd?tiempoStart:tiempoEnd;
   datetime tiempoEndTrue=tiempoStart<tiempoEnd?tiempoEnd:tiempoStart;


   sistemaRectangulos[size].timeStart=tiempoStartTrue;
   sistemaRectangulos[size].timeEnd=tiempoEndTrue;
   sistemaRectangulos[size].activado=false;
   sistemaRectangulos[size].esperar=false;


   for(int i=0; i<60; i++)
     {
      sistemaRectangulos[size].nombre[i]= StringGetCharacter("*",0);
      if(i<StringLen(nameRectangle))
        {
         sistemaRectangulos[size].nombre[i]= StringGetCharacter(nameRectangle,i);
        }
     }

   sistemaRectangulos[size].high=highTrue;
   sistemaRectangulos[size].low=lowTrue;
   sistemaRectangulos[size].ultimoPrecio=-1;
   sistemaRectangulos[size].puntosTotal=PuntosTotal;
   sistemaRectangulos[size].isBuy=isBuy;

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetNombre(ushort &Array[])
  {
   string nombre="";
   ushort caracterVacio=StringGetCharacter("*",0);
   for(int i=0; i<60; i++)
     {
      if(Array[i]!=caracterVacio)
         nombre+=ShortToString(Array[i]);
     }
   return nombre;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SistemaEsperar(int i,bool &isBuy)
  {
   double PrecioActual=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(sistemaRectangulos[i].isBuy)
     {
      isBuy=true;
      if(sistemaRectangulos[i].ultimoPrecio!=-1 && PrecioActual>sistemaRectangulos[i].ultimoPrecio)
        {
         if(Retroceso_con_variable)
           {
            if(Variable_Retroceso==puntos)
              {

               if(((PrecioActual-sistemaRectangulos[i].ultimoPrecio)/Point())>=VariableRetroceso)
                  return true;
              }
            else
               if(Variable_Retroceso==porcentaje)
                 {
                  if((((PrecioActual-sistemaRectangulos[i].ultimoPrecio)/Point())*100.0/sistemaRectangulos[i].puntosTotal)  >VariableRetroceso)
                     return true;
                 }
           }

         if(EntrarEnEntrada)
           {
            if(PrecioActual>=sistemaRectangulos[i].high)
               return true;
           }
        }
     }
   else
     {
      isBuy=false;
      if(sistemaRectangulos[i].ultimoPrecio!=-1 && PrecioActual<sistemaRectangulos[i].ultimoPrecio)
        {
         if(Retroceso_con_variable)
           {
            if(Variable_Retroceso==puntos)
              {
               if(((MathAbs(PrecioActual-sistemaRectangulos[i].ultimoPrecio))/Point())>=VariableRetroceso)
                  return true;
              }
            else
               if(Variable_Retroceso==porcentaje)
                 {
                  if(((MathAbs(sistemaRectangulos[i].ultimoPrecio-PrecioActual)/Point())*100.0/sistemaRectangulos[i].puntosTotal)>VariableRetroceso)
                     return true;
                 }
           }
           
         if(EntrarEnEntrada)
           {
            if(PrecioActual<=sistemaRectangulos[i].low)
               return true;
           }
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void modificoRectangulo(string nombreRectangulo)
  {

   int size=ArraySize(sistemaRectangulos);
   for(int i=0; i<size; i++)
     {
      string nombre=GetNombre(sistemaRectangulos[i].nombre);
      if(nombre==nombreRectangulo)
        {
         double high=ObjectGetDouble(0,nombreRectangulo,OBJPROP_PRICE,0);
         double low=ObjectGetDouble(0,nombreRectangulo,OBJPROP_PRICE,1);

         double highTrue=high>low?high:low;
         double lowTrue=low<high?low:high;
         int PuntosTotal=int((highTrue-lowTrue)/Point());


         datetime tiempoStart=(datetime)ObjectGetInteger(0,nombreRectangulo,OBJPROP_TIME,0);
         datetime tiempoEnd=(datetime)ObjectGetInteger(0,nombreRectangulo,OBJPROP_TIME,1);
         datetime tiempoStartTrue=tiempoStart<tiempoEnd?tiempoStart:tiempoEnd;
         datetime tiempoEndTrue=tiempoStart<tiempoEnd?tiempoEnd:tiempoStart;

         sistemaRectangulos[i].timeStart=tiempoStartTrue;
         sistemaRectangulos[i].timeEnd=tiempoEndTrue;
         sistemaRectangulos[i].activado=false;
         sistemaRectangulos[i].esperar=false;
         sistemaRectangulos[i].high=highTrue;
         sistemaRectangulos[i].low=lowTrue;
         sistemaRectangulos[i].ultimoPrecio=-1;
         sistemaRectangulos[i].puntosTotal=PuntosTotal;
         return;

        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PrecondicionActivacion(int puntos_,double high,double low,bool compras,double &ultimoValor)
  {
   double PrecioActual=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   if(Variable_Activacion==puntos)
     {
      if(compras)
        {
         if(PrecioActual<high && ((high-PrecioActual)/Point())>=Variable)
           {
            if(ultimoValor==-1 || ultimoValor>PrecioActual)
               ultimoValor=PrecioActual;
            return true;
           }
        }
      else
        {
         if(PrecioActual>low && ((PrecioActual-low)/Point())>=Variable)
           {
            if(ultimoValor==-1 || ultimoValor<PrecioActual)
               ultimoValor=PrecioActual;
            return true;
           }
        }
     }
   else
     {
      if(compras)
        {
         if(PrecioActual<high && (((high-PrecioActual)/Point())*100.0/puntos_)>Variable)
           {
            if(ultimoValor==-1 || ultimoValor>PrecioActual)
               ultimoValor=PrecioActual;
            return true;
           }
        }
      else
        {
         if(PrecioActual>low && (((PrecioActual-low)/Point())*100.0/puntos_)>Variable)
           {
            if(ultimoValor==-1 || ultimoValor<PrecioActual)
               ultimoValor=PrecioActual;
            return true;
           }
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
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
void WriteData(const int reason)
  {
   FileDelete(path);
   if(reason==REASON_CHARTCHANGE || reason==REASON_CHARTCLOSE)
     {
      ResetLastError();
      int handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN);
      if(handle!=INVALID_HANDLE)
        {
         //--- escribimos los datos del array al final del archivo
         FileSeek(handle,0,SEEK_END);
         FileWriteArray(handle,sistemaRectangulos,0,WHOLE_ARRAY);
         //--- cerramos el archivo
         FileClose(handle);
        }
     }
   else
     {
      int size=ObjectsTotal(0,0,OBJ_RECTANGLE);
      for(int i=size-1; i>=0; i--)
        {
         string nombre=ObjectName(0,i,0,OBJ_RECTANGLE);
         ObjectSetString(0,nombre,OBJPROP_TEXT,"");
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+
void LoadData()
  {
   ResetLastError();
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN);
   if(file_handle!=INVALID_HANDLE)
     {
      //--- leemos todos los datos desde el archivo al array
      FileReadArray(file_handle,sistemaRectangulos);

      FileClose(file_handle);
     }
  }
//+------------------------------------------------------------------+
void Operar(bool IsBuy,int SL_,int TP_,double high,double low)
  {
   if(!IsBuy)
     {
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

      double StopLoss=(SL_==0)?0:((Bid+SL_*Point()));
      double TakeProfit=(TP_==0)?0:((Bid-TP_*Point()));

      if(tipo_StopLoss==extremo_rectangulo)
         StopLoss=NormalizeDouble(high,Digits());

      if(!trade.Sell(Lote,Symbol(),Bid,StopLoss,TakeProfit,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double StopLoss=(SL_==0)?0:((Ask-SL_*Point()));
      double TakeProfit=(TP_==0)?0:((Ask+TP_*Point()));

      if(tipo_StopLoss==extremo_rectangulo)
         StopLoss=NormalizeDouble(low,Digits());

      if(!trade.Buy(Lote,Symbol(),Ask,StopLoss,TakeProfit,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
