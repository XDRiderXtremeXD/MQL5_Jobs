<chart>
id=132932213436502643
symbol=SPA35
description=Spain 35 Index
period_type=1
period_size=4
digits=1
tick_size=0.000000
position_time=1650340800
scale_fix=0
scale_fixed_min=7269.641058
scale_fixed_max=9023.417884
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
shift_size=24.718595
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
window_left=0
window_top=589
window_right=1278
window_bottom=1178
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

<window>
height=238.979769
objects=394

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
trendPeriod=20
TriggerUp=0.2
TriggerDown=-0.2
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
color=16776960
</graph>

<graph>
name=ENTRADA BUY
draw=3
style=0
width=2
arrow=234
color=16776960
</graph>
<inputs>
TransparienciaDePatronesSinRSIoEST=false
STO_Price=2
Velas_Confirmacion=6
Hora_Inicio=8
Hora_Final=22
Nivel=0.1
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion RSI ---------------------
Filter_MA=true
Tolerancia_Puntos=0
Period_MA=50
Shift_MA=1
APP_MA=1
MODE_MA=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=7
Momentun_Applied_Price=1
S1_=-----------------------   Configuracion RSI---------------------
Condicion_Signal_Contrarias=true
RSI_Period=14
APP_RSI=1
S12_============================================= CONFIGURACION TREND ============================================
FiltroTrend=true
inpFastLength=3
inpSlowLength=7
EsperaMaxima=5
Settings_Alerts=***Settings_Alerts***
AlertPC=false
AlertMovil=false
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
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=129
style=0
width=1
arrow=251
color=16777215
</graph>
period=50
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PATRONES FINAL ANTIGUO.ex5
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
name=SELL CONFIRMACION
draw=3
style=0
width=2
arrow=234
color=65535
</graph>

<graph>
name=BUY CONFIRMACION
draw=3
style=0
width=2
arrow=233
color=65535
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
Espera=15
VelasEvaluadas=1000
Testeado=0
Repintado=false
Ver_Sop_Res_Historial=false
Hora_Inicio=8
Hora_Final=8
Tolerancia_Puntos_Flecha=30
S00=-----------------------   Configuracion Confirmaciones para Patrones ---------------------
Filter_Estocastico=true
Filter_MA=true
Filter_RSI=true
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Tolerancia_Puntos=0
Period_MA_SLOW=150
Period_MA=50
Shift_MA=0
APP_MA=1
MODE_MA=0
S1_=-----------------------   Configuracion RSI---------------------
RSI_Period=14
APP_RSI=1
Settings_Alerts=-----------------------Settings_Alerts-----------------------
Activar_Alerta_Confirmacion=false
Activar_Alerta=false
Audio_Alerta_Confirmacion=alert2
AlertPC=false
AlertMovil=false
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=true
BackLimit=1000
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=3
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=false
zone_show_untested=false
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\ENCUADRADO.ex5
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
draw=0
style=0
width=1
arrow=251
color=
</graph>
<inputs>
EvaluaBarras=200
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=7
TriggerUp=0.2
TriggerDown=-0.2
</inputs>
</indicator>
<object>
type=109
name=2021.11.01 00:30 Índice Manufacturero del AIG
hidden=1
descr=Índice Manufacturero del AIG
color=16119285
selectable=0
date1=1635726600
</object>

<object>
type=109
name=2021.11.01 01:00 PMI de la Manufactura del Commonwealth Bank
hidden=1
descr=PMI de la Manufactura del Commonwealth Bank 58.2 / 57.3
color=15658671
selectable=0
date1=1635728400
</object>

<object>
type=109
name=2021.11.01 03:30 Préstamos Hipotecarios m/m
hidden=1
descr=Préstamos Hipotecarios m/m -4.0% / -0.9%
color=13353215
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 03:30 Préstamos de Inversión Inmobiliaria m/m
hidden=1
descr=Préstamos de Inversión Inmobiliaria m/m
color=16119285
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 03:30 Anuncios de Empleo del ANZ m/m
hidden=1
descr=Anuncios de Empleo del ANZ m/m 6.2% / -0.2%
color=15658671
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 08:30 Índice de Precios de Materias primas del RBA a
hidden=1
descr=Índice de Precios de Materias primas del RBA a/a
color=16119285
selectable=0
date1=1635755400
</object>

<object>
type=109
name=2021.11.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1635785100
</object>

