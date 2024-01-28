//+------------------------------------------------------------------+
//|                                               ControlsDialog.mqh |
//|                             Copyright 2000-2023, MetaQuotes Ltd. |
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
#include <Controls\SpinEditDouble.mqh>
#include <Controls\Label.mqh>
#include<Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
//--- indents and gaps
#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
#define INDENT_RIGHT                        (11)      // indent from right (with allowance for border width)
#define INDENT_BOTTOM                       (11)      // indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      (5)       // gap by X coordinate
#define CONTROLS_GAP_Y                      (8)       // gap by Y coordinate
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

string InpDirectoryName="EXPERTO_CORRELACIONES";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CControlsDialog : public CAppDialog
  {
   struct values_struct
     {
      long            select_symbol_1;
      long            select_symbol_2;
      double         lote_1;
      double         lote_2;
      long            select_type_1;
      long            select_type_2;
      double          value_close;
      double          minBasket;
      double          maxBasket;
      double          acumulado;
     };

private:
   CComboBox         m_combo_box_Simbolo_1;
   CComboBox         m_combo_box_Simbolo_2;
   CSpinEditDouble   m_spin_edit_double_spin_lote_1;
   CSpinEditDouble   m_spin_edit_double_spin_lote_2;
   CLabel            m_label_name_lotes_1;
   CLabel            m_label_name_lotes_2;
   CRadioGroup       m_check_group_tipo_operacion_1;
   CRadioGroup       m_check_group_tipo_operacion_2;

   CLabel            m_label_nombre_close;
   CSpinEditDouble   m_spin_edit_double_valor_close;
   CButton           m_button_update_close;
   CButton           m_button_open;
   CButton           m_button_close;
   CLabel            m_label_name_Basket;
   CEdit             m_edit_valor_Basket;

   CLabel            m_label_nombre_acumulado;
   CSpinEditDouble   m_spin_edit_double_valor_acumulado;
   CButton           m_button_update_acumulado;


   CLabel            m_label_name_minBasket;
   CLabel            m_label_name_maxBasket;
   CEdit             m_edit_value_minBasket;
   CEdit             m_edit_value_maxBasket;

   CComboBox         m_combo_box_Sets;
   CButton           m_button_Load;
   CButton           m_button_Save;

   values_struct     estructura;
   double            value_close;
   double            value_acumulado;
   ulong              tickets[2];

public:
                     CControlsDialog(void);
                    ~CControlsDialog(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   virtual void      SaveParameters(const int reason);

   virtual void      ActualizarBasket();

protected:
   //--- create dependent controls;
   //--- handlers of the dependent controls events
   void              OnChangeComboBox_1(void);
   void              OnChangeComboBox_2(void);
   void              OnLoadSet();
   void              OnSaveSet();
   void              LoadParameters();
   void              VerificarPosicionesExistentes();
   void              OnClickButton_Close();
   void              OnClickButton_Open();
   void              OnClickButton_Update();
   void              OnClickButton_UpdateAcumulado();
   void              OnChangeTipo1();
   void              OnChangeTipo2();
   void              AbrirPosicion(string simbolo,double volumen,long tipo);
  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsDialog)
ON_EVENT(ON_CLICK,m_button_Save,OnSaveSet)
ON_EVENT(ON_CLICK,m_button_Load,OnLoadSet)
ON_EVENT(ON_CLICK,m_button_close,OnClickButton_Close)
ON_EVENT(ON_CLICK,m_button_open,OnClickButton_Open)
ON_EVENT(ON_CLICK,m_button_update_close,OnClickButton_Update)
ON_EVENT(ON_CLICK,m_button_update_acumulado,OnClickButton_UpdateAcumulado)
ON_EVENT(ON_CHANGE,m_check_group_tipo_operacion_1,OnChangeTipo1)
ON_EVENT(ON_CHANGE,m_check_group_tipo_operacion_2,OnChangeTipo2)
/*
ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
ON_EVENT(ON_CHANGE,m_spin_edit,OnChangeSpinEdit)
ON_EVENT(ON_CHANGE,m_date,OnChangeDate)
ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)*/
ON_EVENT(ON_CHANGE,m_combo_box_Simbolo_1,OnChangeComboBox_1)
ON_EVENT(ON_CHANGE,m_combo_box_Simbolo_2,OnChangeComboBox_2)
/*
ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
ON_EVENT(ON_CHANGE,m_check_group_tipo_operacion_1,OnChangeRadioGroup)*/
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
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
//| Create                                                           |
//+------------------------------------------------------------------+
bool CControlsDialog::Create(const long chart,const string name,const int subwin,const int x1_,const int y1_,const int x2_,const int y2_)
  {

   if(!CAppDialog::Create(chart,name,subwin,x1_,y1_,x2_,y2_))
      return(false);
//--- create dependent controls
   int ClientAreaWidth=x2_-x1_-8;
   int Calculo0=int((((ClientAreaWidth)-INDENT_LEFT*2)-CONTROLS_GAP_X*1)/2);
   int Calculo0_0=int((Calculo0)/2);
   int Calculo0_1=int((Calculo0)/2);

   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_1=(Calculo0+CONTROLS_GAP_X)*1;
   int GAP0_0_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP0_0_1=GAP0_0+(int(Calculo0/2)*1);
   int GAP0_1_0=GAP0_1+(int(Calculo0/2)*0);
   int GAP0_1_1=GAP0_1+(int(Calculo0/2)*1);


///////////////////LINEA 0
   int Linea_Espacio=0;
   int x1=INDENT_LEFT+GAP0_0  ;
   int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   int x2=x1+Calculo0   ;
   int y2=y1+EDIT_HEIGHT;
   if(!m_combo_box_Simbolo_1.Create(m_chart_id,"m_name"+"Simbolo_1",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_combo_box_Simbolo_1))
      return(false);

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_combo_box_Simbolo_2.Create(m_chart_id,"m_name"+"Simbolo_2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_combo_box_Simbolo_2))
      return(false);
   for(int i=0; i<SymbolsTotal(true); i++)
     {
      m_combo_box_Simbolo_1.AddItem(SymbolName(i,true),i+1);
      m_combo_box_Simbolo_2.AddItem(SymbolName(i,true),i+1);
     }
   m_combo_box_Simbolo_1.SelectByValue(1);
   m_combo_box_Simbolo_2.SelectByValue(1);

///////////////////LINEA 1
   Linea_Espacio=1;
   x1=INDENT_LEFT+GAP0_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_name_lotes_1.Create(m_chart_id,"m_name"+"name_lotes_1",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_name_lotes_1))
      return(false);
   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_spin_edit_double_spin_lote_1.Create(m_chart_id,"m_name"+"m_spin_edit_double_spin_lote_1",m_subwin,x1-25,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_double_spin_lote_1))
      return(false);
   x1=INDENT_LEFT+GAP0_1_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_name_lotes_2.Create(m_chart_id,"m_name"+"name_lotes_2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_name_lotes_2))
      return(false);
   x1=INDENT_LEFT+GAP0_1_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_spin_edit_double_spin_lote_2.Create(m_chart_id,"m_name"+"m_spin_edit_double_spin_lote_2",m_subwin,x1-25,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_double_spin_lote_2))
      return(false);

   m_spin_edit_double_spin_lote_1.Value(0.001);
   m_spin_edit_double_spin_lote_2.Value(0.001);
   m_label_name_lotes_1.Text("Lots: ");
   m_label_name_lotes_2.Text("Lots: ");
   m_label_name_lotes_1.Color(clrBlue);
   m_label_name_lotes_2.Color(clrBlue);

///////////////////LINEA 2
   Linea_Espacio=2;
   x1=INDENT_LEFT+GAP0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT*2;
   if(!m_check_group_tipo_operacion_1.Create(m_chart_id,"m_name"+"tipo_operacion_1",m_subwin,x1,y1,x2,y2))
      return(false);
   m_check_group_tipo_operacion_1.AddItem("Buy",1);
   m_check_group_tipo_operacion_1.AddItem("Sell",2);
   m_check_group_tipo_operacion_1.Value(1);

   if(!Add(m_check_group_tipo_operacion_1))
      return(false);

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT*2;
   if(!m_check_group_tipo_operacion_2.Create(m_chart_id,"m_name"+"tipo_operacion_2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_group_tipo_operacion_2))
      return(false);
   m_check_group_tipo_operacion_2.AddItem("Buy",1);
   m_check_group_tipo_operacion_2.AddItem("Sell",2);
   m_check_group_tipo_operacion_2.Value(2);


///////////////////LINEA 4 (2)
   Linea_Espacio=4;
   x1=INDENT_LEFT+GAP0_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_nombre_close.Create(m_chart_id,"m_name"+"nombre_close",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_nombre_close))
      return(false);
   m_label_nombre_close.Text("Close at: ");

   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_spin_edit_double_valor_close.Create(m_chart_id,"m_name"+"valor_close",m_subwin,x1-15,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_double_valor_close))
      return(false);

   m_spin_edit_double_valor_close.StepValue(0.01);
   m_spin_edit_double_valor_close.Digits(2);
   m_spin_edit_double_valor_close.Value(100);
   m_spin_edit_double_valor_close.MinValue(0.01);
   value_close=100;

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_update_close.Create(m_chart_id,"m_name"+"update_close",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_update_close))
      return(false);
   m_button_update_close.Text("Update ("+DoubleToString(100,2)+")");


