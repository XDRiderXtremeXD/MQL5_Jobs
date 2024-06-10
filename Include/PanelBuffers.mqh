//+------------------------------------------------------------------+
//|                                                 PanelBuffers.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

typedef bool (*TFunc)(int &handleIndicator,int columna,int fila,ENUM_TIMEFRAMES tf,string simbolo);


enum candle
  {
   current=0,
   close=1,
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class PanelBuffer
  {
   struct difSize
     {
      int            col_;
      int            fil_;
      int            size_;
     };

   struct Contorno
     {
      int            col_1;
      int            col_2;
      int            fil_1;
      int            fil_2;
     };

private:
   int               columnas;
   int               filas;
   string            subFixCuadro;
   difSize           DifSizeAncho[];
   difSize           DifSizeLargo[];
   Contorno          Contornos[];
   ENUM_BASE_CORNER  corner;
   bool              right;
   bool              low;
   color             bgColor;
   color             textColor;
   string            fontTexto;
   int               sizeTexto;
   color             bordeColor;
   int               ancho;
   int               largo;
   int               x_point;
   int               y_point;
   string            symbols[];
   ENUM_TIMEFRAMES   tfs[];
   int               handleBuffer[][22];
   int               tfBars[][22];
   TFunc             FuncionCuadros;
   candle            candle_signal;
public:
                     PanelBuffer(void);
   //--- create
   virtual bool      CrearPanel(int &handle,bool M1,bool M2,bool M3,bool M4,bool M5,bool M6,bool M10,bool M12,bool M15,bool M20,bool M30,bool H1,bool H2,
                                bool H3,bool H4,bool H6,bool H8,bool H12,bool D1,bool W1,bool MN1,int x_anclaje_,int y_anclaje_,ENUM_BASE_CORNER corner_,string subFixCuadro_
                                ,int EspacioCuadroHorizontal,int EspacioCuadroVertical,int TamanoCuadroHorizontal,int TamanoCuadroVertical,TFunc callBack,candle candle_signal_);
   virtual void       InicializarEstiloPorDefecto(color BgColor_=clrGray,color TextColor_=clrWhite,
         string FontTexto_="Arial",int SizeTexto_=12,color BordeColor_=clrWhite)
     {
      bgColor=BgColor_;
      textColor=TextColor_;
      fontTexto=FontTexto_;
      sizeTexto=SizeTexto_;
      bordeColor=BordeColor_;
     };
   virtual void       AddDiferenteCuadro(int columna,int fila,bool IsAncho,int Size);
   virtual void       AddContorno(int c1,int f1,int c2,int f2);
   virtual int       NumeroFilas() {return filas;};
   virtual int       NumeroColumnas() {return columnas;};
   virtual void       Text(int columna,int fila,string Texto);
   virtual void       ColorBg(int columna,int fila,color Color);
   virtual void       ColorBorder(int columna,int fila,color Color);
   virtual void       ColorTexto(int columna,int fila,color Color);
   virtual void       FontTexto(int columna,int fila,string Font);
   virtual int       Ancho() {return ancho;};
   virtual int       Largo() {return largo;};
   virtual int       X_Point() {return x_point;};
   virtual int       Y_Point() {return y_point;};
   virtual void       Justificar_Texto(int columna,int fila,uint posicion);

   virtual void      OnTimer_();
   virtual void       OnDeinit_()
     {
      ObjectsDeleteAll(0,subFixCuadro,0,OBJ_EDIT);
      ObjectsDeleteAll(0,subFixCuadro,0,OBJ_RECTANGLE_LABEL);
      ArrayFree(DifSizeAncho);
      ArrayFree(DifSizeLargo);
      ArrayResize(Contornos,0);
      ArrayResize(tfs,0);
      ArrayResize(symbols,0);
      ArrayResize(handleBuffer,0);
      ArrayResize(tfBars,0);
     };
   virtual void       OnChartEvent_(const int id,         // identificador de evento
                                    const long& lparam,   // parámetro de evento del tipo long
                                    const double& dparam, // parámetro de evento del tipo double
                                    const string& sparam  // parámetro de evento del tipo string
                                   );
protected:
   virtual int       SetSymbols();
   virtual int       SetTimeFrames(bool M1,bool M2,bool M3,bool M4,bool M5,bool M6,bool M10,bool M12,bool M15,bool M20,bool M30,bool H1,bool H2,bool H3,bool H4,bool H6,bool H8,bool H12,bool D1,bool W1,bool MN1);
   virtual bool      Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho,
                                      bool isRight,bool isLow,int col,int fil);
   virtual void        CrearContornos(int x_anclaje_,int y_anclaje_,ENUM_BASE_CORNER corner_,int EspacioCuadroHorizontal,int EspacioCuadroVertical
                                      ,int TamanoCuadroHorizontal,int TamanoCuadroVertical);
   virtual string       SetTextStart(int columna,int fila);
   virtual void         SetHandles(int &handle);
   virtual void         SetBars();
  };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
