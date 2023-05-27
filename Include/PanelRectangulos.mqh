//+------------------------------------------------------------------+
//|                                             PanelRectangulos.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property strict
//+------------------------------------------------------------------+
//|                                               ControlsDialog.mqh |
//|                   Copyright 2009-2017, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\DatePicker.mqh>
#include <Controls\ListView.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\SpinEdit.mqh>
#include <Controls\RadioGroup.mqh>
#include <Controls\CheckGroup.mqh>
#include <Controls\Label.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
//--- indents and gaps
#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
#define INDENT_RIGHT                        (11)      // indent from right (with allowance for border width)
#define INDENT_BOTTOM                       (11)      // indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      (5)       // gap by X coordinate
#define CONTROLS_GAP_Y                      (5)       // gap by Y coordinate
//--- for buttons
#define BUTTON_WIDTH                        (100)     // size by X coordinate
#define BUTTON_HEIGHT                       (20)      // size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         (30)      // size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         (150)     // size by X coordinate
#define LIST_HEIGHT                         (179)     // size by Y coordinate
#define RADIO_HEIGHT                        (56)      // size by Y coordinate
#define CHECK_HEIGHT                        (93)      // size by Y coordinate
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CControlsDialogPanel : public CAppDialog
  {
private:
   struct ParametrosHandlesGlobal
     {
      ENUM_INDICATOR    Tipo_Indicador;
      MqlParam          parameters_Handle[];
     };

   string ArraySymbolos[];
   int Numero_De_Indicadores;
   ParametrosHandlesGlobal  ParametrosHandle[15];
public:
                     CControlsDialogPanel(void);
                    ~CControlsDialogPanel(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   void              CrearCuadros();

protected:
   //--- create dependent controls
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CControlsDialogPanel::CControlsDialogPanel(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CControlsDialogPanel::~CControlsDialogPanel(void)
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialogPanel::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false);
//--- succeed
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialogPanel::CrearCuadros()
  {
   int Filas=ArraySize(Array_Symbolos)*TimeFramesFilas+2;
   ArrayResize(NombresCuadros,Filas);
   ArrayResize(NombresCuadrosTextos,Filas);

   for(int c=0; c<ArraySize(ParametrosHandle); c++)
     {
      for(int f=0; f<Filas; f++)
        {
         NombresCuadros[f][c]="Cuadro Panel 001 c="+(string) c+" f="+(string)f;
         NombresCuadrosTextos[f][c]="Cuadro Panel 001 c="+(string) c+" f="+(string)f+" Texto";
         ///TITULO
         if(f==0)
           {
            if(c==0)
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               int Disminucion_per_Ancho_Line_X=0;
               int Disminucion_per_Ancho_Line_Y=0;
               if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,ArraySize(ParametrosHandle),true,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
                  continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Disminucion_per_Ancho_Line_X;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical-Disminucion_per_Ancho_Line_Y;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               X2=X+Ancho_;
               X=Ancho_/2;
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);
              }
           }
         // COLUMNA SIMBOLOS
         else
            if(c==0)
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal_Simbolos;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro+int((TamanoCuadroHorizontal_Simbolos*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2);
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);
              }
            // CUADROS NORMALES
            else
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               //if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,TimeFramesFilas,true))
               //continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-c*Grosor_Linea_Cuadro;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               /*if(Modo_Experto && c==TimeFramesFilas-1 && f>=2)
                 {
                  Botones_Symbolos[f-2]="Cuadro Panel 001 Boton"+" c="+(string)c+" f="+(string)f;
                  ButtonCreate(0,Botones_Symbolos[f-2],0,X+TamanoCuadroHorizontal,Y,TamanoCuadroHorizontal_Botones,TamanoCuadroVertical,CORNER_LEFT_UPPER,"START","Arial",TamanoLetrasTexto,Color_Texto,clrRed,Color_Linea_Borde,false,false,false,true,0);
                  Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
                  string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN),2);
                  Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
                  Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN);
                  EditCreate(0,Edit_Symbolos[f-2],0,X+TamanoCuadroHorizontal+TamanoCuadroHorizontal_Botones,Y,TamanoCuadroHorizontal_Edit,TamanoCuadroVertical,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,clrBlack,clrWhite,Color_Linea_Borde,false,false,true,0);
                 }*/

               X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro+int((TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2)+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal);
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);

              }
         ChartRedraw();
        }
      ChartRedraw();
     }

   ChartRedraw();
  }
//+------------------------------------------------------------------+
