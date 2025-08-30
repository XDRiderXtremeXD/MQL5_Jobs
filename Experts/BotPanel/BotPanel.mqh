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
#include <Controls\SpinEditDouble.mqh>
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
class CControlsDialog : public CAppDialog
  {
   struct cajaOperacion
     {
      CEdit           titulo;
      CLabel          subtitulos[6];
      CEdit           valor[5];
      CSpinEditDouble valorSpin;
      string          distincion;
     };

   struct cajaModeloEntrada
     {
      CEdit             m_edit_ME;
      CRadioGroup       m_radio_group_op;
     };

   struct cajaModeloTPSL
     {
      CEdit             m_edit_MTS;
      CRadioGroup       m_radio_group_TPSL;
     };

   struct cajaHorario
     {
      CEdit             m_edit_Horario;
      CRadioGroup       m_radioGroup_Horario;
      CSpinEditDouble   m_spin_HoraStart;
      CSpinEditDouble   m_spin_HoraEnd;
      CSpinEditDouble   m_spin_MinutoStart;
      CSpinEditDouble   m_spin_MinutoEnd;
      CLabel            m_label_to;
     };

   struct cajaIncrementoLotaje
     {
      CEdit             m_edit_IL;
      CCheckBox         m_check_incremento;
      CLabel            m_label_lotes;
      CSpinEditDouble   m_spin_double_lotes;
      CLabel            m_label_porcentaje;
      CSpinEditDouble   m_spin_porcentaje;
      CLabel            m_label_MI;
      CRadioGroup       m_radio_MI;
     };

   struct cajaCierreAlFinalizar
     {
      CEdit             m_radio_MI_1;
      CEdit             m_radio_MI_2;
      CRadioGroup       m_radcioGroup_Cierre;
     };

   struct cajaBotonesCierre
     {
      CEdit             m_edit_button_cierre;
      CButton           m_buttons_cierre[5];
     };

   struct cajaPlayReset
     {
      CEdit             m_edit_cajaPlay;
      CButton           m_button_play;
      CButton           m_button_reset;
      CEdit             m_edit_playVerificacion;
     };

private:

   cajaOperacion     caja_Largos;
   cajaOperacion     caja_Cortos;
   cajaModeloEntrada caja_ModeloEntrada;
   cajaModeloTPSL    caja_ModeloTPSL;
   cajaHorario       caja_Horario;
   cajaIncrementoLotaje caja_IncrementoLotaje;
   cajaCierreAlFinalizar caja_CierreAlFinalizar;
   cajaBotonesCierre caja_BotonesCierre;
   cajaPlayReset     caja_PlayReset;

   int               x_start[];
   int               y_start[];
   int               x_end[];
   int               y_end[];

public:
                     CControlsDialog(void);
                    ~CControlsDialog(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

protected:
   void              SacarColumnasFilas(int filas,int columnas,int anchoPanel);
   bool              CrearCajaModeloEntrada();
   bool              CrearCajaModeloSLTP();
   bool              Crearcaja_Horario();
   bool              CrearCajaIncrementoLotaje();
   bool              CrearCajaBotonesCierre();
   bool              CrearCajaCierreAlFinalizar();
   bool              CrearCajaOP(int fila_,cajaOperacion &caja);
   bool              CrearCajaPlayStop();
   void              ActualizarVisualizacionTrades();
   //--- create dependent controls
   /*bool              CreateEdit(void);
   bool              CreateButton1(void);
   bool              CreateButton2(void);
   bool              CreateButton3(void);
   bool              CreateSpinEdit(void);
   bool              CreateDate(void);
   bool              CreateListView(void);
   bool              CreateComboBox(void);
   bool              CreateRadioGroup(void);
   bool              CreateCheckGroup(void);*/
   //--- handlers of the dependent controls events
   /*void              OnClickButton1(void);
   void              OnClickButton2(void);
   void              OnClickButton3(void);
   void              OnChangeSpinEdit(void);
   void              OnChangeDate(void);
   void              OnChangeListView(void);
   void              OnChangeComboBox(void);
   void              OnChangeRadioGroup(void);
   void              OnChangeCheckGroup(void);
   */
  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsDialog)
/*ON_EVENT(ON_CLICK,m_button1,OnClickButton1)
ON_EVENT(ON_CLICK,m_button2,OnClickButton2)
ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
ON_EVENT(ON_CHANGE,m_spin_edit,OnChangeSpinEdit)
ON_EVENT(ON_CHANGE,m_date,OnChangeDate)
ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
ON_EVENT(ON_CHANGE,m_combo_box,OnChangeComboBox)
ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
ON_EVENT(ON_CHANGE,m_check_group,OnChangeCheckGroup)*/
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CControlsDialog::CControlsDialog(void)
  {
   caja_Largos.distincion="LARGOS";
   caja_Cortos.distincion="CORTOS";
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
bool CControlsDialog::Create(const long chart,const string name,const int subwin,const int x1_,const int y1_,const int x2_,const int y2_)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1_,y1_,x2_,y2_))
      return(false);

   int Linea_Espacio=0;

   SacarColumnasFilas(30,2,x2_-x1_);

   if(!CrearCajaModeloEntrada())
      return false;
   if(!CrearCajaModeloSLTP())
      return false;
   if(!Crearcaja_Horario())
      return false;
   if(!CrearCajaIncrementoLotaje())
      return false;
   if(!CrearCajaBotonesCierre())
      return false;
   if(!CrearCajaCierreAlFinalizar())
      return false;
   if(!CrearCajaOP(8,caja_Largos))
      return false;
   if(!CrearCajaOP(15,caja_Cortos))
      return false;
   if(!CrearCajaPlayStop())
      return false;






