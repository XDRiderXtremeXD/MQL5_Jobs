<chart>
id=132714416342164508
symbol=SPA35
description=Spain 35 Index
period_type=1
period_size=1
digits=1
tick_size=0.000000
position_time=1654225200
scale_fix=0
scale_fixed_min=8156.729522
scale_fixed_max=8933.140955
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=8
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=19.315624
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
window_top=0
window_right=1278
window_bottom=589
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
windows_total=4

<window>
height=248.460134
objects=1635

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
scale_fix_max_val=100.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=129
style=0
width=2
arrow=251
color=16776960
</graph>
period=50
method=0
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
color=16777215
</graph>

<graph>
name=BUY
draw=3
style=0
width=2
arrow=233
color=16777215
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
TransparienciaDePatronesSinRSIoEST=false
STO_Price=2
Velas_Confirmacion=6
Hora_Inicio=0
Hora_Final=0
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
period=150
method=0
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
EvaluaBarras=5000
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=7
TriggerUp=0.2
TriggerDown=-0.2
</inputs>
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
FiltroTrend=false
MayorFilter=0.7
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
BackLimit=500
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=3
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
</inputs>
</indicator>
<object>
type=1
name=H1 Horizontal Line 25376
color=13850042
width=2
value1=1.209894
</object>

<object>
type=1
name=H1 Horizontal Line 9248
color=13850042
width=2
value1=1.217527
</object>

<object>
type=1
name=H1 Horizontal Line 42336
color=13850042
style=1
value1=1.215922
</object>

<object>
type=1
name=H1 Horizontal Line 918
color=13850042
width=2
value1=1.205328
</object>

<object>
type=1
name=H1 Horizontal Line 46964
color=13850042
width=2
value1=1.198941
</object>

<object>
type=1
name=H1 Horizontal Line 12065
color=13850042
width=2
value1=1.195153
</object>

<object>
type=1
name=H1 Horizontal Line 56339
color=13850042
width=2
value1=1.182321
</object>

<object>
type=1
name=H1 Horizontal Line 8444
color=13850042
width=2
value1=1.186318
</object>

<object>
type=1
name=H1 Horizontal Line 45519
color=13850042
width=2
value1=1.176290
</object>

<object>
type=1
name=H1 Horizontal Line 34275
color=13850042
width=2
value1=1.170781
</object>

<object>
type=1
name=H1 Horizontal Line 37458
color=13850042
style=1
value1=1.188157
</object>

<object>
type=109
name=2021.07.26 Todo el día Reunión del Consejo de Economía y Finanz
hidden=1
descr=Reunión del Consejo de Economía y Finanzas
color=16119285
selectable=0
date1=1627268400
</object>

<object>
type=109
name=2021.07.26 10:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 15.4% / 13.2%
color=15658671
selectable=0
date1=1627293600
</object>

<object>
type=109
name=2021.07.26 11:30 Expectaciones de los Negocios del Ifo
hidden=1
descr=Expectaciones de los Negocios del Ifo 101.2 / 103.5
color=13353215
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 11:30 Situación Actual de los Negocios del Ifo
hidden=1
descr=Situación Actual de los Negocios del Ifo 100.4 / 97.7
color=15658671
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 11:30 Clima de Negocios del Ifo
hidden=1
descr=Clima de Negocios del Ifo 100.8 / 100.5
color=15658671
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 3 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 3 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 6 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 6 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 12 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 12 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 17:00 Ventas de Viviendas Nuevas
hidden=1
descr=Ventas de Viviendas Nuevas 0.676 M / 0.814 M
color=13353215
selectable=0
date1=1627318800
</object>

<object>
type=109
name=2021.07.26 17:00 Ventas de Viviendas Nuevas m/m
hidden=1
descr=Ventas de Viviendas Nuevas m/m -6.6% / 4.0%
color=13353215
selectable=0
date1=1627318800
</object>

<object>
type=109
name=2021.07.26 17:30 Índice Manufacturero de la Fed de Dallas
hidden=1
descr=Índice Manufacturero de la Fed de Dallas 27.3 / 33.5
color=13353215
selectable=0
date1=1627320600
</object>

<object>
type=109
name=2021.07.26 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1627324200
</object>

<object>
type=109
name=2021.07.26 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1627324200
</object>

<object>
type=109
name=2021.07.26 20:00 Subasta de Obligaciones del Estado a 2 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 2 Años
color=16119285
selectable=0
date1=1627329600
</object>

<object>
type=109
name=2021.07.27 11:00 Balanza Comercial no Comunitaria
hidden=1
descr=Balanza Comercial no Comunitaria
color=16119285
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Masa Monetaria M3 del BCE a/a
hidden=1
descr=Masa Monetaria M3 del BCE a/a 8.3% / 7.9%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos para Hogares del BCE a/a
hidden=1
descr=Préstamos para Hogares del BCE a/a 4.0% / 4.2%
color=13353215
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos para Empresas no Financieras del BCE
hidden=1
descr=Préstamos para Empresas no Financieras del BCE a/a 1.9% / 0.7%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos del Sector Privado del BCE a/a
hidden=1
descr=Préstamos del Sector Privado del BCE a/a 3.0% / 2.6%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 12:36 Subasta de Deuda a 2 años (CTZ)
hidden=1
descr=Subasta de Deuda a 2 años (CTZ)
color=16119285
selectable=0
date1=1627389360
</object>

<object>
type=109
name=2021.07.27 13:00 Número Total de Solicitantes de Empleo
hidden=1
descr=Número Total de Solicitantes de Empleo 3417.6 K / 3561.8 K
color=15658671
selectable=0
date1=1627390800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes Duraderos m/m
hidden=1
descr=Pedidos de Bienes Duraderos m/m 0.8% / 0.9%
color=13353215
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos Básicos de Bienes Buraderos m/m
hidden=1
descr=Pedidos Básicos de Bienes Buraderos m/m 0.3% / -0.1%
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes Duraderos excl. Defensa m/m
hidden=1
descr=Pedidos de Bienes Duraderos excl. Defensa m/m 1.0% / -0.4%
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes de Capital no Relacionados c
hidden=1
descr=Pedidos de Bienes de Capital no Relacionados con la Defensa exc
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=13353215
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m 1.7% / 1.8%
color=13353215
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a 18.1% / 16.7%
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI) 337.4 / 333.2
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m 1.8
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB 129.1 / 117.3
color=15658671
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Índice de Actividad Manufacturera de la Fed de
hidden=1
descr=Índice de Actividad Manufacturera de la Fed de Richmond 27 / 20
color=15658671
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Envíos de Bienes Manufactureros de la Fed de R
hidden=1
descr=Envíos de Bienes Manufactureros de la Fed de Richmond
color=16119285
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Ingresos por Servicios de la Fed de Richmond
hidden=1
descr=Ingresos por Servicios de la Fed de Richmond 19 / 27
color=13353215
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas 21.7 / 20.0
color=15658671
selectable=0
date1=1627407000
</object>

<object>
type=109
name=2021.07.27 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas 33
color=13353215
selectable=0
date1=1627407000
</object>

<object>
type=109
name=2021.07.27 20:00 Subasta de Obligaciones del Estado a 5 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 5 Años
color=16119285
selectable=0
date1=1627416000
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Importación m/m
hidden=1
descr=Índice de Precios de Importación m/m 1.6% / 0.6%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Importación a/a
hidden=1
descr=Índice de Precios de Importación a/a 12.9% / 10.9%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Exportación m/m
hidden=1
descr=Índice de Precios de Exportación m/m 0.8% / 0.9%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Exportación a/a
hidden=1
descr=Índice de Precios de Exportación a/a 5.0% / 4.5%
color=15658671
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Clima de Consumo de la GfK
hidden=1
descr=Clima de Consumo de la GfK -0.3 / -3.6
color=15658671
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:45 Índice de confianza del consumidor
hidden=1
descr=Índice de confianza del consumidor 101 / 100
color=15658671
selectable=0
date1=1627465500
</object>

<object>
type=109
name=2021.07.28 11:00 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 115.7 / 112.7
color=15658671
selectable=0
date1=1627470000
</object>

<object>
type=109
name=2021.07.28 11:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor 116.6 / 113.0
color=15658671
selectable=0
date1=1627470000
</object>

<object>
type=109
name=2021.07.28 12:46 Subasta de Deuda a 6 meses (BOT)
hidden=1
descr=Subasta de Deuda a 6 meses (BOT)
color=16119285
selectable=0
date1=1627476360
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios mayoristas m/m
hidden=1
descr=Inventarios mayoristas m/m 0.8% / 1.2%
color=15658671
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Balanza Comercial de Mercancías
hidden=1
descr=Balanza Comercial de Mercancías $-91.207 B / $-88.739 B
color=13353215
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios Minoristas m/m
hidden=1
descr=Inventarios Minoristas m/m 0.3% / -0.8%
color=13353215
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios Minoristas excl. Automóviles m/m
hidden=1
descr=Inventarios Minoristas excl. Automóviles m/m
color=16119285
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo -4.089 M / -2.637 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing -1.268 M / -1.12
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo -0.616 M / 0.372 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado -0.163 M /
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado -3.088 M / 
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina 0.649 M / -0.216 M
color=13353215
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción 0.10
color=13353215
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina -2.253 M / -0.492 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1627506000
</object>

<object>
type=109
name=2021.07.28 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1627506000
</object>

<object>
type=109
name=2021.07.28 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1627507800
</object>

<object>
type=109
name=2021.07.29 09:45 PPI m/m
hidden=1
descr=PPI m/m 1.1% / 0.3%
color=15658671
selectable=0
date1=1627551900
</object>

