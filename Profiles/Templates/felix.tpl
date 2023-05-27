<chart>
id=132705018871738657
symbol=Crash 1000 Index
description=On average 1 drop occurs in the price series every 1000 ticks
period_type=0
period_size=5
digits=4
tick_size=0.000000
position_time=1625870100
scale_fix=0
scale_fixed_min=8712.334000
scale_fixed_max=8876.804000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=8
mode=1
fore=0
grid=0
volume=0
scroll=0
shift=1
shift_size=19.246862
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=1
one_click_btn=1
bidline=1
askline=1
lastline=0
days=1
descriptions=1
tradelines=1
tradehistory=1
window_left=78
window_top=78
window_right=1773
window_bottom=691
window_type=3
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
windows_total=2

<window>
height=166.731363
objects=991

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
path=Indicators\INDICADOR BOOM CRASH (2).ex5
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
name=SELL SEÑAL
draw=0
style=0
width=2
color=255
</graph>

<graph>
name=BUY SEÑAL
draw=0
style=0
width=2
color=32768
</graph>

<graph>
name=EMA-FAST
draw=0
style=0
width=1
color=16776960
</graph>

<graph>
name=EMA-SLOW
draw=0
style=0
width=1
color=16776960
</graph>

<graph>
name=SELL PRESEÑAL
draw=0
style=0
width=2
color=255
</graph>

<graph>
name=BUY PRESEÑAL
draw=0
style=0
width=2
color=32768
</graph>

<graph>
name=EMA-TOQUE 1
draw=0
style=0
width=1
color=16711935
</graph>

<graph>
name=EMA-TOQUE 2
draw=0
style=0
width=1
color=16711935
</graph>
<inputs>
ColorResSop=16776960
Ind0=-------------------- CONFIGURACION SEÑALES ------------------------
Signal_Pattern_Arrow=false
Cruce_de_Emas=false
Sincronizacion=false
ToquesEmas_F=false
Caza_Spike=true
Ind0__=-------------------- CONFIGURACION FLECHAS Y TEXTO ------------------------
Size_Flecha=2
Size_Texto=8
EspacioFlecha_CRASH_500=1000
EspacioFlecha_CRASH_1000=1000
EspacioFlecha_BOOM_500=1000
EspacioFlecha_BOOM_1000=1000
Ind0___=................................................................
EspacioTexto_CRASH_500=2000
EspacioTexto_CRASH_1000=2000
EspacioTexto_BOOM_500=2000
EspacioTexto_BOOM_1000=2000
ColorTexto=16776960
ColorFlechasUP=32768
ColorFlechasDN=255
Ind0_=-------------------- CONFIGURACION ALERTAS ------------------------
AlertaPC=true
AlertaMovil=true
AlertaMail=true
SonidoPre=alert2.wav
SonidoSe=alert.wav
Ind1=-------------------- CRONEX ------------------------
Nombre_Indicador_1=PROYECTO LUIS/cronex_MACD_Trend Impulse (2)
MACD_CRONEX=34
CRONEX=9
Ind2=-------------------- ARROWS ------------------------
Nombre_Indicador_2=PROYECTO LUIS/Boom Crash - RSI-Strike - 2021 MT5 (1)
tres_=2
RSI_Period2=4
RSI_Price1=1
RSI_Precie=1
cuatro_=3
RSI_Period4=6
RSI_Price3=1
RSI_Price4=1
cinco=4
RSI_Period5=8
RSI_Price5=1
RSI_Price6=1
nueve_=5
RSI_Period8=10
RSI_Price7=1
RSI_Price8=1
Ind3=-------------------- TREND TMA ------------------------
Nombre_Indicador_3=PROYECTO LUIS/WT_SuperT-MA_v4.7(1) (1)
EsquinaPublicidad=0
S1=-----------------------------------------------
TimeFrame=0
TipoMA=0
Tipo_Precio=1
PeriodosMA=20
S2=-------------------------------------------------------
PeriodosATR=110
Multiplicador=2.6
S3=-------------------------------------------------------
MaxVelasHistorico=1000
Ind3_=-------------------- PZ VOLUMETER ------------------------
Nombre_Indicador_5=PROYECTO LUIS/PZ_Volatmeter
Fast_Period_Volumeter=5
Slow_Period_Volumeter=10
Max_History_Bars=5000
S6=-----------------------   CONFIGURACION MEDIAS MOVILES (Cruce Emas)  ---------------------
VisualizarEma_Fast=true
VisualizarEma_Slow=true
Fast_Periodo=14
Fast_Shift=0
Fast_Ma_Method=1
Fast_AppliedPrice=1
Slow_Periodo=50
Slow_Shift=0
Slow_Ma_Method=1
Slow_AppliedPrice=1
S6_=-----------------------   CONFIGURACION MEDIAS MOVILES (Toque Ema)  ---------------------
Traspaso_CRASH_500=5000
Traspaso_CRASH_1000=5000
Traspaso_BOOM_500=5000
Traspaso_BOOM_1000=5000
MultiplicadorSizeSpikeMinimo=16
MultiplicadorSizeSpikeMinimoRompimiento=10
VisualizarEma_Toque1=true
VisualizarEma_Toque2=true
Periodo_Toque1=100
Shift_Toque1=0
Ma_Method_Toque1=1
AppliedPrice_Toque1=1
Periodo_Toque2=200
Shift_Toque2=0
Ma_Method_Toque2=1
AppliedPrice_Toque2=1
S7=-----------------------   VOLUMEN M5  ---------------------
Nombre_Indicador_4=waddah_attar_explosion
Fast_MA=20
Slow_MA=40
BBPeriod=20
BBDeviation=2
Sensetive=150
DeadZonePip=400
ExplosionPower=15
TrendPower=150
AlertWindow=false
AlertCount=2
AlertLong=false
AlertShort=false
AlertExitLong=false
AlertExitShort=false
IndicatorLevel=20
Show_Alert=true
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\PROYECTO LUIS\WT_SuperT-MA_v4.7(1) (1).ex5
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
name=WT_SuperT-MA Linea ATR Superior
draw=1
style=2
width=1
color=255
</graph>

<graph>
name=WT_SuperT-MA Linea ATR Inferior
draw=1
style=2
width=1
color=32768
</graph>

