//+------------------------------------------------------------------+
//|                                          ControlExpertBuffer.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

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
#define EDIT_HEIGHT                         (20)      // size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         (150)     // size by X coordinate
#define LIST_HEIGHT                         (179)     // size by Y coordinate
#define RADIO_HEIGHT                        (56)      // size by Y coordinate
#define CHECK_HEIGHT                        (93)      // size by Y coordinate
//+------------------------------------------------------------------+
//| Class CControlsExpertBuffer                                            |
//| Usage: main dialog of the Controls application                   |
//+------------------------------------------------------------------+
class CControlsExpertBuffer : public CAppDialog
  {
   struct IndicatorsHandle
     {
      int            handlesIndicator;
      string         nameIndicator;
     };

   struct Configuration_Indicador
     {
      bool           buy;
      int            bufferBuy;
      bool           sell;
      int            bufferSell;
      long           indiceIndicator;
     };

   struct Conf_Trade
     {
      int            StopLoss;
      int            TakeProfit;
      double         Volumen;
      string         Comentario;
      int            MagicNumber;
     };
   struct Conf_Testing
     {
      int            handleTesting;
      int            tBufferSell;
      int            tBufferBuy;
     };

private:

   CLabel            m_label_Indicador1;
   CComboBox         m_combo_box_handle1;
   CCheckGroup       m_check_group_checkBuy;
   CSpinEdit         m_spin_edit_SPINBUY;
   CCheckGroup       m_check_group_checkSell;
   CSpinEdit         m_spin_edit_SPINSELL;
   CButton           m_button_START;

   IndicatorsHandle  Ind[];
   int               IndicadoresTotal;
   Configuration_Indicador conf_Indicador;
   Conf_Trade        conf_trade;
   Conf_Testing      conf_testing;

public:
                     CControlsExpertBuffer(void);
                    ~CControlsExpertBuffer(void);
   //--- create
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- chart event handler
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

   virtual void      ConfigurarTrade(double Volumen,int StopLoss,int TakeProfit,string Comentario,int MagicNumber);

   virtual void      ConfigurarTesting(int &handleTest,int bBuyTesting,int bSellTesting);

   virtual void      OnTimer_();

   virtual void      OnDeinit_();

   virtual void      OnTick_();

protected:
   void              OnClickButtonStart(void);
   void              FunctionComprobarCambioIndicadores(void);
   void              ActualiceHandles(void);
   void              OnChangeSpinBuy(void);
   void              OnChangeSpinSell(void);
   void              OnChangeCheckBuy(void);
   void              OnChangeCheckSell(void);
   void              OnChangeComboBoxIndicator(void);
  };
