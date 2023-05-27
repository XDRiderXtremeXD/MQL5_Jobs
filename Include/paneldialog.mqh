//+------------------------------------------------------------------
//|                                                  PanelDialog.mqh |
//|                        Copyright 2011, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------
#include <Controls\Dialog.mqh>
#include <Controls\Panel.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Label.mqh>
#include <Controls\SpinEdit.mqh>
//+------------------------------------------------------------------+
//| definiciones                                                     |
//+------------------------------------------------------------------+
//--- indents and spacing
#define INDENT_LEFT                         (11)      // sangria a la izquierda (incluyendo el ancho del borde)
#define INDENT_TOP                          (11)      // sangría superior (incluyendo el ancho del borde)
#define INDENT_RIGHT                        (11)      // sangria a la izquierda (incluyendo el ancho del borde)
#define INDENT_BOTTOM                       (11)      // sangría inferior (incluyendo el ancho del borde)
#define CONTROLS_GAP_X                      (10)      // espaciamiento a lo largo del eje X
#define CONTROLS_GAP_Y                      (10)      // espaciamiento a lo largo del eje Y
//--- for labels
#define LABEL_WIDTH                         (50)      // tamaño a lo largo del eje X
//--- for edits
#define EDIT_WIDTH                          (50)      // tamaño a lo largo del eje X
#define EDIT_HEIGHT                         (20)      // tamaño a lo largo del eje Y
//--- for base colors (RGB)
#define BASE_COLOR_MIN                      (0)       // valor mínimo del componente de color
#define BASE_COLOR_MAX                      (255)     // valor máximo del componente de color
//+------------------------------------------------------------------+
//| Clase CPanelDialog                                               |
//| Función: de diálogo principal de la aplicación                   |
//+------------------------------------------------------------------+
class CPanelDialog : public CAppDialog
  {
private:
   //--- Controles adicionales
   CPanel            m_color;                         // objeto de visualización de color
   CLabel            m_label_red;                     // nivel de subtitulo del objeto "rojo"
   CEdit             m_field_red;                     // valor de visualización del objeto "rojo"
   CLabel            m_label_green;                   // nivel de subtitulo del objeto "verde"
   CEdit             m_field_green;                   // valor de visualización del objeto "verde"
   CLabel            m_label_blue;                    // nivel de subtitulo del objeto "azul"
   CSpinEdit         m_edit_blue;                     // control del valor del objeto "azul" 
   //--- parámetros de los valores
   int               m_red;                           // valor "rojo"
   int               m_green;                         // valor "verde"
   int               m_blue;                          // valor "azul"

public:
                     CPanelDialog(void);
                    ~CPanelDialog(void);
   //--- creación
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   //--- controlador de eventos de la gráfica
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   //--- propiedades
   void              SetRed(const int value);
   void              SetGreen(const int value);
   void              SetBlue(const int value);

protected:
   //--- creando controles adicionales
   bool              CreateColor(void);
   bool              CreateRed(void);
   bool              CreateGreen(void);
   bool              CreateBlue(void);
   //--- controlador de eventos internos
   virtual bool      OnResize(void);
   //--- controladores de eventos para controles adicionales
   void              OnChangeBlue(void);
   //--- métodos
   void              SetColor(void);
  };
//+------------------------------------------------------------------+
//| Gestión de eventos                                               |
//+------------------------------------------------------------------+
EVENT_MAP_BEGIN(CPanelDialog)
   ON_EVENT(ON_CHANGE,m_edit_blue,OnChangeBlue)
EVENT_MAP_END(CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CPanelDialog::CPanelDialog(void) : m_red((BASE_COLOR_MAX-BASE_COLOR_MIN)/2),
                                   m_green((BASE_COLOR_MAX-BASE_COLOR_MIN)/2),
                                   m_blue((BASE_COLOR_MAX-BASE_COLOR_MIN)/2)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CPanelDialog::~CPanelDialog(void)
  {
  }
//+------------------------------------------------------------------+
//| Creación                                                         |
//+------------------------------------------------------------------+
bool CPanelDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
//--- llamando al método de clase parental
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))                           return(false);
//--- creando controles adicionales
   if(!CreateColor())                                                               return(false);
   if(!CreateRed())                                                                 return(false);
   if(!CreateGreen())                                                               return(false);
   if(!CreateBlue())                                                                return(false);
//--- estableciendo el panel de color
   SetColor();
//--- éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Creation del panel de color                                      |
//+------------------------------------------------------------------+
bool CPanelDialog::CreateColor(void)
  {
//--- coordenadas
   int x1=INDENT_LEFT+LABEL_WIDTH+CONTROLS_GAP_X+EDIT_WIDTH+CONTROLS_GAP_X;
   int y1=INDENT_TOP;
   int x2=ClientAreaWidth()-INDENT_RIGHT;
   int y2=ClientAreaHeight()-INDENT_BOTTOM;
//--- creando
   if(!m_color.Create(m_chart_id,m_name+"Color",m_subwin,x1,y1,x2,y2))              return(false);
   if(!m_color.ColorBorder(CONTROLS_EDIT_COLOR_BORDER))                             return(false);
   if(!Add(m_color))                                                                return(false);
//--- éxito
   return(true);
  }