<graph>
name=WT_SuperT-MA
draw=10
style=0
width=2
color=255,32768
</graph>
<inputs>
creadoPor=0
esquinaPublicidad=0
separador_00=------------------------------------------------------------------------
timeFrame=0
tipoMA=0
tipoPrecioAplicado=1
periodosMA=20
separador_01=------------------------------------------------------------------------
mostrarLineas_ATR=false
periodosATR=110
multiplicadorATR=2.6
separador_02=------------------------------------------------------------------------
maxVelasHistorico=1000
</inputs>
</indicator>
<object>
type=2
name=Patron 2021S Linea2021.06.24 16:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624550700
date2=1624555200
value1=9867.740000
value2=9867.740000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 16:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624552800
date2=1624557300
value1=9852.643000
value2=9852.643000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 17:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624554600
date2=1624559100
value1=9846.432000
value2=9846.432000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 17:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624554900
date2=1624559400
value1=9852.459000
value2=9852.459000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 17:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624556400
date2=1624560900
value1=9847.596000
value2=9847.596000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 17:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624557300
date2=1624561800
value1=9831.643000
value2=9831.643000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 19:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624561200
date2=1624565700
value1=9843.949000
value2=9843.949000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 19:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624562100
date2=1624566600
value1=9816.478000
value2=9816.478000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 19:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624564200
date2=1624568700
value1=9817.912000
value2=9817.912000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.24 20:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624565700
value1=9820.676000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624565700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624565700
value1=9820.876000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 20:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624567500
date2=1624572000
value1=9815.722000
value2=9815.722000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 20:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624567800
date2=1624572300
value1=9799.821000
value2=9799.821000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.24 21:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624568400
date2=1624572900
value1=9794.568000
value2=9794.568000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.24 21:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624569300
value1=9797.276000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624569300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624569300
value1=9797.476000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 00:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624581300
date2=1624585800
value1=9880.031000
value2=9880.031000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 01:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624583100
date2=1624587600
value1=9864.833000
value2=9864.833000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 01:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624583400
date2=1624587900
value1=9871.521000
value2=9871.521000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 02:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624586700
date2=1624591200
value1=9868.673000
value2=9868.673000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 02:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624587600
date2=1624592100
value1=9837.630000
value2=9837.630000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 02:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624588200
date2=1624592700
value1=9824.829000
value2=9824.829000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 02:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624588800
value1=9825.540000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624588800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624588800
value1=9825.740000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 03:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624591500
date2=1624596000
value1=9845.616000
value2=9845.616000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 03:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624593300
date2=1624597800
value1=9807.069000
value2=9807.069000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 04:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624594800
date2=1624599300
value1=9797.612000
value2=9797.612000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 04:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624595100
date2=1624599600
value1=9787.954000
value2=9787.954000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 06:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624602300
date2=1624606800
value1=9804.075000
value2=9804.075000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 06:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624603800
value1=9806.802000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624603800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624603800
value1=9807.002000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 08:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624611300
date2=1624615800
value1=9845.822000
value2=9845.822000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 09:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624611900
date2=1624616400
value1=9827.546000
value2=9827.546000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 09:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624613100
date2=1624617600
value1=9819.594000
value2=9819.594000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 09:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624613700
date2=1624618200
value1=9809.818000
value2=9809.818000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 10:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624615500
value1=9811.054000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624615500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624615500
value1=9811.254000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 10:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624617000
date2=1624621500
value1=9803.153000
value2=9803.153000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 10:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624618200
date2=1624622700
value1=9792.151000
value2=9792.151000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 10:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624618500
date2=1624623000
value1=9782.718000
value2=9782.718000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 11:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624618800
date2=1624623300
value1=9792.151000
value2=9792.151000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 11:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624620900
date2=1624625400
value1=9775.978000
value2=9775.978000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 11:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624621200
date2=1624625700
value1=9739.675000
value2=9739.675000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 11:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624621800
value1=9741.425000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624621800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624621800
value1=9741.625000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 12:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624625700
date2=1624630200
value1=9758.940000
value2=9758.940000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 13:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624626300
date2=1624630800
value1=9755.314000
value2=9755.314000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 13:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624627800
date2=1624632300
value1=9754.524000
value2=9754.524000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 14:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624630200
date2=1624634700
value1=9742.204000
value2=9742.204000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 14:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624630500
date2=1624635000
value1=9733.597000
value2=9733.597000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 14:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624630800
date2=1624635300
value1=9742.204000
value2=9742.204000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 14:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624631400
date2=1624635900
value1=9722.580000
value2=9722.580000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 15:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624635300
date2=1624639800
value1=9730.625000
value2=9730.625000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 15:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624636200
date2=1624640700
value1=9718.384000
value2=9718.384000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 16:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624636800
date2=1624641300
value1=9712.606000
value2=9712.606000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 16:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624637100
date2=1624641600
value1=9690.828000
value2=9690.828000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 16:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624637400
date2=1624641900
value1=9712.606000
value2=9712.606000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 16:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624639200
date2=1624643700
value1=9681.792000
value2=9681.792000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 16:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624639800
value1=9682.557000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624639800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624639800
value1=9682.757000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 18:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624645800
date2=1624650300
value1=9704.357000
value2=9704.357000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 18:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624646700
date2=1624651200
value1=9686.514000
value2=9686.514000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 18:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624647300
value1=9688.597000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624647300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624647300
value1=9688.797000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 19:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624648800
date2=1624653300
value1=9690.883000
value2=9690.883000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 20:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624651200
date2=1624655700
value1=9689.949000
value2=9689.949000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.25 20:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624654200
date2=1624658700
value1=9679.603000
value2=9679.603000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.25 21:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624655700
value1=9679.737000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624655700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624655700
value1=9679.937000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 03:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624677600
date2=1624682100
value1=9789.511000
value2=9789.511000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 03:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624678800
value1=9790.880000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624678800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624678800
value1=9791.080000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 06:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624687500
date2=1624692000
value1=9853.034000
value2=9853.034000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 06:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624688100
value1=9855.375000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624688100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624688100
value1=9855.575000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 06:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624688700
date2=1624693200
value1=9855.275000
value2=9855.275000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 06:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624689300
date2=1624693800
value1=9845.315000
value2=9845.315000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 06:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624689900
value1=9846.430000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624689900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624689900
value1=9846.630000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624691700
date2=1624696200
value1=9838.481000
value2=9838.481000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 07:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624692000
value1=9840.635000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624692000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624692000
value1=9840.835000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 07:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624692600
date2=1624697100
value1=9840.560000
value2=9840.560000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 07:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624693800
value1=9840.867000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624693800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624693800
value1=9841.067000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 08:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624694700
date2=1624699200
value1=9832.085000
value2=9832.085000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 08:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624695900
value1=9833.890000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624695900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624695900
value1=9834.090000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 09:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624698300
date2=1624702800
value1=9840.089000
value2=9840.089000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 09:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624698600
value1=9840.217000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624698600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624698600
value1=9840.417000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 09:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624700400
date2=1624704900
value1=9840.036000
value2=9840.036000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 10:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624701600
date2=1624706100
value1=9839.935000
value2=9839.935000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624702800
date2=1624707300
value1=9837.226000
value2=9837.226000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 10:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624703700
date2=1624708200
value1=9832.082000
value2=9832.082000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 10:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624704600
date2=1624709100
value1=9824.098000
value2=9824.098000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 11:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624705800
value1=9824.883000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624705800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624705800
value1=9825.083000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 11:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624708200
date2=1624712700
value1=9825.370000
value2=9825.370000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 11:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624708500
date2=1624713000
value1=9837.694000
value2=9837.694000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 12:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624711200
value1=9840.417000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624711200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624711200
value1=9840.617000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 13:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624712700
date2=1624717200
value1=9840.994000
value2=9840.994000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 13:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624715100
date2=1624719600
value1=9815.877000
value2=9815.877000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 14:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624716000
value1=9816.028000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624716000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624716000
value1=9816.228000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 16:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624725600
date2=1624730100
value1=9868.889000
value2=9868.889000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 16:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624726200
date2=1624730700
value1=9857.159000
value2=9857.159000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 16:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624726500
date2=1624731000
value1=9848.175000
value2=9848.175000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 18:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624731600
date2=1624736100
value1=9853.675000
value2=9853.675000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 18:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624731900
date2=1624736400
value1=9825.768000
value2=9825.768000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 18:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624732500
value1=9826.056000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624732500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624732500
value1=9826.256000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 19:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624734300
date2=1624738800
value1=9832.935000
value2=9832.935000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 19:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624735500
value1=9835.708000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624735500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624735500
value1=9835.908000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 20:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624737900
date2=1624742400
value1=9848.595000
value2=9848.595000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 20:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624739100
date2=1624743600
value1=9842.873000
value2=9842.873000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 20:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624739400
date2=1624743900
value1=9846.681000
value2=9846.681000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 20:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624739700
date2=1624744200
value1=9846.681000
value2=9846.681000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.26 23:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624749000
date2=1624753500
value1=9816.438000
value2=9816.438000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.26 23:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624749900
value1=9817.619000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624749900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624749900
value1=9817.819000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 00:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624752000
date2=1624756500
value1=9828.421000
value2=9828.421000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 00:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624752900
date2=1624757400
value1=9824.614000
value2=9824.614000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 00:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624753800
date2=1624758300
value1=9816.679000
value2=9816.679000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 00:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624754400
date2=1624758900
value1=9813.359000
value2=9813.359000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 01:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624756200
value1=9815.385000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624756200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624756200
value1=9815.585000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 01:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624758000
date2=1624762500
value1=9810.985000
value2=9810.985000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 02:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624759500
date2=1624764000
value1=9804.530000
value2=9804.530000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 02:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624762500
date2=1624767000
value1=9807.496000
value2=9807.496000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 03:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624762800
date2=1624767300
value1=9789.899000
value2=9789.899000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 03:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624763100
value1=9791.763000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624763100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624763100
value1=9791.963000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 03:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624763700
date2=1624768200
value1=9791.672000
value2=9791.672000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 03:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624764000
date2=1624768500
value1=9780.171000
value2=9780.171000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 03:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624764900
date2=1624769400
value1=9777.583000
value2=9777.583000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 03:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624766100
value1=9779.515000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624766100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624766100
value1=9779.715000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 04:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624769100
date2=1624773600
value1=9795.419000
value2=9795.419000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 04:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624769700
date2=1624774200
value1=9779.575000
value2=9779.575000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 05:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624770600
date2=1624775100
value1=9746.171000
value2=9746.171000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 08:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624782600
date2=1624787100
value1=9800.973000
value2=9800.973000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 09:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624785300
date2=1624789800
value1=9789.094000
value2=9789.094000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 09:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624785600
date2=1624790100
value1=9780.697000
value2=9780.697000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 09:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624785900
date2=1624790400
value1=9789.094000
value2=9789.094000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 09:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624787400
date2=1624791900
value1=9784.469000
value2=9784.469000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 09:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624787700
value1=9784.973000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624787700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624787700
value1=9785.173000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 10:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624788300
date2=1624792800
value1=9784.899000
value2=9784.899000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624789200
date2=1624793700
value1=9775.504000
value2=9775.504000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 10:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624790700
date2=1624795200
value1=9770.189000
value2=9770.189000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 11:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624791600
date2=1624796100
value1=9751.282000
value2=9751.282000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 11:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624791900
date2=1624796400
value1=9743.935000
value2=9743.935000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 11:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624792200
date2=1624796700
value1=9751.282000
value2=9751.282000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 12:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624797300
date2=1624801800
value1=9758.529000
value2=9758.529000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 12:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624798500
value1=9761.425000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624798500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624798500
value1=9761.625000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 14:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624804500
date2=1624809000
value1=9763.151000
value2=9763.151000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 14:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624805100
date2=1624809600
value1=9754.712000
value2=9754.712000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 15:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624806300
value1=9756.848000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624806300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624806300
value1=9757.048000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 16:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624811400
date2=1624815900
value1=9784.255000
value2=9784.255000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 18:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624817700
date2=1624822200
value1=9784.446000
value2=9784.446000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 19:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624821600
date2=1624826100
value1=9785.468000
value2=9785.468000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 19:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624821900
date2=1624826400
value1=9788.213000
value2=9788.213000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 19:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624823400
date2=1624827900
value1=9759.447000
value2=9759.447000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 20:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624827000
date2=1624831500
value1=9741.032000
value2=9741.032000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 20:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624827300
date2=1624831800
value1=9745.377000
value2=9745.377000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 21:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624828500
date2=1624833000
value1=9723.488000
value2=9723.488000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.27 21:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624829400
value1=9724.728000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624829400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624829400
value1=9724.928000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 22:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624832700
date2=1624837200
value1=9733.025000
value2=9733.025000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 22:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624833000
date2=1624837500
value1=9720.579000
value2=9720.579000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 22:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624833300
date2=1624837800
value1=9733.025000
value2=9733.025000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 23:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624836600
date2=1624841100
value1=9721.169000
value2=9721.169000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.27 23:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624837500
date2=1624842000
value1=9719.476000
value2=9719.476000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 00:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624838400
value1=9722.044000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624838400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624838400
value1=9722.244000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 01:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624842600
date2=1624847100
value1=9750.498000
value2=9750.498000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 01:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624843200
date2=1624847700
value1=9717.888000
value2=9717.888000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 01:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624845000
date2=1624849500
value1=9710.368000
value2=9710.368000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 01:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624845300
date2=1624849800
value1=9695.155000
value2=9695.155000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624845600
date2=1624850100
value1=9710.368000
value2=9710.368000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 02:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624847400
date2=1624851900
value1=9681.779000
value2=9681.779000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 02:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624847700
date2=1624852200
value1=9661.072000
value2=9661.072000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 02:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624848000
date2=1624852500
value1=9681.779000
value2=9681.779000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 04:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624852800
date2=1624857300
value1=9676.334000
value2=9676.334000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 04:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624853700
date2=1624858200
value1=9668.016000
value2=9668.016000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 04:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624854900
date2=1624859400
value1=9648.242000
value2=9648.242000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 04:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624855500
value1=9649.644000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624855500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624855500
value1=9649.844000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 07:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624866900
date2=1624871400
value1=9728.255000
value2=9728.255000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 08:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624867200
date2=1624871700
value1=9718.802000
value2=9718.802000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 08:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624869600
value1=9720.096000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624869600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624869600
value1=9720.296000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 10:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624875000
date2=1624879500
value1=9752.218000
value2=9752.218000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 10:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624875300
date2=1624879800
value1=9747.924000
value2=9747.924000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624875600
date2=1624880100
value1=9752.218000
value2=9752.218000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 11:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624879500
date2=1624884000
value1=9769.444000
value2=9769.444000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 11:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624879800
date2=1624884300
value1=9747.328000
value2=9747.328000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 11:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624881300
value1=9750.052000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624881300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624881300
value1=9750.252000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 13:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624887300
date2=1624891800
value1=9783.602000
value2=9783.602000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 13:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624887600
date2=1624892100
value1=9770.612000
value2=9770.612000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 13:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624888200
value1=9772.420000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624888200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624888200
value1=9772.620000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 14:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624890000
date2=1624894500
value1=9777.361000
value2=9777.361000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 14:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624891200
date2=1624895700
value1=9763.530000
value2=9763.530000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 14:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624891500
date2=1624896000
value1=9748.118000
value2=9748.118000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 16:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624899000
date2=1624903500
value1=9782.016000
value2=9782.016000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 17:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624900500
date2=1624905000
value1=9770.981000
value2=9770.981000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 17:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624900800
date2=1624905300
value1=9752.839000
value2=9752.839000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 17:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624901100
date2=1624905600
value1=9770.981000
value2=9770.981000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 18:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624904400
date2=1624908900
value1=9765.522000
value2=9765.522000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 19:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624906800
date2=1624911300
value1=9767.128000
value2=9767.128000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 19:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624907700
date2=1624912200
value1=9761.937000
value2=9761.937000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 19:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624908300
date2=1624912800
value1=9748.090000
value2=9748.090000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 19:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624908600
value1=9749.405000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624908600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624908600
value1=9749.605000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 19:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624909800
date2=1624914300
value1=9746.656000
value2=9746.656000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 20:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624911000
date2=1624915500
value1=9742.107000
value2=9742.107000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 20:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624912200
value1=9744.907000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624912200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624912200
value1=9745.107000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 20:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624913100
date2=1624917600
value1=9747.842000
value2=9747.842000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 21:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624914300
date2=1624918800
value1=9730.285000
value2=9730.285000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 21:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624915500
value1=9731.494000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624915500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624915500
value1=9731.694000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624918200
date2=1624922700
value1=9737.241000
value2=9737.241000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624918500
date2=1624923000
value1=9742.774000
value2=9742.774000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624919100
date2=1624923600
value1=9717.205000
value2=9717.205000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624919400
date2=1624923900
value1=9709.946000
value2=9709.946000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624920600
date2=1624925100
value1=9692.702000
value2=9692.702000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 22:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624920900
date2=1624925400
value1=9676.112000
value2=9676.112000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.28 23:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624921200
date2=1624925700
value1=9692.702000
value2=9692.702000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.28 23:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624924500
value1=9693.301000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624924500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624924500
value1=9693.501000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 00:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624927500
date2=1624932000
value1=9694.744000
value2=9694.744000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 00:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624928100
value1=9697.584000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624928100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624928100
value1=9697.784000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 01:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624928700
date2=1624933200
value1=9697.495000
value2=9697.495000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 01:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624929300
date2=1624933800
value1=9681.233000
value2=9681.233000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 01:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624930200
date2=1624934700
value1=9667.570000
value2=9667.570000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 01:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624930800
date2=1624935300
value1=9648.540000
value2=9648.540000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 01:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624931100
date2=1624935600
value1=9641.105000
value2=9641.105000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624932000
date2=1624936500
value1=9638.094000
value2=9638.094000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 02:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624932300
date2=1624936800
value1=9605.176000
value2=9605.176000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 02:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624933800
value1=9605.714000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624933800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624933800
value1=9605.914000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 03:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624937100
date2=1624941600
value1=9613.999000
value2=9613.999000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 03:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624937400
date2=1624941900
value1=9628.041000
value2=9628.041000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 04:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624941300
date2=1624945800
value1=9609.520000
value2=9609.520000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 04:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624941300
value1=9612.160000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624941300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624941300
value1=9612.360000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 05:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624944300
date2=1624948800
value1=9619.961000
value2=9619.961000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 05:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624944600
date2=1624949100
value1=9612.444000
value2=9612.444000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 05:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624946100
date2=1624950600
value1=9612.676000
value2=9612.676000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 06:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624946700
value1=9615.550000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624946700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624946700
value1=9615.750000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 06:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624947600
date2=1624952100
value1=9618.283000
value2=9618.283000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 06:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624948800
date2=1624953300
value1=9611.402000
value2=9611.402000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 07:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624950600
date2=1624955100
value1=9592.676000
value2=9592.676000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624950900
date2=1624955400
value1=9567.243000
value2=9567.243000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 07:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624952100
value1=9569.167000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624952100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624952100
value1=9569.367000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 08:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624954200
date2=1624958700
value1=9583.572000
value2=9583.572000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 08:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624954500
date2=1624959000
value1=9554.233000
value2=9554.233000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 08:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624955700
date2=1624960200
value1=9551.539000
value2=9551.539000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 11:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624964400
date2=1624968900
value1=9575.386000
value2=9575.386000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 11:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624964700
value1=9575.604000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624964700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624964700
value1=9575.804000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 12:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624968900
date2=1624973400
value1=9596.523000
value2=9596.523000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 12:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624969800
value1=9596.884000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624969800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624969800
value1=9597.084000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 13:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624972500
date2=1624977000
value1=9593.373000
value2=9593.373000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 13:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624973100
date2=1624977600
value1=9589.900000
value2=9589.900000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 13:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624973400
date2=1624977900
value1=9575.747000
value2=9575.747000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 13:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624973400
value1=9578.232000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624973400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624973400
value1=9578.432000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 13:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624974000
date2=1624978500
value1=9578.135000
value2=9578.135000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 13:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624974300
date2=1624978800
value1=9573.218000
value2=9573.218000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 13:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624974600
value1=9574.897000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624974600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624974600
value1=9575.097000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 14:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624977600
date2=1624982100
value1=9590.641000
value2=9590.641000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 15:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624979100
date2=1624983600
value1=9581.651000
value2=9581.651000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 15:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624980000
date2=1624984500
value1=9560.410000
value2=9560.410000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 15:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624980600
value1=9561.129000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624980600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624980600
value1=9561.329000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 16:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624982700
date2=1624987200
value1=9561.444000
value2=9561.444000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 16:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1624983000
value1=9564.194000
</object>

