//+------------------------------------------------------------------+
//|                                           Sop_Res_Indicators.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para demostrar DRAW_FILLING"
#property description "Dibuja en la ventana separada un canal entre dos medias móviles"
#property description "El color del relleno del canal se cambia de forma aleatoria"
#property description "dentro de cada N tics"

#property indicator_separate_window
#property indicator_buffers 8
#property indicator_plots   4
//--- plot Intersection

#property indicator_label1  "Linea_MAIN_Estocastico"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrLightSeaGreen;
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "Linea_Signal_Estocastico"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrOrange;
#property indicator_style2  STYLE_DOT
#property indicator_width2  1

#property indicator_label3  "BUFFER_MAXIMOS"
#property indicator_type3   DRAW_ARROW
#property indicator_color3 clrAqua
#property indicator_width3 1

#property indicator_label4  "BUFFER_MINIMOS"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrYellow
#property indicator_width4  1

#property indicator_minimum 0
#property indicator_maximum 100


double         ESTBuffer[];
double         LineaSignalEstocastico[];
double         BufferMaximos[];
double         BufferMinimos[];
//--- búfers indicadores

int Estocastico;
string TiemposPuntosChocantes[10];

//--- Variables para el EST
input uint PeriodK=5;
input uint PeriodD=3;
input uint PeriodSlowing=3;
input double LevelIndicatorDown=20;
input double LevelIndicatorUp=80;
input ENUM_MA_METHOD Mode_MA=MODE_SMA;
input ENUM_STO_PRICE STO_MODE=STO_LOWHIGH;
int PeriodoStart=20;


int INDEX_INICIAL_EVALUAR_MAXIMOS=0;
int INDEX_INICIAL_EVALUAR_MINIMOS=0;

int NUMERODERESSOP=0;

input bool MayorAdos=true;

input int ToleranciaChoque=5;
input double  ToleranciaTraspaso=5;
input double TOLERANCIA4=3;
input double TOLERANCIA5=6;

input int PuntosComunesEntreTrends=1;
/*
struct PosicionMaximos{
  double ValorBufferEST;
  datetime Tiempo;
}  ;

struct PosicionMinimos{
  double ValorBufferEST;
  datetime Tiempo;
};*/

double BufferPosicionMaximosValor_Index[][3];
double BufferPosicionMinimosValor_Index[][3];


int IndexMaximos=0;
int IndexMinimos=0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ESTBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,LineaSignalEstocastico,INDICATOR_DATA);
   SetIndexBuffer(2,BufferMaximos,INDICATOR_DATA);
   SetIndexBuffer(3,BufferMinimos,INDICATOR_DATA);

   PlotIndexSetInteger(2,PLOT_ARROW,172);
   PlotIndexSetInteger(3,PLOT_ARROW,172);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,150);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,150);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);



   ArrayInitialize(BufferMaximos,0);
   ArrayInitialize(BufferMinimos,0);
   ArrayResize(BufferPosicionMaximosValor_Index,2);
   ArrayResize(BufferPosicionMinimosValor_Index,2);

   IndicatorSetInteger(INDICATOR_LEVELS,2);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,LevelIndicatorDown);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,LevelIndicatorUp);

   IndicatorSetInteger(INDICATOR_DIGITS,2);
//---
   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,PeriodK,PeriodD,PeriodSlowing,Mode_MA,STO_MODE);
//---
   for(int k=ObjectsTotal(0,1,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,1,OBJ_TREND);
      ObjectDelete(0,NameSymbol);
     }
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

