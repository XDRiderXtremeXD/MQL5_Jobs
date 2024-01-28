//+------------------------------------------------------------------+
//|                                                 PanelMonitor.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots 0

#include "PanelSimpleFilasColumnas.mqh"

Panelfilas_columnas_ Panel1;
Panelfilas_columnas_ Panel2;

struct Datos
  {
   datetime          Fecha;
   double            Profit;
   double            DDown;
  };


Datos Semanal[];
Datos Diario[];
Datos Mensual[];

input bool Incluir_Swap=true;
input bool Incluir_Commision=true;
input string S4="------------Configuracion Cuadros------------";//*--------------------------------------------------------------
input ENUM_BASE_CORNER Corner=CORNER_LEFT_UPPER;
input int Anclaje_X=10;
input int Anclaje_Y=30;
input int EspacioCuadroHorizontal_=0;
input int EspacioCuadroVertical_=0;
input int TamanoCuadroHorizontal_=80;
input int TamanoCuadroVertical_=25;
input string S2="------------Configuracion Colores------------";//*--------------------------------------------------------------
input color BorderColor=C'116,116,116';
input color FondoColorDefault=C'31, 31, 31';
input color FondoColorValores=clrGray;
input color TituloColorMonitor=clrMediumOrchid;
input color TitulosColor=clrOrange;
input color TextoColorDefecto=clrWhite;
input string S3="------------Configuracion Texto------------";//*--------------------------------------------------------------
input int Size_Texto=12;//Tamaño Texto
input string Font_Texto="Arial";//Fuente
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int OrdenesLast;
double ProfitActualDiario;
double ProfitActualMensual;
double ProfitActualSemanal;

double DD_ActualDiario;
double DD_ActualMensual;
double DD_ActualSemanal;