//--- create dependent controls
//--- succeed
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaModeloEntrada()
  {
   int fila=0;
   int x1,y1,x2,y2;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila];


   if(!caja_ModeloEntrada.m_edit_ME.Create(m_chart_id,"m_name"+"TITULO MODELO DE ENTRADA",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_ModeloEntrada.m_edit_ME))
      return(false);
   caja_ModeloEntrada.m_edit_ME.ReadOnly(true);
   caja_ModeloEntrada.m_edit_ME.TextAlign(ALIGN_CENTER);
   caja_ModeloEntrada.m_edit_ME.ColorBackground(clrGold);
   caja_ModeloEntrada.m_edit_ME.Text("MODELO DE ENTRADA");

   fila=1;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila+2];
//--- create
   if(!caja_ModeloEntrada.m_radio_group_op.Create(m_chart_id,m_name+"RadioGroupOperaciones",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_ModeloEntrada.m_radio_group_op))
      return(false);
//--- fill out with strings
   if(!caja_ModeloEntrada.m_radio_group_op.AddItem("Auto Largos y Cortos",0))
      return(false);
   if(!caja_ModeloEntrada.m_radio_group_op.AddItem("Largos",1))
      return(false);
   if(!caja_ModeloEntrada.m_radio_group_op.AddItem("Cortos",2))
      return(false);
   caja_ModeloEntrada.m_radio_group_op.Value(0);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaModeloSLTP()
  {
   int fila=4;
   int x1,y1,x2,y2;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_ModeloTPSL.m_edit_MTS.Create(m_chart_id,"m_name"+"TITULO MODELOS TP Y SL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_ModeloTPSL.m_edit_MTS))
      return(false);
   caja_ModeloTPSL.m_edit_MTS.ReadOnly(true);
   caja_ModeloTPSL.m_edit_MTS.TextAlign(ALIGN_CENTER);
   caja_ModeloTPSL.m_edit_MTS.ColorBackground(clrGold);
   caja_ModeloTPSL.m_edit_MTS.Text("MODELOS TP Y SL");


   fila=5;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila+3];
//--- create
   if(!caja_ModeloTPSL.m_radio_group_TPSL.Create(m_chart_id,m_name+"RadioGroupTPSL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_ModeloTPSL.m_radio_group_TPSL))
      return(false);
//--- fill out with strings
   if(!caja_ModeloTPSL.m_radio_group_TPSL.AddItem("Drowdawn 0.5-1/1",0))
      return(false);
   if(!caja_ModeloTPSL.m_radio_group_TPSL.AddItem("Drowdawn 1/1",1))
      return(false);
   if(!caja_ModeloTPSL.m_radio_group_TPSL.AddItem("Sin Drowdawn 0.5-1/1",2))
      return(false);
   if(!caja_ModeloTPSL.m_radio_group_TPSL.AddItem("Sin Drowdawn 1/1",3))
      return(false);
   caja_ModeloTPSL.m_radio_group_TPSL.Value(0);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::Crearcaja_Horario()
  {
   int fila=9;
   int x1,y1,x2,y2;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_Horario.m_edit_Horario.Create(m_chart_id,"m_name"+"TITULO HORARIOS",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_edit_Horario))
      return(false);
   caja_Horario.m_edit_Horario.ReadOnly(true);
   caja_Horario.m_edit_Horario.TextAlign(ALIGN_CENTER);
   caja_Horario.m_edit_Horario.ColorBackground(clrGold);
   caja_Horario.m_edit_Horario.Text("HORARIOS");


   fila=10;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila+1];

   if(!caja_Horario.m_radioGroup_Horario.Create(m_chart_id,m_name+"RadioGroupHorario",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_radioGroup_Horario))
      return(false);
//--- fill out with strings
   if(!caja_Horario.m_radioGroup_Horario.AddItem("Todo el dia",0))
      return(false);
   if(!caja_Horario.m_radioGroup_Horario.AddItem("Intervalo",1))
      return(false);

   caja_Horario.m_radioGroup_Horario.Value(0);

   fila=12;

   int mitad=(x_end[0]-x_start[0])/2;
   int gap=30;
   int contenedor=mitad-gap;

   x1=x_start[0];
   x2=x_start[0]+(contenedor/2);
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_Horario.m_spin_HoraStart.Create(m_chart_id,m_name+"Hora Start",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_spin_HoraStart))
      return(false);
//--- fill out with strings
   caja_Horario.m_spin_HoraStart.Value(1);
   caja_Horario.m_spin_HoraStart.MinValue(0);
   caja_Horario.m_spin_HoraStart.MaxValue(23);


   x1=x_start[0]+(contenedor/2);
   x2=x_start[0]+contenedor;
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_Horario.m_spin_MinutoStart.Create(m_chart_id,m_name+"Minutos Start",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_spin_MinutoStart))
      return(false);