///////////////////LINEA 5
   Linea_Espacio=5;
   x1=INDENT_LEFT+GAP0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_open.Create(m_chart_id,"m_name"+"open",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_open))
      return(false);
   m_button_open.Text("OPEN");
   m_button_open.ColorBackground(clrLimeGreen);

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_close.Create(m_chart_id,"m_name"+"close",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_close))
      return(false);
   m_button_close.Text("CLOSE");
   m_button_close.ColorBackground(clrIndianRed);

///////////////////LINEA 4
   Linea_Espacio=6;
   x1=INDENT_LEFT+GAP0_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_nombre_acumulado.Create(m_chart_id,"m_name"+"nombre_acumulado",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_nombre_acumulado))
      return(false);
   m_label_nombre_acumulado.Text("Acumulado: ");

   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_spin_edit_double_valor_acumulado.Create(m_chart_id,"m_name"+"valor_acumulado",m_subwin,x1-15,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_double_valor_acumulado))
      return(false);

   m_spin_edit_double_valor_acumulado.StepValue(0.01);
   m_spin_edit_double_valor_acumulado.Digits(2);
   m_spin_edit_double_valor_acumulado.Value(0);
   m_spin_edit_double_valor_acumulado.MinValue(0.00);
   value_acumulado=0;

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_update_acumulado.Create(m_chart_id,"m_name"+"update_acumulado",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_update_acumulado))
      return(false);
   m_button_update_acumulado.Text("Update ("+DoubleToString(0,2)+")");