<object>
type=109
name=2021.11.01 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1635791400
</object>

<object>
type=109
name=2021.11.01 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1635791400
</object>

<object>
type=109
name=2021.11.02 06:30 Decisión del Banco de la Reserva de Australia 
hidden=1
descr=Decisión del Banco de la Reserva de Australia sobre la Tasa de 
color=16119285
selectable=0
date1=1635834600
</object>

<object>
type=109
name=2021.11.02 08:50 Discurso de Guy Debelle, Vicegobernador del RB
hidden=1
descr=Discurso de Guy Debelle, Vicegobernador del RBA
color=16119285
selectable=0
date1=1635843000
</object>

<object>
type=109
name=2021.11.02 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1635877800
</object>

<object>
type=109
name=2021.11.03 00:30 Índice de Construcción del AIG
hidden=1
descr=Índice de Construcción del AIG
color=16119285
selectable=0
date1=1635899400
</object>

<object>
type=109
name=2021.11.03 01:00 PMI del Sector Servicios del Commonwealth Bank
hidden=1
descr=PMI del Sector Servicios del Commonwealth Bank
color=16119285
selectable=0
date1=1635901200
</object>

<object>
type=109
name=2021.11.03 01:00 PMI Compuesto del Commonwealth Bank
hidden=1
descr=PMI Compuesto del Commonwealth Bank
color=16119285
selectable=0
date1=1635901200
</object>

<object>
type=109
name=2021.11.03 03:30 Permisos de Construcción m/m
hidden=1
descr=Permisos de Construcción m/m
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 03:30 Aprobaciones de Construcción de Viviendas Part
hidden=1
descr=Aprobaciones de Construcción de Viviendas Particulares m/m
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 03:30 Pack de Gráficos del RBA
hidden=1
descr=Pack de Gráficos del RBA
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP
color=16119285
selectable=0
date1=1635952500
</object>

<object>
type=109
name=2021.11.03 16:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1635957900
</object>

<object>
type=109
name=2021.11.03 16:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1635957900
</object>

<object>
type=109
name=2021.11.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1635973200
</object>

<object>
type=109
name=2021.11.03 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1635973200
</object>

<object>
type=109
name=2021.11.03 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1635975000
</object>

<object>
type=109
name=2021.11.04 03:30 Exportaciones m/m
hidden=1
descr=Exportaciones m/m
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Importaciones m/m
hidden=1
descr=Importaciones m/m
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Balance Comercial
hidden=1
descr=Balance Comercial
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Ventas minoristas t/t
hidden=1
descr=Ventas minoristas t/t
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1636036200
</object>

<object>
type=109
name=2021.11.04 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a
color=16119285
selectable=0
date1=1636036200
</object>

<object>
type=109
name=2021.11.04 15:30 Balance Comercial
hidden=1
descr=Balance Comercial
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Exportaciones
hidden=1
descr=Exportaciones
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Importaciones
hidden=1
descr=Importaciones
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Productivdad no agraria t/t
hidden=1
descr=Productivdad no agraria t/t
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Costes Laborales Unitarios t/t
hidden=1
descr=Costes Laborales Unitarios t/t
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural
color=16119285
selectable=0
date1=1636047000
</object>

<object>
type=109
name=2021.11.04 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1636050600
</object>

<object>
type=109
name=2021.11.04 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1636050600
</object>

<object>
type=109
name=2021.11.05 00:30 Índice de Servicios del AIG
hidden=1
descr=Índice de Servicios del AIG
color=16119285
selectable=0
date1=1636072200
</object>

<object>
type=109
name=2021.11.05 03:30 Declaración del Banco de la Reserva de Austral
hidden=1
descr=Declaración del Banco de la Reserva de Australia sobre Política
color=16119285
selectable=0
date1=1636083000
</object>

<object>
type=109
name=2021.11.05 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1636142400
</object>

<object>
type=109
name=2021.11.05 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1636142400
</object>

<object>
type=109
name=2021.11.05 22:00 Crédito al Consumo de la FRS m/m
hidden=1
descr=Crédito al Consumo de la FRS m/m
color=16119285
selectable=0
date1=1636149600
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de AUD de la CF
hidden=1
descr=Posiciones Netas Especulativas de AUD de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
name=H4 Vertical Line 1828
color=16776960
ray=1
date1=1635724800
</object>