//--- fill out with strings
   caja_Horario.m_spin_MinutoStart.Value(30);
   caja_Horario.m_spin_MinutoStart.MinValue(0);
   caja_Horario.m_spin_MinutoStart.MaxValue(59);
   caja_Horario.m_spin_MinutoStart.StepValue(5);



   x1=x_start[0]+mitad+gap;
   x2=x_start[0]+mitad+gap+(contenedor/2);
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_Horario.m_spin_HoraEnd.Create(m_chart_id,m_name+"Hora End",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_spin_HoraEnd))
      return(false);
//--- fill out with strings
   caja_Horario.m_spin_HoraEnd.Value(7);
   caja_Horario.m_spin_HoraEnd.MinValue(0);
   caja_Horario.m_spin_HoraEnd.MaxValue(23);


   x1=x_start[0]+mitad+gap+(contenedor/2);
   x2=x_start[0]+mitad+gap+contenedor;
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_Horario.m_spin_MinutoEnd.Create(m_chart_id,m_name+"Minutos End",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_spin_MinutoEnd))
      return(false);
//--- fill out with strings
   caja_Horario.m_spin_MinutoEnd.Value(30);
   caja_Horario.m_spin_MinutoEnd.MinValue(0);
   caja_Horario.m_spin_MinutoEnd.MaxValue(59);
   caja_Horario.m_spin_MinutoEnd.StepValue(5);

   x1=mitad+1;
   x2=mitad+1;
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_Horario.m_label_to.Create(m_chart_id,m_name+"To",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_Horario.m_label_to))
      return(false);