///////////////////LINEA 6

   Linea_Espacio=8;
   x1=INDENT_LEFT+GAP0_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_name_minBasket.Create(m_chart_id,"m_name"+"nombre_minBascket",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_name_minBasket))
      return(false);
   m_label_name_minBasket.Text("Min Bascket");


   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_value_minBasket.Create(m_chart_id,"m_edit"+"value_minBascket",m_subwin,x1+5,y1,x2,y2))
      return(false);
   if(!Add(m_edit_value_minBasket))
      return(false);
   m_edit_value_minBasket.Text("0.00");
   m_edit_value_minBasket.TextAlign(ALIGN_RIGHT);
   m_edit_value_minBasket.ReadOnly(true);


   x1=INDENT_LEFT+GAP0_1_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_name_maxBasket.Create(m_chart_id,"m_name"+"nombre_maxBascket",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_name_maxBasket))
      return(false);
   m_label_name_maxBasket.Text("Max Bascket");

   x1=INDENT_LEFT+GAP0_1_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1  ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_value_maxBasket.Create(m_chart_id,"m_edit"+"value_maxBascket",m_subwin,x1+5,y1,x2,y2))
      return(false);
   if(!Add(m_edit_value_maxBasket))
      return(false);

   m_edit_value_maxBasket.Text("0.00");
   m_edit_value_maxBasket.TextAlign(ALIGN_RIGHT);
   m_edit_value_maxBasket.ReadOnly(true);

