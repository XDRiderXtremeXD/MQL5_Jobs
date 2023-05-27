<chart>
id=132912502755419895
symbol=USDJPY
description=US Dollar vs Japanese Yen
period_type=0
period_size=15
digits=3
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=114.570000
scale_fixed_max=115.730000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=1
scroll=0
shift=1
shift_size=19.553073
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=1
lastline=0
days=1
descriptions=0
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
chartline_color=65280
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=65535
stops_color=255
windows_total=5

<window>
height=168.060634
objects=156

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
path=Experts\MI PANEL ANGELO PRO FINAL.ex5::Indicators\INDICADOR PATRONES PRO\PATRONES PRO FINAL.ex5
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
expertmode=536872000
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

<graph>
name=
draw=0
style=0
width=1
color=
</graph>
<inputs>
Espera=5
VelasEvaluadas=500
Testeado=0
Repintado=false
RepintadoFisher=true
Ver_Sop_Res_Historial=false
Hora_Inicio=0
Hora_Final=0
Tolerancia_Puntos_Flecha=30
S00= 
Filter_Estocastico=true
Filter_MA=true
Filter_RSI=true
S0= 
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11= 
Tolerancia_Puntos=0
Period_MA_SLOW=150
Period_MA=50
Shift_MA=0
APP_MA=1
MODE_MA=0
S1_= 
RSI_Period=14
APP_RSI=1
Settings_Alerts= 
Activar_Alerta_Confirmacion=false
Activar_Alerta=false
Audio_Alerta_Confirmacion=alert2
AlertPC=false
AlertMovil=false
AlertMail=false
S1__= 
Ver_Sop_Res=true
BackLimit=3000
pus1= 
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=true
S12_= 
FiltroTrend=true
PeriodoFisher=10
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Experts\MI PANEL ANGELO PRO FINAL.ex5::Indicators\INDICADOR PATRONES PRO\EMA_COLOR.ex5
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
expertmode=536871936
fixed_height=-1

<graph>
name=EMA FAST
draw=1
style=0
width=1
color=65535
</graph>
<inputs>
Periodo=50
Shift_MA=0
APP_MA=1
MODE_MA=0
Label=EMA FAST
Grosor=1
Estilo=0
Color=65535
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Experts\MI PANEL ANGELO PRO FINAL.ex5::Indicators\INDICADOR PATRONES PRO\EMA_COLOR.ex5
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
expertmode=536871936
fixed_height=-1

<graph>
name=EMA SLOW
draw=1
style=0
width=2
color=16777215
</graph>
<inputs>
Periodo=150
Shift_MA=0
APP_MA=1
MODE_MA=0
Label=EMA SLOW
Grosor=2
Estilo=0
Color=16777215
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\fractalsmod.ex5
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
name=Fractal Up
draw=3
style=0
width=1
arrow=115
color=255
</graph>

<graph>
name=Fractal Down
draw=3
style=0
width=1
arrow=115
color=16711680
</graph>
<inputs>
leftbars=5
rightbars=5
shift=5
</inputs>
</indicator>
<object>
type=31
name=autotrade #17500261 buy 0.01 USDJPY at 106.181
hidden=1
color=11296515
selectable=0
date1=1599045764
value1=106.181000
</object>

<object>
type=32
name=autotrade #17528348 sell 0.01 USDJPY at 106.113
hidden=1
color=1918177
selectable=0
date1=1599069916
value1=106.113000
</object>

<object>
type=32
name=autotrade #17827970 sell 0.04 USDJPY at 106.111
hidden=1
color=1918177
selectable=0
date1=1599718069
value1=106.111000
</object>

<object>
type=31
name=autotrade #17829031 buy 0.04 USDJPY at 106.106
hidden=1
color=11296515
selectable=0
date1=1599723461
value1=106.106000
</object>

<object>
type=32
name=autotrade #18041936 sell 0.04 USDJPY at 105.230
hidden=1
color=1918177
selectable=0
date1=1600253773
value1=105.230000
</object>

<object>
type=31
name=autotrade #18055507 buy 0.04 USDJPY at 104.920
hidden=1
color=11296515
selectable=0
date1=1600271358
value1=104.920000
</object>