datetime DiaActual=0;
datetime SemanaActual=0;
datetime MesActual=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DiaActual=iTime(Symbol(),PERIOD_D1,0);
   SemanaActual=iTime(Symbol(),PERIOD_W1,0);
   MesActual=iTime(Symbol(),PERIOD_MN1,0);

   ArrayResize(Diario,0);
   ArrayResize(Semanal,0);
   ArrayResize(Mensual,0);

   CrearPanel1();
   CrearPanel2();
   OrdenesLast=0;

   DD_ActualDiario=0;
   DD_ActualMensual=0;
   DD_ActualSemanal=0;
   ActualizarProfitsActuales();
   LeerDatos();
   PonerDatosEnPanel();
   ActualizarDatosActualesEnPanel();

   EventSetMillisecondTimer(1);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearPanel1()
  {
   Panel1.InicializarArrayDiferente();
   Panel1.InicializarEstiloPorDefecto(FondoColorDefault,TextoColorDefecto,Font_Texto,Size_Texto,BorderColor);
   Panel1.AddDiferenteCuadro(0,0,true,7);
   Panel1.AddDiferenteCuadro(0,1,true,7);
   Panel1.AddDiferenteCuadro(0,4,true,7);
   Panel1.AddDiferenteCuadro(0,5,true,7);

   Panel1.CrearPanel(Anclaje_X,Anclaje_Y,Corner,29,7,"Panel 1 2023",EspacioCuadroHorizontal_,EspacioCuadroVertical_,
                     TamanoCuadroHorizontal_,TamanoCuadroVertical_);
   Panel1.Text(0,0,"MONITOR DE CUENTA:");
   Panel1.Text(0,1,"ABIERTO:");
   Panel1.Text(1,2,"Balance");
   Panel1.Text(1,3,"Equidad");
   Panel1.Text(4,3,"Profit");
   Panel1.Text(0,5,"DIARIO:");
   Panel1.Text(1,6,"Actual");

   Panel1.ColorTexto(0,0,TituloColorMonitor);
   Panel1.ColorTexto(0,1,TitulosColor);
   Panel1.ColorTexto(0,5,TitulosColor);

   Panel1.ColorBg(2,2,FondoColorValores);
   Panel1.ColorBg(2,3,FondoColorValores);
   Panel1.ColorBg(5,3,FondoColorValores);

   Panel1.ColorBg(0,4,clrNONE);
   for(int f=7; f<Panel1.NumeroFilas(); (f%2==1?(f++):(f=f+3)))
     {
      int col=(f<9?1:2);
      for(int c=col; c<Panel1.NumeroColumnas(); c++)
         Panel1.ColorBg(c,f,FondoColorValores);
     }

   for(int f=7; f<Panel1.NumeroFilas(); (f%2==1?(f++):(f=f+3)))
     {
      int col=(f<9?0:1);
      string texto=f%2==1?"Profit":"DDown";
      Panel1.Text(col,f,texto);
     }

   int dia=-1;
   for(int f=6; f<Panel1.NumeroFilas(); f+=4)
      for(int c=2; c<Panel1.NumeroColumnas(); c++)
        {
         string texto="Dia ("+IntegerToString(dia)+"):";
         Panel1.Text(c,f,texto);
         dia-=1;
        }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearPanel2()
  {
   Panel2.InicializarArrayDiferente();
   Panel2.InicializarEstiloPorDefecto(FondoColorDefault,TextoColorDefecto,Font_Texto,Size_Texto,BorderColor);
   Panel2.AddDiferenteCuadro(0,0,true,7);
//Panel2.AddDiferenteCuadro(0,4,true,7);
   Panel2.AddDiferenteCuadro(0,8,true,7);
   Panel2.AddDiferenteCuadro(0,9,true,7);

   Panel2.CrearPanel(Panel1.X_Point()+Panel1.Ancho()+10,Panel1.Y_Point(),Corner,13,7,"Panel 2 2023",EspacioCuadroHorizontal_,EspacioCuadroVertical_,
                     TamanoCuadroHorizontal_,TamanoCuadroVertical_);
   Panel2.Text(0,0,"SEMANAL:");
   Panel2.Text(0,9,"MENSUAL:");
   Panel2.Text(1,10,"Actual:");
   Panel2.Text(1,1,"Actual:");
//Panel2.ColorBg(0,4,clrGray);
   Panel2.ColorBg(0,8,clrNONE);
   Panel2.ColorTexto(0,0,TitulosColor);
   Panel2.ColorTexto(0,9,TitulosColor);

   int semana=-1;
   for(int f=1; f<Panel2.NumeroFilas()-5; f+=4)
      for(int c=2; c<Panel2.NumeroColumnas(); c++)
        {
         string texto="Sem ("+IntegerToString(semana)+"):";
         Panel2.Text(c,f,texto);
         semana-=1;
        }

   int mes=-1;
   for(int f=10; f<Panel2.NumeroFilas(); f+=4)
      for(int c=2; c<Panel2.NumeroColumnas(); c++)
        {
         string texto="Mes ("+IntegerToString(mes)+"):";
         Panel2.Text(c,f,texto);
         mes-=1;
        }

   int pos=0;
   for(int f=2; f<Panel2.NumeroFilas(); f++)
     {
      string texto=(pos==0)?"Profit":"DDown";
      int c=(f==6 || f==7)?1:0;
      Panel2.Text(c,f,texto);
      pos++;
      if(pos==2)
        {
         if(f==7)
            f++;
         f+=2;
         pos=0;
        }
     }

   for(int f=2; f<Panel2.NumeroFilas()-5; (f%2==0?(f++):(f=f+3)))
     {
      int col=(f<4?1:2);
      for(int c=col; c<Panel2.NumeroColumnas(); c++)
         Panel2.ColorBg(c,f,FondoColorValores);
     }

   for(int f=11; f<Panel2.NumeroFilas(); f++)
     {
      for(int c=1; c<Panel2.NumeroColumnas(); c++)
         Panel2.ColorBg(c,f,FondoColorValores);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Panel1.EliminarPanel();
   Panel2.EliminarPanel();
   PushData(Diario,ProfitActualDiario,DD_ActualDiario,DiaActual);
   PushData(Semanal,ProfitActualSemanal,DD_ActualSemanal,SemanaActual);
   PushData(Mensual,ProfitActualMensual,DD_ActualMensual,MesActual);
   GuardarDatos(Diario,"Diario");
   GuardarDatos(Mensual,"Mensual");
   GuardarDatos(Semanal,"Semanal");
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   ActualizarPanelAbiertos();

   int OrdenesActuales=OrdersTotal();

   if(OrdenesLast!=OrdenesActuales)
     {
      ActualizarProfitsActuales();
      ActualizarDatosActualesEnPanel();
      OrdenesLast=OrdenesActuales;
     }

   ActualizarDD();
   ActualizarDD_Y_GuardarDatos();
  }
//+------------------------------------------------------------------+
void ActualizarProfitsActuales()
  {
   datetime Dia=iTime(Symbol(),PERIOD_D1,0);
   datetime Semana=iTime(Symbol(),PERIOD_W1,0);
   datetime Mes=iTime(Symbol(),PERIOD_MN1,0);

   ProfitActualDiario=ProfitTiempo(Dia);
   ProfitActualSemanal=ProfitTiempo(Semana);
   ProfitActualMensual=ProfitTiempo(Mes);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ProfitTiempo(datetime until)
  {
   double ProfitTotal=0;

   HistorySelect(until,TimeCurrent());
   int     total=HistoryDealsTotal();
   ulong    ticket=0;

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);

         if(entry==DEAL_ENTRY_OUT)
            ProfitTotal+=(Profit_+(Incluir_Commision?Comision:0)+(Incluir_Swap?Swap:0));
        }
     }
   return ProfitTotal;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitHistory(datetime START,datetime END)
  {
   double ProfitTotal=0;

   HistorySelect(START,TimeCurrent());
   int     total=HistoryDealsTotal();
   ulong    ticket=0;

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         datetime time=datetime(HistoryDealGetInteger(ticket,DEAL_TIME));

         if(time>END)
            continue;

         if(entry==DEAL_ENTRY_OUT)
            ProfitTotal+=(Profit_+(Incluir_Commision?Comision:0)+(Incluir_Swap?Swap:0));
        }
     }
   return ProfitTotal;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarDD()
  {
   double ProfitActual=GetProfitActual();
   bool actualize=false;

   if(DD_ActualDiario>ProfitActual)
     {
      DD_ActualDiario=ProfitActual;
      ActualizarDatosActualesEnPanel();
     }

   if(DD_ActualSemanal>ProfitActual)
     {
      DD_ActualSemanal=ProfitActual;
      ActualizarDatosActualesEnPanel();
     }

   if(DD_ActualMensual>ProfitActual)
     {
      DD_ActualMensual=ProfitActual;
      ActualizarDatosActualesEnPanel();
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitActual()
  {
   double ProfitTotal=0;
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
         ProfitTotal+=(PositionGetDouble(POSITION_PROFIT)+(Incluir_Swap?PositionGetDouble(POSITION_SWAP):0));
     }
   return ProfitTotal;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarDD_Y_GuardarDatos()
  {
   datetime Dia=iTime(Symbol(),PERIOD_D1,0);
   datetime Semana=iTime(Symbol(),PERIOD_W1,0);
   datetime Mes=iTime(Symbol(),PERIOD_MN1,0);

   if(Dia!=DiaActual)
     {
      PushData(Diario,ProfitActualDiario,DD_ActualDiario,DiaActual);
      GuardarDatos(Diario,"Diario");
      ActualizarProfitsActuales();
      PonerDiario();
      DD_ActualDiario=GetProfitActual();
      ActualizarDatosActualesEnPanel();
      DiaActual=Dia;
      ChartRedraw();
     }

   if(Semana!=SemanaActual)
     {
      PushData(Semanal,ProfitActualSemanal,DD_ActualSemanal,SemanaActual);
      GuardarDatos(Semanal,"Semanal");
      ActualizarProfitsActuales();
      PonerSemanal();
      DD_ActualSemanal=GetProfitActual();
      ActualizarDatosActualesEnPanel();
      SemanaActual=Semana;
      ChartRedraw();
     }

   if(Mes!=MesActual)
     {
      PushData(Mensual,ProfitActualMensual,DD_ActualMensual,MesActual);
      GuardarDatos(Mensual,"Mensual");
      ActualizarProfitsActuales();
      PonerMensual();
      DD_ActualMensual=GetProfitActual();
      ActualizarDatosActualesEnPanel();
      MesActual=Mes;
      ChartRedraw();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PushData(Datos &Array[],double profit,double dd,datetime tiempo)
  {
   int Size=ArraySize(Array);
   for(int i=Size-1; i>=0; i--)
     {
      if(Array[i].Fecha<tiempo)
         break;

      if(Array[i].Fecha==tiempo)
        {
         Array[i].Fecha=tiempo;
         Array[i].DDown=dd;
         Array[i].Profit=profit;
         return;
        }
     }

   ArrayResize(Array,Size+1);
   Array[Size].Fecha=tiempo;
   Array[Size].DDown=dd;
   Array[Size].Profit=profit;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GuardarDatos(Datos &Array[],string File)
  {
   string path="Datos_Panel_History"+"//"+File;
//--- open the file

   FileDelete(path);
   int Size=ArraySize(Array);

   int handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN);

   if(handle!=INVALID_HANDLE)
     {
      //--- write array data to the end of the file
      FileSeek(handle,0,SEEK_SET);
      FileWriteArray(handle,Array,0,Size);
      //--- close the file
      FileClose(handle);
     }
   else
      Print("Failed to open the file, error ",GetLastError());
  }
//+------------------------------------------------------------------+
void LeerDatos()
  {
   LeerDatosFile(Diario,"Diario");
   LeerDatosFile(Semanal,"Semanal");
   LeerDatosFile(Mensual,"Mensual");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerDatosEnPanel()
  {
   PonerDiario();
   PonerSemanal();
   PonerMensual();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarDatosActualesEnPanel()
  {
   Panel1.Text(1,7,DoubleToString(ProfitActualDiario,2));
   Panel1.Text(1,8,DoubleToString(DD_ActualDiario,2));
   Panel1.ColorTexto(1,7,ProfitActualDiario>=0?clrDarkGreen:clrRed);
   Panel1.ColorTexto(1,7+1,DD_ActualDiario>=0?clrBlack:clrBlue);

   Panel2.Text(1,2,DoubleToString(ProfitActualSemanal,2));
   Panel2.Text(1,3,DoubleToString(DD_ActualSemanal,2));
   Panel2.ColorTexto(1,2,ProfitActualSemanal>=0?clrDarkGreen:clrRed);
   Panel2.ColorTexto(1,2+1,DD_ActualSemanal>=0?clrBlack:clrBlue);

   Panel2.Text(1,11,DoubleToString(ProfitActualMensual,2));
   Panel2.Text(1,12,DoubleToString(DD_ActualMensual,2));
   Panel2.ColorTexto(1,11,ProfitActualMensual>=0?clrDarkGreen:clrRed);
   Panel2.ColorTexto(1,11+1,DD_ActualMensual>=0?clrBlack:clrBlue);


   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerDiario()
  {
   int Size=ArraySize(Diario);
   int StartJ=Size-1;

   int filaStart=7 ;
   int columnaStart=2;

   for(int i=0; i<=30; i++)
     {
      datetime TiempoEvalua=iTime(Symbol(),PERIOD_D1,i);

      if(i!=1 && (i-1)%5==0)
         filaStart=filaStart+4;

      int Fila=filaStart;
      int Columna=columnaStart+(i-1)%5;

      if(i==0)
        {
         Fila=filaStart;
         Columna=1;
        }

      double Profit=GetProfitHistory(TiempoEvalua,i==0?TimeCurrent():iTime(Symbol(),PERIOD_D1,i-1));

      Panel1.Text(Columna,Fila,DoubleToString(Profit,2));
      Panel1.Text(Columna,Fila+1,"NO DATA");
      Panel1.ColorTexto(Columna,Fila,Profit>=0?clrDarkGreen:clrRed);
      Panel1.ColorTexto(Columna,Fila+1,clrBlack);
      //Panel1.FontTexto(Columna,Fila,"Impact");
      //Panel1.FontTexto(Columna,Fila+1,"Impact");

      for(int j=StartJ; j>=0; j--)
        {
         if(TiempoEvalua==Diario[j].Fecha)
           {
            StartJ=j-1;
            // Panel1.Text(Columna,Fila,DoubleToString(Diario[j].Profit,2));
            Panel1.Text(Columna,Fila+1,DoubleToString(Diario[j].DDown,2));

            //   Panel1.ColorTexto(Columna,Fila,Diario[j].Profit>=0?clrDarkGreen:clrRed);
            Panel1.ColorTexto(Columna,Fila+1,Diario[j].DDown>=0?clrBlack:clrBlue);

            if(i==0)
               DD_ActualDiario=Diario[j].DDown;

            ChartRedraw();
            break;
           }
         if(Diario[j].Fecha<TiempoEvalua)
            break;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerSemanal()
  {
   int Size=ArraySize(Semanal);
   int StartJ=Size-1;

   int filaStart=2 ;
   int columnaStart=2;

   for(int i=0; i<=10; i++)
     {
      datetime TiempoEvalua=iTime(Symbol(),PERIOD_W1,i);

      if(i!=1 && (i-1)%5==0)
         filaStart=filaStart+4;

      int Fila=filaStart;
      int Columna=columnaStart+(i-1)%5;

      if(i==0)
        {
         Fila=filaStart;
         Columna=1;
        }
      double Profit=GetProfitHistory(TiempoEvalua,i==0?TimeCurrent():iTime(Symbol(),PERIOD_W1,i-1));
      Panel2.Text(Columna,Fila,DoubleToString(Profit,2));
      Panel2.Text(Columna,Fila+1,"NO DATA");
      Panel2.ColorTexto(Columna,Fila,Profit>=0?clrDarkGreen:clrRed);
      Panel2.ColorTexto(Columna,Fila+1,clrBlack);

      for(int j=StartJ; j>=0; j--)
        {
         if(TiempoEvalua==Semanal[j].Fecha)
           {
            StartJ=j-1;
            //  Panel2.Text(Columna,Fila,DoubleToString(Semanal[j].Profit,2));
            Panel2.Text(Columna,Fila+1,DoubleToString(Semanal[j].DDown,2));

            //Panel2.ColorTexto(Columna,Fila,Semanal[j].Profit>=0?clrDarkGreen:clrRed);
            Panel2.ColorTexto(Columna,Fila+1,Semanal[j].DDown>=0?clrBlack:clrBlue);

            if(i==0)
               DD_ActualSemanal=Semanal[j].DDown;

            ChartRedraw();
            break;
           }
         if(Semanal[j].Fecha<TiempoEvalua)
            break;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerMensual()
  {
   int Size=ArraySize(Mensual);
   int StartJ=Size-1;

   int filaStart=11 ;
   int columnaStart=2;

   for(int i=0; i<=5; i++)
     {
      datetime TiempoEvalua=iTime(Symbol(),PERIOD_MN1,i);

      if(i!=1 && (i-1)%5==0)
         filaStart=filaStart+4;

      int Fila=filaStart;
      int Columna=columnaStart+(i-1)%5;

      if(i==0)
        {
         Fila=filaStart;
         Columna=1;
        }
      double Profit=GetProfitHistory(TiempoEvalua,i==0?TimeCurrent():iTime(Symbol(),PERIOD_MN1,i-1));
      Panel2.Text(Columna,Fila,DoubleToString(Profit,2));
      Panel2.Text(Columna,Fila+1,"NO DATA");
      Panel2.ColorTexto(Columna,Fila,Profit>=0?clrDarkGreen:clrRed);
      Panel2.ColorTexto(Columna,Fila+1,clrBlack);

      for(int j=StartJ; j>=0; j--)
        {
         if(TiempoEvalua==Mensual[j].Fecha)
           {
            StartJ=j-1;
            //Panel2.Text(Columna,Fila,DoubleToString(Mensual[j].Profit,2));
            Panel2.Text(Columna,Fila+1,DoubleToString(Mensual[j].DDown,2));

            //Panel2.ColorTexto(Columna,Fila,Mensual[j].Profit>=0?clrDarkGreen:clrRed);
            Panel2.ColorTexto(Columna,Fila+1,Mensual[j].DDown>=0?clrBlack:clrBlue);

            if(i==0)
               DD_ActualMensual=Mensual[j].DDown;

            ChartRedraw();
            break;
           }
         if(Mensual[j].Fecha<TiempoEvalua)
            break;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LeerDatosFile(Datos &arr[],string File)
  {
   Datos arr2[];
   string path="Datos_Panel_History"+"//"+File;
//--- open the file
   ResetLastError();
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN);
   if(file_handle!=INVALID_HANDLE)
     {
      FileReadArray(file_handle,arr2);
      int size=ArraySize(arr2);
      ArrayResize(arr,size>35?35:size);

      int j=size>35?34:size-1;
      for(int i=size-1; i>=0 && i>=size-35; i--)
        {
         arr[j].DDown=arr2[i].DDown;
         arr[j].Fecha=arr2[i].Fecha;
         arr[j].Profit=arr2[i].Profit;
         j--;
        }

      //size=ArraySize(arr);
      // for(int i=0; i<size; i++)
      //  Print(arr[i].DDown," ",arr[i].Profit," ",arr[i].Fecha);

      //  Print("Total data = ",size);
      FileClose(file_handle);
     }
   else
      Print("File open failed, error ",GetLastError());
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarPanelAbiertos()
  {
   Panel1.Text(2,2,DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2));
   Panel1.Text(2,3,DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2));
   Panel1.Text(5,3,DoubleToString(GetProfitActual(),2));

   Panel1.ColorTexto(2,2,clrBlack);
   Panel1.ColorTexto(2,3,clrBlack);
   Panel1.ColorTexto(5,3,GetProfitActual()>=0?clrDarkGreen:clrRed);

   ChartRedraw();
  }
//+------------------------------------------------------------------+
