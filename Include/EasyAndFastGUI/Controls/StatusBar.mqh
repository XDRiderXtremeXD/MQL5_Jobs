//+------------------------------------------------------------------+
//|                                                    StatusBar.mqh |
//|                        Copyright 2015, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include "Element.mqh"
#include "Window.mqh"
#include "SeparateLine.mqh"
//+------------------------------------------------------------------+
//| Class for creating the status bar                                |
//+------------------------------------------------------------------+
class CStatusBar : public CElement
  {
private:
   //--- Pointer to the form to which the element is attached
   CWindow           *m_wnd;
   //--- Object for creating a button
   CRectLabel        m_area;
   CEdit             m_items[];
   CSeparateLine     m_sep_line[];
   //--- Properties:
   //    Arrays for unique properties
   int               m_width[];
   //--- (1) Color of the background and (2) background frame
   color             m_area_color;
   color             m_area_border_color;
   //--- Text color
   color             m_label_color;
   //--- Priority of the left mouse button click
   int               m_zorder;
   //--- Colors for separation lines
   color             m_sepline_dark_color;
   color             m_sepline_light_color;
   //---
public:
                     CStatusBar(void);
                    ~CStatusBar(void);
   //--- Methods for creating the status bar
   bool              CreateStatusBar(const long chart_id,const int subwin,const int x,const int y);
   //---
private:
   bool              CreateArea(void);
   bool              CreateItems(void);
   bool              CreateSeparateLine(const int line_number,const int x,const int y);
   //---
public:
   //--- (1) Stores the form pointer, (2) number of items,
   void              WindowPointer(CWindow &object)                   { m_wnd=::GetPointer(object);   }
   int               ItemsTotal(void)                           const { return(::ArraySize(m_items)); }
   //--- Color of (1) the background, (2) the background frame and (3) the text
   void              AreaColor(const color clr)                       { m_area_color=clr;             }
   void              AreaBorderColor(const color clr)                 { m_area_border_color=clr;      }
   void              LabelColor(const color clr)                      { m_label_color=clr;            }
   //--- Colors of the separation lines
   void              SeparateLineDarkColor(const color clr)           { m_sepline_dark_color=clr;     }
   void              SeparateLineLightColor(const color clr)          { m_sepline_light_color=clr;    }

   //--- Adds the item with specified properties before creating the status bar
   void              AddItem(const int width);
   //--- Setting the value at the specified index
   void              ValueToItem(const int index,const string value);
   //---
public:
   //--- Chart event handler
   virtual void      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam) {}
   //--- Timer
   virtual void      OnEventTimer(void) {}
   //--- Moving the element
   virtual void      Moving(const int x,const int y);
   //--- (1) Show, (2) hide, (3) reset, (4) delete
   virtual void      Show(void);
   virtual void      Hide(void);
   virtual void      Reset(void);
   virtual void      Delete(void);
   //--- (1) Set, (2) reset priorities of the left mouse button press
   virtual void      SetZorders(void);
   virtual void      ResetZorders(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CStatusBar::CStatusBar(void) : m_area_color(C'240,240,240'),
   m_area_border_color(clrSilver),
   m_label_color(clrBlack),
   m_sepline_dark_color(C'160,160,160'),
   m_sepline_light_color(clrWhite)
  {
//--- Store the name of the element class in the base class
   CElement::ClassName(CLASS_NAME);
//--- Set priorities of the left mouse button click
   m_zorder=2;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CStatusBar::~CStatusBar(void)
  {
  }
//+------------------------------------------------------------------+
//| Creates the status bar                                           |
//+------------------------------------------------------------------+
bool CStatusBar::CreateStatusBar(const long chart_id,const int subwin,const int x,const int y)
  {
//--- Leave, if there is no form pointer
   if(::CheckPointer(m_wnd)==POINTER_INVALID)
     {
      ::Print(__FUNCTION__," > Before creating a status bar, the class must be passed "
              "the form pointer: CStatusBar::WindowPointer(CWindow &object).");
      return(false);
     }
//--- Initializing variables
   m_id       =m_wnd.LastId()+1;
   m_chart_id =chart_id;
   m_subwin   =subwin;
   m_x        =x;
   m_y        =y;
//--- Margins from the edge
   CElement::XGap(m_x-m_wnd.X());
   CElement::YGap(m_y-m_wnd.Y());
//--- Creates the status bar
   if(!CreateArea())
      return(false);
   if(!CreateItems())
      return(false);
//--- Hide the element if the window is minimized
   if(m_wnd.IsMinimized())
      Hide();
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the common area                                          |
//+------------------------------------------------------------------+
bool CStatusBar::CreateArea(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_statusbar_bg_"+(string)CElement::Id();
//--- Coordinates and width of the background
   int x=m_x;
   int y=m_y;
//m_x_size=(m_x_size<1)? m_wnd.XSize()-2 : m_x_size;
   m_x_size=m_wnd.XSize()-2 ;

//--- Set the background of the status bar
   if(!m_area.Create(m_chart_id,name,m_subwin,x,y,m_x_size,m_y_size))
      return(false);
//--- set properties
   m_area.BackColor(m_area_color);
   m_area.Color(m_area_border_color);
   m_area.BorderType(BORDER_FLAT);
   m_area.Corner(m_corner);
   m_area.Selectable(false);
   m_area.Z_Order(m_zorder);
   m_area.Tooltip("\n");
//--- Margins from the edge
   m_area.XGap(x-m_wnd.X());
   m_area.YGap(y-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_area);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates a list of status bar items                               |
//+------------------------------------------------------------------+
bool CStatusBar::CreateItems(void)
  {
   int l_w=0;
   int l_x=m_x+1;
   int l_y=m_y+1;
//--- Get the number of items
   int items_total=ItemsTotal();
//--- If there are no items in the group, report and leave
   if(items_total<1)
     {
      ::Print(__FUNCTION__," > This method is to be called, "
              "if a group contains at least one item! Use the CStatusBar::AddItem() method");
      return(false);
     }
//--- If the width of the first item is not set, then...
   if(m_width[0]<1)
     {
      //--- ...calculate it in relation to the common width of other items
      for(int i=1; i<items_total; i++)
         l_w+=m_width[i];
      //---
      m_width[0]=m_wnd.XSize()-l_w-(items_total+2);
     }
//--- Create specified number of items
   for(int i=0; i<items_total; i++)
     {
      //--- Forming the object name
      string name=CElement::ProgramName()+"_statusbar_edit_"+string(i)+"__"+(string)CElement::Id();
      //--- X coordinate
      l_x=(i>0)? l_x+m_width[i-1]: l_x;
      //--- Creating the object
      if(!m_items[i].Create(m_chart_id,name,m_subwin,l_x,l_y,m_width[i],m_y_size-2))
         return(false);
      //--- Setting the properties
      m_items[i].Description("");
      m_items[i].TextAlign(ALIGN_LEFT);
      m_items[i].Font(FONT);
      m_items[i].FontSize(FONT_SIZE);
      m_items[i].Color(m_label_color);
      m_items[i].BorderColor(m_area_color);
      m_items[i].BackColor(m_area_color);
      m_items[i].Corner(m_corner);
      m_items[i].Anchor(m_anchor);
      m_items[i].Selectable(false);
      m_items[i].Z_Order(m_zorder);
      m_items[i].ReadOnly(true);
      m_items[i].Tooltip("\n");
      //--- Margins from the edge of the panel
      m_items[i].XGap(l_x-m_wnd.X());
      m_items[i].YGap(l_y-m_wnd.Y());
      //--- Coordinates
      m_items[i].X(l_x);
      m_items[i].Y(l_y);
      //--- Size
      m_items[i].XSize(m_width[i]);
      m_items[i].YSize(m_y_size-2);
      //--- Store the object pointer
      CElement::AddToArray(m_items[i]);
     }
//--- Creating separation lines
   for(int i=1; i<items_total; i++)
     {
      //--- X coordinate
      l_x=m_items[i].X();
      //--- Creating a line
      CreateSeparateLine(i,l_x,l_y+2);
     }
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates a separation line                                        |
//+------------------------------------------------------------------+
bool CStatusBar::CreateSeparateLine(const int line_number,const int x,const int y)
  {
//--- Lines are set starting from the second (1) item
   if(line_number<1)
      return(false);
//--- Adjustment of the index
   int i=line_number-1;
//--- Increasing the array of lines per element
   int array_size=::ArraySize(m_sep_line);
   ::ArrayResize(m_sep_line,array_size+1);
//--- Store the window pointer
   m_sep_line[i].WindowPointer(m_wnd);
//--- Setting the properties
   m_sep_line[i].TypeSepLine(V_SEP_LINE);
   m_sep_line[i].DarkColor(m_sepline_dark_color);
   m_sep_line[i].LightColor(m_sepline_light_color);
//--- Creating a line
   if(!m_sep_line[i].CreateSeparateLine(m_chart_id,m_subwin,line_number,x,y,2,m_y_size-6))
      return(false);
//--- Margins from the edge of the panel
   m_sep_line[i].XGap(x-m_wnd.X());
   m_sep_line[i].YGap(y-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_sep_line[i].Object(0));
   return(true);
  }
//+------------------------------------------------------------------+
//| Adds a menu item                                                 |
//+------------------------------------------------------------------+
void CStatusBar::AddItem(const int width)
  {
//--- Increase the array size by one element
   int array_size=::ArraySize(m_items);
   ::ArrayResize(m_items,array_size+1);
   ::ArrayResize(m_width,array_size+1);
//--- Store the value of passed parameters
   m_width[array_size]=width;
  }
//+------------------------------------------------------------------+
//| Setting the value at the specified index                         |
//+------------------------------------------------------------------+
void CStatusBar::ValueToItem(const int index,const string value)
  {
//--- Checking for exceeding the array range
   int array_size=::ArraySize(m_items);
   if(array_size<1 || index<0 || index>=array_size)
      return;
//--- Setting the passed text
   m_items[index].Description(value);
  }
//+------------------------------------------------------------------+
//| Moving elements                                                  |
//+------------------------------------------------------------------+
void CStatusBar::Moving(const int x,const int y)
  {
//--- Leave, if the element is hidden
   if(!CElement::IsVisible())
      return;
//--- Storing coordinates in the element fields
   CElement::X(x+XGap());
   CElement::Y(y+YGap());
//--- Storing coordinates in the fields of the objects
   m_area.X(x+m_area.XGap());
   m_area.Y(y+m_area.YGap());
//--- Updating coordinates of graphical objects
   m_area.X_Distance(m_area.X());
   m_area.Y_Distance(m_area.Y());
//---
   int items_total=ItemsTotal();
   for(int i=0; i<items_total; i++)
     {
      //--- Storing coordinates in the fields of the objects
      m_items[i].X(x+m_items[i].XGap());
      m_items[i].Y(y+m_items[i].YGap());
      //--- Updating coordinates of graphical objects
      m_items[i].X_Distance(m_items[i].X());
      m_items[i].Y_Distance(m_items[i].Y());
     }
//--- Moving separation lines
   int sep_total=::ArraySize(m_sep_line);
   for(int i=0; i<sep_total; i++)
      m_sep_line[i].Moving(x,y);
  }
//+------------------------------------------------------------------+
//| Shows the element                                                |
//+------------------------------------------------------------------+
void CStatusBar::Show(void)
  {
//--- Leave, if the element is already visible
   if(CElement::IsVisible())
      return;
//--- Make all objects visible
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_ALL_PERIODS);
//--- Show the separation line
   int sep_total=::ArraySize(m_sep_line);
   for(int i=0; i<sep_total; i++)
      m_sep_line[i].Show();
//--- State of visibility
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Hides the element                                                |
//+------------------------------------------------------------------+
void CStatusBar::Hide(void)
  {
//--- Leave, if the element is hidden
   if(!CElement::IsVisible())
      return;
//--- Hide all objects
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_NO_PERIODS);
//--- Hide the separation line
   int sep_total=::ArraySize(m_sep_line);
   for(int i=0; i<sep_total; i++)
      m_sep_line[i].Hide();
//--- State of visibility
   CElement::IsVisible(false);
  }
//+------------------------------------------------------------------+
//| Redrawing                                                        |
//+------------------------------------------------------------------+
void CStatusBar::Reset(void)
  {
//--- Leave, if this is a drop-down control
   if(CElement::IsDropdown())
      return;
//--- Hide and show
   Hide();
   Show();
  }
//+------------------------------------------------------------------+
//| Deletion                                                         |
//+------------------------------------------------------------------+
void CStatusBar::Delete(void)
  {
//--- Removing objects
   m_area.Delete();
//--- Emptying the control arrays
   ::ArrayFree(m_items);
   ::ArrayFree(m_sep_line);
//--- Emptying the array of the objects
   CElement::FreeObjectsArray();
//--- Initializing of variables by default values
   CElement::MouseFocus(false);
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Seth the priorities                                              |
//+------------------------------------------------------------------+
void CStatusBar::SetZorders(void)
  {
   m_area.Z_Order(m_zorder);
   int items_total=ItemsTotal();
   for(int i=0; i<items_total; i++)
      m_items[i].Z_Order(m_zorder);
  }
//+------------------------------------------------------------------+
//| Reset the priorities                                             |
//+------------------------------------------------------------------+
void CStatusBar::ResetZorders(void)
  {
   m_area.Z_Order(0);
   int items_total=ItemsTotal();
   for(int i=0; i<items_total; i++)
      m_items[i].Z_Order(0);
  }
//+------------------------------------------------------------------+