<object>
type=31
name=autotrade #18074315 buy 0.04 USDJPY at 104.964
hidden=1
color=11296515
selectable=0
date1=1600288051
value1=104.964000
</object>

<object>
type=32
name=autotrade #18086195 sell 0.04 USDJPY at 104.985
hidden=1
color=1918177
selectable=0
date1=1600297317
value1=104.985000
</object>

<object>
type=32
name=autotrade #18161409 sell 0.04 USDJPY at 104.618
hidden=1
color=1918177
selectable=0
date1=1600424363
value1=104.618000
</object>

<object>
type=31
name=autotrade #18162549 buy 0.04 USDJPY at 104.612
hidden=1
descr=[sl 104.612]
color=11296515
selectable=0
date1=1600425997
value1=104.612000
</object>

<object>
type=32
name=autotrade #18518728 sell 0.04 USDJPY at 105.554
hidden=1
color=1918177
selectable=0
date1=1601060855
value1=105.554000
</object>

<object>
type=31
name=autotrade #18523476 buy 0.04 USDJPY at 105.607
hidden=1
color=11296515
selectable=0
date1=1601072505
value1=105.607000
</object>

<object>
type=32
name=autotrade #19534150 sell 0.04 USDJPY at 105.232
hidden=1
color=1918177
selectable=0
date1=1603272439
value1=105.232000
</object>

<object>
type=31
name=autotrade #19538193 buy 0.04 USDJPY at 105.155
hidden=1
color=11296515
selectable=0
date1=1603275992
value1=105.155000
</object>

<object>
type=32
name=autotrade #20248957 sell 0.04 USDJPY at 103.956
hidden=1
color=1918177
selectable=0
date1=1604580992
value1=103.956000
</object>

<object>
type=31
name=autotrade #20249554 buy 0.04 USDJPY at 104.181
hidden=1
descr=[sl 104.176]
color=11296515
selectable=0
date1=1604581462
value1=104.181000
</object>

<object>
type=32
name=autotrade #20716995 sell 0.04 USDJPY at 104.781
hidden=1
color=1918177
selectable=0
date1=1605281917
value1=104.781000
</object>

<object>
type=31
name=autotrade #20735118 buy 0.04 USDJPY at 104.617
hidden=1
color=11296515
selectable=0
date1=1605306580
value1=104.617000
</object>

<object>
type=31
name=autotrade #21653100 buy 0.04 USDJPY at 103.963
hidden=1
color=11296515
selectable=0
date1=1607028613
value1=103.963000
</object>

<object>
type=32
name=autotrade #21707931 sell 0.04 USDJPY at 104.180
hidden=1
color=1918177
selectable=0
date1=1607105091
value1=104.180000
</object>

<object>
type=32
name=autotrade #27097945 sell 0.1 USDJPY at 108.982
hidden=1
color=1918177
selectable=0
date1=1616014884
value1=108.982000
</object>

<object>
type=31
name=autotrade #27128261 buy 0.1 USDJPY at 108.980
hidden=1
descr=[sl 108.980]
color=11296515
selectable=0
date1=1616040023
value1=108.980000
</object>

<object>
type=32
name=autotrade #28397446 sell 0.2 USDJPY at 108.760
hidden=1
color=1918177
selectable=0
date1=1618486847
value1=108.760000
</object>

<object>
type=31
name=autotrade #28424395 buy 0.2 USDJPY at 108.681
hidden=1
color=11296515
selectable=0
date1=1618507420
value1=108.681000
</object>

<object>
type=32
name=autotrade #28808431 sell 0.2 USDJPY at 107.749
hidden=1
color=1918177
selectable=0
date1=1619189563
value1=107.749000
</object>

<object>
type=31
name=autotrade #28823223 buy 0.2 USDJPY at 107.952
hidden=1
descr=[sl 107.950]
color=11296515
selectable=0
date1=1619198145
value1=107.952000
</object>

<object>
type=32
name=autotrade #33370872 sell 0.06 USDJPY at 110.029
hidden=1
color=1918177
selectable=0
date1=1626969255
value1=110.029000
</object>