<object>
type=109
name=2022.05.02 Todo el día Día del Trabajo
hidden=1
descr=Día del Trabajo
color=16119285
selectable=0
date1=1651460400
</object>

<object>
type=109
name=2022.05.02 09:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m -2.7% / 0.2%
color=13353215
selectable=0
date1=1651482000
</object>

<object>
type=109
name=2022.05.02 09:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a -0.1% / 0.8%
color=13353215
selectable=0
date1=1651482000
</object>

<object>
type=109
name=2022.05.02 10:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1651485600
</object>

<object>
type=109
name=2022.05.02 10:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1651485600
</object>

<object>
type=109
name=2022.05.02 10:15 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 53.3 / 55.6
color=13353215
selectable=0
date1=1651486500
</object>

<object>
type=109
name=2022.05.02 10:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 54.5 / 57.1
color=13353215
selectable=0
date1=1651488300
</object>

<object>
type=109
name=2022.05.02 10:50 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 55.7 / 55.4
color=15658671
selectable=0
date1=1651488600
</object>

<object>
type=109
name=2022.05.02 10:55 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 54.6 / 54.1
color=15658671
selectable=0
date1=1651488900
</object>

<object>
type=109
name=2022.05.02 11:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 8.3% / 8.7%
color=15658671
selectable=0
date1=1651489200
</object>

<object>
type=109
name=2022.05.02 11:00 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 55.5 / 55.3
color=15658671
selectable=0
date1=1651489200
</object>

<object>
type=109
name=2022.05.02 12:00 Indicador de Confianza Industrial
hidden=1
descr=Indicador de Confianza Industrial 7.9 / 12.2
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 12:00 Indicador del Sentimiento servicios
hidden=1
descr=Indicador del Sentimiento servicios 13.5 / 13.8
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 12:00 Indicador del Sentimiento Económico
hidden=1
descr=Indicador del Sentimiento Económico 105.0 / 111.2
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 12:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor -22.0 / -16.9
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 12:00 Expectativas de Precios al Consumidor
hidden=1
descr=Expectativas de Precios al Consumidor 50.0 / 66.7
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 12:00 Expectativas de Precios de Venta de la Industr
hidden=1
descr=Expectativas de Precios de Venta de la Industria 60.8 / 65.8
color=13353215
selectable=0
date1=1651492800
</object>

<object>
type=109
name=2022.05.02 15:57 Subasta de Deuda Pública (BTF) a 3 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 3 meses
color=16119285
selectable=0
date1=1651507020
</object>

<object>
type=109
name=2022.05.02 15:57 Subasta de Deuda Pública (BTF) a 6 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 6 meses
color=16119285
selectable=0
date1=1651507020
</object>

<object>
type=109
name=2022.05.02 15:57 Subasta de Deuda Pública (BTF) a 12 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 12 meses
color=16119285
selectable=0
date1=1651507020
</object>

<object>
type=109
name=2022.05.02 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit 59.2 / 59.7
color=13353215
selectable=0
date1=1651509900
</object>

<object>
type=109
name=2022.05.02 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m 0.1% / 0.1%
color=16119285
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM 55.4 / 57.9
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM 84.6 / 81.7
color=15658671
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero 50.9 / 54.7
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera 53.5 / 57.7
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1651516200
</object>

<object>
type=109
name=2022.05.02 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1651516200
</object>

<object>
type=109
name=2022.05.02 19:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1651518000
</object>

<object>
type=109
name=2022.05.02 19:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1651518000
</object>

<object>
type=109
name=2022.05.03 Todo el día Reunión del Eurogrupo
hidden=1
descr=Reunión del Eurogrupo
color=16119285
selectable=0
date1=1651546800
</object>

<object>
type=109
name=2022.05.03 09:45 Balace Presupuestario del Gobierno
hidden=1
descr=Balace Presupuestario del Gobierno
color=16119285
selectable=0
date1=1651571100
</object>

<object>
type=109
name=2022.05.03 10:55 Cambio del Desempleo
hidden=1
descr=Cambio del Desempleo -13 K / -18 K
color=13353215
selectable=0
date1=1651575300
</object>

<object>
type=109
name=2022.05.03 10:55 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.287 M / 2.296 M
color=15658671
selectable=0
date1=1651575300
</object>

<object>
type=109
name=2022.05.03 10:55 Desempleo no ajustado a variaciones estacional
hidden=1
descr=Desempleo no ajustado a variaciones estacionales 2.309 M / 2.40
color=15658671
selectable=0
date1=1651575300
</object>