///////////////////LINEA 7
   Linea_Espacio=9;
   x1=INDENT_LEFT+GAP0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_name_Basket.Create(m_chart_id,"m_name"+"name_Basket",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_name_Basket))
      return(false);
   m_label_name_Basket.Text("Pair Basket: ");

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_valor_Basket.Create(m_chart_id,"m_name"+"valor_Basket",m_subwin,x1-70,y1,x2,y2))
      return(false);
   if(!Add(m_edit_valor_Basket))
      return(false);
   m_edit_valor_Basket.TextAlign(ALIGN_CENTER);
   m_edit_valor_Basket.ReadOnly(true);

///////////////////LINEA 7

   Linea_Espacio=11;
   int Calculo03=int((((ClientAreaWidth)-INDENT_LEFT*2)-CONTROLS_GAP_X*2)/3);


   int GAP0_03=(Calculo03+CONTROLS_GAP_X)*0;
   int GAP0_13=(Calculo03+CONTROLS_GAP_X)*1;
   int GAP0_23=(Calculo03+CONTROLS_GAP_X)*2;


   x1=INDENT_LEFT+GAP0_03  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo03   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_combo_box_Sets.Create(m_chart_id,"m_name"+"Sets",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_combo_box_Sets))
      return(false);

   for(int i=0; i<10; i++)
      m_combo_box_Sets.AddItem("Set "+IntegerToString(i+1),i+1);
   m_combo_box_Sets.SelectByValue(1);



   x1=INDENT_LEFT+GAP0_13  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo03   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_Load.Create(m_chart_id,"m_name"+"Load",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_Load))
      return(false);
   m_button_Load.Text("Load");
   m_button_Load.ColorBackground(clrCrimson);
   m_button_Load.Color(clrWhite);

   x1=INDENT_LEFT+GAP0_23  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo03   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_Save.Create(m_chart_id,"m_name"+"Save",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_Save))
      return(false);
   m_button_Save.Text("Save");
   m_button_Save.ColorBackground(clrMagenta);
   m_button_Save.Color(clrWhite);

///////////////////////////////////////////////////////////////

   trade.SetExpertMagicNumber(ChartID());
   LoadParameters();
   OnChangeComboBox_1();
   OnChangeComboBox_2();
   VerificarPosicionesExistentes();

   return(true);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
