<chart>
id=133319493516910763
symbol=GBPUSD
description=Great Britain Pound vs US Dollar
period_type=1
period_size=2
digits=5
tick_size=0.000000
position_time=1685966400
scale_fix=0
scale_fixed_min=1.260400
scale_fixed_max=1.285200
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=16
mode=1
fore=0
grid=0
volume=0
scroll=0
shift=1
shift_size=18.629995
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
window_left=104
window_top=104
window_right=2132
window_bottom=728
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
name=CONTROL LOTAJE 2
path=Experts\CONTROL LOTAJE PERDIDAS GANANCIAS\CONTROL LOTAJE 2.ex5
expertmode=1
<inputs>
Capital_Base=6000.0
Porcentaje_Perdida=1.2
S1=-----------------------   CONFIGURACION BOTONES  ---------------------
CORNER_BOTON=0
Boton_Desplazamiento_X=5
Boton_Desplazamiento_Y=27
SizeTexto=10
Espacio=1
MagicNumber=22222
</inputs>
</expert>

<window>
height=173.535209
objects=10

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
show_data=0
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
width=1
arrow=251
color=16777215
</graph>
period=20
method=1
</indicator>

<indicator>
name=Moving Average
path=
apply=1
show_data=0
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
color=16711935
</graph>
period=50
method=1
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\R.ex5
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
color=16711935
</graph>

<graph>
name=UP Rebote
draw=3
style=0
width=2
arrow=233
color=16711935
</graph>
<inputs>
Settings_Condiciones_Patron======== Settings CONDICIONES PATRON ===========================================
VelasEvaluadas=1000
Testeado=0
Repintado=false
Tolerancia_Puntos_Flecha=0
S1__======================  Configuracion SOP RES ===========================================
BackLimit=400
zone_fuzzfactor=1.0
S111__==============   Configuracion TREND FORCE =========================
trendPeriod=4
TriggerUp=0.8
TriggerDown=-0.8
Settings_Horario=========== Settings HORARIO ====================
Hora_Inicio=8
Hora_Final=8
Domingo=true
Lunes=true
Martes=true
Miercoles=true
Jueves=true
Viernes=true
S113__===== CONFIGURACION PERIODOS ============================================
M5=false
M6=false
M10=true
M12=true
M15=true
M20=true
M30=true
H1=true
H2=true
H3=false
H4=false
S16_================= CONFIGURACION FILTRO SOP RES CURRENT TIMEFRAME ============================================
FiltroSopResCURRENTTIMEFRAMES=true
zone_fuzzfactor2=2.5
BackLimit2=200
FuerzaSop=1
Cantidad_Coincidencias=2
Period_M5=true
Period_M6=true
Period_M10=false
Period_M12=false
Period_M15=false
Period_M20=false
Period_M30=false
Period_H1=true
Period_H2=false
Period_H3=false
Period_H4=false
Period_H6=false
Period_H8=false
Settings_Alerts=======================  Settings ALERTAS ============================================ 
AlertPC=false
AlertMovil=false
AlertMail=false
conectors==========================  Settings Conector ============================================ 
Conector=false
sC==========================  Settings Size ============================================ 
sizeCandle=350
S6=-----------------------   Configuracion Bollinger  ---------------------
BB_Period=15
BB_Deviation=2.0
BB_Shift=0
BB_AppliedPrice=1
Percent_BB=45
S7=-----------------------   Configuracion ESTOCASTICO  ---------------------
K_Periodo=40
D_Periodo=10
Slowing=20
Ma_Method_EST=0
STO_EST=0
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\SUPRESFINAL PRUEBA 2.ex5
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
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Linea_Historial=true
Color_Linea=65535
BackLimit=500
pus1=/////////////////////////////////////////////////
zone_show_weak=false
zone_show_untested=false
zone_show_turncoat=false
zone_fuzzfactor=0.75
SeparacionTexto=10
pus2=/////////////////////////////////////////////////
fractals_show=false
fractal_fast_factor=3.0
fractal_slow_factor=6.0
SetGlobals=true
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Linea Maximos y Minimos.ex5
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
name=Linea_Maximo
draw=1
style=0
width=2
arrow=251
color=11186720
</graph>

<graph>
name=Linea_Minimo
draw=1
style=0
width=2
arrow=251
color=11186720
</graph>
<inputs>
Periodos=20
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Zero-lag-MA.ex5
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
name=Zero lag MA
draw=10
style=0
width=2
arrow=251
color=11119017,9639167,3329330
</graph>
<inputs>
inpPrice=5
inpPeriod=70.0
</inputs>
</indicator>

<indicator>
name=Bollinger Bands
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-0.002957
scale_fix_max=0
scale_fix_max_val=0.004664
expertmode=0
fixed_height=-1

<graph>
name=
draw=131
style=0
width=1
arrow=251
color=7451452
</graph>

<graph>
name=
draw=131
style=0
width=1
arrow=251
color=7451452
</graph>

<graph>
name=
draw=131
style=0
width=1
arrow=251
color=7451452
</graph>
period=20
deviation=2.000000
</indicator>
<object>
name=Line Shift Vertical Prueba
hidden=1
color=-1
selectable=0
z_order=1
ray=0
date1=1687975200
</object>

<object>
type=20
name=SSSR#S0 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1685044800
date2=1687975200
value1=1.234040
value2=1.229514
</object>

<object>
type=20
name=SSSR#S2 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1686060000
date2=1687975200
value1=1.240837
value2=1.238435
</object>

<object>
type=20
name=SSSR#R4 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1686924000
date2=1687975200
value1=1.285760
value2=1.281620
</object>

<object>
type=100
name=SSSR#0LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1688018400
value1=1.231777
</object>

<object>
type=100
name=SSSR#2LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1688018400
value1=1.239636
</object>

<object>
type=100
name=SSSR#4LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1688018400
value1=1.283690
</object>

</window>
</chart>