//+------------------------------------------------------------------+
//|                                           ControlsPanelTrade.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
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
#include<Trade\Trade.mqh>

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
#define BUTTON_HEIGHT                       (30)      // size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         (30)      // size by Y coordinate
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
private:
   CLabel            m_label_Simbolo;
   CLabel            m_label_Total;
   CLabel            m_label_LVolumen;
   CEdit             m_edit_NVolumen;
   CLabel            m_label_LPos;
   CEdit             m_edit_NPos;
   CLabel            m_label_LStopLoss;
   CEdit             m_edit_NStopLoss;
   CLabel            m_label_LTakeProfit;
   CEdit             m_edit_NTakeProfit;
   CButton           m_button_BotonBUY;
   CButton           m_button_BotonSELL;
   CButton           m_button_ModificarSL;
   CButton           m_button_ModificarTP;
   CButton           m_button_CerrarPositivas;
   CButton           m_button_CerrarNegativas;
   CButton           m_button_CerrarTodo;

public:
                     CControlsDialog(void);
                    ~CControlsDialog(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2,int TP_,int SL_,double Volumen_,int Posiciones_,int MagicNumber_,bool SoloBot);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   virtual void      ActualizarPosiciones(int Pos);

protected:
   //--- create dependent controls
   int               Posiciones;
   double            Volumen;
   int               StopLoss;
   int               TakeProfit;
   CTrade            TradePanel;
   bool               Contar_Posiciones_del_Bot_;
   int               MagicNumber__;

   /*bool              CreateEdit(void);
    bool              CreateButton1(void);
    bool              CreateButton2(void);
    bool              CreateButton3(void);
    bool              CreateSpinEdit(void);
    bool              CreateDate(void);
    bool              CreateListView(void);
    bool              CreateComboBox(void);
    bool              CreateRadioGroup(void);
    bool              CreateCheckGroup(void);
   */
   //--- handlers of the dependent controls events
   void              OnClickButtonSELL(void);
   void              OnClickButtonBUY(void);
   void              OnClickButtonCERRAR_NEGATIVAS(void);
   void              OnClickButtonCERRAR_POSITIVAS(void);
   void              OnClickButtonCERRAR_TODAS(void);
   void              OnClickButtonMODIFICAR_SL(void);
   void              OnClickButtonMODIFICAR_TP(void);

   void              OnChangeEditStopLoss(void);
   void              OnChangeEditTakeProfit(void);
   void              OnChangeEditVolumen(void);
   void              OnChangeEditPosiciones(void);

  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsDialog)
ON_EVENT(ON_CLICK,m_button_BotonSELL,OnClickButtonSELL)
ON_EVENT(ON_CLICK,m_button_BotonBUY,OnClickButtonBUY)
ON_EVENT(ON_CLICK,m_button_CerrarNegativas,OnClickButtonCERRAR_NEGATIVAS)
ON_EVENT(ON_CLICK,m_button_CerrarPositivas,OnClickButtonCERRAR_POSITIVAS)
ON_EVENT(ON_CLICK,m_button_CerrarTodo,OnClickButtonCERRAR_TODAS)
ON_EVENT(ON_CLICK,m_button_ModificarSL,OnClickButtonMODIFICAR_TP)
ON_EVENT(ON_CLICK,m_button_ModificarTP,OnClickButtonMODIFICAR_SL)

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ON_EVENT(ON_END_EDIT,m_edit_NStopLoss,OnChangeEditStopLoss)
ON_EVENT(ON_END_EDIT,m_edit_NTakeProfit,OnChangeEditTakeProfit)
ON_EVENT(ON_END_EDIT,m_edit_NVolumen,OnChangeEditVolumen)
ON_EVENT(ON_END_EDIT,m_edit_NPos,OnChangeEditPosiciones)
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
bool CControlsDialog::Create(const long chart,const string name,const int subwin,const int x1_,const int y1_,const int x2_,const int y2_,int TP_,int SL_,double Volumen_,int Posiciones_,int MagicNumber_,bool SoloBot)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1_,y1_,x2_,y2_))
      return(false);

   Volumen=Volumen_;
   TakeProfit=TP_;
   StopLoss=SL_;
   Volumen=Volumen_;

   TradePanel.SetExpertMagicNumber(MagicNumber_);
   Contar_Posiciones_del_Bot_=SoloBot;
   MagicNumber__=MagicNumber_;
