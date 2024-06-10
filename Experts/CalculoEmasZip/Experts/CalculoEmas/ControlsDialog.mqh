//+------------------------------------------------------------------+
//|                                               ControlsDialog.mqh |
//|                             Copyright 2000-2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
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
#include <Controls\Picture.mqh>

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
#define EDIT_HEIGHT                         (20)      // size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         (150)     // size by X coordinate
#define LIST_HEIGHT                         (179)     // size by Y coordinate
#define RADIO_HEIGHT                        (56)      // size by Y coordinate
#define CHECK_HEIGHT                        (93)      // size by Y coordinate
//+------------------------------------------------------------------+
//| Class CControlsDialog                                            |
//| Usage: main dialog of the Controls application                   |
//+------------------------------------------------------------------+

string TF[10]=     {"M1","M2","M5","M15","M30","H1","H4","D1","W1","MN1"};
ENUM_TIMEFRAMES TimeF[10]= {PERIOD_M1,PERIOD_M2,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
string InpDirectoryName="ValuesPanelEmas";
string InpFileName="";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CControlsDialog : public CAppDialog
  {
   struct Valores
     {
      double         dMax;
      double         dMin;
      double         PorcentajerangoMax;
      double         PorcentajerangoInter;
      double         RangoMax;
      double         RangoInter;
      double         sobreCompra[10];
      datetime       tiempoSobreCompra[10];
      double         sobreVenta[10];
      datetime       tiempoSobreVenta[10];
      bool           check[10];
      bool           seleccion;
      int            lastValueCheck;
      int            lastValueAutomatico;
      char           indexModo;
      bool           isPlay;
     };


   struct IndicatorsHandle
     {
      int               handlesIndicator;
      string            nameIndicator;
     };

   struct IndicatorsHandlesAutomatico
     {
      int               Fast;
      int               Slow;
      int               indexTF;
     };

   struct gamas
     {
      string         gamaColor;
      color clrInterCompra ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
      color clrInterVenta ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
      color clrMaxCompra ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
      color clrMaxVenta ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
      color clrSobreCompra ; // Color de la línea de SobreCompra
      color clrSobreVenta ; // Color de la línea de SobreVenta
     };


private:
   CRadioGroup       m_check_group_MaxMinTF;
   CButton           m_buttons_modo[2];
   CRadioGroup       m_check_group_TF_Actualizar;
   CEdit             m_check_label_DMIN;
   CEdit             m_check_label_DMAX;
   CEdit             m_check_label_RangoIntermedio;
   CEdit             m_check_label_RangoMaximo;
   CEdit             m_check_edit_RangoIntermedio;
   CEdit             m_check_edit_RangoMaximo;
   CEdit             m_check_label_value_RangoMaximo;
   CEdit             m_check_label_value_RangoIntermedio;
   CEdit             m_check_label_RangoIntermedio_name;
   CEdit             m_check_label_RangoMaximo_name;
   CButton           m_button_Calcular;
   CButton           m_button_Eliminar;
   CPicture          m_picture_state;
   CEdit             m_edit_estado_Actualizando;
   CEdit             m_edit_descripcion_fijar;
   CComboBox         m_comboBox_GamaFijar;

   CEdit             m_edit_label_fijar;
   CButton           m_button_fijarUltimas;
   CButton           m_button_editarFijas;

   CButton           m_button_TF[10];
   CEdit             m_edit_NSobreCompra;
   CEdit             m_edit_NSobreVenta;
   CEdit             m_edit_Check;
   CButton           m_button_sobrecompra[10];
   CButton           m_button_sobreventa[10];
   Valores           values;
   CButton           m_button_play_actualizar;

   string            TextCargando;

   int               indSeleccion;
   bool              sobreCompra;
   double            precioSeleccion;
   datetime          timeSeleccion;
   color             clrFlechasSeleccion;

   IndicatorsHandle  Ind[];
   int               IndicadoresTotal;
   string            seleccionadoUP;
   string            seleccionadoDN;

   string            UP_ema;
   string            DN_ema;

   string            LineaInterCompra;
   string            LineaInterVenta;
   string            LineaMaxCompra;
   string            LineaMaxVenta;
   string            LineaSobreCompra;
   string            LineaSobreVenta;

   ENUM_LINE_STYLE styleInterCompra ; // Puedes usar STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, o STYLE_DASHDOTDOT
   ENUM_LINE_STYLE styleInterVenta ; // Puedes usar los mismos estilos que para InterCompra

   int               widthInterCompra; // Ancho de la línea en píxeles
   int               widthInterVenta; // Ancho de la línea en píxeles

   color clrInterCompra ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
   color clrInterVenta ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.

   ENUM_LINE_STYLE styleMaxCompra ; // Puedes usar los mismos estilos que para InterCompra
   ENUM_LINE_STYLE styleMaxVenta ; // Puedes usar los mismos estilos que para InterCompra

   int widthMaxCompra ; // Ancho de la línea en píxeles
   int widthMaxVenta ; // Ancho de la línea en píxeles

   color clrMaxCompra ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
   color clrMaxVenta ; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.

   ENUM_LINE_STYLE   styleSobreCompra; // Estilo de la línea de SobreCompra
   ENUM_LINE_STYLE styleSobreVenta ; // Estilo de la línea de SobreVenta

   int widthSobreCompra ; // Ancho de la línea de SobreCompra en píxeles
   int widthSobreVenta ; // Ancho de la línea de SobreVenta en píxeles

   color clrSobreCompra ; // Color de la línea de SobreCompra
   color clrSobreVenta ; // Color de la línea de SobreVenta

   int               Ma_Periodo_Fast_1;
   int               Ma_Periodo_Slow_1;
   ENUM_MA_METHOD    Ma_Method_1;
   ENUM_APPLIED_PRICE Ma_AppliedPrice_1;

   IndicatorsHandlesAutomatico           handlesEmas[];
   bool                                  SignalCalcularEmas;
   bool                                  calcularLineas;

   gamas             gamasColores[];
   string            LineasSeleccionadas;

public:
                     CControlsDialog(void);
                    ~CControlsDialog(void);
   //--- create
   virtual bool      Create(const long chart, const string name, const int subwin, const int x1_, const int y1_, const int x2_, const int y2_,
                            ENUM_LINE_STYLE styleInterCompra_,  ENUM_LINE_STYLE styleInterVenta_,
                            const int widthInterCompra_, const int widthInterVenta_,
                            const color clrInterCompra_, const color clrInterVenta_,
                            ENUM_LINE_STYLE styleMaxCompra_, ENUM_LINE_STYLE styleMaxVenta_,
                            const int widthMaxCompra_, const int widthMaxVenta_,
                            const color clrMaxCompra_, const color clrMaxVenta_,
                            ENUM_LINE_STYLE styleSobreCompra_,  ENUM_LINE_STYLE styleSobreVenta_,
                            const int widthSobreCompra_, const int widthSobreVenta_,
                            const color clrSobreCompra_, const color clrSobreVenta_,
                            int Ma_Periodo_Fast_,int Ma_Periodo_Slow_,ENUM_MA_METHOD Ma_Method_,ENUM_APPLIED_PRICE Ma_AppliedPrice_);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   bool              OnEvent_(const int id,const long &lparam,const double &dparam,const string &sparam);

   void              OnTick_(void);
   void              OnDeinit_(int reason);

protected:
   //--- create dependent controls
   bool              DibujarLineas();
   void              SacarColumnasFilas(int filas,int columnas,int anchoPanel,int &x_start[],int &x_end[],int &y_start[],int &y_end[]);
   void              AgregarGama(string gamaColor,color clrInterCompra,color clrInterVenta,color clrMaxCompra,color clrMaxVenta,
                                 color clrSobreCompra,color clrSobreVenta);
   bool              VerificarEmas(int ma_fast,int ma_slow);
   bool              SaveValues();
   bool              ReadValues();
   bool              ActualizarValores();
   void              ActualiceHandles();
   void              DibujarPuntos();
   void              FunctionComprobarCambioIndicadores();
   void              GeneraHandlesEmas(void);
   void              VaciarHandlesEmasAutomaticas();
   bool              ActualizarValoresEmasEnElPanel();
   bool              ChangeCandle(ENUM_TIMEFRAMES timeFRAME,int &barLastCheck);

   bool              ArrowCreate(const long              chart_ID=0,           // ID del gráfico
                                 const string            name="Arrow",         // nombre de la flecha
                                 const int               sub_window=0,         // número de subventana
                                 datetime                time=0,               // hora del punto de anclaje
                                 double                  price=0,              // precio del punto de anclaje
                                 const uchar             arrow_code=252,       // código de la flecha
                                 const ENUM_ARROW_ANCHOR anchor=ANCHOR_BOTTOM, // posición del punto de anclaje
                                 const color             clr=clrRed,           // color de la flecha
                                 const ENUM_LINE_STYLE   style=STYLE_SOLID,    // estilo de la línea del contorno
                                 const int               width=3,              // tamaño de la flecha
                                 const bool              back=false,           // al fondo
                                 const bool              selection=true,       // seleccionar para mover
                                 const bool              hidden=true,          // ocultar en la lista de objetos
                                 const long              z_order=0);           // prioridad para el clic del ratón
   bool              HLineCreate(const long            chart_ID=0,        // ID del gráfico
                                 const string          name="HLine",      // nombre de la línea
                                 const int             sub_window=0,      // índice de subventana
                                 double                price=0,           // precio de la línea
                                 const color           clr=clrRed,        // color de la línea
                                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                                 const int             width=1,           // grosor de la línea
                                 const bool            back=false,        // al fondo
                                 const bool            selection=true,    // seleccionar para mover
                                 const bool            hidden=true,       // ocultar en la lista de objetos
                                 const long            z_order=0);         // prioridad para el clic del ratón
   bool              LabelCreate(const long              chart_ID=0,               // ID del gráfico
                                 const string            name="Label",             // nombre de la etiqueta
                                 const int               sub_window=0,             // número de subventana
                                 const int               x=0,                      // coordenada por el eje X
                                 const int               y=0,                      // coordenada por el eje Y
                                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                                 const string            text="Label",             // texto
                                 const string            font="Arial",             // fuente
                                 const int               font_size=10,             // tamaño de la fuente
                                 const color             clr=clrRed,               // color
                                 const double            angle=0.0,                // inclinación del texto
                                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                                 const bool              back=false,               // al fondo
                                 const bool              selection=false,          // seleccionar para mover
                                 const bool              hidden=true,              // ocultar en la lista de objetos
                                 const long              z_order=0);                //prioridad para el clic del ratón
   //--- handlers of the dependent controls events
   bool              OnClickSobreCompra(const int index);
   bool              OnClickSobreVenta(const int index);
   bool              OnClickModo(const int index);
   bool              OnClickButtonCalcular(void);
   bool              OnClickButtonBorrar(void);
   bool              OnChangeCheckGroup(int indice);
   bool              OnChangeMaxMinTF();
   bool              OnChangeActualizarTF();
   void              OnChangeRangoMaximo(void);
   void              OnChangeRangoIntermedio(void);
   bool              OnClickButtonPlay(void);
   bool              OnClickButtonFijarUltimas(void);
   bool              OnClickButtonEditarFijas(void);
  };

//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsDialog)
ON_INDEXED_EVENT(ON_CLICK,m_button_sobrecompra,OnClickSobreCompra)
ON_INDEXED_EVENT(ON_CLICK,m_button_sobreventa,OnClickSobreVenta)
ON_INDEXED_EVENT(ON_CLICK,m_buttons_modo,OnClickModo)
ON_EVENT(ON_CLICK,m_button_Calcular,OnClickButtonCalcular)
ON_EVENT(ON_CLICK,m_button_Eliminar,OnClickButtonBorrar)
ON_EVENT(ON_CLICK,m_button_play_actualizar,OnClickButtonPlay)
ON_EVENT(ON_CLICK,m_button_fijarUltimas,OnClickButtonFijarUltimas)
ON_EVENT(ON_CLICK,m_button_editarFijas,OnClickButtonEditarFijas)

//ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
ON_EVENT(ON_END_EDIT,m_check_edit_RangoIntermedio,OnChangeRangoIntermedio)
ON_EVENT(ON_END_EDIT,m_check_edit_RangoMaximo,OnChangeRangoMaximo)
//ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
//ON_EVENT(ON_CHANGE,m_combo_box,OnChangeComboBox)
//ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
ON_EVENT(ON_CHANGE,m_check_group_MaxMinTF,OnChangeMaxMinTF)
ON_EVENT(ON_CHANGE,m_check_group_TF_Actualizar,OnChangeActualizarTF)
ON_INDEXED_EVENT(ON_CLICK,m_button_TF,OnChangeCheckGroup)

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CControlsDialog::CControlsDialog(void)
  {
   values.seleccion=false;
   LineaInterCompra="2040 LINEA INTER COMPRA";
   LineaInterVenta="2040 LINEA INTER VENTA";
   LineaMaxCompra="2040 LINEA MAX COMPRA";
   LineaMaxVenta="2040 LINEA MAX VENTA";
   LineaSobreCompra="2040 LINEA SOBRE COMPRA";
   LineaSobreVenta="2040 LINEA SOBRE VENTA";
   TextCargando="Cargando";
   UP_ema="2040 LINEA ARROW UP";
   DN_ema="2040 LINEA ARROW DN";

   styleInterCompra = STYLE_SOLID; // Puedes usar STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, o STYLE_DASHDOTDOT
   styleInterVenta = STYLE_SOLID; // Puedes usar los mismos estilos que para InterCompra
   widthInterCompra = 1; // Ancho de la línea en píxeles
   widthInterVenta = 1; // Ancho de la línea en píxeles
   clrInterCompra = clrBlue; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
   clrInterVenta = clrRed; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
   styleMaxCompra = STYLE_SOLID; // Puedes usar los mismos estilos que para InterCompra
   styleMaxVenta = STYLE_SOLID; // Puedes usar los mismos estilos que para InterCompra
   widthMaxCompra = 1; // Ancho de la línea en píxeles
   widthMaxVenta = 1; // Ancho de la línea en píxeles
   clrMaxCompra = clrGreen; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.
   clrMaxVenta = clrYellow; // Color de la línea, puede ser uno de los colores predefinidos como clrBlue, clrRed, clrGreen, etc.

   styleSobreCompra = STYLE_SOLID; // Estilo de la línea de SobreCompra
   styleSobreVenta = STYLE_SOLID; // Estilo de la línea de SobreVenta
   widthSobreCompra = 1; // Ancho de la línea de SobreCompra en píxeles
   widthSobreVenta = 1; // Ancho de la línea de SobreVenta en píxeles
   clrSobreCompra = clrGreen; // Color de la línea de SobreCompra
   clrSobreVenta = clrRed; // Color de la línea de SobreVenta

   precioSeleccion=0;
   values.lastValueCheck=7;
   values.indexModo=0;
   values.lastValueAutomatico=5;
   values.isPlay=false;
   SignalCalcularEmas=false;

   AgregarGama("roja", "C'128,0,0'", "C'128,0,0'", "C'128,0,0'", "C'128,0,0'", "C'255,128,128'", "C'255,128,128'");
//AgregarGama("azul", "C'0,0,128'", "C'0,0,128'", "C'0,0,128'", "C'0,0,128'", "C'128,128,255'", "C'128,128,255'");
   AgregarGama("verde", "C'0,128,0'", "C'0,128,0'", "C'0,128,0'", "C'0,128,0'", "C'128,255,128'", "C'128,255,128'");
   AgregarGama("amarillo", "C'128,128,0'", "C'128,128,0'", "C'128,128,0'", "C'128,128,0'", "C'255,255,128'", "C'255,255,128'");
   AgregarGama("naranja", "C'204,102,0'", "C'204,102,0'", "C'204,102,0'", "C'204,102,0'", "C'255,178,102'", "C'255,178,102'");
   AgregarGama("púrpura", "C'128,0,128'", "C'128,0,128'", "C'128,0,128'", "C'128,0,128'", "C'192,128,255'", "C'192,128,255'");
   AgregarGama("cian", "C'0,128,128'", "C'0,128,128'", "C'0,128,128'", "C'0,128,128'", "C'128,255,255'", "C'128,255,255'");
   AgregarGama("magenta", "C'128,0,128'", "C'128,0,128'", "C'128,0,128'", "C'128,0,128'", "C'255,128,255'", "C'255,128,255'");

   LineasSeleccionadas=" ";
   calcularLineas=false;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CControlsDialog::~CControlsDialog(void)
  {
  }
//+------------------------------------------------------------------+
//| Create                                                           |
//+------------------------------------------------------------------+
bool CControlsDialog::Create(const long chart, const string name, const int subwin, const int x1_, const int y1_, const int x2_, const int y2_,
                             ENUM_LINE_STYLE styleInterCompra_,  ENUM_LINE_STYLE styleInterVenta_,
                             const int widthInterCompra_, const int widthInterVenta_,
                             const color clrInterCompra_, const color clrInterVenta_,
                             ENUM_LINE_STYLE styleMaxCompra_, ENUM_LINE_STYLE styleMaxVenta_,
                             const int widthMaxCompra_, const int widthMaxVenta_,
                             const color clrMaxCompra_, const color clrMaxVenta_,
                             ENUM_LINE_STYLE styleSobreCompra_,  ENUM_LINE_STYLE styleSobreVenta_,
                             const int widthSobreCompra_, const int widthSobreVenta_,
                             const color clrSobreCompra_, const color clrSobreVenta_,
                             int Ma_Periodo_Fast_,int Ma_Periodo_Slow_,ENUM_MA_METHOD Ma_Method_,ENUM_APPLIED_PRICE Ma_AppliedPrice_)
  {

   if(!VerificarEmas(Ma_Periodo_Fast_,Ma_Periodo_Slow_))
      return false;

   Ma_Periodo_Fast_1 = Ma_Periodo_Fast_;
   Ma_Periodo_Slow_1=Ma_Periodo_Slow_;
   Ma_Method_1=Ma_Method_;
   Ma_AppliedPrice_1=Ma_AppliedPrice_;

   styleInterCompra = styleInterCompra_;
   styleInterVenta = styleInterVenta_;
   widthInterCompra = widthInterCompra_;
   widthInterVenta = widthInterVenta_;
   clrInterCompra = clrInterCompra_;
   clrInterVenta = clrInterVenta_;

   styleMaxCompra = styleMaxCompra_;
   styleMaxVenta = styleMaxVenta_;
   widthMaxCompra = widthMaxCompra_;
   widthMaxVenta = widthMaxVenta_;
   clrMaxCompra = clrMaxCompra_;
   clrMaxVenta = clrMaxVenta_;

   styleSobreCompra = styleSobreCompra_;
   styleSobreVenta = styleSobreVenta_;
   widthSobreCompra = widthSobreCompra_;
   widthSobreVenta = widthSobreVenta_;
   clrSobreCompra = clrSobreCompra_;
   clrSobreVenta = clrSobreVenta_;

   InpFileName=Symbol()+IntegerToString(ChartID());
   values.seleccion=false;

   seleccionadoUP="SELECCIONUP";
   seleccionadoDN="SELECCIONDN";

   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   IndicadoresTotal=0;
   FunctionComprobarCambioIndicadores();

   values.PorcentajerangoInter=67.5;
   values.PorcentajerangoMax=97.5;

   if(!CAppDialog::Create(chart,name,subwin,x1_,y1_,x2_,y2_))
      return(false);
//--- create dependent controls
   int x1,y1,x2,y2;

   int               x_start[];
   int               y_start[];
   int               x_end[];
   int               y_end[];

   SacarColumnasFilas(20,5,x2_-x1_,x_start,x_end,y_start,y_end);

   int Linea_Espacio=0;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_DMAX.Create(m_chart_id,"m_name"+"DMAX",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_DMAX))
      return(false);
   m_check_label_DMAX.ReadOnly(true);
   m_check_label_DMAX.TextAlign(ALIGN_CENTER);
   m_check_label_DMAX.ColorBackground(clrGold);

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_DMIN.Create(m_chart_id,"m_name"+"DMIN",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_DMIN))
      return(false);
   m_check_label_DMIN.ReadOnly(true);
   m_check_label_DMIN.TextAlign(ALIGN_CENTER);
   m_check_label_DMIN.ColorBackground(clrGold);

   x1=x_start[2];
   x2=x_end[2];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio+7];

   if(!m_check_group_MaxMinTF.Create(m_chart_id,"m_name"+"MaxMinTF",m_subwin,x1,y1,x2,y2))
      return(false);

   if(!Add(m_check_group_MaxMinTF))
      return(false);

   for(int i=0;i<10;i++)
     {
      if(!m_check_group_MaxMinTF.AddItem(TF[i],i))
         return(false);
      values.check[i]=false;
     }

   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_buttons_modo[0].Create(m_chart_id,"m_name"+"MODO MANUAL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_buttons_modo[0]))
      return(false);

   m_buttons_modo[0].Locking(true);
   m_buttons_modo[0].Text("MANUAL");
   m_buttons_modo[0].ColorBackground(clrGray);


   x1=x_start[4];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_buttons_modo[1].Create(m_chart_id,"m_name"+"MODO AUTOMATICO",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_buttons_modo[1]))
      return(false);

   m_buttons_modo[1].Locking(true);
   m_buttons_modo[1].Text("AUTOMATICO");
   m_buttons_modo[1].ColorBackground(clrGray);

   Linea_Espacio=1;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_RangoIntermedio_name.Create(m_chart_id,"m_name"+"RangoIntermedio_name",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_RangoIntermedio_name))
      return(false);
   m_check_label_RangoIntermedio_name.ReadOnly(true);
   m_check_label_RangoIntermedio_name.TextAlign(ALIGN_CENTER);
   m_check_label_RangoIntermedio_name.ColorBackground(clrGold);
   m_check_label_RangoIntermedio_name.Text("R. Intermedio");


   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_RangoMaximo_name.Create(m_chart_id,"m_name"+"RangoMaximo_name",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_RangoMaximo_name))
      return(false);
   m_check_label_RangoMaximo_name.ReadOnly(true);
   m_check_label_RangoMaximo_name.TextAlign(ALIGN_CENTER);
   m_check_label_RangoMaximo_name.ColorBackground(clrGold);
   m_check_label_RangoMaximo_name.Text("R. Maximo");


   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_picture_state.Create(m_chart_id,"m_name"+"picture",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_picture_state))
      return(false);
   if(!m_picture_state.Border(5))
      return(false);
   m_picture_state.ColorBorder(clrAqua);
   m_picture_state.ColorBackground(clrAqua);
   if(!m_picture_state.BmpName("\Images\play.bmp"))
      return(false);

   x1+=25;
   if(!m_button_play_actualizar.Create(m_chart_id,"m_name"+"play actualizar",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_play_actualizar))
      return(false);

   m_button_play_actualizar.Text("Play");
   m_button_play_actualizar.Color(clrBlack);
   m_button_play_actualizar.ColorBackground(clrLimeGreen);


   x1=x_start[4];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio+6];

   if(!m_check_group_TF_Actualizar.Create(m_chart_id,"m_name"+"TF_Actualizar",m_subwin,x1,y1,x2,y2))
      return(false);

   if(!Add(m_check_group_TF_Actualizar))
      return(false);

   for(int i=0;i<9;i++)
     {
      if(!m_check_group_TF_Actualizar.AddItem(TF[i],i))
         return(false);
     }

   Linea_Espacio=2;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_RangoIntermedio.Create(m_chart_id,"m_name"+"RangoIntermedio",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_RangoIntermedio))
      return(false);
   m_check_label_RangoIntermedio.ReadOnly(true);
   m_check_label_RangoIntermedio.TextAlign(ALIGN_CENTER);
   m_check_label_RangoIntermedio.ColorBackground(clrGold);

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_RangoMaximo.Create(m_chart_id,"m_name"+"RangoMaximo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_RangoMaximo))
      return(false);
   m_check_label_RangoMaximo.ReadOnly(true);
   m_check_label_RangoMaximo.TextAlign(ALIGN_CENTER);
   m_check_label_RangoMaximo.ColorBackground(clrGold);


   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_estado_Actualizando.Create(m_chart_id,"m_name"+"m_edit_estado_Actualizando",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_estado_Actualizando))
      return(false);
   m_edit_estado_Actualizando.ReadOnly(true);
   m_edit_estado_Actualizando.TextAlign(ALIGN_CENTER);
   m_edit_estado_Actualizando.ColorBackground(clrGold);

   Linea_Espacio=3;


   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_edit_RangoIntermedio.Create(m_chart_id,"m_name"+"edit_RangoIntermedio",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_edit_RangoIntermedio))
      return(false);
   m_check_edit_RangoIntermedio.TextAlign(ALIGN_CENTER);


   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_edit_RangoMaximo.Create(m_chart_id,"m_name"+"edit_RangoMaximo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_edit_RangoMaximo))
      return(false);
   m_check_edit_RangoMaximo.TextAlign(ALIGN_CENTER);


   Linea_Espacio=4;


   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_value_RangoIntermedio.Create(m_chart_id,"m_name"+"value_RangoIntermedio",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_value_RangoIntermedio))
      return(false);
   m_check_label_value_RangoIntermedio.ReadOnly(true);
   m_check_label_value_RangoIntermedio.TextAlign(ALIGN_CENTER);
   m_check_label_value_RangoIntermedio.ColorBackground(clrGold);

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_check_label_value_RangoMaximo.Create(m_chart_id,"m_name"+"value_RangoMaximo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_label_value_RangoMaximo))
      return(false);
   m_check_label_value_RangoMaximo.ReadOnly(true);
   m_check_label_value_RangoMaximo.TextAlign(ALIGN_CENTER);
   m_check_label_value_RangoMaximo.ColorBackground(clrGold);

   Linea_Espacio=8;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_Check.Create(m_chart_id,"m_name"+"Seleccion Check",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_Check))
      return(false);
   m_edit_Check.Text("Selecciona TF");
   m_edit_Check.TextAlign(ALIGN_CENTER);
   m_edit_Check.ReadOnly(true);
   m_edit_Check.ColorBackground(clrGold);

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_NSobreCompra.Create(m_chart_id,"m_name"+"SobreCompraN",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NSobreCompra))
      return(false);
   m_edit_NSobreCompra.Text("Sobre Compra");
   m_edit_NSobreCompra.TextAlign(ALIGN_CENTER);
   m_edit_NSobreCompra.ReadOnly(true);
   m_edit_NSobreCompra.ColorBackground(clrGold);


   x1=x_start[2];
   x2=x_end[2];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_NSobreVenta.Create(m_chart_id,"m_name"+"SobreVentaN",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NSobreVenta))
      return(false);
   m_edit_NSobreVenta.Text("Sobre Venta");
   m_edit_NSobreVenta.TextAlign(ALIGN_CENTER);
   m_edit_NSobreVenta.ReadOnly(true);
   m_edit_NSobreVenta.ColorBackground(clrGold);


   Linea_Espacio=9;

   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_button_Calcular.Create(m_chart_id,"m_name"+"Calcular",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_Calcular))
      return(false);

   m_button_Calcular.Text("Calcular Dib.");
   m_button_Calcular.ColorBackground(clrAquamarine);


   x1=x_start[4];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_button_Eliminar.Create(m_chart_id,"m_name"+"Eliminar",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_Eliminar))
      return(false);

   m_button_Eliminar.Text("Borr. Lineas");
   m_button_Eliminar.ColorBackground(clrSalmon);



   Linea_Espacio=11;
   x1=x_start[3];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_label_fijar.Create(m_chart_id,"m_name"+"m_edit_label_fijar",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_label_fijar))
      return(false);
   m_edit_label_fijar.Text("Fijar Lineas");
   m_edit_label_fijar.ReadOnly(true);
   m_edit_label_fijar.ColorBackground(clrGold);
   m_edit_label_fijar.TextAlign(ALIGN_CENTER);


   Linea_Espacio=12;
   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_edit_descripcion_fijar.Create(m_chart_id,"m_name"+"m_edit_descripcion_fijar",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_descripcion_fijar))
      return(false);
   m_edit_descripcion_fijar.Text(" ");
   m_button_editarFijas.Visible(false);
   m_button_editarFijas.Disable();

   ObjectSetInteger(0,"m_name"+"m_edit_descripcion_fijar",OBJPROP_ZORDER,100);

   x1=x_start[4];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_comboBox_GamaFijar.Create(m_chart_id,"m_name"+"m_comboBox_GamaFijar",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_comboBox_GamaFijar))
      return(false);
   for(int i=0;i<ArraySize(gamasColores);i++)
      if(!m_comboBox_GamaFijar.ItemAdd(gamasColores[i].gamaColor,i))
         return(false);
   m_comboBox_GamaFijar.SelectByValue(0);
   ObjectSetInteger(0,"m_name"+"m_comboBox_GamaFijar",OBJPROP_ZORDER,100);


   Linea_Espacio=13;

   x1=x_start[3];
   x2=x_end[3];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_button_fijarUltimas.Create(m_chart_id,"m_name"+"m_button_fijarUltimas",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_fijarUltimas))
      return(false);

   m_button_fijarUltimas.Text("Fijar Azules");
   m_button_fijarUltimas.ColorBackground(clrSkyBlue);

   x1=x_start[4];
   x2=x_end[4];
   y1=y_start[Linea_Espacio];
   y2=y_end[Linea_Espacio];

   if(!m_button_editarFijas.Create(m_chart_id,"m_name"+"m_button_fijarSeleccion",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_editarFijas))
      return(false);

   m_button_editarFijas.Text("Edit. Seleccion");
   m_button_editarFijas.ColorBackground(clrSkyBlue);

   ObjectSetInteger(0,"m_name"+"m_button_fijarUltimas",OBJPROP_ZORDER,100);
   ObjectSetInteger(0,"m_name"+"m_button_fijarSeleccion",OBJPROP_ZORDER,100);


   for(int i=0;i<10;i++)
     {
      Linea_Espacio=9+i;

      x1=x_start[0];
      x2=x_end[0];
      y1=y_start[Linea_Espacio];
      y2=y_end[Linea_Espacio];

      if(!m_button_TF[i].Create(m_chart_id,"m_name"+"TF1"+IntegerToString(i),m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(m_button_TF[i]))
         return(false);

      m_button_TF[i].Locking(true);
      m_button_TF[i].Text(TF[i]);
      m_button_TF[i].ColorBackground(clrGray);


      x1=x_start[1];
      x2=x_end[1];
      y1=y_start[Linea_Espacio];
      y2=y_end[Linea_Espacio];

      if(!m_button_sobrecompra[i].Create(m_chart_id,"m_name"+"sobrecompra"+IntegerToString(i),m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(m_button_sobrecompra[i]))
         return(false);
      m_button_sobrecompra[i].ColorBackground(clrGray);
      m_button_sobrecompra[i].Text("0.0");


      x1=x_start[2];
      x2=x_end[2];
      y1=y_start[Linea_Espacio];
      y2=y_end[Linea_Espacio];

      if(!m_button_sobreventa[i].Create(m_chart_id,"m_name"+"sobreventa"+IntegerToString(i),m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(m_button_sobreventa[i]))
         return(false);
      m_button_sobreventa[i].ColorBackground(clrGray);
      m_button_sobreventa[i].Text("0.0");

      values.sobreCompra[i]=0;
      values.sobreVenta[i]=0;

      ObjectSetInteger(0,"m_name"+"sobreventa"+IntegerToString(i),OBJPROP_ZORDER,100);
      ObjectSetInteger(0,"m_name"+"sobrecompra"+IntegerToString(i),OBJPROP_ZORDER,100);
      ObjectSetInteger(0,"m_name"+"TF1"+IntegerToString(i),OBJPROP_ZORDER,100);

     }

   ReadValues();
   ActualizarValores();
   DibujarPuntos();
   if(values.seleccion)
     {
      MessageBox("Se cambio valor de TF, presiona de nuevo el boton correspondiente a "+StringSubstr(EnumToString(ENUM_TIMEFRAMES(Period())),7,-1));
      values.seleccion=false;
     }

   m_min_rect.Move(10,100);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnTick_()
  {

   static int barLastCheck = iBars(Symbol(),TimeF[values.lastValueCheck]);
   if(ChangeCandle(TimeF[values.lastValueCheck],barLastCheck))
     {
      ActualizarValores();
      if(values.isPlay)
         DibujarLineas();
     }

   static int barLastAutomatico = iBars(Symbol(),TimeF[values.lastValueAutomatico]);
   if(values.isPlay)
      if(ChangeCandle(TimeF[values.lastValueAutomatico],barLastAutomatico))
         SignalCalcularEmas=true;

   if(SignalCalcularEmas)
     {
      if(ActualizarValoresEmasEnElPanel())
        {
         DibujarPuntos();
         SignalCalcularEmas=false;
         DibujarLineas();
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ChangeCandle(ENUM_TIMEFRAMES timeFRAME,int &barLastCheck)
  {
   double close[3];
   if(!CopyClose(Symbol(),timeFRAME,0,3,close)<=0)
     {
      int Bars_=iBars(Symbol(),timeFRAME);
      if(Bars_!= barLastCheck)
        {
         barLastCheck = Bars_;
         return true;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnDeinit_(int reason)
  {
   ObjectDelete(0,seleccionadoUP);
   ObjectDelete(0,seleccionadoDN);
   ObjectDelete(0,UP_ema);
   ObjectDelete(0,DN_ema);

   if(reason!=REASON_CHARTCHANGE && reason!=REASON_CLOSE && reason!=REASON_PARAMETERS)
     {
      Print("ELIMINA ARCHIVO");
      ObjectsDeleteAll(0,"2040 LINEA ",-1);
      FileDelete(InpDirectoryName+"//"+InpFileName,FILE_COMMON);
     }
   else
      SaveValues();

   if(reason==REASON_PARAMETERS)
     {
      ObjectsDeleteAll(0,"2040 LINEA ",-1);
      ChartRedraw();
     }

   VaciarHandlesEmasAutomaticas();


   int total=ObjectsTotal(0,0,OBJ_HLINE);
   for(int i=0;i<total;i++)
     {
      string nameH=ObjectName(0,i,0,OBJ_HLINE);
      string desc=ObjectGetString(0,nameH,OBJPROP_TEXT,0);
      if(desc!="")
        {
         ObjectSetInteger(0,nameH,OBJPROP_SELECTABLE,false);
         ObjectSetInteger(0,nameH,OBJPROP_SELECTED,false);
         ObjectSetInteger(0,nameH,OBJPROP_BACK,true);
        }
      ChartRedraw();
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ActualizarValores(void)
  {

   m_check_group_MaxMinTF.Value(values.lastValueCheck);
   m_check_group_TF_Actualizar.Value(values.lastValueAutomatico);
   OnClickModo(values.indexModo);

   if(values.isPlay)
     {
      m_picture_state.BmpName("\Images\stop.bmp");
      m_button_play_actualizar.Text("Stop");
      m_button_play_actualizar.ColorBackground(clrIndianRed);
      m_edit_estado_Actualizando.Text("Act. Valores..");
      m_edit_estado_Actualizando.ColorBackground(clrLimeGreen);
     }
   else
     {
      m_picture_state.BmpName("\Images\play.bmp");
      m_button_play_actualizar.Text("Play");
      m_button_play_actualizar.ColorBackground(clrLimeGreen);
      m_edit_estado_Actualizando.Text("Detenido.");
      m_edit_estado_Actualizando.ColorBackground(clrIndianRed);
     }

   if(values.indexModo==1)
      GeneraHandlesEmas();

   values.dMax=iHigh(Symbol(),TimeF[values.lastValueCheck],1);
   values.dMin=iLow(Symbol(),TimeF[values.lastValueCheck],1);

   int Rango=int((values.dMax-values.dMin)/Point());
   values.RangoInter=Rango-Rango*values.PorcentajerangoInter/100.0;
   values.RangoMax=Rango-Rango*values.PorcentajerangoMax/100.0;

   m_check_label_DMAX.Text(DoubleToString(values.dMax,Digits())+" DMax");
   m_check_label_DMIN.Text(DoubleToString(values.dMin,Digits())+" DMin");

   m_check_label_RangoIntermedio.Text(DoubleToString(values.PorcentajerangoInter,2)+"% ("+IntegerToString(Rango)+")");
   m_check_label_RangoMaximo.Text(DoubleToString(values.PorcentajerangoMax,2)+"% ("+IntegerToString(Rango)+")");

   m_check_edit_RangoIntermedio.Text(DoubleToString(values.PorcentajerangoInter,1));
   m_check_edit_RangoMaximo.Text(DoubleToString(values.PorcentajerangoMax,1));

   m_check_label_value_RangoIntermedio.Text(DoubleToString(values.RangoInter,Digits()));
   m_check_label_value_RangoMaximo.Text(DoubleToString(values.RangoMax,Digits()));



   for(int i=0;i<10;i++)
     {
      m_button_TF[i].Pressed(values.check[i]);

      m_button_sobrecompra[i].Text(DoubleToString(values.sobreCompra[i],Digits()));
      m_button_sobreventa[i].Text(DoubleToString(values.sobreVenta[i],Digits()));

      if(m_button_TF[i].Pressed())
        {
         values.check[i]=true;
         m_button_TF[i].ColorBackground(clrGold);
         m_button_sobreventa[i].ColorBackground(clrMagenta);
         m_button_sobrecompra[i].ColorBackground(clrAqua);
        }
      else
        {
         values.check[i]=false;
         m_button_TF[i].ColorBackground(clrGray);
         m_button_sobreventa[i].ColorBackground(clrGray);
         m_button_sobrecompra[i].ColorBackground(clrGray);
        }
     }

   ChartRedraw();
   return true;
//m_edit.Text(__FUNCTION__);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::DibujarPuntos()
  {
   for(int i=0;i<10;i++)
     {
      if(PeriodSeconds(TimeF[i])==PeriodSeconds(PERIOD_CURRENT))
        {
         if(values.sobreVenta[i]!=0)
           {
            if(ObjectFind(0,UP_ema)!=0)
               ArrowCreate(0,UP_ema,0,values.tiempoSobreVenta[i],values.sobreVenta[i],217,ANCHOR_TOP,clrMagenta,STYLE_SOLID,3,false,false,true,0);
            else
              {
               ObjectSetInteger(0,UP_ema,OBJPROP_TIME,values.tiempoSobreVenta[i]);
               ObjectSetDouble(0,UP_ema,OBJPROP_PRICE,values.sobreVenta[i]);
              }
            ChartRedraw();
           }

         if(values.sobreCompra[i]!=0)
           {
            if(ObjectFind(0,DN_ema)!=0)
               ArrowCreate(0,DN_ema,0,values.tiempoSobreCompra[i],values.sobreCompra[i],218,ANCHOR_BOTTOM,clrAqua,STYLE_SOLID,3,false,false,true,0);
            else
              {
               ObjectSetInteger(0,DN_ema,OBJPROP_TIME,values.tiempoSobreCompra[i]);
               ObjectSetDouble(0,DN_ema,OBJPROP_PRICE,values.sobreCompra[i]);
              }
            ChartRedraw();
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::ActualiceHandles(void)
  {
   ArrayResize(Ind,0);

   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      //--- cuántos indicadores hay en esta ventana/subventana
      int total=ChartIndicatorsTotal(0,w);
      //--- repasamos todos los indicadores en la ventana
      for(int i=0; i<total; i++)
        {
         //--- obtenemos el nombre corto del indicador
         string name=ChartIndicatorName(0,w,i);

         if(StringFind(name,"MA",0)==-1)
            continue;
         //--- obtenemos el manejador del indicador
         int handle=ChartIndicatorGet(0,w,name);

         int size=ArraySize(Ind);
         ArrayResize(Ind,size+1);
         Ind[size].handlesIndicator=handle;
         Ind[size].nameIndicator=name;
         //--- mostramos en el diario
         PrintFormat("Window=%d,  index=%d,  name=%s,  handle=%d",w,i,name,handle);
         //--- release handle
        }
     }

   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::FunctionComprobarCambioIndicadores(void)
  {
   int Indicators=0;
   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      int total=ChartIndicatorsTotal(0,w);
      Indicators+=total;
     }

   if(IndicadoresTotal!=Indicators)
     {
      ActualiceHandles();
      IndicadoresTotal=Indicators;
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  CControlsDialog::OnEvent_(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(id==1)
     {
      string nombre=sparam;
      string desc=ObjectGetString(0,nombre,OBJPROP_TEXT,0);
      if(desc!=" " && ObjectGetInteger(0,nombre,OBJPROP_TYPE,0)==OBJ_HLINE)
        {
         int total=ObjectsTotal(0,0,OBJ_HLINE);
         for(int i=0;i<total;i++)
           {
            string nameH=ObjectName(0,i,0,OBJ_HLINE);
            string desc2=ObjectGetString(0,nameH,OBJPROP_TEXT,0);
            if(ObjectGetString(0,nameH,OBJPROP_TEXT,0)=="")
               continue;
            if(desc!=desc2)
              {
               ObjectSetInteger(0,nameH,OBJPROP_SELECTABLE,false);
               ObjectSetInteger(0,nameH,OBJPROP_SELECTED,false);
               ObjectSetInteger(0,nameH,OBJPROP_BACK,true);
              }
            else
              {
               bool estadoSeleccion=ObjectGetInteger(0,nameH,OBJPROP_SELECTABLE,0);
               ObjectSetInteger(0,nameH,OBJPROP_SELECTABLE,!estadoSeleccion);
               ObjectSetInteger(0,nameH,OBJPROP_SELECTED,!estadoSeleccion);
               ObjectSetInteger(0,nameH,OBJPROP_BACK,estadoSeleccion);
               if(estadoSeleccion)
                 {
                  m_button_editarFijas.Visible(false);
                  m_button_editarFijas.Disable();
                  LineasSeleccionadas=" ";
                  m_edit_descripcion_fijar.Text(" ");
                 }
               else
                 {
                  m_button_editarFijas.Visible(true);
                  m_button_editarFijas.Enable();
                  LineasSeleccionadas=desc;
                  m_edit_descripcion_fijar.Text(desc);
                  Minimize();
                  Maximize();
                 }
              }
           }
         ChartRedraw();
        }
     }


   if(values.seleccion)
     {
      if(id==4 && precioSeleccion!=0)
        {
         values.seleccion=false;
         if(sobreCompra)
           {
            m_button_sobrecompra[indSeleccion].Text(DoubleToString(precioSeleccion,Digits()));
            values.sobreCompra[indSeleccion]=precioSeleccion;
            values.tiempoSobreCompra[indSeleccion]=timeSeleccion;
            MessageBox("Se cambio valor de "+TF[indSeleccion]+" de sobrecompra a "+DoubleToString(precioSeleccion),"CAMBIO VALOR",0);
           }
         else
           {
            m_button_sobreventa[indSeleccion].Text(DoubleToString(precioSeleccion,Digits()));
            values.sobreVenta[indSeleccion]=precioSeleccion;
            values.tiempoSobreVenta[indSeleccion]=timeSeleccion;
            MessageBox("Se cambio valor de "+TF[indSeleccion]+" de sobreventa a "+DoubleToString(precioSeleccion),"CAMBIO VALOR",0);
           }

         Print(timeSeleccion,"  ",precioSeleccion);

         DibujarPuntos();
         ObjectDelete(0,seleccionadoDN);
         ObjectDelete(0,seleccionadoUP);
         ChartRedraw();
         return true;
        }


      FunctionComprobarCambioIndicadores();



      if(id==10)
        {
         datetime time;
         double price;
         int chart;

         ChartXYToTimePrice(0,(int)lparam,(int)dparam,chart,time,price);
         //Print(time,"   ",price);

         int bar=iBarShift(Symbol(),PERIOD_CURRENT,time,false);

         // Print("BAR ",IntegerToString(bar));

         double EMA[1];
         double Valores[];
         ArrayResize(Valores,ArraySize(Ind));

         bool cargotodo=true;
         for(int i=0;i<ArraySize(Ind);i++)
           {
            if(BarsCalculated(Ind[i].handlesIndicator)==iBars(Symbol(),PERIOD_CURRENT) && CopyBuffer(Ind[i].handlesIndicator,0,bar,1,EMA))
              {
               if(ObjectFind(0,TextCargando)==0)
                  ObjectDelete(0,TextCargando);
               Valores[i]=NormalizeDouble(EMA[0],6);
              }
            else
              {
               cargotodo=false;
               break;
              }
           }

         if(cargotodo)
           {
            if(ObjectFind(0,TextCargando)==0)
               ObjectDelete(0,TextCargando);
           }
         else
           {
            if(ObjectFind(0,TextCargando)!=0)
               LabelCreate(0,TextCargando,0,10,10,CORNER_LEFT_LOWER,"Cargando Valores Indicadores....","Arial",10,clrAqua,0,ANCHOR_LEFT_LOWER,false,false,true,0);
            ChartRedraw();
            return false;
           }

         if(ArraySize(Ind)!=0)
           {
            static int indiceSeleccionado=0;
            static double precioSeleccionado=0;

            for(int i=0;i<ArraySize(Ind);i++)
              {
               if((precioSeleccionado>Valores[i]+10*Point() && Valores[i]+10*Point()>=price) || (precioSeleccionado<Valores[i]-10*Point() && Valores[i]-10*Point()<=price))
                  indiceSeleccionado=i;
              }

            if(indiceSeleccionado>=ArraySize(Ind))
               indiceSeleccionado=0;

            precioSeleccionado=price;


            if(ObjectFind(0,seleccionadoUP)!=0)
              {
               ArrowCreate(0,seleccionadoUP,0,iTime(Symbol(),PERIOD_CURRENT,bar),Valores[indiceSeleccionado],218,ANCHOR_BOTTOM,clrFlechasSeleccion,STYLE_SOLID,1,false,false,true,0);
               ArrowCreate(0,seleccionadoDN,0,iTime(Symbol(),PERIOD_CURRENT,bar),Valores[indiceSeleccionado],217,ANCHOR_TOP,clrFlechasSeleccion,STYLE_SOLID,1,false,false,true,0);
              }
            else
              {
               ObjectSetDouble(0,seleccionadoUP,OBJPROP_PRICE,Valores[indiceSeleccionado]);
               ObjectSetInteger(0,seleccionadoUP,OBJPROP_TIME,iTime(Symbol(),PERIOD_CURRENT,bar));
               ObjectSetDouble(0,seleccionadoDN,OBJPROP_PRICE,Valores[indiceSeleccionado]);
               ObjectSetInteger(0,seleccionadoDN,OBJPROP_TIME,iTime(Symbol(),PERIOD_CURRENT,bar));
              }
            precioSeleccion=Valores[indiceSeleccionado];
            timeSeleccion=iTime(Symbol(),PERIOD_CURRENT,bar);
            ChartRedraw();
           }
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ArrowCreate(const long              chart_ID=0,           // ID del gráfico
                                  const string            name="Arrow",         // nombre de la flecha
                                  const int               sub_window=0,         // número de subventana
                                  datetime                time=0,               // hora del punto de anclaje
                                  double                  price=0,              // precio del punto de anclaje
                                  const uchar             arrow_code=252,       // código de la flecha
                                  const ENUM_ARROW_ANCHOR anchor=ANCHOR_BOTTOM, // posición del punto de anclaje
                                  const color             clr=clrRed,           // color de la flecha
                                  const ENUM_LINE_STYLE   style=STYLE_SOLID,    // estilo de la línea del contorno
                                  const int               width=3,              // tamaño de la flecha
                                  const bool              back=false,           // al fondo
                                  const bool              selection=true,       // seleccionar para mover
                                  const bool              hidden=true,          // ocultar en la lista de objetos
                                  const long              z_order=0)            // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la flecha
   if(!ObjectCreate(chart_ID,name,OBJ_ARROW,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la flecha! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el código de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_ARROWCODE,arrow_code);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de la línea del contorno
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el tamaño de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la flecha con ratón
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
bool CControlsDialog::HLineCreate(const long            chart_ID=0,        // ID del gráfico
                                  const string          name="HLine",      // nombre de la línea
                                  const int             sub_window=0,      // índice de subventana
                                  double                price=0,           // precio de la línea
                                  const color           clr=clrRed,        // color de la línea
                                  const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                                  const int             width=1,           // grosor de la línea
                                  const bool            back=false,        // al fondo
                                  const bool            selection=true,    // seleccionar para mover
                                  const bool            hidden=true,       // ocultar en la lista de objetos
                                  const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- si el precio no ha sido establecido, la ponemos en el nivel del precio Bid actual
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea horizontal
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea horizontal! Código del error = ",GetLastError());
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
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,true);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
bool CControlsDialog::LabelCreate(const long              chart_ID=0,               // ID del gráfico
                                  const string            name="Label",             // nombre de la etiqueta
                                  const int               sub_window=0,             // número de subventana
                                  const int               x=0,                      // coordenada por el eje X
                                  const int               y=0,                      // coordenada por el eje Y
                                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                                  const string            text="Label",             // texto
                                  const string            font="Arial",             // fuente
                                  const int               font_size=10,             // tamaño de la fuente
                                  const color             clr=clrRed,               // color
                                  const double            angle=0.0,                // inclinación del texto
                                  const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                                  const bool              back=false,               // al fondo
                                  const bool              selection=false,          // seleccionar para mover
                                  const bool              hidden=true,              // ocultar en la lista de objetos
                                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta de texto
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta de texto! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
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
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
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
bool CControlsDialog::OnClickSobreCompra(const int index)
  {
   if(m_button_TF[index].Pressed() && values.indexModo==0)
     {
      if(PeriodSeconds(PERIOD_CURRENT)!=PeriodSeconds(TimeF[index]))
         ChartSetSymbolPeriod(0,Symbol(),TimeF[index]);

      values.seleccion=true;
      sobreCompra=true;
      indSeleccion=index;
      clrFlechasSeleccion=clrAqua;
     }

   return true;
//m_edit.Text(__FUNCTION__);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickSobreVenta(const int index)
  {
   if(m_button_TF[index].Pressed() && values.indexModo==0)
     {
      if(PeriodSeconds(PERIOD_CURRENT)!=PeriodSeconds(TimeF[index]))
         ChartSetSymbolPeriod(0,Symbol(),TimeF[index]);

      values.seleccion=true;
      sobreCompra=false;
      indSeleccion=index;
      clrFlechasSeleccion=clrMagenta;
     }

   return true;
//m_edit.Text(__FUNCTION__);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickModo(const int index)
  {
   /*if(m_button_TF[index].Pressed(true))
     {
      if(PeriodSeconds(PERIOD_CURRENT)!=PeriodSeconds(TimeF[index]))
         ChartSetSymbolPeriod(0,Symbol(),TimeF[index]);

      values.seleccion=true;
      sobreCompra=false;
      indSeleccion=index;
      clrFlechasSeleccion=clrMagenta;
     }*/

   m_buttons_modo[index].Pressed(true);
   m_buttons_modo[index].ColorBackground(clrGold);
   values.indexModo=(char)index;

   if(index==0)
     {
      m_buttons_modo[1].Pressed(false);
      m_buttons_modo[1].ColorBackground(clrGray);
      m_check_group_TF_Actualizar.Visible(false);
      m_picture_state.Visible(false);
      m_button_play_actualizar.Visible(false);
      m_edit_estado_Actualizando.Visible(false);
      SignalCalcularEmas=false;
      VaciarHandlesEmasAutomaticas();
     }
   else
     {
      m_buttons_modo[0].Pressed(false);
      m_buttons_modo[0].ColorBackground(clrGray);
      m_check_group_TF_Actualizar.Visible(true);
      m_picture_state.Visible(true);
      m_button_play_actualizar.Visible(true);
      m_edit_estado_Actualizando.Visible(true);
      GeneraHandlesEmas();
     }
   return true;
//m_edit.Text(__FUNCTION__);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickButtonBorrar()
  {
   ObjectsDeleteAll(0,"2040 LINEA ",0,OBJ_HLINE);
   ChartRedraw();
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickButtonPlay()
  {
   values.isPlay=!values.isPlay;
   if(values.isPlay)
     {
      m_picture_state.BmpName("\Images\stop.bmp");
      m_button_play_actualizar.Text("Stop");
      m_button_play_actualizar.ColorBackground(clrIndianRed);
      m_edit_estado_Actualizando.Text("Act. Valores..");
      m_edit_estado_Actualizando.ColorBackground(clrLimeGreen);
     }
   else
     {
      VaciarHandlesEmasAutomaticas();
      m_picture_state.BmpName("\Images\play.bmp");
      m_button_play_actualizar.Text("Play");
      m_button_play_actualizar.ColorBackground(clrLimeGreen);
      m_edit_estado_Actualizando.Text("Detenido.");
      m_edit_estado_Actualizando.ColorBackground(clrIndianRed);
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickButtonFijarUltimas()
  {
   string desc=m_edit_descripcion_fijar.Text();

   if(desc=="" || desc==" ")
     {
      Alert("Debes de poner una descripcion a las lineas");
      return false;
     }

   int total=ObjectsTotal(0,0,OBJ_HLINE);
   for(int i=0;i<total;i++)
     {
      if(ObjectGetString(0,ObjectName(0,i,0,OBJ_HLINE),OBJPROP_TEXT)==desc)
        {
         Alert("Ya hay unas lineas con la descripcion dada, cambie la descripcion");
         return false;
        }
     }

   if(ObjectFind(0,LineaInterCompra)!=0)
     {
      Alert("No hay lineas Azules");
      return false;
     }

   int indexGama=m_comboBox_GamaFijar.Value();
   string nameLineas=desc;

   double SobreCompra=ObjectGetDouble(0,LineaSobreCompra,OBJPROP_PRICE,0);
   double SobreVenta=ObjectGetDouble(0,LineaSobreVenta,OBJPROP_PRICE,0);

   double InterCompra=ObjectGetDouble(0,LineaInterCompra,OBJPROP_PRICE,0);
   double InterVenta=ObjectGetDouble(0,LineaInterVenta,OBJPROP_PRICE,0);

   double MaxCompra=ObjectGetDouble(0,LineaMaxCompra,OBJPROP_PRICE,0);
   double MaxVenta=ObjectGetDouble(0,LineaMaxVenta,OBJPROP_PRICE,0);

   if(ObjectFind(0,nameLineas+LineaInterCompra)!=0)
      HLineCreate(0,nameLineas+LineaInterCompra,0,InterCompra,gamasColores[indexGama].clrInterCompra,styleInterCompra,widthInterCompra,true,false,true,0);
   else
      ObjectSetDouble(0,nameLineas+LineaInterCompra,OBJPROP_PRICE,InterCompra);
   ObjectSetString(0,nameLineas+LineaInterCompra,OBJPROP_TEXT,desc);


   if(ObjectFind(0, nameLineas+LineaInterVenta) != 0)
      HLineCreate(0, nameLineas+LineaInterVenta, 0, InterVenta, gamasColores[indexGama].clrInterVenta, styleInterVenta, widthInterVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, nameLineas+LineaInterVenta, OBJPROP_PRICE, InterVenta);
   ObjectSetString(0,nameLineas+LineaInterVenta,OBJPROP_TEXT,desc);


   if(ObjectFind(0, nameLineas+LineaMaxCompra) != 0)
      HLineCreate(0, nameLineas+LineaMaxCompra, 0, MaxCompra, gamasColores[indexGama].clrMaxCompra, styleMaxCompra, widthMaxCompra, true, false, true, 0);
   else
      ObjectSetDouble(0, nameLineas+LineaMaxCompra, OBJPROP_PRICE, MaxCompra);
   ObjectSetString(0,nameLineas+LineaMaxCompra,OBJPROP_TEXT,desc);


   if(ObjectFind(0, nameLineas+LineaMaxVenta) != 0)
      HLineCreate(0, nameLineas+LineaMaxVenta, 0, MaxVenta, gamasColores[indexGama].clrMaxVenta, styleMaxVenta, widthMaxVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, nameLineas+LineaMaxVenta, OBJPROP_PRICE, MaxVenta);
   ObjectSetString(0,nameLineas+LineaMaxVenta,OBJPROP_TEXT,desc);


   if(ObjectFind(0, nameLineas+LineaSobreCompra) != 0)
      HLineCreate(0, nameLineas+LineaSobreCompra, 0, SobreCompra, gamasColores[indexGama].clrSobreCompra, styleSobreCompra, widthSobreCompra, true, false, true, 0);
   else
      ObjectSetDouble(0, nameLineas+LineaSobreCompra, OBJPROP_PRICE, SobreCompra);
   ObjectSetString(0,nameLineas+LineaSobreCompra,OBJPROP_TEXT,desc);


   if(ObjectFind(0, nameLineas+LineaSobreVenta) != 0)
      HLineCreate(0, nameLineas+LineaSobreVenta, 0, SobreVenta, gamasColores[indexGama].clrSobreVenta, styleSobreVenta, widthSobreVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, nameLineas+LineaSobreVenta, OBJPROP_PRICE, SobreVenta);
   ObjectSetString(0,nameLineas+LineaSobreVenta,OBJPROP_TEXT,desc);


   ObjectsDeleteAll(0,"2040 LINEA ",0,OBJ_HLINE);
   m_edit_descripcion_fijar.Text(" ");
   ChartRedraw();

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickButtonEditarFijas()
  {
   if(LineasSeleccionadas=="")
      return false;

   string desc=m_edit_descripcion_fijar.Text();
   int indexGama=m_comboBox_GamaFijar.Value();

   int total=ObjectsTotal(0,0,OBJ_HLINE);

   if(LineasSeleccionadas!=desc)
      for(int i=0;i<total;i++)
        {
         if(ObjectGetString(0,ObjectName(0,i,0,OBJ_HLINE),OBJPROP_TEXT)==desc)
           {
            Alert("Ya hay unas lineas con la descripcion dada, cambie la descripcion");
            return false;
           }
        }

   string nameLineas=LineasSeleccionadas;

   ObjectSetInteger(0,nameLineas+LineaInterCompra,OBJPROP_COLOR,gamasColores[indexGama].clrInterCompra);
   ObjectSetString(0,nameLineas+LineaInterCompra,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaInterCompra,OBJPROP_NAME,desc+LineaInterCompra);

   ObjectSetInteger(0,nameLineas+LineaInterVenta,OBJPROP_COLOR,gamasColores[indexGama].clrInterVenta);
   ObjectSetString(0,nameLineas+LineaInterVenta,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaInterVenta,OBJPROP_NAME,desc+LineaInterVenta);

   ObjectSetInteger(0,nameLineas+LineaMaxCompra,OBJPROP_COLOR,gamasColores[indexGama].clrMaxCompra);
   ObjectSetString(0,nameLineas+LineaMaxCompra,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaMaxCompra,OBJPROP_NAME,desc+LineaMaxCompra);

   ObjectSetInteger(0,nameLineas+LineaMaxVenta,OBJPROP_COLOR,gamasColores[indexGama].clrMaxVenta);
   ObjectSetString(0,nameLineas+LineaMaxVenta,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaMaxVenta,OBJPROP_NAME,desc+LineaMaxVenta);

   ObjectSetInteger(0,nameLineas+LineaSobreCompra,OBJPROP_COLOR,gamasColores[indexGama].clrSobreCompra);
   ObjectSetString(0,nameLineas+LineaSobreCompra,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaSobreCompra,OBJPROP_NAME,desc+LineaSobreCompra);

   ObjectSetInteger(0,nameLineas+LineaSobreVenta,OBJPROP_COLOR,gamasColores[indexGama].clrSobreVenta);
   ObjectSetString(0,nameLineas+LineaSobreVenta,OBJPROP_TEXT,desc);
   ObjectSetString(0,nameLineas+LineaSobreVenta,OBJPROP_NAME,desc+LineaSobreVenta);

   LineasSeleccionadas=desc;

   return true;
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
bool CControlsDialog::OnClickButtonCalcular(void)
  {
   if(values.indexModo==1)
      SignalCalcularEmas=true;
   else
      DibujarLineas();

   return true;
//m_edit.Text(__FUNCTION__);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::DibujarLineas(void)
  {
   double emasSobreCompra=0;
   double emasSobreVenta=0;
   int cantidad=0;

   for(int i=0;i<10;i++)
      if(m_button_TF[i].Pressed())
        {
         emasSobreCompra+=values.sobreCompra[i];
         if(values.sobreCompra[i]==0)
           {
            Alert("Para calcular ningun valor debe ser 0 en SobreCompra, selecciona la ema en ",TF[i]);
            return false;
           }
         emasSobreVenta+=values.sobreVenta[i];
         if(values.sobreVenta[i]==0)
           {
            Alert("Para calcular ningun valor debe ser 0 en SobreVenta, selecciona la ema en ",TF[i]);
            return false;
           }
         cantidad++;
        }

   if(cantidad==0)
     {
      Alert("Debes seleccion al menos un TF para calcular");
      return false;
     }

   double SobreCompra=emasSobreCompra/cantidad;
   double SobreVenta=emasSobreVenta/cantidad;

   double InterCompra=SobreCompra+values.RangoInter*Point();
   double InterVenta=SobreVenta-values.RangoInter*Point();

   double MaxCompra=SobreCompra+values.RangoMax*Point();
   double MaxVenta=SobreVenta-values.RangoMax*Point();

   if(ObjectFind(0,LineaInterCompra)!=0)
      HLineCreate(0,LineaInterCompra,0,InterCompra,clrInterCompra,styleInterCompra,widthInterCompra,true,false,true,0);
   else
      ObjectSetDouble(0,LineaInterCompra,OBJPROP_PRICE,InterCompra);

   if(ObjectFind(0, LineaInterVenta) != 0)
      HLineCreate(0, LineaInterVenta, 0, InterVenta, clrInterVenta, styleInterVenta, widthInterVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, LineaInterVenta, OBJPROP_PRICE, InterVenta);

   if(ObjectFind(0, LineaMaxCompra) != 0)
      HLineCreate(0, LineaMaxCompra, 0, MaxCompra, clrMaxCompra, styleMaxCompra, widthMaxCompra, true, false, true, 0);
   else
      ObjectSetDouble(0, LineaMaxCompra, OBJPROP_PRICE, MaxCompra);

   if(ObjectFind(0, LineaMaxVenta) != 0)
      HLineCreate(0, LineaMaxVenta, 0, MaxVenta, clrMaxVenta, styleMaxVenta, widthMaxVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, LineaMaxVenta, OBJPROP_PRICE, MaxVenta);

   if(ObjectFind(0, LineaSobreCompra) != 0)
      HLineCreate(0, LineaSobreCompra, 0, SobreCompra, clrSobreCompra, styleSobreCompra, widthSobreCompra, true, false, true, 0);
   else
      ObjectSetDouble(0, LineaSobreCompra, OBJPROP_PRICE, SobreCompra);

   if(ObjectFind(0, LineaSobreVenta) != 0)
      HLineCreate(0, LineaSobreVenta, 0, SobreVenta, clrSobreVenta, styleSobreVenta, widthSobreVenta, true, false, true, 0);
   else
      ObjectSetDouble(0, LineaSobreVenta, OBJPROP_PRICE, SobreVenta);

   ChartRedraw();
   return true;
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
bool CControlsDialog::OnChangeCheckGroup(int indice)
  {
// Print(m_check_group_TF.Value());
   if(m_button_TF[indice].Pressed())
     {
      values.check[indice]=true;
      m_button_TF[indice].ColorBackground(clrGold);
      m_button_sobreventa[indice].ColorBackground(clrMagenta);
      m_button_sobrecompra[indice].ColorBackground(clrAqua);
     }
   else
     {
      values.check[indice]=false;
      m_button_TF[indice].ColorBackground(clrGray);
      m_button_sobreventa[indice].ColorBackground(clrGray);
      m_button_sobrecompra[indice].ColorBackground(clrGray);
     }
   GeneraHandlesEmas();

   return true;
// m_edit.Text(__FUNCTION__+" : Value="+IntegerToString(m_check_group.Value()));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnChangeMaxMinTF()
  {
   values.lastValueCheck=(int)m_check_group_MaxMinTF.Value();
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::OnChangeActualizarTF()
  {
   values.lastValueAutomatico=(int)m_check_group_TF_Actualizar.Value();
   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeRangoIntermedio(void)
  {
   if(StringToDouble(m_check_edit_RangoIntermedio.Text())!=0.0)
     {
      double RIntermedio=NormalizeDouble(StringToDouble(m_check_edit_RangoIntermedio.Text()),1);
      m_check_edit_RangoIntermedio.Text(DoubleToString(RIntermedio,1));
      values.PorcentajerangoInter=RIntermedio;
      ActualizarValores();
     }
   else
      m_check_edit_RangoIntermedio.Text(DoubleToString(values.PorcentajerangoInter,1));

  }
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeRangoMaximo(void)
  {
   if(StringToDouble(m_check_edit_RangoMaximo.Text())!=0.0)
     {
      double RMaximo=NormalizeDouble(StringToDouble(m_check_edit_RangoMaximo.Text()),1);
      m_check_edit_RangoMaximo.Text(DoubleToString(RMaximo,1));
      values.PorcentajerangoMax=RMaximo;
      ActualizarValores();
     }
   else
      m_check_edit_RangoIntermedio.Text(DoubleToString(values.PorcentajerangoMax,1));
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::SaveValues()
  {
//--- open the file for writing the structure array to the file (if the file is absent, it will be created automatically)
   ResetLastError();
   int file_handle=FileOpen(InpDirectoryName+"//"+InpFileName,FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("%s file is open for writing",InpFileName);
      PrintFormat("File path: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));

      //--- write array values in the loop
      uint byteswritten=FileWriteStruct(file_handle,values);
      //--- check the number of bytes written
      if(byteswritten!=sizeof(values))
        {
         PrintFormat("Error read data. Error code=%d",GetLastError());
         //--- close the file
         FileClose(file_handle);
         return false;
        }

      //--- close the file
      FileClose(file_handle);
      PrintFormat("Data is written, %s file is closed",InpFileName);
     }
   else
     {
      PrintFormat("Failed to open %s file, Error code = %d",InpFileName,GetLastError());
      return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ReadValues()
  {
   ResetLastError();
   int file_handle=FileOpen(InpDirectoryName+"//"+InpFileName,FILE_READ|FILE_BIN|FILE_COMMON);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("%s file is available for reading",InpFileName);
      PrintFormat("File path: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
      //--- read data from the file
      while(!FileIsEnding(file_handle))
        {
         //--- write data to the array
         uint bytesread=FileReadStruct(file_handle,values);
         //--- check data read
         if(bytesread!=sizeof(values))
           {
            PrintFormat("Error reading data. Error code=%d",GetLastError());
            //--- close the file
            FileClose(file_handle);
            return(false);
           }
        }
      //--- close the file
      FileClose(file_handle);
      PrintFormat("Data is read, %s file is closed",InpFileName);
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::VerificarEmas(int ma_fast,int ma_slow)
  {
   if(ma_fast>=ma_slow)
     {
      Alert("Periodo MA FAST debe ser menor a MA SLOW");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::GeneraHandlesEmas()
  {
   VaciarHandlesEmasAutomaticas();

   for(int i=0;i<10;i++)
     {
      if(values.check[i])
        {
         int size= ArraySize(handlesEmas);
         ArrayResize(handlesEmas,size+1);
         handlesEmas[size].Fast=iMA(Symbol(),TimeF[i],Ma_Periodo_Fast_1,0,Ma_Method_1,Ma_AppliedPrice_1);
         handlesEmas[size].Slow=iMA(Symbol(),TimeF[i],Ma_Periodo_Slow_1,0,Ma_Method_1,Ma_AppliedPrice_1);
         handlesEmas[size].indexTF=i;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::VaciarHandlesEmasAutomaticas()
  {
   for(int i=0;i<ArraySize(handlesEmas);i++)
     {
      IndicatorRelease(handlesEmas[i].Fast);
      IndicatorRelease(handlesEmas[i].Slow);
     }

   ArrayResize(handlesEmas,0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::ActualizarValoresEmasEnElPanel()
  {
   for(int i=0;i<ArraySize(handlesEmas);i++)
     {
      double valor[3];
      double v1,v2;
      int indice=handlesEmas[i].indexTF;
      if(iBars(Symbol(),TimeF[indice])==BarsCalculated(handlesEmas[i].Fast) && CopyBuffer(handlesEmas[i].Fast,0,0,3,valor)>0)
         v1=valor[1];
      else
         return false;

      if(iBars(Symbol(),TimeF[indice])==BarsCalculated(handlesEmas[i].Slow) && CopyBuffer(handlesEmas[i].Slow,0,0,3,valor)>0)
         v2=valor[1];
      else
         return false;

      double max=v1>v2?v1:v2;
      double min=v1<v2?v1:v2;
      m_button_sobrecompra[indice].Text(DoubleToString(max,Digits()));
      m_button_sobreventa[indice].Text(DoubleToString(min,Digits()));
      values.sobreCompra[indice]=max;
      values.sobreVenta[indice]=min;
      values.tiempoSobreCompra[indice]=iTime(Symbol(),TimeF[indice],1);
      values.tiempoSobreVenta[indice]=iTime(Symbol(),TimeF[indice],1);
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::AgregarGama(string gamaColor,color clrInterCompra,color clrInterVenta,color clrMaxCompra,color clrMaxVenta,
                                  color clrSobreCompra,color clrSobreVenta)
  {
   int size=ArraySize(gamasColores);
   ArrayResize(gamasColores,size+1);
   gamasColores[size].gamaColor=gamaColor;
   gamasColores[size].clrInterCompra=clrInterCompra;
   gamasColores[size].clrInterVenta=clrInterVenta;
   gamasColores[size].clrMaxCompra=clrMaxCompra;
   gamasColores[size].clrMaxVenta=clrMaxVenta;
   gamasColores[size].clrSobreCompra=clrSobreCompra;
   gamasColores[size].clrSobreVenta=clrSobreVenta;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::SacarColumnasFilas(int filas,int columnas,int anchoPanel,int &x_start[],int &x_end[],int &y_start[],int &y_end[])
  {
// Calcula el ancho disponible para cada columna
   int Calculo0 = int((((anchoPanel) - INDENT_LEFT * 2) - CONTROLS_GAP_X * columnas) / columnas+1);

   ArrayResize(x_start,columnas);
   ArrayResize(x_end,columnas);
   ArrayResize(y_start,filas);
   ArrayResize(y_end,filas);

   for(int i=0;i<columnas;i++)
     {
      x_start[i]=INDENT_LEFT+(Calculo0 + CONTROLS_GAP_X) * i;
      x_end[i]=x_start[i]+Calculo0;
     }

   for(int i=0;i<filas;i++)
     {
      y_start[i]=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*i;
      y_end[i]=y_start[i]+EDIT_HEIGHT;
     }
  }
//+------------------------------------------------------------------+
