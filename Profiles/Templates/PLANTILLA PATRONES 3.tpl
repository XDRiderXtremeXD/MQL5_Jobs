<chart>
id=133310722441529439
symbol=USDJPY
description=US Dollar vs Japanese Yen
period_type=1
period_size=2
digits=3
tick_size=0.000000
position_time=1682553600
scale_fix=0
scale_fixed_min=133.690000
scale_fixed_max=141.030000
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
shift_size=19.304780
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
tradehistory=1
window_left=130
window_top=130
window_right=2158
window_bottom=796
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
expertmode=0
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
height=166.731363
objects=3

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
VelasEvaluadas=3
Testeado=1
Repintado=false
Tolerancia_Puntos_Flecha=0
S1__======================  Configuracion SOP RES ===========================================
BackLimit=500
zone_fuzzfactor=0.5
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
M6=true
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
FiltroSopResCURRENTTIMEFRAMES=false
zone_fuzzfactor2=3.0
BackLimit2=400
FuerzaSop=1
Cantidad_Coincidencias=1
Period_M5=true
Period_M6=true
Period_M10=true
Period_M12=true
Period_M15=true
Period_M20=true
Period_M30=true
Period_H1=false
Period_H2=false
Period_H3=false
Period_H4=false
Period_H6=false
Period_H8=false
Settings_Alerts=======================  Settings ALERTAS ============================================ 
AlertPC=true
AlertMovil=true
AlertMail=false
conectors==========================  Settings Conector ============================================ 
Conector=false
sC==========================  Settings Size ============================================ 
sizeCandle=350
S6=-----------------------   Configuracion Bollinger  ---------------------
BB_Period=20
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
</window>
</chart>