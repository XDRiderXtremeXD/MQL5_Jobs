//+------------------------------------------------------------------+
//|                                                  CanvasTable.mqh |
//|                        Copyright 2015, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include "Element.mqh"
#include "Window.mqh"
#include "Scrolls.mqh"
//+------------------------------------------------------------------+
//| Class for creating a rendered table                              |
//+------------------------------------------------------------------+
class CCanvasTable : public CElement
  {
private:
   //--- Pointer to the form to which the element is attached
   CWindow          *m_wnd;
   //--- Objects for creating a table
   CRectLabel        m_area;
   CRectCanvas       m_canvas;
   CScrollV          m_scrollv;
   CScrollH          m_scrollh;
   //--- Array of values and properties of the table
   struct CTOptions
     {
      string            m_vrows[];
      int               m_width;
      ENUM_ALIGN_MODE   m_text_align;
     };
   CTOptions         m_vcolumns[];
   //--- 
   int               m_rows_total;
   int               m_columns_total;
   int               m_visible_rows_total;
   int               m_visible_columns_total;
   //--- Total size and size of the visible part of the table
   int               m_table_x_size;
   int               m_table_y_size;
   int               m_table_visible_x_size;
   int               m_table_visible_y_size;
   //--- Background color
   color             m_area_color;
   //--- Grid color
   color             m_grid_color;
   //--- Size (height) of cells
   int               m_cell_y_size;
   //--- Cell color
   color             m_cell_color;
   //--- Text color
   color             m_cell_text_color;
   //--- Priorities of the left mouse button press
   int               m_zorder;
   int               m_cell_zorder;
   //--- State of the mouse button (pressed/released)
   ENUM_THUMB_MOUSE_STATE m_clamping_area_mouse;
   //--- State of the left mouse button (pressed down/released)
   bool              m_mouse_state;
   //--- Timer counter for fast forwarding the list view
   int               m_timer_counter;
   //---
public:
                     CCanvasTable(void);
                    ~CCanvasTable(void);
   //--- Methods for creating table
   bool              CreateTable(const long chart_id,const int subwin,const int x,const int y);
   //---
private:
   bool              CreateArea(void);
   bool              CreateCells(void);
   bool              CreateScrollV(void);
   bool              CreateScrollH(void);
   //---
public:
   //--- (1) Stores the form pointer, (2) returns pointers to scrollbars
   void              WindowPointer(CWindow &object)       { m_wnd=::GetPointer(object);      }
   CScrollV         *GetScrollVPointer(void)         { return(::GetPointer(m_scrollv)); }
   CScrollH         *GetScrollHPointer(void)         { return(::GetPointer(m_scrollh)); }
   //--- Color of the (1) background, (2) grid and (3) text of the table
   void              AreaColor(const color clr)           { m_cell_color=clr;                }
   void              GridColor(const color clr)           { m_grid_color=clr;                }
   void              TextColor(const color clr)           { m_cell_text_color=clr;           }
   //--- Returns the total number of (1) rows and (2) columns, (3) state of the scrollbar
   int               RowsTotal(void)                const { return(m_rows_total);            }
   int               ColumnsTotal(void)             const { return(m_columns_total);         }
   //--- Returns the number of (1) rows and (2) columns of the visible part of the table
   int               VisibleRowsTotal(void)         const { return(m_visible_rows_total);    }
   int               VisibleColumnsTotal(void)      const { return(m_visible_columns_total); }
   //--- Sets the (1) main size of the table and (2) size of its visible part
   void              TableSize(const int columns_total,const int rows_total);
   void              VisibleTableSize(const int visible_columns_total,const int visible_rows_total);
   //--- Set the (1) text alignment mode and (2) width for each column
   void              TextAlign(const ENUM_ALIGN_MODE &array[]);
   void              ColumnsWidth(const int &array[]);
   //--- Set the value to the specified table cell
   void              SetValue(const int column_index,const int row_index,const string value);
   //--- Get the value from the specified table cell
   string            GetValue(const int column_index,const int row_index);
   //--- Shift the table relative to the positions of scrollbars
   void              ShiftTable(void);
   //--- Draws the table with consideration of the recent changes
   void              DrawTable(void);
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
   virtual void      ResetColors(void) {}
   //---
private:
   //--- Calculate the tale size
   void              CalculateTableSize(void);
   //--- Draw grid
   void              DrawGrid(void);
   //--- Draw text
   void              DrawText(void);
   //--- Fast forward of the table
   void              FastSwitching(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CCanvasTable::CCanvasTable(void) : m_cell_y_size(18),
                                   m_rows_total(2),
                                   m_columns_total(1),
                                   m_visible_rows_total(2),
                                   m_visible_columns_total(1),
                                   m_grid_color(clrWhite),
                                   m_cell_color(clrWhite),
                                   m_cell_text_color(clrBlack)
  {
//--- Store the name of the element class in the base class
   CElement::ClassName(CLASS_NAME);
//--- Set priorities of the left mouse button click
   m_zorder      =1;
   m_cell_zorder =2;
//--- Set the size of the table and its visible part
   TableSize(m_columns_total,m_rows_total);
   VisibleTableSize(m_visible_columns_total,m_visible_rows_total);
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CCanvasTable::~CCanvasTable(void)
  {
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CCanvasTable::OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
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
      CElement::MouseFocus(x>X() && x<X2() && y>Y() && y<Y2());
      //--- If the scrollbar is active
      if(m_scrollv.ScrollBarControl(x,y,m_mouse_state) || m_scrollh.ScrollBarControl(x,y,m_mouse_state))
         ShiftTable();
      //---
      return;
     }
//--- Handling the pressing on objects
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      //--- If the scrollbar button was pressed
      if(m_scrollv.OnClickScrollInc(sparam) || m_scrollv.OnClickScrollDec(sparam) ||
         m_scrollh.OnClickScrollInc(sparam) || m_scrollh.OnClickScrollDec(sparam))
        {
         //--- Shift the table
         ShiftTable();
        }
     }
  }
//+------------------------------------------------------------------+
//| Timer                                                            |
//+------------------------------------------------------------------+
void CCanvasTable::OnEventTimer(void)
  {
//--- If this is a drop-down element
   if(CElement::IsDropdown())
      FastSwitching();
//--- If this is not a drop-down element, take current availability of the form into consideration
   else
     {
      //--- Track the fast forward of the table only if the form is not blocked
      if(!m_wnd.IsLocked())
         FastSwitching();
     }
  }
//+------------------------------------------------------------------+
//| Create a rendered table                                          |
//+------------------------------------------------------------------+
bool CCanvasTable::CreateTable(const long chart_id,const int subwin,const int x,const int y)
  {
//--- Leave, if there is no form pointer
   if(::CheckPointer(m_wnd)==POINTER_INVALID)
     {
      ::Print(__FUNCTION__," > Before creating the table, the class must be passed "
              "the form pointer: CCanvasTable::WindowPointer(CWindow &object).");
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
//--- Calculate the tale sizes
   CalculateTableSize();
//--- Create the table
   if(!CreateArea())
      return(false);
   if(!CreateCells())
      return(false);
   if(!CreateScrollV())
      return(false);
   if(!CreateScrollH())
      return(false);
//--- Hide the element if the window is a dialog one or is minimized
   if(m_wnd.WindowType()==W_DIALOG || m_wnd.IsMinimized())
      Hide();
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the table background                                      |
//+------------------------------------------------------------------+
bool CCanvasTable::CreateArea(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_table_area_"+(string)CElement::Id();
//--- Creating the object
   if(!m_area.Create(m_chart_id,name,m_subwin,m_x,m_y,m_x_size,m_y_size))
      return(false);
//--- Setting the properties
   m_area.BackColor(m_cell_color);
   m_area.Color(m_cell_color);
   m_area.BorderType(BORDER_FLAT);
   m_area.Corner(m_corner);
   m_area.Selectable(false);
   m_area.Z_Order(m_zorder);
   m_area.Tooltip("\n");
//--- Margins from the edge
   m_area.XGap(m_x-m_wnd.X());
   m_area.YGap(m_y-m_wnd.Y());
//--- Store the size
   m_area.XSize(m_x_size);
   m_area.YSize(m_y_size);
//--- Store coordinates
   m_area.X(m_x);
   m_area.Y(m_y);
//--- Store the object pointer
   CElement::AddToArray(m_area);
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the grid of table cells                                   |
//+------------------------------------------------------------------+
bool CCanvasTable::CreateCells(void)
  {
//--- Forming the object name
   string name=CElement::ProgramName()+"_table_canvas_"+(string)CElement::Id();
//--- Coordinates
   int x =CElement::X()+1;
   int y =CElement::Y()+1;
//--- Creating the object
   ::ResetLastError();
   if(!m_canvas.CreateBitmapLabel(m_chart_id,m_subwin,name,x,y,m_table_x_size,m_table_y_size,COLOR_FORMAT_ARGB_NORMALIZE))
     {
      ::Print(__FUNCTION__," > Failed to create a canvas for drawing the table: ",::GetLastError());
      return(false);
     }
//--- Attach to the chart
   if(!m_canvas.Attach(m_chart_id,name,m_subwin,1))
      return(false);
//--- set properties
   m_canvas.Tooltip("\n");
//--- Coordinates
   m_canvas.X(x);
   m_canvas.Y(y);
//--- Margins from the edge of the panel
   m_canvas.XGap(x-m_wnd.X());
   m_canvas.YGap(y-m_wnd.Y());
//--- Store the size
   m_canvas.XSize(m_table_x_size);
   m_canvas.YSize(m_table_y_size);
//--- Store the object pointer
   CElement::AddToArray(m_canvas);
//--- Set the size of the visible area
   ::ObjectSetInteger(m_chart_id,name,OBJPROP_XSIZE,m_table_visible_x_size);
   ::ObjectSetInteger(m_chart_id,name,OBJPROP_YSIZE,m_table_visible_y_size);
//--- Set the frame offset within the image along the X and Y axes
   ::ObjectSetInteger(m_chart_id,name,OBJPROP_XOFFSET,0);
   ::ObjectSetInteger(m_chart_id,name,OBJPROP_YOFFSET,0);
//--- Draw the table
   DrawTable();
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the vertical scrollbar                                   |
//+------------------------------------------------------------------+
bool CCanvasTable::CreateScrollV(void)
  {
//--- If the total number of rows is greater than the visible part of the table,
//    set a vertical scrollbar
   if(m_rows_total<=m_visible_rows_total)
      return(true);
//--- Store the form pointer
   m_scrollv.WindowPointer(m_wnd);
//--- Coordinates
   int x=CElement::X2()-m_scrollv.ScrollWidth()+1;
   int y=CElement::Y();
//--- set properties
   m_scrollv.Id(CElement::Id());
   m_scrollv.IsDropdown(CElement::IsDropdown());
   m_scrollv.XSize(m_scrollv.ScrollWidth());
   m_scrollv.YSize(m_cell_y_size*m_visible_rows_total+2-(m_visible_rows_total-1));
//--- Creating the scrollbar
   if(!m_scrollv.CreateScroll(m_chart_id,m_subwin,x,y,m_rows_total,m_visible_rows_total))
      return(false);
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the horizontal scrollbar                                 |
//+------------------------------------------------------------------+
bool CCanvasTable::CreateScrollH(void)
  {
//--- If the total with of the table is greater than its visible part,
//    set a horizontal scrollbar
   if(m_table_x_size<=m_table_visible_x_size)
      return(true);
//--- Store the form pointer
   m_scrollh.WindowPointer(m_wnd);
//--- Coordinates
   int x=CElement::X();
   int y=CElement::Y2()-m_scrollh.ScrollWidth();
//--- set properties
   m_scrollh.Id(CElement::Id());
   m_scrollh.IsDropdown(CElement::IsDropdown());
   m_scrollh.XSize(m_area.XSize()-m_scrollh.ScrollWidth()+1);
   m_scrollh.YSize(m_scrollh.ScrollWidth());
//--- Creating the scrollbar
   if(!m_scrollh.CreateScroll(m_chart_id,m_subwin,x,y,m_table_x_size,m_table_visible_x_size))
      return(false);
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Fills the array of text alignment modes                          |
//+------------------------------------------------------------------+
void CCanvasTable::TextAlign(const ENUM_ALIGN_MODE &array[])
  {
   int total=0;
   int array_size=::ArraySize(array);
//--- Leave, if a zero-sized array was passed
   if(array_size<1)
      return;
//--- Adjust the value to prevent the array exceeding the range 
   total=(array_size<m_columns_total)? array_size : m_columns_total;
//--- Store the values in the structure
   for(int c=0; c<total; c++)
      m_vcolumns[c].m_text_align=array[c];
  }
//+------------------------------------------------------------------+
//| Fills the array of column widths                                 |
//+------------------------------------------------------------------+
void CCanvasTable::ColumnsWidth(const int &array[])
  {
   int total=0;
   int array_size=::ArraySize(array);
//--- Leave, if a zero-sized array was passed
   if(array_size<1)
      return;
//--- Adjust the value to prevent the array exceeding the range 
   total=(array_size<m_columns_total)? array_size : m_columns_total;
//--- Store the values in the structure
   for(int c=0; c<total; c++)
      m_vcolumns[c].m_width=array[c];
  }
//+------------------------------------------------------------------+
//| Fills the array by the specified indexes                         |
//+------------------------------------------------------------------+
void CCanvasTable::SetValue(const int column_index,const int row_index,const string value)
  {
//--- Checking for exceeding the column range
   int csize=::ArraySize(m_vcolumns);
   if(csize<1 || column_index<0 || column_index>=csize)
      return;
//--- Checking for exceeding the row range
   int rsize=::ArraySize(m_vcolumns[column_index].m_vrows);
   if(rsize<1 || row_index<0 || row_index>=rsize)
      return;
//--- Store the value into the array
   m_vcolumns[column_index].m_vrows[row_index]=value;
  }
//+------------------------------------------------------------------+
//| Return value at the specified index                              |
//+------------------------------------------------------------------+
string CCanvasTable::GetValue(const int column_index,const int row_index)
  {
//--- Checking for exceeding the column range
   int csize=::ArraySize(m_vcolumns);
   if(csize<1 || column_index<0 || column_index>=csize)
      return("");
//--- Checking for exceeding the row range
   int rsize=::ArraySize(m_vcolumns[column_index].m_vrows);
   if(rsize<1 || row_index<0 || row_index>=rsize)
      return("");
//--- Return the value
   return(m_vcolumns[column_index].m_vrows[row_index]);
  }
//+------------------------------------------------------------------+
//| Set the size of the table                                        |
//+------------------------------------------------------------------+
void CCanvasTable::TableSize(const int columns_total,const int rows_total)
  {
//--- There must be at least one column
   m_columns_total=(columns_total<1) ? 1 : columns_total;
//--- There must be at least two rows
   m_rows_total=(rows_total<2) ? 2 : rows_total;
//--- Set the size of the columns array
   ::ArrayResize(m_vcolumns,m_columns_total);
//--- Set the size of the rows arrays
   for(int i=0; i<m_columns_total; i++)
     {
      ::ArrayResize(m_vcolumns[i].m_vrows,m_rows_total);
      //--- Initialize the column properties with the default values
      m_vcolumns[i].m_width      =100;
      m_vcolumns[i].m_text_align =ALIGN_CENTER;
     }
  }
//+------------------------------------------------------------------+
//| Set the size of the visible part of the table                    |
//+------------------------------------------------------------------+
void CCanvasTable::VisibleTableSize(const int visible_columns_total,const int visible_rows_total)
  {
//--- There must be at least one column
   m_visible_columns_total=(visible_columns_total<1) ? 1 : visible_columns_total;
//--- There must be at least two rows
   m_visible_rows_total=(visible_rows_total<2) ? 2 : visible_rows_total;
  }
//+------------------------------------------------------------------+
//| Calculate the size of the table                                  |
//+------------------------------------------------------------------+
void CCanvasTable::CalculateTableSize(void)
  {
//--- Calculate the total width of the table
   m_table_x_size=0;
   for(int c=0; c<m_columns_total; c++)
      m_table_x_size=m_table_x_size+m_vcolumns[c].m_width;
//--- Width of the table with a vertical scrollbar
   int x_size=(m_rows_total>m_visible_rows_total) ? m_x_size-m_scrollh.ScrollWidth() : m_x_size-2;
//--- If the width of all columns is less than the table width, use the table width
   if(m_table_x_size<m_x_size)
      m_table_x_size=x_size;
//--- Calculate the total height of the table
   m_table_y_size=m_cell_y_size*m_rows_total-(m_rows_total-1);
//--- Set the frame size to display a fragment of the image (visible part of the table)
   m_table_visible_x_size=x_size;
   m_table_visible_y_size=m_cell_y_size*m_visible_rows_total-(m_visible_rows_total-1);
//--- If there is a horizontal scrollbar, adjust the control size along the Y axis
   int y_size=m_cell_y_size*m_visible_rows_total+2-(m_visible_rows_total-1);
   m_y_size=(m_table_x_size>m_table_visible_x_size) ? y_size+m_scrollh.ScrollWidth()-1 : y_size;
  }
//+------------------------------------------------------------------+
//| Draw grid                                                        |
//+------------------------------------------------------------------+
void CCanvasTable::DrawGrid(void)
  {
//--- Grid color
   uint clr=::ColorToARGB(m_grid_color,255);
//--- Size of canvas for drawing
   int x_size =m_canvas.XSize()-1;
   int y_size =m_canvas.YSize()-1;
//--- Coordinates
   int x1=0,x2=0,y1=0,y2=0;
//--- Horizontal lines
   x1=0;
   y1=0;
   x2=x_size;
   y2=0;
   for(int i=0; i<=m_rows_total; i++)
     {
      m_canvas.Line(x1,y1,x2,y2,clr);
      y2=y1+=m_cell_y_size-1;
     }
//--- Vertical lines
   x1=0;
   y1=0;
   x2=0;
   y2=y_size;
   for(int i=0; i<m_columns_total; i++)
     {
      m_canvas.Line(x1,y1,x2,y2,clr);
      x2=x1+=m_vcolumns[i].m_width;
     }
//--- Right
   x1=x_size;
   y1=0;
   x2=x_size;
   y2=y_size;
   m_canvas.Line(x1,y1,x2,y2,clr);
  }
//+------------------------------------------------------------------+
//| Draw text                                                        |
//+------------------------------------------------------------------+
void CCanvasTable::DrawText(void)
  {
//--- To calculate the coordinates and offsets
   int  x             =0;
   int  y             =0;
   uint text_align    =0;
   int  column_offset =0;
   int  cell_x_offset =10;
   int  cell_y_offset =3;
//--- Text color
   uint clr=::ColorToARGB(m_cell_text_color,255);
//--- Font properties
   m_canvas.FontSet(FONT,-80,FW_NORMAL);
//--- Columns
   for(int c=0; c<m_columns_total; c++)
     {
      //--- Offset calculation for the first column
      if(c==0)
        {
         //--- Text alignment in cells based on the mode set for each column
         switch(m_vcolumns[0].m_text_align)
           {
            //--- Center
            case ALIGN_CENTER :
               column_offset=column_offset+m_vcolumns[0].m_width/2;
               x=column_offset;
               break;
               //--- Right
            case ALIGN_RIGHT :
               column_offset=column_offset+m_vcolumns[0].m_width;
               x=column_offset-cell_x_offset;
               break;
               //--- Left
            case ALIGN_LEFT :
               x=column_offset+cell_x_offset;
               break;
           }
        }
      //--- Calculation of offsets for all columns except the first
      else
        {
         //--- Text alignment in cells based on the mode set for each column
         switch(m_vcolumns[c].m_text_align)
           {
            //--- Center
            case ALIGN_CENTER :
               //--- Calculation of offset relative to the alignment in the previous column
               switch(m_vcolumns[c-1].m_text_align)
                 {
                  case ALIGN_CENTER :
                     column_offset=column_offset+(m_vcolumns[c-1].m_width/2)+(m_vcolumns[c].m_width/2);
                     break;
                  case ALIGN_RIGHT :
                     column_offset=column_offset+(m_vcolumns[c].m_width/2);
                     break;
                  case ALIGN_LEFT :
                     column_offset=column_offset+m_vcolumns[c-1].m_width+(m_vcolumns[c].m_width/2);
                     break;
                 }
               //---
               x=column_offset;
               break;
               //--- Right
            case ALIGN_RIGHT :
               //--- Calculation of offset relative to the alignment in the previous column
               switch(m_vcolumns[c-1].m_text_align)
                 {
                  case ALIGN_CENTER :
                     column_offset=column_offset+(m_vcolumns[c-1].m_width/2)+m_vcolumns[c].m_width;
                     x=column_offset-cell_x_offset;
                     break;
                  case ALIGN_RIGHT :
                     column_offset=column_offset+m_vcolumns[c].m_width;
                     x=column_offset-cell_x_offset;
                     break;
                  case ALIGN_LEFT :
                     column_offset=column_offset+m_vcolumns[c-1].m_width+m_vcolumns[c].m_width;
                     x=column_offset-cell_x_offset;
                     break;
                 }
               //---
               break;
               //--- Left
            case ALIGN_LEFT :
               //--- Calculation of offset relative to the alignment in the previous column
               switch(m_vcolumns[c-1].m_text_align)
                 {
                  case ALIGN_CENTER :
                     column_offset=column_offset+(m_vcolumns[c-1].m_width/2);
                     x=column_offset+cell_x_offset;
                     break;
                  case ALIGN_RIGHT :
                     x=column_offset+cell_x_offset;
                     break;
                  case ALIGN_LEFT :
                     column_offset=column_offset+m_vcolumns[c-1].m_width;
                     x=column_offset+cell_x_offset;
                     break;
                 }
               //---
               break;
           }
        }
      //--- Rows
      for(int r=0; r<m_rows_total; r++)
        {
         //---
         y+=(r>0) ? m_cell_y_size-1 : cell_y_offset;
         //---
         switch(m_vcolumns[c].m_text_align)
           {
            case ALIGN_CENTER :
               text_align=TA_CENTER|TA_TOP;
               break;
            case ALIGN_RIGHT :
               text_align=TA_RIGHT|TA_TOP;
               break;
            case ALIGN_LEFT :
               text_align=TA_LEFT|TA_TOP;
               break;
           }
         //--- Draw text
         m_canvas.TextOut(x,y,m_vcolumns[c].m_vrows[r],clr,text_align);
        }
      //--- Zero the Y coordinate for the next cycle
      y=0;
     }
  }
//+------------------------------------------------------------------+
//| Draw table                                                       |
//+------------------------------------------------------------------+
void CCanvasTable::DrawTable(void)
  {
//--- Make the background transparent
   m_canvas.Erase(::ColorToARGB(clrNONE,0));
//--- Draw grid
   DrawGrid();
//--- Draw text
   DrawText();
//--- Display the latest drawn changes
   m_canvas.Update();
//--- Shift the table relative to the scrollbars
   ShiftTable();
  }
//+------------------------------------------------------------------+
//| Shift the table relative to the scrollbars                       |
//+------------------------------------------------------------------+
void CCanvasTable::ShiftTable(void)
  {
//--- Get the current positions of sliders of the vertical and horizontal scrollbars
   int h=m_scrollh.CurrentPos();
   int v=m_scrollv.CurrentPos();
//--- Calculation of the table position relative to the scrollbar sliders
   long c=h;
   long r=v*(m_cell_y_size-1);
//--- Shift of the table
   ::ObjectSetInteger(m_chart_id,m_canvas.Name(),OBJPROP_XOFFSET,c);
   ::ObjectSetInteger(m_chart_id,m_canvas.Name(),OBJPROP_YOFFSET,r);
  }
//+------------------------------------------------------------------+
//| Moving the element                                               |
//+------------------------------------------------------------------+
void CCanvasTable::Moving(const int x,const int y)
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
   m_canvas.X(x+m_canvas.XGap());
   m_canvas.Y(y+m_canvas.YGap());
//--- Updating coordinates of graphical objects
   m_area.X_Distance(m_area.X());
   m_area.Y_Distance(m_area.Y());
   m_canvas.X_Distance(m_canvas.X());
   m_canvas.Y_Distance(m_canvas.Y());
  }
//+------------------------------------------------------------------+
//| Shows the element                                                |
//+------------------------------------------------------------------+
void CCanvasTable::Show(void)
  {
//--- Leave, if the element is already visible
   if(CElement::IsVisible())
      return;
//--- Make all objects visible
   m_area.Timeframes(OBJ_ALL_PERIODS);
   m_canvas.Timeframes(OBJ_ALL_PERIODS);
   m_scrollv.Show();
   m_scrollh.Show();
//--- State of visibility
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Hides the element                                                |
//+------------------------------------------------------------------+
void CCanvasTable::Hide(void)
  {
//--- Leave, if the element is already hidden
   if(!CElement::IsVisible())
      return;
//--- Hide all objects
   m_area.Timeframes(OBJ_NO_PERIODS);
   m_canvas.Timeframes(OBJ_NO_PERIODS);
   m_scrollv.Hide();
   m_scrollh.Hide();
//--- State of visibility
   CElement::IsVisible(false);
  }
//+------------------------------------------------------------------+
//| Redrawing                                                        |
//+------------------------------------------------------------------+
void CCanvasTable::Reset(void)
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
void CCanvasTable::Delete(void)
  {
//--- Delete graphical objects
   m_area.Delete();
   m_canvas.Delete();
//--- Emptying the control arrays
   for(int c=0; c<m_columns_total; c++)
      ::ArrayFree(m_vcolumns[c].m_vrows);
//---
   ::ArrayFree(m_vcolumns);
//--- Emptying the array of the objects
   CElement::FreeObjectsArray();
//--- Initializing of variables by default values
   CElement::IsVisible(true);
  }
//+------------------------------------------------------------------+
//| Seth the priorities                                              |
//+------------------------------------------------------------------+
void CCanvasTable::SetZorders(void)
  {
   m_area.Z_Order(m_zorder);
   m_canvas.Z_Order(m_cell_zorder);
   m_scrollv.SetZorders();
   m_scrollh.SetZorders();
  }
//+------------------------------------------------------------------+
//| Reset the priorities                                             |
//+------------------------------------------------------------------+
void CCanvasTable::ResetZorders(void)
  {
   m_area.Z_Order(0);
   m_canvas.Z_Order(0);
   m_scrollv.ResetZorders();
   m_scrollh.ResetZorders();
  }
//+------------------------------------------------------------------+
//| Fast forward of the scrollbar                                    |
//+------------------------------------------------------------------+
void CCanvasTable::FastSwitching(void)
  {
//--- Leave, if there is no focus on the list view
   if(!CElement::MouseFocus())
      return;
//--- Return the counter to the initial value if the mouse button is released
   if(!m_mouse_state)
      m_timer_counter=SPIN_DELAY_MSC;
//--- If the mouse button is pressed down
   else
     {
      //--- Increase the counter by the set step
      m_timer_counter+=TIMER_STEP_MSC;
      //--- Leave, if less than zero
      if(m_timer_counter<0)
         return;
      //--- If scrolling up
      if(m_scrollv.ScrollIncState())
         m_scrollv.OnClickScrollInc(m_scrollv.ScrollIncName());
      //--- If scrolling down
      else if(m_scrollv.ScrollDecState())
         m_scrollv.OnClickScrollDec(m_scrollv.ScrollDecName());
      //--- If scrolling left
      else if(m_scrollh.ScrollIncState())
         m_scrollh.OnClickScrollInc(m_scrollh.ScrollIncName());
      //--- If scrolling right
      else if(m_scrollh.ScrollDecState())
         m_scrollh.OnClickScrollDec(m_scrollh.ScrollDecName());
      //--- Shift the table
      ShiftTable();
     }
  }
//+------------------------------------------------------------------+