//--- fill out with strings
   caja_Horario.m_label_to.Text("a");


   return true;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaIncrementoLotaje()
  {
   int fila=0;
   int x1,y1,x2,y2;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_IncrementoLotaje.m_edit_IL.Create(m_chart_id,"m_name"+"INCREMENTO DE LOTAJE",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_edit_IL))
      return(false);
   caja_IncrementoLotaje.m_edit_IL.ReadOnly(true);
   caja_IncrementoLotaje.m_edit_IL.TextAlign(ALIGN_CENTER);
   caja_IncrementoLotaje.m_edit_IL.ColorBackground(clrGold);
   caja_IncrementoLotaje.m_edit_IL.Text("INCREMENTO DE LOTAJE");

   fila=1;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_IncrementoLotaje.m_check_incremento.Create(m_chart_id,m_name+"checkIncremento",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_check_incremento))
      return(false);
//--- fill out with strings
   caja_IncrementoLotaje.m_check_incremento.Text("Incrementar automaticamente");

   fila=2;

   x1=x_start[1];
   x2=x_end[1]-(x_end[1]-x_start[1])/2;
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_IncrementoLotaje.m_label_lotes.Create(m_chart_id,m_name+"Label lotes",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_label_lotes))
      return(false);
//--- fill out with strings
   caja_IncrementoLotaje.m_label_lotes.Text("Empezar con (lotes): ");


   x1=x_start[1]+(x_end[1]-x_start[1])/2+10;
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_IncrementoLotaje.m_spin_double_lotes.Create(m_chart_id,m_name+"value lotes",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_spin_double_lotes))
      return(false);
//--- fill out with strings
   caja_IncrementoLotaje.m_spin_double_lotes.Digits(2);
   caja_IncrementoLotaje.m_spin_double_lotes.Value(0.01);
   caja_IncrementoLotaje.m_spin_double_lotes.StepValue(0.10);
   caja_IncrementoLotaje.m_spin_double_lotes.MinValue(0.01);


   fila=3;

   x1=x_start[1];
   x2=x_end[1]-(x_end[1]-x_start[1])/2;
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_IncrementoLotaje.m_label_porcentaje.Create(m_chart_id,m_name+"Label porcentaje",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_label_porcentaje))
      return(false);
//--- fill out with strings
   caja_IncrementoLotaje.m_label_porcentaje.Text("% de incremento: ");


   x1=x_start[1]+(x_end[1]-x_start[1])/2+10;
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_IncrementoLotaje.m_spin_porcentaje.Create(m_chart_id,m_name+"value porcentaje2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_spin_porcentaje))
      return(false);
   caja_IncrementoLotaje.m_spin_porcentaje.Value(50);
   caja_IncrementoLotaje.m_spin_porcentaje.StepValue(5);
   caja_IncrementoLotaje.m_spin_porcentaje.MinValue(0);


   fila=4;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];
//--- create
   if(!caja_IncrementoLotaje.m_label_MI.Create(m_chart_id,m_name+"Label Modo Incremento",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_label_MI))
      return(false);
//--- fill out with strings
   caja_IncrementoLotaje.m_label_MI.Text("MODO INCREMENTO:");
   caja_IncrementoLotaje.m_label_MI.Font("Comic Sans MS");


   fila=5;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila+2];
//--- create
   if(!caja_IncrementoLotaje.m_radio_MI.Create(m_chart_id,m_name+"Modo de Incremento",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_IncrementoLotaje.m_radio_MI))
      return(false);
