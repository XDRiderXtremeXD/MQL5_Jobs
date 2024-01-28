//+------------------------------------------------------------------+
//|                                             RatioRiskObjects.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"

#include "RatioRiskObject.mqh"

string ID_Objects="RISK_RATIO_2023";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Risk_Objects
  {
   string            IDENTIFIER;
   Risk_Object            Objects[];
   int               objetoSeleccionIndex;
   string            path;
   int               TP_Point;
   int               SL_Point;
   color               clrTP;
   color               clrSL;
   color               clrOP;
   int                 SizeTexto;
   bool                Fill_Cuadro;
   double            Lote_Risk;
   string            Boton_UP;
   string            Boton_DN;
private:
public:
                     Risk_Objects(void);
                    ~Risk_Objects(void);
   virtual void      Initialice_And_LoadObjetos(int TP_,int SL_,color clrTP_,color clrSL_,color clrOP_,double Lote_,ENUM_BASE_CORNER corner,int SizeTexto_,bool Fill);
   virtual void      SaveObjetos();
   virtual void      CrearObjeto(long x,long y,bool IsLargo);
   virtual void      ChartEven_(const int id,const long lparam,const double dparam,const string sparam);
   virtual void      OnDeinit_(const int reason);
   virtual void      VerificarObjetoBorrado(string objectDelete);
   virtual void      CrearBotones(ENUM_BASE_CORNER Corner);
   virtual void      LogicaAprietaBotones(string sparam,uchar &vecesAprieta,long x_mouse,long y_mouse);
   virtual void      ChangeSeleccion(int index);


protected:
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Risk_Objects::Risk_Objects(void)
  {
   objetoSeleccionIndex=-1;
   path="DataRisk"+"//"+IntegerToString(ChartID());
   IDENTIFIER=ID_Objects;
   Boton_DN=IDENTIFIER+"BOTON DN";
   Boton_UP=IDENTIFIER+"BOTON UP";
   SizeTexto=10;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Risk_Objects::~Risk_Objects(void)
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::OnDeinit_(int const reason)
  {
   if(reason!=REASON_CHARTCHANGE && reason!=REASON_CLOSE)
     {
      ObjectsDeleteAll(0,IDENTIFIER,0,-1);
      FileDelete(path);
      ArrayFree(Objects);
      ObjectDelete(0,Boton_DN);
      ObjectDelete(0,Boton_UP);
     }
   else
     {
      SaveObjetos();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::ChartEven_(const int id,const long lparam,const double dparam,const string sparam)
  {
   static long x_mouse,y_mouse;
   static uchar vecesAprieta=0;

   LogicaAprietaBotones(sparam,vecesAprieta,x_mouse,y_mouse);

   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam==Boton_DN || sparam==Boton_UP)
        {
         if(ObjectGetInteger(0,sparam,OBJPROP_STATE,0))
           {
            ObjectSetInteger(0,(sparam==Boton_DN?Boton_UP:Boton_DN),OBJPROP_STATE,false);
            vecesAprieta=0;
           }
        }

      bool cambioSeleccion=false;
      for(int i=0; i<ArraySize(Objects); i++)
        {
         Objects[i].Seleccionar(false);
         if(Objects[i].ExisteObj(sparam,IDENTIFIER))
           {
            if(objetoSeleccionIndex!=i)
              {
               cambioSeleccion=true;
               Objects[i].Seleccionar(true);
               ChangeSeleccion(i);
              }
           }
        }
      if(!cambioSeleccion)
         ChangeSeleccion(-1);
         
      ChartRedraw();
     }

   if(id==CHARTEVENT_OBJECT_DELETE)
     {
      VerificarObjetoBorrado(sparam);
     }

   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      x_mouse=lparam;
      y_mouse=(long)dparam;

      if(objetoSeleccionIndex!=-1)
         Objects[objetoSeleccionIndex].MoverObjeto();
     }

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects:: LogicaAprietaBotones(string sparam,uchar &vecesAprieta,long x_mouse,long y_mouse)
  {
   static bool aprieta=false;

   if(sparam=="1")
      aprieta=true;
   if(sparam=="0" && aprieta)
     {
      if(vecesAprieta==1)
        {
         if(aprieta && ObjectGetInteger(0,Boton_UP,OBJPROP_STATE,0))
           {
            CrearObjeto(x_mouse,y_mouse,true);
            ObjectSetInteger(0,Boton_UP,OBJPROP_STATE,false);
           }
         if(aprieta && ObjectGetInteger(0,Boton_DN,OBJPROP_STATE,0))
           {
            CrearObjeto(x_mouse,y_mouse,false);
            ObjectSetInteger(0,Boton_DN,OBJPROP_STATE,false);
           }
         aprieta=false;
         vecesAprieta=0;
        }
      else
         vecesAprieta++;

      aprieta=false;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::VerificarObjetoBorrado(string ObjDelete)
  {
   int Size=ArraySize(Objects);

   for(int i=0; i<Size; i++)
     {
      if(Objects[i].ExisteObj(ObjDelete,IDENTIFIER))
        {
         Objects[i].Delete();
         if(objetoSeleccionIndex==i)
            ChangeSeleccion(-1);
         ArrayRemove(Objects,i,1);
         ArrayResize(Objects,Size-1);
         return;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::ChangeSeleccion(int Index)
  {
   objetoSeleccionIndex=Index;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::Initialice_And_LoadObjetos(int TP_,int SL_,color clrTP_,color clrSL_,color clrOP_,double Lote_,ENUM_BASE_CORNER corner,int SizeTexto_,bool Fill_)
  {
   TP_Point=TP_;
   SL_Point=SL_;
   clrTP=clrTP_;
   clrSL=clrSL_;
   clrOP=clrOP_;
   Lote_Risk=Lote_;
   SizeTexto=SizeTexto_;
   Fill_Cuadro=Fill_;

   CrearBotones(corner);

   struct data
     {
      uchar          string_char[50];
      bool           IsLarga;
     };

   data data_char[];

   ResetLastError();
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN|FILE_WRITE);
   if(file_handle!=INVALID_HANDLE)
     {
      FileReadArray(file_handle,data_char);
      int size=ArraySize(data_char);
      ArrayResize(Objects,size);
      for(int i=0; i<size; i++)
        {
         Objects[i].CrearObjeto(CharArrayToString(data_char[i].string_char,0,WHOLE_ARRAY),data_char[i].IsLarga,Lote_Risk);
         Objects[i].Seleccionar(false);
        }
      FileClose(file_handle);
     }
   else
      Print("File open failed, error ",GetLastError());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::CrearBotones(ENUM_BASE_CORNER Corner)
  {
   if(ObjectFind(0,Boton_DN)!=0)
      ButtonCreate(0,Boton_DN,0,(Corner==CORNER_RIGHT_LOWER || Corner==CORNER_RIGHT_UPPER)?60:10,(Corner==CORNER_LEFT_LOWER || Corner==CORNER_RIGHT_LOWER)?28:10,50,18,Corner,"Corta","Arial",10,clrWhite,clrChocolate,clrNONE,false,false,false,true,0);

   if(ObjectFind(0,Boton_UP)!=0)
      ButtonCreate(0,Boton_UP,0,(Corner==CORNER_RIGHT_LOWER || Corner==CORNER_RIGHT_UPPER)?115:65,(Corner==CORNER_LEFT_LOWER || Corner==CORNER_RIGHT_LOWER)?28:10,50,18,Corner,"Larga","Arial",10,clrWhite,clrRoyalBlue,clrNONE,false,false,false,true,0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::SaveObjetos()
  {
   struct data
     {
      char           string_char[50];
      bool           IsLarga;
     };

   data data_char[];

   int size=ArraySize(Objects);
   ArrayResize(data_char,size);
   for(int i=0; i<size; i++)
     {
      StringToCharArray(Objects[i].GetStringID(),data_char[i].string_char);
      data_char[i].IsLarga=Objects[i].GetTipo();
     }

   FileDelete(path);

   int file_handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN);
   if(file_handle!=INVALID_HANDLE)
     {
      //--- escribimos los datos del array al final del archivo
      FileSeek(file_handle,0,SEEK_SET);
      FileWriteArray(file_handle,data_char,0,WHOLE_ARRAY);
      //--- cerramos el archivo
      FileClose(file_handle);
     }
   else
      Print("Failed to open the file, error ",GetLastError());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Risk_Objects::CrearObjeto(long x,long y,bool IsLargo)
  {
   int Size=ArraySize(Objects);
   ArrayResize(Objects,Size+1);
   if(Objects[Size].CrearObjeto(x,y,IsLargo,IDENTIFIER,TP_Point,SL_Point,clrTP,clrSL,clrOP,Lote_Risk,SizeTexto,Fill_Cuadro))
     {
      for(int i=0; i<ArraySize(Objects)-1; i++)
         Objects[i].Seleccionar(false);

      ChangeSeleccion(ArraySize(Objects)-1);
      ChartRedraw();
     }
   else
      ArrayResize(Objects,Size);
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
