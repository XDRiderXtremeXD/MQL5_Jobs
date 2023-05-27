<chart>
id=133185559325996109
symbol=GBPCHF
description=Great Britain Pound vs Swiss Franc
period_type=1
period_size=2
digits=5
tick_size=0.000000
position_time=1673294400
scale_fix=0
scale_fixed_min=1.109400
scale_fixed_max=1.137900
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
shift_size=49.767442
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
window_left=478
window_top=121
window_right=1530
window_bottom=723
window_type=3
floating=1
floating_left=516
floating_top=200
floating_right=1885
floating_bottom=1131
floating_type=1
floating_toolbar=1
floating_tbstate=32910,32909,32908,-1,32911,32912,-1,32906,32905,-1,32915,32916,-1,32933,-1,52600,52601,-1,52602,52603,52604,52607,52612,52625,52620,52627,
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
objects=17

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
path=Indicators\SUPRESFINAL.ex5
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
Ver_Sop_Res=false
BackLimit=500
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
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
color=10156544
</graph>
period=50
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PROBANDO INDICADOR.ex5
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
BackLimit=150
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
Viernes=false
S113__===== CONFIGURACION PERIODOS ============================================
M5=true
M6=true
M10=true
M12=true
M15=true
M20=true
M30=true
H1=true
H2=false
H3=false
H4=false
S16_================= CONFIGURACION FILTRO SOP RES CURRENT TIMEFRAME ============================================
FiltroSopResCURRENTTIMEFRAMES=true
zone_fuzzfactor2=0.75
BackLimit2=150
FuerzaSop=0
Cantidad_Coincidencias=1
Period_M5=false
Period_M6=false
Period_M10=false
Period_M12=false
Period_M15=false
Period_M20=false
Period_M30=false
Period_H1=false
Period_H2=true
Period_H3=true
Period_H4=true
Period_H6=true
Period_H8=false
Settings_Alerts=======================  Settings ALERTAS ============================================ 
AlertPC=true
AlertMovil=true
AlertMail=false
conectors==========================  Settings Conector ============================================ 
Conector=false
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
inpFastLength=7
inpSlowLength=15
</inputs>
</indicator>
<object>
name=H2 Vertical Line 10810
color=65535
width=2
ray=1
date1=1670925600
</object>

<object>
type=20
name=SSSR#R0 Strength=Proven, Test Count=4
hidden=1
background=1
selectable=0
filling=1
date1=1669910400
date2=1674784800
value1=1.155450
value2=1.152060
</object>

<object>
type=20
name=SSSR#R1 Strength=Verified, Test Count=3
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1670587200
date2=1674784800
value1=1.144050
value2=1.140810
</object>

<object>
type=20
name=SSSR#R2 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1671012000
date2=1674784800
value1=1.151070
value2=1.147410
</object>

<object>
type=20
name=SSSR#S3 Strength=Proven, Test Count=5
hidden=1
color=3329330
background=1
selectable=0
filling=1
date1=1672408800
date2=1674784800
value1=1.114128
value2=1.108583
</object>

<object>
type=20
name=SSSR#S4 Strength=Proven, Test Count=1
hidden=1
color=3329330
background=1
selectable=0
filling=1
date1=1672768800
date2=1674784800
value1=1.129850
value2=1.123510
</object>

<object>
type=20
name=SSSR#S5 Strength=Verified, Test Count=2
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1673280000
date2=1674784800
value1=1.119988
value2=1.116631
</object>

<object>
type=20
name=SSSR#S6 Strength=Proven, Test Count=4
hidden=1
color=3329330
background=1
selectable=0
filling=1
date1=1674028800
date2=1674784800
value1=1.136330
value2=1.133549
</object>

<object>
type=20
name=SSSR#S7 Strength=Weak
hidden=1
color=5197615
background=1
selectable=0
filling=1
date1=1674208800
date2=1674784800
value1=1.132969
value2=1.130285
</object>

<object>
type=100
name=SSSR#0LBL
hidden=1
width=6
selectable=0
code_arrow=143
date1=1674792000
value1=1.153755
</object>

<object>
type=100
name=SSSR#1LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=142
date1=1674792000
value1=1.142430
</object>

<object>
type=100
name=SSSR#2LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1674792000
value1=1.149240
</object>

<object>
type=100
name=SSSR#3LBL
hidden=1
color=3329330
width=6
selectable=0
code_arrow=144
date1=1674792000
value1=1.111356
</object>

<object>
type=100
name=SSSR#4LBL
hidden=1
color=3329330
width=6
selectable=0
code_arrow=140
date1=1674792000
value1=1.126680
</object>

<object>
type=100
name=SSSR#5LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=141
date1=1674792000
value1=1.118309
</object>

<object>
type=100
name=SSSR#6LBL
hidden=1
color=3329330
width=6
selectable=0
code_arrow=143
date1=1674792000
value1=1.134939
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Debil Soporte                       
color=5197615
selectable=0
angle=0
date1=1674792000
value1=1.131627
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>