<object>
type=31
name=autotrade #33420460 buy 0.06 USDJPY at 110.403
hidden=1
descr=[sl 110.402]
color=11296515
selectable=0
date1=1627036407
value1=110.403000
</object>

<object>
type=32
name=autotrade #34352125 sell 0.06 USDJPY at 110.222
hidden=1
color=1918177
selectable=0
date1=1628533304
value1=110.222000
</object>

<object>
type=31
name=autotrade #34367348 buy 0.06 USDJPY at 110.371
hidden=1
descr=[sl 110.370]
color=11296515
selectable=0
date1=1628564900
value1=110.371000
</object>

<object>
type=32
name=autotrade #34607692 sell 0.06 USDJPY at 110.202
hidden=1
color=1918177
selectable=0
date1=1628865255
value1=110.202000
</object>

<object>
type=31
name=autotrade #34626048 buy 0.06 USDJPY at 109.888
hidden=1
color=11296515
selectable=0
date1=1628875329
value1=109.888000
</object>

<object>
type=31
name=autotrade #36640885 buy 0.06 USDJPY at 109.482
hidden=1
color=11296515
selectable=0
date1=1631806211
value1=109.482000
</object>

<object>
type=32
name=autotrade #36656291 sell 0.06 USDJPY at 109.710
hidden=1
color=1918177
selectable=0
date1=1631809315
value1=109.710000
</object>

<object>
type=32
name=autotrade #37521653 sell 0.06 USDJPY at 111.274
hidden=1
color=1918177
selectable=0
date1=1632849830
value1=111.274000
</object>

<object>
type=31
name=autotrade #37617224 buy 0.06 USDJPY at 111.730
hidden=1
descr=[sl 111.725]
color=11296515
selectable=0
date1=1632935644
value1=111.730000
</object>

<object>
type=32
name=autotrade #37704778 sell 0.06 USDJPY at 111.769
hidden=1
color=1918177
selectable=0
date1=1633019268
value1=111.769000
</object>

<object>
type=31
name=autotrade #37753792 buy 0.06 USDJPY at 111.366
hidden=1
color=11296515
selectable=0
date1=1633051298
value1=111.366000
</object>

<object>
type=32
name=autotrade #39738852 sell 0.1 USDJPY at 113.770
hidden=1
color=1918177
selectable=0
date1=1635838426
value1=113.770000
</object>

<object>
type=31
name=autotrade #39789288 buy 0.1 USDJPY at 113.770
hidden=1
color=11296515
selectable=0
date1=1635875704
value1=113.770000
</object>

<object>
type=32
name=autotrade #40182045 sell 0.1 USDJPY at 113.180
hidden=1
color=1918177
selectable=0
date1=1636388287
value1=113.180000
</object>

<object>
type=31
name=autotrade #40342503 buy 0.1 USDJPY at 113.170
hidden=1
descr=[sl 113.170]
color=11296515
selectable=0
date1=1636541757
value1=113.170000
</object>

<object>
type=32
name=autotrade #40569962 sell 0.1 USDJPY at 113.900
hidden=1
color=1918177
selectable=0
date1=1636733743
value1=113.900000
</object>

<object>
type=31
name=autotrade #40583114 buy 0.1 USDJPY at 113.897
hidden=1
descr=[sl 113.897]
color=11296515
selectable=0
date1=1636738503
value1=113.897000
</object>

<object>
type=32
name=autotrade #40706117 sell 0.1 USDJPY at 114.098
hidden=1
color=1918177
selectable=0
date1=1637044243
value1=114.098000
</object>

<object>
type=31
name=autotrade #40736079 buy 0.1 USDJPY at 114.331
hidden=1
descr=[sl 114.331]
color=11296515
selectable=0
date1=1637073949
value1=114.331000
</object>

<object>
type=32
name=autotrade #40837569 sell 0.1 USDJPY at 114.598
hidden=1
color=1918177
selectable=0
date1=1637163100
value1=114.598000
</object>

<object>
type=31
name=autotrade #40854678 buy 0.1 USDJPY at 114.593
hidden=1
descr=[sl 114.590]
color=11296515
selectable=0
date1=1637171161
value1=114.593000
</object>

