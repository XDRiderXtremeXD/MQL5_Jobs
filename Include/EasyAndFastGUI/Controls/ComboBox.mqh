//+------------------------------------------------------------------+
//|                                                     ComboBox.mqh |
//|                        Copyright 2015, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include "Element.mqh"
#include "Window.mqh"
#include "ListView.mqh"
//+------------------------------------------------------------------+
//| Class for creating a combobox                                    |
//+------------------------------------------------------------------+
class CComboBox : public CElement
  {
private:
   //--- Pointer to the form to which the element is attached
   CWindow          *m_wnd;
   //--- Objects for creating a combobox
   CRectLabel        m_area;
   CLabel            m_label;
   CEdit             m_button;
   CBmpLabel         m_drop_arrow;
   CListView         m_listview;
   //--- Combobox properties:
   //    Color of the general background
   color             m_area_color;
   //--- Text and margins of the text label
   string            m_label_text;
   int               m_label_x_gap;
   int               m_label_y_gap;
   //--- Colors of the text label in different states
   color             m_label_color;
   color             m_label_color_off;
   color             m_label_color_hover;
   color             m_label_color_array[];
   //--- (1) Button text and (2) its size
   string            m_button_text;
   int               m_button_x_size;
   int               m_button_y_size;
   //--- Colors of the button in different states
   color             m_button_color;
   color             m_button_color_off;
   color             m_button_color_hover;
   color             m_button_color_pressed;
   color             m_button_color_array[];
   //--- Colors of the button frame in different states
   color             m_button_border_color;
   color             m_button_border_color_off;
   //--- Color of the button text in different states
   color             m_button_text_color;
   color             m_button_text_color_off;
   //--- Label margins
   int               m_drop_arrow_x_gap;
   int               m_drop_arrow_y_gap;
   //--- Labels of the buttons with a drop-down menu in the active and blocked states
   string            m_drop_arrow_file_on;
   string            m_drop_arrow_file_off;
   //--- Priorities of the left mouse button press
   int               m_area_zorder;
   int               m_button_zorder;
   int               m_zorder;
   //--- Available/blocked
   bool              m_combobox_state;
   //---
public:
                     CComboBox(void);
                    ~CComboBox(void);
   //--- Methods for creating a combobox
   bool              CreateComboBox(const long chart_id,const int subwin,const int x,const int y);
   //---
private:
   bool              CreateArea(void);
   bool              CreateLabel(void);
   bool              CreateButton(void);
   bool              CreateDropArrow(void);
   bool              CreateList(void);
   //---
public:
   //--- (1) Stores the form pointer, returns pointers to (2) the list view and (3) scrollbar
   void              WindowPointer(CWindow &object)                   { m_wnd=::GetPointer(object);                      }
   CListView        *GetListViewPointer(void)                         { return(::GetPointer(m_listview));                }
   CScrollV         *GetScrollVPointer(void)                          { return(m_listview.GetScrollVPointer());          }
   //--- Setting (1) the size of the list view (number of items) and (2) its visible part, (3) getting and setting the element state
   void              ItemsTotal(const int items_total)                { m_listview.ListSize(items_total);                }
   void              VisibleItemsTotal(const int visible_items_total) { m_listview.VisibleListSize(visible_items_total); }
   bool              ComboBoxState(void)                        const { return(m_combobox_state);                        }
   void              ComboBoxState(const bool state);
   //--- (1) Background color, (2) sets and (3) returns the value of the text label
   void              AreaColor(const color clr)                       { m_area_color=clr;                                }
   void              LabelText(const string label_text)               { m_label_text=label_text;                         }
   string            LabelText(void)                            const { return(m_label_text);                            }
   //--- Text label margins
   void              LabelXGap(const int x_gap)                       { m_label_x_gap=x_gap;                             }
   void              LabelYGap(const int y_gap)                       { m_label_y_gap=y_gap;                             }
   //--- (1) Returns the button text, (2) setting the button size
   string            ButtonText(void)                           const { return(m_button_text);                           }
   void              ButtonXSize(const int x_size)                    { m_button_x_size=x_size;                          }
   void              ButtonYSize(const int y_size)                    { m_button_y_size=y_size;                          }
   //--- (1) Background color, (2) colors of the text label
   void              LabelColor(const color clr)                      { m_label_color=clr;                               }
   void              LabelColorOff(const color clr)                   { m_label_color_off=clr;                           }
   void              LabelColorHover(const color clr)                 { m_label_color_hover=clr;                         }
   //--- Button colors
   void              ButtonBackColor(const color clr)                 { m_button_color=clr;                              }
   void              ButtonBackColorOff(const color clr)              { m_button_color_off=clr;                          }
   void              ButtonBackColorHover(const color clr)            { m_button_color_hover=clr;                        }
   void              ButtonBackColorPressed(const color clr)          { m_button_color_pressed=clr;                      }
   //--- Colors of the button frame
   void              ButtonBorderColor(const color clr)               { m_button_border_color=clr;                       }
   void              ButtonBorderColorOff(const color clr)            { m_button_border_color_off=clr;                   }
   //--- Colors of the button text
   void              ButtonTextColor(const color clr)                 { m_button_text_color=clr;                         }
   void              ButtonTextColorOff(const color clr)              { m_button_text_color_off=clr;                     }
   //--- Setting icons for the button with a drop-down menu in the active and blocked states
   void              DropArrowFileOn(const string file_path)          { m_drop_arrow_file_on=file_path;                  }
   void              DropArrowFileOff(const string file_path)         { m_drop_arrow_file_off=file_path;                 }
   //--- Label margins
   void              DropArrowXGap(const int x_gap)                   { m_drop_arrow_x_gap=x_gap;                        }
   void              DropArrowYGap(const int y_gap)                   { m_drop_arrow_y_gap=y_gap;                        }

   //--- Stores the passed value in the list view by specified index
   void              ValueToList(const int item_index,const string item_text);
   //--- Highlighting the item by specified index
   void              SelectedItemByIndex(const int index);
   //--- Changing the object color when the cursor is hovering over it
   void              ChangeObjectsColor(void);
   //--- Changes the current state of the combobox for the opposite
   void              ChangeComboBoxListState(void);
   //---
public:
   //--- Chart event handler
   virtual void      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   //--- Timer
   virtual void      OnEventTimer(void);
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
   //--- Reset the color
   virtual void      ResetColors(void);
   //---
private:
   //--- Handling of pressing the button
   bool              OnClickButton(const string clicked_object);
   //--- Checking the pressed left mouse button over the combobox button
   void              CheckPressedOverButton(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CComboBox::CComboBox(void) : m_area_color(C'15,15,15'),
                             m_combobox_state(true),
                             m_label_text("combobox: "),
                             m_label_x_gap(0),
                             m_label_y_gap(2),
                             m_label_color(clrWhite),
                             m_label_color_off(clrGray),
                             m_label_color_hover(C'85,170,255'),
                             m_button_text(""),
                             m_button_y_size(18),
                             m_button_text_color(clrBlack),
                             m_button_text_color_off(clrDarkGray),
                             m_button_color(clrGainsboro),
                             m_button_color_off(clrLightGray),
                             m_button_color_hover(C'193,218,255'),
                             m_button_color_pressed(C'153,178,215'),
                             m_button_border_color(clrWhite),
                             m_button_border_color_off(clrWhite),
                             m_drop_arrow_x_gap(16),
                             m_drop_arrow_y_gap(1),
                             m_drop_arrow_file_on(""),
                             m_drop_arrow_file_off("")
  {
//--- Store the name of the element class in the base class
   CElement::ClassName(CLASS_NAME);
//--- Drop-down list view mode
   m_listview.IsDropdown(true);
//--- Set priorities of the left mouse button click
   m_zorder        =0;
   m_area_zorder   =1;
   m_button_zorder =2;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CComboBox::~CComboBox(void)
  {
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CComboBox::OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//--- Handling of the cursor movement event
   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      //--- Leave, if the element is hidden
      if(!CElement::IsVisible())
         return;
      //--- Coordinates
      int  x=(int)lparam;
      int  y=(int)dparam;
      //--- Checking the focus over elements
      CElement::MouseFocus(x>CElement::X() && x<CElement::X2() && 
                           y>CElement::Y() && y<CElement::Y2());
      m_button.MouseFocus(x>m_button.X() && x<m_button.X2() && 
                          y>m_button.Y() && y<m_button.Y2());
      //--- Leave, if the element is blocked
      if(!m_combobox_state)
         return;
      //--- Leave, if the left mouse button is released
      if(sparam=="0")
         return;
      //--- Check of the left mouse button pressed over a split button
      CheckPressedOverButton();
      return;
     }
//--- Handling the list view item press event
   if(id==CHARTEVENT_CUSTOM+ON_CLICK_LIST_ITEM)
     {
      //--- If identifiers match
      if(lparam==CElement::Id())
        {
         //--- Store and set the text in the button
         m_button_text=m_listview.SelectedItemText();
         m_button.Description(m_listview.SelectedItemText());
         //--- Change the list view state
         ChangeComboBoxListState();
         //--- Send a message about it
         ::EventChartCustom(m_chart_id,ON_CLICK_COMBOBOX_ITEM,CElement::Id(),0,m_label_text);
        }
      //---
      return;
     }
//--- Handling the left mouse button click on the object
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      //--- Pressing on the combobox button
      if(OnClickButton(sparam))
         return;
     }
//--- Handling the chart properties change event
   if(id==CHARTEVENT_CHART_CHANGE)
     {
      //--- Leave, if the element is blocked
      if(!m_combobox_state)
         return;
      //--- Hide the list view
      m_listview.Hide();
      //--- Restore colors
      ResetColors();
      //--- Unblock the form
      m_wnd.IsLocked(false);
      m_wnd.IdActivatedElement(WRONG_VALUE);
      return;
     }
  }
//+------------------------------------------------------------------+
//| Timer                                                            |
//+------------------------------------------------------------------+
void CComboBox::OnEventTimer(void)
  {
//--- If this is a drop-down element and the list view is hidden
   if(CElement::IsDropdown() && !m_listview.IsVisible())
      ChangeObjectsColor();
   else
     {
      //--- If the form and the element are not blocked
      if(!m_wnd.IsLocked() && m_combobox_state)
         ChangeObjectsColor();
     }
  }
//+------------------------------------------------------------------+
//| Creates a group of the combobox objects                          |
//+------------------------------------------------------------------+
bool CComboBox::CreateComboBox(const long chart_id,const int subwin,const int x,const int y)
  {
//--- Leave, if there is no form pointer
   if(::CheckPointer(m_wnd)==POINTER_INVALID)
     {
      ::Print(__FUNCTION__," > Before creating a combobox, the class must be passed "
              "the form pointer: CComboBox::WindowPointer(CWindow &object)");
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
//--- Creating an element
   if(!CreateArea())
      return(false);
   if(!CreateLabel())
      return(false);
   if(!CreateButton())
      return(false);
   if(!CreateDropArrow())
      return(false);
   if(!CreateList())
      return(false);
//--- Store and set the text in the button
   m_button_text=m_listview.SelectedItemText();
   m_button.Description(m_listview.SelectedItemText());
//--- Hide the element if the window is a dialog one or is minimized
   if(m_wnd.WindowType()==W_DIALOG || m_wnd.IsMinimized())
      Hide();
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates combobox area                                            |
//+------------------------------------------------------------------+
bool CComboBox::CreateArea(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_combobox_area_"+(string)CElement::Id();
//--- Set the object
   if(!m_area.Create(m_chart_id,name,m_subwin,m_x,m_y,m_x_size,m_y_size))
      return(false);
//--- set properties
   m_area.BackColor(m_area_color);
   m_area.Color(m_area_color);
   m_area.BorderType(BORDER_FLAT);
   m_area.Corner(m_corner);
   m_area.Selectable(false);
   m_area.Z_Order(m_area_zorder);
   m_area.Tooltip("\n");
//--- Margins from the edge
   m_area.XGap(m_x-m_wnd.X());
   m_area.YGap(m_y-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_area);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates combobox label                                           |
//+------------------------------------------------------------------+
bool CComboBox::CreateLabel(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_combobox_lable_"+(string)CElement::Id();
//--- Coordinates
   int x=CElement::X()+m_label_x_gap;
   int y=CElement::Y()+m_label_y_gap;
   color label_color=(m_combobox_state)? m_label_color : m_label_color_off;
//--- Set the object
   if(!m_label.Create(m_chart_id,name,m_subwin,x,y))
      return(false);
//--- set properties
   m_label.Description(m_label_text);
   m_label.Font(FONT);
   m_label.FontSize(FONT_SIZE);
   m_label.Color(label_color);
   m_label.Corner(m_corner);
   m_label.Anchor(m_anchor);
   m_label.Selectable(false);
   m_label.Z_Order(m_zorder);
   m_label.Tooltip("\n");
//--- Margins from the edge
   m_label.XGap(x-m_wnd.X());
   m_label.YGap(y-m_wnd.Y());
//--- Initializing gradient array
   CElement::InitColorArray(label_color,m_label_color_hover,m_label_color_array);
//--- Store the object pointer
   CElement::AddToArray(m_label);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates combobox button                                          |
//+------------------------------------------------------------------+
bool CComboBox::CreateButton(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_combobox_button_"+(string)CElement::Id();
//--- Coordinates
   int x =CElement::X()+CElement::XSize()-m_button_x_size;
   int y =CElement::Y()-1;
//--- Set the object
   if(!m_button.Create(m_chart_id,name,m_subwin,x,y,m_button_x_size,m_button_y_size))
      return(false);
//--- set properties
   m_button.Font(FONT);
   m_button.FontSize(FONT_SIZE);
   m_button.Description(m_button_text);
   m_button.Color(m_button_text_color);
   m_button.BackColor(m_button_color);
   m_button.BorderColor(m_button_border_color);
   m_button.Corner(m_corner);
   m_button.Anchor(m_anchor);
   m_button.Selectable(false);
   m_button.Z_Order(m_button_zorder);
   m_button.ReadOnly(true);
   m_button.Tooltip("\n");
//--- Store coordinates
   m_button.X(x);
   m_button.Y(y);
//--- Store the size
   m_button.XSize(m_button_x_size);
   m_button.YSize(m_button_y_size);
//--- Margins from the edge
   m_button.XGap(x-m_wnd.X());
   m_button.YGap(y-m_wnd.Y());
//--- Initializing gradient array
   CElement::InitColorArray(m_button_color,m_button_color_hover,m_button_color_array);
//--- Store the object pointer
   CElement::AddToArray(m_button);
   return(true);
  }
//+------------------------------------------------------------------+
//| Create arrow on the combobox                                     |
//+------------------------------------------------------------------+
#resource "\\Images\\EasyAndFastGUI\\Controls\\DropOff.bmp"
#resource "\\Images\\EasyAndFastGUI\\Controls\\DropOff_black.bmp"
//---
bool CComboBox::CreateDropArrow(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_combobox_drop_"+(string)CElement::Id();
//--- Coordinates
   int x=m_button.X()+m_button.XSize()-m_drop_arrow_x_gap;
   int y=m_button.Y()+m_drop_arrow_y_gap;
//--- If the icon for the arrow is not specified, then set the default one
   if(m_drop_arrow_file_on=="")
      m_drop_arrow_file_on="Images\\EasyAndFastGUI\\Controls\\DropOff_black.bmp";
   if(m_drop_arrow_file_off=="")
      m_drop_arrow_file_off="Images\\EasyAndFastGUI\\Controls\\DropOff.bmp";
//--- Set the icon
   if(!m_drop_arrow.Create(m_chart_id,name,m_subwin,x,y))
      return(false);
//--- set properties
   m_drop_arrow.BmpFileOn("::"+m_drop_arrow_file_on);
   m_drop_arrow.BmpFileOff("::"+m_drop_arrow_file_off);
   m_drop_arrow.State(true);
   m_drop_arrow.Corner(m_corner);
   m_drop_arrow.GetInteger(OBJPROP_ANCHOR,m_anchor);
   m_drop_arrow.Selectable(false);
   m_drop_arrow.Z_Order(m_zorder);
   m_drop_arrow.Tooltip("\n");
//--- Store the size (in the object)
   m_drop_arrow.XSize(m_drop_arrow.X_Size());
   m_drop_arrow.YSize(m_drop_arrow.Y_Size());
//--- Store coordinates
   m_drop_arrow.X(x);
   m_drop_arrow.Y(y);
//--- Margins from the edge
   m_drop_arrow.XGap(x-m_wnd.X());
   m_drop_arrow.YGap(y-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_drop_arrow);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the list view                                            |
//+------------------------------------------------------------------+
bool CComboBox::CreateList(void)
  {
//--- Store pointers to the form and the combobox
   m_listview.WindowPointer(m_wnd);
   m_listview.ComboBoxPointer(this);
//--- Coordinates
   int x=CElement::X2()-m_button_x_size;
   int y=CElement::Y()+m_button_y_size;
//--- set properties
   m_listview.Id(CElement::Id());
   m_listview.XSize(m_button_x_size);
//--- Create control
   if(!m_listview.CreateListView(m_chart_id,m_subwin,x,y))
      return(false);
//--- Hide the list view
   m_listview.Hide();
   return(true);
  }
//+------------------------------------------------------------------+
//| Stores the passed value in the list view by the specified index  |
//+------------------------------------------------------------------+
void CComboBox::ValueToList(const int item_index,const string item_text)
  {
   m_listview.ValueToList(item_index,item_text);
  }
//+------------------------------------------------------------------+
//| Select the item by specified index                               |
//+------------------------------------------------------------------+
void CComboBox::SelectedItemByIndex(const int index)
  {
//--- Highlight the item in the list view
   m_listview.SelectedItemByIndex(index);
//--- Store and set the text in the button
   m_button_text=m_listview.SelectedItemText();
   m_button.Description(m_listview.SelectedItemText());
  }
//+------------------------------------------------------------------+
//| Moving elements                                                  |
//+------------------------------------------------------------------+
void CComboBox::Moving(const int x,const int y)
  {
//--- Leave, if the element is hidden
   if(!CElement::IsVisible())
      return;
//--- Storing indents in the element fields
   CElement::X(x+XGap());
   CElement::Y(y+YGap());
//--- Storing coordinates in the fields of the objects
   m_area.X(x+m_area.XGap());
   m_area.Y(y+m_area.YGap());
   m_label.X(x+m_label.XGap());
   m_label.Y(y+m_label.YGap());
   m_button.X(x+m_button.XGap());
   m_button.Y(y+m_button.YGap());
   m_drop_arrow.X(x+m_drop_arrow.XGap());
   m_drop_arrow.Y(y+m_drop_arrow.YGap());
//--- Updating coordinates of graphical objects  
   m_area.X_Distance(m_area.X());
   m_area.Y_Distance(m_area.Y());
   m_label.X_Distance(m_label.X());
   m_label.Y_Distance(m_label.Y());
   m_button.X_Distance(m_button.X());
   m_button.Y_Distance(m_button.Y());
   m_drop_arrow.X_Distance(m_drop_arrow.X());
   m_drop_arrow.Y_Distance(m_drop_arrow.Y());
  }
//+------------------------------------------------------------------+
//| Shows combobox                                                   |
//+------------------------------------------------------------------+
void CComboBox::Show(void)
  {
//--- Leave, if the element is already visible
   if(CElement::IsVisible())
      return;
//--- Make all objects visible
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_ALL_PERIODS);
//--- Show the list view
   m_listview.Hide();
//--- State of visibility
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Hides combobox                                                   |
//+------------------------------------------------------------------+
void CComboBox::Hide(void)
  {
//--- Leave, if the element is already visible
   if(!CElement::IsVisible())
      return;
//--- Hide all objects
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_NO_PERIODS);
//--- Button color
   m_button.BackColor(m_button_color);
//--- Hide the list view
   m_listview.Hide();
//--- State of visibility
   CElement::IsVisible(false);
  }
//+------------------------------------------------------------------+
//| Redrawing                                                        |
//+------------------------------------------------------------------+
void CComboBox::Reset(void)
  {
//--- Leave, if this is a drop-down element
   if(CElement::IsDropdown())
      return;
//--- Hide and show
   Hide();
   Show();
  }
//+------------------------------------------------------------------+
//| Deletion                                                         |
//+------------------------------------------------------------------+
void CComboBox::Delete(void)
  {
//--- Removing objects
   m_area.Delete();
   m_label.Delete();
   m_button.Delete();
   m_drop_arrow.Delete();
//--- State of visibility
   CElement::IsVisible(true);
//--- Emptying the array of the objects
   CElement::FreeObjectsArray();
  }
//+------------------------------------------------------------------+
//| Seth the priorities                                              |
//+------------------------------------------------------------------+
void CComboBox::SetZorders(void)
  {
   m_area.Z_Order(m_area_zorder);
   m_label.Z_Order(m_zorder);
   m_button.Z_Order(m_button_zorder);
   m_drop_arrow.Z_Order(m_zorder);
   m_listview.SetZorders();
  }
//+------------------------------------------------------------------+
//| Reset the priorities                                             |
//+------------------------------------------------------------------+
void CComboBox::ResetZorders(void)
  {
   m_area.Z_Order(0);
   m_label.Z_Order(0);
   m_button.Z_Order(0);
   m_drop_arrow.Z_Order(0);
   m_listview.ResetZorders();
  }
//+------------------------------------------------------------------+
//| Reset the color                                                  |
//+------------------------------------------------------------------+
void CComboBox::ResetColors(void)
  {
//--- Leave, if the element is blocked
   if(!m_combobox_state)
      return;
//--- Reset the color
   m_label.Color(m_label_color);
   m_button.BackColor(m_button_color);
//--- Zero the focus
   CElement::MouseFocus(false);
  }
//+------------------------------------------------------------------+
//| Changing the object color when the cursor is hovering over it    |
//+------------------------------------------------------------------+
void CComboBox::ChangeObjectsColor(void)
  {
//--- Leave, if the element is blocked
   if(!m_combobox_state)
      return;
//--- Change the object color
   CElement::ChangeObjectColor(m_label.Name(),CElement::MouseFocus(),OBJPROP_COLOR,m_label_color,m_label_color_hover,m_label_color_array);
   CElement::ChangeObjectColor(m_button.Name(),CElement::MouseFocus(),OBJPROP_BGCOLOR,m_button_color,m_button_color_hover,m_button_color_array);
  }
//+------------------------------------------------------------------+
//| Changing the combobox state                                      |
//+------------------------------------------------------------------+
void CComboBox::ComboBoxState(const bool state)
  {
   m_combobox_state=state;
//--- Set colors corresponding to the current state to the object
   m_label.Color((state)? m_label_color : m_label_color_off);
   m_button.Color((state)? m_button_text_color : m_button_text_color_off);
   m_button.BackColor((state)? m_button_color : m_button_color_off);
   m_button.BorderColor((state)? m_button_border_color : m_button_border_color_off);
   m_drop_arrow.State(state);
  }
//+------------------------------------------------------------------+
//| Changes the current state of the combobox for the opposite       |
//+------------------------------------------------------------------+
void CComboBox::ChangeComboBoxListState(void)
  {
//--- Leave, if the element is blocked
   if(!m_combobox_state)
      return;
//--- If the list view is visible
   if(m_listview.IsVisible())
     {
      //--- Hide the list view
      m_listview.Hide();
      //--- Set colors
      m_label.Color(m_label_color_hover);
      m_button.BackColor(m_button_color_hover);
      //--- If this is not a drop-down element
      if(!CElement::IsDropdown())
        {
         //--- Unblock the form
         m_wnd.IsLocked(false);
         m_wnd.IdActivatedElement(WRONG_VALUE);
        }
     }
//--- If the list view is hidden
   else
     {
      //--- Show the list view
      m_listview.Show();
      //--- Set colors
      m_label.Color(m_label_color_hover);
      m_button.BackColor(m_button_color_pressed);
      //--- Block the form
      m_wnd.IsLocked(true);
      m_wnd.IdActivatedElement(CElement::Id());
     }
  }
//+------------------------------------------------------------------+
//| Pressing on the combobox button                                  |
//+------------------------------------------------------------------+
bool CComboBox::OnClickButton(const string clicked_object)
  {
//--- Leave, if the object name is different  
   if(clicked_object!=m_button.Name())
      return(false);
//--- Change the list view state
   ChangeComboBoxListState();
   return(true);
  }
//+------------------------------------------------------------------+
//| Check of the pressed left mouse button over the button           |
//+------------------------------------------------------------------+
void CComboBox::CheckPressedOverButton(void)
  {
//--- Leave, if the form is blocked and identifiers do not match
   if(m_wnd.IsLocked() && m_wnd.IdActivatedElement()!=CElement::Id())
      return;
//--- If there is no focus
   if(!CElement::MouseFocus())
     {
      //--- Leave, if the focus is not over the list view or the scrollbar is enabled
      if(m_listview.MouseFocus() || m_listview.ScrollState())
         return;
      //--- Hide the list view
      m_listview.Hide();
      //--- Restore colors
      ResetColors();
      //--- If identifiers match and the element is not a drop-down
      if(m_wnd.IdActivatedElement()==CElement::Id() && !CElement::IsDropdown())
         //--- Unblock the form
         m_wnd.IsLocked(false);
     }
//--- If there is focus
   else
     {
      //--- Leave, if the list view is visible
      if(m_listview.IsVisible())
         return;
      //--- Set the color considering the focus
      if(m_button.MouseFocus())
         m_button.BackColor(m_button_color_pressed);
      else
         m_button.BackColor(m_button_color_hover);
     }
  }
//+------------------------------------------------------------------+