//+------------------------------------------------------------------+
//| Event Handling                                                   |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CControlsExpertBuffer)
ON_EVENT(ON_CHANGE,m_spin_edit_SPINBUY,OnChangeSpinBuy)
ON_EVENT(ON_CHANGE,m_spin_edit_SPINSELL,OnChangeSpinSell)
ON_EVENT(ON_CHANGE,m_check_group_checkBuy,OnChangeCheckBuy)
ON_EVENT(ON_CHANGE,m_check_group_checkSell,OnChangeCheckSell)
ON_EVENT(ON_CHANGE,m_combo_box_handle1,OnChangeComboBoxIndicator)
/*
ON_EVENT(ON_CLICK,m_button1,OnClickButton1)
ON_EVENT(ON_CLICK,m_button2,OnClickButton2)
ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
ON_EVENT(ON_CHANGE,m_spin_edit,OnChangeSpinEdit)
ON_EVENT(ON_CHANGE,m_date,OnChangeDate)
ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
ON_EVENT(ON_CHANGE,m_combo_box,OnChangeComboBox)
ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
ON_EVENT(ON_CHANGE,m_check_group,OnChangeCheckGroup)
*/
ON_EVENT(ON_CLICK,m_button_START,OnClickButtonStart)
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CControlsExpertBuffer::CControlsExpertBuffer(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CControlsExpertBuffer::~CControlsExpertBuffer(void)
  {
  }
//+------------------------------------------------------------------+
//| Create                                                           |
//+------------------------------------------------------------------+
bool CControlsExpertBuffer::Create(const long chart,const string name,const int subwin,const int x1_,const int y1_,const int x2_,const int y2_)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1_,y1_,x2_,y2_))
      return(false);

   IndicadoresTotal=0;

   int SizeRect=(((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*1);
   int Calculo0=int(SizeRect/2);
   int Calculo0_0=int((Calculo0)/2);
   int Calculo0_1=int((Calculo0)/2);


   int GAP0_0=(Calculo0+CONTROLS_GAP_X)*0;
   int GAP0_0_0=GAP0_0+(int(Calculo0/2)*0);
   int GAP0_0_1=GAP0_0+(int(Calculo0/2)*1);
   int GAP0_1=(Calculo0+CONTROLS_GAP_X)*1;
   int GAP0_1_0=GAP0_1+(int(Calculo0/2)*0);
   int GAP0_1_1=GAP0_1+(int(Calculo0/2)*1);


   int Linea_Espacio=0;
   int x1=INDENT_LEFT+GAP0_0_0  ;
   int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   int x2=x1+Calculo0_0   ;
   int y2=y1+EDIT_HEIGHT;
   if(!m_label_Indicador1.Create(m_chart_id,"m_name"+"Indicador1",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_label_Indicador1.Text("Indicador 1"))
      return(false);
   if(!Add(m_label_Indicador1))
      return(false);

   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=INDENT_LEFT+(ClientAreaWidth())-INDENT_LEFT*2   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_combo_box_handle1.Create(m_chart_id,"m_name"+"handle1",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_combo_box_handle1))
      return(false);


   Linea_Espacio=1;
   x1=INDENT_LEFT+GAP0_0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_check_group_checkBuy.Create(m_chart_id,"m_name"+"checkBuy",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_group_checkBuy))
      return(false);
   x1=INDENT_LEFT+GAP0_0_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_0   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_check_group_checkBuy.AddItem("Buy",1))
      return(false);


   if(!m_spin_edit_SPINBUY.Create(m_chart_id,"m_name"+"SPINBUY",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_SPINBUY))
      return(false);

   m_spin_edit_SPINBUY.MinValue(0);
   m_spin_edit_SPINBUY.MaxValue(20);
   m_spin_edit_SPINBUY.Value(0);

   x1=INDENT_LEFT+GAP0_1_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1   ;
   y2=y1+EDIT_HEIGHT;

   if(!m_check_group_checkSell.Create(m_chart_id,"m_name"+"checkSell",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_check_group_checkSell))
      return(false);
   x1=INDENT_LEFT+GAP0_1_1  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+Calculo0_1   ;
   y2=y1+EDIT_HEIGHT;
   if(!m_check_group_checkSell.AddItem("Sell",1))
      return(false);

   if(!m_spin_edit_SPINSELL.Create(m_chart_id,"m_name"+"SPINSELL",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!Add(m_spin_edit_SPINSELL))
      return(false);

   m_spin_edit_SPINSELL.MinValue(0);
   m_spin_edit_SPINSELL.MaxValue(20);
   m_spin_edit_SPINSELL.Value(0);

   Linea_Espacio=2;
   x1=INDENT_LEFT+GAP0_0  ;
   y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y)*Linea_Espacio;
   x2=x1+(((ClientAreaWidth())-INDENT_LEFT*2)-CONTROLS_GAP_X*0);
   y2=y1+EDIT_HEIGHT;
   if(!m_button_START.Create(m_chart_id,"m_name"+"START",m_subwin,x1,y1,x2,y2))
      return(false);

   if(!m_button_START.Text("START"))
      return(false);
   m_button_START.Locking(true);
   if(!Add(m_button_START))
      return(false);
   m_button_START.ColorBackground(clrLightSteelBlue);



 if(MQLInfoInteger(MQL_TESTER))
  Minimize();