<object>
type=109
name=2021.07.29 10:00 IPC m/m
hidden=1
descr=IPC m/m -0.7% / 0.5%
color=13353215
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPC a/a
hidden=1
descr=IPC a/a 2.9% / 2.4%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPCA m/m
hidden=1
descr=IPCA m/m -1.2% / -0.5%
color=13353215
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPCA a/a
hidden=1
descr=IPCA a/a 2.9% / 2.8%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 15.26% / 16.50%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:55 Cambio del Desempleo
hidden=1
descr=Cambio del Desempleo -91 K / 0 K
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 10:55 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.598 M / 2.711 M
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 10:55 Desempleo no ajustado a variaciones estacional
hidden=1
descr=Desempleo no ajustado a variaciones estacionales 2.590 M / 2.64
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 12:00 PPI m/m
hidden=1
descr=PPI m/m 1.4% / 1.4%
color=16119285
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 9.1% / 9.4%
color=13353215
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador de Confianza Industrial
hidden=1
descr=Indicador de Confianza Industrial 14.6 / 12.2
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador del Sentimiento servicios
hidden=1
descr=Indicador del Sentimiento servicios 19.3 / 14.8
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador del Sentimiento Económico
hidden=1
descr=Indicador del Sentimiento Económico 119.0 / 116.3
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor -4.4 / -4.4
color=16119285
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Expectativas de Precios al Consumidor
hidden=1
descr=Expectativas de Precios al Consumidor 30.0 / 27.3
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Expectativas de Precios de Venta de la Industr
hidden=1
descr=Expectativas de Precios de Venta de la Industria 35.4 / 42.5
color=13353215
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 13:30 Subasta de Deuda a 5 años (BTP)
hidden=1
descr=Subasta de Deuda a 5 años (BTP)
color=16119285
selectable=0
date1=1627565400
</object>

<object>
type=109
name=2021.07.29 13:30 Subasta de Deuda a 10 años (BTP)
hidden=1
descr=Subasta de Deuda a 10 años (BTP)
color=16119285
selectable=0
date1=1627565400
</object>

<object>
type=109
name=2021.07.29 13:52 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 1.9 / 4.4
color=13353215
selectable=0
date1=1627566720
</object>

<object>
type=109
name=2021.07.29 14:30 Actas de la Reunión de Política Monetaria y Cr
hidden=1
descr=Actas de la Reunión de Política Monetaria y Crediticia del BCE
color=16119285
selectable=0
date1=1627569000
</object>

<object>
type=109
name=2021.07.29 15:00 IPC m/m
hidden=1
descr=IPC m/m 0.9% / 0.2%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPC a/a
hidden=1
descr=IPC a/a 3.8% / 2.3%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPCA a/a
hidden=1
descr=IPCA a/a 3.1% / 2.1%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:30 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 6.5% / -5.8%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Deflactor del PIB t/t
hidden=1
descr=Deflactor del PIB t/t 6.0% / 2.4%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Índice Básico de Precio del PCE m/m
hidden=1
descr=Índice Básico de Precio del PCE m/m 6.1% / 1.8%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Índice de Precio del PCE m/m
hidden=1
descr=Índice de Precio del PCE m/m 6.4% / 1.5%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Consumo Personal Real t/t
hidden=1
descr=Consumo Personal Real t/t 11.8% / 11.5%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 PIB Ventas t/t
hidden=1
descr=PIB Ventas t/t 7.7% / 7.6%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo 400 K / 390 K
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo 3.269 M / 3.060 
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 17:00 Ventas de Viviendas Pendientes m/m
hidden=1
descr=Ventas de Viviendas Pendientes m/m -1.9% / -3.9%
color=15658671
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:00 Ventas de Viviendas Pendientes a/a
hidden=1
descr=Ventas de Viviendas Pendientes a/a -1.9% / 32.3%
color=13353215
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:00 Índice de Ventas de Viviendas Pendientes
hidden=1
descr=Índice de Ventas de Viviendas Pendientes
color=16119285
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural 36 B / 52 B
color=15658671
selectable=0
date1=1627579800
</object>

<object>
type=109
name=2021.07.29 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1627583400
</object>

<object>
type=109
name=2021.07.29 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1627583400
</object>

<object>
type=109
name=2021.07.29 20:00 Subasta de Obligaciones del Estado a 7 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 7 Años
color=16119285
selectable=0
date1=1627588800
</object>

<object>
type=109
name=2021.07.30 08:30 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 0.9% / -0.4%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 08:30 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 18.7% / -4.6%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 08:30 Gasto del Consumidor m/m
hidden=1
descr=Gasto del Consumidor m/m 0.3% / -11.9%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 09:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 1.5% / -1.8%
color=15658671
selectable=0
date1=1627635600
</object>

<object>
type=109
name=2021.07.30 09:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 9.6% / -3.4%
color=15658671
selectable=0
date1=1627635600
</object>

<object>
type=109
name=2021.07.30 09:45 IPC m/m
hidden=1
descr=IPC m/m 0.1% / 0.3%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPC a/a
hidden=1
descr=IPC a/a 1.2% / 1.5%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPCA m/m
hidden=1
descr=IPCA m/m 0.1% / 0.2%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPCA a/a
hidden=1
descr=IPCA a/a 1.6% / 1.9%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 10:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 9.7% / 10.6%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.8% / -2.5%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 19.8% / -4.3%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a 1.4% / 32.0%
color=13353215
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 11:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.7% / -0.9%
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 11:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 17.3% / -1.1%
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 11:00 Cuenta corriente
hidden=1
descr=Cuenta corriente €0.900 B / €-0.004 B
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 12:00 IPC m/m
hidden=1
descr=IPC m/m -0.1% / 0.1%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC a/a
hidden=1
descr=IPC a/a 2.2% / 1.9%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPCA m/m
hidden=1
descr=IPCA m/m -1.1% / -0.7%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPCA a/a
hidden=1
descr=IPCA a/a 0.9% / 1.3%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 CPI Básico m/m
hidden=1
descr=CPI Básico m/m -0.4% / 0.0%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC Básico a/a
hidden=1
descr=IPC Básico a/a 0.7% / 0.9%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.0% / -0.4%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 13.7% / -1.5%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 7.7% / 7.8%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC excl. Energía y Comida no Procesada m/m
hidden=1
descr=IPC excl. Energía y Comida no Procesada m/m -0.3% / -0.3%
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC excl. Energía y Comida no Procesada a/a
hidden=1
descr=IPC excl. Energía y Comida no Procesada a/a 0.9% / 0.9%
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Índice de Precios al Consumidor
hidden=1
descr=Índice de Precios al Consumidor
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC Básico
hidden=1
descr=IPC Básico
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:30 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor 91.9 / 93.1
color=13353215
selectable=0
date1=1627648200
</object>

<object>
type=109
name=2021.07.30 15:30 Índice Básico de Precio del PCE m/m
hidden=1
descr=Índice Básico de Precio del PCE m/m 0.4% / 0.3%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice Básico de Precio del PCE a/a
hidden=1
descr=Índice Básico de Precio del PCE a/a 3.5% / 3.0%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Precio del PCE m/m
hidden=1
descr=Índice de Precio del PCE m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Precio del PCE a/a
hidden=1
descr=Índice de Precio del PCE a/a 4.0% / 3.4%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Gastos de las Personas Físicas m/m
hidden=1
descr=Gastos de las Personas Físicas m/m 1.0% / -0.2%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Ingresos Personales m/m
hidden=1
descr=Ingresos Personales m/m 0.1% / -8.2%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Consumo Personal Real m/m
hidden=1
descr=Consumo Personal Real m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Coste del Empleo t/t
hidden=1
descr=Índice de Coste del Empleo t/t 0.7% / 0.7%
color=16119285
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Beneficios de Empleo t/t
hidden=1
descr=Beneficios de Empleo t/t 0.4% / 0.6%
color=13353215
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Salarios de Empleo t/t
hidden=1
descr=Salarios de Empleo t/t 0.9% / 0.8%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 16:30 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1627662600
</object>

<object>
type=109
name=2021.07.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI 73.4 / 70.9
color=15658671
selectable=0
date1=1627663500
</object>

<object>
type=109
name=2021.07.30 17:00 Índice del Sentimiento del Consumidor de la Un
hidden=1
descr=Índice del Sentimiento del Consumidor de la Universidad de Mich
color=15658671
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Expectativas del Consumidor de la Universidad 
hidden=1
descr=Expectativas del Consumidor de la Universidad de Michigan 79.0 
color=15658671
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Condiciones Actuales de la Universidad de Mich
hidden=1
descr=Condiciones Actuales de la Universidad de Michigan 84.5 / 84.5
color=16119285
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Previsión de la Inflación de la Universidad de
hidden=1
descr=Previsión de la Inflación de la Universidad de Michigan 4.7% / 
color=13353215
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Previsión de la Inflación a 5 años de la Unive
hidden=1
descr=Previsión de la Inflación a 5 años de la Universidad de Michiga
color=13353215
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 18:47 Media Truncada del Consumo Personal Real de la
hidden=1
descr=Media Truncada del Consumo Personal Real de la Fed de Dallas, T
color=13353215
selectable=0
date1=1627670820
</object>

<object>
type=109
name=2021.07.30 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1627675200
</object>

<object>
type=109
name=2021.07.30 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1627675200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.31 03:30 Discurso de la Gobernadora de la Reserva Feder
hidden=1
descr=Discurso de la Gobernadora de la Reserva Federal, Lael Brainard
color=16119285
selectable=0
date1=1627702200
</object>

<object>
type=1
name=H1 Horizontal Line 39152
color=13850042
width=2
value1=1.191217
</object>

