//+------------------------------------------------------------------+
//|                                                       Slider.mqh |
//|                        Copyright 2015, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include "Element.mqh"
#include "Window.mqh"
#include "SeparateLine.mqh"
//+------------------------------------------------------------------+
//| Class for creating a slider with edit                            |
//+------------------------------------------------------------------+
class CSlider : public CElement
  {
private:
   //--- Pointer to the form to which the element is attached
   CWindow          *m_wnd;
   //--- Objects for creating the element
   CRectLabel        m_area;
   CLabel            m_label;
   CEdit             m_edit;
   CSeparateLine     m_slot;
   CRectLabel        m_indicator;
   CRectLabel        m_thumb;
   //--- Color of the element background
   color             m_area_color;
   //--- Text for describing the slider
   string            m_label_text;
   //--- Colors of the text label in different states
   color             m_label_color;
   color             m_label_color_hover;
   color             m_label_color_locked;
   color             m_label_color_array[];
   //--- Current value in the entry field
   double            m_edit_value;
   //--- Size of the entry field
   int               m_edit_x_size;
   int               m_edit_y_size;
   //--- Colors of the entry field in different states
   color             m_edit_color;
   color             m_edit_color_locked;
   //--- Colors of the text of the entry field in different states
   color             m_edit_text_color;
   color             m_edit_text_color_locked;
   //--- Colors of the frame of the entry field in different states
   color             m_edit_border_color;
   color             m_edit_border_color_hover;
   color             m_edit_border_color_locked;
   color             m_edit_border_color_array[];
   //--- Size of the slit
   int               m_slot_y_size;
   //--- Colors of the slit
   color             m_slot_line_dark_color;
   color             m_slot_line_light_color;
   //--- Colors of the indicator in different states
   color             m_slot_indicator_color;
   color             m_slot_indicator_color_locked;
   //--- Size of the slider runner
   int               m_thumb_x_size;
   int               m_thumb_y_size;
   //--- Colors of the slider runner
   color             m_thumb_color;
   color             m_thumb_color_hover;
   color             m_thumb_color_locked;
   color             m_thumb_color_pressed;
   //--- Priorities of the left mouse button press
   int               m_zorder;
   int               m_area_zorder;
   int               m_edit_zorder;
   //--- (1) Minimum and (2) maximum value, (3) step for changing the value
   double            m_min_value;
   double            m_max_value;
   double            m_step_value;
   //--- Number of decimal places
   int               m_digits;
   //--- Mode of text alignment
   ENUM_ALIGN_MODE   m_align_mode;
   //--- Checkbox state (available/blocked)
   bool              m_slider_state;
   //--- Current position of the slider runner: (1) value, (2) the X coordinate
   double            m_current_pos;
   double            m_current_pos_x;
   //--- Number of pixels in the working area
   int               m_pixels_total;
   //--- Number of steps in the value range of the working area
   int               m_value_steps_total;
   //--- Step in relation to the width of the working area
   double            m_position_step;
   //--- State of the left mouse button (pressed down/released)
   bool              m_mouse_state;
   //--- State of the mouse button (pressed/released)
   ENUM_THUMB_MOUSE_STATE m_clamping_area_mouse;
   //--- To identify the mode of the slider runner movement
   bool              m_slider_thumb_state;
   //--- Variables connected with the slider movement
   int               m_slider_size_fixing;
   int               m_slider_point_fixing;
   //---
public:
                     CSlider(void);
                    ~CSlider(void);
   //--- Methods for creating the control
   bool              CreateSlider(const long chart_id,const int subwin,const string text,const int x,const int y);
   //---
private:
   bool              CreateArea(void);
   bool              CreateLabel(void);
   bool              CreateEdit(void);
   bool              CreateSlot(void);
   bool              CreateIndicator(void);
   bool              CreateThumb(void);
   //---
public:
   //--- (1) Stores the form pointer, (2) return/set the state of the control
   void              WindowPointer(CWindow &object)                 { m_wnd=::GetPointer(object);         }
   bool              SliderState(void)                        const { return(m_slider_state);             }
   void              SliderState(const bool state);
   //--- (1) Background color, (2) colors of the text label
   void              AreaColor(const color clr)                     { m_area_color=clr;                   }
   void              LabelColor(const color clr)                    { m_label_color=clr;                  }
   void              LabelColorHover(const color clr)               { m_label_color_hover=clr;            }
   void              LabelColorLocked(const color clr)              { m_label_color_locked=clr;           }
   //--- Size of (1) the entry field and (2) the slit
   void              EditXSize(const int x_size)                    { m_edit_x_size=x_size;               }
   void              EditYSize(const int y_size)                    { m_edit_y_size=y_size;               }
   void              SlotYSize(const int y_size)                    { m_slot_y_size=y_size;               }
   //--- Colors of the entry field in different states
   void              EditColor(const color clr)                     { m_edit_color=clr;                   }
   void              EditColorLocked(const color clr)               { m_edit_color_locked=clr;            }
   //--- Colors of the text of the entry field in different states
   void              EditTextColor(const color clr)                 { m_edit_text_color=clr;              }
   void              EditTextColorLocked(const color clr)           { m_edit_text_color_locked=clr;       }
   //--- Colors of the frame of the entry field in different states
   void              EditBorderColor(const color clr)               { m_edit_border_color=clr;            }
   void              EditBorderColorHover(const color clr)          { m_edit_border_color_hover=clr;      }
   void              EditBorderColorLocked(const color clr)         { m_edit_border_color_locked=clr;     }
   //--- (1) Dark and (2) light color of the separation line (slit)
   void              SlotLineDarkColor(const color clr)             { m_slot_line_dark_color=clr;         }
   void              SlotLineLightColor(const color clr)            { m_slot_line_light_color=clr;        }
   //--- Colors of the slider indicator in different states
   void              SlotIndicatorColor(const color clr)            { m_slot_indicator_color=clr;         }
   void              SlotIndicatorColorLocked(const color clr)      { m_slot_indicator_color_locked=clr;  }
   //--- Size of the slider runner
   void              ThumbXSize(const int x_size)                   { m_thumb_x_size=x_size;              }
   void              ThumbYSize(const int y_size)                   { m_thumb_y_size=y_size;              }
   //--- Colors of the slider runner
   void              ThumbColor(const color clr)                    { m_thumb_color=clr;                  }
   void              ThumbColorHover(const color clr)               { m_thumb_color_hover=clr;            }
   void              ThumbColorLocked(const color clr)              { m_thumb_color_locked=clr;           }
   void              ThumbColorPressed(const color clr)             { m_thumb_color_pressed=clr;          }
   //--- Minimum value
   double            MinValue(void)                           const { return(m_min_value);                }
   void              MinValue(const double value)                   { m_min_value=value;                  }
   //--- Maximum value
   double            MaxValue(void)                           const { return(m_max_value);                }
   void              MaxValue(const double value)                   { m_max_value=value;                  }
   //--- Step of changing the value
   double            StepValue(void)                          const { return(m_step_value);               }
   void              StepValue(const double value)                  { m_step_value=(value<=0)? 1 : value; }
   //--- (1) The number of decimal places, (2) mode of text alignment, (3) return and set the edit value
   void              SetDigits(const int digits)                    { m_digits=::fabs(digits);            }
   void              AlignMode(ENUM_ALIGN_MODE mode)                { m_align_mode=mode;                  }
   double            GetValue(void)                           const { return(m_edit_value);               }
   bool              SetValue(const double value);
   //--- Changing the value in the entry field
   void              ChangeValue(const double value);
   //--- Changing the object color when the cursor is hovering over it
   void              ChangeObjectsColor(void);
   //--- Change the color of the slider runner
   void              ChangeThumbColor(void);
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
   //--- Handling entering the value in the entry field
   bool              OnEndEdit(const string object_name);
   //--- Process of the slider runner movement
   void              OnDragThumb(const int x);
   //--- Updating of the slider runner location
   void              UpdateThumb(const int new_x_point);
   //--- Checks the state of the mouse button
   void              CheckMouseButtonState(void);
   //--- Zeroing variables connected with the slider runner movement
   void              ZeroThumbVariables(void);
   //--- Calculation of values (steps and coefficients)
   bool              CalculateCoefficients(void);
   //--- Calculation of the X coordinate of the slider runner
   void              CalculateThumbX(void);
   //--- Changes the current position of the slider runner in relation to the current value
   void              CalculateThumbPos(void);
   //--- Updating the slider indicator
   void              UpdateIndicator(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CSlider::CSlider(void) : m_digits(2),
                         m_edit_value(WRONG_VALUE),
                         m_align_mode(ALIGN_LEFT),
                         m_slider_state(true),
                         m_slider_thumb_state(false),
                         m_slider_size_fixing(0),
                         m_slider_point_fixing(0),
                         m_min_value(0),
                         m_max_value(10),
                         m_step_value(1),
                         m_current_pos(WRONG_VALUE),
                         m_area_color(C'15,15,15'),
                         m_label_color(clrWhite),
                         m_label_color_hover(C'85,170,255'),
                         m_label_color_locked(clrGray),
                         m_edit_x_size(30),
                         m_edit_y_size(18),
                         m_edit_color(clrWhite),
                         m_edit_color_locked(clrDimGray),
                         m_edit_text_color(clrBlack),
                         m_edit_text_color_locked(clrGray),
                         m_edit_border_color(clrGray),
                         m_edit_border_color_hover(C'85,170,255'),
                         m_edit_border_color_locked(clrGray),
                         m_slot_y_size(3),
                         m_slot_line_dark_color(C'65,65,65'),
                         m_slot_line_light_color(clrGray),
                         m_slot_indicator_color(clrDodgerBlue),
                         m_slot_indicator_color_locked(clrDimGray),
                         m_thumb_x_size(6),
                         m_thumb_y_size(14),
                         m_thumb_color(C'170,170,170'),
                         m_thumb_color_hover(C'200,200,200'),
                         m_thumb_color_locked(clrGray),
                         m_thumb_color_pressed(C'230,230,230')
  {
//--- Store the name of the element class in the base class
   CElement::ClassName(CLASS_NAME);
//--- Set priorities of the left mouse button click
   m_zorder      =0;
   m_area_zorder =1;
   m_edit_zorder =2;
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CSlider::~CSlider(void)
  {
  }
//+------------------------------------------------------------------+
//| Chart event handler                                              |
//+------------------------------------------------------------------+
void CSlider::OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//--- Handling of the cursor movement event
   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      //--- Leave, if the element is hidden     
      if(!CElement::IsVisible())
         return;
      //--- Coordinates and the state of the left mouse button
      int x=(int)lparam;
      int y=(int)dparam;
      m_mouse_state=(bool)int(sparam);
      //--- Checking the focus over elements
      CElement::MouseFocus(x>X() && x<X2() && y>Y() && y<Y2());
      m_thumb.MouseFocus(x>m_thumb.X() && x<m_thumb.X2() && 
                         y>m_thumb.Y() && y<m_thumb.Y2());
      //--- Leave, if the element is blocked
      if(!m_slider_state)
         return;
      //--- Check and store the state of the mouse button
      CheckMouseButtonState();
      //--- Change the color of the slider runner
      ChangeThumbColor();
      //--- If management was passed to the slider line, identify its location
      if(m_clamping_area_mouse==THUMB_PRESSED_INSIDE)
        {
         //--- Moving the slider runner
         OnDragThumb(x);
         //--- Calculation of the slider runner position in the value range
         CalculateThumbPos();
         //--- Setting a new value in the entry field
         ChangeValue(m_current_pos);
         //--- Update the slider indicator
         UpdateIndicator();
         return;
        }
     }
//--- Handling of the changing the value in the entry field event
   if(id==CHARTEVENT_OBJECT_ENDEDIT)
     {
      //--- Handling of the value entry
      if(OnEndEdit(sparam))
         return;
     }
  }
//+------------------------------------------------------------------+
//| Timer                                                            |
//+------------------------------------------------------------------+
void CSlider::OnEventTimer(void)
  {
//--- If the element is a drop-down
   if(CElement::IsDropdown())
      ChangeObjectsColor();
   else
     {
      //--- If the form and the element are not blocked
      if(!m_wnd.IsLocked())
         ChangeObjectsColor();
     }
  }
//+------------------------------------------------------------------+
//| Create slider with edit control                                  |
//+------------------------------------------------------------------+
bool CSlider::CreateSlider(const long chart_id,const int subwin,const string text,const int x,const int y)
  {
//--- Leave, if there is no form pointer
   if(::CheckPointer(m_wnd)==POINTER_INVALID)
     {
      ::Print(__FUNCTION__," > Before creating a slider, the class must be passed "
              "the form pointer: CSlider::WindowPointer(CWindow &object)");
      return(false);
     }
//--- Initializing variables
   m_id         =m_wnd.LastId()+1;
   m_chart_id   =chart_id;
   m_subwin     =subwin;
   m_x          =x;
   m_y          =y;
   m_label_text =text;
//--- Margins from the edge
   CElement::XGap(CElement::X()-m_wnd.X());
   CElement::YGap(CElement::Y()-m_wnd.Y());
//--- Creating an element
   if(!CreateArea())
      return(false);
   if(!CreateLabel())
      return(false);
   if(!CreateEdit())
      return(false);
   if(!CreateSlot())
      return(false);
   if(!CreateIndicator())
      return(false);
   if(!CreateThumb())
      return(false);
//--- Hide the element if the window is a dialog one or is minimized
   if(m_wnd.WindowType()==W_DIALOG || m_wnd.IsMinimized())
      Hide();
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Create area of editable edit control                             |
//+------------------------------------------------------------------+
bool CSlider::CreateArea(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_slider_area_"+(string)CElement::Id();
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
//--- Store coordinates
   m_area.X(CElement::X());
   m_area.Y(CElement::Y());
//--- Size
   m_area.XSize(CElement::XSize());
   m_area.YSize(CElement::YSize());
//--- Margins from the edge
   m_area.XGap(CElement::X()-m_wnd.X());
   m_area.YGap(CElement::Y()-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_area);
   return(true);
  }
//+------------------------------------------------------------------+
//| Create label of editable edit control                            |
//+------------------------------------------------------------------+
bool CSlider::CreateLabel(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_slider_lable_"+(string)CElement::Id();
//--- Coordinates
   int x=CElement::X();
   int y=CElement::Y()+5;
//--- Set the object
   if(!m_label.Create(m_chart_id,name,m_subwin,x,y))
      return(false);
//--- set properties
   m_label.Description(m_label_text);
   m_label.Font(FONT);
   m_label.FontSize(FONT_SIZE);
   m_label.Color(m_label_color);
   m_label.Corner(m_corner);
   m_label.Anchor(m_anchor);
   m_label.Selectable(false);
   m_label.Z_Order(m_zorder);
   m_label.Tooltip("\n");
//--- Store coordinates
   m_area.X(x);
   m_area.Y(y);
//--- Margins from the edge
   m_label.XGap(x-m_wnd.X());
   m_label.YGap(y-m_wnd.Y());
//--- Initializing gradient array
   CElement::InitColorArray(m_label_color,m_label_color_hover,m_label_color_array);
//--- Store the object pointer
   CElement::AddToArray(m_label);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates edit control with spins                                  |
//+------------------------------------------------------------------+
bool CSlider::CreateEdit(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_slider_edit_"+(string)CElement::Id();
//--- Coordinates
   int x=CElement::X2()-m_edit_x_size;
   int y=CElement::Y()+3;
//--- Set the object
   if(!m_edit.Create(m_chart_id,name,m_subwin,x,y,m_edit_x_size,m_edit_y_size))
      return(false);
//--- set properties
   m_edit.Font(FONT);
   m_edit.FontSize(FONT_SIZE);
   m_edit.TextAlign(m_align_mode);
   m_edit.Description(::DoubleToString(m_edit_value,m_digits));
   m_edit.Color(m_edit_text_color);
   m_edit.BorderColor(m_edit_border_color);
   m_edit.BackColor(m_edit_color);
   m_edit.Corner(m_corner);
   m_edit.Anchor(m_anchor);
   m_edit.Selectable(false);
   m_edit.Z_Order(m_edit_zorder);
   m_edit.Tooltip("\n");
//--- Store coordinates
   m_edit.X(x);
   m_edit.Y(y);
//--- Size
   m_edit.XSize(m_edit_x_size);
   m_edit.YSize(m_edit_y_size);
//--- Margins from the edge
   m_edit.XGap(x-m_wnd.X());
   m_edit.YGap(y-m_wnd.Y());
//--- Initializing gradient array
   CElement::InitColorArray(m_edit_border_color,m_edit_border_color_hover,m_edit_border_color_array);
//--- Store the object pointer
   CElement::AddToArray(m_edit);
   return(true);
  }
//+------------------------------------------------------------------+
//| Create slot for the scrollbar                                    |
//+------------------------------------------------------------------+
bool CSlider::CreateSlot(void)
  {
//--- Store the form pointer
   m_slot.WindowPointer(m_wnd);
//--- set properties
   m_slot.TypeSepLine(H_SEP_LINE);
   m_slot.DarkColor(m_slot_line_dark_color);
   m_slot.LightColor(m_slot_line_light_color);
//--- Creating a separation line
   if(!m_slot.CreateSeparateLine(m_chart_id,m_subwin,0,CElement::X(),CElement::Y()+30,CElement::XSize(),m_slot_y_size))
      return(false);
//--- Store the object pointer
   CElement::AddToArray(m_slot.Object(0));
   return(true);
  }
//+------------------------------------------------------------------+
//| Create scrollbar indicator                                       |
//+------------------------------------------------------------------+
bool CSlider::CreateIndicator(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_slider_indicator_"+(string)CElement::Id();
//--- Coordinates
   int x=CElement::X();
   int y=m_slot.Y()+1;
//--- Size
   int y_size=m_slot_y_size-2;
//--- Set the object
   if(!m_indicator.Create(m_chart_id,name,m_subwin,x,y,m_x_size,y_size))
      return(false);
//--- set properties
   m_indicator.BackColor(m_slot_indicator_color);
   m_indicator.Color(m_slot_indicator_color);
   m_indicator.BorderType(BORDER_FLAT);
   m_indicator.Corner(m_corner);
   m_indicator.Selectable(false);
   m_indicator.Z_Order(m_zorder);
   m_indicator.Tooltip("\n");
//--- Store coordinates
   m_indicator.X(x);
   m_indicator.Y(y);
//--- Size
   m_indicator.XSize(CElement::XSize());
   m_indicator.YSize(y_size);
//--- Margins from the edge
   m_indicator.XGap(x-m_wnd.X());
   m_indicator.YGap(y-m_wnd.Y());
//--- Store the object pointer
   CElement::AddToArray(m_indicator);
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the slider runner                                        |
//+------------------------------------------------------------------+
bool CSlider::CreateThumb(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_slider_thumb_"+(string)CElement::Id();
//--- Coordinates
   int x=CElement::X();
   int y=m_slot.Y()-((m_thumb_y_size-m_slot_y_size)/2);
//--- Set the object
   if(!m_thumb.Create(m_chart_id,name,m_subwin,x,y,m_thumb_x_size,m_thumb_y_size))
      return(false);
//--- set properties
   m_thumb.Color(m_thumb_color);
   m_thumb.BackColor(m_thumb_color);
   m_thumb.BorderType(BORDER_FLAT);
   m_thumb.Corner(m_corner);
   m_thumb.Selectable(false);
   m_thumb.Z_Order(m_zorder);
   m_thumb.Tooltip("\n");
//--- Store the size (in the object)
   m_thumb.XSize(m_thumb.X_Size());
   m_thumb.YSize(m_thumb.Y_Size());
//--- Store coordinates
   m_thumb.X(x);
   m_thumb.Y(y);
//--- Margins from the edge
   m_thumb.XGap(x-m_wnd.X());
   m_thumb.YGap(y-m_wnd.Y());
//--- Calculation of the values of auxiliary variables
   CalculateCoefficients();
//--- Calculation of the X coordinates of the slider runner in relation to the current value in the entry field
   CalculateThumbX();
//--- Calculation of the slider runner position in the value range
   CalculateThumbPos();
//--- Update the slider indicator
   UpdateIndicator();
//--- Store the object pointer
   CElement::AddToArray(m_thumb);
   return(true);
  }
//+------------------------------------------------------------------+
//| Change the state of the control                                  |
//+------------------------------------------------------------------+
void CSlider::SliderState(const bool state)
  {
//--- Control state
   m_slider_state=state;
//--- Color of the text label
   m_label.Color((state)? m_label_color : m_label_color_locked);
//--- Color of the edit
   m_edit.Color((state)? m_edit_text_color : m_edit_text_color_locked);
   m_edit.BackColor((state)? m_edit_color : m_edit_color_locked);
   m_edit.BorderColor((state)? m_edit_border_color : m_edit_border_color_locked);
//--- Color of the indicator
   m_indicator.BackColor((state)? m_slot_indicator_color : m_slot_indicator_color_locked);
   m_indicator.Color((state)? m_slot_indicator_color : m_slot_indicator_color_locked);
//--- Color of the slider runner
   m_thumb.BackColor((state)? m_thumb_color : m_thumb_color_locked);
   m_thumb.Color((state)? m_thumb_color : m_thumb_color_locked);
//--- Setting in relation of the current state
   if(!m_slider_state)
      //--- Edit in the read only mode
      m_edit.ReadOnly(true);
   else
//--- The edit control in the edit mode
      m_edit.ReadOnly(false);
  }
//+------------------------------------------------------------------+
//| Set current value                                                |
//+------------------------------------------------------------------+
bool CSlider::SetValue(const double value)
  {
//--- Adjust considering the step
   double corrected_value=::MathRound(value/m_step_value)*m_step_value;
//--- Check for the minimum/maximum
   if(corrected_value<=m_min_value)
      corrected_value=m_min_value;
   if(corrected_value>=m_max_value)
      corrected_value=m_max_value;
//--- If the value has been changed
   if(m_edit_value!=corrected_value)
     {
      m_edit_value=corrected_value;
      return(true);
     }
//--- Value unchanged
   return(false);
  }
//+------------------------------------------------------------------+
//| Changing the value in the edit                                   |
//+------------------------------------------------------------------+
void CSlider::ChangeValue(const double value)
  {
//--- Check, adjust and store the new value
   SetValue(value);
//--- Set the new value in the entry field
   m_edit.Description(::DoubleToString(GetValue(),m_digits));
  }
//+------------------------------------------------------------------+
//| Changing the object color when the cursor is hovering over it    |
//+------------------------------------------------------------------+
void CSlider::ChangeObjectsColor(void)
  {
//--- Leave, if the control is blocked or is in the mode of the slider runner movement
   if(!m_slider_state || m_slider_thumb_state)
      return;
//---
   CElement::ChangeObjectColor(m_label.Name(),CElement::MouseFocus(),OBJPROP_COLOR,m_label_color,m_label_color_hover,m_label_color_array);
   CElement::ChangeObjectColor(m_edit.Name(),CElement::MouseFocus(),OBJPROP_BORDER_COLOR,m_edit_border_color,m_edit_border_color_hover,m_edit_border_color_array);
  }
//+------------------------------------------------------------------+
//| Change the color of the scrollbar                                |
//+------------------------------------------------------------------+
void CSlider::ChangeThumbColor(void)
  {
//--- Leave, if the form is blocked and the identifier of the currently active element differs
   if(m_wnd.IsLocked() && m_wnd.IdActivatedElement()!=CElement::Id())
      return;
//--- If the cursor is in the slider runner area
   if(m_thumb.MouseFocus())
     {
      //--- If the left mouse button is released
      if(m_clamping_area_mouse==THUMB_NOT_PRESSED)
        {
         m_slider_thumb_state=false;
         m_thumb.Color(m_thumb_color_hover);
         m_thumb.BackColor(m_thumb_color_hover);
        }
      //--- Left mouse button is pressed
      else if(m_clamping_area_mouse==THUMB_PRESSED_INSIDE)
        {
         m_slider_thumb_state=true;
         m_thumb.Color(m_thumb_color_pressed);
         m_thumb.BackColor(m_thumb_color_pressed);
        }
     }
//--- If the cursor is outside of the scrollbar area
   else
     {
      //--- Left mouse button is released
      if(!m_mouse_state)
        {
         m_slider_thumb_state=false;
         m_thumb.Color(m_thumb_color);
         m_thumb.BackColor(m_thumb_color);
        }
     }
  }
//+------------------------------------------------------------------+
//| Moving elements                                                  |
//+------------------------------------------------------------------+
void CSlider::Moving(const int x,const int y)
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
   m_edit.X(x+m_edit.XGap());
   m_edit.Y(y+m_edit.YGap());
   m_indicator.X(x+m_indicator.XGap());
   m_indicator.Y(y+m_indicator.YGap());
   m_thumb.X(x+m_thumb.XGap());
   m_thumb.Y(y+m_thumb.YGap());
//--- Updating coordinates of graphical objects  
   m_area.X_Distance(m_area.X());
   m_area.Y_Distance(m_area.Y());
   m_label.X_Distance(m_label.X());
   m_label.Y_Distance(m_label.Y());
   m_edit.X_Distance(m_edit.X());
   m_edit.Y_Distance(m_edit.Y());
   m_indicator.X_Distance(m_indicator.X());
   m_indicator.Y_Distance(m_indicator.Y());
   m_thumb.X_Distance(m_thumb.X());
   m_thumb.Y_Distance(m_thumb.Y());
//--- Moving the slot
   m_slot.Moving(x,y);
  }
//+------------------------------------------------------------------+
//| Shows a menu item                                                |
//+------------------------------------------------------------------+
void CSlider::Show(void)
  {
//--- Leave, if the element is already visible
   if(CElement::IsVisible())
      return;
//--- Make all objects visible
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_ALL_PERIODS);
//--- Show the slot
   m_slot.Show();
//--- State of visibility
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Hides a menu item                                                |
//+------------------------------------------------------------------+
void CSlider::Hide(void)
  {
//--- Leave, if the element is already visible
   if(!CElement::IsVisible())
      return;
//--- Hide all objects
   for(int i=0; i<CElement::ObjectsElementTotal(); i++)
      CElement::Object(i).Timeframes(OBJ_NO_PERIODS);
//--- Hide the slot
   m_slot.Hide();
//--- State of visibility
   CElement::IsVisible(false);
  }
//+------------------------------------------------------------------+
//| Redrawing                                                        |
//+------------------------------------------------------------------+
void CSlider::Reset(void)
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
void CSlider::Delete(void)
  {
//--- Removing objects  
   m_area.Delete();
   m_label.Delete();
   m_edit.Delete();
   m_slot.Delete();
   m_indicator.Delete();
   m_thumb.Delete();
//--- Emptying the array of the objects
   CElement::FreeObjectsArray();
//--- Initializing of variables by default values
   CElement::MouseFocus(false);
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Seth the priorities                                              |
//+------------------------------------------------------------------+
void CSlider::SetZorders(void)
  {
//--- Leave, if the element is blocked
   if(!m_slider_state)
      return;
//--- Set the default values
   m_area.Z_Order(m_area_zorder);
   m_label.Z_Order(m_zorder);
   m_edit.Z_Order(m_edit_zorder);
   m_indicator.Z_Order(m_zorder);
   m_thumb.Z_Order(m_zorder);
//--- The edit control in the edit mode
   m_edit.ReadOnly(false);
  }
//+------------------------------------------------------------------+
//| Reset the priorities                                             |
//+------------------------------------------------------------------+
void CSlider::ResetZorders(void)
  {
//--- Leave, if the element is blocked
   if(!m_slider_state)
      return;
//--- Zeroing priorities
   m_area.Z_Order(0);
   m_label.Z_Order(0);
   m_edit.Z_Order(0);
   m_indicator.Z_Order(0);
   m_thumb.Z_Order(0);
//--- Edit in the read only mode
   m_edit.ReadOnly(true);
  }
//+------------------------------------------------------------------+
//| Reset the color of the element objects                           |
//+------------------------------------------------------------------+
void CSlider::ResetColors(void)
  {
//--- Leave, if the element is blocked
   if(!m_slider_state)
      return;
//--- Reset the color
   m_label.Color(m_label_color);
   m_edit.BorderColor(m_edit_border_color);
//--- Zero the focus
   CElement::MouseFocus(false);
  }
//+------------------------------------------------------------------+
//| Handling the value entering in the edit                          |
//+------------------------------------------------------------------+
bool CSlider::OnEndEdit(const string object_name)
  {
//--- Leave, if the object name is different
   if(object_name!=m_edit.Name())
      return(false);
//--- Get the entered value
   double entered_value=::StringToDouble(m_edit.Description());
//--- Check, adjust and store the new value
   ChangeValue(entered_value);
//--- Calculate the X coordinate of the slider runner
   CalculateThumbX();
//--- Calculate the position in the value range
   CalculateThumbPos();
//--- Update the slider indicator
   UpdateIndicator();
//--- Send a message about it
   ::EventChartCustom(m_chart_id,ON_END_EDIT,CElement::Id(),CElement::Index(),m_label.Description());
   return(true);
  }
//+------------------------------------------------------------------+
//| Process of the slider runner movement                            |
//+------------------------------------------------------------------+
void CSlider::OnDragThumb(const int x)
  {
//--- To identify the new X coordinate
   int new_x_point=0;
//--- If the slider runner is inactive, ...
   if(!m_slider_thumb_state)
     {
      //--- ...zero auxiliary variables for moving the slider
      m_slider_point_fixing =0;
      m_slider_size_fixing  =0;
      return;
     }
//--- If the fixation point is zero, store current coordinates of the cursor
   if(m_slider_point_fixing==0)
      m_slider_point_fixing=x;
//--- If the distance from the edge of the slider to the current coordinate of the cursor is zero, calculate it
   if(m_slider_size_fixing==0)
      m_slider_size_fixing=m_thumb.X()-x;
//--- If the threshold is passed to the right in the pressed down state
   if(x-m_slider_point_fixing>0)
     {
      //--- Calculate the X coordinate
      new_x_point=x+m_slider_size_fixing;
      //--- Updating the scrollbar location
      UpdateThumb(new_x_point);
      return;
     }
//--- If the threshold is passed to the left in the pressed down state
   if(x-m_slider_point_fixing<0)
     {
      //--- Calculate the X coordinate
      new_x_point=x-::fabs(m_slider_size_fixing);
      //--- Updating the scrollbar location
      UpdateThumb(new_x_point);
      return;
     }
  }
//+------------------------------------------------------------------+
//| Updating the slider runner location                              |
//+------------------------------------------------------------------+
void CSlider::UpdateThumb(const int new_x_point)
  {
   int x=new_x_point;
//--- Zeroing the fixation point
   m_slider_point_fixing=0;
//--- Check for exceeding the working area
   if(new_x_point>m_area.X2()-m_thumb.XSize())
      x=m_area.X2()-m_thumb.XSize();
   if(new_x_point<=m_area.X())
      x=m_area.X();
//--- Update the list view and scrollbar
   m_thumb.X(x);
   m_thumb.X_Distance(x);
//--- Store margins
   m_thumb.XGap(m_thumb.X()-m_wnd.X());
  }
//+------------------------------------------------------------------+
//| Updating the slider indicator                                    |
//+------------------------------------------------------------------+
void CSlider::UpdateIndicator(void)
  {
//--- Calculate the size
   int x_size=m_thumb.X()-m_indicator.X();
//--- Adjustment in case of impermissible values
   if(x_size<=0)
      x_size=1;
//--- Setting a new size
   m_indicator.X_Size(x_size);
  }
//+------------------------------------------------------------------+
//| Verifies the state of the mouse button                           |
//+------------------------------------------------------------------+
void CSlider::CheckMouseButtonState(void)
  {
//--- If the left mouse button is released
   if(!m_mouse_state)
     {
      //--- Zero variables
      ZeroThumbVariables();
      return;
     }
//--- If the left mouse button is pressed
   else
     {
      //--- Leave, if the button is pressed down in another area
      if(m_clamping_area_mouse!=THUMB_NOT_PRESSED)
         return;
      //--- Outside of the slider runner area
      if(!m_thumb.MouseFocus())
         m_clamping_area_mouse=THUMB_PRESSED_OUTSIDE;
      //--- Inside the slider runner area
      else
        {
         m_clamping_area_mouse=THUMB_PRESSED_INSIDE;
         //--- Block the form and store the active element identifier
         m_wnd.IsLocked(true);
         m_wnd.IdActivatedElement(CElement::Id());
        }
     }
  }
//+------------------------------------------------------------------+
//| Zeroing variables related to the movement of the scrollbar       |
//+------------------------------------------------------------------+
void CSlider::ZeroThumbVariables(void)
  {
//--- If you are here, it means that the left mouse button is released.
//    If the left mouse button was pressed over the slider runner...
   if(m_clamping_area_mouse==THUMB_PRESSED_INSIDE)
     {
      //--- ... send a message that changing of the value in the entry field with the sider runner is completed
      ::EventChartCustom(m_chart_id,ON_END_EDIT,CElement::Id(),CElement::Index(),m_label.Description());
     }
//---
   m_slider_size_fixing  =0;
   m_clamping_area_mouse =THUMB_NOT_PRESSED;
//--- If the element identifier matches the activating identifier,
//    unblock the form and reset the identifier of the activated element
   if(CElement::Id()==m_wnd.IdActivatedElement())
     {
      m_wnd.IsLocked(false);
      m_wnd.IdActivatedElement(WRONG_VALUE);
     }
  }
//+------------------------------------------------------------------+
//| Calculation of values (steps and coefficients)                   |
//+------------------------------------------------------------------+
bool CSlider::CalculateCoefficients(void)
  {
//--- Leave, if the width of the element is less than the width of the slider runner
   if(CElement::XSize()<m_thumb_x_size)
      return(false);
//--- Number of pixels in the working area
   m_pixels_total=CElement::XSize()-m_thumb_x_size;
//--- Number of steps in the value range of the working area
   m_value_steps_total=int((m_max_value-m_min_value)/m_step_value);
//--- Step in relation to the width of the working area
   m_position_step=m_step_value*(double(m_value_steps_total)/double(m_pixels_total));
   return(true);
  }
//+------------------------------------------------------------------+
//| Calculating the X coordinate of the slider runner                |
//+------------------------------------------------------------------+
void CSlider::CalculateThumbX(void)
  {
//--- Adjustment considering that the minimum value can be negative
   double neg_range=(m_min_value<0)? ::fabs(m_min_value/m_position_step) : 0;
//--- Calculate the X coordinate for the slider runner
   m_current_pos_x=m_area.X()+(m_edit_value/m_position_step)+neg_range;
//--- If the working area is exceeded on the left
   if(m_current_pos_x<m_area.X())
      m_current_pos_x=m_area.X();
//--- If the working area is exceeded on the right
   if(m_current_pos_x+m_thumb.XSize()>m_area.X2())
      m_current_pos_x=m_area.X2()-m_thumb.XSize();
//--- Store and set the new X coordinate
   m_thumb.X(int(m_current_pos_x));
   m_thumb.X_Distance(int(m_current_pos_x));
   m_thumb.XGap(m_thumb.X()-m_wnd.X());
  }
//+------------------------------------------------------------------+
//| Calculation of the slider runner position in the value range     |
//+------------------------------------------------------------------+
void CSlider::CalculateThumbPos(void)
  {
//--- Get the position number of the slider runner
   m_current_pos=(m_thumb.X()-m_area.X())*m_position_step;
//--- Adjustment considering that the minimum value can be negative
   if(m_min_value<0 && m_current_pos_x!=WRONG_VALUE)
      m_current_pos+=int(m_min_value);
//--- Check for exceeding the working area on the right/left
   if(m_thumb.X2()>=m_area.X2())
      m_current_pos=int(m_max_value);
   if(m_thumb.X()<=m_area.X())
      m_current_pos=int(m_min_value);
  }
//+------------------------------------------------------------------+