<object>
type=109
name=2022.05.03 11:54 Subasta de Letras del Tesoro a 6 meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 meses
color=16119285
selectable=0
date1=1651578840
</object>

<object>
type=109
name=2022.05.03 11:54 Subasta de Letras del Tesoro a 12 meses
hidden=1
descr=Subasta de Letras del Tesoro a 12 meses
color=16119285
selectable=0
date1=1651578840
</object>

<object>
type=109
name=2022.05.03 12:00 PPI m/m
hidden=1
descr=PPI m/m 5.3% / 2.7%
color=15658671
selectable=0
date1=1651579200
</object>

<object>
type=109
name=2022.05.03 12:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 36.8% / 33.2%
color=15658671
selectable=0
date1=1651579200
</object>

<object>
type=109
name=2022.05.03 12:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 6.8% / 6.6%
color=13353215
selectable=0
date1=1651579200
</object>

<object>
type=109
name=2022.05.03 16:00 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1651593600
</object>

<object>
type=109
name=2022.05.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m 2.2% / -0.1%
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m 2.5% / -0.2%
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Índice JOLTS de puestos de trabajo vacantes
hidden=1
descr=Índice JOLTS de puestos de trabajo vacantes 11.549 M / 11.587 M
color=13353215
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 19:30 Discurso de Edouard Fernandez-Bollo, Miembro d
hidden=1
descr=Discurso de Edouard Fernandez-Bollo, Miembro del Consejo de Sup
color=16119285
selectable=0
date1=1651606200
</object>

<object>
type=109
name=2022.05.04 09:00 Exportaciones m/m
hidden=1
descr=Exportaciones m/m -3.3% / 1.4%
color=13353215
selectable=0
date1=1651654800
</object>

<object>
type=109
name=2022.05.04 09:00 Importaciones m/m
hidden=1
descr=Importaciones m/m 3.4% / -1.2%
color=13353215
selectable=0
date1=1651654800
</object>

<object>
type=109
name=2022.05.04 09:00 Balance Comercial
hidden=1
descr=Balance Comercial €3.2 B / €10.5 B
color=13353215
selectable=0
date1=1651654800
</object>

<object>
type=109
name=2022.05.04 09:00 Balanza Comercial sin Ajustar Variaciones Esta
hidden=1
descr=Balanza Comercial sin Ajustar Variaciones Estacionales €9.7 B /
color=13353215
selectable=0
date1=1651654800
</object>

<object>
type=109
name=2022.05.04 10:00 Variación del Desempleo
hidden=1
descr=Variación del Desempleo -86.260 K / 18.185 K
color=15658671
selectable=0
date1=1651658400
</object>

<object>
type=109
name=2022.05.04 10:00 Reunión de Política no Monetaria del BCE
hidden=1
descr=Reunión de Política no Monetaria del BCE
color=16119285
selectable=0
date1=1651658400
</object>

<object>
type=109
name=2022.05.04 10:15 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 57.1 / 55.0
color=15658671
selectable=0
date1=1651659300
</object>

<object>
type=109
name=2022.05.04 10:15 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1651659300
</object>

<object>
type=109
name=2022.05.04 10:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 55.7 / 52.5
color=15658671
selectable=0
date1=1651661100
</object>

<object>
type=109
name=2022.05.04 10:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1651661100
</object>

<object>
type=109
name=2022.05.04 10:50 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 58.9 / 58.8
color=15658671
selectable=0
date1=1651661400
</object>

<object>
type=109
name=2022.05.04 10:50 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit 57.6 / 57.5
color=15658671
selectable=0
date1=1651661400
</object>

<object>
type=109
name=2022.05.04 10:55 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 57.6 / 57.9
color=13353215
selectable=0
date1=1651661700
</object>

<object>
type=109
name=2022.05.04 10:55 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit 54.3 / 54.5
color=13353215
selectable=0
date1=1651661700
</object>

<object>
type=109
name=2022.05.04 11:00 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 57.7 / 57.7
color=16119285
selectable=0
date1=1651662000
</object>

<object>
type=109
name=2022.05.04 11:00 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit 55.8 / 55.8
color=16119285
selectable=0
date1=1651662000
</object>

<object>
type=109
name=2022.05.04 12:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m -0.4% / 0.4%
color=13353215
selectable=0
date1=1651665600
</object>

