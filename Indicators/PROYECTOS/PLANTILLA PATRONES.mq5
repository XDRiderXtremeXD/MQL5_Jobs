//+------------------------------------------------------------------+
//|                                           PLANTILLA PATRONES.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+


#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   switch(_Period)
     {
      case PERIOD_M1:
         period="M1";
         Pointer_Offset=4;
         High_Offset=2;
         Offset_Subida_VelaOpuesta=2;
         Offset_Caida_VelaOpuesta=2;
         IncOffset=16;
         VelaTamanoImpulso=3;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=4;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M5;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=15;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M15;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=15;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VelaTamanoImpulso=30;
         TamanoMechaImpulso=10;
         //VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VelaTamanoImpulso=30;
         TamanoMechaImpulso=10;
         //VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VelaTamanoImpulso=70;
         TamanoMechaImpulso=20;
         //VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VelaTamanoImpulso=70;
         TamanoMechaImpulso=20;
         //VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VelaTamanoImpulso=150;
         TamanoMechaImpulso=50;
         //VALORVELASOPUESTAS=MN1;
         break;
  
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   Comment("");
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);


   /*
   if(BarsCalculated(EMA)<rates_total)
   return(0);
   if(BarsCalculated(FRACTAL)<rates_total)
         return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA,0,0,to_copy,EMA_BUFFER)<=0)
      return(0);
      
   if(CopyBuffer(FRACTAL,0,0,rates_total,FRACTAL_UP)<=0)
      return(0);
   if(CopyBuffer(FRACTAL,1,0,rates_total,FRACTAL_DOWN)<=0)
      return(0);*/


   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffsetL;
   int CumOffsetH;

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      return(rates_total);
     }

   if(prevtime!=Time[rates_total-1])
     {
      vez=1;
      ALERTAACTIVADA=false;
      CUENTA=false;
     }
   prevtime=Time[rates_total-1];


   int start=0;
   if(vez==1 || ArrowSignalStar[50]==0)
     {
      start=50;
      Ultimo3M=0;
      Ultimo3Z=0;
      Ultimo5x1=0;
      Ultimo6x1=0;
      Ultimo7x1=0;
      UltimoSand=0;
     }
   else
      if(vez==0)
        {
         start=rates_total-2;
        }

   for(int shift=start; shift<rates_total; shift++)
     {
      CumOffsetH= 0;
      CumOffsetL= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;


      for(counter = shift; counter >= shift - 9; counter--)
         AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
      Range=AvgRange/10;

      for(int i=0; i<10; i++)
        {

         O[i]=Open[shift-i];
         H[i]=High[shift-i];
         L[i]=Low[shift-i];
         C[i]=Close[shift-i];

         if(O[i]>C[i])
           {
            BodyHigh[i]= O[i];
            BodyLow[i] = C[i];
           }
         else
           {
            BodyHigh[i]= C[i];
            BodyLow[i] = O[i];
           }

         CL[i]=High[shift-i]-Low[shift-i];
         BL[i] = Open[shift-i] - Close[shift-i];
         UW[i] = High[shift-i] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[shift-i];
         BLa[i]= MathAbs(BL[i]);
         BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }
      //Comment(EMAbuffer[0]," ",EMAbuffer[1]," ",EMAbuffer[2]," ",EMAbuffer[3]," ",EMAbuffer[4]," ",EMAbuffer[5]," ",EMAbuffer[6]);
      //Comment(RSIbuffer[0]-RSIbuffer[1]);
      pattern="";
      bool Condicion=false;


      if(shift==50)
        {
         ArrowSignalStar[start]=10;
         ArrowSignalStar1[start]=10;
        }

      else
        {
        if(shift<rates_total-5000){
        FIBONACCI=false;
        }
        
        if(VerFIBO && FIBONACCI==true && shift>rates_total-5000  && shift!=rates_total )
        {
         for(int jk=RatesInicio; jk<rates_total-1 ; jk++)
           {
            if(FRACTAL_UP[jk]!=EMPTY_VALUE && UPFRACTAL==true)
              {
               FIBOPUNTO2=FRACTAL_UP[jk];
               FIBONACCI=false;
               string NAMEFIBO="FIBOUP"+string(jk);
               if(ObjectFind(0,NAMEFIBO)<0){
               if(ObjectCreate(0,NAMEFIBO,OBJ_FIBO,0,Time[RatesInicio],FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2)){
               FiboLevelsSet(4,ValoresFibo,EstiloFibo,0,NAMEFIBO);
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_SELECTABLE,true); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_COLOR,clrRed); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_STYLE,STYLE_DOT); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_BACK,true); 
               }
              }
              //Print(Time[shift-jk]," UP");
              break;
              }
            else
               if(FRACTAL_DOWN[jk]!=EMPTY_VALUE && UPFRACTAL==false)
                 {
                  FIBOPUNTO2=FRACTAL_DOWN[jk];
                  FIBONACCI=false;
                  string NAMEFIBO="FIBODN"+string(jk);
                 if(ObjectFind(0,NAMEFIBO)<0){
                 if(ObjectCreate(0,NAMEFIBO,OBJ_FIBO,0,Time[RatesInicio],FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2)){
                 FiboLevelsSet(4,ValoresFibo,EstiloFibo,0,NAMEFIBO);
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_SELECTABLE,true); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_COLOR,clrRed); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_STYLE,STYLE_DOT); 
                  ObjectSetInteger(0,NAMEFIBO,OBJPROP_BACK,true); 
                 }}
                 break;
                 }
           }
        }
         
         
         
         if(shift-Ultimo5x1>4)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4]))
              {

               if(VelasPatron5x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 5-1";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"5x1", Size_5x1, Color5x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo5x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 5-1";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "5x1", Size_5x1, Color5x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo5x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
                    {

                     if(shift==rates_total-1 && Condicion==true)
                       {
                        ALERTAACTIVADA=true;

                        if(setalert == 0 && Show_Alert == true)
                          {
                           setalert = 1;
                          }
                       }
                    }

                 }
              }

           }




         if(C[1]!=O[0] && prevtimegap!=Time[shift] && shift>rates_total-100 && VerGap && prevtimegap<Time[shift] && shift!=rates_total-1)
           {
            NumeroTrends++;
            ColorGAP=C[1]>O[0]?ColorGapDn:ColorGapUp;
            if(ObjectCreate(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJ_RECTANGLE,0,Time[shift-1],O[0],Time[shift],C[1]))
              {
               ObjectSetInteger(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,ColorGAP);
               ObjectSetInteger(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJPROP_FILL,true);
              }
            prevtimegap=Time[shift];
           }



         if(((O[0]<C[0] && O[1]>C[1]) ||(O[0]>C[0] && O[1]<C[1])) && VelasPatron_Sandwich== true && shift-UltimoSand>2 && C[1]==O[0])
           {
            double SizeVelaMayor=BLa[1]>BLa[0]?BLa[1]:BLa[0];

            double Mayor=H[1]>H[0]?H[1]:H[0];

            double Menor=L[1]<L[0]?L[1]:L[0];

            if(H[0]>Mayor-Point()*10 && H[1]>Mayor-Point()*10 && L[0]<Menor+Point()*10 && L[1]<Menor+Point()*10 && (SizeVelaMayor*5)/6<BLa[1] && (SizeVelaMayor*5)/6<BLa[0] 
            && UW[0]<Point()*2 && LW[0]<Point()*2)
              {

               if(O[0]<C[0])//VELAS REGRESIVAS SELL
                 {
                  pattern =pattern+" PatronVela Sandwich";
                  Condicion=true;
                  if(shift!=rates_total-1)
                    {
                     MarkPattern(GetName("Patron_Sandwich",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"SDW", Size_Sandwich, ColorSandwich);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  UltimoSand=shift;
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]>C[0])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern =pattern+" PatronVela Sandwich";
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_Sandwich",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "SDW", Size_Sandwich, ColorSandwich);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                     UltimoSand=shift;
                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==rates_total-1 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }

           }




         if(shift-Ultimo3Z>2)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2]))
              {

               if((BLa[0]>BLa[1] && BLa[1]>BLa[2])
                  || (BLa[0]<BLa[1] && BLa[1]<BLa[2]))
                 {

                  if(VelasPatron3Z == true)
                    {
                     if(O[0]<C[0])//VELAS REGRESIVAS SELL
                       {
                        //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                        pattern =pattern+" PatronVela 3-Z";
                        Condicion=true;
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3Z", Size_3Z, Color3Z);
                           CumOffsetH = CumOffsetH+IncOffset;
                          }
                        ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                        Ultimo3Z=shift;
                       }

                     else //VELAS REGRESIVAS BUY
                        if(O[0]>C[0])
                          {
                           //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                           Condicion=true;
                           pattern =pattern+" PatronVela 3-Z";
                           if(shift!=rates_total-1)
                             {
                              MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3Z", Size_3Z, Color3Z);
                              CumOffsetL = CumOffsetL+IncOffset;
                             }
                           ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                           Ultimo3Z=shift;
                          }
                    }
                  if(VelasOpuestasEnVolumen_Alert == true)
                    {

                     if(shift==rates_total-1 && Condicion==true)
                       {
                        ALERTAACTIVADA=true;

                        if(setalert == 0 && Show_Alert == true)
                          {
                           setalert = 1;
                          }
                       }
                    }
                 }
              }
           }

         if((O[0]<C[0] && O[1]<C[1]) || (O[0]>C[0] && O[1]>C[1]))
           {

            if(EMA_BUFFER[shift-1]< BodyHigh[1]-Point() &&  BodyLow[1]+Point()<EMA_BUFFER[shift-1])
              {
               if(VelasPatronZ == true)
                 {
                  bool Zbool=true;
                  if(EsIndice==SI && EMA_BUFFER[shift]<BodyHigh[0] && EMA_BUFFER[shift]>BodyLow[0])
                    {
                     Zbool=false;
                    }
                  if(EMA_BUFFER[shift-1]>BodyLow[1]+BLa[1]/2 && Zbool==true)//VELAS REGRESIVAS SELL
                    {
                     pattern = pattern+" PatronVela Z";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"PZ", Size_Z, ColorZ);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                    }

                  else //VELAS REGRESIVAS BUY
                     if(EMA_BUFFER[shift-1]<BodyLow[1]+BLa[1]/2 && Zbool==true)
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern = pattern+" PatronVela Z";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "PZ", Size_Z, ColorZ);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                       }

                 }
               if(VelasOpuestasEnVolumen_Alert == true)
                 {

                  if(shift==rates_total-1 && Condicion==true)
                    {
                     ALERTAACTIVADA=true;

                     if(setalert == 0 && Show_Alert == true)
                       {
                        setalert = 1;
                       }
                    }
                 }
              }
           }


         if(VelasPatron3Mecha== true && shift-Ultimo3M>2)
           {
            double Menor=L[0]<L[1]?L[0]:L[1];

            double Mayor=H[0]>H[1]?H[0]:H[1];

            if(LW[0]>0 && LW[1]>0 &&  Menor>=L[0]-Point()*Tolerancia3M && Menor>=L[1]-Point()*Tolerancia3M && LW[0]>BLa[0]&& LW[1]>BLa[1])//VELAS REGRESIVAS SELL
              {
               //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
               Condicion=true;
               pattern = pattern+" TRIPLE MECHA";
               if(shift!=rates_total-1)
                 {
                  MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3M", Size_3M, Color3M);
                  CumOffsetL = CumOffsetL+IncOffset;
                 }
               ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
               Ultimo3M=shift;
              }

            else //VELAS REGRESIVAS BUY
               if( UW[0]>0 && UW[1]>0  && Mayor<=H[0]+Point()*Tolerancia3M && Mayor<=H[1]+Point()*Tolerancia3M && UW[0]>BLa[0]&& UW[1]>BLa[1])
                 {
                  pattern = pattern+" TRIPLE MECHA";
                  Condicion=true;
                  if(shift!=rates_total-1)
                    {
                     MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3M",Size_3M, Color3M);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                  Ultimo3M=shift;
                 }

            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==rates_total-1 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }

         if(shift-Ultimo6x1>5)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5]))
              {

               if(VelasPatron6x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 6-1 ";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_6-1 ",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"6x1", Size_6x1, Color6x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo6x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 6-1";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_6-1 ",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "6x1", Size_6x1, Color6x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo6x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
                    {

                     if(shift==rates_total-1 && Condicion==true)
                       {
                        ALERTAACTIVADA=true;

                        if(setalert == 0 && Show_Alert == true)
                          {
                           setalert = 1;
                          }
                       }
                    }

                 }
              }

           }

         if(shift-Ultimo7x1>6)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5] && O[6]<C[6])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5] && O[6]>C[6]))
              {

               if(VelasPatron7x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 7-1 ";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_7-1 ",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"7x1", Size_7x1, Color7x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo7x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 7-1 ";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_7-1 ",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "7x1", Size_7x1, Color7x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo7x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
                    {

                     if(shift==rates_total-1 && Condicion==true)
                       {
                        ALERTAACTIVADA=true;

                        if(setalert == 0 && Show_Alert == true)
                          {
                           setalert = 1;
                          }
                       }
                    }

                 }
              }

           }
         if(VelasPatron_Tickmill== true && shift>rates_total-5000 && VEZFAMILIA30<Time[shift])
           {
            //if( (CL[3]*MultiplicadorZonaVela<BLa[2] || ( CL[3]*1.7<BLa[2] &&  CL[3]*1.7<BLa[1] ))    && BLa[3]>Point() && ((C[2]<O[2] && C[1]<O[1]) || (C[2]>O[2] && C[1]>O[1]))) //VELAS REGRESIVAS SELL
              if( CL[3]*MultiplicadorZonaVela<BLa[2]     && BLa[3]>Point() && ((C[2]<O[2] && C[1]<O[1]) || (C[2]>O[2] && C[1]>O[1]))) //VELAS REGRESIVAS SELL
              {
               pattern =pattern+" PatronVela Familia 30";
               //Condicion=true;

               NumeroTrends++;
               //MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-2],BodyLow[0]+BLa[0]/2 ,"5-1", Size_5x1, Color5x1);

               if(ObjectCreate(0,"TRENDPATRONESFAMILIA"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-3],H[3],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,H[3]))
                 {
                  ObjectSetInteger(0,"TRENDPATRONESFAMILIA"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
                  ObjectSetInteger(0,"TRENDPATRONESFAMILIA"+IntegerToString(NumeroTrends,0,' '),OBJPROP_SELECTABLE,true); 
                 }
               NumeroTrends++;
               if(ObjectCreate(0,"TRENDPATRONESFAMILIA1"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-3],L[3],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,L[3]))
                 {
                  ObjectSetInteger(0,"TRENDPATRONESFAMILIA1"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
                  ObjectSetInteger(0,"TRENDPATRONESFAMILIA1"+IntegerToString(NumeroTrends,0,' '),OBJPROP_SELECTABLE,true); 
                 }
               VEZFAMILIA30=Time[shift];


               FIBONACCI=true;
               if(C[1]>O[1])
                 {
                  FIBOPUNTO1=L[3];
                  UPFRACTAL=true;
                 }
               else
                 {
                  FIBOPUNTO1=H[3];
                  UPFRACTAL=false;
                 }
               RatesInicio=shift-2;
              }
           }
         // End of Bullish Patterns

         if((setalert==1) && (shift==rates_total-1))
           {
            Alert(Symbol()," ",period," ",pattern);
            setalert=0;
            if(Show_Alert_Movil)
               SendNotification("Formandose Patron "+pattern+ " en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
           }
         CumOffsetL=0;
         CumOffsetH=0;
        }
     } // End of for loop

   vez=0;


   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Concatenates string and time for a name.                         |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }
