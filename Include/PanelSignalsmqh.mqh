//+------------------------------------------------------------------+
//|                                               ControlsDialog.mqh |
//|                        Copyright 2021, MetaQuotes Software Corp. |
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


CWndClient *wndclient=NULL;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
typedef void (*TFunc)(void);
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CControlsDialog : public CAppDialog
  {
private:
   enum Indicadores_Establecidos {MEDIAS,MACD,ADX,Bollinger,RSI,None};

   struct ParametrosHandlesGlobal
     {
      ENUM_INDICATOR    Tipo_Indicador;
      MqlParam          parameters_Handle[];
     };

   struct ParametrosType
     {
      bool           IsBox;
      uint           Indice;
      uint           IndiceReal;
     };

   ParametrosType    TipoParametros[];

   CEdit             m_edit;

   CEdit             m_edit_NumeroIndicadores;
   CSpinEdit         m_spin_edit_NumeroIndicadores;

   CButton           m_button_Confirmacion;

   CEdit             m_edit_Indicador[];//15
   CComboBox         m_combo_box_Indicador[];//15

   CEdit             m_edit_Configuracion[];
   CEdit             m_edit_Configuracion_Values[];
   CComboBox         m_Box_Configuracion_Values[];

   CButton           m_button_Actualizar_Cuadro;

   CButton           m_button_LEFT;
   CEdit             m_edit_MiddleTitle;
   CButton           m_button_RIGHT;

   uint              IndiceHandle;

   int               BaseLeft;
   int               BaseRigh;

   TFunc             Actualizar;

public:

   ParametrosHandlesGlobal  ParametrosHandle[15];

   uint              MaxIndicadores;

                     CControlsDialog(void);
                    ~CControlsDialog(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2,TFunc callback);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   virtual bool      GetStartValue();
   virtual void      GetsValue(string &Symbolo,bool &PlaceMarket,int &NumeroNiveles,double &Lotes,int &TipoOperacion,bool &CierrePorTp,int &PipsTP,
                               int &Distancia,bool &IsUP,double &InicialPrice);


protected:
   //--- create dependent controls
   bool              CreateSeccionInicial();
   bool              CrearCajasIndicadores();
   bool              CrearCajasConfiguracion(MqlParam &Parametros[], ENUM_INDICATOR Tipo);
   void              OnChangeSpinEdit(void);
   bool              OnChangeBoxSelect(int IndiceBox);
   bool              OnChangeBoxEdit(int IndiceBox);
   bool              ComprobarInteger(string Texto);
   bool              ComprobarDouble(string Texto);
   bool              EliminarCajas();
   void              OnClickButtonRight();
   void              OnClickButtonLeft();
   void               OnClickButtonConfirmacion();
   void               IgualarHandle(MqlParam &Parametros[], ENUM_INDICATOR &Tipo,int Indice);
   void              ObtenerNombreIndicador(ENUM_INDICATOR IndicadorTipo,string &ArrayNamesInputs[]);
   void               OnClickButtonACTUALIZARCUADRO();
   virtual void      Maximize(void);
   virtual bool      OnDialogDragEnd(void);
  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsDialog)