<object>
type=109
name=2022.05.04 12:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a 0.8% / 4.7%
color=13353215
selectable=0
date1=1651665600
</object>

<object>
type=109
name=2022.05.04 12:38 Subasta de Bonos del Estado a 10 Años
hidden=1
descr=Subasta de Bonos del Estado a 10 Años
color=16119285
selectable=0
date1=1651667880
</object>

<object>
type=109
name=2022.05.04 13:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1651669200
</object>

<object>
type=109
name=2022.05.04 13:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1651669200
</object>

<object>
type=109
name=2022.05.04 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP 247 K / -31 K
color=15658671
selectable=0
date1=1651677300
</object>

<object>
type=109
name=2022.05.04 15:30 Balance Comercial
hidden=1
descr=Balance Comercial $-109.802 B / $-90.055 B
color=13353215
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 15:30 Exportaciones
hidden=1
descr=Exportaciones
color=16119285
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 15:30 Importaciones
hidden=1
descr=Importaciones
color=16119285
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 16:00 Discurso de Burkhard Balz, miembro de la Junta
hidden=1
descr=Discurso de Burkhard Balz, miembro de la Junta Ejecutiva del Bb
color=16119285
selectable=0
date1=1651680000
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit 55.6 / 54.7
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit 56.0 / 55.1
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.04 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI 57.1 / 62.7
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera 49.5 / 51.2
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera 54.6 / 64.3
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM 84.6 
color=15658671
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera 59.1 /
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:15 Discurso de Joachim Wuermeling, miembro de la 
hidden=1
descr=Discurso de Joachim Wuermeling, miembro de la Junta Ejecutiva d
color=16119285
selectable=0
date1=1651684500
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo 1.303 M / -0.101 M
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing 1.379 M / -0.628
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo 0.545 M / 0.173 M
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado -0.063 M /
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado -2.344 M / 
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina 0.175 M / 0.251 M
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción 0.19
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina -2.230 M / -0.005 M
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 19:00 Discurso de Joachim Wuermeling, miembro de la 
hidden=1
descr=Discurso de Joachim Wuermeling, miembro de la Junta Ejecutiva d
color=16119285
selectable=0
date1=1651690800
</object>

<object>
type=109
name=2022.05.04 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1651698000
</object>

<object>
type=109
name=2022.05.04 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1651698000
</object>

<object>
type=109
name=2022.05.04 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1651699800
</object>

<object>
type=109
name=2022.05.05 09:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m -4.7% / 0.3%
color=13353215
selectable=0
date1=1651741200
</object>

<object>
type=109
name=2022.05.05 09:00 Pedidos Industriales a/a
hidden=1
descr=Pedidos Industriales a/a -3.1% / -22.9%
color=15658671
selectable=0
date1=1651741200
</object>

<object>
type=109
name=2022.05.05 09:45 Producción Industrial m/m
hidden=1
descr=Producción Industrial m/m -0.5% / -0.3%
color=13353215
selectable=0
date1=1651743900
</object>

<object>
type=109
name=2022.05.05 10:30 PMI de la Construcción de Markit
hidden=1
descr=PMI de la Construcción de Markit
color=16119285
selectable=0
date1=1651746600
</object>

<object>
type=109
name=2022.05.05 11:00 Discurso de Johannes Beermann, miembro de la J
hidden=1
descr=Discurso de Johannes Beermann, miembro de la Junta Ejecutiva de
color=16119285
selectable=0
date1=1651748400
</object>

<object>
type=109
name=2022.05.05 12:01 Subasta de Deuda Pública (OAT) a 10 años
hidden=1
descr=Subasta de Deuda Pública (OAT) a 10 años
color=16119285
selectable=0
date1=1651752060
</object>

<object>
type=109
name=2022.05.05 12:20 Subasta de Bonos del Estado a 5 años
hidden=1
descr=Subasta de Bonos del Estado a 5 años
color=16119285
selectable=0
date1=1651753200
</object>

<object>
type=109
name=2022.05.05 12:20 Subasta de Obligaciones del Estado a 50 años
hidden=1
descr=Subasta de Obligaciones del Estado a 50 años
color=16119285
selectable=0
date1=1651753200
</object>

<object>
type=109
name=2022.05.05 13:30 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor 74.6 / 65.0
color=15658671
selectable=0
date1=1651757400
</object>