<object>
type=32
name=autotrade #40929598 sell 0.1 USDJPY at 114.290
hidden=1
color=1918177
selectable=0
date1=1637250344
value1=114.290000
</object>

<object>
type=31
name=autotrade #40960307 buy 0.1 USDJPY at 114.280
hidden=1
color=11296515
selectable=0
date1=1637273881
value1=114.280000
</object>

<object>
type=32
name=autotrade #41014107 sell 0.1 USDJPY at 113.742
hidden=1
color=1918177
selectable=0
date1=1637330569
value1=113.742000
</object>

<object>
type=31
name=autotrade #41061369 buy 0.1 USDJPY at 114.021
hidden=1
color=11296515
selectable=0
date1=1637365016
value1=114.021000
</object>

<object>
type=32
name=autotrade #41139372 sell 0.1 USDJPY at 114.593
hidden=1
color=1918177
selectable=0
date1=1637599639
value1=114.593000
</object>

<object>
type=31
name=autotrade #41167498 buy 0.1 USDJPY at 114.928
hidden=1
color=11296515
selectable=0
date1=1637616359
value1=114.928000
</object>

<object>
type=32
name=autotrade #41201278 sell 0.1 USDJPY at 114.718
hidden=1
color=1918177
selectable=0
date1=1637659704
value1=114.718000
</object>

<object>
type=31
name=autotrade #41335236 buy 0.1 USDJPY at 115.319
hidden=1
descr=[sl 115.306]
color=11296515
selectable=0
date1=1637770203
value1=115.319000
</object>

<object>
type=32
name=autotrade #41419399 sell 0.01 USDJPY at 115.074
hidden=1
color=1918177
selectable=0
date1=1637891553
value1=115.074000
</object>

<object>
type=32
name=autotrade #41419425 sell 0.09 USDJPY at 115.084
hidden=1
color=1918177
selectable=0
date1=1637891593
value1=115.084000
</object>

<object>
type=31
name=autotrade #41458387 buy 0.09 USDJPY at 113.810
hidden=1
descr=[tp 113.810]
color=11296515
selectable=0
date1=1637922181
value1=113.810000
</object>

<object>
type=31
name=autotrade #41458445 buy 0.01 USDJPY at 113.786
hidden=1
descr=[tp 113.792]
color=11296515
selectable=0
date1=1637922195
value1=113.786000
</object>

<object>
type=32
name=autotrade #42571248 sell 0.1 USDJPY at 113.502
hidden=1
color=1918177
selectable=0
date1=1639414378
value1=113.502000
</object>

<object>
type=31
name=autotrade #42580397 buy 0.1 USDJPY at 113.600
hidden=1
descr=[sl 113.600]
color=11296515
selectable=0
date1=1639418212
value1=113.600000
</object>

<object>
type=32
name=autotrade #43017075 sell 0.1 USDJPY at 113.474
hidden=1
color=1918177
selectable=0
date1=1640017813
value1=113.474000
</object>

<object>
type=31
name=autotrade #43022828 buy 0.1 USDJPY at 113.522
hidden=1
descr=[sl 113.521]
color=11296515
selectable=0
date1=1640019593
value1=113.522000
</object>

<object>
type=32
name=autotrade #43360646 sell 0.1 USDJPY at 114.829
hidden=1
color=1918177
selectable=0
date1=1640705460
value1=114.829000
</object>

<object>
type=31
name=autotrade #43366654 buy 0.1 USDJPY at 114.828
hidden=1
descr=[sl 114.827]
color=11296515
selectable=0
date1=1640708308
value1=114.828000
</object>

<object>
type=32
name=autotrade #43368683 sell 0.1 USDJPY at 114.798
hidden=1
color=1918177
selectable=0
date1=1640709418
value1=114.798000
</object>

<object>
type=31
name=autotrade #43368686 buy 0.1 USDJPY at 114.805
hidden=1
descr=[sl 114.804]
color=11296515
selectable=0
date1=1640709418
value1=114.805000
</object>