//--- create dependent controls
   /*if(!CreateEdit())
      return(false);
   if(!CreateButton1())
      return(false);
   if(!CreateButton2())
      return(false);
   if(!CreateButton3())
      return(false);*/
//if(!CreateSpinEdit())
// return(false);
//if(!CreateListView())
// return(false);
   /*if(!CreateDate())
      return(false);*/
// if(!CreateRadioGroup())
//   return(false);
//if(!CreateCheckGroup())
// return(false);
//if(!CreateComboBox())
// return(false);
//--- succeed
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnClickButtonStart(void)
  {
   bool error=false;
   if(m_button_START.Pressed())
     {
      if(m_combo_box_handle1.Value()!=9223372036854775807)
        {
         conf_Indicador.indiceIndicator=m_combo_box_handle1.Value();
         bool sell=m_check_group_checkSell.Value()==1;
         bool buy=m_check_group_checkBuy.Value()==1;
         conf_Indicador.buy=buy;
         conf_Indicador.sell=sell;

         if(!sell && !buy)
           {
            Alert("Debe de seleccionar algun tipo de OPERACION buy o sell");
            error=true;
           }
         else
           {
            if(buy)
               conf_Indicador.bufferBuy=m_spin_edit_SPINBUY.Value();
            if(sell)
               conf_Indicador.bufferSell=m_spin_edit_SPINSELL.Value();
           }
        }
      else
        {
         Alert("Debe de seleccionar algun Indicador");
         error=true;
        }
     }

   if(error)
      m_button_START.Pressed(false);
   else
     {
      m_combo_box_handle1.Disable();
      m_check_group_checkBuy.Disable();
      m_check_group_checkSell.Disable();
     }

   if(m_button_START.Pressed())
      m_button_START.ColorBackground(clrLime);
   else
      m_button_START.ColorBackground(clrLightSteelBlue);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnChangeSpinBuy(void)
  {
   if(m_button_START.Pressed())
      m_spin_edit_SPINBUY.Value(conf_Indicador.bufferBuy);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnChangeSpinSell(void)
  {
   if(m_button_START.Pressed())
      m_spin_edit_SPINSELL.Value(conf_Indicador.bufferSell);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnChangeCheckBuy(void)
  {
   if(m_button_START.Pressed())
      m_check_group_checkBuy.Check(0,conf_Indicador.buy);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnChangeCheckSell(void)
  {
   if(m_button_START.Pressed())
      m_check_group_checkSell.Check(0,conf_Indicador.sell);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnChangeComboBoxIndicator(void)
  {
   if(m_button_START.Pressed())
      m_combo_box_handle1.Select((int)conf_Indicador.indiceIndicator);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnTimer_(void)
  {
   FunctionComprobarCambioIndicadores();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::FunctionComprobarCambioIndicadores(void)
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
void CControlsExpertBuffer::ActualiceHandles(void)
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
   m_combo_box_handle1.ItemsClear();

   for(int i=0; i<ArraySize(Ind); i++)
      m_combo_box_handle1.ItemAdd(Ind[i].nameIndicator);

   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnDeinit_(void)
  {
   m_spin_edit_SPINBUY.Value(m_spin_edit_SPINBUY.Value()+1);
   m_spin_edit_SPINSELL.Value(m_spin_edit_SPINSELL.Value()+1);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::OnTick_(void)
  {
   double ValorBuy[3];
   double ValorSell[3];

   static int BarsLast=iBars(Symbol(),PERIOD_CURRENT);
   int BarsActual= iBars(Symbol(),PERIOD_CURRENT);

   if(m_button_START.Pressed())
     {
      if(BarsActual!=BarsLast)
         if(BarsCalculated(Ind[conf_Indicador.indiceIndicator].handlesIndicator)==BarsActual)
           {
            if(CopyBuffer(Ind[conf_Indicador.indiceIndicator].handlesIndicator,conf_Indicador.bufferBuy,0,3,ValorBuy)>0 &&
               CopyBuffer(Ind[conf_Indicador.indiceIndicator].handlesIndicator,conf_Indicador.bufferSell,0,3,ValorSell)>0)
              {
               double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
               double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);


               if(conf_Indicador.buy)
                 {
                  double SL=conf_trade.StopLoss?0:ASK-conf_trade.StopLoss*Point();
                  double TP=conf_trade.TakeProfit?0:ASK+conf_trade.TakeProfit*Point();

                  if(ValorBuy[1]!=EMPTY_VALUE && ValorBuy[1]!=0)
                     if(trade.Buy(conf_trade.Volumen,Symbol(),ASK,SL,TP,conf_trade.Comentario)==false)
                        Print("ERROR OPEN BUY ",trade.ResultRetcode());
                 }
               if(conf_Indicador.sell)
                 {
                  double SL=conf_trade.StopLoss?0:BID+conf_trade.StopLoss*Point();
                  double TP=conf_trade.TakeProfit?0:BID-conf_trade.TakeProfit*Point();

                  if(ValorSell[1]!=EMPTY_VALUE && ValorSell[1]!=0)
                     if(trade.Sell(conf_trade.Volumen,Symbol(),BID,SL,TP,conf_trade.Comentario)==false)
                        Print("ERROR OPEN SELL ",trade.ResultRetcode());
                 }
               BarsLast=BarsActual;
              }
           }
     }



   if(MQLInfoInteger(MQL_TESTER))
     {
      if(BarsActual!=BarsLast)
         if(BarsCalculated(conf_testing.handleTesting)==BarsActual)
           {
            if(CopyBuffer(conf_testing.handleTesting,conf_testing.tBufferBuy,0,3,ValorBuy)>0 &&
               CopyBuffer(conf_testing.handleTesting,conf_testing.tBufferSell,0,3,ValorSell)>0)
              {

               double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
               double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);

               if(ValorBuy[1]!=EMPTY_VALUE && ValorBuy[1]!=0)
                  Comment(ValorBuy[1],"   ",ValorSell[1]);

               if(ValorSell[1]!=EMPTY_VALUE && ValorSell[1]!=0)
                  Comment(ValorBuy[1],"   ",ValorSell[1]);

               if(true)
                 {
                  double SL=conf_trade.StopLoss?0:ASK-conf_trade.StopLoss*Point();
                  double TP=conf_trade.TakeProfit?0:ASK+conf_trade.TakeProfit*Point();

                  if(ValorBuy[1]!=EMPTY_VALUE && ValorBuy[1]!=0)
                     if(trade.Buy(conf_trade.Volumen,Symbol(),ASK,SL,TP,conf_trade.Comentario)==false)
                        Print("ERROR OPEN BUY ",trade.ResultRetcode());
                 }
               if(true)
                 {
                  double SL=conf_trade.StopLoss?0:BID+conf_trade.StopLoss*Point();
                  double TP=conf_trade.TakeProfit?0:BID-conf_trade.TakeProfit*Point();

                  if(ValorSell[1]!=EMPTY_VALUE && ValorSell[1]!=0)
                     if(trade.Sell(conf_trade.Volumen,Symbol(),BID,SL,TP,conf_trade.Comentario)==false)
                        Print("ERROR OPEN SELL ",trade.ResultRetcode());
                 }
               BarsLast=BarsActual;
              }
           }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::ConfigurarTrade(double Volumen,int StopLoss,int TakeProfit,string Comentario,int MagicNumber)
  {
   conf_trade.Volumen=Volumen;
   conf_trade.StopLoss=StopLoss;
   conf_trade.TakeProfit=TakeProfit;
   conf_trade.Comentario=Comentario;
   conf_trade.MagicNumber=MagicNumber;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CControlsExpertBuffer::ConfigurarTesting(int &handleTest,int bBuyTesting,int bSellTesting)
  {
   conf_testing.tBufferBuy=bBuyTesting;
   conf_testing.tBufferSell=bSellTesting;
   conf_testing.handleTesting=handleTest;
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