<object>
type=101
name=Patron 2021S CAZ S1624983000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1624983000
value1=9564.394000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 18:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624992300
date2=1624996800
value1=9613.265000
value2=9613.265000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 19:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624993500
date2=1624998000
value1=9607.042000
value2=9607.042000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 19:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624994700
date2=1624999200
value1=9598.969000
value2=9598.969000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 20:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624997400
date2=1625001900
value1=9607.517000
value2=9607.517000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 20:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624997700
date2=1625002200
value1=9591.342000
value2=9591.342000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 21:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625000400
date2=1625004900
value1=9586.097000
value2=9586.097000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 21:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625000700
date2=1625005200
value1=9579.197000
value2=9579.197000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 21:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625001600
value1=9580.127000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625001600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625001600
value1=9580.327000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 22:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625007000
date2=1625011500
value1=9613.963000
value2=9613.963000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.29 23:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625008500
value1=9615.479000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625008500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625008500
value1=9615.679000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.29 23:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625010600
date2=1625015100
value1=9625.391000
value2=9625.391000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 00:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625011200
date2=1625015700
value1=9620.897000
value2=9620.897000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 00:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625012100
date2=1625016600
value1=9605.818000
value2=9605.818000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 00:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625013300
date2=1625017800
value1=9595.446000
value2=9595.446000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 01:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625016600
date2=1625021100
value1=9607.415000
value2=9607.415000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625018400
date2=1625022900
value1=9566.558000
value2=9566.558000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 02:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625019600
value1=9567.557000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625019600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625019600
value1=9567.757000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 02:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625021100
date2=1625025600
value1=9563.911000
value2=9563.911000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 03:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625022000
date2=1625026500
value1=9553.105000
value2=9553.105000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 03:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625022300
date2=1625026800
value1=9542.181000
value2=9542.181000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 03:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625022600
value1=9543.045000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625022600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625022600
value1=9543.245000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 04:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625028300
date2=1625032800
value1=9575.118000
value2=9575.118000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 04:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625028300
value1=9575.846000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625028300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625028300
value1=9576.046000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 04:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625028900
date2=1625033400
value1=9575.753000
value2=9575.753000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 05:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625029200
date2=1625033700
value1=9559.679000
value2=9559.679000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 05:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625030100
date2=1625034600
value1=9558.689000
value2=9558.689000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 05:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625031300
date2=1625035800
value1=9554.758000
value2=9554.758000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 06:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625033400
date2=1625037900
value1=9522.598000
value2=9522.598000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 06:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625033700
date2=1625038200
value1=9505.951000
value2=9505.951000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 08:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625040000
date2=1625044500
value1=9512.483000
value2=9512.483000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 08:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625040900
date2=1625045400
value1=9507.044000
value2=9507.044000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 08:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625041500
date2=1625046000
value1=9502.766000
value2=9502.766000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 09:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625046900
date2=1625051400
value1=9488.727000
value2=9488.727000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 10:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625047200
date2=1625051700
value1=9496.547000
value2=9496.547000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 10:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625047800
date2=1625052300
value1=9476.187000
value2=9476.187000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 10:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625048400
value1=9476.912000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625048400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625048400
value1=9477.112000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 10:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625050500
date2=1625055000
value1=9486.858000
value2=9486.858000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 11:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625052900
date2=1625057400
value1=9454.054000
value2=9454.054000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 11:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625053200
date2=1625057700
value1=9462.271000
value2=9462.271000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 12:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625054400
value1=9463.535000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625054400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625054400
value1=9463.735000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 12:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625057400
date2=1625061900
value1=9469.183000
value2=9469.183000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 13:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625058600
value1=9469.310000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625058600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625058600
value1=9469.510000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 13:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625060100
date2=1625064600
value1=9472.523000
value2=9472.523000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 13:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625061000
value1=9474.857000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625061000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625061000
value1=9475.057000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 14:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625061600
date2=1625066100
value1=9474.769000
value2=9474.769000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625061900
date2=1625066400
value1=9460.550000
value2=9460.550000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 14:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625062800
value1=9463.362000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625062800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625062800
value1=9463.562000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 15:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625065500
date2=1625070000
value1=9467.913000
value2=9467.913000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 15:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625065800
date2=1625070300
value1=9480.133000
value2=9480.133000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 15:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625067300
date2=1625071800
value1=9451.489000
value2=9451.489000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 16:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625070300
date2=1625074800
value1=9450.056000
value2=9450.056000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 16:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625070600
date2=1625075100
value1=9436.593000
value2=9436.593000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 16:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625071200
value1=9439.139000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625071200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625071200
value1=9439.339000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 16:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625071800
date2=1625076300
value1=9439.044000
value2=9439.044000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 17:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625074200
date2=1625078700
value1=9432.804000
value2=9432.804000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 17:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625075400
date2=1625079900
value1=9427.735000
value2=9427.735000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 18:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625076300
value1=9428.361000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625076300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625076300
value1=9428.561000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 18:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625077800
date2=1625082300
value1=9427.974000
value2=9427.974000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 18:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625078100
value1=9429.439000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625078100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625078100
value1=9429.639000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 19:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625082000
date2=1625086500
value1=9441.583000
value2=9441.583000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 19:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625082900
date2=1625087400
value1=9438.526000
value2=9438.526000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 20:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625083200
date2=1625087700
value1=9429.002000
value2=9429.002000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 20:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625084700
date2=1625089200
value1=9426.644000
value2=9426.644000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 20:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625085300
value1=9428.288000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625085300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625085300
value1=9428.488000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 20:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625085900
date2=1625090400
value1=9428.207000
value2=9428.207000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 21:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625088300
date2=1625092800
value1=9423.930000
value2=9423.930000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 21:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625088900
date2=1625093400
value1=9414.327000
value2=9414.327000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 21:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625089800
date2=1625094300
value1=9405.152000
value2=9405.152000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 21:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625090100
date2=1625094600
value1=9393.879000
value2=9393.879000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 22:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625093700
date2=1625098200
value1=9392.495000
value2=9392.495000
</object>

