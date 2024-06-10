//+------------------------------------------------------------------+
//|                                               BalanceHistory.mqh |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
class BalanceHistory
  {
   datetime          tiempoInicio;
   double            balance_history;

   string            Boton_Reinicio;
   string            Edit_TiempoInicio;
   string            Edit_BalanceActual;
   int               OrdersHistory;
   string            nameObjectSubfix;

   int               numeroMagico;
   string            simbolo;
private:
public:
                     BalanceHistory(void);
                    ~BalanceHistory(void);
   //ONINIT
   void                OnInit_(string NameSubfix,int x,int y,int numeroMagico_,string simbolo_);
   //ONTIK OR ONTIMER
   void                ActualizarBalance();
   //ONDEINIT
   void                OnDeinit_(const int reason);
   //ONCHARTEVEN
   void              OnChartEvent_(const int id,         // Event ID
                                   const long& lparam,   // Parameter of type long event
                                   const double& dparam, // Parameter of type double event
                                   const string& sparam  // Parameter of type string events
                                  );
   //ADICIONALES
   double              GetBalance() {return balance_history;}
   datetime            GetTiempoInicio() {return tiempoInicio;}
   void                ReiniciarTiempo(void);
   // priority for mouse click
protected:
   void              RecorrerOrdenesCerradas(int total,int indice);
   bool              EditCreate(const long             chart_ID=0,               // chart's ID
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
                                const long             z_order=0);

   bool              ButtonCreate(const long              chart_ID=0,               // chart's ID
                                  const string            name="Button",            // button name
                                  const int               sub_window=0,             // subwindow index
                                  const int               x=0,                      // X coordinate
                                  const int               y=0,                      // Y coordinate
                                  const int               width=50,                 // button width
                                  const int               height=18,                // button height
                                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                                  const string            text="Button",            // text
                                  const string            font="Arial",             // font
                                  const int               font_size=10,             // font size
                                  const color             clr=clrBlack,             // text color
                                  const color             back_clr=C'236,233,216',  // background color
                                  const color             border_clr=clrNONE,       // border color
                                  const bool              state=false,              // pressed/released
                                  const bool              back=false,               // in the background
                                  const bool              selection=false,          // highlight to move
                                  const bool              hidden=true,              // hidden in the object list
                                  const long              z_order=0);                // priority for mouse click

  };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
BalanceHistory::BalanceHistory(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
BalanceHistory::~BalanceHistory(void)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BalanceHistory::ReiniciarTiempo()
  {
   tiempoInicio=TimeCurrent();
   ObjectSetString(0,Edit_TiempoInicio,OBJPROP_TEXT,TimeToString(tiempoInicio,TIME_DATE|TIME_MINUTES));
   balance_history=AccountBalance();
   ObjectSetString(0,Edit_BalanceActual,OBJPROP_TEXT,DoubleToString(balance_history,2));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BalanceHistory::ActualizarBalance()
  {
   int OrdersHistoryActual=OrdersHistoryTotal();

   if(OrdersHistoryActual!=OrdersHistory)
     {
      RecorrerOrdenesCerradas(OrdersHistoryActual,OrdersHistory);
      OrdersHistory=OrdersHistoryActual;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BalanceHistory::RecorrerOrdenesCerradas(int total,int indice)
  {
   for(int i=total-1; i>=indice; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
         if(OrderCloseTime()!=0)
           {
            if(OrderCloseTime()<tiempoInicio)
               break;
            if((numeroMagico==-1 || OrderMagicNumber()==numeroMagico) && (simbolo==NULL || simbolo==OrderSymbol()))
               balance_history+=(OrderProfit()+OrderSwap()+OrderCommission());
           }
     }
   ObjectSetString(0,Edit_BalanceActual,OBJPROP_TEXT,DoubleToString(balance_history,2));
   ChartRedraw();
  }
//+------------------------------------------------------------------+
void BalanceHistory::OnInit_(string NameSubfix,int x,int y,int numeroMagico_,string simbolo_)
  {
   nameObjectSubfix=NameSubfix;
   Edit_TiempoInicio=nameObjectSubfix+"Tiempo";
   Edit_BalanceActual=nameObjectSubfix+"Balance";
   Boton_Reinicio=nameObjectSubfix+"Reinicio";
   numeroMagico=numeroMagico_;
   simbolo=simbolo_;

   tiempoInicio=TimeCurrent();
   balance_history=AccountInfoDouble(ACCOUNT_BALANCE);

   int width=120;
   if(ObjectFind(0,Edit_BalanceActual)!=0)
      EditCreate(0,Edit_BalanceActual,0,x,y,width+width*0,20,DoubleToString(balance_history,2),"Arial",10,ALIGN_CENTER,true,CORNER_LEFT_UPPER,clrWhite,clrBlue,clrWhite,false,false,true,0);

   if(ObjectFind(0,Edit_TiempoInicio)!=0)
      EditCreate(0,Edit_TiempoInicio,0,x+width*1+3,y,width,20,TimeToString(tiempoInicio,TIME_DATE|TIME_MINUTES),"Arial",10,ALIGN_CENTER,true,CORNER_LEFT_UPPER,clrWhite,clrBlue,clrWhite,false,false,true,0);
   else
      tiempoInicio=StringToTime(ObjectGetString(0,Edit_TiempoInicio,OBJPROP_TEXT,0));
   if(ObjectFind(0,Boton_Reinicio)!=0)
      ButtonCreate(0,Boton_Reinicio,0,x+width*2+6,y,width,20,CORNER_LEFT_UPPER,"REINICIO","Arial",10,clrWhite,clrGreen,clrNONE);


   OrdersHistory=OrdersHistoryTotal();

   RecorrerOrdenesCerradas(OrdersHistory,0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   BalanceHistory::OnChartEvent_(const int id,         // Event ID
                                     const long& lparam,   // Parameter of type long event
                                     const double& dparam, // Parameter of type double event
                                     const string& sparam  // Parameter of type string events
                                    )
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
      if(sparam==Boton_Reinicio)
        {
         if(MessageBox("Deseas reinciar los datos al Balance Actual?","Balance actual",MB_YESNO|MB_ICONQUESTION)==IDYES)
            ReiniciarTiempo();
         ObjectSetInteger(0,Boton_Reinicio,OBJPROP_STATE,false);
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BalanceHistory::OnDeinit_(const int reason)
  {
   if(!(reason==REASON_CLOSE || reason==REASON_CHARTCHANGE))
      ObjectsDeleteAll(0,nameObjectSubfix,0,-1);
  }

//+------------------------------------------------------------------+
bool BalanceHistory::EditCreate(const long             chart_ID=0,               // chart's ID
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
bool BalanceHistory::ButtonCreate(const long              chart_ID=0,               // chart's ID
                                  const string            name="Button",            // button name
                                  const int               sub_window=0,             // subwindow index
                                  const int               x=0,                      // X coordinate
                                  const int               y=0,                      // Y coordinate
                                  const int               width=50,                 // button width
                                  const int               height=18,                // button height
                                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                                  const string            text="Button",            // text
                                  const string            font="Arial",             // font
                                  const int               font_size=10,             // font size
                                  const color             clr=clrBlack,             // text color
                                  const color             back_clr=C'236,233,216',  // background color
                                  const color             border_clr=clrNONE,       // border color
                                  const bool              state=false,              // pressed/released
                                  const bool              back=false,               // in the background
                                  const bool              selection=false,          // highlight to move
                                  const bool              hidden=true,              // hidden in the object list
                                  const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ",GetLastError());
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
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