<object>
type=32
name=autotrade #43368732 sell 0.1 USDJPY at 114.799
hidden=1
color=1918177
selectable=0
date1=1640709430
value1=114.799000
</object>

<object>
type=32
name=autotrade #43372322 sell 0.1 USDJPY at 114.820
hidden=1
color=1918177
selectable=0
date1=1640710723
value1=114.820000
</object>

<object>
type=31
name=autotrade #43381410 buy 0.1 USDJPY at 114.732
hidden=1
descr=[sl 114.730]
color=11296515
selectable=0
date1=1640716660
value1=114.732000
</object>

<object>
type=31
name=autotrade #43381427 buy 0.1 USDJPY at 114.735
hidden=1
descr=[sl 114.734]
color=11296515
selectable=0
date1=1640716677
value1=114.735000
</object>

<object>
type=32
name=autotrade #46189899 sell 0.05 USDJPY at 115.277
hidden=1
color=1918177
selectable=0
date1=1644323084
value1=115.277000
</object>

<object>
type=31
name=autotrade #46223765 buy 0.05 USDJPY at 115.551
hidden=1
descr=[sl 115.551]
color=11296515
selectable=0
date1=1644341904
value1=115.551000
</object>

<object>
type=32
name=autotrade #47326113 sell 0.01 USDJPY at 115.005
hidden=1
color=1918177
selectable=0
date1=1645553429
value1=115.005000
</object>

<object>
type=31
name=autotrade #47340058 buy 0.01 USDJPY at 115.005
hidden=1
descr=[sl 115.004]
color=11296515
selectable=0
date1=1645564551
value1=115.005000
</object>

<object>
type=32
name=autotrade #48206351 sell 0.02 USDJPY at 115.569
hidden=1
color=1918177
selectable=0
date1=1646326821
value1=115.569000
</object>

<object>
type=31
name=autotrade #48358541 buy 0.02 USDJPY at 114.755
hidden=1
color=11296515
selectable=0
date1=1646421290
value1=114.755000
</object>

<object>
type=32
name=autotrade #48630236 sell 0.04 USDJPY at 115.611
hidden=1
color=1918177
selectable=0
date1=1646757574
value1=115.611000
</object>

<object>
type=31
name=autotrade #48656189 buy 0.04 USDJPY at 115.609
hidden=1
descr=[sl 115.609]
color=11296515
selectable=0
date1=1646762420
value1=115.609000
</object>

<object>
type=2
name=autotrade #17500261 -> #17528348 USDJPY
hidden=1
descr=106.181 -> 106.113
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1599045764
date2=1599069916
value1=106.181000
value2=106.113000
</object>

<object>
type=2
name=autotrade #17827970 -> #17829031 USDJPY
hidden=1
descr=106.111 -> 106.106
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599718069
date2=1599723461
value1=106.111000
value2=106.106000
</object>

<object>
type=2
name=autotrade #18041936 -> #18055507 USDJPY
hidden=1
descr=105.230 -> 104.920
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600253773
date2=1600271358
value1=105.230000
value2=104.920000
</object>

<object>
type=2
name=autotrade #18074315 -> #18086195 USDJPY
hidden=1
descr=104.964 -> 104.985
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1600288051
date2=1600297317
value1=104.964000
value2=104.985000
</object>

<object>
type=2
name=autotrade #18161409 -> #18162549 USDJPY
hidden=1
descr=104.618 -> 104.612
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600424363
date2=1600425997
value1=104.618000
value2=104.612000
</object>

<object>
type=2
name=autotrade #18518728 -> #18523476 USDJPY
hidden=1
descr=105.554 -> 105.607
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1601060855
date2=1601072505
value1=105.554000
value2=105.607000
</object>

<object>
type=2
name=autotrade #19534150 -> #19538193 USDJPY
hidden=1
descr=105.232 -> 105.155
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603272439
date2=1603275992
value1=105.232000
value2=105.155000
</object>

<object>
type=2
name=autotrade #20248957 -> #20249554 USDJPY
hidden=1
descr=103.956 -> 104.181
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1604580992
date2=1604581462
value1=103.956000
value2=104.181000
</object>