PanelBuffer::PanelBuffer(void)
  {
   ArrayResize(DifSizeAncho,0);
   ArrayResize(DifSizeLargo,0);
   ArrayResize(Contornos,0);
   ArrayResize(tfs,0);
   ArrayResize(symbols,0);
   bgColor=clrGray;
   textColor=clrWhite;
   fontTexto="Arial";
   sizeTexto=12;
   bordeColor=clrWhite;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PanelBuffer::OnTimer_()
  {
   for(int c=1; c<columnas; c++)
      for(int f=1; f<filas; f++)
        {
         int barras=iBars(symbols[f-1],tfs[c-1]);
         if(barras==BarsCalculated(handleBuffer[f][c]))
            if(candle_signal==current || tfBars[f][c]!=barras)
               if(FuncionCuadros(handleBuffer[f][c],c,f,tfs[c-1],symbols[f-1]))
                  tfBars[f][c]=barras;
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PanelBuffer:: CrearPanel(int &handle,bool M1,bool M2,bool M3,bool M4,bool M5,bool M6,bool M10,bool M12,bool M15,bool M20,bool M30,bool H1,bool H2,
                              bool H3,bool H4,bool H6,bool H8,bool H12,bool D1,bool W1,bool MN1,int x_anclaje_,int y_anclaje_,ENUM_BASE_CORNER corner_,string subFixCuadro_
                              ,int EspacioCuadroHorizontal,int EspacioCuadroVertical,int TamanoCuadroHorizontal,int TamanoCuadroVertical,TFunc callBack,candle candle_signal_)
  {
   columnas=SetTimeFrames(M1, M2, M3, M4, M5, M6, M10, M12, M15, M20, M30, H1, H2, H3, H4, H6, H8, H12, D1, W1, MN1)+1;
   filas=SetSymbols()+1;
   SetHandles(handle);
   SetBars();
   FuncionCuadros=callBack;
   candle_signal=candle_signal_;

   subFixCuadro=subFixCuadro_;
   corner=corner_;
   ancho=TamanoCuadroHorizontal*columnas+(columnas-1)*(EspacioCuadroHorizontal-1);
   largo=TamanoCuadroVertical*filas+(filas-1)*(EspacioCuadroVertical-1);
   x_point=x_anclaje_;
   y_point=y_anclaje_;

   int sizeLargoDif=ArraySize(DifSizeLargo);
   int sizeAnchoDif=ArraySize(DifSizeAncho);

   right=(corner_==CORNER_RIGHT_LOWER || corner_==CORNER_RIGHT_UPPER);
   low=(corner_==CORNER_RIGHT_LOWER || corner_==CORNER_LEFT_LOWER);

   for(int c=0; c<columnas; c++)
     {
      for(int f=0; f<filas; f++)
        {
         int point_c=right?(MathAbs(c-(columnas-1))):c;
         int point_f=low?(MathAbs(f-(filas-1))):f;

         string Nombre=subFixCuadro_+" "+(string) point_c+" "+(string)point_f;
         int Multiplicador_Ancho=1,Multiplicador_Largo=1;

         bool continuar=false;
         for(int j=0; j<sizeAnchoDif; j++)
            if(!Diferente_Tamano(c,f,DifSizeAncho[j].col_,DifSizeAncho[j].fil_,Multiplicador_Ancho,DifSizeAncho[j].size_,true,right,low,columnas,filas))
              {
               continuar=true;
               break;
              }
         if(continuar)
            continue;
         for(int j=0; j<sizeLargoDif; j++)
            if(!Diferente_Tamano(c,f,DifSizeLargo[j].col_,DifSizeLargo[j].fil_,Multiplicador_Largo,DifSizeLargo[j].size_,false,right,low,columnas,filas))
              {
               continuar=true;
               break;
              }
         if(continuar)
            continue;
         //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
         //  continue;
         int X=x_anclaje_+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c+(right?TamanoCuadroHorizontal:0)-(c*(EspacioCuadroHorizontal+1));
         int Y=y_anclaje_+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f+(low?TamanoCuadroVertical:0)-(f*(EspacioCuadroVertical+1));
         int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*(EspacioCuadroHorizontal-1);//TamanoCuadroHorizontal
         int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*(EspacioCuadroVertical-1);// TamanoCuadroVertical
         string Texto=SetTextStart(c,f);

         if(ObjectFind(0,Nombre)!=0)
           {
            EditCreate(0,Nombre,0,X,Y,Ancho_,Largo_,Texto,fontTexto,12,ALIGN_CENTER,true,corner_,textColor,bgColor,bordeColor,false,false,true,0);
           }
         else
           {
            ObjectSetInteger(0,Nombre,OBJPROP_XDISTANCE,X);
            ObjectSetInteger(0,Nombre,OBJPROP_YDISTANCE,Y);
           }
        }
     }

   CrearContornos(x_anclaje_,y_anclaje_,corner_,EspacioCuadroHorizontal,EspacioCuadroVertical
                  ,TamanoCuadroHorizontal,TamanoCuadroVertical);

   ArrayFree(DifSizeAncho);
   ArrayFree(DifSizeLargo);
   ArrayFree(Contornos);
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PanelBuffer::SetHandles(int &handle)
  {
   ArrayResize(handleBuffer,filas);
   MqlParam parameters[];
   ArrayResize(parameters,1);
   ENUM_INDICATOR indicator_type;
   int params=IndicatorParameters(handle,indicator_type,parameters);

   if(indicator_type==IND_CUSTOM)
     {
      string nombre=parameters[0].string_value;
      /* parameters[0].string_value=StringSubstr(parameters[0].string_value,11,-1);*/
      int indice=StringFind(nombre,"::",0);
      parameters[0].string_value=StringSubstr(parameters[0].string_value,indice,-1);
      Print(parameters[0].string_value);
     }


   for(int c=1; c<columnas; c++)
      for(int f=1; f<filas; f++)
        {
         handleBuffer[f][c]=IndicatorCreate(symbols[f-1],tfs[c-1],indicator_type,ArraySize(parameters),parameters);
        }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PanelBuffer::SetBars()
  {
   ArrayResize(tfBars,filas);
   for(int c=1; c<columnas; c++)
      for(int f=1; f<filas; f++)
         tfBars[f][c]=0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int PanelBuffer:: SetTimeFrames(bool M1,bool M2,bool M3,bool M4,bool M5,bool M6,bool M10,bool M12,bool M15,bool M20,bool M30,bool H1,bool H2,bool H3,bool H4,bool H6,bool H8,bool H12,bool D1,bool W1,bool MN1)
  {
   ENUM_TIMEFRAMES periods[] = {PERIOD_M1, PERIOD_M2, PERIOD_M3, PERIOD_M4, PERIOD_M5, PERIOD_M6, PERIOD_M10, PERIOD_M12, PERIOD_M15, PERIOD_M20, PERIOD_M30, PERIOD_H1, PERIOD_H2, PERIOD_H3, PERIOD_H4, PERIOD_H6, PERIOD_H8, PERIOD_H12, PERIOD_D1, PERIOD_W1, PERIOD_MN1};
   int boolTFS[] = {M1, M2, M3, M4, M5, M6, M10, M12, M15, M20, M30, H1, H2, H3, H4, H6, H8, H12, D1, W1, MN1};

   int size=ArraySize(tfs);
   for(int i = 0; i < ArraySize(periods); i++)
     {
      if(boolTFS[i])
        {
         size = ArraySize(tfs);
         ArrayResize(tfs, size + 1);
         tfs[size] = periods[i];
        }
     }
   return ArraySize(tfs);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int PanelBuffer::SetSymbols()
  {
   int simbolosTotal=SymbolsTotal(true);
   for(int i=0; i<simbolosTotal; i++)
     {
      int size = ArraySize(symbols);
      ArrayResize(symbols, size + 1);
      symbols[size] = SymbolName(i,true);
     }
   return simbolosTotal;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PanelBuffer:: Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho,
                                    bool isRight,bool isLow,int col,int fil)
  {

   Point_c=isRight?MathAbs(Point_c-(col-1)):Point_c;
   Point_f=isLow?MathAbs(Point_f-(fil-1)):Point_f;

   if(EsAncho)
     {
      if(f==Point_f)
        {
         if(isRight?(c<Point_c && c>Point_c-MultiplicadorCuadro):(c>Point_c && c<Point_c+MultiplicadorCuadro))
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
        }
     }
   else
     {
      if(c==Point_c)
        {
         if(isLow?(f<Point_f && f>Point_f-MultiplicadorCuadro):(f>Point_f && f<Point_f+MultiplicadorCuadro))
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
void   PanelBuffer::CrearContornos(int x_anclaje_,int y_anclaje_,ENUM_BASE_CORNER corner_,int EspacioCuadroHorizontal,int EspacioCuadroVertical
                                   ,int TamanoCuadroHorizontal,int TamanoCuadroVertical)
  {
   /* for(int i=0; i<ArraySize(Contornos); i++)
      {
       string Nombre1=subFixCuadro+" "+(string) Contornos[i].col_1+" "+(string)Contornos[i].fil_1;
       string Nombre2=subFixCuadro+" "+(string) Contornos[i].col_2+" "+(string)Contornos[i].fil_2;

       int Y_Distance1=ObjectGetInteger(0,Nombre1,OBJPROP_YDISTANCE,0);
       int X_Distance1=ObjectGetInteger(0,Nombre1,OBJPROP_XDISTANCE,0);

       int Y_Distance2=ObjectGetInteger(0,Nombre2,OBJPROP_YDISTANCE,0);
       int X_Distance2=ObjectGetInteger(0,Nombre2,OBJPROP_XDISTANCE,0);

       int X_Size=ObjectGetInteger(0,Nombre2,OBJPROP_XSIZE,0);
       int Y_Size=ObjectGetInteger(0,Nombre2,OBJPROP_YSIZE,0);

       string ContornoName=subFixCuadro+" Contorno "+IntegerToString(i);
       Print(ContornoName);

       RectLabelCreate(0,ContornoName+"UP",0,X_Distance1,Y_Distance1,MathAbs(X_Distance1-X_Distance2)+X_Size,0,clrNONE,BORDER_FLAT,corner_,
                       clrLime,STYLE_SOLID,2,false,false,true,0);

      RectLabelCreate(0,ContornoName+"DN",0,X_Distance1,Y_Distance2-Y_Size,MathAbs(X_Distance1-X_Distance2)+X_Size,0,clrNONE,BORDER_FLAT,corner_,
                       clrLime,STYLE_SOLID,2,false,false,true,0);

      RectLabelCreate(0,ContornoName+"LEFT",0,X_Distance1,Y_Distance1,0,MathAbs(Y_Distance1-Y_Distance2)+Y_Size,clrNONE,BORDER_FLAT,corner_,
                     clrLime,STYLE_SOLID,2,false,false,true,0);

      RectLabelCreate(0,ContornoName+"RIGHT",0,X_Distance1+MathAbs(X_Distance1-X_Distance2)+X_Size,Y_Distance1,0,MathAbs(Y_Distance1-Y_Distance2)+Y_Size,clrNONE,BORDER_FLAT,corner_,
                     clrLime,STYLE_SOLID,2,false,false,true,0);
       ChartRedraw();
      }*/
//EN DESARROLLO
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string PanelBuffer::SetTextStart(int columna,int fila)
  {
   if(columna==0 && fila>0)
      return symbols[fila-1];

   if(columna>0 && fila==0)
      return (StringSubstr(EnumToString(ENUM_TIMEFRAMES(tfs[columna-1])),7,-1));

   if(columna!=0 && fila!=0)
      return "loading....";
   else
      return "SYM/TF";

   return " ";
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::Text(int columna,int fila,string Texto)
  {
   int point_c=columna;
   int point_f=fila;


   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;
   ObjectSetString(0,Nombre,OBJPROP_TEXT,Texto);
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::Justificar_Texto(int columna,int fila,uint posicion)
  {
   int point_c=columna;
   int point_f=fila;

   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;

   if(posicion==0)
      ObjectSetInteger(0,Nombre,OBJPROP_ALIGN,ALIGN_LEFT);
   else
      if(posicion==2)
         ObjectSetInteger(0,Nombre,OBJPROP_ALIGN,ALIGN_RIGHT);
      else
         ObjectSetInteger(0,Nombre,OBJPROP_ALIGN,ALIGN_CENTER);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::ColorBg(int columna,int fila,color Color)
  {
   int point_c=columna;
   int point_f=fila;

   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;
   ObjectSetInteger(0,Nombre,OBJPROP_BGCOLOR,Color);
   ChartRedraw();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::ColorBorder(int columna,int fila,color Color)
  {
   int point_c=columna;
   int point_f=fila;

   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;
   ObjectSetInteger(0,Nombre,OBJPROP_BORDER_COLOR,Color);
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::ColorTexto(int columna,int fila,color Color)
  {
   int point_c=columna;
   int point_f=fila;

   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;
   ObjectSetInteger(0,Nombre,OBJPROP_COLOR,Color);
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::FontTexto(int columna,int fila,string Font)
  {
   int point_c=columna;
   int point_f=fila;

   string Nombre=subFixCuadro+" "+(string) point_c+" "+(string)point_f;
   ObjectSetString(0,Nombre,OBJPROP_FONT,Font);
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::AddDiferenteCuadro(int columna,int fila,bool IsAncho,int Size)
  {
   if(IsAncho)
     {
      int size=ArraySize(DifSizeAncho);
      ArrayResize(DifSizeAncho,size+1);
      DifSizeAncho[size].size_=Size;
      DifSizeAncho[size].col_=columna;
      DifSizeAncho[size].fil_=fila;
     }
   else
     {
      int size=ArraySize(DifSizeLargo);
      ArrayResize(DifSizeLargo,Size+1);
      DifSizeLargo[size].size_=Size;
      DifSizeLargo[size].col_=columna;
      DifSizeLargo[size].fil_=fila;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   PanelBuffer::AddContorno(int c1,int f1,int c2,int f2)
  {
   int size=ArraySize(Contornos);
   ArrayResize(Contornos,size+1);
   Contornos[size].col_1=c1;
   Contornos[size].col_2=c2;
   Contornos[size].fil_1=f1;
   Contornos[size].fil_2=f2;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,               // chart's ID
                const string           name="Edit",              // object name
                const int              sub_window=0,             // subwindow index
                const int              x=0,                      // X coordinate
                const int              y=0,                      // Y coordinate
                const int              width=50,                 // width
                const int              height=18,                // height
                const string           text="Text",              // text
                const string           font="Arial",             // font
                const int              font_size=10,             // font size
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // alignment type
                const bool             read_only=false,          // ability to edit
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                const color            clr=clrBlack,             // text color
                const color            back_clr=clrWhite,        // background color
                const color            border_clr=clrNONE,       // border color
                const bool             back=false,               // in the background
                const bool             selection=false,          // highlight to move
                const bool             hidden=true,              // hidden in the object list
                const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create edit field
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create \"Edit\" object! Error code = ",GetLastError());
      return(false);
     }
//--- set object coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set object size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the type of text alignment in the object
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- enable (true) or cancel (false) read-only mode
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- set the chart's corner, relative to which object coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
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
void PanelBuffer::OnChartEvent_(const int id,         // identificador de evento
                                const long& lparam,   // parámetro de evento del tipo long
                                const double& dparam, // parámetro de evento del tipo double
                                const string& sparam  // parámetro de evento del tipo string
                               )
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      /*if(StringFind(sparam,subFixCuadro,0)!=-1)
        {
         string cordenadas=StringSubstr(sparam,StringLen(subFixCuadro)+1,-1);
         string result[];
         StringSplit(cordenadas,' ',result);
         if(ArraySize(result)==2)
           {
            int fila=(int)StringToInteger(result[1])-1;
            int columna=(int)StringToInteger(result[0])-1;

            if(fila>=0 && columna>=0)
              {
               ulong chartID=ChartOpen(symbols[fila],tfs[columna]);
               Sleep(1000);
               ChartIndicatorAdd(chartID,0,handleBuffer[fila+1][columna+1]);
               ChartRedraw(chartID);
              }
           }
        }*/

      if(StringFind(sparam,subFixCuadro,0)!=-1)
        {
         string cordenadas=StringSubstr(sparam,StringLen(subFixCuadro)+1,-1);
         string result[];
         StringSplit(cordenadas,' ',result);

         if(ArraySize(result)==2)
           {
            int fila=(int)StringToInteger(result[1])-1;
            int columna=(int)StringToInteger(result[0])-1;

            if(fila>=0 && columna==-1)
              {

               long prevChartX=ChartFirst();
               int i=0,limit=100;

               if(prevChartX<0)
                  return;

               while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
                 {
                  if(ChartGetString(prevChartX,CHART_COMMENT)!="NO CAMBIO")
                    {
                     ENUM_TIMEFRAMES Periodo=ChartPeriod(prevChartX);
                     ChartSetSymbolPeriod(prevChartX,symbols[fila],Periodo);
                    }

                  prevChartX=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
                  if(prevChartX<0)
                     break;          // hemos llegado al final de la lista de gráficos
                  i++;// no olvidemos aumentar el contador
                 }
              }
           }
        }

     }
  }
//+------------------------------------------------------------------+