<object>
type=2
name=Patron 2021S Linea2021.06.30 23:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625095200
date2=1625099700
value1=9385.565000
value2=9385.565000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.06.30 23:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625095800
value1=9386.204000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625095800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625095800
value1=9386.404000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 00:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625098200
date2=1625102700
value1=9394.063000
value2=9394.063000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 00:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625098500
date2=1625103000
value1=9376.693000
value2=9376.693000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 00:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625099700
date2=1625104200
value1=9375.938000
value2=9375.938000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 00:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625100600
value1=9378.444000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625100600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625100600
value1=9378.644000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 01:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625101200
date2=1625105700
value1=9378.354000
value2=9378.354000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 01:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625102700
value1=9380.733000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625102700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625102700
value1=9380.933000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 06:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625120700
date2=1625125200
value1=9481.188000
value2=9481.188000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 06:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625121000
value1=9482.660000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625121000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625121000
value1=9482.860000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 07:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625125200
date2=1625129700
value1=9506.223000
value2=9506.223000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 07:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625125500
date2=1625130000
value1=9468.644000
value2=9468.644000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 07:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625125800
value1=9470.545000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625125800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625125800
value1=9470.745000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 08:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625127000
date2=1625131500
value1=9476.158000
value2=9476.158000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 08:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625129100
value1=9477.039000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625129100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625129100
value1=9477.239000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 09:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625132100
date2=1625136600
value1=9470.168000
value2=9470.168000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 09:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625133300
value1=9472.748000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625133300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625133300
value1=9472.948000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625135100
date2=1625139600
value1=9474.333000
value2=9474.333000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 10:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625135700
date2=1625140200
value1=9473.442000
value2=9473.442000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 10:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625136000
date2=1625140500
value1=9462.460000
value2=9462.460000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 10:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625136900
value1=9462.628000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625136900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625136900
value1=9462.828000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 11:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625140500
date2=1625145000
value1=9484.439000
value2=9484.439000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 12:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625141400
value1=9486.116000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625141400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625141400
value1=9486.316000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 12:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625142900
date2=1625147400
value1=9494.295000
value2=9494.295000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 12:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625143500
date2=1625148000
value1=9476.594000
value2=9476.594000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 13:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625144400
date2=1625148900
value1=9464.095000
value2=9464.095000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 13:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625144700
date2=1625149200
value1=9445.536000
value2=9445.536000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 13:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625145300
value1=9446.274000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625145300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625145300
value1=9446.474000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625148300
date2=1625152800
value1=9461.577000
value2=9461.577000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 14:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625149500
date2=1625154000
value1=9450.209000
value2=9450.209000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 14:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625149800
date2=1625154300
value1=9437.070000
value2=9437.070000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 14:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625150100
date2=1625154600
value1=9450.209000
value2=9450.209000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 14:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625150700
date2=1625155200
value1=9422.682000
value2=9422.682000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 16:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625155200
date2=1625159700
value1=9436.732000
value2=9436.732000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 16:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625155500
date2=1625160000
value1=9415.695000
value2=9415.695000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 16:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625157600
date2=1625162100
value1=9410.265000
value2=9410.265000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 16:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625157900
value1=9411.027000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625157900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625157900
value1=9411.227000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 17:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625158800
date2=1625163300
value1=9413.698000
value2=9413.698000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 17:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625161800
date2=1625166300
value1=9398.430000
value2=9398.430000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 18:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625162400
date2=1625166900
value1=9383.125000
value2=9383.125000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 18:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625164800
date2=1625169300
value1=9377.156000
value2=9377.156000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 18:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625165700
date2=1625170200
value1=9373.696000
value2=9373.696000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 19:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625166000
date2=1625170500
value1=9366.101000
value2=9366.101000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 19:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625166900
date2=1625171400
value1=9337.111000
value2=9337.111000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 19:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625168700
date2=1625173200
value1=9329.244000
value2=9329.244000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 20:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625170200
value1=9329.358000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625170200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625170200
value1=9329.558000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 21:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625175600
date2=1625180100
value1=9343.944000
value2=9343.944000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 22:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625176800
date2=1625181300
value1=9332.568000
value2=9332.568000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 22:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625178600
date2=1625183100
value1=9323.865000
value2=9323.865000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 22:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625179500
date2=1625184000
value1=9298.709000
value2=9298.709000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.01 23:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625180400
value1=9301.168000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625180400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625180400
value1=9301.368000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 23:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625181900
date2=1625186400
value1=9303.712000
value2=9303.712000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 23:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625182200
date2=1625186700
value1=9300.480000
value2=9300.480000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 23:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625182500
date2=1625187000
value1=9303.712000
value2=9303.712000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 23:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625182800
date2=1625187300
value1=9303.712000
value2=9303.712000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.01 23:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625183100
date2=1625187600
value1=9303.712000
value2=9303.712000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 01:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625188200
date2=1625192700
value1=9278.776000
value2=9278.776000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 01:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625188800
date2=1625193300
value1=9273.171000
value2=9273.171000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625202300
date2=1625206800
value1=9307.103000
value2=9307.103000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625202600
date2=1625207100
value1=9318.268000
value2=9318.268000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625203500
date2=1625208000
value1=9291.747000
value2=9291.747000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625203800
date2=1625208300
value1=9282.387000
value2=9282.387000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625204100
date2=1625208600
value1=9291.747000
value2=9291.747000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 05:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625204400
date2=1625208900
value1=9291.747000
value2=9291.747000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 06:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625207700
date2=1625212200
value1=9258.987000
value2=9258.987000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 06:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625208600
value1=9260.672000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625208600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625208600
value1=9260.872000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625210400
date2=1625214900
value1=9258.764000
value2=9258.764000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 07:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625211000
date2=1625215500
value1=9254.255000
value2=9254.255000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 08:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625213100
date2=1625217600
value1=9244.924000
value2=9244.924000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 08:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625214600
value1=9246.627000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625214600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625214600
value1=9246.827000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 09:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625218800
date2=1625223300
value1=9263.265000
value2=9263.265000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 10:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625220300
value1=9264.510000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625220300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625220300
value1=9264.710000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625221200
date2=1625225700
value1=9263.413000
value2=9263.413000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625221500
date2=1625226000
value1=9264.418000
value2=9264.418000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 11:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625224500
date2=1625229000
value1=9239.406000
value2=9239.406000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 11:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625225400
value1=9240.711000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625225400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625225400
value1=9240.911000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 11:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625226900
date2=1625231400
value1=9235.960000
value2=9235.960000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 12:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625227500
date2=1625232000
value1=9233.087000
value2=9233.087000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 12:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625227800
value1=9233.673000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625227800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625227800
value1=9233.873000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 12:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625228700
date2=1625233200
value1=9236.412000
value2=9236.412000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 14:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625235600
date2=1625240100
value1=9234.774000
value2=9234.774000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 15:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625238300
value1=9236.930000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625238300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625238300
value1=9237.130000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 15:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625240100
date2=1625244600
value1=9241.507000
value2=9241.507000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 16:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625242800
date2=1625247300
value1=9233.085000
value2=9233.085000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 16:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625243700
value1=9235.828000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625243700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625243700
value1=9236.028000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 16:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625244900
date2=1625249400
value1=9241.241000
value2=9241.241000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 18:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625251500
date2=1625256000
value1=9265.911000
value2=9265.911000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 18:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625251500
value1=9266.217000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625251500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625251500
value1=9266.417000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 19:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625255700
date2=1625260200
value1=9278.377000
value2=9278.377000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 20:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625256600
date2=1625261100
value1=9276.860000
value2=9276.860000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 20:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625257200
value1=9277.092000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625257200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625257200
value1=9277.292000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 21:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625262300
date2=1625266800
value1=9282.396000
value2=9282.396000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 22:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625264700
value1=9283.000000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625264700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625264700
value1=9283.200000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 22:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625265900
date2=1625270400
value1=9288.439000
value2=9288.439000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.02 23:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625268900
date2=1625273400
value1=9275.167000
value2=9275.167000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.02 23:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625270100
value1=9275.366000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625270100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625270100
value1=9275.566000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 00:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625273100
date2=1625277600
value1=9275.975000
value2=9275.975000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 01:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625274300
date2=1625278800
value1=9262.175000
value2=9262.175000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 01:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625274600
date2=1625279100
value1=9247.798000
value2=9247.798000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 01:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625274900
date2=1625279400
value1=9262.175000
value2=9262.175000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 01:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625276100
date2=1625280600
value1=9247.257000
value2=9247.257000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625277600
date2=1625282100
value1=9234.092000
value2=9234.092000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 02:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625277900
value1=9236.126000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625277900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625277900
value1=9236.326000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 04:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625288100
date2=1625292600
value1=9303.212000
value2=9303.212000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 05:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625290800
date2=1625295300
value1=9293.902000
value2=9293.902000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 05:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625291400
value1=9294.578000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625291400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625291400
value1=9294.778000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625296500
date2=1625301000
value1=9314.478000
value2=9314.478000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625296800
date2=1625301300
value1=9305.948000
value2=9305.948000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 07:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625296800
value1=9306.546000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625296800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625296800
value1=9306.746000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 08:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625301600
date2=1625306100
value1=9320.321000
value2=9320.321000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 09:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625305200
date2=1625309700
value1=9327.542000
value2=9327.542000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 10:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625306700
value1=9329.099000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625306700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625306700
value1=9329.299000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 13:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625319600
date2=1625324100
value1=9382.238000
value2=9382.238000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 14:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625321400
date2=1625325900
value1=9367.714000
value2=9367.714000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 14:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625324100
date2=1625328600
value1=9365.783000
value2=9365.783000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 15:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625324400
date2=1625328900
value1=9357.542000
value2=9357.542000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 15:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625325300
date2=1625329800
value1=9354.425000
value2=9354.425000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 15:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625325900
value1=9355.067000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625325900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625325900
value1=9355.267000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 16:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625330100
date2=1625334600
value1=9371.228000
value2=9371.228000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 16:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625331300
value1=9371.529000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625331300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625331300
value1=9371.729000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 19:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625338800
date2=1625343300
value1=9407.476000
value2=9407.476000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 19:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625340000
date2=1625344500
value1=9400.935000
value2=9400.935000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 19:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625341500
date2=1625346000
value1=9404.766000
value2=9404.766000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 20:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625343300
date2=1625347800
value1=9379.509000
value2=9379.509000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 20:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625343600
date2=1625348100
value1=9386.773000
value2=9386.773000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 20:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625343900
date2=1625348400
value1=9386.773000
value2=9386.773000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 20:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625345100
date2=1625349600
value1=9360.470000
value2=9360.470000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.03 21:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625346000
value1=9362.138000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625346000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625346000
value1=9362.338000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 21:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625347500
date2=1625352000
value1=9355.581000
value2=9355.581000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 21:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625348400
date2=1625352900
value1=9334.752000
value2=9334.752000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 21:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625348700
date2=1625353200
value1=9315.287000
value2=9315.287000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 22:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625349900
date2=1625354400
value1=9314.366000
value2=9314.366000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.03 22:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625350200
date2=1625354700
value1=9301.792000
value2=9301.792000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 00:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625358000
date2=1625362500
value1=9320.292000
value2=9320.292000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 00:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625358900
value1=9320.888000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625358900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625358900
value1=9321.088000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 00:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625359500
date2=1625364000
value1=9320.793000
value2=9320.793000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625364000
date2=1625368500
value1=9323.301000
value2=9323.301000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 02:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625365800
value1=9325.243000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625365800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625365800
value1=9325.443000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 03:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625367900
date2=1625372400
value1=9313.909000
value2=9313.909000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 03:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625368200
date2=1625372700
value1=9318.960000
value2=9318.960000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 03:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625368500
date2=1625373000
value1=9318.960000
value2=9318.960000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 04:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625372700
value1=9321.053000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625372700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625372700
value1=9321.253000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 05:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625375100
date2=1625379600
value1=9320.517000
value2=9320.517000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 05:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625377200
value1=9323.199000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625377200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625377200
value1=9323.399000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 05:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625378100
date2=1625382600
value1=9322.357000
value2=9322.357000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 06:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625378400
value1=9323.060000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625378400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625378400
value1=9323.260000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 07:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625382600
date2=1625387100
value1=9349.462000
value2=9349.462000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625383200
date2=1625387700
value1=9336.870000
value2=9336.870000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 07:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625383500
date2=1625388000
value1=9316.811000
value2=9316.811000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 07:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625384700
date2=1625389200
value1=9301.510000
value2=9301.510000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 08:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625385600
value1=9303.821000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625385600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625385600
value1=9304.021000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 08:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625387400
date2=1625391900
value1=9310.105000
value2=9310.105000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 08:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625388000
date2=1625392500
value1=9311.882000
value2=9311.882000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 08:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625388900
date2=1625393400
value1=9290.399000
value2=9290.399000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 09:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625392200
date2=1625396700
value1=9273.043000
value2=9273.043000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 09:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625392500
value1=9274.978000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625392500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625392500
value1=9275.178000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 10:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625394900
date2=1625399400
value1=9282.698000
value2=9282.698000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 10:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625395800
date2=1625400300
value1=9281.623000
value2=9281.623000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 11:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625396700
date2=1625401200
value1=9277.831000
value2=9277.831000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 11:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625397300
date2=1625401800
value1=9267.713000
value2=9267.713000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 13:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625406300
date2=1625410800
value1=9311.319000
value2=9311.319000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 13:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625406900
date2=1625411400
value1=9297.444000
value2=9297.444000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 14:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625407500
value1=9299.084000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625407500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625407500
value1=9299.284000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 14:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625408700
date2=1625413200
value1=9298.541000
value2=9298.541000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 16:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625415000
date2=1625419500
value1=9302.110000
value2=9302.110000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 16:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625415300
date2=1625419800
value1=9309.860000
value2=9309.860000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 16:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625417100
date2=1625421600
value1=9293.090000
value2=9293.090000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 16:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625417400
date2=1625421900
value1=9300.800000
value2=9300.800000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 16:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625417700
date2=1625422200
value1=9300.800000
value2=9300.800000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 17:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625418600
date2=1625423100
value1=9237.418000
value2=9237.418000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 17:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625419500
date2=1625424000
value1=9234.786000
value2=9234.786000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 17:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625419800
date2=1625424300
value1=9227.322000
value2=9227.322000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 17:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625420100
date2=1625424600
value1=9234.786000
value2=9234.786000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 18:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625422200
value1=9236.612000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625422200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625422200
value1=9236.812000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 19:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625428200
date2=1625432700
value1=9256.001000
value2=9256.001000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 22:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625436600
date2=1625441100
value1=9300.068000
value2=9300.068000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 22:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625437500
date2=1625442000
value1=9293.975000
value2=9293.975000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.04 22:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625438100
value1=9294.322000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625438100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625438100
value1=9294.522000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.04 23:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625442000
date2=1625446500
value1=9307.444000
value2=9307.444000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 00:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625444100
date2=1625448600
value1=9290.898000
value2=9290.898000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 00:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625445900
date2=1625450400
value1=9259.293000
value2=9259.293000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 01:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625447700
value1=9261.998000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625447700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625447700
value1=9262.198000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 01:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625448300
date2=1625452800
value1=9261.910000
value2=9261.910000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 02:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625450400
date2=1625454900
value1=9250.475000
value2=9250.475000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 02:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625451300
date2=1625455800
value1=9242.892000
value2=9242.892000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 02:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625451900
date2=1625456400
value1=9232.229000
value2=9232.229000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 02:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625453400
value1=9234.878000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625453400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625453400
value1=9235.078000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 03:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625455500
date2=1625460000
value1=9237.819000
value2=9237.819000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 04:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625459700
date2=1625464200
value1=9239.000000
value2=9239.000000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625469300
date2=1625473800
value1=9260.027000
value2=9260.027000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 07:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625469900
date2=1625474400
value1=9256.705000
value2=9256.705000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 07:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625470200
value1=9259.071000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625470200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625470200
value1=9259.271000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 08:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625472000
date2=1625476500
value1=9270.307000
value2=9270.307000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 08:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625472600
date2=1625477100
value1=9252.726000
value2=9252.726000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 08:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625473500
value1=9253.026000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625473500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625473500
value1=9253.226000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 09:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625478300
date2=1625482800
value1=9265.579000
value2=9265.579000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 10:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625479800
date2=1625484300
value1=9247.385000
value2=9247.385000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625480400
date2=1625484900
value1=9241.737000
value2=9241.737000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625480700
date2=1625485200
value1=9224.621000
value2=9224.621000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 10:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625481300
value1=9225.476000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625481300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625481300
value1=9225.676000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 11:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625485200
date2=1625489700
value1=9251.607000
value2=9251.607000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 11:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625485500
value1=9253.335000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625485500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625485500
value1=9253.535000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 12:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625488500
date2=1625493000
value1=9261.547000
value2=9261.547000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 13:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625491500
date2=1625496000
value1=9272.747000
value2=9272.747000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 13:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625492100
date2=1625496600
value1=9255.158000
value2=9255.158000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625493900
date2=1625498400
value1=9243.109000
value2=9243.109000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 14:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625494800
value1=9245.799000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625494800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625494800
value1=9245.999000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 14:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625495400
date2=1625499900
value1=9245.720000
value2=9245.720000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 16:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625500800
date2=1625505300
value1=9262.331000
value2=9262.331000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 16:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625501700
date2=1625506200
value1=9244.564000
value2=9244.564000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 16:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625502300
date2=1625506800
value1=9234.711000
value2=9234.711000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 16:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625504100
value1=9237.296000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625504100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625504100
value1=9237.496000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 18:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625509200
date2=1625513700
value1=9254.192000
value2=9254.192000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 18:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625509800
date2=1625514300
value1=9249.756000
value2=9249.756000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 18:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625511000
date2=1625515500
value1=9245.240000
value2=9245.240000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 18:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625511300
date2=1625515800
value1=9245.639000
value2=9245.639000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 19:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625514000
date2=1625518500
value1=9233.737000
value2=9233.737000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 20:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625515800
date2=1625520300
value1=9225.473000
value2=9225.473000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 20:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625516100
date2=1625520600
value1=9215.311000
value2=9215.311000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.05 20:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625516100
value1=9216.428000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625516100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625516100
value1=9216.628000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.05 23:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625526600
date2=1625531100
value1=9272.543000
value2=9272.543000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 00:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625530800
date2=1625535300
value1=9258.891000
value2=9258.891000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 00:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625531700
value1=9259.834000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625531700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625531700
value1=9260.034000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 03:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625542500
date2=1625547000
value1=9296.814000
value2=9296.814000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 04:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625546400
date2=1625550900
value1=9282.327000
value2=9282.327000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 04:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625546700
date2=1625551200
value1=9275.012000
value2=9275.012000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 04:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625547000
date2=1625551500
value1=9282.327000
value2=9282.327000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 05:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625548500
date2=1625553000
value1=9268.033000
value2=9268.033000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 05:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625549100
date2=1625553600
value1=9256.246000
value2=9256.246000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 05:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625549700
value1=9257.462000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625549700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625549700
value1=9257.662000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 06:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625552700
date2=1625557200
value1=9267.035000
value2=9267.035000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 06:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625553900
date2=1625558400
value1=9253.072000
value2=9253.072000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 07:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625555400
date2=1625559900
value1=9234.554000
value2=9234.554000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625556000
date2=1625560500
value1=9221.586000
value2=9221.586000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 07:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625556300
date2=1625560800
value1=9211.101000
value2=9211.101000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 07:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625556600
value1=9212.522000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625556600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625556600
value1=9212.722000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 07:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625557500
date2=1625562000
value1=9215.406000
value2=9215.406000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 07:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625557800
date2=1625562300
value1=9201.886000
value2=9201.886000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 08:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625558700
value1=9202.848000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625558700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625558700
value1=9203.048000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 09:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625562000
date2=1625566500
value1=9214.643000
value2=9214.643000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 09:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625562300
date2=1625566800
value1=9206.013000
value2=9206.013000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 09:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625562900
value1=9206.329000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625562900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625562900
value1=9206.529000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625567100
date2=1625571600
value1=9218.119000
value2=9218.119000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 10:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625568300
date2=1625572800
value1=9214.854000
value2=9214.854000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 10:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625568600
date2=1625573100
value1=9205.148000
value2=9205.148000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 11:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625571600
date2=1625576100
value1=9188.612000
value2=9188.612000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 11:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625571900
date2=1625576400
value1=9196.125000
value2=9196.125000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 12:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625573400
date2=1625577900
value1=9159.102000
value2=9159.102000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 13:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625577900
date2=1625582400
value1=9152.874000
value2=9152.874000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625580000
date2=1625584500
value1=9145.834000
value2=9145.834000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625580300
date2=1625584800
value1=9134.875000
value2=9134.875000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625580600
date2=1625585100
value1=9145.834000
value2=9145.834000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625581500
date2=1625586000
value1=9125.218000
value2=9125.218000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625582400
date2=1625586900
value1=9118.531000
value2=9118.531000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 14:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625583000
date2=1625587500
value1=9092.118000
value2=9092.118000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 15:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625583900
value1=9094.738000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625583900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625583900
value1=9094.938000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 15:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625584500
date2=1625589000
value1=9094.643000
value2=9094.643000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 15:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625585700
date2=1625590200
value1=9084.873000
value2=9084.873000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 16:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625587500
date2=1625592000
value1=9081.025000
value2=9081.025000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 16:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625588100
value1=9083.120000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625588100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625588100
value1=9083.320000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 17:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625592000
date2=1625596500
value1=9089.355000
value2=9089.355000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 17:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625592300
date2=1625596800
value1=9098.517000
value2=9098.517000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 17:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625593200
date2=1625597700
value1=9069.930000
value2=9069.930000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 17:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625593500
date2=1625598000
value1=9074.401000
value2=9074.401000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 17:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625593800
date2=1625598300
value1=9074.401000
value2=9074.401000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 18:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625595300
date2=1625599800
value1=9041.816000
value2=9041.816000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 18:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625596500
value1=9043.670000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625596500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625596500
value1=9043.870000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 20:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625603700
date2=1625608200
value1=9058.473000
value2=9058.473000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 20:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625603700
value1=9060.330000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625603700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625603700
value1=9060.530000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 20:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625604900
date2=1625609400
value1=9065.810000
value2=9065.810000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625605200
date2=1625609700
value1=9044.334000
value2=9044.334000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625605500
date2=1625610000
value1=9065.810000
value2=9065.810000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625605800
date2=1625610300
value1=9065.810000
value2=9065.810000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625606400
date2=1625610900
value1=9041.080000
value2=9041.080000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625607000
date2=1625611500
value1=9036.322000
value2=9036.322000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 21:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625607600
value1=9038.869000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625607600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625607600
value1=9039.069000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 21:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625608500
date2=1625613000
value1=9041.372000
value2=9041.372000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 22:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625610000
date2=1625614500
value1=9019.443000
value2=9019.443000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 22:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625611200
date2=1625615700
value1=9014.931000
value2=9014.931000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 22:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625611500
date2=1625616000
value1=8996.125000
value2=8996.125000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.06 23:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625614200
date2=1625618700
value1=8996.488000
value2=8996.488000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.06 23:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625615100
value1=8998.803000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625615100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625615100
value1=8999.003000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 00:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625616600
date2=1625621100
value1=9003.679000
value2=9003.679000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 00:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625617800
value1=9003.950000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625617800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625617800
value1=9004.150000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 00:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625619000
date2=1625623500
value1=9001.873000
value2=9001.873000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 01:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625620500
date2=1625625000
value1=8994.534000
value2=8994.534000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 01:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625622600
date2=1625627100
value1=8994.852000
value2=8994.852000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 01:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625622900
date2=1625627400
value1=8973.701000
value2=8973.701000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 02:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625624700
date2=1625629200
value1=8953.055000
value2=8953.055000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 03:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625628600
date2=1625633100
value1=8960.582000
value2=8960.582000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 03:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625629800
date2=1625634300
value1=8960.026000
value2=8960.026000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 04:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625630400
date2=1625634900
value1=8951.381000
value2=8951.381000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 04:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625631000
date2=1625635500
value1=8950.842000
value2=8950.842000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 04:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625631300
date2=1625635800
value1=8947.108000
value2=8947.108000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 05:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625635500
date2=1625640000
value1=8933.120000
value2=8933.120000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 05:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625635500
value1=8935.812000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625635500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625635500
value1=8936.012000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 06:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625638800
date2=1625643300
value1=8945.001000
value2=8945.001000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 06:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625639100
date2=1625643600
value1=8929.376000
value2=8929.376000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 06:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625640300
date2=1625644800
value1=8927.131000
value2=8927.131000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625642100
date2=1625646600
value1=8909.268000
value2=8909.268000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625642400
date2=1625646900
value1=8889.789000
value2=8889.789000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 07:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625642400
value1=8890.271000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625642400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625642400
value1=8890.471000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 09:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625650200
date2=1625654700
value1=8932.781000
value2=8932.781000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 09:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625650800
date2=1625655300
value1=8924.213000
value2=8924.213000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 13:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625664300
date2=1625668800
value1=8990.352000
value2=8990.352000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 13:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625665500
value1=8992.564000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625665500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625665500
value1=8992.764000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 15:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625673000
date2=1625677500
value1=9032.082000
value2=9032.082000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 16:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625673600
value1=9033.594000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625673600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625673600
value1=9033.794000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 16:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625674800
date2=1625679300
value1=9025.556000
value2=9025.556000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 16:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625675100
date2=1625679600
value1=9036.069000
value2=9036.069000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 18:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625683800
date2=1625688300
value1=9046.720000
value2=9046.720000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 19:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625684400
value1=9047.238000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625684400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625684400
value1=9047.438000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 21:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625692200
date2=1625696700
value1=9091.182000
value2=9091.182000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 21:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625692500
date2=1625697000
value1=9094.547000
value2=9094.547000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 21:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625692800
date2=1625697300
value1=9094.547000
value2=9094.547000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 21:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625693100
date2=1625697600
value1=9094.547000
value2=9094.547000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.07 22:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625696400
value1=9096.892000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625696400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625696400
value1=9097.092000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 22:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625697900
date2=1625702400
value1=9101.935000
value2=9101.935000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.07 23:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625700600
date2=1625705100
value1=9089.132000
value2=9089.132000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 00:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625705100
date2=1625709600
value1=9092.949000
value2=9092.949000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 00:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625705400
date2=1625709900
value1=9073.587000
value2=9073.587000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 00:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625705700
value1=9075.856000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625705700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625705700
value1=9076.056000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 01:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625709000
date2=1625713500
value1=9094.193000
value2=9094.193000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 02:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625710500
date2=1625715000
value1=9093.285000
value2=9093.285000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 02:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625711700
date2=1625716200
value1=9082.614000
value2=9082.614000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 03:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625714100
date2=1625718600
value1=9087.739000
value2=9087.739000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 04:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625717700
date2=1625722200
value1=9076.139000
value2=9076.139000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 04:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625718300
date2=1625722800
value1=9074.330000
value2=9074.330000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 04:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625718600
date2=1625723100
value1=9061.760000
value2=9061.760000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 05:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625723700
date2=1625728200
value1=9080.674000
value2=9080.674000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 06:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625726100
date2=1625730600
value1=9065.523000
value2=9065.523000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 06:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625726700
date2=1625731200
value1=9061.559000
value2=9061.559000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 07:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625728200
value1=9063.934000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625728200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625728200
value1=9064.134000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 07:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625730600
date2=1625735100
value1=9066.512000
value2=9066.512000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 08:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625733000
date2=1625737500
value1=9062.317000
value2=9062.317000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 09:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625737200
date2=1625741700
value1=9056.117000
value2=9056.117000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 09:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625737800
value1=9058.122000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625737800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625737800
value1=9058.322000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 10:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625739600
date2=1625744100
value1=9060.878000
value2=9060.878000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625739900
date2=1625744400
value1=9066.398000
value2=9066.398000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 10:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625740500
date2=1625745000
value1=9043.082000
value2=9043.082000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 10:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625740800
date2=1625745300
value1=9035.120000
value2=9035.120000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 12:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625748000
date2=1625752500
value1=9063.473000
value2=9063.473000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 12:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625748300
value1=9065.788000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625748300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625748300
value1=9065.988000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 13:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625749200
date2=1625753700
value1=9068.456000
value2=9068.456000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 13:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625750400
date2=1625754900
value1=9066.551000
value2=9066.551000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 13:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625750700
date2=1625755200
value1=9052.945000
value2=9052.945000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 13:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625750700
value1=9053.640000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625750700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625750700
value1=9053.840000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 13:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625752200
date2=1625756700
value1=9055.016000
value2=9055.016000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 14:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625752800
date2=1625757300
value1=9048.199000
value2=9048.199000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 14:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625753400
value1=9050.972000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625753400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625753400
value1=9051.172000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 14:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625755800
date2=1625760300
value1=9057.123000
value2=9057.123000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 15:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625758500
date2=1625763000
value1=9059.147000
value2=9059.147000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 15:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625759700
date2=1625764200
value1=9054.827000
value2=9054.827000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 16:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625760900
date2=1625765400
value1=9052.258000
value2=9052.258000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 16:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625761200
date2=1625765700
value1=9040.289000
value2=9040.289000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 17:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625763600
date2=1625768100
value1=9031.050000
value2=9031.050000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 17:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625766300
value1=9032.804000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625766300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625766300
value1=9033.004000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 18:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625767200
date2=1625771700
value1=9035.621000
value2=9035.621000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 18:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625768400
date2=1625772900
value1=9013.869000
value2=9013.869000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 18:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625768700
date2=1625773200
value1=8998.779000
value2=8998.779000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 18:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625769000
date2=1625773500
value1=9013.869000
value2=9013.869000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 18:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625770500
date2=1625775000
value1=8971.184000
value2=8971.184000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 18:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625770500
value1=8972.701000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625770500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625770500
value1=8972.901000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 19:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625771100
date2=1625775600
value1=8972.616000
value2=8972.616000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 19:10
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625771400
value1=8973.723000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625771400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625771400
value1=8973.923000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 21:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625779800
date2=1625784300
value1=9021.599000
value2=9021.599000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 21:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625780100
date2=1625784600
value1=8991.301000
value2=8991.301000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 21:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625780100
value1=8992.651000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625780100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625780100
value1=8992.851000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.08 23:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625787900
date2=1625792400
value1=9008.811000
value2=9008.811000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.08 23:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625788200
value1=9009.589000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625788200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625788200
value1=9009.789000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 00:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625792100
date2=1625796600
value1=9025.901000
value2=9025.901000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 01:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625792700
date2=1625797200
value1=9007.895000
value2=9007.895000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 01:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625794500
date2=1625799000
value1=9008.245000
value2=9008.245000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 01:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625795100
value1=9009.514000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625795100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625795100
value1=9009.714000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 02:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625796600
date2=1625801100
value1=9010.184000
value2=9010.184000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 02:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625796900
value1=9011.661000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625796900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625796900
value1=9011.861000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 03:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625800500
date2=1625805000
value1=9026.429000
value2=9026.429000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 03:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625802600
date2=1625807100
value1=9020.371000
value2=9020.371000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 04:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625803200
date2=1625807700
value1=9007.936000
value2=9007.936000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 04:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625803800
date2=1625808300
value1=8998.481000
value2=8998.481000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 04:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625804700
date2=1625809200
value1=8996.865000
value2=8996.865000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 04:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625806200
value1=8997.577000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625806200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625806200
value1=8997.777000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 06:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625810400
date2=1625814900
value1=9022.751000
value2=9022.751000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 06:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625810700
date2=1625815200
value1=8995.393000
value2=8995.393000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 06:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625813400
date2=1625817900
value1=8974.796000
value2=8974.796000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 06:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625813700
date2=1625818200
value1=8982.128000
value2=8982.128000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 08:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625819400
date2=1625823900
value1=8990.961000
value2=8990.961000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 08:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625820000
date2=1625824500
value1=8973.653000
value2=8973.653000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 09:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625821500
date2=1625826000
value1=8960.934000
value2=8960.934000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 09:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625822700
date2=1625827200
value1=8926.981000
value2=8926.981000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 09:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625823000
date2=1625827500
value1=8891.145000
value2=8891.145000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 09:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625823000
value1=8891.295000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625823000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625823000
value1=8891.495000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 10:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625827200
date2=1625831700
value1=8913.906000
value2=8913.906000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 11:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625828700
value1=8914.711000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625828700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625828700
value1=8914.911000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 11:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625829600
date2=1625834100
value1=8911.284000
value2=8911.284000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 11:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625831400
date2=1625835900
value1=8913.234000
value2=8913.234000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 12:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625832000
date2=1625836500
value1=8894.436000
value2=8894.436000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 12:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625833500
date2=1625838000
value1=8879.534000
value2=8879.534000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 12:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625833800
date2=1625838300
value1=8871.930000
value2=8871.930000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 13:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625836200
date2=1625840700
value1=8879.627000
value2=8879.627000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 13:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625837700
value1=8879.909000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625837700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625837700
value1=8880.109000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 14:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625842200
date2=1625846700
value1=8888.639000
value2=8888.639000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 14:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625842500
date2=1625847000
value1=8874.380000
value2=8874.380000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 15:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625844600
date2=1625849100
value1=8859.802000
value2=8859.802000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 16:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625847000
date2=1625851500
value1=8835.133000
value2=8835.133000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 16:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625847300
value1=8836.734000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625847300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625847300
value1=8836.934000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 16:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625849400
date2=1625853900
value1=8849.918000
value2=8849.918000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 19:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625858100
date2=1625862600
value1=8867.535000
value2=8867.535000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 19:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625858400
date2=1625862900
value1=8851.311000
value2=8851.311000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 19:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625859000
date2=1625863500
value1=8826.467000
value2=8826.467000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 19:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625860500
date2=1625865000
value1=8815.536000
value2=8815.536000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 19:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625860500
value1=8817.030000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625860500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625860500
value1=8817.230000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 21:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625864700
date2=1625869200
value1=8830.215000
value2=8830.215000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 21:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625865000
date2=1625869500
value1=8815.039000
value2=8815.039000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 21:25
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625865900
value1=8815.638000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625865900
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625865900
value1=8815.838000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 21:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625867100
date2=1625871600
value1=8818.200000
value2=8818.200000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 21:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625867700
value1=8818.576000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625867700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625867700
value1=8818.776000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 22:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625871000
date2=1625875500
value1=8828.110000
value2=8828.110000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.09 22:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625871300
date2=1625875800
value1=8814.918000
value2=8814.918000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.09 23:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625871600
value1=8817.532000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625871600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625871600
value1=8817.732000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 01:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625878800
date2=1625883300
value1=8859.627000
value2=8859.627000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 01:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625879100
value1=8861.637000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625879100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625879100
value1=8861.837000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 01:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625880300
date2=1625884800
value1=8866.811000
value2=8866.811000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625886000
date2=1625890500
value1=8872.885000
value2=8872.885000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625886300
date2=1625890800
value1=8860.104000
value2=8860.104000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625887500
date2=1625892000
value1=8841.283000
value2=8841.283000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625888100
date2=1625892600
value1=8831.286000
value2=8831.286000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625888400
date2=1625892900
value1=8822.426000
value2=8822.426000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 03:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625889300
date2=1625893800
value1=8822.203000
value2=8822.203000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 04:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625890200
date2=1625894700
value1=8810.716000
value2=8810.716000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 04:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625891100
date2=1625895600
value1=8802.454000
value2=8802.454000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 04:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625891400
date2=1625895900
value1=8789.234000
value2=8789.234000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 04:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625891700
date2=1625896200
value1=8802.454000
value2=8802.454000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 05:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625895900
date2=1625900400
value1=8780.975000
value2=8780.975000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 07:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625901000
date2=1625905500
value1=8789.257000
value2=8789.257000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 07:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625901300
date2=1625905800
value1=8789.669000
value2=8789.669000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 07:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625901600
date2=1625906100
value1=8789.669000
value2=8789.669000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 08:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625904900
date2=1625909400
value1=8785.919000
value2=8785.919000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 08:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625905500
date2=1625910000
value1=8774.995000
value2=8774.995000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 08:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625905800
date2=1625910300
value1=8758.612000
value2=8758.612000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 08:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625906700
date2=1625911200
value1=8754.279000
value2=8754.279000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 09:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625908800
date2=1625913300
value1=8750.587000
value2=8750.587000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 09:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625909400
date2=1625913900
value1=8734.287000
value2=8734.287000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 10:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625914500
date2=1625919000
value1=8737.115000
value2=8737.115000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 11:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625916000
date2=1625920500
value1=8734.214000
value2=8734.214000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 11:30
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625916600
value1=8735.642000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625916600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625916600
value1=8735.842000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 12:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625921100
date2=1625925600
value1=8746.482000
value2=8746.482000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 13:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625922600
date2=1625927100
value1=8745.328000
value2=8745.328000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 13:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625924400
value1=8747.978000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625924400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625924400
value1=8748.178000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625925900
date2=1625930400
value1=8751.843000
value2=8751.843000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 14:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625926500
date2=1625931000
value1=8744.712000
value2=8744.712000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 14:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625928600
value1=8745.598000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625928600
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625928600
value1=8745.798000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 15:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625930100
date2=1625934600
value1=8745.599000
value2=8745.599000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 15:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625931300
value1=8746.453000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625931300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625931300
value1=8746.653000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 16:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625933700
date2=1625938200
value1=8752.683000
value2=8752.683000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 20:50
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625950200
date2=1625954700
value1=8840.771000
value2=8840.771000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 21:00
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625950800
value1=8843.276000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625950800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625950800
value1=8843.476000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 22:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625957700
date2=1625962200
value1=8855.575000
value2=8855.575000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 23:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625958900
date2=1625963400
value1=8837.216000
value2=8837.216000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.10 23:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625959200
date2=1625963700
value1=8822.183000
value2=8822.183000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.10 23:45
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625960700
value1=8823.830000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625960700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625960700
value1=8824.030000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 01:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625967600
date2=1625972100
value1=8852.353000
value2=8852.353000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 01:55
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625968500
value1=8854.272000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625968500
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625968500
value1=8854.472000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 02:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625970300
date2=1625974800
value1=8849.599000
value2=8849.599000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 02:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625971200
value1=8851.854000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625971200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625971200
value1=8852.054000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 03:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625973600
date2=1625978100
value1=8854.115000
value2=8854.115000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 03:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625973900
date2=1625978400
value1=8842.874000
value2=8842.874000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 04:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625976600
date2=1625981100
value1=8849.436000
value2=8849.436000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 04:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625977200
date2=1625981700
value1=8836.460000
value2=8836.460000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 04:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625979300
date2=1625983800
value1=8827.497000
value2=8827.497000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 05:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625979600
date2=1625984100
value1=8820.981000
value2=8820.981000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 05:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625980800
value1=8823.694000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625980800
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625980800
value1=8823.894000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 06:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625984400
date2=1625988900
value1=8827.535000
value2=8827.535000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 06:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625984400
value1=8829.298000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625984400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625984400
value1=8829.498000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 07:40
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625989200
date2=1625993700
value1=8862.089000
value2=8862.089000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 08:05
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625990700
value1=8862.242000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625990700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625990700
value1=8862.442000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 09:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625994900
date2=1625999400
value1=8859.804000
value2=8859.804000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 09:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625995800
date2=1626000300
value1=8856.073000
value2=8856.073000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 09:50
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625997000
value1=8858.471000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625997000
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625997000
value1=8858.671000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 10:25
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1625999100
date2=1626003600
value1=8862.874000
value2=8862.874000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 10:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1625999700
value1=8863.672000
</object>