//--- create dependent controls

   int Calculo01=int((((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1));
   int Calculo0=int((((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1)/2);
   int Calculo1=Calculo0;
   int Calculo1_0=int((Calculo0)/2);
   int Calculo1_1=int((Calculo0)/2);


   int Calculo2=Calculo0;
   int Calculo2_0=int((Calculo2)/2);
   int Calculo2_1=int((Calculo2)/2);

   int Calculo3=int((Calculo01)/2);
   int Calculo4=int((Calculo01)/2);
   int Calculo5=int((Calculo01)/2);

   int Calculo6=int((Calculo01)/1);


   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_1=(Calculo0+CONTROLS_GAP_X)*1;

   int GAP1_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP1_0_0=GAP1_0+(int(Calculo1/2)*0);
   int GAP1_0_1=GAP1_0+(int(Calculo1/2)*1);

   int GAP1_1=GAP1_0_1+(int(Calculo0/2)*1)+CONTROLS_GAP_X;
   int GAP1_1_0=GAP1_1+(int(Calculo1/2)*0);
   int GAP1_1_1=GAP1_1+(int(Calculo1/2)*1);




   int GAP2_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP2_0_0=GAP2_0+(int(Calculo2/2)*0);
   int GAP2_0_1=GAP2_0+(int(Calculo2/2)*1);

   int GAP2_1=GAP2_0_1+(int(Calculo0/2)*1)+CONTROLS_GAP_X;
   int GAP2_1_0=GAP2_1+(int(Calculo2/2)*0);
   int GAP2_1_1=GAP2_1+(int(Calculo2/2)*1);


   int GAP3_0=GAP0_0+(int(Calculo01/2)*0);
   int GAP3_1=GAP0_0+(int(Calculo01/2)*1)+CONTROLS_GAP_X;

   int GAP4_0=GAP0_0+(int(Calculo01/2)*0);
   int GAP4_1=GAP0_0+(int(Calculo01/2)*1)+CONTROLS_GAP_X;

   int GAP5_0=GAP0_0+(int(Calculo01/2)*0);
   int GAP5_1=GAP0_0+(int(Calculo01/2)*1)+CONTROLS_GAP_X;

   int GAP6_0=GAP0_0+(int(Calculo0/1)*0);


   int Linea_Espacio=0;
   int x1=INDENT_LEFT+GAP0_0  ;
   int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   int x2=x1+Calculo0   ;
   int y2=y1+EDIT_HEIGHT;
   if(!m_label_Simbolo.Create(m_chart_id,"m_name"+"Simbolo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_Simbolo))
      return(false);
   m_label_Simbolo.Text(Symbol());

   x1=INDENT_LEFT+GAP0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_Total.Create(m_chart_id,"m_name"+"Total",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_Total))
      return(false);
   m_label_Total.Text("Total: 0");


   Linea_Espacio=1;
   x1=INDENT_LEFT+GAP1_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo1_0   ;
   y2=y1+EDIT_HEIGHT;

   if(!m_label_LVolumen.Create(m_chart_id,"m_name"+"LVolumen",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_LVolumen))
      return(false);
   m_label_LVolumen.Text("Volumen : ");


   x1=INDENT_LEFT+GAP1_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo1_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_NVolumen.Create(m_chart_id,"m_name"+"NVolumen",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NVolumen))
      return(false);
   m_edit_NVolumen.Text(DoubleToString(Volumen,2));
   m_edit_NVolumen.TextAlign(ALIGN_CENTER);


   x1=INDENT_LEFT+GAP1_1_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo1_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_LPos.Create(m_chart_id,"m_name"+"LPos",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_LPos))
      return(false);
   m_label_LPos.Text("Posiciones");


   x1=INDENT_LEFT+GAP1_1_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo1_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_NPos.Create(m_chart_id,"m_name"+"NPos",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NPos))
      return(false);
   m_edit_NPos.Text(IntegerToString(Posiciones));
   m_edit_NPos.TextAlign(ALIGN_CENTER);

   Linea_Espacio=2;
   x1=INDENT_LEFT+GAP2_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo2_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_LStopLoss.Create(m_chart_id,"m_name"+"LStopLoss",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_LStopLoss))
      return(false);
   m_label_LStopLoss.Text("StopLoss");


   x1=INDENT_LEFT+GAP2_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo2_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_NStopLoss.Create(m_chart_id,"m_name"+"NStopLoss",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NStopLoss))
      return(false);
   m_edit_NStopLoss.Text(IntegerToString(StopLoss));
   m_edit_NStopLoss.TextAlign(ALIGN_CENTER);

   x1=INDENT_LEFT+GAP2_1_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo2_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_label_LTakeProfit.Create(m_chart_id,"m_name"+"LTakeProfit",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_label_LTakeProfit))
      return(false);
   m_label_LTakeProfit.Text("TakeProfit");

   x1=INDENT_LEFT+GAP2_1_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo2_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_edit_NTakeProfit.Create(m_chart_id,"m_name"+"NTakeProfit",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_edit_NTakeProfit))
      return(false);
   m_edit_NTakeProfit.Text(IntegerToString(TakeProfit));
   m_edit_NTakeProfit.TextAlign(ALIGN_CENTER);

   Linea_Espacio=3;
   x1=INDENT_LEFT+GAP3_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo3   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_BotonBUY.Create(m_chart_id,"m_name"+"BotonBUY",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_BotonBUY))
      return(false);
   m_button_BotonBUY.Text("BUY");
   m_button_BotonBUY.ColorBackground(clrGreen);


   x1=INDENT_LEFT+GAP3_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo3   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_BotonSELL.Create(m_chart_id,"m_name"+"BotonSELL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_BotonSELL))
      return(false);
   m_button_BotonSELL.Text("SELL");
    m_button_BotonSELL.ColorBackground(clrRed);


   Linea_Espacio=4;
   x1=INDENT_LEFT+GAP4_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo4   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_ModificarSL.Create(m_chart_id,"m_name"+"ModificarSL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_ModificarSL))
      return(false);
   m_button_ModificarSL.Text("Modificar SL");


   x1=INDENT_LEFT+GAP4_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo4   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_ModificarTP.Create(m_chart_id,"m_name"+"ModificarTP",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_ModificarTP))
      return(false);
   m_button_ModificarTP.Text("Modificar TP");

   Linea_Espacio=5;
   x1=INDENT_LEFT+GAP5_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo5   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_CerrarPositivas.Create(m_chart_id,"m_name"+"CerrarPositivas",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_CerrarPositivas))
      return(false);
   m_button_CerrarPositivas.Text("Cerrar Positivas");


   x1=INDENT_LEFT+GAP5_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo5   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_CerrarNegativas.Create(m_chart_id,"m_name"+"CerrarNegativas",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_CerrarNegativas))
      return(false);
   m_button_CerrarNegativas.Text("Cerrar Negativas");


   Linea_Espacio=6;
   x1=INDENT_LEFT+GAP6_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo6+CONTROLS_GAP_X   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_button_CerrarTodo.Create(m_chart_id,"m_name"+"CerrarTodo",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_button_CerrarTodo))
      return(false);
   m_button_CerrarTodo.Text("Cerrar todas las posiciones");