//+-------------------------------------------------------------------------+
//| Creando el elemento de presentación "Rojo" con el subtitulo explicativo |
//+-------------------------------------------------------------------------+
bool CPanelDialog::CreateRed(void)
  {
//--- coordenadas
   int x1=INDENT_LEFT;
   int y1=INDENT_TOP;
   int x2=x1+EDIT_WIDTH;
   int y2=y1+EDIT_HEIGHT;
//--- creando la leyenda
   if(!m_label_red.Create(m_chart_id,m_name+"LabelRed",m_subwin,x1,y1+1,x2,y2))     return(false);
   if(!m_label_red.Text("Red"))                                                     return(false);
   if(!Add(m_label_red))                                                            return(false);
//--- ajustando las coordenadas
   x1+=LABEL_WIDTH+CONTROLS_GAP_X;
   x2=x1+EDIT_WIDTH;
//--- creando el elemento de visualización
   if(!m_field_red.Create(m_chart_id,m_name+"Red",m_subwin,x1,y1,x2,y2))            return(false);
   if(!m_field_red.Text(IntegerToString(m_red)))                                    return(false);
   if(!m_field_red.ReadOnly(true))                                                  return(false);
   if(!Add(m_field_red))                                                            return(false);
//--- éxito
   return(true);
  }
//+--------------------------------------------------------------------------+
//| Creando el elemento de presentación "Verde" con el subtitulo explicativo |
//+--------------------------------------------------------------------------+
bool CPanelDialog::CreateGreen(void)
  {
//--- coordenadas
   int x1=INDENT_LEFT;
   int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
   int x2=x1+EDIT_WIDTH;
   int y2=y1+EDIT_HEIGHT;
//--- creando la leyenda
   if(!m_label_green.Create(m_chart_id,m_name+"LabelGreen",m_subwin,x1,y1+1,x2,y2)) return(false);
   if(!m_label_green.Text("Green"))                                                 return(false);
   if(!Add(m_label_green))                                                          return(false);
//--- ajustando las coordenadas
   x1+=LABEL_WIDTH+CONTROLS_GAP_X;
   x2=x1+EDIT_WIDTH;
//--- creando el elemento de visualización
   if(!m_field_green.Create(m_chart_id,m_name+"Green",m_subwin,x1,y1,x2,y2))        return(false);
   if(!m_field_green.Text(IntegerToString(m_green)))                                return(false);
   if(!m_field_green.ReadOnly(true))                                                return(false);
   if(!Add(m_field_green))                                                          return(false);
//--- éxito
   return(true);
  }
//+-------------------------------------------------------------------------+
//| Creando el elemento de presentación "Azul" con el subtitulo explicativo |
//+-------------------------------------------------------------------------+
bool CPanelDialog::CreateBlue(void)
  {
//--- coordenadas
   int x1=INDENT_LEFT;
   int y1=INDENT_TOP+2*(EDIT_HEIGHT+CONTROLS_GAP_Y);
   int x2=x1+EDIT_WIDTH;
   int y2=y1+EDIT_HEIGHT;
//--- creando la leyenda
   if(!m_label_blue.Create(m_chart_id,m_name+"LabelBlue",m_subwin,x1,y1+1,x2,y2))   return(false);
   if(!m_label_blue.Text("Blue"))                                                   return(false);
   if(!Add(m_label_blue))                                                           return(false);
//--- ajustando las coordenadas
   x1+=LABEL_WIDTH+CONTROLS_GAP_X;
   x2=x1+EDIT_WIDTH;
//--- creando el elemento de visualización
   if(!m_edit_blue.Create(m_chart_id,m_name+"Blue",m_subwin,x1,y1,x2,y2))           return(false);
   if(!Add(m_edit_blue))                                                            return(false);
   m_edit_blue.MinValue(BASE_COLOR_MIN);
   m_edit_blue.MaxValue(BASE_COLOR_MAX);
   m_edit_blue.Value(m_blue);
//--- éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Estableciendo el valor de "Rojo"                                 |
//+------------------------------------------------------------------+
void CPanelDialog::SetRed(const int value)
  {
//--- comprobando
   if(value<0 || value>255) return;
//--- salvando
   m_red=value;
//--- estableciendo
   m_field_red.Text(IntegerToString(value));
//--- estableciendo el panel de color
   SetColor();
  }
//+------------------------------------------------------------------
//| Estableciendo el valor de "Verde"                                 |
//+------------------------------------------------------------------
void CPanelDialog::SetGreen(const int value)
  {
//--- comprobando
   if(value<0 || value>255) return;
//--- salvando
   m_green=value;
//--- estableciendo
   m_field_green.Text(IntegerToString(value));
//--- estableciendo el panel de color
   SetColor();
  }
//+------------------------------------------------------------------+
//| Estableciendo el valor de "Azul"                                 |
//+------------------------------------------------------------------+
void CPanelDialog::SetBlue(const int value)
  {
//--- comprobando
   if(value<0 || value>255) return;
//--- salvando
   m_blue=value;
//--- estableciendo
   m_edit_blue.Value(value);
//--- estableciendo el panel de color
   SetColor();
  }
//+------------------------------------------------------------------+
//| Cambia el tamaño de controlador                                  |
//+------------------------------------------------------------------+
bool CPanelDialog::OnResize(void)
  {
//--- llamando al método de clase parental
   if(!CAppDialog::OnResize()) return(false);
//--- cambiando el ancho del panel de color
   m_color.Width(ClientAreaWidth()-(INDENT_RIGHT+LABEL_WIDTH+CONTROLS_GAP_X+EDIT_WIDTH+CONTROLS_GAP_X+INDENT_LEFT));
//--- éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Controlador del evento de cambio del nivel de "azul"             |
//+------------------------------------------------------------------+
void CPanelDialog::OnChangeBlue(void)
  {
//--- salvando
   m_blue=m_edit_blue.Value();
//--- estableciendo el panel de color
   SetColor();
  }
//+------------------------------------------------------------------+
//| Estableciendo el panel de color                                  |
//+------------------------------------------------------------------+
void CPanelDialog::SetColor(void)
  {
   m_color.ColorBackground(m_red+(m_green<<8)+(m_blue<<16));
  }
//+------------------------------------------------------------------
