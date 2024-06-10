<chart>
id=133526468095323059
symbol=CADJPY
description=Canadian Dollar vs Japanese Yen
period_type=1
period_size=2
digits=3
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=104.140000
scale_fixed_max=110.490000
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
shift_size=19.227053
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
window_left=0
window_top=0
window_right=0
window_bottom=0
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

<window>
height=166.731363
objects=0

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
path=Indicators\R3.ex5
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
VelasEvaluadas=50000
Testeado=1
Repintado=false
Tolerancia_Puntos_Flecha=30
S1__======================  Configuracion SOP RES ===========================================
BackLimit=500
zone_fuzzfactor=0.75
S111__==============   Configuracion TREND FORCE =========================
inpFastLength=10
inpSlowLength=30
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
M5=true
M6=true
M10=true
M12=true
M15=true
M20=true
M30=true
H1=false
H2=false
H3=false
H4=false
S16_================= CONFIGURACION FILTRO SOP RES CURRENT TIMEFRAME ============================================
FiltroSopResCURRENTTIMEFRAMES=true
zone_fuzzfactor2=0.75
BackLimit2=500
FuerzaSop=0
Cantidad_Coincidencias=2
Period_M5=false
Period_M6=false
Period_M10=false
Period_M12=false
Period_M15=false
Period_M20=false
Period_M30=false
Period_H1=true
Period_H2=false
Period_H3=false
Period_H4=true
Period_H6=false
Period_H8=false
Period_D1=true
Settings_Alerts=======================  Settings ALERTAS ============================================ 
AlertPC=true
AlertMovil=true
AlertMail=false
conectors==========================  Settings Conector ============================================ 
Conector=false
sC==========================  Settings Size ============================================ 
sizeCandle=250
</inputs>
</indicator>
</window>
</chart>