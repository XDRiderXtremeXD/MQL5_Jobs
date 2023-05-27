<chart>
id=133039357044775338
symbol=AUDUSD
description=Australian Dollar vs US Dollar
period_type=1
period_size=6
digits=5
tick_size=0.000000
position_time=1655856000
scale_fix=0
scale_fixed_min=0.667400
scale_fixed_max=0.729700
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=0
scroll=0
shift=1
shift_size=20.161290
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=1
lastline=0
days=1
descriptions=1
tradelines=1
tradehistory=0
window_left=1144
window_top=0
window_right=1716
window_bottom=333
window_type=1
floating=0
floating_left=0
floating_top=0
floating_right=0
floating_bottom=0
floating_type=1
floating_toolbar=1
floating_tbstate=
background_color=0
foreground_color=16777215
barup_color=65280
bardown_color=255
bullcandle_color=32768
bearcandle_color=17919
chartline_color=65535
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=49152
stops_color=255
windows_total=3

<expert>
name=EXPERTO CONTROL v3
path=Experts\EXPERTO CONTROL v3.ex5
expertmode=1
<inputs>
Capital_Base=2000
Porcentaje_Perdida=2
S1=-----------------------   CONFIGURACION BOTONES  ---------------------
CORNER_BOTON=0
Boton_Desplazamiento_X=5
Boton_Desplazamiento_Y=27
SizeTexto=10
Espacio=1
S4=-----------------------   CONFIGURACION TRADES  ---------------------
Conteo_Operaciones=0
Contar_Swap=true
Contar_Comission=true
MagicNumber=22222
Maxima_Ganancia=100
Maxima_Perdida=100
</inputs>
</expert>

<window>
height=137.033298
objects=1146

<indicator>
name=Main
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Mi Indicador Angelo Patrones.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=SELL
draw=3
style=0
width=2
arrow=234
color=16711935
</graph>

<graph>
name=BUY
draw=3
style=0
width=2
arrow=233
color=16711935
</graph>

<graph>
name=SELLCONFIRMACION
draw=3
style=0
width=2
arrow=234
color=-1
</graph>

<graph>
name=BUYCONFIRMACION
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=ENTRADA SELL
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=ENTRADA BUY
draw=3
style=0
width=2
arrow=234
color=-1
</graph>
<inputs>
TransparienciaDePatronesSinRSIoEST=true
STO_Price=2
Velas_Confirmacion=5
Hora_Inicio=8
Hora_Final=8
Nivel=0.2
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Filter_MA=true
Tolerancia_Puntos=0
Period_MA=50
Shift_MA=1
APP_MA=1
MODE_MA=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=30
Momentun_Applied_Price=1
S1_=-----------------------   Configuracion RSI---------------------
Condicion_Signal_Contrarias=true
RSI_Period=14
APP_RSI=1
S12_============================================= CONFIGURACION TREND ============================================
FiltroTrend=true
inpFastLength=10
inpSlowLength=30
EsperaMaxima=10
Settings_Alerts=***Settings_Alerts***
AlertPC=true
AlertMovil=true
AlertMail=false
</inputs>
</indicator>

<indicator>
name=Moving Average
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.703776
scale_fix_min=0
scale_fix_min_val=0.684836
scale_fix_max=0
scale_fix_max_val=0.722717
expertmode=0
fixed_height=-1

<graph>
name=
draw=129
style=0
width=2
arrow=251
color=255
</graph>
period=50
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Patrones.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=3
style=0
width=1
arrow=170
color=42495
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=115
color=16748574
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=104
color=8388736
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=170
color=42495
</graph>
<inputs>
S8====  CONFIGURACION TREND FORCE =======================================================================================
FiltroTrend=true
MayorFilter=0.5
trendPeriod=3
TriggerUp=0.4
TriggerDown=-0.4
S8_====  CONFIGURACION =======================================================================================
TransparienciaDePatronesSinRSIoEST=false
COLORTRANSPARIENCIA=16777215
VerResSop3=false
K_Estocastico=5
D_Estocastico=3
Ralentizacion_Estocastico=3
RSI_Period=14
UseExtraDigit=false
Show_Alert=true
Display_ShootStar_2=false
Show_ShootStar_Alert_2=false
Display_ShootStar_3=false
Show_ShootStar_Alert_3=false
Display_ShootStar_4=false
Show_ShootStar_Alert_4=false
Color_ShootStar=9639167
Display_Hammer_2=false
Show_Hammer_Alert_2=false
Display_Hammer_3=false
Show_Hammer_Alert_3=false
Display_Hammer_4=false
Show_Hammer_Alert_4=false
Color_Hammer=16711680
Display_Doji=false
Show_Doji_Alert=false
Color_Doji=8388352
Display_Stars=false
Show_Stars_Alert=false
Star_Body_Length=5
Color_Star=16776960
Display_Dark_Cloud_Cover=false
Show_DarkCC_Alert=false
Color_DarkCC=2763429
Display_Piercing_Line=false
Show_Piercing_Line_Alert=false
Color_Piercing_Line=16711680
Display_Bearish_Engulfing=false
Show_Bearish_Engulfing_Alert=false
Color_Bearish_Engulfing=255
Display_Bullish_Engulfing=false
Show_Bullish_Engulfing_Alert=false
Color_Bullish_Engulfing=16711680
VelasOpuestasEnVolumen=true
VelasOpuestasEnVolumen_Alert=false
VelasOpuestasEnVolumenx2=true
VelasOpuestasEnVolumenx2_Alert=false
VelasOpuestasEnVolumenConMartillo=true
VelasOpuestasEnVolumenConMartillo_Alert=false
VelasRSI=true
VelasRSI_Alert=false
VelasEST=false
VelasEST_Alert=false
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\IndicatorPersonalized.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=PTL trend candles
draw=17
style=0
width=1
arrow=251
color=16748574,3937500
</graph>

<graph>
name=PTL slow line
draw=1
style=2
width=1
arrow=251
color=16748574
</graph>

<graph>
name=PTL fast line
draw=1
style=2
width=1
arrow=251
color=3937500
</graph>

<graph>
name=PTL trend start
draw=12
style=0
width=2
arrow=159
color=16748574,3937500
</graph>
<inputs>
inpFastLength=10
inpSlowLength=30
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PATRONES ANTIGUO PERSONALIZED V2.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=DN Rebote
draw=3
style=0
width=2
arrow=234
color=-1
</graph>

<graph>
name=UP Rebote
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=DN Confirmacion
draw=3
style=0
width=2
arrow=234
color=-1
</graph>

<graph>
name=UP Confirmacion
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=BUY PATRON CONFIRMACION TEND
draw=3
style=0
width=4
arrow=233
color=16776960
</graph>

<graph>
name=SELL PATRON CONFIRMACION TEND
draw=3
style=0
width=4
arrow=234
color=16776960
</graph>