<object>
type=101
name=Patron 2021S CAZ S1625999700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1625999700
value1=8863.872000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 10:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626000900
date2=1626005400
value1=8868.884000
value2=8868.884000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 11:20
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1626002400
value1=8870.533000
</object>

<object>
type=101
name=Patron 2021S CAZ S1626002400
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1626002400
value1=8870.733000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 12:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626005700
date2=1626010200
value1=8872.923000
value2=8872.923000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 12:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626006600
date2=1626011100
value1=8852.496000
value2=8852.496000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 12:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626008100
date2=1626012600
value1=8850.810000
value2=8850.810000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 13:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626009300
date2=1626013800
value1=8849.444000
value2=8849.444000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 14:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626012000
date2=1626016500
value1=8842.686000
value2=8842.686000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 14:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626012300
date2=1626016800
value1=8838.259000
value2=8838.259000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 14:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626012600
date2=1626017100
value1=8842.686000
value2=8842.686000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 14:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626013200
date2=1626017700
value1=8822.127000
value2=8822.127000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 14:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1626014100
value1=8822.652000
</object>

<object>
type=101
name=Patron 2021S CAZ S1626014100
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1626014100
value1=8822.852000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 16:30
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626021000
date2=1626025500
value1=8861.166000
value2=8861.166000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 16:45
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626021900
date2=1626026400
value1=8842.135000
value2=8842.135000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 17:35
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626024900
date2=1626029400
value1=8829.079000
value2=8829.079000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 17:40
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1626025200
value1=8830.254000
</object>