<object>
type=109
name=2022.05.05 13:30 Discurso del miembro del Comité Ejecutivo del 
hidden=1
descr=Discurso del miembro del Comité Ejecutivo del BCE, Philip Lane
color=16119285
selectable=0
date1=1651757400
</object>

<object>
type=109
name=2022.05.05 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1651761000
</object>

<object>
type=109
name=2022.05.05 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a 6.0% / -53.0%
color=13353215
selectable=0
date1=1651761000
</object>

<object>
type=109
name=2022.05.05 15:30 Productivdad no agraria t/t
hidden=1
descr=Productivdad no agraria t/t -7.5% / 3.3%
color=13353215
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Costes Laborales Unitarios t/t
hidden=1
descr=Costes Laborales Unitarios t/t 11.6% / 3.2%
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo 200 K / 176 K
color=13353215
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo 1.384 M / 1.465 
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural 77 B / 46 B
color=13353215
selectable=0
date1=1651771800
</object>

<object>
type=109
name=2022.05.05 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1651775400
</object>

<object>
type=109
name=2022.05.05 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1651775400
</object>

<object>
type=109
name=2022.05.06 09:00 Producción Industrial m/m
hidden=1
descr=Producción Industrial m/m
color=16119285
selectable=0
date1=1651827600
</object>

<object>
type=109
name=2022.05.06 09:00 Producción industrial a/a
hidden=1
descr=Producción industrial a/a
color=16119285
selectable=0
date1=1651827600
</object>

<object>
type=109
name=2022.05.06 09:45 Cambio en el Empleo no Agrícola t/t
hidden=1
descr=Cambio en el Empleo no Agrícola t/t
color=16119285
selectable=0
date1=1651830300
</object>

<object>
type=109
name=2022.05.06 10:00 Producción industrial a/a
hidden=1
descr=Producción industrial a/a
color=16119285
selectable=0
date1=1651831200
</object>

<object>
type=109
name=2022.05.06 11:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m
color=16119285
selectable=0
date1=1651834800
</object>

<object>
type=109
name=2022.05.06 11:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1651834800
</object>

<object>
type=109
name=2022.05.06 12:30 Discurso de Joachim Nagel, Presidente del Bbk
hidden=1
descr=Discurso de Joachim Nagel, Presidente del Bbk
color=16119285
selectable=0
date1=1651840200
</object>

<object>
type=109
name=2022.05.06 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 3.6% / 3.7%
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola 428 K / 317 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación 62.2% / 62.3%
color=13353215
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m 0.3% / 0.4%
color=13353215
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a 5.5% / 5.4%
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales 34.6 / 34.6
color=16119285
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales 22 K / -45 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas 406 K / -89 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo 7.0% / 7.0%
color=16119285
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero 55 K / 11 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 16:15 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1651853700
</object>

<object>
type=109
name=2022.05.06 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1651867200
</object>

<object>
type=109
name=2022.05.06 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1651867200
</object>

<object>
type=109
name=2022.05.06 22:00 Crédito al Consumo de la FRS m/m
hidden=1
descr=Crédito al Consumo de la FRS m/m $52.43 B / $24.38 B
color=15658671
selectable=0
date1=1651874400
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.07 02:15 Fed Governor Waller Speech
hidden=1
descr=Fed Governor Waller Speech
color=16119285
selectable=0
date1=1651889700
</object>

<object>
type=109
name=2022.05.08 Todo el día Día de la Victoria
hidden=1
descr=Día de la Victoria
color=16119285
selectable=0
date1=1651978800
</object>

<object>
type=109
name=2022.05.02 16:45 PMI de Manufacturación de S&P Global
hidden=1
descr=PMI de Manufacturación de S&P Global 59.2 / 59.7
color=13353215
selectable=0
date1=1651509900
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de servicios de S&P Global
hidden=1
descr=PMI de servicios de S&P Global 55.6 / 54.7
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de Compuesto de S&P Global
hidden=1
descr=PMI de Compuesto de S&P Global 56.0 / 55.1
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.02 10:00 Clima del Consumo
hidden=1
descr=Clima del Consumo -27 / 0
color=13353215
selectable=0
date1=1651485600
</object>

<object>
type=109
name=2022.05.02 10:30 PMI de la Manufactura de procure.ch
hidden=1
descr=PMI de la Manufactura de procure.ch 62.5 / 63.9
color=13353215
selectable=0
date1=1651487400
</object>

