<chart>
id=133039357044775338
symbol=XAUUSD
description=Gold vs US Dollar
period_type=1
period_size=8
digits=2
tick_size=0.000000
position_time=1655856000
scale_fix=0
scale_fixed_min=1678.800000
scale_fixed_max=2002.400000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=0
scroll=1
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
windows_total=1

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
objects=710

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
trendPeriod=4
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=1
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND COLOR ============================================
inpFastLength=7
inpSlowLength=15
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
type=101
name=VelasRSI1659621600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659618000
value1=4173.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1659448800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659445200
value1=4080.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1659027600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659024000
value1=4040.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1658858400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1658854800
value1=3930.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657908000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657904400
value1=3857.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657904400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657900800
value1=3847.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657823400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657819800
value1=3732.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657731600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657728000
value1=3756.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657623600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657620000
value1=3816.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657215000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657211400
value1=3888.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657148400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657144800
value1=3874.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656586800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656583200
value1=3759.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656498600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656495000
value1=3808.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656444600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656441000
value1=3846.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656052200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656048600
value1=3822.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655836200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655832600
value1=3780.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655794800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655791200
value1=3736.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655404200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655400600
value1=3655.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655145000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655141400
value1=3749.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654903800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654900200
value1=3895.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654644600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654641000
value1=4162.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654275600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654272000
value1=4114.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654270200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654266600
value1=4140.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653417000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653413400
value1=3876.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652218200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652214600
value1=4044.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652122800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652119200
value1=4001.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652108400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652104800
value1=4034.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651858200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651854600
value1=4066.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651858200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651854600
value1=4064.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651690800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651687200
value1=4146.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651528800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651525200
value1=4060.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651264200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651260600
value1=4184.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651149000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651145400
value1=4266.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651001400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650997800
value1=4204.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650573000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650569400
value1=4424.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649781000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649777400
value1=4465.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649721600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649718000
value1=4408.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649419200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649415600
value1=4527.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649219400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649215800
value1=4514.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649158200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649154600
value1=4592.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648836000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648832400
value1=4522.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648749600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648746000
value1=4584.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648546200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648542600
value1=4591.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648186200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648182600
value1=4529.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648069200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648065600
value1=4462.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648056600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648053000
value1=4472.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647559800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647556200
value1=4417.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647552600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647549000
value1=4402.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647468000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1647464400
value1=4249.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647387000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647383400
value1=4268.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647342000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647338400
value1=4145.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646364600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646361000
value1=4285.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645675200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645671600
value1=4188.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645536600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645533000
value1=4349.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645495200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645491600
value1=4253.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645459200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645455600
value1=4304.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645212600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645209000
value1=4335.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645120800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645117200
value1=4405.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644512400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644508800
value1=4522.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644451200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644447600
value1=4594.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644408000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644404400
value1=4554.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643985000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643981400
value1=4462.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643805000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643801400
value1=4585.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643792400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643788800
value1=4579.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643657400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643653800
value1=4486.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643385600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643382000
value1=4288.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643304600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643301000
value1=4432.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643149800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1643144400
value1=4414.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642575600
value1=4545.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642527000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642523400
value1=4587.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642489200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642485600
value1=4631.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642174200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642170600
value1=4619.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642136400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642132800
value1=4650.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642005000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642001400
value1=4740.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641828600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641825000
value1=4640.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641231000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641227400
value1=4763.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640622600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640619000
value1=4746.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640259000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640255400
value1=4708.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640001600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639998000
value1=4538.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639994400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639990800
value1=4550.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639990800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639987200
value1=4554.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639693800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639690200
value1=4651.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639686600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639683000
value1=4678.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639501200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639497600
value1=4631.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639440000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639436400
value1=4668.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638865800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638862200
value1=4623.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638556200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638552600
value1=4514.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638385200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638381600
value1=4654.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637326800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637323200
value1=4696.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637258400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637254800
value1=4674.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637236800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637233200
value1=4710.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637170200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637166600
value1=4682.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636390800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636387200
value1=4717.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635879600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635876000
value1=4637.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635732000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635728400
value1=4623.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635534000
value1=4607.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635224400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635220800
value1=4583.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634752800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634749200
value1=4544.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634688000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634684400
value1=4529.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634639400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634635800
value1=4500.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634319000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634315400
value1=4473.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634014800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634011200
value1=4333.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633975200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633971600
value1=4418.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633519800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633516200
value1=4294.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633026600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633023000
value1=4347.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632758400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632754800
value1=4436.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632177000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632173400
value1=4303.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632103200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632099600
value1=4416.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631300400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631296800
value1=4476.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631210400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631206800
value1=4532.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630688400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630684800
value1=4519.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630425600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630422000
value1=4517.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630089000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630085400
value1=4508.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630036800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630033200
value1=4464.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630020600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630017000
value1=4468.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630002600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629999000
value1=4467.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629801000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629797400
value1=4498.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629352800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629349200
value1=4391.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629232200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629228600
value1=4415.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629221400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629217800
value1=4440.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629198000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629194400
value1=4453.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628857800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628854200
value1=4468.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628854200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628850600
value1=4466.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628618400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628614800
value1=4444.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628281800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628278200
value1=4442.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628272800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628269200
value1=4440.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628011800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628008200
value1=4371.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627383600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627380000
value1=4397.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627300800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627297200
value1=4383.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627066800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627063200
value1=4410.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626913800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626910200
value1=4366.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626805800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626802200
value1=4321.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626384600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626381000
value1=4338.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625178600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625175000
value1=4322.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625139000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625135400
value1=4317.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624557600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624554000
value1=4274.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624402800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624399200
value1=4258.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624350600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624347000
value1=4235.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624032000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624028400
value1=4184.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623729600
value1=4265.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623693600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623690000
value1=4233.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623346200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623342600
value1=4252.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623322800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623319200
value1=4214.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622660400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622656800
value1=4220.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621618200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621614600
value1=4191.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620734400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620730800
value1=4153.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620144000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620140400
value1=4164.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619793000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619789400
value1=4182.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619726400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619722800
value1=4179.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619713800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619710200
value1=4219.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619704800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619701200
value1=4218.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619127000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619123400
value1=4122.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619047800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619044200
value1=4176.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618864200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618860600
value1=4151.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618592400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618588800
value1=4188.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618354800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618351200
value1=4149.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618011000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618007400
value1=4131.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617874200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617870600
value1=4103.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617679800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617676200
value1=4084.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617280200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617276600
value1=3997.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616628600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616625000
value1=3886.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616175000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616171400
value1=3884.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616110200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616106600
value1=3915.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616005800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616002200
value1=3934.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615397400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615393800
value1=3915.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614963600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614960000
value1=3813.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614893400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614889800
value1=3721.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614893400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614889800
value1=3720.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614794400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614790800
value1=3836.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614101400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614097800
value1=3819.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613667600
value1=3882.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613581200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613577600
value1=3899.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613503800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613500200
value1=3922.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613496600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613493000
value1=3935.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613415600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613412000
value1=3959.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613394000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613390400
value1=3958.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613388600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613385000
value1=3956.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612980000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612976400
value1=3882.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612827000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612823400
value1=3918.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612501200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612497600
value1=3882.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611907200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611903600
value1=3730.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611788400
value1=3713.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611788400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611784800
value1=3730.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611775800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611772200
value1=3768.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611768600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611765000
value1=3781.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611601200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611597600
value1=3813.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611313200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611309600
value1=3826.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610733600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610730000
value1=3750.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610699400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610695800
value1=3770.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610551800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610548200
value1=3785.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609959600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609956000
value1=3777.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609180200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609176600
value1=3739.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608314400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608310800
value1=3697.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607695200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607691600
value1=3629.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607549400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607545800
value1=3660.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607540400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607536800
value1=3689.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607482800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607479200
value1=3716.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607437800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607434200
value1=3666.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607124600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607121000
value1=3703.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606820400
value1=3667.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606762800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606759200
value1=3596.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606728600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606725000
value1=3604.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606093200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605913200
value1=3545.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605634200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605630600
value1=3587.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605214800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605211200
value1=3523.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604601000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604597400
value1=3529.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604323800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604320200
value1=3328.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604008800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604005200
value1=3344.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603985400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603981800
value1=3263.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603882800
value1=3337.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603882800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603879200
value1=3351.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603850400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603846800
value1=3365.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603846800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603843200
value1=3370.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602871200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602867600
value1=3519.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602743400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602739800
value1=3470.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602626400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602622800
value1=3498.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602495000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602491400
value1=3497.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602271800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602268200
value1=3485.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602226800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602223200
value1=3470.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602203400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602199800
value1=3457.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601488800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601485200
value1=3380.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601368200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601364600
value1=3375.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601287200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601283600
value1=3328.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601044200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601040600
value1=3216.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600889400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600885800
value1=3281.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600691400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600687800
value1=3261.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600462800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600459200
value1=3289.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600176600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600173000
value1=3409.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600106400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600102800
value1=3403.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599775200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599771600
value1=3339.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599604200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599600600
value1=3327.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599246000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599242400
value1=3362.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598895000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598891400
value1=3498.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598355000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598351400
value1=3451.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597773600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597770000
value1=3368.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596627000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596623400
value1=3328.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596218400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596214800
value1=3229.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596155400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596151800
value1=3277.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596130200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596126600
value1=3201.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596112200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596108600
value1=3221.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595912400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595908800
value1=3255.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595500200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595496600
value1=3293.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595422800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595419200
value1=3237.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594666800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594663200
value1=3235.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594632600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594629000
value1=3214.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593711000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593707400
value1=3169.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593691200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593687600
value1=3143.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593543600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593540000
value1=3081.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593000000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592996400
value1=3100.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592791200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592787600
value1=3051.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592586000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592582400
value1=3157.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591893000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591889400
value1=3100.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591705800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591702200
value1=3193.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591659000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591655400
value1=3234.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591585200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591581600
value1=3215.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590604200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590600600
value1=2973.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589886000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589878800
value1=2979.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589479200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589472000
value1=2764.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588302000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588294800
value1=2871.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587488400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587481200
value1=2754.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586970000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586962800
value1=2760.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586271600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586264400
value1=2750.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585774800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585767600
value1=2466.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585350000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585339200
value1=2588.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585141200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585134000
value1=2511.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584932400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584925200
value1=2185.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581537600
value1=3384.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576814400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576785600
value1=3211.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574726400
value1=3142.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574049600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573848000
value1=3121.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571184000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571155200
value1=3006.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567684800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567656000
value1=2972.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564704000
value1=2938.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561060800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561032000
value1=2961.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559120400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559091600
value1=2790.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558659600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558630800
value1=2803.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555102800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1555074000
value1=2912.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554699600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554498000
value1=2898.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545955200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545609600
value1=2395.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535673600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535500800
value1=2917.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522108800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521763200
value1=2588.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522108800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1521763200
value1=2587.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517961600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517788800
value1=2529.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1513728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1513555200
value1=2697.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509408000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509062400
value1=2582.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1459814400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1459468800
value1=2081.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21447718400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1447286400
value1=2017.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418860800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418688000
value1=1971.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359590400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359417600
value1=1513.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1358985600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1358812800
value1=1498.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1339286400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1338076800
value1=1264.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1338076800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1336867200
value1=1294.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1320537600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1319328000
value1=1287.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1314489600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1313280000
value1=1112.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1298764800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1297555200
value1=1347.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1289692800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1288483200
value1=1230.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1272758400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1271548800
value1=1222.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1242493200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1241283600
value1=931.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1237050000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1235840400
value1=671.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1237050000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1235840400
value1=669.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21237050000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1235235600
value1=665.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1171126800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1169917200
value1=1455.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1166893200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1165683600
value1=1434.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1048957200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1047747600
value1=898.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1034442000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1033232400
value1=767.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1001782800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1000573200
value1=964.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1001782800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1000573200
value1=962.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV949338000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=943981200
value1=1480.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1659110400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659052800
value1=1767.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659110400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1659052800
value1=1767.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1658419200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1658361600
value1=1680.870000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658419200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1658361600
value1=1680.870000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21658419200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1658332800
value1=1689.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657756800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657699200
value1=1710.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1657756800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1657699200
value1=1710.580000
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
date1=1656662400
value1=1788.410000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21656892800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1656633600
value1=1784.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1654099200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1654041600
value1=1828.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21654099200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1654012800
value1=1831.810000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1653609600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1653552000
value1=1841.350000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21653609600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1653523200
value1=1841.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652659200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652428800
value1=1799.060000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651795200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1651737600
value1=1908.370000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651795200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1651708800
value1=1909.730000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651536000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651478400
value1=1854.460000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651449600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1651219200
value1=1914.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651449600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1651190400
value1=1919.880000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1650470400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1650412800
value1=1939.250000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650326400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650268800
value1=1996.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1650326400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1650268800
value1=1996.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21650326400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1650240000
value1=1998.320000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649088000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1649030400
value1=1917.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21649088000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1648828800
value1=1915.440000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648598400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1648540800
value1=1892.750000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646668800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646611200
value1=2002.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646668800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646611200
value1=2002.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646668800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646409600
value1=2001.090000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645747200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645689600
value1=1963.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645747200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645689600
value1=1963.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645747200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1645660800
value1=1974.380000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641283200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1641225600
value1=1800.720000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640822400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1640764800
value1=1789.610000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637654400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637596800
value1=1806.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636012800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1635955200
value1=1770.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635120000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634889600
value1=1813.820000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631865600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631808000
value1=1752.560000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631865600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1631808000
value1=1752.560000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629792000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1629734400
value1=1805.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625616000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1625558400
value1=1812.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625616000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1625529600
value1=1815.020000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625011200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624953600
value1=1751.290000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624003200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623945600
value1=1772.160000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623715200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623657600
value1=1847.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623715200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623657600
value1=1847.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621814400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621584000
value1=1889.360000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621267200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621209600
value1=1855.390000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618790400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618560000
value1=1782.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615478400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615420800
value1=1739.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615363200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615305600
value1=1719.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614585600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614355200
value1=1734.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614585600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614355200
value1=1734.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613347200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1613116800
value1=1812.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612512000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612454400
value1=1792.050000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608249600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608192000
value1=1896.270000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604995200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1604937600
value1=1860.250000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604649600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604592000
value1=1949.410000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604649600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604592000
value1=1949.410000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604476800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604419200
value1=1916.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604476800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1604390400
value1=1910.550000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601452800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601395200
value1=1899.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599782400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599724800
value1=1966.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597795200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597737600
value1=2015.690000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597248000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597190400
value1=1873.020000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597248000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597190400
value1=1873.020000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597248000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597161600
value1=1862.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593619200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593561600
value1=1789.050000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593446400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593388800
value1=1774.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593446400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593187200
value1=1775.390000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591257600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1591200000
value1=1696.680000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591027200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590969600
value1=1744.570000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590624000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1590566400
value1=1693.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590624000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590537600
value1=1697.370000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589760000
value1=1765.280000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589817600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589760000
value1=1765.280000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588089600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588032000
value1=1692.050000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585728000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585670400
value1=1567.810000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585123200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585065600
value1=1639.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584403200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584345600
value1=1451.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584403200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584345600
value1=1451.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584345600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584115200
value1=1523.740000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582588800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582531200
value1=1684.290000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580889600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580832000
value1=1552.130000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579017600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1578960000
value1=1536.350000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576195200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1576137600
value1=1486.760000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573804800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1573747200
value1=1471.380000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573804800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1573718400
value1=1474.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572595200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1572537600
value1=1513.660000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572220800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571990400
value1=1517.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572220800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1571990400
value1=1517.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566835200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566777600
value1=1544.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566835200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1566777600
value1=1544.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566835200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566576000
value1=1555.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565740800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565683200
value1=1521.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564560000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1564502400
value1=1431.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562860800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1562803200
value1=1425.010000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562860800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1562774400
value1=1427.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562169600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1562112000
value1=1428.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562169600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1562083200
value1=1437.780000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562054400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1561996800
value1=1382.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561478400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1561420800
value1=1436.320000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560729600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560499200
value1=1352.220000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559779200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1559721600
value1=1343.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557360000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1557302400
value1=1289.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557360000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1557273600
value1=1291.490000
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
date1=1556006400
value1=1266.330000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555488000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1555430400
value1=1274.870000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554768000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1554710400
value1=1303.330000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1552550400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1552492800
value1=1310.360000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552550400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1552464000
value1=1311.270000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549555200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1549497600
value1=1303.290000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549555200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1549468800
value1=1302.790000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548979200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1548921600
value1=1325.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548662400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1548432000
value1=1304.440000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547136000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1547078400
value1=1297.030000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547136000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1547049600
value1=1297.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546617600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546560000
value1=1295.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546617600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1546560000
value1=1295.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546617600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1546531200
value1=1298.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545004800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544774400
value1=1232.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543420800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1543363200
value1=1212.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542096000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542038400
value1=1200.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542096000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1542038400
value1=1200.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541721600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1541664000
value1=1220.940000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538582400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1538524800
value1=1206.360000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534867200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1534809600
value1=1196.380000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534233600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534176000
value1=1192.330000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532044800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531987200
value1=1213.940000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530633600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1530576000
value1=1237.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530633600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1530576000
value1=1237.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530633600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1530547200
value1=1237.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529020800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528963200
value1=1307.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526457600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526400000
value1=1289.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526457600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1526400000
value1=1289.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525248000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525190400
value1=1303.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525248000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1525190400
value1=1303.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525248000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1525161600
value1=1301.810000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520409600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1520352000
value1=1340.510000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21520409600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1520323200
value1=1338.480000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519228800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1519171200
value1=1325.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518624000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518566400
value1=1335.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517328000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1517270400
value1=1334.460000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517328000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1517241600
value1=1334.790000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516896000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1516838400
value1=1366.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514966400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1514908800
value1=1321.470000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1508803200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1508745600
value1=1272.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21508803200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1508716800
value1=1272.870000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1507507200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1507276800
value1=1260.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506441600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1506384000
value1=1312.910000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21506441600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1506355200
value1=1313.680000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504828800
value1=1357.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1504886400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1504828800
value1=1357.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504051200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1503993600
value1=1324.230000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1504051200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1503993600
value1=1324.230000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21504051200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1503964800
value1=1326.040000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1503273600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1503043200
value1=1300.870000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21503273600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1503014400
value1=1297.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1502985600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1502928000
value1=1290.160000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1499904000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1499846400
value1=1225.760000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1499155200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1499097600
value1=1220.290000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1496044800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1495814400
value1=1269.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494892800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1494835200
value1=1237.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494806400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1494576000
value1=1231.780000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493769600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1493712000
value1=1252.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1491350400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1491292800
value1=1258.040000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1490659200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1490601600
value1=1261.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490659200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1490601600
value1=1261.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1489708800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1489651200
value1=1231.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1488412800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1488355200
value1=1236.940000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21488412800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1488326400
value1=1237.350000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1488153600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1487923200
value1=1260.130000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1487721600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1487664000
value1=1226.110000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21487721600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1487635200
value1=1227.320000
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
date1=1486022400
value1=1223.730000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1484265600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1484208000
value1=1205.950000
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
date1=1484208000
value1=1205.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21484265600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1484179200
value1=1206.960000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483113600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1483056000
value1=1161.960000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21483113600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1483027200
value1=1163.220000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481875200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1481817600
value1=1126.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478188800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478131200
value1=1304.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478131200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478073600
value1=1308.010000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1477497600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1477440000
value1=1275.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21477497600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1477411200
value1=1276.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1467849600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467792000
value1=1373.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467849600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1467792000
value1=1373.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21467849600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1467763200
value1=1375.170000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466121600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466064000
value1=1315.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466121600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466064000
value1=1315.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21466121600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1466035200
value1=1313.510000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1463702400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1463644800
value1=1243.780000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1463443200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1463385600
value1=1288.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21463443200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1463356800
value1=1288.740000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1460448000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1460390400
value1=1259.980000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1458057600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1458000000
value1=1227.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457712000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1457654400
value1=1275.410000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21457712000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1457625600
value1=1282.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457625600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1457568000
value1=1237.110000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21457625600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1457539200
value1=1247.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1456358400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1456300800
value1=1253.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456358400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1456300800
value1=1253.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1454025600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1453852800
value1=1125.810000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21454025600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1453766400
value1=1128.070000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1449187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1449014400
value1=1046.370000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442880000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1442534400
value1=1139.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440460800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1440115200
value1=1169.960000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439510400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1439337600
value1=1126.680000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430352000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430179200
value1=1214.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430179200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1429833600
value1=1178.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427673600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1427328000
value1=1206.130000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1421712000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1421366400
value1=1279.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415145600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1414972800
value1=1163.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21415145600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1414713600
value1=1161.680000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1412640000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1412294400
value1=1182.860000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410825600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1410480000
value1=1225.560000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1402963200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1402617600
value1=1284.840000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1395100800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1394755200
value1=1391.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395100800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1394755200
value1=1391.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1393977600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1393804800
value1=1352.490000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392768000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1392595200
value1=1332.020000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1384387200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1384214400
value1=1265.820000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1376956800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1376611200
value1=1384.390000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1376438400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1376265600
value1=1341.320000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1374710400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1374537600
value1=1347.520000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21374710400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1374451200
value1=1346.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1372636800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1372291200
value1=1180.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1372636800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1372291200
value1=1180.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1369094400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368748800
value1=1337.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1369094400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1368748800
value1=1337.990000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1363824000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1363651200
value1=1614.710000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1359504000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1359331200
value1=1654.360000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21359504000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1359072000
value1=1651.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1356307200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1355961600
value1=1635.610000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1354838400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1354665600
value1=1685.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21354838400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1354579200
value1=1684.830000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1351209600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1351036800
value1=1701.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21351209600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1350950400
value1=1698.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1350432000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1350259200
value1=1734.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1349654400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1349308800
value1=1795.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1349049600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1348704000
value1=1783.220000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1336694400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336521600
value1=1585.560000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1327968000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1327622400
value1=1739.730000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1325548800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1325116800
value1=1544.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1325548800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1325116800
value1=1544.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21325548800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1325030400
value1=1522.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1314144000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1313971200
value1=1911.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1314144000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1313971200
value1=1911.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21314144000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1313712000
value1=1898.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1313107200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1312934400
value1=1814.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1304380800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1304035200
value1=1574.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1302566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1302220800
value1=1476.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1302566400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1302220800
value1=1476.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1293753600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1293580800
value1=1414.660000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1291766400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1291593600
value1=1430.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21291766400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1291334400
value1=1427.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1289347200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1289174400
value1=1424.430000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1289347200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1289174400
value1=1424.430000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1287360000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1287014400
value1=1385.430000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21287360000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1286928000
value1=1387.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1286496000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1286323200
value1=1364.780000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21286496000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1286236800
value1=1349.630000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1273795200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1273622400
value1=1242.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1267747200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1267574400
value1=1141.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21267747200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1267488000
value1=1144.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1256860800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1256688000
value1=1026.370000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1248998400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1248825600
value1=928.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1245196800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1245024000
value1=927.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1240876800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1240531200
value1=918.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1236297600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1236124800
value1=905.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21236297600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1236038400
value1=899.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1235088000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1234915200
value1=986.250000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1235088000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1234915200
value1=986.250000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1234742400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1234396800
value1=946.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1229644800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1229472000
value1=878.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21229644800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1229385600
value1=881.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1218672000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1218499200
value1=804.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1211500800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1211328000
value1=935.150000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1204848000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1204675200
value1=992.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1202342400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1202169600
value1=885.650000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201651200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201478400
value1=933.050000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1199664000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1199318400
value1=868.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1199664000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1199318400
value1=868.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1199232000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1198800000
value1=843.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1196726400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1196380800
value1=776.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1193788800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1193616000
value1=791.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1193788800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1193616000
value1=791.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21193788800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1193356800
value1=794.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1184198400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1184025600
value1=665.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1176854400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1176681600
value1=690.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1176854400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1176681600
value1=690.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1170460800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1170288000
value1=659.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21170460800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1170201600
value1=661.450000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

</window>
</chart>