<object>
type=109
name=2021.11.29 10:00 Discurso de Joachim Wuermeling, miembro de la 
hidden=1
descr=Discurso de Joachim Wuermeling, miembro de la Junta Ejecutiva d
color=16119285
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 1.3%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPC a/a
hidden=1
descr=IPC a/a 5.6% / 6.1%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.3% / 0.5%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPCA a/a
hidden=1
descr=IPCA a/a 5.6% / 5.7%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:30 Discurso de la presidenta del Comité de Superv
hidden=1
descr=Discurso de la presidenta del Comité de Supervisión del BCE, An
color=16119285
selectable=0
date1=1638181800
</object>

<object>
type=109
name=2021.11.29 11:00 PPI m/m
hidden=1
descr=PPI m/m 7.1% / 1.6%
color=15658671
selectable=0
date1=1638183600
</object>

<object>
type=109
name=2021.11.29 11:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 20.4% / 15.0%
color=15658671
selectable=0
date1=1638183600
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador de Confianza Industrial
hidden=1
descr=Indicador de Confianza Industrial 14.1 / 14.2
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador del Sentimiento servicios
hidden=1
descr=Indicador del Sentimiento servicios 18.4 / 16.9
color=15658671
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador del Sentimiento Económico
hidden=1
descr=Indicador del Sentimiento Económico 117.5 / 118.3
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor -6.8 / -6.8
color=16119285
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Expectativas de Precios al Consumidor
hidden=1
descr=Expectativas de Precios al Consumidor 39.3 / 40.3
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Expectativas de Precios de Venta de la Industr
hidden=1
descr=Expectativas de Precios de Venta de la Industria 49.0 / 43.6
color=15658671
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 13:30 Discurso de Isabel Schnabel, Miembro del Conse
hidden=1
descr=Discurso de Isabel Schnabel, Miembro del Consejo Ejecutivo del 
color=16119285
selectable=0
date1=1638192600
</object>

<object>
type=109
name=2021.11.29 13:57 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 4.4 / 3.3
color=15658671
selectable=0
date1=1638194220
</object>

<object>
type=109
name=2021.11.29 15:00 IPC m/m
hidden=1
descr=IPC m/m -0.2% / -0.3%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPC a/a
hidden=1
descr=IPC a/a 5.2% / 4.6%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.3% / 0.4%
color=13353215
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPCA a/a
hidden=1
descr=IPCA a/a 6.0% / 4.7%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 3 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 3 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 6 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 6 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 12 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 12 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 16:00 Discurso del miembro del Comité de Supervisión
hidden=1
descr=Discurso del miembro del Comité de Supervisión del BCE, Pentti 
color=16119285
selectable=0
date1=1638201600
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
name=2021.11.29 17:05 Discurso de Burkhard Balz, miembro de la Junta
hidden=1
descr=Discurso de Burkhard Balz, miembro de la Junta Ejecutiva del Bb
color=16119285
selectable=0
date1=1638205500
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
name=2021.11.29 19:15 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1638213300
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
name=2021.11.29 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1638225000
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
name=2021.11.30 09:45 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 0.2%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPC a/a
hidden=1
descr=IPC a/a 2.8% / 2.8%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPCA m/m
hidden=1
descr=IPCA m/m 0.4% / 0.1%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPCA a/a
hidden=1
descr=IPCA a/a 3.4% / 3.3%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 3.0% / 3.0%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 3.3% / 3.3%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Gasto del Consumidor m/m
hidden=1
descr=Gasto del Consumidor m/m -0.4% / -1.3%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 PPI m/m
hidden=1
descr=PPI m/m 2.9% / 1.2%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 10:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a -0.7% / -1.2%
color=15658671
selectable=0
date1=1638266400
</object>

<object>
type=109
name=2021.11.30 10:55 Cambio del Desempleo
hidden=1
descr=Cambio del Desempleo -34 K / -47 K
color=13353215
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 10:55 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.428 M / 2.479 M
color=15658671
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 10:55 Desempleo no ajustado a variaciones estacional
hidden=1
descr=Desempleo no ajustado a variaciones estacionales 2.317 M / 2.32
color=15658671
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 11:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.6% / 2.6%
color=16119285
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 11:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 3.9% / 3.8%
color=15658671
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 11:00 Cuenta corriente
hidden=1
descr=Cuenta corriente €2.220 B / €0.351 B
color=15658671
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 12:00 IPC m/m
hidden=1
descr=IPC m/m 0.5% / 0.0%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC a/a
hidden=1
descr=IPC a/a 4.9% / 4.4%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.8% / 0.0%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPCA a/a
hidden=1
descr=IPCA a/a 4.0% / 3.3%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 CPI Básico m/m
hidden=1
descr=CPI Básico m/m 0.1% / 0.5%
color=13353215
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC Básico a/a
hidden=1
descr=IPC Básico a/a 2.6% / 2.1%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC excl. Energía y Comida no Procesada m/m
hidden=1
descr=IPC excl. Energía y Comida no Procesada m/m 0.1% / 0.3%
color=13353215
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC excl. Energía y Comida no Procesada a/a
hidden=1
descr=IPC excl. Energía y Comida no Procesada a/a 2.6% / 2.1%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 Índice de Precios al Consumidor
hidden=1
descr=Índice de Precios al Consumidor
color=16119285
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC Básico
hidden=1
descr=IPC Básico
color=16119285
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:15 Discurso del Presidente del Banco Federal de A
hidden=1
descr=Discurso del Presidente del Banco Federal de Alemania, Jens Wei
color=16119285
selectable=0
date1=1638274500
</object>

<object>
type=109
name=2021.11.30 13:14 Subasta de Deuda a 5 años (BTP)
hidden=1
descr=Subasta de Deuda a 5 años (BTP)
color=16119285
selectable=0
date1=1638278040
</object>

<object>
type=109
name=2021.11.30 13:14 Subasta de Deuda a 10 años (BTP)
hidden=1
descr=Subasta de Deuda a 10 años (BTP)
color=16119285
selectable=0
date1=1638278040
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m 0.9% / 1.4%
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a 17.7% / 19.3%
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI) 354.6 / 353.8
color=15658671
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m 1.0
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI 61.8 / 66.8
color=13353215
selectable=0
date1=1638290700
</object>

<object>
type=109
name=2021.11.30 17:00 Anuncio del Presidente del Sistema de la Reser
hidden=1
descr=Anuncio del Presidente del Sistema de la Reserva Federal, Jerom
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB 109.5 / 111.6
color=13353215
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas 25.4 / 16.9
color=15658671
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas 22
color=15658671
selectable=0
date1=1638293400
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
name=2021.11.30 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1638297000
</object>

<object>
type=109
name=2021.11.30 19:00 Discurso de Claudia Buch, Vicepresidenta del B
hidden=1
descr=Discurso de Claudia Buch, Vicepresidenta del Bbk
color=16119285
selectable=0
date1=1638298800
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
name=2021.12.01 09:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m
color=16119285
selectable=0
date1=1638349200
</object>

<object>
type=109
name=2021.12.01 09:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638349200
</object>

<object>
type=109
name=2021.12.01 10:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:00 Reunión de Política no Monetaria del BCE
hidden=1
descr=Reunión de Política no Monetaria del BCE
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:15 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638353700
</object>

<object>
type=109
name=2021.12.01 10:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638355500
</object>

<object>
type=109
name=2021.12.01 10:50 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638355800
</object>

<object>
type=109
name=2021.12.01 10:55 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638356100
</object>

<object>
type=109
name=2021.12.01 11:00 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638356400
</object>

<object>
type=109
name=2021.12.01 12:30 Subasta de Obligaciones del Estado a 5 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 5 Años
color=16119285
selectable=0
date1=1638361800
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
name=2021.12.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638377100
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
name=2021.12.01 19:00 Discurso de Johannes Beermann, miembro de la J
hidden=1
descr=Discurso de Johannes Beermann, miembro de la Junta Ejecutiva de
color=16119285
selectable=0
date1=1638385200
</object>

<object>
type=109
name=2021.12.01 19:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638385200
</object>

<object>
type=109
name=2021.12.01 19:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638385200
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
name=2021.12.02 10:00 Variación del Desempleo
hidden=1
descr=Variación del Desempleo
color=16119285
selectable=0
date1=1638439200
</object>

<object>
type=109
name=2021.12.02 11:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638442800
</object>

<object>
type=109
name=2021.12.02 11:40 Subasta de Obligaciones del Estado a 10 años
hidden=1
descr=Subasta de Obligaciones del Estado a 10 años
color=16119285
selectable=0
date1=1638445200
</object>

<object>
type=109
name=2021.12.02 12:00 PPI m/m
hidden=1
descr=PPI m/m
color=16119285
selectable=0
date1=1638446400
</object>

<object>
type=109
name=2021.12.02 12:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a
color=16119285
selectable=0
date1=1638446400
</object>

<object>
type=109
name=2021.12.02 12:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638446400
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
name=2021.12.02 16:00 Discurso de Fabio Panetta, Miembro del Consejo
hidden=1
descr=Discurso de Fabio Panetta, Miembro del Consejo Ejecutivo del BC
color=16119285
selectable=0
date1=1638460800
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
name=2021.12.02 18:00 Discurso de Randal Quarles, Gobernador de la F
hidden=1
descr=Discurso de Randal Quarles, Gobernador de la Fed
color=16119285
selectable=0
date1=1638468000
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
name=2021.12.03 09:45 Producción Industrial m/m
hidden=1
descr=Producción Industrial m/m
color=16119285
selectable=0
date1=1638524700
</object>