<object>
type=109
name=2022.05.05 09:30 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 0.2%
color=15658671
selectable=0
date1=1651743000
</object>

<object>
type=109
name=2022.05.05 09:30 IPC a/a
hidden=1
descr=IPC a/a 2.5% / 2.5%
color=16119285
selectable=0
date1=1651743000
</object>

<object>
type=109
name=2022.05.06 08:45 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.2% / 2.1%
color=13353215
selectable=0
date1=1651826700
</object>

<object>
type=109
name=2022.05.06 08:45 Tasa de Desempleo no ajustado a variaciones es
hidden=1
descr=Tasa de Desempleo no ajustado a variaciones estacionales 2.3% /
color=16119285
selectable=0
date1=1651826700
</object>

<object>
type=109
name=2022.05.06 10:00 Reservas de Moneda Extranjera
hidden=1
descr=Reservas de Moneda Extranjera
color=16119285
selectable=0
date1=1651831200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=101
name=VelasRSI1653912000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653883200
value1=9023.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653609600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653580800
value1=8921.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653552000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653523200
value1=8836.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652169600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652140800
value1=8046.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652097600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652068800
value1=8201.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651046400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1651003200
value1=8336.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650571200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650542400
value1=8878.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650484800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650456000
value1=8835.000000
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
date1=1646640000
value1=7436.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645704000
value1=8070.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645531200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645502400
value1=8260.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643040000
value1=8339.300000
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
date1=1643040000
value1=8327.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643068800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643025600
value1=8315.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640750400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640721600
value1=8722.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640664000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640635200
value1=8656.600000
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
date1=1639972800
value1=8046.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638158400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637956800
value1=8401.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638158400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1637942400
value1=8281.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637308800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637280000
value1=8907.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635840000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635811200
value1=9224.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635753600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635724800
value1=9146.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632830400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632801600
value1=9072.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628827200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628798400
value1=9015.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628740800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628712000
value1=9012.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626782400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626753600
value1=8279.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626753600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626724800
value1=8293.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626436800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626408000
value1=8496.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625832000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625803200
value1=8639.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624276800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624248000
value1=8888.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624276800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1624233600
value1=8883.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623758400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623729600
value1=9342.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620691200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620662400
value1=9156.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620633600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620604800
value1=9145.600000
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
date1=1619697600
value1=8891.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619582400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619553600
value1=8798.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616515200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616486400
value1=8291.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615795200
value1=8751.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615579200
value1=8714.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612785600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612756800
value1=8302.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611662400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611633600
value1=7813.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611345600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611316800
value1=7990.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1611345600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1611302400
value1=7954.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608580800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608552000
value1=7717.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608580800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1608537600
value1=7651.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607904000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607702400
value1=8046.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600948800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600920000
value1=6525.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600819200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600790400
value1=6626.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600704000
value1=6691.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596470400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596441600
value1=6813.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596412800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596211200
value1=6803.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595894400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595865600
value1=7162.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594051200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594022400
value1=7640.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591646400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1591603200
value1=8018.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590667200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590638400
value1=7297.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588248000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588219200
value1=7187.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588219200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588190400
value1=7139.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584388800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584360000
value1=5795.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584388800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584360000
value1=5783.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584100800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584072000
value1=6349.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584086400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584043200
value1=6165.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583812800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583784000
value1=7374.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583755200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583726400
value1=7501.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582920000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582891200
value1=8578.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582704000
value1=9111.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582603200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582560000
value1=9403.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1582603200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1582560000
value1=9391.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580184000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580155200
value1=9334.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579521600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579492800
value1=9723.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573675200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573646400
value1=9137.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1573675200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1573632000
value1=9119.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571025600
value1=9270.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570132800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570104000
value1=8835.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570104000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570075200
value1=8886.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568203200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568174400
value1=9148.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568059200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568030400
value1=9049.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567756800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567728000
value1=9014.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567699200
value1=8997.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565078400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565049600
value1=8592.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565078400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565035200
value1=8468.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564646400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564617600
value1=8932.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564603200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564574400
value1=8930.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564084800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564056000
value1=9425.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563768000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563566400
value1=9117.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562184000
value1=9414.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557763200
value1=8999.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557432000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557403200
value1=9065.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557316800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557259200
value1=9193.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553097600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553068800
value1=9516.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553011200
value1=9509.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551470400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551441600
value1=9356.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1550750400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1550692800
value1=9249.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548345600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1548316800
value1=9228.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545998400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545940800
value1=8363.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544544000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544515200
value1=8704.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544515200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544457600
value1=8699.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542801600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542744000
value1=8876.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539633600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539604800
value1=8865.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537545600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537516800
value1=9672.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536580800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536350400
value1=9172.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534420800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534363200
value1=9371.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530115200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1530086400
value1=9497.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527681600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527624000
value1=9503.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525968000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525939200
value1=10262.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525363200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525334400
value1=10121.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522051200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521820800
value1=9347.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1518436800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1518206400
value1=9480.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515528000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515499200
value1=10479.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512763200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512734400
value1=10400.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510776000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510747200
value1=9906.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1510776000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1510732800
value1=9892.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509537600
value1=10587.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507204800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507147200
value1=9904.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1507204800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1507132800
value1=9930.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=20
name=SSSR#R1 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1635955200
date2=1655136000
value1=9018.903571
value2=8960.900000
</object>

