<chart>
id=132853657820171097
symbol=AUS200
description=Australia 200 Index
period_type=0
period_size=15
digits=1
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=7333.485274
scale_fixed_max=7553.829452
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
shift_size=19.118352
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
objects=32

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
path=Indicators\Supply And Demand V4.0.ex5
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

<graph>
name=ner up zone P1
draw=0
style=0
width=1
color=
</graph>

<graph>
name=ner up zone P2
draw=0
style=0
width=1
color=
</graph>

<graph>
name=ner dn zone P1
draw=0
style=0
width=1
color=
</graph>

<graph>
name=ner dn zone P2
draw=0
style=0
width=1
color=
</graph>
<inputs>
Testeado=1
TransparienciaDePatronesSinRSIoEST=true
Hora_Inicio=8
Hora_Final=8
Tipo_de_Datos=1
Filtro_Traspaso_50=false
Tolerancia_Puntos_Flecha=50
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Filter_MA=true
Tolerancia_Puntos=0
Period_MA_SLOW=150
Period_MA=50
Shift_MA=0
APP_MA=1
MODE_MA=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=7
Momentun_Applied_Price=1
S1_=-----------------------   Configuracion RSI---------------------
Condicion_Signal_Contrarias=true
RSI_Period=14
APP_RSI=1
Settings_Alerts=***Settings_Alerts***
AlertPC=false
AlertMovil=false
AlertMail=false
BackLimit=3000
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
fractals_show=false
color_support_weak=13959039
color_support_untested=15130800
color_support_verified=15453831
color_support_proven=13688896
color_support_turncoat=36095
color_resist_weak=14053594
color_resist_untested=13850042
color_resist_verified=3937500
color_resist_proven=255
color_resist_turncoat=36095
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
color=16711935
</graph>
period=50
method=0
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
color=16777215
</graph>
period=150
method=0
</indicator>
<object>
type=20
name=SSSR#S0 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1636959600
date2=1640904300
value1=7481.303571
value2=7472.592857
</object>

<object>
type=20
name=SSSR#S1 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1636991100
date2=1640904300
value1=7464.926786
value2=7460.346429
</object>

<object>
type=20
name=SSSR#S2 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1637098200
date2=1640904300
value1=7453.325000
value2=7445.778571
</object>

<object>
type=20
name=SSSR#S3 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1638405900
date2=1640904300
value1=7149.614286
value2=7122.292857
</object>

<object>
type=20
name=SSSR#S4 Strength=Proven, Test Count=8
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1638441000
date2=1640904300
value1=7211.800000
value2=7189.332143
</object>

<object>
type=20
name=SSSR#S5 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1638794700
date2=1640904300
value1=7239.839286
value2=7231.760714
</object>

<object>
type=20
name=SSSR#S6 Strength=Verified, Test Count=0
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1638971100
date2=1640904300
value1=7429.630357
value2=7407.485714
</object>

<object>
type=20
name=SSSR#S7 Strength=Proven, Test Count=11
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1639764000
date2=1640904300
value1=7345.685714
value2=7325.787500
</object>

<object>
type=20
name=SSSR#S8 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1639979100
date2=1640904300
value1=7313.051786
value2=7300.100000
</object>

<object>
type=20
name=SSSR#S9 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1639998900
date2=1640904300
value1=7265.100000
value2=7242.350000
</object>

<object>
type=20
name=SSSR#S10 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640039400
date2=1640904300
value1=7290.100000
value2=7282.412500
</object>

<object>
type=20
name=SSSR#S11 Strength=Proven, Test Count=1
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1640115000
date2=1640904300
value1=7388.000000
value2=7374.057143
</object>

<object>
type=20
name=SSSR#S12 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640255400
date2=1640904300
value1=7395.100000
value2=7389.403571
</object>

<object>
type=20
name=SSSR#S13 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640273400
date2=1640904300
value1=7405.707143
value2=7401.046429
</object>

<object>
type=20
name=SSSR#S14 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1640842200
date2=1640904300
value1=7514.600000
value2=7505.696429
</object>

<object>
type=20
name=SSSR#R15 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1640892600
date2=1640904300
value1=7553.957143
value2=7549.242857
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7476.948214
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7462.636607
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7449.551786
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7135.953571
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Probado Soporte, Retesteado=8       
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7200.566071
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7235.800000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Verificado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7418.558036
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Probado Soporte, Retesteado=11      
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7335.736607
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7306.575893
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7253.725000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#10LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7286.256250
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=Probado Soporte, Retesteado=1       
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7381.028571
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#12LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7392.251786
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
date1=1640917714
value1=7403.376786
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#14LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7510.148214
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#15LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1640917714
value1=7551.600000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>