/*
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
*/
void CControlsDialog::OnChangeComboBox_1(void)
  {
   string Simbolo=m_combo_box_Simbolo_1.Select();
   double spinStep=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
   double spinMax=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX);
   double spinMin=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN);

   int digitos=0;
   if(spinStep==0.001)
      digitos=3;
   if(spinStep==0.01)
      digitos=2;
   if(spinStep==0.1)
      digitos=1;
   if(spinStep==1)
      digitos=0;

   m_spin_edit_double_spin_lote_1.Digits(digitos);
   m_spin_edit_double_spin_lote_1.StepValue(spinStep);

   double lote=m_spin_edit_double_spin_lote_1.Value();
   double valorActualD=lote/spinStep;
   int valorActualI=int(valorActualD);

   if(valorActualD-valorActualI>0.000000)
      lote=NormalizeDouble(valorActualD*spinStep,digitos);

   if(lote>spinMax)
      lote=spinMax;
   if(lote<spinMin)
      lote=spinMin;

   m_spin_edit_double_spin_lote_1.Value(lote);
   m_spin_edit_double_spin_lote_1.MaxValue(spinMax);
   m_spin_edit_double_spin_lote_1.MinValue(spinMin);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeComboBox_2(void)
  {
   string Simbolo=m_combo_box_Simbolo_2.Select();
   double spinStep=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
   double spinMax=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX);
   double spinMin=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN);

   int digitos=0;
   if(spinStep==0.001)
      digitos=3;
   if(spinStep==0.01)
      digitos=2;
   if(spinStep==0.1)
      digitos=1;
   if(spinStep==1)
      digitos=0;

   m_spin_edit_double_spin_lote_2.Digits(digitos);
   m_spin_edit_double_spin_lote_2.StepValue(spinStep);

   double lote=m_spin_edit_double_spin_lote_2.Value();
   double valorActualD=lote/spinStep;
   int valorActualI=int(valorActualD);

   if(valorActualD-valorActualI>0.000000)
      lote=NormalizeDouble(valorActualD*spinStep,digitos);

   if(lote>spinMax)
      lote=spinMax;
   if(lote<spinMin)
      lote=spinMin;

   m_spin_edit_double_spin_lote_2.Value(lote);
   m_spin_edit_double_spin_lote_2.MaxValue(spinMax);
   m_spin_edit_double_spin_lote_2.MinValue(spinMin);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::SaveParameters(const int reason)
  {
   if(reason==REASON_CHARTCHANGE || reason==REASON_CLOSE)
     {
      estructura.lote_1=m_spin_edit_double_spin_lote_1.Value();
      estructura.lote_2=m_spin_edit_double_spin_lote_2.Value();
      estructura.select_symbol_1=m_combo_box_Simbolo_1.Value();
      estructura.select_symbol_2=m_combo_box_Simbolo_2.Value();
      estructura.select_type_1=m_check_group_tipo_operacion_1.Value();
      estructura.select_type_2=m_check_group_tipo_operacion_2.Value();
      estructura.value_close=value_close;
      estructura.maxBasket=StringToDouble(m_edit_value_maxBasket.Text());
      estructura.minBasket=StringToDouble(m_edit_value_minBasket.Text());
      estructura.acumulado=value_acumulado;

      int file_handle=FileOpen(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
      if(file_handle!=INVALID_HANDLE)
        {
         PrintFormat("El archivo %s está abierto para la escritura",IntegerToString(ChartID()));
         PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
         //--- preparamos el contador del número de bytes
         uint counter=0;
         //--- escribimos los valores del array usando el ciclo
         uint byteswritten=FileWriteStruct(file_handle,estructura);

         FileClose(file_handle);
         PrintFormat("Datos escritos, archivo %s cerrado",IntegerToString(ChartID()));
        }
      else
         PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",IntegerToString(ChartID()),GetLastError());
     }
   else
      if(FileIsExist(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_COMMON))
         FileDelete(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_COMMON);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::LoadParameters(void)
  {
   bool carga=false;
   int file_handle=FileOpen(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_READ|FILE_BIN|FILE_COMMON);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("Archivo %s abierto para la lectura",IntegerToString(ChartID()));
      PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
      //--- leemos los datos desde el archivo
      while(!FileIsEnding(file_handle))
        {
         //--- escribimos los datos en el array
         FileReadStruct(file_handle,estructura);
         carga=true;
         //--- comprobamos si el array está sobrecargado
        }
      //--- cerramos el archivo
      FileClose(file_handle);
      PrintFormat("Datos leídos, archivo %s cerrado",IntegerToString(ChartID()));
     }
     
   if(carga)
     {
      m_spin_edit_double_spin_lote_1.Value(estructura.lote_1);
      m_spin_edit_double_spin_lote_2.Value(estructura.lote_2);

      m_combo_box_Simbolo_1.SelectByValue(estructura.select_symbol_1);
      m_combo_box_Simbolo_2.SelectByValue(estructura.select_symbol_2);

      m_check_group_tipo_operacion_1.Value(estructura.select_type_1);
      m_check_group_tipo_operacion_2.Value(estructura.select_type_2);

      m_spin_edit_double_valor_close.Value(estructura.value_close);

      m_edit_value_maxBasket.Text(DoubleToString(estructura.maxBasket,2));
      m_edit_value_minBasket.Text(DoubleToString(estructura.minBasket,2));

      value_close=estructura.value_close;
      m_spin_edit_double_valor_acumulado.Value(estructura.value_close);
      m_button_update_close.Text("Update ("+DoubleToString(value_close,2)+")");


      m_spin_edit_double_valor_acumulado.Value(estructura.acumulado);
      value_acumulado=estructura.acumulado;
      m_button_update_acumulado.Text("Update ("+DoubleToString(value_acumulado,2)+")");
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnLoadSet(void)
  {

   long set=m_combo_box_Sets.Value();
   if(MessageBox("Deseas cargar el Set "+IntegerToString(set)+" ?","Cargar Set?",MB_YESNO|MB_ICONQUESTION)==IDYES)
     {
      bool carga=false;
      int file_handle=FileOpen(InpDirectoryName+"//"+"set"+IntegerToString(set),FILE_READ|FILE_BIN|FILE_COMMON);
      if(file_handle!=INVALID_HANDLE)
        {
         PrintFormat("Archivo %s abierto para la lectura","set"+IntegerToString(set));
         PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
         //--- leemos los datos desde el archivo
         while(!FileIsEnding(file_handle))
           {
            //--- escribimos los datos en el array
            FileReadStruct(file_handle,estructura);
            carga=true;
            //--- comprobamos si el array está sobrecargado
           }
         //--- cerramos el archivo
         FileClose(file_handle);
         PrintFormat("Datos leídos, archivo %s cerrado","set"+IntegerToString(set));
        }
      else
        {
         Alert("No hay configuracion guardada en el set ",IntegerToString(set));
         return;
        }

      if(carga)
        {
         m_spin_edit_double_spin_lote_1.Value(estructura.lote_1);
         m_spin_edit_double_spin_lote_2.Value(estructura.lote_2);

         m_combo_box_Simbolo_1.SelectByValue(estructura.select_symbol_1);
         m_combo_box_Simbolo_2.SelectByValue(estructura.select_symbol_2);

         m_check_group_tipo_operacion_1.Value(estructura.select_type_1);
         m_check_group_tipo_operacion_2.Value(estructura.select_type_2);

         m_spin_edit_double_valor_close.Value(estructura.value_close);
         value_close=estructura.value_close;
         m_button_update_close.Text("Update ("+DoubleToString(value_close,2)+")");

         OnChangeComboBox_1();
         OnChangeComboBox_2();
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnSaveSet(void)
  {
   long set=m_combo_box_Sets.Value();
   if(MessageBox("Deseas guardar la configuracion en el Set "+IntegerToString(set)+" ?","Guardar Set?",MB_YESNO|MB_ICONQUESTION)==IDYES)
     {
      estructura.lote_1=m_spin_edit_double_spin_lote_1.Value();
      estructura.lote_2=m_spin_edit_double_spin_lote_2.Value();
      estructura.select_symbol_1=m_combo_box_Simbolo_1.Value();
      estructura.select_symbol_2=m_combo_box_Simbolo_2.Value();
      estructura.select_type_1=m_check_group_tipo_operacion_1.Value();
      estructura.select_type_2=m_check_group_tipo_operacion_2.Value();
      estructura.value_close=value_close;

      int file_handle=FileOpen(InpDirectoryName+"//"+"set"+IntegerToString(set),FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
      if(file_handle!=INVALID_HANDLE)
        {
         PrintFormat("El archivo %s está abierto para la escritura","set"+IntegerToString(set));
         PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
         //--- preparamos el contador del número de bytes
         uint counter=0;
         //--- escribimos los valores del array usando el ciclo
         uint byteswritten=FileWriteStruct(file_handle,estructura);

         FileClose(file_handle);
         PrintFormat("Datos escritos, archivo %s cerrado","set"+IntegerToString(set));
        }
      else
         PrintFormat("Fallo al abrir el archivo %s, Código del error = %d","set"+IntegerToString(set),GetLastError());

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton_Update(void)
  {
   value_close=m_spin_edit_double_valor_close.Value();
   m_button_update_close.Text("Update ("+DoubleToString(value_close,2)+")");
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton_UpdateAcumulado(void)
  {
   value_acumulado=m_spin_edit_double_valor_acumulado.Value();
   m_button_update_acumulado.Text("Update ("+DoubleToString(value_acumulado,2)+")");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton_Close(void)
  {
   if(MessageBox("Deseas cerrar las operaciones?","Confirmacion",MB_YESNO|MB_ICONQUESTION)==IDYES)
     {
      for(int i=0; i<2; i++)
        {
         if(PositionSelectByTicket(tickets[i]))
            trade.PositionClose(tickets[i],-1);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButton_Open(void)
  {
   bool HayOperaciones=false;

   for(int i=0; i<2; i++)
     {
      if(PositionSelectByTicket(tickets[i]))
         HayOperaciones=true;
     }

   if(!HayOperaciones)
     {
      if(MessageBox("Deseas abrir las operaciones?","Confirmacion",MB_YESNO|MB_ICONQUESTION)==IDYES)
        {
         if(SymbolInfoDouble(m_combo_box_Simbolo_1.Select(),SYMBOL_VOLUME_MIN)>m_spin_edit_double_spin_lote_1.Value())
           {
            Alert("Lotaje en  ",m_combo_box_Simbolo_1.Select()," no esta permitido");
            return;
           }
         if(SymbolInfoDouble(m_combo_box_Simbolo_2.Select(),SYMBOL_VOLUME_MIN)>m_spin_edit_double_spin_lote_2.Value())
           {
            Alert("Lotaje en  ",m_combo_box_Simbolo_2.Select()," no esta permitido");
            return;
           }


         AbrirPosicion(m_combo_box_Simbolo_1.Select(),m_spin_edit_double_spin_lote_1.Value(),m_check_group_tipo_operacion_1.Value());
         AbrirPosicion(m_combo_box_Simbolo_2.Select(),m_spin_edit_double_spin_lote_2.Value(),m_check_group_tipo_operacion_2.Value());
         VerificarPosicionesExistentes();

         m_edit_value_maxBasket.Text(DoubleToString(0,2));
         m_edit_value_minBasket.Text(DoubleToString(0,2));
        }
     }
   else
      Alert("Para abrir nuevas operaciones se tiene que cerrar las operaciones actuales");

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeTipo1(void)
  {
   m_check_group_tipo_operacion_2.Value(m_check_group_tipo_operacion_1.Value()==1?2:1);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeTipo2(void)
  {
   m_check_group_tipo_operacion_1.Value(m_check_group_tipo_operacion_2.Value()==1?2:1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::VerificarPosicionesExistentes(void)
  {
   int posiciones=0;
   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
        {
         if(ChartID()!=PositionGetInteger(POSITION_MAGIC))
            continue;

         tickets[posiciones]=ticket;
         posiciones++;
         if(posiciones>=2)
            break;
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::ActualizarBasket(void)
  {
   double valorBasket=0;
   for(int i=0; i<2; i++)
     {
      if(PositionSelectByTicket(tickets[i]))
         valorBasket+=(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP));
     }
   m_edit_valor_Basket.Text(DoubleToString(valorBasket,2));

   double min=StringToDouble(m_edit_value_minBasket.Text());
   double max=StringToDouble(m_edit_value_maxBasket.Text());

   if(valorBasket<min)
      m_edit_value_minBasket.Text(DoubleToString(valorBasket,2));

   if(valorBasket>max)
      m_edit_value_maxBasket.Text(DoubleToString(valorBasket,2));


   if(valorBasket>=value_close)
      for(int i=0; i<2; i++)
        {
         if(PositionSelectByTicket(tickets[i]))
            trade.PositionClose(tickets[i],-1);
        }
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::AbrirPosicion(string simbolo,double volumen,long tipo)
  {

   if(tipo==1)
     {
      if(!trade.Buy(volumen,simbolo,SymbolInfoDouble(simbolo,SYMBOL_ASK),0,0,IntegerToString(ChartID())))
         Alert("Error al abrir : ",GetLastError()," codigo ",trade.ResultRetcode());
     }
   else
      if(tipo==2)
        {
         if(!trade.Sell(volumen,simbolo,SymbolInfoDouble(simbolo,SYMBOL_BID),0,0,IntegerToString(ChartID())))
            Alert("Error al abrir : ",GetLastError()," codigo ",trade.ResultRetcode());
        }
  }
//+------------------------------------------------------------------+