//--- fill out with strings
   if(!caja_IncrementoLotaje.m_radio_MI.AddItem("Suave",0))
      return(false);
   if(!caja_IncrementoLotaje.m_radio_MI.AddItem("Medio",1))
      return(false);
   if(!caja_IncrementoLotaje.m_radio_MI.AddItem("Agresivo",2))
      return(false);
   caja_IncrementoLotaje.m_radio_MI.Value(0);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaBotonesCierre()
  {

   int fila=18;
   int x1,y1,x2,y2;


   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_BotonesCierre.m_edit_button_cierre.Create(m_chart_id,"m_name"+"cierre botones",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_BotonesCierre.m_edit_button_cierre))
      return(false);
   caja_BotonesCierre.m_edit_button_cierre.ReadOnly(true);
   caja_BotonesCierre.m_edit_button_cierre.TextAlign(ALIGN_CENTER);
   caja_BotonesCierre.m_edit_button_cierre.ColorBackground(clrGold);
   caja_BotonesCierre.m_edit_button_cierre.Text("BOTONES CIERRE");


   for(int i=0;i<5;i++)
     {
      string comentario="";
      if(i==0)
         comentario="Cerrar Largos";
      else
         if(i==1)
            comentario="Cerrar Cortos";
         else
            if(i==2)
               comentario="Cerrar Todo";
            else
               if(i==3)
                  comentario="Cerrar Todas con Perdida";
               else
                  if(i==4)
                     comentario="Cerrar Todas con Ganancia";


      y1=y_start[fila+i+1];
      y2=y_end[fila+i+1];
      //--- create
      if(!caja_BotonesCierre.m_buttons_cierre[i].Create(m_chart_id,m_name+"boton cierre"+IntegerToString(i),m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(caja_BotonesCierre.m_buttons_cierre[i]))
         return(false);

      caja_BotonesCierre.m_buttons_cierre[i].Text(comentario);
     }


   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaCierreAlFinalizar()
  {

   int x1,y1,x2,y2;
   int  fila=13;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_CierreAlFinalizar.m_radio_MI_1.Create(m_chart_id,"m_name"+"CIERRE AL FINALIZAR 1...",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_CierreAlFinalizar.m_radio_MI_1))
      return(false);
   caja_CierreAlFinalizar.m_radio_MI_1.ReadOnly(true);
   caja_CierreAlFinalizar.m_radio_MI_1.ColorBackground(clrGold);
   caja_CierreAlFinalizar.m_radio_MI_1.Text("CERRAR TODAS LAS");
   caja_CierreAlFinalizar.m_radio_MI_1.TextAlign(ALIGN_CENTER);

   fila=14;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila]-CONTROLS_GAP_Y-1;
   y2=y_end[fila];

   if(!caja_CierreAlFinalizar.m_radio_MI_2.Create(m_chart_id,"m_name"+"CIERRE AL FINALIZAR 2...",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_CierreAlFinalizar.m_radio_MI_2))
      return(false);
   caja_CierreAlFinalizar.m_radio_MI_2.ReadOnly(true);
   caja_CierreAlFinalizar.m_radio_MI_2.ColorBackground(clrGold);
   caja_CierreAlFinalizar.m_radio_MI_2.Text("POSICIONES AL FINALIZAR...");
   caja_CierreAlFinalizar.m_radio_MI_2.TextAlign(ALIGN_CENTER);

/// LINEA 1
   fila=15;

   x1=x_start[0];
   x2=x_end[0];
   y1=y_start[fila];
   y2=y_end[fila+2];
//--- create
   if(!caja_CierreAlFinalizar.m_radcioGroup_Cierre.Create(m_chart_id,m_name+"caja_CierreAlFinalizar.m_radcioGroup_Cierre",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_CierreAlFinalizar.m_radcioGroup_Cierre))
      return(false);