//+------------------------------------------------------------------+
//| Creates an object to mark the pattern on the chart.              |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartScaleGet(const long chart_ID=0)
  {
//--- preparamos la variable para obtener el valor de la propiedad
   long result=-1;
//--- reseteamos el valor del error
   ResetLastError();
//--- obtenemos el valor de la propiedad
   if(!ChartGetInteger(chart_ID,CHART_SCALE,0,result))
     {
      //--- mostramos el mensaje del error en el diario "Asesores Expertos"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
     }
//--- devolvemos el valor de la propiedad del gráfico
   return((int)result);
  }
//+------------------------------------------------------------------+


/*
if(shift-Ultimo5x1>4){
if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4])
   ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4]))
  {

   if((BB[4]<=BB[3] && BB[3]<=BB[2] && BB[2]<=BB[1] && BB[1]<=BB[0])
      || (BB[4]>=BB[3] &&BB[3]>=BB[2] && BB[2]>=BB[1] && BB[1]>=BB[0]))
     {

      if(VelasPatron5x1 == true)
        {
         NumeroTrends++;
         MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-2],BodyLow[0]+BLa[0]/2,"5-1", Size_5x1, Color5x1);
         if(ObjectCreate(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-2],BodyLow[0]+BLa[0]/2,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*2,BodyLow[0]+BLa[0]/2))
           {
            ObjectSetInteger(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
           }
         Condicion=true;
         pattern =pattern+" Patron Vela 5-1";
         ArrowSignalBuy[shift] = Low[shift] - (Pointer_Offset*_Point);
         ArrowSignalSell[shift] = High[shift] + (Pointer_Offset*_Point);
         Ultimo5x1=shift;
        }
      if(VelasOpuestasEnVolumen_Alert == true)
        {

         if(shift==rates_total-1 && Condicion==true)
           {
            ALERTAACTIVADA=true;

            if(setalert == 0 && Show_Alert == true)
              {
               setalert = 1;
              }
           }
        }
     }
  }
}*/
//+------------------------------------------------------------------+


bool FiboLevelsSet(int             levels,            // número de las líneas del nivel 
                   double          &values[],         // valores de las líneas del nivel 
                   ENUM_LINE_STYLE styles,         // estilo de las líneas del nivel 
                   const long      chart_ID=0,        // ID del gráfico 
                   const string    name="FiboLevels") // nombre del objeto 
  { 
//--- comprobamos los tamaños de los arrays 
   if(levels!=ArraySize(values))
     { 
      Print(__FUNCTION__,": ¡Error. La longitud del array no corresponde al número de los niveles!"); 
      return(false); 
     } 
//--- establecemos el número de los niveles 
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels); 
//--- establecemos las propiedades de los niveles en el ciclo 
   for(int i=0;i<levels;i++) 
     { 
      //--- valor del nivel 
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]); 
      //--- color del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,ColorFibo); 
      //--- estilo del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles); 
      //--- grosor del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,1); 
      //--- descripción del nivel 
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,DoubleToString(100*values[i],1)); 
     } 
//--- ejecución con éxito 
   return(true); 
  } 