<object>
type=109
name=2021.12.03 09:45 Balace Presupuestario del Gobierno
hidden=1
descr=Balace Presupuestario del Gobierno
color=16119285
selectable=0
date1=1638524700
</object>

<object>
type=109
name=2021.12.03 10:15 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638526500
</object>

<object>
type=109
name=2021.12.03 10:15 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638526500
</object>

<object>
type=109
name=2021.12.03 10:30 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1638527400
</object>

<object>
type=109
name=2021.12.03 10:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528300
</object>

<object>
type=109
name=2021.12.03 10:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528300
</object>

<object>
type=109
name=2021.12.03 10:50 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528600
</object>

<object>
type=109
name=2021.12.03 10:50 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528600
</object>

<object>
type=109
name=2021.12.03 10:55 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528900
</object>

<object>
type=109
name=2021.12.03 10:55 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528900
</object>

<object>
type=109
name=2021.12.03 11:00 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638529200
</object>

<object>
type=109
name=2021.12.03 11:00 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638529200
</object>

<object>
type=109
name=2021.12.03 12:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m
color=16119285
selectable=0
date1=1638532800
</object>

<object>
type=109
name=2021.12.03 12:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638532800
</object>

<object>
type=109
name=2021.12.03 13:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638536400
</object>

<object>
type=109
name=2021.12.03 13:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638536400
</object>

<object>
type=109
name=2021.12.03 15:00 Discurso del miembro del Comité Ejecutivo del 
hidden=1
descr=Discurso del miembro del Comité Ejecutivo del BCE, Philip Lane
color=16119285
selectable=0
date1=1638543600
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
name=2021.12.03 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
name=H1 Vertical Line 65328
color=65535
ray=1
date1=1646834400
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
type=20
name=SSSR#R0 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1652695200
date2=1655139600
value1=8309.878571
value2=8267.610714
</object>

<object>
type=20
name=SSSR#R1 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1652961600
date2=1655139600
value1=8355.500000
value2=8323.569643
</object>

<object>
type=20
name=SSSR#R2 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1653076800
date2=1655139600
value1=8443.735714
value2=8398.832143
</object>

<object>
type=20
name=SSSR#R3 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1653379200
date2=1655139600
value1=8541.962500
value2=8524.637500
</object>

<object>
type=20
name=SSSR#R4 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1653901200
date2=1655139600
value1=9005.400000
value2=8981.800000
</object>

<object>
type=20
name=SSSR#R5 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1654077600
date2=1655139600
value1=8918.100000
value2=8884.700000
</object>

<object>
type=20
name=SSSR#R6 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1654189200
date2=1655139600
value1=8715.700000
value2=8695.117857
</object>

<object>
type=20
name=SSSR#R7 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1654768800
date2=1655139600
value1=8843.100000
value2=8814.600000
</object>