//--- hacemos el primer cálculo del indicador, o los datos han cambiado y se requiere el recálculo total
   if(prev_calculated==0)
     {
      //--- copiamos todos los valores de los indicadores a los búfers correspondientes
      int copied1=CopyBuffer(Estocastico,MAIN_LINE,0,rates_total,ESTBuffer);
      int copied2=CopyBuffer(Estocastico,SIGNAL_LINE,0,rates_total,LineaSignalEstocastico);
     }
   else // llenamos sólo aquellos datos que se han actualizado
     {
      //--- obtendremos la diferencia en barras entre el arranque actual y el anterior OnCalculate()
      int to_copy=rates_total-prev_calculated;
      //--- si no hay diferencia, igualmente copiaremos un valor - en la barra cero
      if(to_copy==0)
         to_copy=1;
      //--- copiamos to_copy valores al mismísimo final de los búfers indicadores
      int copied1=CopyBuffer(Estocastico,MAIN_LINE,0,to_copy,ESTBuffer);
      int copied2=CopyBuffer(Estocastico,SIGNAL_LINE,0,to_copy,LineaSignalEstocastico);
     }

   int start=PeriodoStart;


   static datetime prev_time=0;
   
   if(prev_time==TimeCurrent())
     {
      return(rates_total);
     }
     
 ///CALCULAR A PARTIR DE I-3

   if(prev_calculated>0)
      start=prev_calculated-1;
   for(int i=start; i<rates_total; i++)
     {
     BufferPosicionMaximosValor_Index[IndexMaximos][2]=1;
     BufferPosicionMinimosValor_Index[IndexMinimos][2]=1; 
      /////////////PARA CALCULAR MAXIMOS Y MINIMOS////////////
      BufferMaximos[i]=0;
      BufferMinimos[i]=0;

      Comment(IndexMaximos);
      bool CALCULAR=true;
      if(ESTBuffer[i-2]>ESTBuffer[i-1] && ESTBuffer[i-2]>ESTBuffer[i-3] )
        {
         if(MathAbs(ESTBuffer[i-2]-ESTBuffer[i-3])<=TOLERANCIA5) //&&  MathAbs(ESTBuffer[i-2]-ESTBuffer[i-1])>TOLERANCIA5)//TOLERANCIA DE LAS MEDIDAD PEQUEÑAS
          {if(ESTBuffer[i-3]>ESTBuffer[i-4]){
           CALCULAR=true;
          }
           else{
           CALCULAR=false;
           }
          }
         if(MathAbs(ESTBuffer[i-2]-ESTBuffer[i-1])<=TOLERANCIA5){
           if(ESTBuffer[i-1]>ESTBuffer[i]){
           CALCULAR=true;
          }
           else{
           CALCULAR=false;
           }
         }
          
        if(CALCULAR==true){
         double Valor_Maximo_Actual=ESTBuffer[i-2];
         double Valor_Minimo_Anterior=0;
          double Valor_Maximo_Anterior=0;
         if(IndexMaximos>1 && IndexMinimos>1 ){
         Valor_Maximo_Anterior=BufferPosicionMaximosValor_Index[IndexMaximos-1][0];
         Valor_Minimo_Anterior=BufferPosicionMinimosValor_Index[IndexMinimos-1][0];}
         
         
         if(MathAbs(Valor_Maximo_Actual-Valor_Minimo_Anterior)>TOLERANCIA4){
            BufferMaximos[i-2]=ESTBuffer[i-2];
            ArrayResize(BufferPosicionMaximosValor_Index,IndexMaximos+2);
            BufferPosicionMaximosValor_Index[IndexMaximos][0]=ESTBuffer[i-2];
            BufferPosicionMaximosValor_Index[IndexMaximos][1]=i-2;

            if(IndexMaximos>0)
              {if(BufferPosicionMaximosValor_Index[IndexMaximos-1][0]<LevelIndicatorUp && BufferPosicionMaximosValor_Index[IndexMaximos][0]>LevelIndicatorUp)
                  INDEX_INICIAL_EVALUAR_MAXIMOS=i-3;}
            IndexMaximos++;}
         else
           {if(MathAbs(Valor_Maximo_Actual-Valor_Maximo_Anterior)>TOLERANCIA4)
              {BufferMaximos[i-2]=ESTBuffer[i-2];
               ArrayResize(BufferPosicionMaximosValor_Index,IndexMaximos+2);
               BufferPosicionMaximosValor_Index[IndexMaximos][0]=ESTBuffer[i-2];
               BufferPosicionMaximosValor_Index[IndexMaximos][1]=i-2;
               if(IndexMaximos>0)
                 {if(BufferPosicionMaximosValor_Index[IndexMaximos-1][0]<LevelIndicatorUp && BufferPosicionMaximosValor_Index[IndexMaximos][0]>LevelIndicatorUp)
                     INDEX_INICIAL_EVALUAR_MAXIMOS=i-3;}
               IndexMaximos++;
              }
            else
              {if(Valor_Maximo_Actual>Valor_Maximo_Anterior)
                 {
                  BufferMaximos[i-2]=ESTBuffer[i-2];
                  ArrayResize(BufferPosicionMaximosValor_Index,IndexMaximos+2);
                  BufferPosicionMaximosValor_Index[IndexMaximos][0]=ESTBuffer[i-2];
                  BufferPosicionMaximosValor_Index[IndexMaximos][1]=i-2;
                  if(IndexMaximos>0)
                    { if(BufferPosicionMaximosValor_Index[IndexMaximos-1][0]<LevelIndicatorUp && BufferPosicionMaximosValor_Index[IndexMaximos][0]>LevelIndicatorUp)
                        INDEX_INICIAL_EVALUAR_MAXIMOS=i-3;}
                  
                  if(IndexMaximos>1){
                  BufferMaximos[int(BufferPosicionMaximosValor_Index[IndexMaximos-1][1])]=0;
                  BufferPosicionMaximosValor_Index[IndexMaximos-1][2]=0;
                  }
                  IndexMaximos++;
                 }
               else
                 {
                  //BufferMaximos[i-2]=ESTBuffer[i-2];
                  ArrayResize(BufferPosicionMaximosValor_Index,IndexMaximos+2);
                  BufferPosicionMaximosValor_Index[IndexMaximos][0]=ESTBuffer[i-2];
                  BufferPosicionMaximosValor_Index[IndexMaximos][1]=i-2;
                  if(IndexMaximos>0)
                 {if(BufferPosicionMaximosValor_Index[IndexMaximos-1][0]<LevelIndicatorUp && BufferPosicionMaximosValor_Index[IndexMaximos][0]>LevelIndicatorUp)
                     INDEX_INICIAL_EVALUAR_MAXIMOS=i-3;
                     BufferPosicionMaximosValor_Index[IndexMaximos][2]=0;
                     }
                  IndexMaximos++;
                 }
              }
           }
         }
        }


      Comment(rates_total);
      if(ESTBuffer[i-2]<ESTBuffer[i-1] && ESTBuffer[i-2]<ESTBuffer[i-3]) //&&  MathAbs(ESTBuffer[i-2]-ESTBuffer[i-3])>TOLERANCIA5 //&&  MathAbs(ESTBuffer[i-2]-ESTBuffer[i-1])>TOLERANCIA5  )
        {
         CALCULAR=true;
         if(MathAbs(ESTBuffer[i-2]-ESTBuffer[i-3])<=TOLERANCIA5) //&&  MathAbs(ESTBuffer[i-2]-ESTBuffer[i-1])>TOLERANCIA5)
          {
          if(ESTBuffer[i-3]<ESTBuffer[i-4]){
           CALCULAR=true;
          }
           else{
           CALCULAR=false;
           }
          }
         if(MathAbs(ESTBuffer[i-2]-ESTBuffer[i-1])<=TOLERANCIA5){
           if(ESTBuffer[i-1]<ESTBuffer[i]){
           CALCULAR=true;
          }
           else{
           CALCULAR=false;
           }
         }
        
         if(CALCULAR==true){
         double Valor_Minimo_Actual=ESTBuffer[i-2];
         double Valor_Maximo_Anterior=0;
          double Valor_Minimo_Anterior=0;
         if(IndexMaximos>1 && IndexMinimos>1 ){
         Valor_Maximo_Anterior=BufferPosicionMaximosValor_Index[IndexMaximos-1][0];
         Valor_Minimo_Anterior=BufferPosicionMinimosValor_Index[IndexMinimos-1][0];}
        
         
         if(MathAbs(Valor_Minimo_Actual-Valor_Maximo_Anterior)>TOLERANCIA4){
         BufferMinimos[i-2]=ESTBuffer[i-2];
         ArrayResize(BufferPosicionMinimosValor_Index,IndexMinimos+2);
         BufferPosicionMinimosValor_Index[IndexMinimos][0]=ESTBuffer[i-2];
         BufferPosicionMinimosValor_Index[IndexMinimos][1]=i-2;
         if(IndexMinimos>0)
           {
            if(BufferPosicionMinimosValor_Index[IndexMinimos-1][0]>LevelIndicatorDown && BufferPosicionMinimosValor_Index[IndexMinimos][0]<LevelIndicatorDown)
               INDEX_INICIAL_EVALUAR_MINIMOS=i-3;
           }
         IndexMinimos++;}
         
         else{
            if(MathAbs(Valor_Minimo_Actual-Valor_Minimo_Anterior)>TOLERANCIA4){
            BufferMinimos[i-2]=ESTBuffer[i-2];
            ArrayResize(BufferPosicionMinimosValor_Index,IndexMinimos+2);
            BufferPosicionMinimosValor_Index[IndexMinimos][0]=ESTBuffer[i-2];
            BufferPosicionMinimosValor_Index[IndexMinimos][1]=i-2;
            if(IndexMinimos>0)
            {if(BufferPosicionMinimosValor_Index[IndexMinimos-1][0]>LevelIndicatorDown && BufferPosicionMinimosValor_Index[IndexMinimos][0]<LevelIndicatorDown)
               INDEX_INICIAL_EVALUAR_MINIMOS=i-3;}
            IndexMinimos++;
            }
            
            else{
               if(Valor_Minimo_Actual<Valor_Minimo_Anterior){
               BufferMinimos[i-2]=ESTBuffer[i-2];
               ArrayResize(BufferPosicionMinimosValor_Index,IndexMinimos+2);
               BufferPosicionMinimosValor_Index[IndexMinimos][0]=ESTBuffer[i-2];
               BufferPosicionMinimosValor_Index[IndexMinimos][1]=i-2;
               if(IndexMinimos>0)
               {if(BufferPosicionMinimosValor_Index[IndexMinimos-1][0]>LevelIndicatorDown && BufferPosicionMinimosValor_Index[IndexMinimos][0]<LevelIndicatorDown)
               INDEX_INICIAL_EVALUAR_MINIMOS=i-3;}
               if(IndexMinimos>1){
               BufferMinimos[int(BufferPosicionMinimosValor_Index[IndexMinimos-1][1])]=0;
               BufferPosicionMinimosValor_Index[IndexMinimos-1][2]=0;
               }
               IndexMinimos++;
               }
               else{
               //BufferMinimos[i-2]=ESTBuffer[i-2];
               ArrayResize(BufferPosicionMinimosValor_Index,IndexMinimos+2);
               BufferPosicionMinimosValor_Index[IndexMinimos][0]=ESTBuffer[i-2];
               BufferPosicionMinimosValor_Index[IndexMinimos][1]=i-2;
               if(IndexMinimos>0)
               {if(BufferPosicionMinimosValor_Index[IndexMinimos-1][0]>LevelIndicatorDown && BufferPosicionMinimosValor_Index[IndexMinimos][0]<LevelIndicatorDown)
               INDEX_INICIAL_EVALUAR_MINIMOS=i-3;
               BufferPosicionMinimosValor_Index[IndexMinimos][2]=0;
               }
               IndexMinimos++;
               }
            }
         }
        
        
        }
      }
      
       if(i>300){
       INDEX_INICIAL_EVALUAR_MAXIMOS=i-1-100;
       INDEX_INICIAL_EVALUAR_MINIMOS=i-1-100;}
       
       if(BufferMinimos[i-2]>0 && i>rates_total-300){ 
        int l= IndexMinimos-1;
        
        
       
       for(int k=l-1; BufferPosicionMinimosValor_Index[k][1]>INDEX_INICIAL_EVALUAR_MINIMOS && k>3; k--)
        {
        if(BufferPosicionMinimosValor_Index[k][2]==0){
        continue;
        }
            
            int x1=int (BufferPosicionMinimosValor_Index[k][1]);
            int x2=int (BufferPosicionMinimosValor_Index[l][1]);
            if(x2-x1==0){
            continue;
            }
            double y1=BufferPosicionMinimosValor_Index[k][0];
            double y2=BufferPosicionMinimosValor_Index[l][0];
            double Pendiente=(y2-y1)/(x2-x1);
            int PUNTOINICIAL=x1;
            double VALORPUNTOINICIAL=y1;
            int PuntosChocantes=2;
            TiemposPuntosChocantes[0]="i"+x2+"i";
            TiemposPuntosChocantes[1]="i"+x1+"i";
            string NombrePendientePuntos=TiemposPuntosChocantes[0]+" "+TiemposPuntosChocantes[1];
            
            for(int z=k-1; BufferPosicionMinimosValor_Index[z][1]>INDEX_INICIAL_EVALUAR_MINIMOS && z>3; z--)
            {
              if(BufferPosicionMinimosValor_Index[z][2]==0)
               continue;
              
              //Print("aca3");
              
               if(BufferPosicionMinimosValor_Index[z][0]<ToleranciaChoque+y2-Pendiente*(x2-BufferPosicionMinimosValor_Index[z][1])
               && BufferPosicionMinimosValor_Index[z][0]>y2-Pendiente*(x2-BufferPosicionMinimosValor_Index[z][1])-ToleranciaChoque)//-ToleranciaChoque)//TOLERANCIA ES PARA QUE CHOQUE CON OTROS
              {
               if(PuntosChocantes>8){
               PuntosChocantes=8;
               }
               Print("CHOCA",PuntosChocantes);
               PUNTOINICIAL=int(BufferPosicionMinimosValor_Index[z][1]);
               VALORPUNTOINICIAL=BufferPosicionMinimosValor_Index[z][0];
               TiemposPuntosChocantes[PuntosChocantes]="i"+PUNTOINICIAL+"i";
               NombrePendientePuntos=NombrePendientePuntos+" "+"i"+PUNTOINICIAL+"i";
               PuntosChocantes++;
              } 
              
            }
               bool Draw=true;
               
               if(x2-PUNTOINICIAL>100)
               Draw=false;
               
               int PuntosAEvaluar=0;
               
             if(VALORPUNTOINICIAL<20 && y2<20 && PuntosChocantes<3){
             //Draw=false;
             }
             if(MathAbs(Pendiente)>5){
             Draw=false;
             }
              if(MayorAdos==true && PUNTOINICIAL==x1)
            {
               Draw=false;
            }


            int Tabulador=1;

            for(int LK=x2-1; LK>PUNTOINICIAL && Draw==true; LK--)
           {
            if(ESTBuffer[LK]+ToleranciaTraspaso>y2-Pendiente*Tabulador)////TOLERANCIA2= TOLERANCIA DE TRASPASO DE LA PENDIENTE
              {;
              }
            else
              {
               Draw=false;
              }
            Tabulador++;
           }
               
               
               
               for(int kl=ObjectsTotal(0,1,OBJ_TREND)-1; kl>-1 && Draw==true ; kl--)
              {
               PuntosAEvaluar=0;
               string NameTrend=ObjectName(0,kl,1,OBJ_TREND);
                for(int ss=0;ss<PuntosChocantes;ss++){
                if(StringFind(NameTrend,TiemposPuntosChocantes[ss],0)!=-1 ){
                   PuntosAEvaluar++;
                    }
                  }
                if(PuntosAEvaluar>PuntosComunesEntreTrends){
                Print("----------------------");
                Print(NameTrend," BORRADO");
                Print(NombrePendientePuntos);
                ObjectDelete(0,NameTrend);
                }
                //Print(PuntosAEvaluar);
               }


         NUMERODERESSOP++;
         if(Draw==true)
           {

           datetime TiempoFinal=time[x2];//+20];
            double ValorUltimo=y2;//+Pendiente*20;
            
            int CHARTSUBWINDOW=ChartWindowFind(0,"Sop_Res_Indicators");
            static int NUMERO=0;

            if(!ObjectCreate(0,NUMERO,OBJ_TREND,CHARTSUBWINDOW,time[PUNTOINICIAL],VALORPUNTOINICIAL,TiempoFinal,ValorUltimo))
              {
               Print("No se creo");
              }
            else{
            Print("TIME INICIAL="+time[PUNTOINICIAL]+" TIME FINAL"+time[x2]);
             Print("VALOR INICIAL="+string(VALORPUNTOINICIAL)+" VALOR FINAL=",string(ValorUltimo));
             Print(" ------------------------------");
             PropiedadesDeTrend(0,NUMERO,clrPurple,STYLE_SOLID,2,true);
             NUMERO++;
            }
            
           }
        } 
       }
       Comment("Entra2");
    }
   prev_time=TimeCurrent();
   return(rates_total);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   for(int k=ObjectsTotal(0,1,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,1,OBJ_TREND);
      ObjectDelete(0,NameSymbol);
     }
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