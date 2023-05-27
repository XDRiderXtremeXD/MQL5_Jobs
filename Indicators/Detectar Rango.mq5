//+------------------------------------------------------------------+
//|                                               Detectar Rango.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SoporteRango"
#property indicator_type1   DRAW_NONE

#property indicator_label2  "ResistenciaRango"
#property indicator_type2   DRAW_NONE

double         SoporteRango[];
double         ResistenciaRango[];

input ENUM_LINE_STYLE Style=STYLE_SOLID;
input bool Fondo=true;
input uint Width=1;
input color ColorSoporte=Red;
input color ColorResistencia=Blue;
input int BarrasTotalesAtras=500;


double Mayor;
double Menor;
double pips=0;
bool Salir=false;
bool Dibujar=true;
int Sop=0;
int Res=0;

input double IntervaloPips=3;
input int BarrasMaximas=20;
input int BarrasMinimas=4;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  
   if(BarrasMinimas<4){
   Print("BarrasMinimas debe ser mayor o igual que 4");
   return(INIT_PARAMETERS_INCORRECT);
   }
   pips=IntervaloPips*Point()*10;
   SetIndexBuffer(0,SoporteRango,INDICATOR_DATA);
   SetIndexBuffer(1,ResistenciaRango,INDICATOR_DATA);

   ArraySetAsSeries(SoporteRango,true);
   ArraySetAsSeries(ResistenciaRango,true);

//---
   return(INIT_SUCCEEDED);
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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);



//Comment(time[1]," ", time[2], high[1]," ", high[2]);

   int limit=rates_total-prev_calculated;
   
   if(limit>rates_total-BarrasMaximas-1){
   limit=rates_total-BarrasMaximas-2;
   }
   
   for(int i=0; i<limit; i++)
     {

      int a=BarrasMinimas+i;
      CalculoMayorMenor(a,Mayor,Menor,high,i);
      EvaluarBarras(Mayor,Menor,a,high,i);

      if(a!=BarrasMinimas+1+i && Dibujar==true)
        {

           if(i<BarrasTotalesAtras){
           for(int k=ObjectsTotal(0,0,OBJ_TREND)-1;k>-1;k--){
           string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
           if(StringFind(NameSymbol,"RESRANGO",0)!=-1 ){
           datetime TIME=datetime (ObjectGetInteger(0,NameSymbol,OBJPROP_TIME,0));
           if(TIME==time[a-1]){
           ObjectDelete(0,NameSymbol);
           }
           }
           } 
            ObjectDelete(0,"RESRANGO");
            ObjectCreate(0,"RESRANGO"+string (Res),OBJ_TREND,0,time[a-1],Mayor+10*Point(),time[1+i],Mayor+10*Point());
            PropiedadesDeTrend(0,"RESRANGO"+string (Res),ColorResistencia,Style,Width,Fondo);
            Res++;}
         ResistenciaRango[i+1]=Mayor+10*Point();
        }
      else
        {
         ResistenciaRango[i+1]=0;
        }

      a=BarrasMinimas+i;
      CalculoMayorMenor(a,Mayor,Menor,low,i);
      EvaluarBarras(Mayor,Menor,a,low,i);
      if(a!=BarrasMinimas+1+i && Dibujar==true)
        {    
           if(i<200){   
           for(int k=ObjectsTotal(0,0,OBJ_TREND)-1;k>-1;k--){
           string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
           if(StringFind(NameSymbol,"SOPRANGO",0)!=-1 ){
           datetime TIME=datetime (ObjectGetInteger(0,NameSymbol,OBJPROP_TIME,0));
           if(TIME==time[a-1]){
           ObjectDelete(0,NameSymbol);
           }
           }
           } 
            ObjectDelete(0,"SOPRANGO");
            ObjectCreate(0,"SOPRANGO"+string (Sop),OBJ_TREND,0,time[a-1],Menor-10*Point(),time[1+i],Menor-10*Point());
            PropiedadesDeTrend(0,"SOPRANGO"+string (Sop),ColorSoporte,Style,Width,Fondo);
            Sop++;}
            
         SoporteRango[i+1]=Menor-10*Point();
        }
      else
        {
         SoporteRango[i+1]=0;
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalculoMayorMenor(int variable, double &mayor, double &menor, const double &ARRAY[],int interactive)
  {

   for(int i=3; i<BarrasMinimas+1; i++) // BarrasMinimas +2
     {

      if(i==3)
        {
         if(ARRAY[1+interactive]>ARRAY[2+interactive])
           {
            mayor=ARRAY[1+interactive];
            menor=ARRAY[2+interactive];
           }
         else
           {
            mayor=ARRAY[2+interactive];
            menor=ARRAY[1+interactive];
           }
        }
      if(ARRAY[i+interactive]>mayor)
        {
         mayor=ARRAY[i+interactive];
        }
      if(ARRAY[i+interactive]<menor)
        {
         menor=ARRAY[i+interactive];
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EvaluarBarras(double mayor,double menor,int &valor,const double& ARRAY[],int interactive)
  {
  
   do
     {
      if(valor==BarrasMinimas+interactive)
        {
         Salir=false;
         Dibujar=true;
        }
      valor++;
      double intervalo=mayor-menor;
      double fase=pips-intervalo;
      if(fase<0)
        {
         Salir=true;
         Dibujar=false;
         break;
        }

      double Maximo=mayor+fase;
      double Minimo=menor-fase;
      double x=ARRAY[valor];
      if(Minimo<x && x<Maximo)
        {
         if(x>mayor)
           {
            mayor=x;
           }
         if(x<menor)
           {
            menor=x;
           }
        }
      else
        {
         Salir=true;
        }
     }
   while(Salir==false && valor<BarrasMaximas+interactive);
  }
//+------------------------------------------------------------------+

void PropiedadesDeTrend(long chart_ID=0, string name="TrendLine",color clr=clrRed,const ENUM_LINE_STYLE style=STYLE_SOLID,
                        int width=1, bool back=false){
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);  
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,false); 
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,false);  
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,false);
}

void OnDeinit(const int reason){

for(int k=ObjectsTotal(0,0,OBJ_TREND)-1;k>-1;k--){
         string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
         if(StringFind(NameSymbol,"SOPRANGO",0)!=-1 || StringFind(NameSymbol,"RESRANGO",0)!=-1 ){
          ObjectDelete(0,NameSymbol);
         }
      }   
}


