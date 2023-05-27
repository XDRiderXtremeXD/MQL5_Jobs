//+------------------------------------------------------------------+
//|                                                      Program.mqh |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#include <EasyAndFastGUI\Controls\WndEvents.mqh>
//+------------------------------------------------------------------+
//| Class creating a trading panel                                   |
//+------------------------------------------------------------------+
class CProgram : public CWndEvents
  {
protected:
   //--- Form
   CWindow           m_window;
   //--- Rendered table
   CCanvasTable      m_canvas_table;
   //---
public:
                     CProgram();
                    ~CProgram();
   //--- Event handler
   void              OnEvent(const int milliseconds);
   //--- Creates the information panel
   bool              CreateInfoPanel(void);
   //---
protected:
   //--- Creates a form
   bool              CreateWindow(const string text);
   //--- Rendered table
#define TABLE_GAP_X             (1)
#define TABLE_GAP_Y             (19)
   bool              CreateCanvasTable(void);
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CProgram::CProgram(void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CProgram::~CProgram(void)
  {
  }
//+------------------------------------------------------------------+
//| Events                                                           |
//+------------------------------------------------------------------+
void CProgram::OnEvent(const int milliseconds)
  {
   static int count =0;  // Counter
   string     str   =""; // Line for the header
//--- Formation of the header with the process progress
   switch(count)
     {
      case 0 : str="SCRIPT PANEL";     break;
      case 1 : str="SCRIPT PANEL .";   break;
      case 2 : str="SCRIPT PANEL ..";  break;
      case 3 : str="SCRIPT PANEL ..."; break;
     }
//--- Update the header line
   m_window.CaptionText(str);
//--- Change the data in the first column of the table
   for(int r=0; r<13; r++)
      m_canvas_table.SetValue(1,r,string(::rand()));
//--- Display new data of the table
   m_canvas_table.DrawTable();
//--- Redrawing the chart
   m_chart.Redraw();
//--- Increase the counter
   count++;
//--- If greater than three, zero
   if(count>3)
      count=0;
//--- Pause
   ::Sleep(milliseconds);
  }
//+------------------------------------------------------------------+
//| Creates the information panel                                    |
//+------------------------------------------------------------------+
bool CProgram::CreateInfoPanel(void)
  {
//--- Creating the form
   if(!CreateWindow("SCRIPT PANEL"))
      return(false);
//--- Create rendered table
   if(!CreateCanvasTable())
      return(false);
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates a form                                                   |
//+------------------------------------------------------------------+
bool CProgram::CreateWindow(const string caption_text)
  {
//--- Add the window pointer to the window array
   CWndContainer::AddWindow(m_window);
//--- Coordinates
   int x=2;
   int y=14;
//--- Properties
   m_window.Movable(false);
   m_window.XSize(207);
   m_window.YSize(244);
   m_window.WindowBgColor(clrWhiteSmoke);
   m_window.WindowBorderColor(clrLightSteelBlue);
   m_window.CaptionBgColor(clrLightSteelBlue);
   m_window.CaptionBgColorHover(clrLightSteelBlue);
//--- Creating a panel base from the background and the header
   if(!m_window.CreateWindow(m_chart_id,m_subwin,caption_text,x,y))
      return(false);
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Create a table                                                   |
//+------------------------------------------------------------------+
bool CProgram::CreateCanvasTable(void)
  {
#define COLUMNS_TOTAL 2
#define ROWS_TOTAL    13
//--- Pass the panel object
   m_canvas_table.WindowPointer(m_window);
//--- Coordinates
   int x=m_window.X()+TABLE_GAP_X;
   int y=m_window.Y()+TABLE_GAP_Y;
//--- The number of visible rows
   int visible_rows_total=13;
//--- Arrays with column widths and text alignment modes
   int width[]={120,84};
   ENUM_ALIGN_MODE align[]={ALIGN_RIGHT,ALIGN_LEFT};
//--- Set properties before creation
   m_canvas_table.XSize(205);
   m_canvas_table.TableSize(COLUMNS_TOTAL,ROWS_TOTAL);
   m_canvas_table.VisibleTableSize(0,visible_rows_total);
   m_canvas_table.TextAlign(align);
   m_canvas_table.ColumnsWidth(width);
   m_canvas_table.GridColor(clrLightGray);
//--- Populate the table with data
   for(int c=0; c<COLUMNS_TOTAL; c++)
      for(int r=0; r<ROWS_TOTAL; r++)
         m_canvas_table.SetValue(c,r,(c==0)? "Parameter "+string(r)+":" : string(::rand()));
//--- Create control
   if(!m_canvas_table.CreateTable(m_chart_id,m_subwin,x,y))
      return(false);
//--- Add the object to the common array of object groups
   CWndContainer::AddToElementsArray(0,m_canvas_table);
   return(true);
  }
//+------------------------------------------------------------------+