<object>
type=2
name=autotrade #20716995 -> #20735118 USDJPY
hidden=1
descr=104.781 -> 104.617
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1605281917
date2=1605306580
value1=104.781000
value2=104.617000
</object>

<object>
type=2
name=autotrade #21653100 -> #21707931 USDJPY
hidden=1
descr=103.963 -> 104.180
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1607028613
date2=1607105091
value1=103.963000
value2=104.180000
</object>

<object>
type=2
name=autotrade #27097945 -> #27128261 USDJPY
hidden=1
descr=108.982 -> 108.980
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616014884
date2=1616040023
value1=108.982000
value2=108.980000
</object>

<object>
type=2
name=autotrade #28397446 -> #28424395 USDJPY
hidden=1
descr=108.760 -> 108.681
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618486847
date2=1618507420
value1=108.760000
value2=108.681000
</object>

<object>
type=2
name=autotrade #28808431 -> #28823223 USDJPY
hidden=1
descr=107.749 -> 107.952
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1619189563
date2=1619198145
value1=107.749000
value2=107.952000
</object>

<object>
type=2
name=autotrade #33370872 -> #33420460 USDJPY
hidden=1
descr=110.029 -> 110.403
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626969255
date2=1627036407
value1=110.029000
value2=110.403000
</object>

<object>
type=2
name=autotrade #34352125 -> #34367348 USDJPY
hidden=1
descr=110.222 -> 110.371
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1628533304
date2=1628564900
value1=110.222000
value2=110.371000
</object>

<object>
type=2
name=autotrade #34607692 -> #34626048 USDJPY
hidden=1
descr=110.202 -> 109.888
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1628865255
date2=1628875329
value1=110.202000
value2=109.888000
</object>

<object>
type=2
name=autotrade #36640885 -> #36656291 USDJPY
hidden=1
descr=109.482 -> 109.710
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1631806211
date2=1631809315
value1=109.482000
value2=109.710000
</object>

<object>
type=2
name=autotrade #37521653 -> #37617224 USDJPY
hidden=1
descr=111.274 -> 111.730
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1632849830
date2=1632935644
value1=111.274000
value2=111.730000
</object>

<object>
type=2
name=autotrade #37704778 -> #37753792 USDJPY
hidden=1
descr=111.769 -> 111.366
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1633019268
date2=1633051298
value1=111.769000
value2=111.366000
</object>

<object>
type=2
name=autotrade #39738852 -> #39789288 USDJPY
hidden=1
descr=113.770 -> 113.770
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1635838426
date2=1635875704
value1=113.770000
value2=113.770000
</object>

<object>
type=2
name=autotrade #40182045 -> #40342503 USDJPY
hidden=1
descr=113.180 -> 113.170
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1636388287
date2=1636541757
value1=113.180000
value2=113.170000
</object>

<object>
type=2
name=autotrade #40569962 -> #40583114 USDJPY
hidden=1
descr=113.900 -> 113.897
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1636733743
date2=1636738503
value1=113.900000
value2=113.897000
</object>

<object>
type=2
name=autotrade #40706117 -> #40736079 USDJPY
hidden=1
descr=114.098 -> 114.331
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637044243
date2=1637073949
value1=114.098000
value2=114.331000
</object>

<object>
type=2
name=autotrade #40837569 -> #40854678 USDJPY
hidden=1
descr=114.598 -> 114.593
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637163100
date2=1637171161
value1=114.598000
value2=114.593000
</object>

<object>
type=2
name=autotrade #41014107 -> #41061369 USDJPY
hidden=1
descr=113.742 -> 114.021
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637330569
date2=1637365016
value1=113.742000
value2=114.021000
</object>

<object>
type=2
name=autotrade #40929598 -> #40960307 USDJPY
hidden=1
descr=114.290 -> 114.280
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637250344
date2=1637273881
value1=114.290000
value2=114.280000
</object>

<object>
type=2
name=autotrade #41139372 -> #41167498 USDJPY
hidden=1
descr=114.593 -> 114.928
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637599639
date2=1637616359
value1=114.593000
value2=114.928000
</object>

