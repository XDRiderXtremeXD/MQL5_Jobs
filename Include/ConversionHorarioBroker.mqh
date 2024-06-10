//+------------------------------------------------------------------+
//|                               ConversionHoraPaisAlGMTHorario.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
class ConversionHorarioBroker
  {

private:
   int               GMT;
   int               DST;
   int               Diferencia;
public:
   //--- ON INIT
   virtual void      InitSetearGMTyDST(int TuGMT);

   virtual int       ObtenerHoraBroker(int horaTuGMT);

   virtual bool      DentroHora_TuGMT_a_Broker(int horaInicio,int horaFinal,int minutoInicio,int MinutoFinal,datetime TimeEvalua);

protected:

   virtual bool      Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho,
                                      bool isRight,bool isLow,int col,int fil);
  };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ConversionHorarioBroker::InitSetearGMTyDST(int TuGMT)
  {
   datetime resultDay=0;
   DST=TimeDaylightSavings();

   string Comentario=" ";
   GMT=int(TimeCurrent()-TimeGMT());
   GMT=GMT/3600;

   if(DST!=0)
      GMT=GMT-(DST/3600);

   if(GMT==0)
      Comentario="GMT 0";
   else
      if(GMT<0)
         Comentario="GMT "+(GMT>0?("+"):(""))+IntegerToString((GMT));
      else
         Comentario="GMT "+(GMT>0?("+"):(""))+IntegerToString((GMT));

   if(DST==0)
      Comentario=Comentario+"    DST: no";
   else
      Comentario=Comentario+"    DST: yes";

   Diferencia=GMT-TuGMT;

   Comentario+=("\n Diferencia GMT "+IntegerToString(Diferencia));

   Print(Comentario);
  }
//+------------------------------------------------------------------+
int ConversionHorarioBroker::ObtenerHoraBroker(int horaTuGMT)
  {
   string Comentario=IntegerToString(horaTuGMT);
   horaTuGMT=horaTuGMT+Diferencia;
   horaTuGMT=horaTuGMT%24;

   Comentario="Hora obtenida de "+Comentario+" es "+IntegerToString(horaTuGMT);

  // Print(Comentario);

   return horaTuGMT;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ConversionHorarioBroker::DentroHora_TuGMT_a_Broker(int Inicio, int Final, int MInicio, int MFinal, datetime Time)
  {
   
   Inicio=ObtenerHoraBroker(Inicio);
   Final=ObtenerHoraBroker(Final);
   
   MqlDateTime TimeEvalua;
   TimeToStruct(Time,TimeEvalua);

   int Minuto = TimeEvalua.min;
   int Hora = TimeEvalua.hour;

   if((Inicio < Final)?((Inicio <= Hora && Hora <= Final)==false):((Inicio <= Hora || Hora <= Final)==false))
      return false;

   if(Inicio!=Final)
     {
      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;

         if(!(Minuto >= MInicio && Minuto < MFinal))
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(Hora == Inicio)
               if(!(MInicio <= Minuto || Minuto < MFinal))
                  return false;
           }
     }
     
   return true;
  }
//+------------------------------------------------------------------+