<object>
type=101
name=Patron 2021S CAZ S1626025200
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1626025200
value1=8830.454000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 18:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626026700
date2=1626031200
value1=8837.567000
value2=8837.567000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 18:10
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626027000
date2=1626031500
value1=8825.591000
value2=8825.591000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 18:15
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1626027300
value1=8827.753000
</object>

<object>
type=101
name=Patron 2021S CAZ S1626027300
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1626027300
value1=8827.953000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 20:05
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626033900
date2=1626038400
value1=8853.450000
value2=8853.450000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 20:15
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626034500
date2=1626039000
value1=8842.150000
value2=8842.150000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 20:20
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626034800
date2=1626039300
value1=8821.352000
value2=8821.352000
</object>

<object>
type=100
name=Arrow Expert Crash Boom S2021.07.11 20:35
hidden=1
width=2
selectable=0
anchorpos=1
code_arrow=222
date1=1626035700
value1=8821.596000
</object>

<object>
type=101
name=Patron 2021S CAZ S1626035700
hidden=1
descr=C SP
color=16776960
selectable=0
angle=0
date1=1626035700
value1=8821.796000
fontsz=8
fontnm=Times New Roman
anchorpos=3
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 20:55
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626036900
date2=1626041400
value1=8826.744000
value2=8826.744000
</object>

<object>
type=2
name=Patron 2021S Linea2021.07.11 21:00
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626037200
date2=1626041700
value1=8801.004000
value2=8801.004000
</object>

<object>
type=103
name=whitetigertools.com
descr=whitetigertools.com
color=16777215
selectable=0
pos_x=0
pos_y=0
fontsz=8
fontnm=Verdana
state=0
size_x=150
size_y=15
bgcolor=16711680
frcolor=0
refpoint=1
</object>

</window>

<window>
height=50.000000
objects=0

<indicator>
name=Custom Indicator
path=Indicators\PROYECTO LUIS\PZ_Volatmeter.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=1
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=ATR Histo
draw=2
style=0
width=3
color=7451452
</graph>

<graph>
name=ATR M5
draw=1
style=0
width=3
color=16760576
</graph>

<graph>
name=ATR M15
draw=1
style=0
width=2
color=3329434
</graph>

<graph>
name=ATR M30
draw=1
style=0
width=1
color=255
</graph>
<inputs>
inp_settings==== Indicator Settings ===
InpFastPeriod=5
InpSlowPeriod=10
InpMaxBars=5000
</inputs>
</indicator>
</window>
</chart>