ON_INDEXED_EVENT(ON_END_EDIT,m_edit_Configuracion_Values,OnChangeBoxEdit)
ON_INDEXED_EVENT(ON_CHANGE,m_Box_Configuracion_Values,OnChangeBoxSelect)
ON_EVENT(ON_CLICK,m_button_Confirmacion,OnClickButtonConfirmacion)
ON_EVENT(ON_CHANGE,m_spin_edit_NumeroIndicadores,OnChangeSpinEdit)
ON_EVENT(ON_CLICK,m_button_RIGHT,OnClickButtonRight)
ON_EVENT(ON_CLICK,m_button_LEFT,OnClickButtonLeft)
ON_EVENT(ON_CLICK,m_button_Actualizar_Cuadro,OnClickButtonACTUALIZARCUADRO)
EVENT_MAP_END(CAppDialog)


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnDialogDragEnd(void)
  {
   Move(10,10);
   CDialog::OnDialogDragEnd();
//m_norm_rect.SetBound(m_rect);

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::Maximize(void)
  {

   CAppDialog::Maximize();
   for(int i=0; i<15; i++)
     {
      if(m_spin_edit_NumeroIndicadores.Value()<=i)
        {
         m_combo_box_Indicador[i].Hide();
         m_edit_Indicador[i].Hide();
         m_combo_box_Indicador[i].Disable();
         m_edit_Indicador[i].Disable();
         m_combo_box_Indicador[i].Visible(false);
         m_edit_Indicador[i].Visible(false);
        }

      else
        {
         m_combo_box_Indicador[i].Show();
         m_edit_Indicador[i].Show();
         m_combo_box_Indicador[i].Enable();
         m_edit_Indicador[i].Enable();
         m_edit_Indicador[i].Visible(true);
         m_combo_box_Indicador[i].Visible(true);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonACTUALIZARCUADRO(void)
  {
   OnClickButtonMinMax();
   Actualizar();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonLeft(void)
  {
   if(IndiceHandle>=1)
     {
      IndiceHandle--;
      CrearCajasConfiguracion(ParametrosHandle[IndiceHandle].parameters_Handle,ParametrosHandle[IndiceHandle].Tipo_Indicador);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonRight(void)
  {
   if(int(IndiceHandle)<ArraySize(ParametrosHandle)-1 && IndiceHandle<MaxIndicadores-1)
     {
      IndiceHandle++;
      CrearCajasConfiguracion(ParametrosHandle[IndiceHandle].parameters_Handle,ParametrosHandle[IndiceHandle].Tipo_Indicador);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonConfirmacion(void)
  {
   MaxIndicadores=m_spin_edit_NumeroIndicadores.Value();

   for(int i=0; i<15; i++)
     {
      if(i<m_spin_edit_NumeroIndicadores.Value())
         IgualarHandle(ParametrosHandle[i].parameters_Handle,ParametrosHandle[i].Tipo_Indicador,i);
     }
   IndiceHandle=0;
   CrearCajasConfiguracion(ParametrosHandle[IndiceHandle].parameters_Handle,ParametrosHandle[IndiceHandle].Tipo_Indicador);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeSpinEdit()
  {
   if(!EliminarCajas())
      Print("ERROR AL ELIMINAR CAJAS");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnChangeBoxEdit(int IndiceBox)
  {


   int Size=ArraySize(TipoParametros);
   for(int i=0; i<Size; i++)
     {
      if(TipoParametros[i].IsBox==true && TipoParametros[i].Indice==IndiceBox)
        {
         long IndiceReal=TipoParametros[i].IndiceReal;
         ENUM_DATATYPE TipoDeDato=ParametrosHandle[IndiceHandle].parameters_Handle[IndiceBox].type;
         string Texto=m_edit_Configuracion_Values[IndiceBox].Text();
         bool Cambio=false;

         if(TipoDeDato==TYPE_CHAR || TipoDeDato==TYPE_UCHAR || TipoDeDato==TYPE_SHORT || TipoDeDato==TYPE_USHORT || TipoDeDato==TYPE_INT
            || TipoDeDato==TYPE_UINT || TipoDeDato==TYPE_LONG || TipoDeDato==TYPE_ULONG ||TipoDeDato==TYPE_BOOL)
            if(ComprobarInteger(Texto))
               ParametrosHandle[IndiceHandle].parameters_Handle[IndiceReal].integer_value=StringToInteger(m_edit_Configuracion_Values[IndiceBox].Text());
            else
               m_edit_Configuracion_Values[IndiceBox].Text(IntegerToString(ParametrosHandle[IndiceHandle].parameters_Handle[IndiceBox].integer_value));

         if(TipoDeDato==TYPE_FLOAT || TipoDeDato==TYPE_DOUBLE)
            if(ComprobarDouble(Texto))
               ParametrosHandle[IndiceHandle].parameters_Handle[IndiceReal].double_value=StringToDouble(m_edit_Configuracion_Values[IndiceBox].Text());
            else
               m_edit_Configuracion_Values[IndiceBox].Text(DoubleToString(ParametrosHandle[IndiceHandle].parameters_Handle[IndiceBox].double_value));


         if(TipoDeDato==TYPE_STRING || TipoDeDato==TYPE_COLOR || TipoDeDato==TYPE_DATETIME)
            ParametrosHandle[IndiceHandle].parameters_Handle[IndiceReal].string_value=m_edit_Configuracion_Values[IndiceBox].Text();

         break;
        }
     }
   return true;

//Print(EnumToString((ENUM_INDICATOR) ParametrosHandle[IndiceHandle].Tipo_Indicador));
//Print("CAMBIO BOX INDICE"+" INDICE "+string(IndiceBox));
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnChangeBoxSelect(int IndiceBox)
  {
   int Size=ArraySize(TipoParametros);
   for(int i=0; i<Size; i++)
     {
      if(TipoParametros[i].IsBox==false && TipoParametros[i].Indice==IndiceBox)
        {
         long Index=m_Box_Configuracion_Values[IndiceBox].Value();
         ParametrosHandle[IndiceHandle].parameters_Handle[TipoParametros[i].IndiceReal].integer_value=Index;
         break;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ComprobarInteger(string Texto)
  {

   uchar Array[];
   StringToCharArray(Texto,Array,0,WHOLE_ARRAY,0);

   for(int i=0; i<ArraySize(Array); i++)
     {
      uchar Char=Array[i];
      if(Char==0)
         continue;
      if(Char>'9' || Char<'0')
         return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ComprobarDouble(string Texto)
  {
   uchar Array[];
   uchar Punto=0;
   StringToCharArray(Texto,Array,0,WHOLE_ARRAY,0);
   for(int i=0; i<ArraySize(Array); i++)
     {
      uchar Char=Array[i];
      if(Char==0)
         continue;

      if((Char>'9' || Char<'0') && Char!='.')
         return false;
      if(Char=='.')
         Punto++;
      if(Punto>1)
         return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::IgualarHandle(MqlParam &Parametros[], ENUM_INDICATOR &Tipo,int Indice)
  {
   int valor=int(m_combo_box_Indicador[Indice].Value());

   int handle;

   if(valor==MEDIAS)
      handle=iMA(NULL,PERIOD_CURRENT,12,0,MODE_EMA,PRICE_CLOSE);
   else
      if(valor==ADX)
         handle=iADX(NULL,PERIOD_CURRENT,12);
      else
         if(valor==RSI)
            handle=iRSI(NULL,PERIOD_CURRENT,12,PRICE_CLOSE);
         else
            if(valor==MACD)
               handle=iMACD(NULL,PERIOD_CURRENT,12,26,9,PRICE_CLOSE);
            else
               //handle=iCustom(NULL,PERIOD_CURRENT,"RSI_Histogram_v1");
               handle=iBands(NULL,PERIOD_CURRENT,10,0,2,PRICE_CLOSE);

   Print(handle,"  ",Tipo);

   int params=IndicatorParameters(handle,Tipo,Parametros);

   IndicatorRelease(handle);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::ObtenerNombreIndicador(ENUM_INDICATOR IndicadorTipo,string &ArrayNamesInputs[])
  {
   if(IndicadorTipo==IND_ADX)
     {
      ArrayResize(ArrayNamesInputs,1);
      ArrayNamesInputs[0]="adx_period";
     }
   if(IndicadorTipo==IND_BANDS)
     {
      ArrayResize(ArrayNamesInputs,4);
      ArrayNamesInputs[0]="bands_period";
      ArrayNamesInputs[1]="bands_shift";
      ArrayNamesInputs[2]="deviation";
      ArrayNamesInputs[3]="applied_price";
     }
   if(IndicadorTipo==IND_RSI)
     {
      ArrayResize(ArrayNamesInputs,2);
      ArrayNamesInputs[0]="ma_period";
      ArrayNamesInputs[1]="applied_price";
     }
   if(IndicadorTipo==IND_MACD)
     {
      ArrayResize(ArrayNamesInputs,4);
      ArrayNamesInputs[0]="fast_ema_period";
      ArrayNamesInputs[1]="slow_ema_period";
      ArrayNamesInputs[2]="signal_period";
      ArrayNamesInputs[3]="applied_price";
     }
   if(IndicadorTipo==IND_MA)
     {
      ArrayResize(ArrayNamesInputs,4);
      ArrayNamesInputs[0]="ma_period";
      ArrayNamesInputs[1]="ma_shift";
      ArrayNamesInputs[2]="ma_method";
      ArrayNamesInputs[3]="applied_price";
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CControlsDialog::CControlsDialog(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CControlsDialog::~CControlsDialog(void)
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2,TFunc callback)
  {
   Actualizar=callback;

   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false);

   if(!CreateSeccionInicial())
      return(false);
//--- succeed
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateSeccionInicial()
  {
   string prefix=Name();
   int total=ControlsTotal();
   for(int i=0; i<total; i++)
     {
      CWnd*obj=Control(i);
      string name=obj.Name();

      if(name==prefix+"Client")
        {
         wndclient=(CWndClient*) obj;
         break;
        }
     }

   IndiceHandle=0;
   BaseLeft=0;
   BaseRigh=0;

// handles[2]=iCustom(NULL,PERIOD_CURRENT,"ADX_Histogram_Minus_v1");

   int x1[4],y1,x2[4],y2;
   int _32x1[3],_32x2[3];

//Print("1  "+ClientAreaWidth());

   int Calculo0=int((((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1)/2);
   int Calculo0_0=int((Calculo0)/2);

   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_0_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP0_0_1=GAP0_0+(int(Calculo0/2)*1);
   int GAP0_1=(Calculo0+CONTROLS_GAP_X)*1;
   int GAP0_1_0=GAP0_1+(int(Calculo0/2)*0);
   int GAP0_1_1=GAP0_1+(int(Calculo0/2)*1);

   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*0;
   y2=y1+EDIT_HEIGHT;
   x1[0]=INDENT_LEFT+GAP0_0_0;
   x2[0]=x1[0]+Calculo0_0   ;
   x1[1]=INDENT_LEFT+GAP0_0_1  ;
   x2[1]=x1[1]+Calculo0_0   ;
   x1[2]=INDENT_LEFT+GAP0_1_1  ;
   x2[2]=x1[2]+Calculo0_0   ;
   x1[3]=INDENT_LEFT+GAP0_1_0  ;
   x2[3]=x1[3]+Calculo0_0;

   int Calculo0_1=int((Calculo0)/3);

   int _3GAP0_1_0=GAP0_1+(int(Calculo0/3)*0);
   int _3GAP0_1_1=GAP0_1+(int(Calculo0/3)*1);
   int _3GAP0_1_2=GAP0_1+(int(Calculo0/3)*2);

   _32x1[0]=INDENT_LEFT+_3GAP0_1_0  ;
   _32x2[0]=_32x1[0]+Calculo0_1;

   _32x1[1]=INDENT_LEFT+_3GAP0_1_1  ;
   _32x2[1]=_32x1[1]+Calculo0_1 ;

   _32x1[2]=INDENT_LEFT+_3GAP0_1_2 ;
   _32x2[2]=_32x1[2]+Calculo0_1;

/////////////// SECCION CONFIGURACION NUMERO INDICADORES //////////////////////
   if(!m_edit_NumeroIndicadores.Create(m_chart_id,"m_name"+"NumberLabel",m_subwin,x1[0],y1,x2[0],y2))
      return(false);
   if(!Add(m_edit_NumeroIndicadores))
      return(false);
   m_edit_NumeroIndicadores.Text("Numero de Indicadores");

   if(!m_spin_edit_NumeroIndicadores.Create(m_chart_id,"m_name"+"Number",m_subwin,x1[1],y1,x2[1],y2))
      return(false);
   if(!Add(m_spin_edit_NumeroIndicadores))
      return(false);
   m_spin_edit_NumeroIndicadores.MinValue(1);
   m_spin_edit_NumeroIndicadores.MaxValue(15);
   m_spin_edit_NumeroIndicadores.Value(5);
/////////////// SECCION CONFIGURACION BOTONES CONTROL INDICADORES //////////////////////

   if(!m_button_LEFT.Create(m_chart_id,"m_name"+"LEFT",m_subwin,_32x1[0],y1,_32x2[0],y2))
      return(false);

   if(!Add(m_button_LEFT))
      return(false);

   m_button_LEFT.Text("<=====");

   if(!m_edit_MiddleTitle.Create(m_chart_id,"m_name"+"MiddleTitle",m_subwin,_32x1[1],y1,_32x2[1],y2))
      return(false);
   if(!Add(m_edit_MiddleTitle))
      return(false);

   m_edit_MiddleTitle.Text("INDICADOR 1");
   m_edit_MiddleTitle.TextAlign(ALIGN_CENTER);
   m_edit_MiddleTitle.ReadOnly(true);

   if(!m_button_RIGHT.Create(m_chart_id,"m_name"+"BUTTON",m_subwin,_32x1[2],y1,_32x2[2],y2))
      return(false);
   if(!Add(m_button_RIGHT))
      return(false);

   m_button_RIGHT.Text("=====>");

////// SECCION CONFIGURACION LISTA INDICADORES//////////////////

   ArrayResize(m_edit_Indicador,15);
   ArrayResize(m_combo_box_Indicador,15);
   ArrayResize(m_edit_Configuracion,6);
   ArrayResize(m_edit_Configuracion_Values,6);
   ArrayResize(m_Box_Configuracion_Values,6);

   BaseLeft=INDENT_TOP+(CONTROLS_GAP_Y+EDIT_HEIGHT)*(m_spin_edit_NumeroIndicadores.Value()+3);
   this.Height(BaseLeft);
   m_norm_rect.SetBound(m_rect);

   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*(m_spin_edit_NumeroIndicadores.Value()+1);
   y2=y1+EDIT_HEIGHT;

   if(!m_button_Confirmacion.Create(m_chart_id,"m_name"+"ButtonConfi",m_subwin,x1[0],y1,x2[1],y2))
      return(false);

   if(!Add(m_button_Confirmacion))
      return(false);

   m_button_Confirmacion.Text("Actualizar Indicadores");

   if(!m_button_Actualizar_Cuadro.Create(m_chart_id,"m_name"+"ButtonActualizar",m_subwin,x1[0],y1,x2[1],y2))
      return(false);

   if(!Add(m_button_Actualizar_Cuadro))
      return(false);

   m_button_Actualizar_Cuadro.Text("Actualizar Cuadro");

   for(int i=1; i<15+1; i++)
     {
      y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*i;
      y2=y1+EDIT_HEIGHT;

      if(!m_edit_Indicador[i-1].Create(m_chart_id,"m_name"+"TipoIndicador"+string(i),m_subwin,x1[0],y1,x2[0],y2))
         return(false);
      if(!Add(m_edit_Indicador[i-1]))
         return(false);

      m_edit_Indicador[i-1].Text("INDICADOR "+string(i));
      //Id(i+2*(i-1));

      if(!m_combo_box_Indicador[i-1].Create(m_chart_id,"m_name"+"SetIndicador"+string(i),m_subwin,x1[1],y1,x2[1],y2))
         return(false);
      if(!Add(m_combo_box_Indicador[i-1]))
         return(false);
      if(i>m_spin_edit_NumeroIndicadores.Value())
        {
         m_combo_box_Indicador[i-1].Hide();
         m_edit_Indicador[i-1].Hide();
        }

      for(int j=0; j<5; j++)
         if(!m_combo_box_Indicador[i-1].ItemAdd(EnumToString((Indicadores_Establecidos) j)))
            return(false);

      m_combo_box_Indicador[i-1].SelectByValue((i-1)%5);

      //Id(i+2*(i));
     }

   OnClickButtonConfirmacion();

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::EliminarCajas()
  {
   BaseLeft=INDENT_TOP+(CONTROLS_GAP_Y+EDIT_HEIGHT)*(m_spin_edit_NumeroIndicadores.Value()+3);

   if(BaseRigh!=0)
     {
      if(BaseRigh<=BaseLeft)
         Height(BaseLeft);
      else
         Height(BaseRigh);
      m_norm_rect.SetBound(m_rect);
     }

   int Calculo0=int((((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1)/2);
   int Calculo0_0=int((Calculo0)/2);

   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_0_0=GAP0_0+(int(Calculo0/2)*0);

   int x1=wndclient.Left()+INDENT_LEFT+GAP0_0_0;

   m_button_Confirmacion.Move(x1,wndclient.Top()+INDENT_TOP+(CONTROLS_GAP_Y+EDIT_HEIGHT)*(m_spin_edit_NumeroIndicadores.Value()+1));

   for(int i=0; i<15; i++)
     {
      if(m_spin_edit_NumeroIndicadores.Value()<=i)
        {
         m_combo_box_Indicador[i].Hide();
         m_edit_Indicador[i].Hide();
         m_combo_box_Indicador[i].Disable();
         m_edit_Indicador[i].Disable();
         m_combo_box_Indicador[i].Visible(false);
         m_edit_Indicador[i].Visible(false);
        }

      else
        {
         m_combo_box_Indicador[i].Show();
         m_edit_Indicador[i].Show();
         m_combo_box_Indicador[i].Enable();
         m_edit_Indicador[i].Enable();
         m_edit_Indicador[i].Visible(true);
         m_combo_box_Indicador[i].Visible(true);
        }
     }
   Run();
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajasConfiguracion(MqlParam &Parametros[], ENUM_INDICATOR Tipo)
  {

   for(int K=0; K<ArraySize(m_edit_Configuracion); K++)
     {
      m_edit_Configuracion[K].Destroy();
      wndclient.Delete(m_edit_Configuracion[K]);
     }

   for(int K=0; K<ArraySize(m_edit_Configuracion_Values); K++)
     {
      m_edit_Configuracion_Values[K].Destroy();
      wndclient.Delete(m_edit_Configuracion_Values[K]);
     }

   for(int K=0; K<ArraySize(m_Box_Configuracion_Values); K++)
     {
      m_Box_Configuracion_Values[K].Destroy();
      wndclient.Delete(wndclient.ControlFind(2000+K));
     }
   ChartRedraw();


   int x1[4],y1,x2[4],y2;

   int Calculo0=int((((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1)/2);
   int Calculo0_0=int((Calculo0)/2);

   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_0_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP0_0_1=GAP0_0+(int(Calculo0/2)*1);
   int GAP0_1=(Calculo0+CONTROLS_GAP_X)*1;
   int GAP0_1_0=GAP0_1+(int(Calculo0/2)*0);
   int GAP0_1_1=GAP0_1+(int(Calculo0/2)*1);

   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*0;
   y2=y1+EDIT_HEIGHT;
   x1[0]=INDENT_LEFT+GAP0_0_0;
   x2[0]=x1[0]+Calculo0_0   ;
   x1[1]=INDENT_LEFT+GAP0_0_1  ;
   x2[1]=x1[1]+Calculo0_0   ;
   x1[2]=INDENT_LEFT+GAP0_1_0  ;
   x2[2]=x1[2]+Calculo0_0   ;
   x1[3]=INDENT_LEFT+GAP0_1_1  ;
   x2[3]=x1[3]+Calculo0_0;



   ArrayResize(m_edit_Configuracion_Values,0);
   ArrayResize(m_Box_Configuracion_Values,0);

// int params=IndicatorParameters(handle,indicator_type,parameters_Handle);
   int params=ArraySize(Parametros);
//--- encabezamiento del mensaje
   string par_info="Short name ADX"+", type "
                   +EnumToString(ENUM_INDICATOR(Tipo))+"\r\n";
//---
   m_edit_MiddleTitle.Text(EnumToString(ENUM_INDICATOR(Tipo))+" ("+string(IndiceHandle+1)+")");

   BaseRigh=INDENT_TOP+(CONTROLS_GAP_Y+EDIT_HEIGHT)*(params+3);

   if(BaseLeft!=0)
     {
      if(BaseRigh>=BaseLeft)
         Height(BaseRigh);
      else
         Height(BaseLeft);
      m_norm_rect.SetBound(m_rect);
     }

   string ArrayNombres[];
   ObtenerNombreIndicador(Tipo,ArrayNombres);

   ArrayResize(TipoParametros,params);


   int IndiceBox=0;
   int IndiceSelect=0;
   for(int p=0; p<params; p++)
     {
      y1=INDENT_TOP+(EDIT_HEIGHT+(CONTROLS_GAP_Y))*(p+1);
      y2=y1+EDIT_HEIGHT;

      int SizeAnterior=ArraySize(m_edit_Configuracion);
      ArrayResize(m_edit_Configuracion,SizeAnterior+1);

      if(!m_edit_Configuracion[SizeAnterior].Create(m_chart_id,"m_name"+"Configuracion"+string(p),m_subwin,x1[2],y1,x2[2],y2))
         return(false);
      if(!Add(m_edit_Configuracion[SizeAnterior]))
         return(false);

      m_edit_Configuracion[SizeAnterior].Text(ArrayNombres[p]);

      if(p==0 && Tipo==IND_CUSTOM)
         m_edit_Configuracion[SizeAnterior].Text("Nombre Indicador");

      if(Parametros[p].type!=TYPE_BOOL && ArrayNombres[p]!="applied_price" && ArrayNombres[p]!="ma_method")
        {
         TipoParametros[p].IsBox=true;
         TipoParametros[p].Indice=IndiceBox;
         TipoParametros[p].IndiceReal=p;
         IndiceBox++;

         SizeAnterior=ArraySize(m_edit_Configuracion_Values);
         ArrayResize(m_edit_Configuracion_Values,SizeAnterior+1);
         // m_edit_Configuracion_Values[p].Id(1000+p);

         if(!m_edit_Configuracion_Values[SizeAnterior].Create(m_chart_id,"m_name"+"ConfiguracionV"+string(p),m_subwin,x1[3],y1,x2[3],y2))
            return(false);

         if(!Add(m_edit_Configuracion_Values[SizeAnterior]))
            return(false);


         if(Parametros[p].type==TYPE_CHAR || Parametros[p].type==TYPE_UCHAR || Parametros[p].type==TYPE_SHORT || Parametros[p].type==TYPE_USHORT || Parametros[p].type==TYPE_INT
            || Parametros[p].type==TYPE_UINT || Parametros[p].type==TYPE_LONG || Parametros[p].type==TYPE_ULONG ||Parametros[p].type==TYPE_BOOL)
            m_edit_Configuracion_Values[SizeAnterior].Text(IntegerToString(Parametros[p].integer_value));
         else
            if(Parametros[p].type==TYPE_FLOAT || Parametros[p].type==TYPE_DOUBLE)
               m_edit_Configuracion_Values[SizeAnterior].Text(DoubleToString(Parametros[p].double_value));
            else
               if(Parametros[p].type==TYPE_STRING || Parametros[p].type==TYPE_COLOR || Parametros[p].type==TYPE_DATETIME)
                  m_edit_Configuracion_Values[SizeAnterior].Text(Parametros[p].string_value);

         if(Parametros[p].type==TYPE_COLOR)
           {
            m_edit_Configuracion_Values[SizeAnterior].Text(Parametros[p].string_value);
            m_edit_Configuracion_Values[SizeAnterior].ReadOnly(true);
           }
         else
            if(Parametros[p].type==TYPE_STRING)
              {
               m_edit_Configuracion_Values[SizeAnterior].Text(string(Parametros[p].string_value));
               if(p==0 && Tipo==IND_CUSTOM)
                  m_edit_Configuracion_Values[SizeAnterior].ReadOnly(true);
              }
        }
      else
        {
         TipoParametros[p].IsBox=false;
         TipoParametros[p].Indice=IndiceSelect;
         TipoParametros[p].IndiceReal=p;
         IndiceSelect++;

         SizeAnterior=ArraySize(m_Box_Configuracion_Values);
         ArrayResize(m_Box_Configuracion_Values,SizeAnterior+1);

         if(!m_Box_Configuracion_Values[SizeAnterior].Create(m_chart_id,"m_name"+"ConfiguracionBox"+string(SizeAnterior),m_subwin,x1[3],y1,x2[3],y2))
            return(false);

         if(!Add(m_Box_Configuracion_Values[SizeAnterior]))
            return(false);

         if(Parametros[p].type==TYPE_BOOL)
           {
            m_Box_Configuracion_Values[SizeAnterior].ItemAdd("false",0);
            m_Box_Configuracion_Values[SizeAnterior].ItemAdd("true",0);
           }
         else
            if(ArrayNombres[p]=="ma_method")
              {
               for(int k=0; k<7; k++)
                 {
                  m_Box_Configuracion_Values[SizeAnterior].ItemAdd(EnumToString((ENUM_APPLIED_PRICE)(k+1)),k+1);
                 }
              }
            else
              {
               for(int k=0; k<4; k++)
                 {
                  m_Box_Configuracion_Values[SizeAnterior].ItemAdd(EnumToString((ENUM_MA_METHOD)k));
                 }
              }
         m_Box_Configuracion_Values[SizeAnterior].SelectByValue(Parametros[p].integer_value);
        }


      par_info+=StringFormat("parameter %d: type=%s, long_value=%d, double_value=%G,string_value=%s\r\n",
                             p,
                             EnumToString((ENUM_DATATYPE)Parametros[p].type),
                             Parametros[p].integer_value,
                             Parametros[p].double_value,
                             Parametros[p].string_value
                            );
     }

   int _x1=wndclient.Left()+x1[2];

   Run();

   m_button_Actualizar_Cuadro.Move(_x1,wndclient.Top()+INDENT_TOP+(CONTROLS_GAP_Y+EDIT_HEIGHT)*(params+1));

   ChartRedraw();
   return true;
  }
//+------------------------------------------------------------------+