//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::ActualizarPosiciones(int Pos)
  {
   Posiciones=Pos;
   m_label_Total.Text("Total: "+IntegerToString(Posiciones));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonBUY(void)
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);

   for(int i=0; i<Posiciones; i++)
      TradePanel.Buy(Volumen,Symbol(),Ask,Ask-Points*StopLoss,Ask+Points*TakeProfit);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonSELL(void)
  {

   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);

   for(int i=0; i<Posiciones; i++)
      TradePanel.Sell(Volumen,Symbol(),Bid,Bid+Points*StopLoss,Bid-Points*TakeProfit);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonCERRAR_NEGATIVAS(void)
  {
   int Total=PositionsTotal();

   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(Contar_Posiciones_del_Bot_ && PositionGetInteger(POSITION_MAGIC)!=MagicNumber__)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(PositionGetDouble(POSITION_PROFIT)<0)
         TradePanel.PositionClose(Ticket,-1);

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonCERRAR_POSITIVAS(void)
  {
   int Total=PositionsTotal();

   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(Contar_Posiciones_del_Bot_ && PositionGetInteger(POSITION_MAGIC)!=MagicNumber__)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(PositionGetDouble(POSITION_PROFIT)>0)
         TradePanel.PositionClose(Ticket,-1);

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonCERRAR_TODAS(void)
  {
   int Total=PositionsTotal();

   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(Contar_Posiciones_del_Bot_ && PositionGetInteger(POSITION_MAGIC)!=MagicNumber__)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      TradePanel.PositionClose(Ticket,-1);

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonMODIFICAR_SL(void)
  {
   int Total=PositionsTotal();

   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(Contar_Posiciones_del_Bot_ && PositionGetInteger(POSITION_MAGIC)!=MagicNumber__)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      double Entrada=PositionGetDouble(POSITION_PRICE_OPEN);
      double Points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         TradePanel.PositionModify(Ticket,Entrada-Points*TakeProfit,PositionGetDouble(POSITION_TP));
      else
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            TradePanel.PositionModify(Ticket,Entrada+Points*TakeProfit,PositionGetDouble(POSITION_TP));

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnClickButtonMODIFICAR_TP(void)
  {

   int Total=PositionsTotal();

   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(Contar_Posiciones_del_Bot_ && PositionGetInteger(POSITION_MAGIC)!=MagicNumber__)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      double Entrada=PositionGetDouble(POSITION_PRICE_OPEN);
      double Points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         TradePanel.PositionModify(Ticket,PositionGetDouble(POSITION_SL),Entrada+Points*TakeProfit);
      else
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            TradePanel.PositionModify(Ticket,PositionGetDouble(POSITION_SL),Entrada-Points*TakeProfit);

     }

//m_edit.Text(__FUNCTION__);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeEditPosiciones(void)
  {

   string Valor=m_edit_NPos.Text();

   if(!VerificarInt(Valor))
      m_edit_NPos.Text(IntegerToString(Posiciones));
   else
      Posiciones=(int)StringToInteger(Valor);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeEditStopLoss(void)
  {
   string Valor=m_edit_NStopLoss.Text();

   if(!VerificarInt(Valor))
      m_edit_NStopLoss.Text(IntegerToString(StopLoss));
   else
      StopLoss=(int)StringToInteger(Valor);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeEditTakeProfit(void)
  {

   string Valor=m_edit_NTakeProfit.Text();

   if(!VerificarInt(Valor))
      m_edit_NTakeProfit.Text(IntegerToString(TakeProfit));
   else
      TakeProfit=(int)StringToInteger(Valor);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsDialog::OnChangeEditVolumen(void)
  {
   string Valor=m_edit_NVolumen.Text();

   if(!VerificarDouble(Valor))
      m_edit_NVolumen.Text(DoubleToString(Volumen));
   else
     {
      double V=StringToDouble(Valor);
      if(VerificarLoteValido(V,Symbol()))
        {
         Volumen=V;
         m_edit_NVolumen.Text(DoubleToString(Volumen));
        }
     }
  }
//+------------------------------------------------------------------+
bool VerificarLoteValido(double &Lote,string Simbolo_)
  {
   double Lots=Lote;

   if(SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_STEP)!=0)
     {
      double Lote_Step=NormalizeDouble(Lots/SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_STEP),2);
      int Lote_Step_int=int(Lots/SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_STEP));

      if((Lote_Step-Lote_Step_int)>0)
        {
         Lots=Lote_Step_int*SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_STEP);
         Alert("Redondeando al Lote mas cercano permitido");
        }
     }

   if(Lots<SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_MIN))
     {
      Alert("Lote supera el Maximo Permitido igualando al Maximo");
      Lots=SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_MIN);
     }

   if(Lots>SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_MAX))
     {
      Alert("Lote es inferior el Minimo Permitido igualando al Minimo");
      Lots=SymbolInfoDouble(Simbolo_,SYMBOL_VOLUME_MAX);
     }

   Lote=Lots;
   return true;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarVacio(string Texto)
  {
   int Vacio=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);
      if(CHAR!=' ')
         return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarDouble(string Texto)
  {
   int Punto=0;
   int Numero=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if((CHAR>'9' || CHAR<'0') && CHAR!='.' && CHAR!=' ')
         return false;

      if(CHAR=='.')
         Punto++;

      if(Punto>1)
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarInt(string Texto)
  {
   int Numero=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if((CHAR>'9' || CHAR<'0') && CHAR!=' ')
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ModificarTexto(string Texto)
  {

   string TextoS="";
   int Vacio=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);
      if(CHAR!=' ')
         TextoS=TextoS+CharToString((char)CHAR);
     }
   return TextoS;
  }
//+------------------------------------------------------------------+