<graph>
name=
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
color=
</graph>
<inputs>
Settings_Condiciones_Patron=-----------------------Settings CONDICIONES PATRON-----------------------
VelasEvaluadas=5000
Testeado=0
Repintado=false
Tolerancia_Puntos_Flecha=30
Espera=5
EsperarConfirmacion=5
Settings_Horario=-----------------------Settings HORARIO-----------------------
Hora_Inicio=8
Hora_Final=8
Settings_Alerts=-----------------------Settings ALERTAS-----------------------
Activar_Alerta=false
Activar_Alerta_Confirmacion=false
Audio_Alerta_Confirmacion=alert2
Activar_Alerta_Confirmacion_Tendencia=true
AlertPC=true
AlertMovil=true
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=false
BackLimit=500
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=7
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.5
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND COLOR ============================================
inpFastLength=15
inpSlowLength=30
Tolerancia_Personalized=0
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Examples\ZigzagColor.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=ZigzagColor
draw=15
style=0
width=1
arrow=251
color=16748574,255
</graph>
<inputs>
InpDepth=12
InpDeviation=5
InpBackstep=3
</inputs>
</indicator>
<object>
type=11
name=H4 Gann Grid 9534
date1=1634011200
date2=1634011200
value1=1.154940
ganndir=0
pipsperbar=1.000000
</object>

<object>
type=109
name=2021.11.29 17:00 Ventas de Viviendas Pendientes m/m
hidden=1
descr=Ventas de Viviendas Pendientes m/m 7.5% / -3.0%
color=15658671
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:00 Ventas de Viviendas Pendientes a/a
hidden=1
descr=Ventas de Viviendas Pendientes a/a -1.4% / -17.0%
color=15658671
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:00 Índice de Ventas de Viviendas Pendientes
hidden=1
descr=Índice de Ventas de Viviendas Pendientes
color=16119285
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:30 Índice Manufacturero de la Fed de Dallas
hidden=1
descr=Índice Manufacturero de la Fed de Dallas 11.8 / 9.6
color=15658671
selectable=0
date1=1638207000
</object>

<object>
type=109
name=2021.11.29 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1638210600
</object>

<object>
type=109
name=2021.11.29 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1638210600
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.30 10:00 Barómetro Económico del Instituto KOF
hidden=1
descr=Barómetro Económico del Instituto KOF
color=16119285
selectable=0
date1=1638266400
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI)
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI
color=16119285
selectable=0
date1=1638290700
</object>

<object>
type=109
name=2021.11.30 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1638297000
</object>

<object>
type=109
name=2021.12.01 09:30 IPC m/m
hidden=1
descr=IPC m/m
color=16119285
selectable=0
date1=1638351000
</object>

<object>
type=109
name=2021.12.01 09:30 IPC a/a
hidden=1
descr=IPC a/a
color=16119285
selectable=0
date1=1638351000
</object>

<object>
type=109
name=2021.12.01 10:30 PMI de la Manufactura de procure.ch
hidden=1
descr=PMI de la Manufactura de procure.ch
color=16119285
selectable=0
date1=1638354600
</object>

<object>
type=109
name=2021.12.01 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP
color=16119285
selectable=0
date1=1638371700
</object>

<object>
type=109
name=2021.12.01 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 21:00 Libro Beige de la Fed
hidden=1
descr=Libro Beige de la Fed
color=16119285
selectable=0
date1=1638392400
</object>

<object>
type=109
name=2021.12.02 09:30 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638437400
</object>

<object>
type=109
name=2021.12.02 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1638455400
</object>

<object>
type=109
name=2021.12.02 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a
color=16119285
selectable=0
date1=1638455400
</object>

<object>
type=109
name=2021.12.02 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural
color=16119285
selectable=0
date1=1638466200
</object>

<object>
type=109
name=2021.12.02 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1638469800
</object>

<object>
type=109
name=2021.12.02 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1638469800
</object>

<object>
type=109
name=2021.12.03 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1638561600
</object>

<object>
type=109
name=2021.12.03 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1638561600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.11.29 22:00 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1638223200
</object>

<object>
type=109
name=2021.11.29 22:05 Discurso del Presidente del Sistema de la Rese
hidden=1
descr=Discurso del Presidente del Sistema de la Reserva Federal, Jero
color=16119285
selectable=0
date1=1638223500
</object>

<object>
type=109
name=2021.11.30 00:05 Discurso de la Gobernadora de la Fed, Michelle
hidden=1
descr=Discurso de la Gobernadora de la Fed, Michelle Bowman
color=16119285
selectable=0
date1=1638230700
</object>

<object>
type=109
name=2021.11.30 17:00 Discurso del Presidente del Sistema de la Rese
hidden=1
descr=Discurso del Presidente del Sistema de la Reserva Federal, Jero
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 20:00 Discurso del Vicepresidente de la Fed, Richard
hidden=1
descr=Discurso del Vicepresidente de la Fed, Richard Clarida
color=16119285
selectable=0
date1=1638302400
</object>

<object>
type=109
name=2021.12.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638377100
</object>

<object>
type=109
name=2021.12.02 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 18:00 Discurso de Randal Quarles, Gobernador de la F
hidden=1
descr=Discurso de Randal Quarles, Gobernador de la Fed
color=16119285
selectable=0
date1=1638468000
</object>

<object>
type=109
name=2021.12.03 16:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638549900
</object>

<object>
type=109
name=2021.12.03 16:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638549900
</object>

<object>
type=20
name=SSSR#S0 Strength=Proven, Test Count=5
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1573560000
date2=1659549600
value1=1486.765714
value2=1433.402143
</object>

<object>
type=20
name=SSSR#S1 Strength=Proven, Test Count=8
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1585245600
date2=1659549600
value1=1696.772500
value2=1625.900000
</object>

<object>
type=20
name=SSSR#S2 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1585699200
date2=1659549600
value1=1581.288571
value2=1561.070714
</object>

<object>
type=20
name=SSSR#R3 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1596758400
date2=1659549600
value1=2084.584107
value2=2049.780000
</object>

<object>
type=20
name=SSSR#R4 Strength=Proven, Test Count=7
hidden=1
background=1
selectable=0
filling=1
date1=1597212000
date2=1659549600
value1=1925.101071
value2=1840.180000
</object>

<object>
type=20
name=SSSR#S5 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1639591200
date2=1659549600
value1=1761.310357
value2=1748.769821
</object>

<object>
type=20
name=SSSR#R6 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1641556800
date2=1659549600
value1=1798.850000
value2=1778.902143
</object>

<object>
type=20
name=SSSR#R7 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1648144800
date2=1659549600
value1=1971.377143
value2=1957.570000
</object>

<object>
type=20
name=SSSR#R8 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1650283200
date2=1659549600
value1=2003.244286
value2=1988.471429
</object>

<object>
type=20
name=SSSR#R9 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1656504000
date2=1659549600
value1=1835.905714
value2=1826.918571
</object>

<object>
type=20
name=SSSR#S10 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1658923200
date2=1659549600
value1=1716.930000
value2=1708.150179
</object>