<object>
type=20
name=SSSR#R8 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1654851600
date2=1655139600
value1=8683.100000
value2=8665.900000
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655165052
value1=8288.744643
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655165052
value1=8339.534821
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655165052
value1=8421.283929
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655165052
value1=8533.300000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1655165094
value1=8993.600000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1655165192
value1=8901.400000
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
date1=1655165052
value1=8705.408929
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1655165059
value1=8828.850000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1655165059
value1=8674.500000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655136000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655128800
value1=8198.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655114400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655107200
value1=8230.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654851600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654844400
value1=8612.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654844400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654837200
value1=8619.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654542000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654534800
value1=8857.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21654196400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1654185600
value1=8700.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654117200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654110000
value1=8738.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654041600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654034400
value1=8796.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653904800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653897600
value1=9005.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21653559200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1653548400
value1=8732.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653523200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653516000
value1=8801.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653058800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653051600
value1=8554.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652932800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652925600
value1=8342.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652882400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652875200
value1=8552.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652842800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652835600
value1=8523.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652806800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652799600
value1=8486.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652796000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652788800
value1=8478.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652709600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1652698800
value1=8389.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652396400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1652385600
value1=8111.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652216400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1652205600
value1=8099.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652180400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652173200
value1=8239.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652158800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652151600
value1=8053.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652144400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652137200
value1=8127.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652072400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652065200
value1=8194.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651860000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651852800
value1=8278.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651838400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651831200
value1=8353.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651816800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651809600
value1=8381.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651806000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651798800
value1=8401.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651795200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651788000
value1=8410.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651104000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1651093200
value1=8387.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651057200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1651046400
value1=8477.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651024800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651017600
value1=8365.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651021200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651014000
value1=8343.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651010400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651003200
value1=8431.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651003200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650996000
value1=8431.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651003200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1650992400
value1=8426.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650880800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650873600
value1=8496.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650852000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650668400
value1=8571.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21650632400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1650621600
value1=8795.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650610800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650603600
value1=8647.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650589200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650582000
value1=8678.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650553200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650546000
value1=8883.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650474000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650466800
value1=8817.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649962800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649955600
value1=8733.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649844000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1649836800
value1=8615.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649268000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649260800
value1=8410.200000
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
date1=1649174400
value1=8639.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648778400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648771200
value1=8396.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648771200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648764000
value1=8372.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648598400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648591200
value1=8647.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648580400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648573200
value1=8621.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648573200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648566000
value1=8629.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648573200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1648566000
value1=8633.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648483200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648476000
value1=8483.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648472400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648465200
value1=8492.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648101600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648094400
value1=8286.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648033200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648026000
value1=8538.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648018800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648011600
value1=8538.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648008000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648000800
value1=8519.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647997200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647990000
value1=8500.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647432000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1647421200
value1=8423.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647428400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647421200
value1=8423.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647266400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1647255600
value1=8319.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647237600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1647226800
value1=8265.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1647237600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1647226800
value1=8275.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647219600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1647032400
value1=8051.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646985600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646974800
value1=7962.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646928000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1646920800
value1=7994.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646859600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646852400
value1=8210.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646859600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646848800
value1=8228.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646830800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646823600
value1=8099.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646791200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646780400
value1=7827.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646773200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646766000
value1=8042.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646744400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646733600
value1=7922.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646676000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646665200
value1=7778.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646654400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646647200
value1=7363.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646636400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646629200
value1=7451.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646434800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1646427600
value1=7653.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646434800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646424000
value1=7658.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646424000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1646416800
value1=7700.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646391600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646384400
value1=8012.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646377200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646370000
value1=7747.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646366400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646359200
value1=7722.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646352000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646344800
value1=7997.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646337600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646330400
value1=7996.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646323200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646316000
value1=8118.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646197200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1646186400
value1=8246.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646175600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646168400
value1=8091.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646175600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646164800
value1=8060.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646150400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646139600
value1=8294.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646013600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645830000
value1=8381.700000
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
date1=1645740000
value1=8353.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645732800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1645722000
value1=8226.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645700400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645693200
value1=8052.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645700400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1645689600
value1=8031.700000
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
date1=1645668000
value1=8269.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645567200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1645556400
value1=8413.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645527600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645520400
value1=8267.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645513200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645506000
value1=8328.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645498800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645491600
value1=8306.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645124400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1645113600
value1=8624.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645012800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645005600
value1=8797.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645012800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645005600
value1=8801.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644850800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644843600
value1=8507.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644818400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644811200
value1=8621.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644501600
value1=8913.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644462000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644454800
value1=8876.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644231600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1644220800
value1=8665.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643986800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643979600
value1=8544.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643986800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643979600
value1=8540.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643932800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643922000
value1=8616.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643799600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643792400
value1=8799.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643770800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643763600
value1=8798.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643385600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643378400
value1=8519.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643367600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643360400
value1=8714.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643367600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1643356800
value1=8715.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643266800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643259600
value1=8363.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643266800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643259600
value1=8359.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643162400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643151600
value1=8419.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1643162400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1643151600
value1=8409.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643151600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643144400
value1=8573.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643151600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1643140800
value1=8575.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643058000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643050800
value1=8346.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642989600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642806000
value1=8597.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642777200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1642766400
value1=8761.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641459600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641452400
value1=8620.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641434400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641427200
value1=8660.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641297600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641290400
value1=8828.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641222000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641214800
value1=8793.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640696400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640689200
value1=8694.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640653200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640646000
value1=8636.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640642400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640635200
value1=8639.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640631600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640624400
value1=8640.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640624400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640617200
value1=8635.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640289600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640282400
value1=8569.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640228400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640221200
value1=8497.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640206800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640199600
value1=8470.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640120400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640113200
value1=8419.700000
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
date1=1639994400
value1=8073.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639969200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639962000
value1=8162.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639605600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639598400
value1=8251.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639598400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639591200
value1=8273.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639591200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639584000
value1=8259.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639483200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1639476000
value1=8412.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639422000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639414800
value1=8299.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639101600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639094400
value1=8358.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638910800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638903600
value1=8569.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638885600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638878400
value1=8547.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638828000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638820800
value1=8462.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638817200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638810000
value1=8450.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638561600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638554400
value1=8193.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638295200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1638284400
value1=8400.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638266400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638259200
value1=8294.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638151200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637964000
value1=8408.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638151200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1637960400
value1=8288.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637956800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1637949600
value1=8364.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637690400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1637679600
value1=8877.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637542800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637359200
value1=8734.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637352000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637344800
value1=8745.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637341200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1637330400
value1=8707.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637276400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637269200
value1=8899.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636574400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636567200
value1=9151.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636560000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636552800
value1=9147.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636444800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636437600
value1=9031.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636149600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636142400
value1=9140.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636135200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636128000
value1=9160.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635969600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635962400
value1=9004.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635822000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635814800
value1=9207.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635800400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635793200
value1=9200.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635782400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635775200
value1=9182.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635742800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635735600
value1=9128.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635440400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635433200
value1=9035.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635260400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635253200
value1=9027.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634025600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634018400
value1=8799.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634018400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634011200
value1=8802.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634007600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634000400
value1=8821.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634000400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633993200
value1=8831.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633633200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633626000
value1=8972.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633618800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633611600
value1=8982.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633474800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633467600
value1=8937.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633107600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1633096800
value1=8813.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633086000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633078800
value1=8650.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633078800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633071600
value1=8689.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632895200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632888000
value1=8757.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632880800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632873600
value1=8772.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632783600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632776400
value1=9024.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632765600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632758400
value1=9018.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632751200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632744000
value1=9003.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632751200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1632744000
value1=9007.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632434400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632427200
value1=8896.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632405600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632398400
value1=8905.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632308400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1632297600
value1=8856.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632157200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632150000
value1=8566.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631883600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631876400
value1=8848.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631883600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1631872800
value1=8858.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1631883600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1631872800
value1=8868.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631736000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631728800
value1=8630.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631736000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1631725200
value1=8618.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631588400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631581200
value1=8847.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631559600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631552400
value1=8837.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631548800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631541600
value1=8823.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631494800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631311200
value1=8646.300000
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
date1=1631293200
value1=8673.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631192400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631185200
value1=8719.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631106000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631098800
value1=8768.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631106000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1631095200
value1=8742.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1631106000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1631095200
value1=8732.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630911600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630904400
value1=8829.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630904400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630897200
value1=8820.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630512000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630504800
value1=9041.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630504800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630497600
value1=9006.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630429200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630422000
value1=8776.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630393200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630386000
value1=8835.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630368000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630360800
value1=8842.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630040400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630033200
value1=8864.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630022400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630015200
value1=8867.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630004400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629997200
value1=8883.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629986400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629979200
value1=8893.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629824400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629817200
value1=8879.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629824400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1629813600
value1=8875.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629723600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1629712800
value1=8904.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629712800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629705600
value1=9004.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629396000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1629388800
value1=8960.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629370800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629363600
value1=8805.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629370800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1629363600
value1=8801.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629327600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629320400
value1=8966.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629237600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629230400
value1=8813.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629219600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629212400
value1=8844.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629136800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629129600
value1=8894.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629111600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629104400
value1=8914.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628776800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628769600
value1=8999.900000
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
date1=1628733600
value1=8991.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628686800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628679600
value1=8952.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628276400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628269200
value1=8898.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627909200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627902000
value1=8814.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627574400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627567200
value1=8844.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627563600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1627552800
value1=8827.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627560000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627552800
value1=8827.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627063200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627056000
value1=8743.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627041600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627034400
value1=8696.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626969600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626962400
value1=8681.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626948000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626940800
value1=8616.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626876000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626868800
value1=8525.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626735600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626728400
value1=8242.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626721200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626714000
value1=8263.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626681600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626674400
value1=8389.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626415200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626408000
value1=8484.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626390000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626382800
value1=8498.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626350400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626343200
value1=8555.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626271200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626264000
value1=8617.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626202800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626195600
value1=8670.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626192000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626184800
value1=8696.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626102000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1626091200
value1=8687.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625770800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625763600
value1=8597.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625630400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625623200
value1=8814.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625511600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625504400
value1=8969.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625065200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625058000
value1=8802.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624957200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624950000
value1=8904.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624892400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624885200
value1=8945.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624615200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624608000
value1=9118.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624608000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624600800
value1=9116.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624593600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624586400
value1=9112.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624575600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624568400
value1=9100.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624543200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624536000
value1=9094.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624492800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624485600
value1=8961.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624485600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624478400
value1=8965.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624464000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624456800
value1=8995.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624269600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624262400
value1=8903.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623913200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623906000
value1=9154.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623906000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623898800
value1=9142.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623891600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623884400
value1=9173.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623747600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623740400
value1=9324.700000
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
date1=1623726000
value1=9326.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623697200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623690000
value1=9307.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623672000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623664800
value1=9275.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623416400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623405600
value1=9212.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623088800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623081600
value1=9179.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622815200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622808000
value1=9069.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622736000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622728800
value1=9079.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622566800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622559600
value1=9232.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622512800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622505600
value1=9117.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622044800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622037600
value1=9139.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622044800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1622037600
value1=9135.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621638000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621630800
value1=9229.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621605600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621598400
value1=9185.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621519200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1621508400
value1=8991.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621447200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621440000
value1=8969.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621447200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1621436400
value1=9012.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621353600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621346400
value1=9118.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621234800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621227600
value1=9184.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621224000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621216800
value1=9203.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620918000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620910800
value1=8830.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620752400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1620741600
value1=8946.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620630000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620622800
value1=9116.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620385200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620378000
value1=9049.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620140400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620133200
value1=9008.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620140400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1620129600
value1=8996.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619697600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619690400
value1=8875.100000
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
date1=1619575200
value1=8775.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619460000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619452800
value1=8719.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619438400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619431200
value1=8694.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619125200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619118000
value1=8669.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619024400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1619017200
value1=8419.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619006400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1618999200
value1=8572.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618988400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618981200
value1=8446.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618977600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618970400
value1=8447.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618891200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618884000
value1=8725.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618858800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618851600
value1=8732.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618581600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618574400
value1=8641.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618581600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1618570800
value1=8663.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618232400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618225200
value1=8497.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617656400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617649200
value1=8713.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617595200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617588000
value1=8683.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617584400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617375600
value1=8681.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617145200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617138000
value1=8618.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617130800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617123600
value1=8614.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616983200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616799600
value1=8541.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616781600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616774400
value1=8534.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616688000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616680800
value1=8294.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616500800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616493600
value1=8265.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616446800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616439600
value1=8341.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615813200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615806000
value1=8733.600000
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
date1=1615773600
value1=8693.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615770000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615586400
value1=8691.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615525200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615518000
value1=8622.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614826800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614819600
value1=8228.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614826800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614819600
value1=8224.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614344400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614337200
value1=8376.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614330000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614322800
value1=8191.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614254400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614247200
value1=8377.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614121200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614114000
value1=8313.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613462400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613455200
value1=8243.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613372400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613365200
value1=8119.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613131200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613124000
value1=7929.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613016000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613008800
value1=8023.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612987200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612980000
value1=8037.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612972800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612965600
value1=8063.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612908000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612900800
value1=8100.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612778400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612771200
value1=8284.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612544400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612537200
value1=8224.800000
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
date1=1612494000
value1=8154.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612368000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612360800
value1=8063.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612353600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612346400
value1=8042.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612324800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612317600
value1=7991.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612299600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612292400
value1=7970.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612274400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612267200
value1=7946.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612148400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612141200
value1=7684.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611871200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611864000
value1=7972.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611802800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611795600
value1=7743.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611795600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611788400
value1=7760.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611763200
value1=7803.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611666000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611658800
value1=7991.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611655200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611648000
value1=7822.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611615600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611608400
value1=7893.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611334800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611327600
value1=7997.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611266400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611259200
value1=8112.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611158400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611151200
value1=8147.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610974800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610967600
value1=8181.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610938800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610931600
value1=8189.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610740800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610733600
value1=8221.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610103600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610096400
value1=8450.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610089200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610082000
value1=8444.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609999200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609992000
value1=8408.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609945200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609938000
value1=8263.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609930800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609923600
value1=8194.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609758000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609750800
value1=8202.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609419600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609412400
value1=8075.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609239600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609232400
value1=8228.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609232400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609225200
value1=8200.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609156800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609149600
value1=8186.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609117200
value1=8149.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608807600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608800400
value1=8111.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608573600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608566400
value1=7724.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608559200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608552000
value1=7680.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608559200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1608552000
value1=7676.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608530400
value1=7911.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608332400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608325200
value1=7998.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607958000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607950800
value1=8222.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607702400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607695200
value1=8011.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607439600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607432400
value1=8201.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607302800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607119200
value1=8331.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607112000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607104800
value1=8320.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607104800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607097600
value1=8304.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607097600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607090400
value1=8271.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606705200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606698000
value1=8231.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606287600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606280400
value1=8202.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606140000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606132800
value1=8054.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605610800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605600000
value1=7987.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605546000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605538800
value1=8054.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605531600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605524400
value1=7959.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605524400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605517200
value1=7990.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605517200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605510000
value1=7918.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605499200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605492000
value1=7906.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605499200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605488400
value1=7901.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605276000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605268800
value1=7825.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605128400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605121200
value1=7806.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605088800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605081600
value1=7805.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604984400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604977200
value1=7422.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604602800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604595600
value1=6943.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604592000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604584800
value1=6922.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604458800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604451600
value1=6834.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604383200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604376000
value1=6660.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604055600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604048400
value1=6295.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604055600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604044800
value1=6255.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1604055600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1604044800
value1=6245.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603987200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603980000
value1=6339.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603987200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1603980000
value1=6335.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603929600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603922400
value1=6403.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603918800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603911600
value1=6419.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603911600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603904400
value1=6416.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603904400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603897200
value1=6467.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603890000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603882800
value1=6489.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603875600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603868400
value1=6576.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603382400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603371600
value1=6846.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603220400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603213200
value1=6967.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603209600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603202400
value1=6956.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602781200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602774000
value1=6763.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602763200
value1=6759.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602640800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602633600
value1=6843.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602216000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602208800
value1=7043.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602183600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602176400
value1=7021.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602176400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602169200
value1=7012.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602158400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602151200
value1=6997.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602003600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601996400
value1=6982.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601460000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601452800
value1=6631.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601370000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601362800
value1=6830.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601355600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601348400
value1=6815.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601326800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601319600
value1=6797.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600963200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1600952400
value1=6712.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600920000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600912800
value1=6537.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600920000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1600912800
value1=6533.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600905600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600898400
value1=6577.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600718400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600711200
value1=6702.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600650000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600466400
value1=6898.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600455600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600448400
value1=6916.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600444800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600437600
value1=6964.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600264800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600257600
value1=7109.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600189200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600182000
value1=7067.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600182000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600174800
value1=7055.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599678000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1599667200
value1=7045.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599584400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599577200
value1=6891.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599584400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1599577200
value1=6887.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599220800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599213600
value1=7137.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599138000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599130800
value1=7132.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598932800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598925600
value1=6969.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598857200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598850000
value1=7224.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598536800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598529600
value1=7033.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598374800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598367600
value1=7211.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598356800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598349600
value1=7177.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598338800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598331600
value1=7158.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598295600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598288400
value1=7127.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598288400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598281200
value1=7099.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598029200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598022000
value1=6890.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598029200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1598018400
value1=6899.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597906800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597899600
value1=6966.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597734000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597726800
value1=7045.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597705200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597698000
value1=7062.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597672800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597665600
value1=7076.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597417200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597410000
value1=7106.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597413600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597402800
value1=7055.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597233600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597226400
value1=7302.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597183200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597176000
value1=7268.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597140000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597132800
value1=7152.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597132800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597125600
value1=7119.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597107600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597100400
value1=7087.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597089600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597082400
value1=7075.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596729600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596722400
value1=6908.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596729600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1596718800
value1=6911.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1596729600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1596718800
value1=6901.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596628800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596621600
value1=7104.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596560400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1596549600
value1=6946.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596236400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596229200
value1=6828.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596135600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596128400
value1=6953.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596135600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1596124800
value1=6918.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596121200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596114000
value1=6990.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595872800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595865600
value1=7133.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595854800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595847600
value1=7168.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595592000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595584800
value1=7233.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595343600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595336400
value1=7623.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595228400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595217600
value1=7400.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594839600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594832400
value1=7534.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594609200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594602000
value1=7418.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594609200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594422000
value1=7425.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594378800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1594368000
value1=7168.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594375200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594368000
value1=7168.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594324800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594317600
value1=7225.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594306800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594299600
value1=7284.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594216800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594209600
value1=7315.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594177200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594170000
value1=7365.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594044000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594036800
value1=7622.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594036800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594029600
value1=7619.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594022400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594015200
value1=7559.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593727200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593720000
value1=7502.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593720000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593712800
value1=7500.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593712800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593705600
value1=7544.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593712800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593705600
value1=7548.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593712800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593702000
value1=7541.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593540000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1593529200
value1=7164.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593424800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1593414000
value1=7097.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593392400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593208800
value1=7137.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593036000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593028800
value1=7160.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593028800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593021600
value1=7159.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593028800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1593021600
value1=7155.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592604000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592596800
value1=7320.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592478000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592470800
value1=7462.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592413200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592402400
value1=7559.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592330400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592319600
value1=7569.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592326800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592319600
value1=7569.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592290800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592283600
value1=7491.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592222400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592215200
value1=7062.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591970400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591959600
value1=7419.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591930800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591923600
value1=7200.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591909200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1591902000
value1=7207.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591880400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591873200
value1=7383.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591880400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591869600
value1=7378.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591880400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1591869600
value1=7368.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591848000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591840800
value1=7529.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591848000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591837200
value1=7519.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591707600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591700400
value1=7688.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591588800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591581600
value1=7911.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591387200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591380000
value1=7873.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591365600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591358400
value1=7787.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591358400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591351200
value1=7801.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591243200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591236000
value1=7668.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591196400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591189200
value1=7524.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591117200
value1=7426.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590649200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590642000
value1=7273.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590598800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590591600
value1=7215.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590573600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590566400
value1=7060.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590534000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590526800
value1=7030.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590519600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590512400
value1=7028.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590501600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590494400
value1=6966.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590458400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590451200
value1=6862.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590084000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590076800
value1=6780.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589911200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589904000
value1=6547.700000
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
value1=6875.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589886000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589878800
value1=6879.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589878800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589871600
value1=6821.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589864400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589857200
value1=6798.000000
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
value1=6411.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589479200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589472000
value1=6407.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589479200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589468400
value1=6415.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589461200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589454000
value1=6502.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589410800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589400000
value1=6553.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589259600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589252400
value1=6606.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589223600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589216400
value1=6643.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588593600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588582800
value1=6800.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588568400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588561200
value1=6615.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588370400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588363200
value1=6699.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588334400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588327200
value1=6742.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588284000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1588273200
value1=6850.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588248000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588240800
value1=7000.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588240800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588233600
value1=7134.000000
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
date1=1588212000
value1=7092.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588093200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588082400
value1=6854.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587679200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587672000
value1=6622.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587416400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1587405600
value1=6857.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587402000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587391200
value1=6712.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587060000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587052800
value1=6727.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587034800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587027600
value1=6957.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587013200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587006000
value1=6789.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586988000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586980800
value1=6838.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586862000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586854800
value1=7223.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586862000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586854800
value1=7227.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586797200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586786400
value1=7092.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586433600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586422800
value1=7077.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586278800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586271600
value1=7117.100000
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
value1=7097.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586260800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586253600
value1=7090.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586260800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586253600
value1=7094.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586246400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1586239200
value1=6794.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586199600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586188800
value1=6875.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586167200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586160000
value1=6865.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586167200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586160000
value1=6869.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586167200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586156400
value1=6873.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586149200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586142000
value1=6803.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585836000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585825200
value1=6489.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585825200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585818000
value1=6637.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585796400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585789200
value1=6447.100000
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
value1=6502.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585562400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585555200
value1=6832.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585537200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585530000
value1=6505.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585335600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585328400
value1=6665.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585328400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585317600
value1=6710.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585292400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585285200
value1=6913.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585274400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585263600
value1=7102.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585177200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585170000
value1=7031.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585177200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585166400
value1=7031.500000
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
value1=7076.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585141200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585130400
value1=7034.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1585141200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1585130400
value1=7044.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585105200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585098000
value1=6803.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585105200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585098000
value1=6807.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584993600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584982800
value1=6134.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1584993600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1584982800
value1=6124.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584961200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584950400
value1=6282.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584939600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584928800
value1=5995.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584741600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584730800
value1=6337.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1584741600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1584730800
value1=6327.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584727200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584720000
value1=6468.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584712800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584705600
value1=6718.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584712800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584705600
value1=6722.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584673200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584666000
value1=6228.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584673200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584662400
value1=6234.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584608400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584597600
value1=5853.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584590400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584579600
value1=6440.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584572400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584561600
value1=6011.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584504000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584496800
value1=6179.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584475200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584468000
value1=6563.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584446400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584439200
value1=6504.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584378000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584370800
value1=5802.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584378000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584370800
value1=5798.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584129600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584122400
value1=6505.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584129600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584118800
value1=6458.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584118800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584108000
value1=7138.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584086400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584079200
value1=6154.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584086400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584079200
value1=6150.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584072000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584064800
value1=6241.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584072000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584064800
value1=6237.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584072000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584061200
value1=6210.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584043200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584036000
value1=6292.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584000000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583992800
value1=6908.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584000000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583992800
value1=6904.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583967600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583960400
value1=7244.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583946000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583938800
value1=7418.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583924400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583913600
value1=7390.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1583924400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1583913600
value1=7380.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583870400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583863200
value1=7431.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583834400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583827200
value1=7940.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583809200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583802000
value1=7529.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583805600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583791200
value1=7474.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583780400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583773200
value1=7728.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583773200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583766000
value1=7614.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583748000
value1=7694.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583726400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583715600
value1=7858.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583535600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583528400
value1=8257.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583517600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583510400
value1=8327.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583488800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583481600
value1=8480.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583463600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583456400
value1=8569.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583366400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583359200
value1=9025.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583244000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1583233200
value1=9020.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583208000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583200800
value1=8925.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583161200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583154000
value1=8534.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583146800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583139600
value1=8915.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582894800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582887600
value1=8642.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582884000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582876800
value1=8643.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582884000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582873200
value1=8610.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1582884000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1582873200
value1=8600.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582858800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582851600
value1=8778.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582855200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582844400
value1=8740.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582768800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582758000
value1=9146.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582689600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582682400
value1=9127.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582682400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582675200
value1=9137.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582675200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582668000
value1=9112.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582642800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582635600
value1=9363.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582642800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582632000
value1=9340.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582596000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582588800
value1=9405.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582311600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582304400
value1=9852.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582228800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582221600
value1=9909.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582135200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582128000
value1=10101.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582117200
value1=10091.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581908400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581901200
value1=9992.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581609600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581602400
value1=9819.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581516000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581508800
value1=9952.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581501600
value1=9931.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581415200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581408000
value1=9883.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581044400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581037200
value1=9821.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581026400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581019200
value1=9815.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581001200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580994000
value1=9797.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580994000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580986800
value1=9786.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580868000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580860800
value1=9564.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580691600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580508000
value1=9321.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580482800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1580472000
value1=9375.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580479200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580472000
value1=9375.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580299200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580292000
value1=9559.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580176800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580169600
value1=9341.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580133600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580126400
value1=9378.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580122800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580115600
value1=9416.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580115600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580108400
value1=9424.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580094000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580086800
value1=9437.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579867200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579860000
value1=9648.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579748400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579741200
value1=9521.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579615200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579608000
value1=9560.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579496400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579489200
value1=9712.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579482000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579298400
value1=9703.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579176000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579168800
value1=9573.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579003200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578996000
value1=9479.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578459600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578452400
value1=9463.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578312000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578304800
value1=9492.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578286800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578279600
value1=9548.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578063600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578056400
value1=9575.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578016800
value1=9740.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577973600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577966400
value1=9695.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577826000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577818800
value1=9528.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577811600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577804400
value1=9519.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577757600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577750400
value1=9595.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577736000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577728800
value1=9617.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577419200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577412000
value1=9707.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576522800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576515600
value1=9698.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21576522800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1576512000
value1=9697.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576249200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576242000
value1=9621.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576177200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576170000
value1=9507.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576155600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576148400
value1=9434.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576090800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576083600
value1=9420.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575982800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575975600
value1=9256.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575860400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575853200
value1=9379.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575673200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575666000
value1=9380.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575558000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575550800
value1=9326.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575349200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575342000
value1=9156.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575046800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575039600
value1=9400.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574874000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574866800
value1=9391.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574859600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574852400
value1=9382.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574852400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574845200
value1=9369.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574744400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574737200
value1=9351.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574701200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574694000
value1=9344.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574683200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574676000
value1=9332.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574424000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574416800
value1=9298.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574251200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574244000
value1=9160.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574172000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574164800
value1=9321.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573668000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573660800
value1=9160.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573635600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573628400
value1=9246.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573135200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573128000
value1=9477.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573128000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573120800
value1=9456.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572894000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572886800
value1=9429.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572465600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572458400
value1=9255.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571932800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571925600
value1=9445.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571918400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571911200
value1=9431.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571814000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571806800
value1=9292.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571792400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571785200
value1=9306.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571684400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571677200
value1=9422.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571320800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571313600
value1=9476.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571180400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571173200
value1=9376.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571166000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571158800
value1=9375.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571148000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571140800
value1=9337.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571140800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571133600
value1=9319.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571025600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571018400
value1=9264.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570834800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570827600
value1=9272.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570788000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570780800
value1=9126.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570755600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570748400
value1=9115.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570734000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570726800
value1=9119.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570485600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570478400
value1=9067.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570478400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570471200
value1=9054.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570096800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570089600
value1=8909.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569967200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569960000
value1=9135.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569960000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569952800
value1=9135.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569934800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569927600
value1=9291.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569852000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569844800
value1=9259.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569596400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569589200
value1=9200.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569427200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569420000
value1=9006.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569416400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569409200
value1=8996.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569006000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568998800
value1=9194.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568998800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568991600
value1=9184.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568988000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568980800
value1=9199.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568926800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568919600
value1=9138.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568912400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568905200
value1=9139.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568898000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568890800
value1=9125.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568808000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568800800
value1=8956.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568739600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568732400
value1=8977.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568732400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568725200
value1=8983.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568386800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568379600
value1=9145.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568199600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568192400
value1=9130.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568192400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568185200
value1=9111.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568152800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568145600
value1=9092.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567785600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567778400
value1=9031.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567710000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567702800
value1=8998.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567670400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567663200
value1=8952.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567598400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567591200
value1=8910.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567184400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567177200
value1=8860.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567087200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567080000
value1=8845.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567087200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1567080000
value1=8849.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566925200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566918000
value1=8770.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566795600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566788400
value1=8547.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566493200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566486000
value1=8806.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566352800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566345600
value1=8566.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566234000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566226800
value1=8761.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566216000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566208800
value1=8752.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566180000
value1=8716.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565892000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565881200
value1=8567.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565881200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565870400
value1=8402.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565838000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565830800
value1=8455.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565798400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565791200
value1=8519.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565697600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565690400
value1=8605.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565697600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565686800
value1=8602.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565661600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565654400
value1=8632.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565625600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565618400
value1=8667.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565064000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565056800
value1=8486.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565064000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565053200
value1=8475.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565046000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565038800
value1=8653.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564992000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564984800
value1=8749.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564614000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564606800
value1=8882.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564581600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564574400
value1=8942.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564556400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564549200
value1=8985.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564070400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564063200
value1=9457.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564063200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564056000
value1=9384.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564048800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564041600
value1=9375.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564002000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563994800
value1=9347.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563908400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563901200
value1=9304.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563901200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563894000
value1=9290.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563458400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563451200
value1=9171.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563447600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563440400
value1=9189.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563303600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563296400
value1=9385.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563292800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563285600
value1=9389.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562677200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562670000
value1=9223.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562580000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562572800
value1=9284.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562569200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562562000
value1=9289.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562353200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562346000
value1=9318.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562180400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562173200
value1=9400.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561975200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561968000
value1=9308.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561953600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561946400
value1=9293.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561122000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1561111200
value1=9287.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561028400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561021200
value1=9297.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560916800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560909600
value1=9264.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560891600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560884400
value1=9244.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560859200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560852000
value1=9062.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560816000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560808800
value1=9095.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559563200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559556000
value1=8904.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559325600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559318400
value1=8970.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559318400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559311200
value1=8984.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559311200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559304000
value1=8970.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558958400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1558951200
value1=9298.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558623600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558616400
value1=9109.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558353600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1558123200
value1=9313.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558094400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558087200
value1=9305.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557428400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557421200
value1=9072.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557162000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557154800
value1=9258.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556190000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556136000
value1=9418.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555527600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1555520400
value1=9578.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554462000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554408000
value1=9559.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554390000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554382800
value1=9528.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554310800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554303600
value1=9487.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553518800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553511600
value1=9139.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553511600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553284800
value1=9192.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553018400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553011200
value1=9538.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552935600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552928400
value1=9415.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552572000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552564800
value1=9273.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552572000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1552561200
value1=9289.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1552572000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1552561200
value1=9299.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552068000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552060800
value1=9104.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551891600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1551884400
value1=9350.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551456000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551448800
value1=9349.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1550512800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1550505600
value1=9169.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1550505600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1550498400
value1=9176.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1549652400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1549645200
value1=8819.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1549620000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1549566000
value1=8916.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549036800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1549026000
value1=8936.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548338400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1548331200
value1=9210.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548266400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1548259200
value1=9175.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548068400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547841600
value1=9078.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546966800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546959600
value1=8899.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546948800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546941600
value1=8866.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546948800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1546941600
value1=8870.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546862400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546855200
value1=8770.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545937200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545930000
value1=8278.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545937200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1545930000
value1=8274.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21545937200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1545926400
value1=8283.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545908400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545660000
value1=8486.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545400800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545393600
value1=8482.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545328800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545321600
value1=8583.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545163200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545156000
value1=8705.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545152400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545145200
value1=8717.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544814000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1544803200
value1=8914.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544472000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544464800
value1=8661.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544472000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1544461200
value1=8638.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544205600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1544194800
value1=8917.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544122800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544115600
value1=8737.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544122800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1544112000
value1=8765.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544007600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543953600
value1=8937.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543842000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543834800
value1=9244.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543492800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1543435200
value1=9207.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543320000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543312800
value1=9162.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543258800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543251600
value1=9102.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543237200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543230000
value1=9087.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542996000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1542985200
value1=8861.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542798000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542744000
value1=8883.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542736800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542729600
value1=8821.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542722400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542715200
value1=8891.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542214800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542207600
value1=9183.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541678400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541671200
value1=9205.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541602800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541595600
value1=9168.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541595600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541588400
value1=9172.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541178000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541170800
value1=9056.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540990800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1540983600
value1=8963.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540814400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1540580400
value1=8791.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1540299600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1540292400
value1=8674.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539957600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539950400
value1=8763.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539957600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1539950400
value1=8759.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539946800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539892800
value1=8821.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539878400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1539867600
value1=8886.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539864000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539856800
value1=9068.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539802800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1539792000
value1=8959.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539716400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539709200
value1=9102.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539601200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539374400
value1=8841.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539280800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1539270000
value1=9129.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539262800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539255600
value1=8998.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539003600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538996400
value1=9160.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538150400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538143200
value1=9324.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538150400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1538143200
value1=9320.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538049600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538042400
value1=9404.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537534800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537527600
value1=9654.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536685200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1536674400
value1=9206.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536339600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536332400
value1=9115.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536235200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536228000
value1=9213.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535972400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535742000
value1=9357.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535734800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535727600
value1=9393.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535648400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535641200
value1=9445.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535562000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535554800
value1=9496.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535457600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535403600
value1=9634.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535029200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535022000
value1=9619.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534878000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534870800
value1=9579.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534417200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534366800
value1=9380.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534176000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534168800
value1=9502.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533927600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533920400
value1=9563.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21533927600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1533916800
value1=9551.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533902400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533895200
value1=9622.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533236400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533229200
value1=9667.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533225600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533218400
value1=9668.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532707200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532700000
value1=9881.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531400400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531393200
value1=9701.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531152000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531144800
value1=9949.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530882000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1530874800
value1=9913.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530810000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1530802800
value1=9907.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530104400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1530097200
value1=9504.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529589600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1529578800
value1=9687.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529413200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529406000
value1=9629.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529337600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529330400
value1=9709.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529060400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529006400
value1=9991.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528822800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528815600
value1=9967.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528812000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528804800
value1=9954.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528750800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528743600
value1=9929.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528117200
value1=9834.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528124400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528117200
value1=9838.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527793200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527786000
value1=9411.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527771600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1527760800
value1=9652.300000
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
date1=1527627600
value1=9510.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527526800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527519600
value1=9729.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527526800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527519600
value1=9725.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527274800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527267600
value1=9773.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527091200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527084000
value1=9951.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526497200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526490000
value1=10092.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526490000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526482800
value1=10086.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526040000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526032800
value1=10290.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526040000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1526032800
value1=10294.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525953600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525946400
value1=10258.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525352400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525345200
value1=10103.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525341600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525291200
value1=10082.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524654000
value1=9797.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524517200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524510000
value1=9934.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524139200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524132000
value1=9895.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523008800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522954800
value1=9741.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522764000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1522753200
value1=9493.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522328400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522321200
value1=9663.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521813600
value1=9358.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521813600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521806400
value1=9337.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521813600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1521802800
value1=9320.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521748800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521741600
value1=9426.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521226800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521219600
value1=9798.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520953200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520946000
value1=9806.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520866800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520859600
value1=9753.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520020800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520013600
value1=9502.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519920000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519912800
value1=9715.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519729200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1519671600
value1=9936.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519650000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1519639200
value1=9900.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518724800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1518717600
value1=9667.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518703200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1518692400
value1=9833.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518105600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1518094800
value1=9805.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518084000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1518026400
value1=9997.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517940000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517932800
value1=9764.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517918400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517911200
value1=9716.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517598000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517590800
value1=10199.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517590800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517583600
value1=10227.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517400000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517392800
value1=10413.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517317200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517310000
value1=10465.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516708800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516701600
value1=10652.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516647600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516640400
value1=10606.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516640400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516633200
value1=10605.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516129200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516122000
value1=10565.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516114800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516107600
value1=10548.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515427200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515420000
value1=10447.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1514563200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1514556000
value1=10037.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1513339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1513332000
value1=10135.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512756000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512748800
value1=10378.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512054000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512046800
value1=10322.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511985600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511978400
value1=10306.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510844400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510837200
value1=10166.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510844400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1510833600
value1=10178.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510754400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510747200
value1=9902.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510311600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510257600
value1=10119.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510153200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510146000
value1=10160.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509973200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509966000
value1=10256.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509724800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509717600
value1=10300.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509724800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1509717600
value1=10296.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509717600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509710400
value1=10287.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509530400
value1=10606.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509465600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509458400
value1=10561.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21509465600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1509454800
value1=10576.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509120000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1509112800
value1=10183.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21508860800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1508850000
value1=10232.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1508263200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1508256000
value1=10303.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508180400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508173200
value1=10146.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507719600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507665600
value1=10320.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507201200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507147200
value1=9911.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507132800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507125600
value1=9984.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506603600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506596400
value1=10412.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506596400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506542400
value1=10403.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21506351600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1506340800
value1=10184.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506348000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506340800
value1=10184.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505930400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505923200
value1=10241.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505923200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505916000
value1=10240.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505224800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505217600
value1=10367.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505210400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505156400
value1=10376.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505134800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505127600
value1=10301.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504706400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504699200
value1=10122.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504692000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504638000
value1=10089.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504022400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504015200
value1=10150.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504011600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504004400
value1=10192.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H17
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654034400
date2=1654102800
value1=8905.900000
value2=8905.900000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L17
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654034400
date2=1654102800
value1=8799.000000
value2=8799.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H12
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652824800
date2=1652875200
value1=8535.800000
value2=8535.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L12
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652824800
date2=1652875200
value1=8456.100000
value2=8456.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H6
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654758000
date2=1654786800
value1=8833.600000
value2=8833.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L6
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654758000
date2=1654786800
value1=8768.600000
value2=8768.600000
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
date1=1654106400
date2=1654185600
value1=8796.500000
value2=8796.500000
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
date1=1654106400
date2=1654185600
value1=8728.500000
value2=8728.500000
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
date1=1654012800
date2=1654030800
value1=8875.900000
value2=8875.900000
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
date1=1654012800
date2=1654030800
value1=8810.900000
value2=8810.900000
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
date1=1654617600
date2=1654628400
value1=8843.800000
value2=8843.800000
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
date1=1654617600
date2=1654628400
value1=8829.800000
value2=8829.800000
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
date1=1654783200
date2=1654797600
value1=8758.100000
value2=8758.100000
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
date1=1654783200
date2=1654797600
value1=8705.600000
value2=8705.600000
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
date1=1654884000
date2=1655082000
value1=8430.800000
value2=8430.800000
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
date1=1654884000
date2=1655082000
value1=8374.600000
value2=8374.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H18
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650463200
date2=1650535200
value1=8809.000000
value2=8809.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L18
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650463200
date2=1650535200
value1=8714.500000
value2=8714.500000
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
date1=1649260800
date2=1649325600
value1=8522.200000
value2=8522.200000
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
date1=1649260800
date2=1649325600
value1=8436.500000
value2=8436.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H44
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1630494000
date2=1630652400
value1=9042.100000
value2=9042.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L44
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1630494000
date2=1630652400
value1=8952.700000
value2=8952.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H32
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1630890000
date2=1631005200
value1=8913.800000
value2=8913.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L32
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1630890000
date2=1631005200
value1=8810.400000
value2=8810.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H7
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654218000
date2=1654250400
value1=8822.100000
value2=8822.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L7
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654218000
date2=1654250400
value1=8779.100000
value2=8779.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H13
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652288400
date2=1652342400
value1=8309.700000
value2=8309.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L13
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652288400
date2=1652342400
value1=8142.800000
value2=8142.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H19
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651777200
date2=1651852800
value1=8447.100000
value2=8447.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L19
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651777200
date2=1651852800
value1=8316.800000
value2=8316.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H23
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653289200
date2=1653379200
value1=8637.300000
value2=8637.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L23
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653289200
date2=1653379200
value1=8510.700000
value2=8510.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H14
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654272000
date2=1654506000
value1=8775.200000
value2=8775.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L14
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654272000
date2=1654506000
value1=8707.700000
value2=8707.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H11
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654815600
date2=1654862400
value1=8674.500000
value2=8674.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L11
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654815600
date2=1654862400
value1=8553.300000
value2=8553.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H22
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647435600
date2=1647522000
value1=8475.000000
value2=8475.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L22
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647435600
date2=1647522000
value1=8286.800000
value2=8286.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H34
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1632859200
date2=1632981600
value1=8917.000000
value2=8917.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L34
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1632859200
date2=1632981600
value1=8746.600000
value2=8746.600000
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
date1=1653872400
date2=1653897600
value1=8970.200000
value2=8970.200000
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
date1=1653872400
date2=1653897600
value1=8930.500000
value2=8930.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H9
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654678800
date2=1654718400
value1=8850.800000
value2=8850.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L9
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654678800
date2=1654718400
value1=8786.600000
value2=8786.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H10
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654531200
date2=1654574400
value1=8849.900000
value2=8849.900000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L10
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1654531200
date2=1654574400
value1=8772.600000
value2=8772.600000
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
date1=1653922800
date2=1653984000
value1=8935.600000
value2=8935.600000
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
date1=1653922800
date2=1653984000
value1=8886.500000
value2=8886.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H24
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1637334000
date2=1637596800
value1=8834.200000
value2=8834.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L24
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1637334000
date2=1637596800
value1=8711.400000
value2=8711.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H30
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1637964000
date2=1638252000
value1=8560.100000
value2=8560.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L30
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1637964000
date2=1638252000
value1=8412.400000
value2=8412.400000
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
date1=1651014000
date2=1651096800
value1=8507.500000
value2=8507.500000
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
date1=1651014000
date2=1651096800
value1=8339.800000
value2=8339.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H26
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651575600
date2=1651676400
value1=8621.000000
value2=8621.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L26
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651575600
date2=1651676400
value1=8525.500000
value2=8525.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H25
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652922000
date2=1653019200
value1=8446.200000
value2=8446.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L25
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652922000
date2=1653019200
value1=8338.500000
value2=8338.500000
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
date1=1649952000
date2=1650333600
value1=8725.300000
value2=8725.300000
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
date1=1649952000
date2=1650333600
value1=8640.200000
value2=8640.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H29
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1642197600
date2=1642485600
value1=8866.600000
value2=8866.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L29
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1642197600
date2=1642485600
value1=8797.700000
value2=8797.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H28
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646625600
date2=1646733600
value1=7770.200000
value2=7770.200000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L28
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646625600
date2=1646733600
value1=7282.600000
value2=7282.600000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H31
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646848800
date2=1646967600
value1=8202.800000
value2=8202.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L31
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646848800
date2=1646967600
value1=7992.300000
value2=7992.300000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H38
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646168400
date2=1646305200
value1=8371.900000
value2=8371.900000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L38
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1646168400
date2=1646305200
value1=8074.100000
value2=8074.100000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H40
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647010800
date2=1647331200
value1=8311.900000
value2=8311.900000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L40
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647010800
date2=1647331200
value1=8055.800000
value2=8055.800000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H27
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648573200
date2=1648670400
value1=8639.400000
value2=8639.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L27
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648573200
date2=1648670400
value1=8507.700000
value2=8507.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H37
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649775600
date2=1649908800
value1=8627.400000
value2=8627.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L37
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649775600
date2=1649908800
value1=8495.700000
value2=8495.700000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H42
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652428800
date2=1652756400
value1=8416.400000
value2=8416.400000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L42
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652428800
date2=1652756400
value1=8232.500000
value2=8232.500000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H23401
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1655096400
date2=1655139600
value1=8300.000000
value2=8300.000000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L23401
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1655096400
date2=1655139600
value1=8163.300000
value2=8163.300000
</object>

</window>

<window>
height=33.835648
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
height=16.369545
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

<window>
height=18.066036
objects=0

<indicator>
name=Custom Indicator
path=Indicators\Posible Direccion.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.890000
scale_fix_min=0
scale_fix_min_val=0.780000
scale_fix_max=1
scale_fix_max_val=1.000000
expertmode=0
fixed_height=-1

<graph>
name=Color_Histogram
draw=11
style=0
width=2
arrow=251
color=255,3329330,65535,16711935
</graph>
<inputs>
Evaluacion=10
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=7
TriggerUp=0.05
TriggerDown=-0.05
</inputs>
</indicator>
</window>
</chart>