<object>
type=2
name=autotrade #41201278 -> #41335236 USDJPY
hidden=1
descr=114.718 -> 115.319
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637659704
date2=1637770203
value1=114.718000
value2=115.319000
</object>

<object>
type=2
name=autotrade #41419399 -> #41458445 USDJPY
hidden=1
descr=115.074 -> 113.786
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637891553
date2=1637922195
value1=115.074000
value2=113.786000
</object>

<object>
type=2
name=autotrade #41419425 -> #41458387 USDJPY
hidden=1
descr=115.084 -> 113.810
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637891593
date2=1637922181
value1=115.084000
value2=113.810000
</object>

<object>
type=2
name=autotrade #42571248 -> #42580397 USDJPY
hidden=1
descr=113.502 -> 113.600
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1639414378
date2=1639418212
value1=113.502000
value2=113.600000
</object>

<object>
type=2
name=autotrade #43017075 -> #43022828 USDJPY
hidden=1
descr=113.474 -> 113.522
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640017813
date2=1640019593
value1=113.474000
value2=113.522000
</object>

<object>
type=2
name=autotrade #43360646 -> #43366654 USDJPY
hidden=1
descr=114.829 -> 114.828
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640705460
date2=1640708308
value1=114.829000
value2=114.828000
</object>

<object>
type=2
name=autotrade #43368683 -> #43368686 USDJPY
hidden=1
descr=114.798 -> 114.805
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640709418
date2=1640709418
value1=114.798000
value2=114.805000
</object>

<object>
type=2
name=autotrade #43368732 -> #43381410 USDJPY
hidden=1
descr=114.799 -> 114.732
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640709430
date2=1640716660
value1=114.799000
value2=114.732000
</object>

<object>
type=2
name=autotrade #43372322 -> #43381427 USDJPY
hidden=1
descr=114.820 -> 114.735
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640710723
date2=1640716677
value1=114.820000
value2=114.735000
</object>

<object>
type=2
name=autotrade #46189899 -> #46223765 USDJPY
hidden=1
descr=115.277 -> 115.551
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1644323084
date2=1644341904
value1=115.277000
value2=115.551000
</object>

<object>
type=2
name=autotrade #47326113 -> #47340058 USDJPY
hidden=1
descr=115.005 -> 115.005
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1645553429
date2=1645564551
value1=115.005000
value2=115.005000
</object>

<object>
type=2
name=autotrade #48206351 -> #48358541 USDJPY
hidden=1
descr=115.569 -> 114.755
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1646326821
date2=1646421290
value1=115.569000
value2=114.755000
</object>

<object>
type=2
name=autotrade #48630236 -> #48656189 USDJPY
hidden=1
descr=115.611 -> 115.609
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1646757574
date2=1646762420
value1=115.611000
value2=115.609000
</object>

<object>
name=M15 Vertical Line 48564
color=16776960
ray=1
date1=1646413260
</object>

<object>
name=M15 Vertical Line 61335
color=16776960
ray=1
date1=1646228700
</object>

<object>
type=20
name=SSSR#S0 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1643056200
date2=1646787600
value1=113.690696
value2=113.629982
</object>

<object>
type=20
name=SSSR#S1 Strength=Proven, Test Count=5
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1643103000
date2=1646787600
value1=113.844000
value2=113.728304
</object>

<object>
type=20
name=SSSR#S2 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1643117400
date2=1646787600
value1=114.202429
value2=114.105000
</object>

<object>
type=20
name=SSSR#S3 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1643148000
date2=1646787600
value1=113.959000
value2=113.915000
</object>

<object>
type=20
name=SSSR#S4 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1643830200
date2=1646787600
value1=114.371000
value2=114.278589
</object>

<object>
type=20
name=SSSR#R5 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1644509700
date2=1646787600
value1=116.384000
value2=116.280000
</object>

<object>
type=20
name=SSSR#R6 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1644545700
date2=1646787600
value1=116.193000
value2=116.135000
</object>

<object>
type=20
name=SSSR#R7 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1644576300
date2=1646787600
value1=116.125000
value2=116.046000
</object>

<object>
type=20
name=SSSR#R8 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1644605100
date2=1646787600
value1=116.018000
value2=115.936000
</object>