<object>
type=101
name=VelasOPV1659398400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1659355200
value1=0.704410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658275200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1658232000
value1=0.691240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656892800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656676800
value1=0.676710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1656892800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1656676800
value1=0.676710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1656482400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1656439200
value1=0.689680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1655920800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1655877600
value1=0.688470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21655920800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1655856000
value1=0.688140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1655380800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1655337600
value1=0.702490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21655380800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1655316000
value1=0.703540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1654603200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1654560000
value1=0.716320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652810400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652767200
value1=0.704060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652162400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652119200
value1=0.691070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652162400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1652119200
value1=0.691070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651492800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651449600
value1=0.703380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649181600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649138400
value1=0.766100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646719200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1646676000
value1=0.731000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646114400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646071200
value1=0.726770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646114400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646049600
value1=0.726550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645747200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1645704000
value1=0.709510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645639200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645596000
value1=0.728380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645077600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645034400
value1=0.721540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644494400
value1=0.724870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644537600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1644494400
value1=0.724870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644537600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1644472800
value1=0.724260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643068800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643025600
value1=0.709530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641988800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1641945600
value1=0.722310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640239200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1640196000
value1=0.721960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639440000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1639396800
value1=0.711060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638554400
value1=0.699410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638770400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1638554400
value1=0.699410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638770400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1638532800
value1=0.699300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636653600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636610400
value1=0.728950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636653600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1636610400
value1=0.728950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636653600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1636588800
value1=0.728720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634774400
value1=0.754640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634817600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634774400
value1=0.754640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634817600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1634752800
value1=0.754490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634688000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634644800
value1=0.748550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634256000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634212800
value1=0.742280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633996800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1633953600
value1=0.737290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632981600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1632938400
value1=0.717140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632981600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1632916800
value1=0.717030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628100000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1628056800
value1=0.742660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21628100000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1628035200
value1=0.742450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627884000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1627668000
value1=0.732910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626739200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626696000
value1=0.732180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626415200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1626372000
value1=0.741470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625788800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1625745600
value1=0.742040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623909600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623866400
value1=0.759770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622786400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1622743200
value1=0.764870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622548800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622505600
value1=0.776770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621965600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621922400
value1=0.777210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621965600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1621900800
value1=0.777620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617364800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617321600
value1=0.763700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617300000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1617256800
value1=0.755690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617300000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1617235200
value1=0.753190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616587200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616544000
value1=0.758320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616587200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1616544000
value1=0.758320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616068800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616025600
value1=0.784920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615356000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615312800
value1=0.771900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615161600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614945600
value1=0.765090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615161600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1614924000
value1=0.762360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614578400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614362400
value1=0.770440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614578400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614362400
value1=0.770440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614276000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614232800
value1=0.800710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614276000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614232800
value1=0.800710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613390400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1613347200
value1=0.778760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611856800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611813600
value1=0.759590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611856800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1611813600
value1=0.759590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611856800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1611792000
value1=0.759190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610992800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1610949600
value1=0.766400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609956000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609912800
value1=0.782020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609956000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609912800
value1=0.782020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608228000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608184800
value1=0.763760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608141600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608098400
value1=0.757850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607688000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607644800
value1=0.757190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607688000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1607644800
value1=0.757190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607040000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606996800
value1=0.744960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606694400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606478400
value1=0.739900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605268800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1605225600
value1=0.722220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605268800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1605204000
value1=0.722150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599220800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1599177600
value1=0.726040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599220800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1599156000
value1=0.725130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598551200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598508000
value1=0.729050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597860000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597816800
value1=0.727560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596672000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596628800
value1=0.722910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596672000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1596607200
value1=0.724120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596499200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596456000
value1=0.709950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595613600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595570400
value1=0.706370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594857600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594814400
value1=0.702390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594080000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594036800
value1=0.698610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592956800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592913600
value1=0.696640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592308800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592265600
value1=0.697370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591963200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1591920000
value1=0.681730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591963200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591898400
value1=0.679960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591682400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591639200
value1=0.704270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589500800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589457600
value1=0.641180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588831200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588788000
value1=0.637860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588593600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588550400
value1=0.637700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586865600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586822400
value1=0.643010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585310400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585267200
value1=0.612600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585159200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585116000
value1=0.606930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584619200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584576000
value1=0.551440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584079200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584036000
value1=0.623090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584079200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584036000
value1=0.623090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583280000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583236800
value1=0.662570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583107200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582891200
value1=0.644070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583107200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582891200
value1=0.644070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582783200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582740000
value1=0.654240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582783200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582740000
value1=0.654240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582048800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582005600
value1=0.667490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582048800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1581984000
value1=0.667360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581552000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1581508800
value1=0.675020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581552000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1581487200
value1=0.674850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580925600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580882400
value1=0.677230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580428800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580385600
value1=0.670310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580428800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580385600
value1=0.670310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579500000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1579284000
value1=0.686980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578074400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1578031200
value1=0.693020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575396000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575352800
value1=0.686220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575396000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1575352800
value1=0.686220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573776000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573732800
value1=0.677210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573776000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1573732800
value1=0.677210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569888000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569844800
value1=0.674130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568743200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1568700000
value1=0.683160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568743200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1568678400
value1=0.683050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566540000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566496800
value1=0.674520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565676000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565632800
value1=0.674530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560751200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560535200
value1=0.686980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560751200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1560535200
value1=0.686980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560448800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560405600
value1=0.690150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560448800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1560405600
value1=0.690150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557813600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557770400
value1=0.693970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556064000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556020800
value1=0.708720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555524000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1555480800
value1=0.720390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21555524000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1555459200
value1=0.720450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554832800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1554789600
value1=0.715220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553169600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553126400
value1=0.716220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548871200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1548828000
value1=0.720420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548676800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1548633600
value1=0.720390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548180000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1548136800
value1=0.712210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547229600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547186400
value1=0.723510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547229600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1547186400
value1=0.723510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547121600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547078400
value1=0.719150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546516800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546473600
value1=0.692980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543860000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543816800
value1=0.738420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542088800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1542045600
value1=0.716420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540339200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1540296000
value1=0.705640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540296000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1540252800
value1=0.705540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539172800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539129600
value1=0.713050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539172800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1539108000
value1=0.712670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539086400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539043200
value1=0.709380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538114400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1538071200
value1=0.720210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535976000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535932800
value1=0.718210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535976000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535932800
value1=0.718210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535976000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1535738400
value1=0.716570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535090400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535047200
value1=0.723780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535090400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1535025600
value1=0.724050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534874400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1534831200
value1=0.736460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533924000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533880800
value1=0.728890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533081600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1533038400
value1=0.744080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1532671200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1532628000
value1=0.737340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531764000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1531720800
value1=0.744140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531332000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1531288800
value1=0.738340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531159200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1531116000
value1=0.748380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528891200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1528848000
value1=0.755590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528480800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1528437600
value1=0.756070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527681600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527638400
value1=0.748520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527681600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1527616800
value1=0.747610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526558400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1526515200
value1=0.754700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525154400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525111200
value1=0.752670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525154400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1525111200
value1=0.752670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523642400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1523599200
value1=0.780980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522216800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1522173600
value1=0.767500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519905600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519862400
value1=0.772190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518717600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518674400
value1=0.795870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517529600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1517486400
value1=0.800130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517529600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1517464800
value1=0.798750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516838400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516795200
value1=0.808300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516384800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516341600
value1=0.803640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516384800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1516341600
value1=0.803640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1515542400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1515499200
value1=0.780740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515391200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515175200
value1=0.787260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515132000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515088800
value1=0.786950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512000000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1511956800
value1=0.755190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511136000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510920000
value1=0.753820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1511136000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510920000
value1=0.753820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506535200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506492000
value1=0.783620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506535200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1506492000
value1=0.783620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505952000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1505908800
value1=0.810290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21505952000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1505887200
value1=0.807420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505800800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1505757600
value1=0.794040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504872000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504828800
value1=0.812490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1502712000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1502668800
value1=0.791330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1500422400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1500379200
value1=0.793420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498780800
value1=0.770520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498824000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1498780800
value1=0.770520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21498824000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1498759200
value1=0.771190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498521600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1498478400
value1=0.759720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497484800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497441600
value1=0.763510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497355200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1497312000
value1=0.756370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1496210400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1496167200
value1=0.747560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494633600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1494590400
value1=0.740110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1491566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1491523200
value1=0.751610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1491350400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1491307200
value1=0.754950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1491350400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1491307200
value1=0.754950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490205600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490162400
value1=0.763880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21490205600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1490140800
value1=0.764060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1489449600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1489406400
value1=0.759190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1487786400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1487743200
value1=0.770170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21487786400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1487721600
value1=0.770960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1486080000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1486036800
value1=0.769540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1485367200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1485324000
value1=0.751960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484265600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1484222400
value1=0.751760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1484049600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1484006400
value1=0.738420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484049600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1484006400
value1=0.738420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1480356000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1480312800
value1=0.748350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1479924000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1479880800
value1=0.743480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479924000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1479859200
value1=0.744470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478628000
value1=0.777770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1478584800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1478541600
value1=0.772890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21478584800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1478520000
value1=0.771890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476813600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1476770400
value1=0.768660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476489600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1476446400
value1=0.764710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475798400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1475755200
value1=0.756170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475258400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1475215200
value1=0.759890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21475258400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1475193600
value1=0.758930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1474999200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1474956000
value1=0.768650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474329600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1474286400
value1=0.757250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1473184800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1473141600
value1=0.764930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1471478400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1471435200
value1=0.760860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1470873600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1470830400
value1=0.773420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1470873600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1470830400
value1=0.773420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1469577600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1469534400
value1=0.753180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21469577600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1469512800
value1=0.753960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468972800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1468929600
value1=0.747570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21468972800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1468908000
value1=0.747810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467806400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1467763200
value1=0.740750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466748000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466704800
value1=0.764380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466748000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466704800
value1=0.764380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21466748000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1466683200
value1=0.761110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466467200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466424000
value1=0.747660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464739200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464696000
value1=0.726140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464609600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1464566400
value1=0.715670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1463659200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1463616000
value1=0.719130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1462276800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1462233600
value1=0.771940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21462276800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1462212000
value1=0.768830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461823200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461780000
value1=0.756920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461715200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1461672000
value1=0.776030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461304800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1461261600
value1=0.773390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1460095200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1460052000
value1=0.749990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1458842400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1458799200
value1=0.748270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21458842400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1458777600
value1=0.747680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1454500800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1454457600
value1=0.700680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453939200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1453896000
value1=0.708110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1451455200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1451412000
value1=0.730000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21451455200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1451390400
value1=0.730260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1449036000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1448992800
value1=0.734290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1449036000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1448992800
value1=0.734290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1448258400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1448064000
value1=0.723250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1446638400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1446595200
value1=0.722370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1444824000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1444780800
value1=0.721350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1444262400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1444219200
value1=0.723420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1443528000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1443484800
value1=0.693620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442232000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1442188800
value1=0.712400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441065600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441022400
value1=0.708190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440763200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1440720000
value1=0.719710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439380800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1439337600
value1=0.723320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439186400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1438992000
value1=0.741600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438171200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1438128000
value1=0.734360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21438171200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1438106400
value1=0.735050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437782400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1437739200
value1=0.726340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437048000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1437004800
value1=0.734880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1436313600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1436270400
value1=0.739700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21436313600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1436248800
value1=0.740430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1435060800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1435017600
value1=0.769380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1434672000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1434628800
value1=0.784430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1434585600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1434542400
value1=0.764450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21434585600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1434520800
value1=0.766980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433332800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1433289600
value1=0.781640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1432512000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1432317600
value1=0.781520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1431604800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1431561600
value1=0.815280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1431604800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1431561600
value1=0.815280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21431604800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1431540000
value1=0.816260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430956800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430913600
value1=0.802990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430287200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430244000
value1=0.802700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1428537600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1428494400
value1=0.772260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427176800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1427133600
value1=0.790130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21427112000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1426874400
value1=0.779750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1426010400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1425967200
value1=0.761230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426010400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1425967200
value1=0.761230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1425621600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1425578400
value1=0.777010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21425621600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1425556800
value1=0.775410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1425427200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1425384000
value1=0.784410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1424800800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1424757600
value1=0.773930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1423569600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1423526400
value1=0.784030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1421928000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1421884800
value1=0.805470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1421344800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1421301600
value1=0.829390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1420804800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1420761600
value1=0.814490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1420675200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1420632000
value1=0.803210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1419228000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1419033600
value1=0.813110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418882400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418839200
value1=0.811080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1418839200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1418796000
value1=0.816940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21418839200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1418774400
value1=0.813910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1418644800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1418601600
value1=0.820840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1417197600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1417154400
value1=0.849760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1416225600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1416182400
value1=0.879190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21416225600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1415988000
value1=0.879540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415836800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1415793600
value1=0.873870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415080800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1415037600
value1=0.864490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21415080800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1415016000
value1=0.867730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1414670400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1414627200
value1=0.875470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1413180000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1412964000
value1=0.865190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21413180000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1412942400
value1=0.868030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1412877600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1412834400
value1=0.888830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21412877600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1412812800
value1=0.889850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410372000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1410328800
value1=0.912560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408557600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1408514400
value1=0.928060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1406138400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1406095200
value1=0.945420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1406138400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1406095200
value1=0.945420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1404280800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1404237600
value1=0.949730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21404280800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1404216000
value1=0.950360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1401321600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1401278400
value1=0.921670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1400608800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1400565600
value1=0.924890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1400090400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1400047200
value1=0.940700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21400090400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1400025600
value1=0.940900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398772800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1398729600
value1=0.923340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1397152800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1397109600
value1=0.945210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397152800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1397109600
value1=0.945210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395316800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1395273600
value1=0.901290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394647200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1394604000
value1=0.893020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21394647200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1394582400
value1=0.892360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1394215200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1394172000
value1=0.913290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394215200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1394172000
value1=0.913290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21394215200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1394150400
value1=0.912910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1393308000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1393264800
value1=0.904390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392897600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1392854400
value1=0.893660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1390586400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1390543200
value1=0.865980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390413600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390370400
value1=0.888210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21390413600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1390348800
value1=0.888730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1389895200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1389852000
value1=0.877890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389895200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1389852000
value1=0.877890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389808800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1389765600
value1=0.889420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389290400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1389247200
value1=0.886710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21389290400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1389225600
value1=0.886690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1388620800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1388491200
value1=0.895050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1387454400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1387411200
value1=0.882850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1387454400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1387411200
value1=0.882850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1386892800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1386849600
value1=0.891620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1386849600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1386806400
value1=0.901500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1386741600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1386698400
value1=0.915220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21386741600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1386676800
value1=0.916660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1385618400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1385575200
value1=0.907520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1384797600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1384754400
value1=0.941680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1384322400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1384279200
value1=0.928580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1383631200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1383588000
value1=0.952090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21383631200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1383566400
value1=0.951400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1381860000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1381816800
value1=0.953980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1381860000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1381816800
value1=0.953980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1379354400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1379311200
value1=0.938680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1379354400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1379311200
value1=0.938680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1378879200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1378836000
value1=0.931790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21378879200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1378814400
value1=0.931860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1377626400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1377583200
value1=0.893300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1377021600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1376978400
value1=0.904380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1374861600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1374818400
value1=0.929410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21374861600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1374796800
value1=0.929500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1374040800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1373997600
value1=0.925320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1372982400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1372939200
value1=0.918060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1371189600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1371146400
value1=0.965650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1370325600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1370282400
value1=0.977150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1369958400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1369915200
value1=0.968990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1369310400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1369267200
value1=0.959340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1369267200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1369224000
value1=0.966130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368403200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368187200
value1=0.996080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1368403200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1368187200
value1=0.996080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1367971200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1367928000
value1=1.016000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1367884800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1367841600
value1=1.023160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1367517600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1367474400
value1=1.022180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1366912800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1366869600
value1=1.033880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1366675200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1366632000
value1=1.024220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21366675200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1366610400
value1=1.023540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1366092000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1366048800
value1=1.029220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1364925600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1364882400
value1=1.047760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1362420000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1362376800
value1=1.012490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1361448000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1361404800
value1=1.022480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1359633600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1359590400
value1=1.037910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1356112800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1356069600
value1=1.040890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1356004800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1355961600
value1=1.046700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21356004800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1355940000
value1=1.046300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1354665600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1354622400
value1=1.048280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1354298400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1354255200
value1=1.040130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21354298400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1354233600
value1=1.041290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1352959200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1352916000
value1=1.034630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1352224800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1352181600
value1=1.044390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1351188000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1351144800
value1=1.039460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1350410400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1350367200
value1=1.028820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1349697600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1349654400
value1=1.014880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1349092800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1349049600
value1=1.033090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21349092800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1348855200
value1=1.032500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1348250400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1348207200
value1=1.051820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1347645600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1347602400
value1=1.062390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1347472800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1347429600
value1=1.050490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1347472800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1347429600
value1=1.050490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21347472800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1347408000
value1=1.049890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1346716800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1346673600
value1=1.023180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1342137600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1342094400
value1=1.010540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1341856800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1341813600
value1=1.015520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1341014400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1340971200
value1=1.025660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1340884800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1340841600
value1=1.012490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1338897600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1338854400
value1=0.980300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1338228000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1338184800
value1=0.988780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1337817600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1337774400
value1=0.968940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1337018400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336975200
value1=0.995780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1336521600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336478400
value1=1.008800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1336392000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336348800
value1=1.012780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1336392000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1336348800
value1=1.012780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1335463200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1335420000
value1=1.038950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1335225600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1335182400
value1=1.028570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21335225600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1335160800
value1=1.027160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1334923200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1334880000
value1=1.031810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1334124000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1334080800
value1=1.022500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21334124000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1334059200
value1=1.024670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1334059200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1334016000
value1=1.035490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1332828000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1332784800
value1=1.054040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1331769600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1331726400
value1=1.042760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1329847200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1329804000
value1=1.065410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1329328800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1329285600
value1=1.077560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21329328800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1329264000
value1=1.077380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1328140800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1328097600
value1=1.073950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1327600800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1327557600
value1=1.068700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1327363200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1327320000
value1=1.055050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1327363200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1327320000
value1=1.055050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1326823200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1326780000
value1=1.044810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1324490400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1324447200
value1=1.021830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21324490400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1324425600
value1=1.021130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1323907200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1323864000
value1=0.988400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1319781600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1319738400
value1=1.072920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1318464000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1318420800
value1=1.020540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1317924000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1317880800
value1=0.974570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1317772800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1317729600
value1=0.940030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1317772800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1317729600
value1=0.940030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21317772800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1317708000
value1=0.938980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1317168000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1317124800
value1=0.998400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1316757600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1316714400
value1=0.972010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21316757600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1316692800
value1=0.969140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1316476800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1316433600
value1=1.017610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1316044800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1316001600
value1=1.019230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1316044800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1316001600
value1=1.019230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21316044800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1315980000
value1=1.017720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1315461600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1315418400
value1=1.065260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21315461600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1315396800
value1=1.065990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1314921600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1314878400
value1=1.076410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1314165600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1314122400
value1=1.052960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1313474400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1313431200
value1=1.051120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1312891200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1312848000
value1=0.998800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1312372800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1312329600
value1=1.071040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1312372800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1312329600
value1=1.071040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1311789600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1311746400
value1=1.106710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1310493600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1310450400
value1=1.055230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1309435200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1309392000
value1=1.074950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1309327200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1309284000
value1=1.054780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1308873600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1308830400
value1=1.045730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1306497600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1306454400
value1=1.071800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1305720000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1305676800
value1=1.066450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1304661600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1304618400
value1=1.057800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1304661600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1304618400
value1=1.057800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21304661600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1304596800
value1=1.053600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1304510400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1304467200
value1=1.079980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21304510400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1304445600
value1=1.078860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1302609600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1302566400
value1=1.038890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1301270400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1301054400
value1=1.029220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1301270400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1301054400
value1=1.029220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1300341600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1300298400
value1=0.970440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1299801600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1299758400
value1=0.998950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1299067200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1299024000
value1=1.008490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1298635200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1298592000
value1=1.013460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1295460000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1295416800
value1=1.007590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1294898400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1294855200
value1=0.997110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1294768800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1294725600
value1=0.982350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1293580800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1293537600
value1=1.012100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1293580800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1293537600
value1=1.012100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1291852800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1291809600
value1=0.975770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1291356000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1291312800
value1=0.977410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1291269600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1291226400
value1=0.968240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1290578400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1290535200
value1=0.971730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1288224000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1288180800
value1=0.965110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1287554400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1287511200
value1=0.966190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21287554400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1287489600
value1=0.966120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1286906400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1286863200
value1=0.977340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21286906400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1286841600
value1=0.976680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1286474400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1286431200
value1=0.991580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1286474400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1286431200
value1=0.991580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1285783200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1285740000
value1=0.972860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1285740000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1285696800
value1=0.967810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1284746400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1284703200
value1=0.946750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1283407200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1283364000
value1=0.911560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21283407200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1283342400
value1=0.911290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1283169600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1283126400
value1=0.901510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21283169600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1282932000
value1=0.902870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1282716000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1282672800
value1=0.880840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1282219200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1282176000
value1=0.894990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21282219200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1282154400
value1=0.894480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1281484800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1281441600
value1=0.907990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1279648800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1279605600
value1=0.879950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1277985600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1277942400
value1=0.832280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1277985600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1277942400
value1=0.832280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1277877600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1277834400
value1=0.846360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1277726400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1277683200
value1=0.876200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1277488800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1277445600
value1=0.859480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1277143200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1277100000
value1=0.884600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1276560000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1276516800
value1=0.866620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1276236000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1276192800
value1=0.850300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1276128000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1276084800
value1=0.835670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1275588000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1275544800
value1=0.852140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1274313600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1274270400
value1=0.835700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1272434400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1272391200
value1=0.913500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1271700000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1271656800
value1=0.916100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1271073600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1271030400
value1=0.934610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1271052000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1270836000
value1=0.938080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21271052000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1270814400
value1=0.934500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1269280800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1269237600
value1=0.908420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1268697600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1268654400
value1=0.910540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21268697600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1268632800
value1=0.909530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1268265600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1268222400
value1=0.919210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1268265600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1268222400
value1=0.919210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1267034400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1266991200
value1=0.886790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1266840000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1266796800
value1=0.901970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1265781600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1265738400
value1=0.879530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1265349600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1265306400
value1=0.864120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1265349600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1265306400
value1=0.864120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1265025600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264982400
value1=0.881130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1265025600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1264982400
value1=0.881130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21265025600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1264788000
value1=0.880990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1264140000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264096800
value1=0.898150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1264140000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1264096800
value1=0.898150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1262865600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1262822400
value1=0.923230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1262865600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1262822400
value1=0.923230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21262865600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1262800800
value1=0.926440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1262131200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1262088000
value1=0.897240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1261677600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1261634400
value1=0.885860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1261483200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1261440000
value1=0.877790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1261483200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1261440000
value1=0.877790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1260986400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1260943200
value1=0.897270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1260792000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1260748800
value1=0.905410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1260338400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1260295200
value1=0.901400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1260208800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1260165600
value1=0.907160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1259344800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1259301600
value1=0.898590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21259344800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1259280000
value1=0.894570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1259172000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1259128800
value1=0.930240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1258675200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1258632000
value1=0.913750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1258502400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1258459200
value1=0.924010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1256018400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255975200
value1=0.931000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255629600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255586400
value1=0.922400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1255629600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1255586400
value1=0.922400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21255629600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1255564800
value1=0.922700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255543200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255500000
value1=0.915700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1255543200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1255500000
value1=0.915700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1253577600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1253534400
value1=0.859500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1252454400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1252411200
value1=0.865600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1252454400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1252411200
value1=0.865600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1250791200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1250748000
value1=0.832300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1250532000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1250488800
value1=0.815480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1250100000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1250056800
value1=0.821460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21250100000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1250035200
value1=0.817970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1248804000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1248760800
value1=0.832870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1248156000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1248112800
value1=0.817910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1248156000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1248112800
value1=0.817910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1247119200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1247076000
value1=0.775320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1246600800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1246557600
value1=0.790190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21246600800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1246536000
value1=0.793480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1246384800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1246341600
value1=0.815470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21246384800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1246320000
value1=0.814580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1245758400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1245715200
value1=0.778890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1244656800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1244613600
value1=0.813410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1240941600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1240898400
value1=0.700080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21240941600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1240876800
value1=0.698880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1240812000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1240596000
value1=0.721140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21240812000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1240574400
value1=0.723730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1240293600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1240250400
value1=0.696300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1240293600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1240250400
value1=0.696300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1239796800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1239753600
value1=0.714570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1239688800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1239645600
value1=0.732190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1239688800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1239645600
value1=0.732190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1239343200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1239300000
value1=0.720150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1237896000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1237852800
value1=0.707980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1237442400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1237399200
value1=0.679800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1235995200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1235952000
value1=0.630600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1234936800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1234893600
value1=0.633200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1234159200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1233943200
value1=0.676400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1233727200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1233684000
value1=0.653300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1233597600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1233554400
value1=0.625500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1233597600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1233554400
value1=0.625500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1233252000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1233208800
value1=0.655000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1232517600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1232474400
value1=0.645500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1231437600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1231394400
value1=0.699200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21231437600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1231372800
value1=0.695700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1227830400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1227787200
value1=0.660500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21227830400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1227765600
value1=0.659300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1227592800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1227549600
value1=0.655500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21227592800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1227528000
value1=0.654300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1227247200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1227204000
value1=0.607700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1227247200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1227204000
value1=0.607700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1225260000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1225216800
value1=0.653000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1223877600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1223661600
value1=0.654300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1222819200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1222776000
value1=0.786800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1222776000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1222732800
value1=0.798600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1222776000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1222732800
value1=0.798600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21222776000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1222711200
value1=0.792900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1222063200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1221847200
value1=0.837300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1220832000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1220616000
value1=0.806700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1220832000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1220616000
value1=0.806700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21220832000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1220594400
value1=0.802900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1219384800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1219341600
value1=0.881200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21219384800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1219320000
value1=0.880800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1218823200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1218780000
value1=0.860900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1218823200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1218780000
value1=0.860900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1218628800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1218585600
value1=0.861200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1217829600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1217613600
value1=0.928600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1216900800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1216857600
value1=0.957100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1216166400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1216123200
value1=0.982500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21216166400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1216101600
value1=0.984900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1214848800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1214805600
value1=0.966300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1212040800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1211997600
value1=0.963600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1210658400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1210615200
value1=0.947800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1209621600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1209578400
value1=0.944200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21209621600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1209556800
value1=0.947200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1208973600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1208930400
value1=0.953600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1208973600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1208930400
value1=0.953600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21208973600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1208908800
value1=0.954100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1207548000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1207332000
value1=0.922600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1207094400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1207051200
value1=0.903100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1206057600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1206014400
value1=0.895300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1204264800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1204221600
value1=0.948900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21204264800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1204200000
value1=0.949600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1202320800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1202277600
value1=0.890800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1202169600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1202126400
value1=0.910000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1200463200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1200420000
value1=0.878000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1200031200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1199988000
value1=0.896400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1199836800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1199793600
value1=0.883800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1198454400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1198238400
value1=0.869200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1197374400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1197331200
value1=0.888800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1196100000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1196056800
value1=0.886800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21196100000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1196035200
value1=0.886800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1195560000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1195516800
value1=0.877500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21195560000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1195495200
value1=0.875700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1193680800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1193637600
value1=0.925700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1193680800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1193637600
value1=0.925700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21193680800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1193616000
value1=0.927000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1193097600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1193054400
value1=0.876500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1192147200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1192104000
value1=0.905900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21192147200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1192082400
value1=0.905900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1191801600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1191585600
value1=0.900300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1191304800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1191261600
value1=0.894800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1189663200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1189620000
value1=0.842500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1189663200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1189620000
value1=0.842500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1189144800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1189101600
value1=0.829400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1188388800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1188345600
value1=0.806500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1187308800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1187265600
value1=0.782000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1186660800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1186617600
value1=0.866200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1185991200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1185948000
value1=0.846800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1185775200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1185559200
value1=0.847000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1185516000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1185472800
value1=0.866600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1184608800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1184565600
value1=0.875900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1181757600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1181714400
value1=0.835700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1180936800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1180720800
value1=0.832400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1180936800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1180720800
value1=0.832400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1179381600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1179338400
value1=0.823000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21179381600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1179316800
value1=0.823500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1174953600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1174910400
value1=0.810500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1173160800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1173117600
value1=0.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1173160800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1173117600
value1=0.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21173160800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1173096000
value1=0.770000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1171886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1171843200
value1=0.788600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1171886400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1171843200
value1=0.788600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1170936000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1170892800
value1=0.781400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1170309600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1170266400
value1=0.776800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1167112800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1167069600
value1=0.785600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1166659200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1166616000
value1=0.787000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1166205600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1166162400
value1=0.777000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1163484000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1163440800
value1=0.761300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21163484000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1163419200
value1=0.761400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1163030400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1162987200
value1=0.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1162944000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1162900800
value1=0.776100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1162209600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1162166400
value1=0.770200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1162209600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1162166400
value1=0.770200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1161324000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1161280800
value1=0.759500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1159142400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1158948000
value1=0.749500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1157414400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1157371200
value1=0.772100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1157371200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1157328000
value1=0.771200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1155945600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1155902400
value1=0.757700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1154520000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1154476800
value1=0.768400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1153980000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1153936800
value1=0.762100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1152727200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1152684000
value1=0.755700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1149660000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1149616800
value1=0.740100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1149660000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1149616800
value1=0.740100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1148320800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1148277600
value1=0.748000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1147932000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1147888800
value1=0.757400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1147240800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1147197600
value1=0.774900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1147197600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1147154400
value1=0.763600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1145512800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1145469600
value1=0.747300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1143223200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1143180000
value1=0.706000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1143223200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1143180000
value1=0.706000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1142877600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1142834400
value1=0.717800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1141797600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1141754400
value1=0.731700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1140652800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1140609600
value1=0.734300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1139788800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1139594400
value1=0.736800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1139421600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1139378400
value1=0.736200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1139421600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1139378400
value1=0.736200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1139292000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1139248800
value1=0.740000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1138773600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1138730400
value1=0.759000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1135749600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1135706400
value1=0.724700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1135749600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1135706400
value1=0.724700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1135144800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1135101600
value1=0.733000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1132034400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1131991200
value1=0.726500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1131688800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1131645600
value1=0.729500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21131688800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1131624000
value1=0.729200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1130716800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1130522400
value1=0.749100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1129680000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1129636800
value1=0.746100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1129248000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1129204800
value1=0.746200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1128016800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1127973600
value1=0.762600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1127239200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1127196000
value1=0.772400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1126245600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1126202400
value1=0.773200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1126245600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1126202400
value1=0.773200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1125403200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1125360000
value1=0.747400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1123632000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1123588800
value1=0.758200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1122487200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1122444000
value1=0.752700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1120024800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1119981600
value1=0.762200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1118901600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1118858400
value1=0.770500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1117692000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1117648800
value1=0.748200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1117173600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1117130400
value1=0.758200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1115834400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1115791200
value1=0.778900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1115272800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1115229600
value1=0.781400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1114214400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1114171200
value1=0.783500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1112724000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1112680800
value1=0.762800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1112724000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1112680800
value1=0.762800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21112724000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1112659200
value1=0.763000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1109786400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1109743200
value1=0.777600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1109635200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1109592000
value1=0.794900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1106524800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1106330400
value1=0.769300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1104537600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1104494400
value1=0.784300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1104256800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1104213600
value1=0.781400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1104256800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1104213600
value1=0.781400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1102550400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1102507200
value1=0.753000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1101837600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1101794400
value1=0.771600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1101751200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1101708000
value1=0.782900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1101427200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1101384000
value1=0.793300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1100239200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1100196000
value1=0.765600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1098727200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1098684000
value1=0.749800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1098727200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1098684000
value1=0.749800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1098187200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1098144000
value1=0.723000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1097215200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1097172000
value1=0.728400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1096610400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1096567200
value1=0.728200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1095984000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1095940800
value1=0.716000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1095206400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1095163200
value1=0.705300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1093888800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1093845600
value1=0.697500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1093888800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1093845600
value1=0.697500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21093888800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1093824000
value1=0.695600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1093413600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1093370400
value1=0.702800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1093413600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1093370400
value1=0.702800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1092420000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1092376800
value1=0.707100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21092420000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1092355200
value1=0.705600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1090994400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1090951200
value1=0.698600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1090454400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1090411200
value1=0.710900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1086674400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1086631200
value1=0.707300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1086264000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1086220800
value1=0.689600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1086264000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1086220800
value1=0.689600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1085702400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1085659200
value1=0.719000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1085551200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1085508000
value1=0.709900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1084881600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1084838400
value1=0.681900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1082656800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1082613600
value1=0.723600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1082570400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1082527200
value1=0.726400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1082570400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1082527200
value1=0.726400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21082570400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1082505600
value1=0.727200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1082397600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1082354400
value1=0.751400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1081317600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1081274400
value1=0.763500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21081317600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1081252800
value1=0.763500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1080799200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1080756000
value1=0.767100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1080799200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1080756000
value1=0.767100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1079092800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1079049600
value1=0.725300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1075096800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1074902400
value1=0.769900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21075096800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1074880800
value1=0.770100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1071554400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1071511200
value1=0.744600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1070992800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1070949600
value1=0.743500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1070517600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1070474400
value1=0.737500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1070517600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1070474400
value1=0.737500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1070366400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1070323200
value1=0.730100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1068746400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1068703200
value1=0.722700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1068508800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1068465600
value1=0.718100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1066802400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1066759200
value1=0.700600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1064944800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1064901600
value1=0.687400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1064858400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1064815200
value1=0.667900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1064534400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1064491200
value1=0.682000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1064534400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1064491200
value1=0.682000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21064534400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1064469600
value1=0.682700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1061575200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1061532000
value1=0.647300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1060668000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1060624800
value1=0.658400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1060322400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1060279200
value1=0.652800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1058335200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1058292000
value1=0.649200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1057795200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1057752000
value1=0.652300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1056002400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1055959200
value1=0.674100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1056002400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1055959200
value1=0.674100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21056002400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1055937600
value1=0.673900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1054771200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1054728000
value1=0.667000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21054771200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1054706400
value1=0.666800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1054231200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1054188000
value1=0.642900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1049738400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1049695200
value1=0.592500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1048010400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1047967200
value1=0.587700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1048010400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1047967200
value1=0.587700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1046196000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1046152800
value1=0.607700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1046196000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1046152800
value1=0.607700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21046196000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1046131200
value1=0.608400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1045051200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1045008000
value1=0.593300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1044986400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1044943200
value1=0.586700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1042826400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1042783200
value1=0.592000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1039802400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1039759200
value1=0.568400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1039802400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1039759200
value1=0.568400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21039802400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1039737600
value1=0.568500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1038009600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1037966400
value1=0.564500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1037340000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1037296800
value1=0.564400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1036432800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1036389600
value1=0.562400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1036432800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1036389600
value1=0.562400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1035871200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1035828000
value1=0.559500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1035504000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1035460800
value1=0.556400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1035288000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1035244800
value1=0.556400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1035288000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1035244800
value1=0.556400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21035288000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1035223200
value1=0.556900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1033495200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1033452000
value1=0.540500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21033495200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1033430400
value1=0.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1031659200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1031616000
value1=0.551800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1029823200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1029780000
value1=0.540800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21029823200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1029758400
value1=0.540600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1029196800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1029153600
value1=0.540900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1028656800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1028613600
value1=0.523000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1028656800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1028613600
value1=0.523000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1028073600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1028030400
value1=0.546000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21028073600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1028008800
value1=0.545600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1025157600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1025114400
value1=0.559100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1024660800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1024617600
value1=0.574800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1023710400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1023667200
value1=0.568100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1023213600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1023170400
value1=0.577300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1022868000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1022824800
value1=0.570000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1022716800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1022673600
value1=0.565000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1022716800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1022673600
value1=0.565000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1021528800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1021485600
value1=0.549500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1020794400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1020751200
value1=0.543000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1020405600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1020362400
value1=0.534100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1016668800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1016625600
value1=0.531600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1015545600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1015502400
value1=0.526600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1015502400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1015459200
value1=0.524400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1015502400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1015459200
value1=0.524400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1014897600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1014854400
value1=0.517000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1013191200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1013148000
value1=0.511600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1013018400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1012975200
value1=0.506800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1011722400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1011679200
value1=0.520400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21011722400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1011657600
value1=0.520500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1009778400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1009584000
value1=0.512000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1008914400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1008871200
value1=0.504300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21008914400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1008849600
value1=0.504000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1005588000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1005544800
value1=0.522000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1003168800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1003125600
value1=0.515400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1003168800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1003125600
value1=0.515400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1002499200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1002304800
value1=0.507000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1000166400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1000123200
value1=0.511300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1000166400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1000123200
value1=0.511300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21000166400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1000101600
value1=0.511700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI999712800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=999669600
value1=0.516900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV999712800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=999669600
value1=0.516900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2999712800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=999648000
value1=0.516200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV998503200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=998460000
value1=0.539400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV994917600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=994874400
value1=0.501000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV994248000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=994204800
value1=0.519500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI992498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=992455200
value1=0.529700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV992498400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=992455200
value1=0.529700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV989474400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=989431200
value1=0.525700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV988804800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=988761600
value1=0.521400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV988372800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=988329600
value1=0.513700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV987638400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=987595200
value1=0.493000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV987141600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=987098400
value1=0.510600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI986277600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=986234400
value1=0.478300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV986277600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=986234400
value1=0.478300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV985672800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=985629600
value1=0.501100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV983469600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=983426400
value1=0.529100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2983469600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=983404800
value1=0.529300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI982713600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=982670400
value1=0.522100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV981072000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=981028800
value1=0.555700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI980402400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=980359200
value1=0.542400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV980402400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=980359200
value1=0.542400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV979905600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=979862400
value1=0.562500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV979581600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=979538400
value1=0.551600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI978696000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=978652800
value1=0.572600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI978544800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=978501600
value1=0.565700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV978544800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=978501600
value1=0.565700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2978544800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=978480000
value1=0.565400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI977378400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=977335200
value1=0.554300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI975693600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=975650400
value1=0.538000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV975391200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=975348000
value1=0.526900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV974980800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=974937600
value1=0.527700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2974980800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=974916000
value1=0.528700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV973015200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=972972000
value1=0.512700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2973015200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=972950400
value1=0.511000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV970682400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=970639200
value1=0.535000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2970682400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=970617600
value1=0.534700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV970272000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=970228800
value1=0.538900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV969472800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=969429600
value1=0.538000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI968241600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=968198400
value1=0.564600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI966492000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=966448800
value1=0.591800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV966362400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=966319200
value1=0.584500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV965304000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=965260800
value1=0.587500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV962863200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=962820000
value1=0.588500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2962863200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=962798400
value1=0.588700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI960940800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=960897600
value1=0.598200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV960876000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=960832800
value1=0.592400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2960876000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=960811200
value1=0.592100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV959817600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=959774400
value1=0.569400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV955627200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=955584000
value1=0.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2955627200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=955562400
value1=0.600500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV954180000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=954136800
value1=0.615200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV948218400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=948175200
value1=0.662000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2948218400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=948153600
value1=0.662200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI947829600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=947786400
value1=0.668600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV947829600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=947786400
value1=0.668600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV947224800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=947181600
value1=0.652700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV945864000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=945820800
value1=0.647100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI945410400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=945367200
value1=0.643800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV945410400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=945367200
value1=0.643800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2945410400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=945345600
value1=0.643700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV944632800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=944589600
value1=0.637500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV944244000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=944200800
value1=0.629700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV940269600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=940226400
value1=0.641700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI939124800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=939081600
value1=0.664000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV939124800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=939081600
value1=0.664000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2939124800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=939060000
value1=0.664200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV937893600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=937850400
value1=0.641000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI937267200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=937224000
value1=0.658600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV937267200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=937224000
value1=0.658600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV936792000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=936748800
value1=0.651500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV936338400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=936295200
value1=0.645300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV936122400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=936079200
value1=0.639000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2936122400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=936057600
value1=0.639000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI935085600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=935042400
value1=0.633700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV935085600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=935042400
value1=0.633700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV934869600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=934826400
value1=0.648300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI933832800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=933789600
value1=0.660100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV933832800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=933789600
value1=0.660100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV931845600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=931802400
value1=0.661000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV931327200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=931284000
value1=0.660900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV930333600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=930290400
value1=0.664500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV930160800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=930117600
value1=0.657500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV929728800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=929685600
value1=0.651200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2929728800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=929664000
value1=0.650200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI928281600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=928238400
value1=0.640500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI927720000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=927676800
value1=0.646300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV927720000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=927676800
value1=0.646300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV927050400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=927007200
value1=0.673100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV926596800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=926553600
value1=0.664000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI925452000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=925408800
value1=0.660300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV925452000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=925408800
value1=0.660300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2925452000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=925387200
value1=0.660100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV923443200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=923400000
value1=0.626800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV922860000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=922816800
value1=0.626200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2922860000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=922795200
value1=0.625700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV921801600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=921758400
value1=0.632000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2921801600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=921736800
value1=0.631700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI921024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=920980800
value1=0.637000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV921024000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=920980800
value1=0.637000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV920635200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=920592000
value1=0.628700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV920268000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=920052000
value1=0.616200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV919900800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=919857600
value1=0.631000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV918842400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=918799200
value1=0.640700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV917546400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=917503200
value1=0.623200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI916099200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=916056000
value1=0.641600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV914544000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=914371200
value1=0.608500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV912556800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=912384000
value1=0.627600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV906595200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=906422400
value1=0.575000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI904521600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=904176000
value1=0.555800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV904521600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=904176000
value1=0.555800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV901670400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=901497600
value1=0.607000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV900892800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=900547200
value1=0.634100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI897350400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=897004800
value1=0.595500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV897350400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=897004800
value1=0.595500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI895708800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=895536000
value1=0.621700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV890611200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=890265600
value1=0.658500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2890611200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=890179200
value1=0.657800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV888969600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=888796800
value1=0.684800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI884217600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=884044800
value1=0.631800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV884217600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=884044800
value1=0.631800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV879206400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=878860800
value1=0.692800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2879206400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=878774400
value1=0.691800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI878083200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=877910400
value1=0.681000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV873331200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=873158400
value1=0.724000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV871603200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=871430400
value1=0.748500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV871257600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=870912000
value1=0.729100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV869097600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=868924800
value1=0.731200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV860544000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=860371200
value1=0.773000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI855014400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=854668800
value1=0.761300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI854582400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=854409600
value1=0.765700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI848966400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=848620800
value1=0.814600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV848966400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=848620800
value1=0.814600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV846028800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=845856000
value1=0.798000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV843004800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=842832000
value1=0.788000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV840585600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=840412800
value1=0.793800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI838944000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=838771200
value1=0.771700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV834364800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=834019200
value1=0.786300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2834364800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=833932800
value1=0.784800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV833932800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=833760000
value1=0.802000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2833932800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=833500800
value1=0.803600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI826848000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=826675200
value1=0.776800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI825897600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=825552000
value1=0.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV825897600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=825552000
value1=0.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2825897600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=825465600
value1=0.767200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV814579200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=814406400
value1=0.745000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV812851200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=812678400
value1=0.769500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV2812073600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=811641600
value1=0.745000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI811123200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=810950400
value1=0.766600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV811123200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=810950400
value1=0.766600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV804384000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=804211200
value1=0.711800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV803606400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=803260800
value1=0.729000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV799977600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=799632000
value1=0.743000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI795830400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=795657600
value1=0.722500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV795225600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=795052800
value1=0.747300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI787795200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=787449600
value1=0.778500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV787795200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=787449600
value1=0.778500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI784339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=784166400
value1=0.755000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV772329600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=772156800
value1=0.746800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV742435200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=742089600
value1=0.685500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

</window>

<window>
height=50.000000
objects=0

<indicator>
name=Triple Exponential Average
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-0.001671
scale_fix_max=0
scale_fix_max_val=0.000970
expertmode=0
fixed_height=-1

<graph>
name=
draw=1
style=0
width=1
color=255
</graph>

<level>
level=-0.000150
style=0
color=65535
width=2
descr=
</level>

<level>
level=0.000150
style=0
color=65535
width=2
descr=
</level>
period=14
</indicator>
</window>

<window>
height=50.000000
objects=0

<indicator>
name=Relative Strength Index
path=
apply=7
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=1
scale_fix_min_val=0.000000
scale_fix_max=1
scale_fix_max_val=100.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=1
style=0
width=1
color=16748574
</graph>

<level>
level=30.000000
style=2
color=12632256
width=1
descr=
</level>

<level>
level=70.000000
style=2
color=12632256
width=1
descr=
</level>
period=7
</indicator>
</window>
</chart>