<object>
type=20
name=SSSR#R2 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1636128000
date2=1655136000
value1=9181.000000
value2=9084.200000
</object>

<object>
type=20
name=SSSR#S4 Strength=Verified, Test Count=3
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1646971200
date2=1655136000
value1=8149.121429
value2=7916.583929
</object>

<object>
type=20
name=SSSR#R5 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1647000000
date2=1655136000
value1=8426.564286
value2=8267.400000
</object>

<object>
type=20
name=SSSR#R6 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1654185600
date2=1655136000
value1=8745.025000
value2=8684.387500
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1655352840
value1=8989.901786
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1655352840
value1=9132.600000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Verificado Soporte, Retesteado=3    
color=16777215
selectable=0
angle=0
date1=1655352780
value1=8032.852679
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1655352480
value1=8346.982143
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655352540
value1=8714.706250
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H21
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652126400
date2=1652457600
value1=8345.700000
value2=8345.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L21
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652126400
date2=1652457600
value1=8057.300000
value2=8057.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H3
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651507200
date2=1651550400
value1=8526.900000
value2=8526.900000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L3
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651507200
date2=1651550400
value1=8378.100000
value2=8378.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H4
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653566400
date2=1653652800
value1=8924.300000
value2=8924.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L4
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653566400
date2=1653652800
value1=8842.700000
value2=8842.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H2
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653436800
date2=1653494400
value1=8732.700000
value2=8732.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L2
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653436800
date2=1653494400
value1=8650.100000
value2=8650.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H1
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653638400
date2=1653681600
value1=8935.100000
value2=8935.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L1
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653638400
date2=1653681600
value1=8902.000000
value2=8902.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H5
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653321600
date2=1653422400
value1=8657.200000
value2=8657.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L5
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653321600
date2=1653422400
value1=8533.300000
value2=8533.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H15
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652860800
date2=1653076800
value1=8546.200000
value2=8546.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L15
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652860800
date2=1653076800
value1=8338.500000
value2=8338.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H16
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653681600
date2=1654084800
value1=8997.500000
value2=8997.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L16
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653681600
date2=1654084800
value1=8800.500000
value2=8800.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H20
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654142400
date2=1654603200
value1=8850.400000
value2=8850.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L20
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654142400
date2=1654603200
value1=8704.600000
value2=8704.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H8
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654646400
date2=1654761600
value1=8909.800000
value2=8909.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L8
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654646400
date2=1654761600
value1=8768.600000
value2=8768.600000
</object>

</window>

<window>
height=13.267755
objects=0

<indicator>
name=Custom Indicator
path=Indicators\EST_Histogram_v1.ex5
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
name=Color_Histogram
draw=11
style=0
width=2
arrow=251
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodK=5
PeriodD=3
PeriodSlowing=3
Mode_MA=0
Mode_STO=0
LevelIndicatorDown=20
LevelIndicatorUp=80
</inputs>
</indicator>
</window>

<window>
height=14.483839
objects=0

<indicator>
name=Custom Indicator
path=Indicators\RSI_Histogram_v1.ex5
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
name=Color_Histogram
draw=11
style=0
width=2
arrow=251
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodIndicator=14
ApliedPrice=1
LevelIndicatorDown=30
LevelIndicatorUp=70
</inputs>
</indicator>
</window>
</chart>