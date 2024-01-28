//+------------------------------------------------------------------+
//|                                                    WallPaper.mq5 |
//|                                                      Daniel Jose |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Daniel Jose"
#property version   "1.00"
//+------------------------------------------------------------------+
#include <Auxiliar\C_WallPaper.mqh>
//+------------------------------------------------------------------+
enum eType {IMAGEM, LOGO, COR};
//+------------------------------------------------------------------+
input char     user01 = 30;               //Transparencia ( 0 a 100 )
input string   user02 = "WallPaper_01";   //Nome do arquivo
input eType    user03 = IMAGEM;           //Tipo de fundo do grafico
//+------------------------------------------------------------------+
C_WallPaper WallPaper;
//+------------------------------------------------------------------+
int OnInit()
{
	if(user03 != COR) WallPaper.Init(user03 == IMAGEM ? "WallPapers\\" + user02 : "WallPapers\\Logos\\" + _Symbol, (char)(100 - user01));
	
	return INIT_SUCCEEDED;
}
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
	WallPaper.Destroy();
}
//+------------------------------------------------------------------+
void OnTick()
{
}
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{
	if(id == CHARTEVENT_CHART_CHANGE)
		WallPaper.Resize();
}
//+------------------------------------------------------------------+