<object>
type=20
name=SSSR#R9 Strength=Proven, Test Count=13
hidden=1
background=1
selectable=0
filling=1
date1=1644944400
date2=1646787600
value1=115.912000
value2=115.699000
</object>

<object>
type=20
name=SSSR#S10 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1645694100
date2=1646787600
value1=114.477107
value2=114.373446
</object>

<object>
type=20
name=SSSR#S11 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1645707600
date2=1646787600
value1=114.689375
value2=114.540036
</object>

<object>
type=20
name=SSSR#S12 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1646614800
date2=1646787600
value1=114.893750
value2=114.795982
</object>

<object>
type=20
name=SSSR#S13 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1646658900
date2=1646787600
value1=115.060536
value2=115.001232
</object>

<object>
type=20
name=SSSR#S14 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1646694000
date2=1646787600
value1=115.286000
value2=115.217411
</object>

<object>
type=20
name=SSSR#S15 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1646713800
date2=1646787600
value1=115.450929
value2=115.332821
</object>

<object>
type=20
name=SSSR#S16 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1646768700
date2=1646787600
value1=115.600268
value2=115.545732
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=113.660339
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Probado Soporte, Retesteado=5       
color=16777215
selectable=0
angle=0
date1=1646794243
value1=113.786152
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=114.153714
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1646794124
value1=113.937000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=114.324795
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1646794194
value1=116.332000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1646794292
value1=116.164000
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
date1=1646794159
value1=116.085500
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1646794194
value1=115.977000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=Probado Resistencia, Retesteado=13  
color=16777215
selectable=0
angle=0
date1=1646794278
value1=115.805500
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#10LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1646794166
value1=114.425277
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=114.614705
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#12LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=114.844866
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#13LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1646794131
value1=115.030884
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#14LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1646794166
value1=115.251705
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#15LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1646794264
value1=115.391875
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#16LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1646794131
value1=115.573000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>

<window>
height=16.418251
objects=0

<indicator>
name=Custom Indicator
path=Indicators\ADX_Histogram_Minus_v1.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-0.105000
scale_fix_max=0
scale_fix_max_val=1.105000
expertmode=0
fixed_height=-1

<graph>
name=Color_Histogram
draw=11
style=0
width=2
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodIndicator=14
LevelIndicator=30
</inputs>
</indicator>
</window>

<window>
height=15.521115
objects=0

<indicator>
name=Custom Indicator
path=Indicators\ADX_Histogram_Plus_v1.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-0.105000
scale_fix_max=0
scale_fix_max_val=1.105000
expertmode=0
fixed_height=-1

<graph>
name=Color_Histogram
draw=11
style=0
width=2
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodIndicator=14
LevelIndicator=30
</inputs>
</indicator>
</window>

<window>
height=50.000000
objects=0

<indicator>
name=Average Directional Movement Index
path=
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-1.820200
scale_fix_max=0
scale_fix_max_val=55.670200
expertmode=0
fixed_height=-1

<graph>
name=
draw=1
style=0
width=1
color=9639167
</graph>

<graph>
name=
draw=1
style=2
width=1
color=3329434
</graph>

<graph>
name=
draw=1
style=2
width=1
color=11788021
</graph>

<level>
level=35.000000
style=2
color=65535
width=1
descr=
</level>

<level>
level=55.000000
style=2
color=65535
width=1
descr=
</level>
period=14
</indicator>
</window>

<window>
height=50.000000
objects=2

<indicator>
name=MACD
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=-0.216393
scale_fix_max=0
scale_fix_max_val=0.233563
expertmode=0
fixed_height=-1

<graph>
name=
draw=2
style=0
width=1
color=12632256
</graph>

<graph>
name=
draw=1
style=2
width=1
color=255
</graph>
fast_ema=50
slow_ema=150
macd_sma=9
</indicator>
<object>
type=1
name=M5 Horizontal Line 21869
color=13850042
width=2
value1=-0.050000
</object>

<object>
type=1
name=M15 Horizontal Line 30957
color=13850042
width=2
value1=0.050000
</object>

</window>
</chart>