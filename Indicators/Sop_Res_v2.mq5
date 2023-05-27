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
#property indicator_buffers 6
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
input ENUM_MA_METHOD Mode_MA=MODE_SMMA;
input ENUM_STO_PRICE STO_MODE=STO_LOWHIGH;
int PeriodoStart=20;

input int MaximasVelasAEvaluar=100;

int NUMERODERESSOP=0;

input int NUMERODEBARRAS=20;

input bool MayorAdos=true;

input int ToleranciaChoque=5;
input double  ToleranciaTraspaso=5;
input double TOLERANCIA4=3;
input double TOLERANCIA5=6;

input int PuntosComunesEntreTrends=1;
input int MaximoVelas=300;
/*
struct PosicionMaximos{
  double ValorBufferEST;
  datetime Tiempo;
}  ;

struct PosicionMinimos{
  double ValorBufferEST;
  datetime Tiempo;
};*/

double PosicionMaximosValor_Index[1][2];
double PosicionMinimosValor_Index[1][2];



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
     //BufferPosicionMaximosValor_Index[IndexMaximos][2]=1;   //<----
    // BufferPosicionMinimosValor_Index[IndexMinimos][2]=1;  //<----
      /////////////PARA CALCULAR MAXIMOS Y MINIMOS////////////
      BufferMaximos[i]=0;
      BufferMinimos[i]=0;
      
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
         if(PosicionMaximosValor_Index[0][0]!=0 && PosicionMinimosValor_Index[0][0]!=0){
         Valor_Maximo_Anterior=PosicionMaximosValor_Index[0][0];//<----
         Valor_Minimo_Anterior=PosicionMinimosValor_Index[0][0];}//<----
         
         
         if(MathAbs(Valor_Maximo_Actual-Valor_Minimo_Anterior)>TOLERANCIA4){
             DrawStars(BufferMaximos,ESTBuffer,PosicionMaximosValor_Index[0][1],PosicionMaximosValor_Index[0][0],i);
             }//<----
         else
           {if(MathAbs(Valor_Maximo_Actual-Valor_Maximo_Anterior)>TOLERANCIA4)
              DrawStars(BufferMaximos,ESTBuffer,PosicionMaximosValor_Index[0][1],PosicionMaximosValor_Index[0][0],i);
            else
              {if(Valor_Maximo_Actual>Valor_Maximo_Anterior)
                 {
                  BufferMaximos[int(PosicionMinimosValor_Index[0][1])]=0;
                  DrawStars(BufferMaximos,ESTBuffer,PosicionMaximosValor_Index[0][1],PosicionMaximosValor_Index[0][0],i);
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
         if(PosicionMaximosValor_Index[0][0]!=0 && PosicionMinimosValor_Index[0][0]!=0  ){
         Valor_Maximo_Anterior=PosicionMaximosValor_Index[0][0];
         Valor_Minimo_Anterior=PosicionMinimosValor_Index[0][0];}
        
         
         if(MathAbs(Valor_Minimo_Actual-Valor_Maximo_Anterior)>TOLERANCIA4){
         DrawStars(BufferMinimos,ESTBuffer,PosicionMinimosValor_Index[0][1],PosicionMinimosValor_Index[0][0],i);
         }
         
         else{
            if(MathAbs(Valor_Minimo_Actual-Valor_Minimo_Anterior)>TOLERANCIA4){
            DrawStars(BufferMinimos,ESTBuffer,PosicionMinimosValor_Index[0][1],PosicionMinimosValor_Index[0][0],i);
            }
            
            else{
               if(Valor_Minimo_Actual<Valor_Minimo_Anterior){
               BufferMinimos[int(PosicionMinimosValor_Index[0][1])]=0;
               DrawStars(BufferMinimos,ESTBuffer,PosicionMinimosValor_Index[0][1],PosicionMinimosValor_Index[0][0],i);
               }
            }
         }
        
        
        }
      }
       
       DrawTrends(BufferMinimos,i,rates_total,PosicionMinimosValor_Index[0][1],PosicionMinimosValor_Index[0][0],false,time);
       DrawTrends(BufferMaximos,i,rates_total,PosicionMaximosValor_Index[0][1],PosicionMaximosValor_Index[0][0],true,time);
       
        
        
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


void DrawStars(double &BufferPicosValles[],double &EstBuffer[],double &PosicionVallesPicosIndex,double &PosicionVallesPicosValor,int i){
BufferPicosValles[i-2]=EstBuffer[i-2];
PosicionVallesPicosValor=EstBuffer[i-2];//<----
PosicionVallesPicosIndex=i-2;//<----
}

void DrawTrends(double &BufferPicosValles[],int i,int const rates_total,double PosicionVallesPicosIndex,double PosicionVallesPicosValor,bool IsPeaks,datetime const &time[])///IF FALSE==IS VALEYS
{

       if(BufferPicosValles[i-2]>0 && i>rates_total-MaximoVelas){ /// change for i>MaximasVelasAEvaluar+2
         int x2=PosicionVallesPicosIndex;
         double y2=PosicionVallesPicosValor;
        
         for(int k=PosicionMinimosValor_Index[0][1]-1; k>i-MaximasVelasAEvaluar&& k>3; k--)
         {
            if(BufferPicosValles[k]==0){
            continue;
            }
            int x1= k;
            double y1= BufferPicosValles[k];
            double Pendiente=(y2-y1)/(x2-x1);
            int PUNTOINICIAL=x1;
            double VALORPUNTOINICIAL=y1;
            int PuntosChocantes=2;
            TiemposPuntosChocantes[0]="s"+(string)x2+"s";
            TiemposPuntosChocantes[1]="s"+(string)x1+"s";
            string NombrePendientePuntos=TiemposPuntosChocantes[0]+" "+TiemposPuntosChocantes[1];
            for(int z=k-1; z>i-MaximasVelasAEvaluar && z>3; z--)
               {
               if(ESTBuffer[z]+ToleranciaTraspaso<=y1-Pendiente*(x1-z) && IsPeaks==false){////TOLERANCIA2= TOLERANCIA DE TRASPASO DE LA PENDIENTE
                     z=MaximoVelas;
                     continue;}
               if(ESTBuffer[z]-ToleranciaTraspaso>=y1-Pendiente*(x1-z) && IsPeaks==true){////TOLERANCIA2= TOLERANCIA DE TRASPASO DE LA PENDIENTE
                     z=MaximoVelas;
                     continue;}
               
               if(BufferPicosValles[z]==0){
               continue;}
              
               if(BufferPicosValles[z]<ToleranciaChoque+y2-Pendiente*(x2-z) && BufferPicosValles[z]>y2-Pendiente*(x2-z)-ToleranciaChoque){
               //-ToleranciaChoque)//TOLERANCIA ES PARA QUE CHOQUE CON OTROS
                  if(PuntosChocantes>8){
                  PuntosChocantes=8;}
                  PUNTOINICIAL=z;
                  VALORPUNTOINICIAL=BufferPicosValles[z];
                  TiemposPuntosChocantes[PuntosChocantes]="s"+(string)PUNTOINICIAL+"s";
                  NombrePendientePuntos=NombrePendientePuntos+" "+"s"+(string)PUNTOINICIAL+"s";
                  PuntosChocantes++;} 
               }
               bool Draw=true;
               
               if(x2-PUNTOINICIAL>50)
               Draw=false;
               
               int PuntosAEvaluar=0;
               
               //if(VALORPUNTOINICIAL<LevelIndicatorDown && y2<LevelIndicatorDown && PuntosChocantes<3 && IsPeaks==false)
               //Draw=false;
               
               //if(VALORPUNTOINICIAL>LevelIndicatorUp && y2>LevelIndicatorUp && PuntosChocantes<3 && IsPeaks==true)
               //Draw=false;
               
               if(VALORPUNTOINICIAL>80 && y2>80 && IsPeaks==true){
               Draw=false;
               }
               else if (VALORPUNTOINICIAL<20 && y2<20 && IsPeaks==false){
               Draw=false;
               }
               
               
               if(MathAbs(Pendiente)>2)
               Draw=false;
               
               if(MayorAdos==true){
               
               if(PUNTOINICIAL==x1){
               if(Pendiente<=0 && IsPeaks==false){
               Draw=false;
               if(VALORPUNTOINICIAL>50 && y2>50 &&MathAbs(Pendiente)<2)
               Draw=true;
               }
               
               
               
               if(Pendiente>=0 && IsPeaks==true ){
               Draw=false;
               if(VALORPUNTOINICIAL<50 && y2<50 &&MathAbs(Pendiente)<2)
               Draw=true;
               }
               }
               else{
               if(Pendiente>0 && IsPeaks==true && y2>80 )
               Draw=false;
               else if(Pendiente<0 && IsPeaks==false && y2<20)
               Draw=false;
               }
               }
               
               if(IsPeaks==true){
               if(VALORPUNTOINICIAL>80 && y2>80 && Pendiente>-0.2){
               Draw=false;
               }
               }
               else{
               if(VALORPUNTOINICIAL<30 && y2<30 && Pendiente<0.2){
               Draw=false;
               }
               }
               
               
               if(PUNTOINICIAL==x1){
               if(y2>80 &&  Pendiente<0 && MathAbs(Pendiente)<1 && IsPeaks==true){
               Draw=false;
               }
               if(y2<20 &&  Pendiente>0 && MathAbs(Pendiente)<1 && IsPeaks==false){
               Draw=false;
               }}
               
               
               
               int Tabulador=1;
               for(int LK=x2-1; LK>PUNTOINICIAL && Draw==true; LK--)
               {
                  if(ESTBuffer[LK]+ToleranciaTraspaso<=y2-Pendiente*Tabulador && IsPeaks==false)////TOLERANCIA2= TOLERANCIA DE TRASPASO DE LA PENDIENTE
                     Draw=false;
                  if(ESTBuffer[LK]-ToleranciaTraspaso>=y2-Pendiente*Tabulador && IsPeaks==true)////TOLERANCIA2= TOLERANCIA DE TRASPASO DE LA PENDIENTE
                     Draw=false;
               Tabulador++;
               }
               
               for(int kl=ObjectsTotal(0,1,OBJ_TREND)-1; kl>-1 && Draw==true ; kl--){
               PuntosAEvaluar=0;
               string NameTrend=ObjectName(0,kl,1,OBJ_TREND);
               for(int ss=0;ss<PuntosChocantes;ss++){
                  if(StringFind(NameTrend,TiemposPuntosChocantes[ss],0)!=-1 )
                   PuntosAEvaluar++;
                  }
                 if(PuntosAEvaluar>PuntosComunesEntreTrends)
                  ObjectDelete(0,NameTrend);
               }


         NUMERODERESSOP++;
         if(Draw==true)
         {  datetime TiempoFinal=time[x2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;//+20];///CAMBIO
            datetime TiempoInicio=time[x2];
            MqlDateTime TiempoInicioMql5, TiempoFinalMql5;
            TimeToStruct(TiempoFinal,TiempoFinalMql5);
            TimeToStruct(TiempoInicio,TiempoInicioMql5);
            int DayFirst=TiempoInicioMql5.day_of_year;
            int DayLast=TiempoFinalMql5.day_of_year;
            
            TiempoFinal=time[x2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;
            if(TiempoFinalMql5.day_of_week==0 || TiempoFinalMql5.day_of_week==6 || (TiempoFinalMql5.day_of_week<TiempoInicioMql5.day_of_week && int((DayLast-DayFirst)/7)==0 )){
            TiempoFinal=TiempoFinal+(PeriodSeconds(PERIOD_D1))*2;
            }
            if(int((DayLast-DayFirst)/7)>0 ){
            TiempoFinal=(datetime)(TiempoFinal+PeriodSeconds(PERIOD_D1)*(MathPow(2,int((DayLast-DayFirst)/7))));
            }
            
            double ValorUltimo=y2+Pendiente*NUMERODEBARRAS;
            int CHARTSUBWINDOW=ChartWindowFind(0,"Sop_Res_v2");
            if(!ObjectCreate(0,NombrePendientePuntos,OBJ_TREND,CHARTSUBWINDOW,time[PUNTOINICIAL],VALORPUNTOINICIAL,TiempoFinal,ValorUltimo))
               Print("No se creo");
            else{
             int GrosorPendiente=3;
             if(PUNTOINICIAL==x1)
             GrosorPendiente=1;
             color ColorTrend=clrWhite;
             if(IsPeaks==false)
             ColorTrend=clrRed;
             else
             ColorTrend=clrGreen;
             
             PropiedadesDeTrend(0,NombrePendientePuntos,ColorTrend,STYLE_SOLID,GrosorPendiente,true);}
             //Print("TIempoInicio=",time[x2]," TiempoFinal: ",TiempoFinal);
          }
        } 
     }
 }


/*
             if(time[i-2]==D'2020.10.02 12:00'){
             Print("----------------");
             Print(time[i-2]);
             if(BufferPicosValles[k]!=0){
            Print(time[k]+" k="+k);
            Print(PUNTOINICIAL+" ",x2," ",time[PUNTOINICIAL]," ",time[x2]);
             }
             }*/