//--- fill out with strings
   caja_CierreAlFinalizar.m_radcioGroup_Cierre.AddItem("el dia",0);
   caja_CierreAlFinalizar.m_radcioGroup_Cierre.AddItem("la semana",1);
   caja_CierreAlFinalizar.m_radcioGroup_Cierre.AddItem("el mes",2);

   caja_CierreAlFinalizar.m_radcioGroup_Cierre.Value(0);


   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaOP(int fila_,cajaOperacion &caja)
  {

   int fila=fila_;
   int x1,y1,x2,y2;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja.titulo.Create(m_chart_id,"m_name"+caja.distincion,m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja.titulo))
      return(false);
   caja.titulo.ReadOnly(true);
   caja.titulo.TextAlign(ALIGN_CENTER);
   caja.titulo.ColorBackground(clrGold);
   caja.titulo.Text(caja.distincion);

   for(int i=0;i<6;i++)
     {
      string comentario="";
      if(i==0)
         comentario="Ganancia: ";
      else
         if(i==1)
            comentario="Perdida: ";
         else
            if(i==2)
               comentario="Ganancia Diaria: ";
            else
               if(i==3)
                  comentario="Perdida Diaria: ";
               else
                  if(i==4)
                     comentario="Trades Abiertos: ";
                  else
                     if(i==5)
                        comentario="Limite de Largos: ";


      x1=x_start[1];
      x2=x_end[1]-(x_end[1]-x_start[1])/2;
      y1=y_start[fila+i+1];
      y2=y_end[fila+i+1];
      //--- create
      if(!caja.subtitulos[i].Create(m_chart_id,m_name+"Label Titulo "+caja.distincion+comentario,m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(caja.subtitulos[i]))
         return(false);
      //--- fill out with strings
      caja.subtitulos[i].Text(comentario);


      x1=x_start[1]+(x_end[1]-x_start[1])/2;
      x2=x_end[1];
      y1=y_start[fila+i+1];
      y2=y_end[fila+i+1];
      if(i!=5)
        {
         if(!caja.valor[i].Create(m_chart_id,m_name+"value caja "+caja.distincion+comentario,m_subwin,x1,y1,x2,y2))
            return(false);
         if(!Add(caja.valor[i]))
            return(false);
         caja.valor[i].Text("0");
         caja.valor[i].TextAlign(ALIGN_CENTER);
        }
      else
        {
         if(!caja.valorSpin.Create(m_chart_id,m_name+"value caja "+caja.distincion+comentario,m_subwin,x1,y1,x2,y2))
            return(false);
         if(!Add(caja.valorSpin))
            return(false);
         caja.valorSpin.Value(1);
         caja.valorSpin.Value(10);
         caja.valorSpin.StepValue(1);
         caja.valorSpin.MinValue(1);
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CrearCajaPlayStop()
  {
   int fila=22;
   int x1,y1,x2,y2;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_PlayReset.m_edit_cajaPlay.Create(m_chart_id,"m_name"+"play reset titulo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_PlayReset.m_edit_cajaPlay))
      return(false);
   caja_PlayReset.m_edit_cajaPlay.ReadOnly(true);
   caja_PlayReset.m_edit_cajaPlay.TextAlign(ALIGN_CENTER);
   caja_PlayReset.m_edit_cajaPlay.ColorBackground(clrGold);
   caja_PlayReset.m_edit_cajaPlay.Text("ACTIVACION BOT");

   fila=23;

   x1=x_start[1];
   x2=x_end[1]-(x_end[1]-x_start[1])/2;
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_PlayReset.m_button_play.Create(m_chart_id,"m_name"+"play button",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_PlayReset.m_button_play))
      return(false);
   caja_PlayReset.m_button_play.Text("Play");
   caja_PlayReset.m_button_play.ColorBackground(clrLime);

   x1=x_start[1]+(x_end[1]-x_start[1])/2;
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_PlayReset.m_edit_playVerificacion.Create(m_chart_id,"m_name"+"play verificacion",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_PlayReset.m_edit_playVerificacion))
      return(false);
   caja_PlayReset.m_edit_playVerificacion.ReadOnly(true);
   caja_PlayReset.m_edit_playVerificacion.TextAlign(ALIGN_CENTER);
   caja_PlayReset.m_edit_playVerificacion.ColorBackground(clrBrown);
   caja_PlayReset.m_edit_playVerificacion.Color(clrWhite);
   caja_PlayReset.m_edit_playVerificacion.Text("Detenido");

   fila=24;

   x1=x_start[1];
   x2=x_end[1];
   y1=y_start[fila];
   y2=y_end[fila];

   if(!caja_PlayReset.m_button_reset.Create(m_chart_id,"m_name"+"reset button",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(caja_PlayReset.m_button_reset))
      return(false);
   caja_PlayReset.m_button_reset.Text("Reset");
   caja_PlayReset.m_button_reset.ColorBackground(clrMediumVioletRed);
   caja_PlayReset.m_button_reset.Color(clrWhite);

   return true;
  }
/*
//+------------------------------------------------------------------+
//| Create the display field                                         |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateEdit(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP;
 int x2=ClientAreaWidth()-INDENT_RIGHT;
 int y2=y1+EDIT_HEIGHT;
//--- create
 if(!m_edit.Create(m_chart_id,m_name+"Edit",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!m_edit.ReadOnly(true))
    return(false);
 if(!Add(m_edit))
    return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "Button1" button                                      |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateButton1(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+BUTTON_WIDTH;
 int y2=y1+BUTTON_HEIGHT;
//--- create
 if(!m_button1.Create(m_chart_id,m_name+"Button1",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!m_button1.Text("Button1"))
    return(false);
 if(!Add(m_button1))
    return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "Button2" button                                      |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateButton2(void)
{
//--- coordinates
 int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+BUTTON_WIDTH;
 int y2=y1+BUTTON_HEIGHT;
//--- create
 if(!m_button2.Create(m_chart_id,m_name+"Button2",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!m_button2.Text("Button2"))
    return(false);
 if(!Add(m_button2))
    return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "Button3" fixed button                                |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateButton3(void)
{
//--- coordinates
 int x1=INDENT_LEFT+2*(BUTTON_WIDTH+CONTROLS_GAP_X);
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+BUTTON_WIDTH;
 int y2=y1+BUTTON_HEIGHT;
//--- create
 if(!m_button3.Create(m_chart_id,m_name+"Button3",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!m_button3.Text("Locked"))
    return(false);
 if(!Add(m_button3))
    return(false);
 m_button3.Locking(true);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "SpinEdit" element                                    |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateSpinEdit(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+(BUTTON_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+EDIT_HEIGHT;
//--- create
 if(!m_spin_edit.Create(m_chart_id,m_name+"SpinEdit",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_spin_edit))
    return(false);
 m_spin_edit.MinValue(10);
 m_spin_edit.MaxValue(1000);
 m_spin_edit.Value(100);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "DatePicker" element                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateDate(void)
{
//--- coordinates
 int x1=INDENT_LEFT+GROUP_WIDTH+2*CONTROLS_GAP_X;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+(BUTTON_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+EDIT_HEIGHT;
//--- create
 if(!m_date.Create(m_chart_id,m_name+"Date",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_date))
    return(false);
 m_date.Value(TimeCurrent());
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "ListView" element                                    |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateListView(void)
{
//--- coordinates
 int x1=INDENT_LEFT+GROUP_WIDTH+2*CONTROLS_GAP_X;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (BUTTON_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+2*CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+LIST_HEIGHT-CONTROLS_GAP_Y;
//--- create
 if(!m_list_view.Create(m_chart_id,m_name+"ListView",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_list_view))
    return(false);
//--- fill out with strings
 for(int i=0;i<16;i++)
    if(!m_list_view.AddItem("Item "+IntegerToString(i)))
       return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "ComboBox" element                                    |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateComboBox(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (BUTTON_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+EDIT_HEIGHT;
//--- create
 if(!m_combo_box.Create(m_chart_id,m_name+"ComboBox",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_combo_box))
    return(false);
//--- fill out with strings
 for(int i=0;i<16;i++)
    if(!m_combo_box.ItemAdd("Item "+IntegerToString(i)))
       return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "RadioGroup" element                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateRadioGroup(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (BUTTON_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+RADIO_HEIGHT;
//--- create
 if(!m_radio_group.Create(m_chart_id,m_name+"RadioGroup",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_radio_group))
    return(false);
//--- fill out with strings
 for(int i=0;i<3;i++)
    if(!m_radio_group.AddItem("Item "+IntegerToString(i),1<<i))
       return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Create the "CheckGroup" element                                  |
//+------------------------------------------------------------------+
bool CControlsDialog::CreateCheckGroup(void)
{
//--- coordinates
 int x1=INDENT_LEFT;
 int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (BUTTON_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (EDIT_HEIGHT+CONTROLS_GAP_Y)+
        (RADIO_HEIGHT+CONTROLS_GAP_Y);
 int x2=x1+GROUP_WIDTH;
 int y2=y1+CHECK_HEIGHT;
//--- create
 if(!m_check_group.Create(m_chart_id,m_name+"CheckGroup",m_subwin,x1,y1,x2,y2))
    return(false);
 if(!Add(m_check_group))
    return(false);
//--- fill out with strings
 for(int i=0;i<5;i++)
    if(!m_check_group.AddItem("Item "+IntegerToString(i),1<<i))
       return(false);
//--- succeed
 return(true);
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton1(void)
{
 m_edit.Text(__FUNCTION__);
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton2(void)
{
 m_edit.Text(__FUNCTION__);
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton3(void)
{
 if(m_button3.Pressed())
    m_edit.Text(__FUNCTION__+"On");
 else
    m_edit.Text(__FUNCTION__+"Off");
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeSpinEdit()
{
 m_edit.Text(__FUNCTION__+" : Value="+IntegerToString(m_spin_edit.Value()));
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeDate(void)
{
 m_edit.Text(__FUNCTION__+" \""+TimeToString(m_date.Value(),TIME_DATE)+"\"");
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeListView(void)
{
 m_edit.Text(__FUNCTION__+" \""+m_list_view.Select()+"\"");
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeComboBox(void)
{
 m_edit.Text(__FUNCTION__+" \""+m_combo_box.Select()+"\"");
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeRadioGroup(void)
{
 m_edit.Text(__FUNCTION__+" : Value="+IntegerToString(m_radio_group.Value()));
}
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeCheckGroup(void)
{
 m_edit.Text(__FUNCTION__+" : Value="+IntegerToString(m_check_group.Value()));
}*/
//+------------------------------------------------------------------+
void CControlsDialog::SacarColumnasFilas(int filas,int columnas,int anchoPanel)
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::ActualizarVisualizacionTrades()
  {
   int Posiciones=PositionsTotal();
   int totalBuys=0;
   int totalSells=0;

   double profitBuys=0;
   double lossBuys=0;
   double profitSells=0;
   double lossSells=0;

   for(int i=0;i<Posiciones;i++)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket==0)
         continue;

      if(Symbol()!=PositionGetString(POSITION_SYMBOL) )
         continue;

      double profit=PositionGetDouble(POSITION_PROFIT);

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         totalBuys++;
         if(profit>=0)
            profitBuys+=profit;
         if(profit<0)
            lossBuys+=profit;
        }
      else
        {
         totalSells++;
         if(profit>=0)
            profitSells+=profit;
         if(profit<0)
            lossSells+=profit;
        }
     }

   caja_Largos.valor[0].Text(DoubleToString(profitBuys,2));
   caja_Cortos.valor[0].Text(DoubleToString(profitSells,2));
   caja_Largos.valor[1].Text(DoubleToString(lossBuys,2));
   caja_Cortos.valor[1].Text(DoubleToString(lossSells,2));
   caja_Largos.valor[4].Text(IntegerToString(totalBuys));
   caja_Cortos.valor[4].Text(IntegerToString(totalSells));
  }
//+------------------------------------------------------------------+
