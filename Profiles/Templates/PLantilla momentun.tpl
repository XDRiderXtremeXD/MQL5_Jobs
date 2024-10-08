<chart>
id=132825351615073537
symbol=EURUSD
description=Euro vs US Dollar
period_type=0
period_size=5
digits=5
tick_size=0.000000
position_time=1636725600
scale_fix=0
scale_fixed_min=1.118400
scale_fixed_max=1.133300
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=2
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=19.177253
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
window_left=130
window_top=130
window_right=2056
window_bottom=800
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
height=137.033298
objects=2520

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
<inputs>
TransparienciaDePatronesSinRSIoEST=false
STO_Price=2
Velas_Confirmacion=6
Hora_Inicio=0
Hora_Final=0
Nivel=0.08
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Filter_MA=false
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
color=-1
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=115
color=-1
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=104
color=-1
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=170
color=-1
</graph>
<inputs>
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
VelasOpuestasEnVolumen=false
VelasOpuestasEnVolumen_Alert=false
VelasOpuestasEnVolumenx2=false
VelasOpuestasEnVolumenx2_Alert=false
VelasOpuestasEnVolumenConMartillo=false
VelasOpuestasEnVolumenConMartillo_Alert=false
VelasRSI=true
VelasRSI_Alert=false
VelasEST=false
VelasEST_Alert=false
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
type=101
name=VelasRSI1637968200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637967600
value1=1.133180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637949900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637949300
value1=1.132110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637934000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637933400
value1=1.129810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637923500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637922900
value1=1.127840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637918700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637918100
value1=1.124210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637917500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637916900
value1=1.123430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637903400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637902800
value1=1.123010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637837700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637837100
value1=1.122770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637809500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637808900
value1=1.121340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637808000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637807400
value1=1.121280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637768700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637768100
value1=1.119140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637756400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637755800
value1=1.120740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637751900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637751300
value1=1.121830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637749200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637748600
value1=1.125690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637700000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637699400
value1=1.124500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637699100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637698500
value1=1.124610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637693400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637692800
value1=1.127160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637691300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637690700
value1=1.126740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637666400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637665800
value1=1.127630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637660700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637660100
value1=1.125770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637641800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637641200
value1=1.122700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637634900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637634300
value1=1.124680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637619000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637618400
value1=1.122940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637599800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637599200
value1=1.123900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637545800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637545200
value1=1.127130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637351400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637350800
value1=1.129090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637334900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637334300
value1=1.126150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637324400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637323800
value1=1.128480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637323200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637322600
value1=1.129250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637322600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637322000
value1=1.129800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637295600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637295000
value1=1.135360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637295000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637294400
value1=1.135390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637292300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637291700
value1=1.135650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637288400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637287800
value1=1.136180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637266500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637265900
value1=1.137700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637264700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637264100
value1=1.137540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637263200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637262600
value1=1.137290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637256600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637256000
value1=1.136010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637243700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637243100
value1=1.134850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637229600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637229000
value1=1.134130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637222100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637221500
value1=1.131620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637221200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637220600
value1=1.131620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637220000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637219400
value1=1.131800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637209500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637208900
value1=1.134050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637159100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637158500
value1=1.133420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637129100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637128500
value1=1.128740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637128500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637127900
value1=1.128540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637091900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637091300
value1=1.131980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637080200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637079600
value1=1.132900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637066700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637066100
value1=1.135140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637017800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637017200
value1=1.136070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637008200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637007600
value1=1.137960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637007300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637006700
value1=1.138020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637000400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636999800
value1=1.141460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636998600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636998000
value1=1.141950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636973400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636972800
value1=1.143580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636971300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636970700
value1=1.144630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636950000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636949400
value1=1.146170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636949400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636948800
value1=1.146300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636711200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636710600
value1=1.145810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636710600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636710000
value1=1.145740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636688700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636688100
value1=1.143470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636668900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636668300
value1=1.144170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636662300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636661700
value1=1.144630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636661100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636660500
value1=1.144970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636626300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636625700
value1=1.145250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636607400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636606800
value1=1.146330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636577100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636576500
value1=1.148700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636576200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636575600
value1=1.148640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636567200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636566600
value1=1.151190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636553100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636552500
value1=1.154560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636542600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636542000
value1=1.155810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636538100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636537500
value1=1.156390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636531500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636530900
value1=1.157610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636519800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636519200
value1=1.158190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636476900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636476300
value1=1.160970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636474200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636473600
value1=1.160300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636454100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636453500
value1=1.158200
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
date1=1636444200
value1=1.160760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636441200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636440600
value1=1.160240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636439400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636438800
value1=1.159820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636393200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636392600
value1=1.159620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636364700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636364100
value1=1.155180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636345200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636344600
value1=1.155170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636344600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636344000
value1=1.155360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636343100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636342500
value1=1.155530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636143300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636142700
value1=1.156980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636138800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636138200
value1=1.155910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636138200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636137600
value1=1.155490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636126800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636126200
value1=1.152110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636118100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636117500
value1=1.153340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636115700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636115100
value1=1.153810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636114500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636113900
value1=1.153990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636108800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636108200
value1=1.156580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636100400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636099800
value1=1.155900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636099800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636099200
value1=1.155940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636092900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636092300
value1=1.153980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636050900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636050300
value1=1.152690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636042800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636042200
value1=1.157400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636033200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636032600
value1=1.154140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636029600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636029000
value1=1.154770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636028700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636028100
value1=1.154750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636027800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636027200
value1=1.154810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636027200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636026600
value1=1.154880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636023000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636022400
value1=1.157040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636022400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636021800
value1=1.156870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636020300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636019700
value1=1.157600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636019400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636018800
value1=1.157840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636017900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636017300
value1=1.157990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636016400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636015800
value1=1.158450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636014600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636014000
value1=1.158600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636009800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636009200
value1=1.159230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636003200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636002600
value1=1.159970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635977100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635976500
value1=1.161360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635973800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635973200
value1=1.160200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635960300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635959700
value1=1.156180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635943500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635942900
value1=1.160030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635873900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635873300
value1=1.158120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635855000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635854400
value1=1.158490
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
date1=1635839400
value1=1.160990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635804300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635803700
value1=1.160900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635803400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635802800
value1=1.160770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635801900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635801300
value1=1.160600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635792600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635792000
value1=1.159610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635757500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635756900
value1=1.156640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635756600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635756000
value1=1.156400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635755400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635754800
value1=1.156200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635753000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635752400
value1=1.154600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635750600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635750000
value1=1.154770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635737100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635736500
value1=1.155160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635537900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635537300
value1=1.153660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635525000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635524400
value1=1.162250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635511200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635510600
value1=1.164370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635510600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635510000
value1=1.164610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635510000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635509400
value1=1.164650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635507900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635507300
value1=1.165050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635501600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635501000
value1=1.165760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635495600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635495000
value1=1.166500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635494100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635493500
value1=1.166970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635486000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635485400
value1=1.167190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635447600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635447000
value1=1.169300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635445500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635444900
value1=1.168900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635444000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635443400
value1=1.168940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635438900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635438300
value1=1.164470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635437100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635436500
value1=1.164120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635422400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635421800
value1=1.158360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635413100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635412500
value1=1.159680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635400200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635399600
value1=1.161230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635398400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635397800
value1=1.161190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635393600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635393000
value1=1.158870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635392700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635392100
value1=1.158980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635390300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635389700
value1=1.159670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635389100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635388500
value1=1.159740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635387900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635387300
value1=1.159770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635373500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635372900
value1=1.159780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635350100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635349500
value1=1.162610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635346200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635345600
value1=1.161060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635338400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635337800
value1=1.158480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635325800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635325200
value1=1.159390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635307800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635307200
value1=1.160720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635306600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635306000
value1=1.160480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635304800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635304200
value1=1.160370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635293400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635292800
value1=1.158630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635274800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635274200
value1=1.158570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635271500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635270900
value1=1.159180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635266400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635265800
value1=1.160040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635258000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635257400
value1=1.162820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635257400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635256800
value1=1.162660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635219900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635219300
value1=1.159950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635214200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635213600
value1=1.160480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635178200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635177600
value1=1.159390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635169200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635168600
value1=1.161880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635157200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635156600
value1=1.164220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635146400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635145800
value1=1.166680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634944200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634943600
value1=1.164570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634943000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634942400
value1=1.164490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634916300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634915700
value1=1.162320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634915700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634915100
value1=1.162670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634900100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634899500
value1=1.164700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634895900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634895300
value1=1.163770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634852100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634851500
value1=1.162090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634812200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634811600
value1=1.163940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634810400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634809800
value1=1.164410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634805900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634805300
value1=1.164670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634804100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634803500
value1=1.165030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634801700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634801100
value1=1.165260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634795400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634794800
value1=1.166910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634793600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634793000
value1=1.166660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634791800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634791200
value1=1.166510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634784900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634784300
value1=1.165940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634760000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634759400
value1=1.166060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634759100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634758500
value1=1.165920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634745600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634745000
value1=1.164560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634727300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634726700
value1=1.161960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634725500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634724900
value1=1.162710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634718000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634717400
value1=1.165420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634715300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634714700
value1=1.165270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634714700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634714100
value1=1.165060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634705400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634704800
value1=1.164930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634665800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634665200
value1=1.163150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634661000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634660400
value1=1.164020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634659800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634659200
value1=1.164390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634658000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634657400
value1=1.164480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634629500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634628900
value1=1.165640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634626200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634625600
value1=1.164900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634623800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634623200
value1=1.164460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634622300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634621700
value1=1.164150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634619900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634619300
value1=1.163710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634615700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634615100
value1=1.162510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634614800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634614200
value1=1.162500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634588100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634587500
value1=1.162520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634587500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634586900
value1=1.162520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634586600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634586000
value1=1.162460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634585400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634584800
value1=1.162090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634571000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634570400
value1=1.161140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634569800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634569200
value1=1.160650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634555700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634555100
value1=1.159770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634549700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634549100
value1=1.157220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634544600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634544000
value1=1.157730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634542500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634541900
value1=1.157980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634539500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634538900
value1=1.158050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634529900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634529300
value1=1.158180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634527500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634526900
value1=1.159010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634335500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634334900
value1=1.160880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634312400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634311800
value1=1.159250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634279700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634279100
value1=1.161250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634277000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634276400
value1=1.161030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634273400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634272800
value1=1.160460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634272800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634272200
value1=1.160460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634267100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634266500
value1=1.158870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634266500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634265900
value1=1.158940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634252100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634251500
value1=1.160440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634249100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634248500
value1=1.160250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634233800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634233200
value1=1.158460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634225100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634224500
value1=1.159670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634214900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634214300
value1=1.162500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634212500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634211900
value1=1.162120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634207700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634207100
value1=1.161370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634200500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634199900
value1=1.158620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634188200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634187600
value1=1.158740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634165700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634165100
value1=1.159970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634158500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634157900
value1=1.159500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634140200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634139600
value1=1.153820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634104500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634103900
value1=1.155740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634103600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634103000
value1=1.155850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634095800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634095200
value1=1.153950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634068200
value1=1.152370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634053800
value1=1.153370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634033100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634032500
value1=1.157160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634026800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634026200
value1=1.156630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634021700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634021100
value1=1.156330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634020200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634019600
value1=1.156180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634019300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634018700
value1=1.156200
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
date1=1634017800
value1=1.156020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633994700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633994100
value1=1.154840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633987800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633987200
value1=1.155470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633984800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633984200
value1=1.155850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633972800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633972200
value1=1.158680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633957200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633956600
value1=1.155130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633955700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633955100
value1=1.155440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633946400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633945800
value1=1.158790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633923600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633923000
value1=1.158080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633921200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633920600
value1=1.156330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633730700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633730100
value1=1.158020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633730100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633729500
value1=1.158010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633729500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633728900
value1=1.158020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633707900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633707300
value1=1.158430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633700400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633699800
value1=1.157070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633699500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633698900
value1=1.157010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633695600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633695000
value1=1.156420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633683900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633683300
value1=1.154030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633680300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633679700
value1=1.154670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633643400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633642800
value1=1.154800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633617900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633617300
value1=1.157400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633602000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633601400
value1=1.157280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633576800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633576200
value1=1.156210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633527000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633526400
value1=1.152950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633526400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633525800
value1=1.153020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633523700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633523100
value1=1.154490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633523100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633522500
value1=1.154730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633521900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633521300
value1=1.154940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633521300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633520700
value1=1.154990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633520100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633519500
value1=1.155580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633512900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633512300
value1=1.157420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633511400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633510800
value1=1.157460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633506900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633506300
value1=1.158270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633459200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633458600
value1=1.161510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633450500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633449900
value1=1.158490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633423500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633422900
value1=1.158890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633421100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633420500
value1=1.159300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633410600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633410000
value1=1.160180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633362300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633361700
value1=1.164120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633345800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633345200
value1=1.161880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633341900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633341300
value1=1.160970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633335900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633335300
value1=1.160280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633330500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633329900
value1=1.158700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633323600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633323000
value1=1.159310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633315500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633314900
value1=1.161370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633312800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633312200
value1=1.161190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633311900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633311300
value1=1.161020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633101300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633100700
value1=1.160580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633099500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633098900
value1=1.160610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633083300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633082700
value1=1.159120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633062300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633061700
value1=1.156300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633058400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633057800
value1=1.156960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633011600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633011000
value1=1.156740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632970800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632970200
value1=1.160510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632949800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632949200
value1=1.158930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632945000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632944400
value1=1.159950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632937800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632937200
value1=1.160980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632934200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632933600
value1=1.163180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632925800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632925200
value1=1.163890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632911400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632910800
value1=1.165770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632825600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632825000
value1=1.167070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632824400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632823800
value1=1.167290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632817200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632816600
value1=1.170560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632802500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632801900
value1=1.168470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632801600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632801000
value1=1.168500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632787800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632787200
value1=1.169290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632744300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632743700
value1=1.168780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632743100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632742500
value1=1.168760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632741900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632741300
value1=1.169050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632737700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632737100
value1=1.170390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632735600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632735000
value1=1.171150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632734100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632733500
value1=1.171390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632701400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632700800
value1=1.172780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632500100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632499500
value1=1.170100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632498900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632498300
value1=1.170790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632495900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632495300
value1=1.171250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632495000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632494400
value1=1.171260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632493800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632493200
value1=1.171780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632471900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632471300
value1=1.173440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632471300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632470700
value1=1.173450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632419100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632418500
value1=1.175210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632417600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632417000
value1=1.175230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632412200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632411600
value1=1.173360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632392100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632391500
value1=1.172710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632390600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632390000
value1=1.171950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632387000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632386400
value1=1.171580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632384300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632383700
value1=1.171250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632381000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632380400
value1=1.171110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632376200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632375600
value1=1.170070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632373500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632372900
value1=1.169770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632368400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632367800
value1=1.168240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632348600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632348000
value1=1.168570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632345600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632345000
value1=1.175860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632344100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632343500
value1=1.172100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632343200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632342600
value1=1.172390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632331500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632330900
value1=1.174760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632295500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632294900
value1=1.171580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632293400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632292800
value1=1.171790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632283800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632283200
value1=1.171520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632283200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632282600
value1=1.171620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632237300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632236700
value1=1.175160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632221700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632221100
value1=1.171700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632219000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632218400
value1=1.172400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632201300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632200700
value1=1.174190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632134100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632133500
value1=1.170460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632120600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632120000
value1=1.170840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632118200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632117600
value1=1.171110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632117000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632116400
value1=1.171140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632112200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632111600
value1=1.171860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631905200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631904600
value1=1.172900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631904300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631903700
value1=1.173120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631902500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631901900
value1=1.172770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631900400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631899800
value1=1.174160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631898300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631897700
value1=1.175210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631896500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631895900
value1=1.175460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631874000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631873400
value1=1.178630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631866500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631865900
value1=1.177710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631864700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631864100
value1=1.177550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631848800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631848200
value1=1.175940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631831400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631830800
value1=1.177100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631808900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631808300
value1=1.175060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631808300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631807700
value1=1.175100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631807700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631807100
value1=1.175190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631794800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631794200
value1=1.176480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631793900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631793300
value1=1.177010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631791500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631790900
value1=1.177260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631790000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631789400
value1=1.177660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631787600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631787000
value1=1.178480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631786700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631786100
value1=1.178770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631783100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631782500
value1=1.180030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631778000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631777400
value1=1.180850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631776200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631775600
value1=1.180970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631757600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631757000
value1=1.182350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631755800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631755200
value1=1.182160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631746200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631745600
value1=1.182020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631707200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631706600
value1=1.183120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631681400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631680800
value1=1.181390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631659800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631659200
value1=1.180140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631655900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631655300
value1=1.180950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631636400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631635800
value1=1.184740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631634000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631633400
value1=1.184420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631628600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631628000
value1=1.180160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631625900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631625300
value1=1.180510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631624100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631623500
value1=1.180780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631616000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631615400
value1=1.183100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631598900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631598300
value1=1.182190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631558400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631557800
value1=1.181990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631553900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631553300
value1=1.180950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631544000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631543400
value1=1.177220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631543100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631542500
value1=1.177230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631542500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631541900
value1=1.177250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631528100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631527500
value1=1.177320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631527500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631526900
value1=1.177460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631526000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631525400
value1=1.178440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631523000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631522400
value1=1.178960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631507700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631507100
value1=1.180130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631506500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631505900
value1=1.180230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631504400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631503800
value1=1.180510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631291400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631290800
value1=1.182150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631282400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631281800
value1=1.182630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631281500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631280900
value1=1.182920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631274000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631273400
value1=1.185310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631273100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631272500
value1=1.185100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631271600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631271000
value1=1.184660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631270700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631270100
value1=1.184620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631254500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631253900
value1=1.183510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631218800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631218200
value1=1.184160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631180700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631180100
value1=1.182710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631174100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631173500
value1=1.181010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631166300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631165700
value1=1.182720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631146200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631145600
value1=1.181180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631142600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631142000
value1=1.181520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631129700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631129100
value1=1.183080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631123400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631122800
value1=1.180070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631101200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631100600
value1=1.181590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631093700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631093100
value1=1.182720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631091600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631091000
value1=1.183380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631083800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631083200
value1=1.183960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631082600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631082000
value1=1.184000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631076600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631076000
value1=1.185400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631032200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631031600
value1=1.184240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631031600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631031000
value1=1.184310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631030700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631030100
value1=1.184640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631007600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631007000
value1=1.186340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631002500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631001900
value1=1.187000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630990200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630989600
value1=1.188690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630987800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630987200
value1=1.188430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630987200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630986600
value1=1.188350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630931400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630930800
value1=1.185440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630924500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630923900
value1=1.186060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630917300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630916700
value1=1.186500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630910700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630910100
value1=1.186500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630908000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630907400
value1=1.187120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630712700
value1=1.187470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630683600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630683000
value1=1.190240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630642200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630641600
value1=1.188670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630641300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630640700
value1=1.188490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630639200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630638600
value1=1.188040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630622100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630621500
value1=1.187870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630617600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630617000
value1=1.187650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630602000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630601400
value1=1.186410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630578600
value1=1.185440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630573800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630573200
value1=1.184940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630569900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630569300
value1=1.183290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630552800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630552200
value1=1.184900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630519500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630518900
value1=1.185760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630515600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630515000
value1=1.184930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630512900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630512300
value1=1.184170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630511400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630510800
value1=1.184190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630491000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630490400
value1=1.181560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630485900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630485300
value1=1.179470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630470300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630469700
value1=1.179960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630468800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630468200
value1=1.180030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630435500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630434900
value1=1.179510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630434300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630433700
value1=1.179830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630433400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630432800
value1=1.179910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630427100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630426500
value1=1.181610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630419900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630419300
value1=1.184800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630403100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630402500
value1=1.183440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630400700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630400100
value1=1.183080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630395300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630394700
value1=1.182460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630389000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630388400
value1=1.181040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630384800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630384200
value1=1.180890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630369200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630368600
value1=1.179280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630361100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630360500
value1=1.180670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630339500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630338900
value1=1.178130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630316700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630316100
value1=1.179210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630314300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630313700
value1=1.179800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630301100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630300500
value1=1.181230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630298400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630297800
value1=1.181000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630296300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630295700
value1=1.180810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630295700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630295100
value1=1.180860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630286400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630285800
value1=1.180330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630086600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630086000
value1=1.180420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630085100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630084500
value1=1.179770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630081500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630080900
value1=1.173370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630065900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630065300
value1=1.174940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630065000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630064400
value1=1.174920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630064100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630063500
value1=1.175040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630059300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630058700
value1=1.177330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630058400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630057800
value1=1.177210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630051800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630051200
value1=1.176660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630050900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630050300
value1=1.176660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630037700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630037100
value1=1.174250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630030500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630029900
value1=1.176040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629994500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629993900
value1=1.174700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629984000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629983400
value1=1.178140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629972300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629971700
value1=1.175510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629951600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629951000
value1=1.176140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629949500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629948900
value1=1.176540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629928200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629927600
value1=1.177710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629927600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629927000
value1=1.177570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629906300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629905700
value1=1.172470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629902400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629901800
value1=1.173470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629891300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629890700
value1=1.175930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629886200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629885600
value1=1.173110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629880200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629879600
value1=1.174740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629869700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629869100
value1=1.173300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629866700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629866100
value1=1.173760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629860100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629859500
value1=1.175120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629848100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629847500
value1=1.176190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629846300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629845700
value1=1.176050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629843000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629842400
value1=1.175810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629841500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629840900
value1=1.175650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629821700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629821100
value1=1.175500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629782100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629781500
value1=1.173370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629756600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629756000
value1=1.175170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629755400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629754800
value1=1.175080
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
date1=1629712200
value1=1.170670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629701700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629701100
value1=1.172620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629697500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629696900
value1=1.172030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629695700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629695100
value1=1.171820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629694800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629694200
value1=1.171960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629693300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629692700
value1=1.171040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629677700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629677100
value1=1.168860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629502800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629502200
value1=1.170680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629500700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629500100
value1=1.170670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629490500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629489900
value1=1.170420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629453300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629452700
value1=1.167700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629434100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629433500
value1=1.168810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629431700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629431100
value1=1.168660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629430200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629429600
value1=1.168510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629408900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629408300
value1=1.167100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629373500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629372900
value1=1.169930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629355800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629355200
value1=1.166980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629351300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629350700
value1=1.167340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629349500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629348900
value1=1.168290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629346800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629346200
value1=1.168690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629321000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629320400
value1=1.173960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629315000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629314400
value1=1.169280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629312600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629312000
value1=1.169770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629257100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629256500
value1=1.171630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629250500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629249900
value1=1.170080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629230700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629230100
value1=1.170710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629227100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629226500
value1=1.171110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629219300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629218700
value1=1.173470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629214800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629214200
value1=1.174770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629175200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629174600
value1=1.176870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629172800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629172200
value1=1.177090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629126300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629125700
value1=1.176690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629104700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629104100
value1=1.178530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628883600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628883000
value1=1.180750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628880000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628879400
value1=1.180080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628879400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628878800
value1=1.180350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628875800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628875200
value1=1.179040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628871900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628871300
value1=1.177560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628869800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628869200
value1=1.177040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628868000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628867400
value1=1.176780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628864700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628864100
value1=1.175810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628860500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628859900
value1=1.175420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628859900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628859300
value1=1.175240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628821500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628820900
value1=1.174150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628813400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628812800
value1=1.172760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628775000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628774400
value1=1.173300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628763300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628762700
value1=1.173230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628712900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628712300
value1=1.175650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628697300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628696700
value1=1.174320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628675400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628674800
value1=1.170660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628660700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628660100
value1=1.172720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628659800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628659200
value1=1.172760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628655300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628654700
value1=1.171060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628652600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628652000
value1=1.171400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628601600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628601000
value1=1.171480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628550300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628549700
value1=1.173370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628532300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628531700
value1=1.173920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628496300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628495700
value1=1.176610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628476200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628475600
value1=1.174110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628475300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628474700
value1=1.174280
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
date1=1628272200
value1=1.175350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628271900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628271300
value1=1.175880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628269800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628269200
value1=1.176830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628269200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628268600
value1=1.177150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628266500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628265900
value1=1.177480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628250300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628249700
value1=1.180610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628230500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628229900
value1=1.181830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628229600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628229000
value1=1.181890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628222700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628222100
value1=1.182420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628221800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628221200
value1=1.182480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628174400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628173800
value1=1.185800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628135100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628134500
value1=1.183240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628102400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628101800
value1=1.183360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628095500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628094900
value1=1.189950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628077800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628077200
value1=1.184490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628043600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628043000
value1=1.187290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628042700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628042100
value1=1.187240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628009700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628009100
value1=1.186020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628009100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628008500
value1=1.186590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627976700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627976100
value1=1.188540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627899000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627898400
value1=1.188860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627862700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627689000
value1=1.186640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627668300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627667700
value1=1.185400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627667700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627667100
value1=1.185680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627667100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627666500
value1=1.186000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627651200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627650600
value1=1.188300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627647600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627647000
value1=1.190940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627646700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627646100
value1=1.190960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627646100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627645500
value1=1.190390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627645200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627644600
value1=1.190310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627644300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627643700
value1=1.190170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627642200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627641600
value1=1.189760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627619700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627619100
value1=1.187840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627617900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627617300
value1=1.187940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627611600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627611000
value1=1.189680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627554000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627553400
value1=1.187280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627538100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627537500
value1=1.185830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627513500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627512900
value1=1.185040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627512000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627511400
value1=1.184850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627506900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627506300
value1=1.178260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627503600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627503000
value1=1.182100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627473900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627473300
value1=1.183210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627466100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627465500
value1=1.180380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627465500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627464900
value1=1.180500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627460700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627460100
value1=1.181310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627453200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627452600
value1=1.183030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627445100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627444500
value1=1.181270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627443000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627442400
value1=1.182580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627431300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627430700
value1=1.181430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627426500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627425900
value1=1.181770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627424400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627423800
value1=1.181850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627410000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627409400
value1=1.183990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627403700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627403100
value1=1.182580
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
date1=1627383000
value1=1.177480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627382100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627381500
value1=1.177560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627377600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627377000
value1=1.179240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627356900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627356300
value1=1.181420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627338600
value1=1.179780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627337400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627336800
value1=1.179950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627320300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627319700
value1=1.181920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627318500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627317900
value1=1.181360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627315200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627314600
value1=1.177790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627296300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627295700
value1=1.180010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627290000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627289400
value1=1.178750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627272000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627271400
value1=1.176190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627271100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627270500
value1=1.176370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627078500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627077900
value1=1.177820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627031100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627030500
value1=1.176130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627024800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627024200
value1=1.176690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627011600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627011000
value1=1.178240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626983700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626983100
value1=1.175870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626981300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626980700
value1=1.176380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626979800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626979200
value1=1.176430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626971700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626971100
value1=1.183260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626965700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626965100
value1=1.181230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626953400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626952800
value1=1.177950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626892500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626891900
value1=1.180510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626890100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626889500
value1=1.179870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626887100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626886500
value1=1.179030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626869100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626868500
value1=1.178270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626864000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626863400
value1=1.175190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626862800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626862200
value1=1.175330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626860400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626859800
value1=1.176020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626846000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626845400
value1=1.176890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626844500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626843900
value1=1.177030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626795000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626794400
value1=1.176450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626791700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626791100
value1=1.177620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626784800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626784200
value1=1.180510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626772800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626772200
value1=1.177630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626771600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626771000
value1=1.177970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626771000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626770400
value1=1.177880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626714600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626714000
value1=1.182280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626710700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626710100
value1=1.179130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626697200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626696600
value1=1.176440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626696000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626695400
value1=1.176650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626693900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626693300
value1=1.177640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626691500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626690900
value1=1.178060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626670500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626669900
value1=1.179710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626667500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626666900
value1=1.180070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626447900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626447300
value1=1.179170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626411900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626411300
value1=1.180080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626365100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626364500
value1=1.180350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626362700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626362100
value1=1.180760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626360300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626359700
value1=1.181050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626340500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626339900
value1=1.184780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626320700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626320100
value1=1.182770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626277500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626276900
value1=1.182380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626276000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626275400
value1=1.181490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626272400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626271800
value1=1.180690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626256800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626256200
value1=1.179800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626251100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626250500
value1=1.178950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626217500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626216900
value1=1.177210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626215400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626214800
value1=1.177960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626211500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626210900
value1=1.178270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626208200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626207600
value1=1.179460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626193800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626193200
value1=1.179800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626167100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626166500
value1=1.185530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626165900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626165300
value1=1.185900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626164100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626163500
value1=1.186150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626156300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626155700
value1=1.187740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626155400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626154800
value1=1.187670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626139800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626139200
value1=1.186820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626102300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626101700
value1=1.183610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626098700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626098100
value1=1.184370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626096300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626095700
value1=1.184930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626095100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626094500
value1=1.184970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626083700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626083100
value1=1.185550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626082200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626081600
value1=1.185940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626073800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626073200
value1=1.186430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626049200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626048600
value1=1.186920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625865300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625864700
value1=1.188010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625838300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625837700
value1=1.186510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625758500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625757900
value1=1.185470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625753100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625752500
value1=1.184730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625749800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625749200
value1=1.183970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625748000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625747400
value1=1.183040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625746200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625745600
value1=1.182750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625742300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625741700
value1=1.182320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625735100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625734500
value1=1.180880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625717400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625716800
value1=1.178660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625700900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625700300
value1=1.179020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625692500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625691900
value1=1.182110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625679900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625679300
value1=1.178370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625676900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625676300
value1=1.179930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625588400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625587800
value1=1.182190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625575800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625575200
value1=1.183420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625564400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625563800
value1=1.189550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625553600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625553000
value1=1.187780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625552400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625551800
value1=1.187660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625551800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625551200
value1=1.187550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625535000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625534400
value1=1.187210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625531700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625531100
value1=1.185870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625527800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625527200
value1=1.186210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625498700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625498100
value1=1.185940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625478900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625478300
value1=1.186830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625454600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625454000
value1=1.185240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625262600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625262000
value1=1.187590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625240400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625239800
value1=1.186000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625222700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625222100
value1=1.182210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625221800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625221200
value1=1.182280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625217900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625217300
value1=1.183660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625189700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625189100
value1=1.184110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625152800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625152200
value1=1.188710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625151000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625150400
value1=1.187780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625150100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625149500
value1=1.187370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625148600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625148000
value1=1.187130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625134800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625134200
value1=1.186230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625128800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625128200
value1=1.183830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625112000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625111400
value1=1.184520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625110200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625109600
value1=1.184770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625093400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625092800
value1=1.186330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625024100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625023500
value1=1.190950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625023500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625022900
value1=1.190800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625022900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625022300
value1=1.190720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624983300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624982700
value1=1.187630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624982100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624981500
value1=1.187890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624957500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624956900
value1=1.192420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624893900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624893300
value1=1.190830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624876200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624875600
value1=1.194660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624872900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624872300
value1=1.193500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624855800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624855200
value1=1.192170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624662600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624662000
value1=1.194540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624661400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624660800
value1=1.194290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624657200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624656600
value1=1.192600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624653900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624653300
value1=1.192810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624650300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624649700
value1=1.193280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624649700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624649100
value1=1.193120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624647600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624647000
value1=1.193540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624644600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624644000
value1=1.194000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624640700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624640100
value1=1.197710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624638900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624638300
value1=1.197080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624635600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624635000
value1=1.196350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624599000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624598400
value1=1.194720
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
date1=1624557000
value1=1.192270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624528800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624528200
value1=1.194120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624527600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624527000
value1=1.193810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624509900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624509300
value1=1.191850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624489200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624488600
value1=1.191830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624487100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624486500
value1=1.192230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624479600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624479000
value1=1.192730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624467900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624467300
value1=1.197240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624447500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624446900
value1=1.194790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624441800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624441200
value1=1.193980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624428000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624427400
value1=1.191970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624426800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624426200
value1=1.192060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624423500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624422900
value1=1.192550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624400100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624399500
value1=1.195560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624398000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624397400
value1=1.194710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624396800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624396200
value1=1.194260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624396200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624395600
value1=1.194200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624394700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624394100
value1=1.193990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624392900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624392300
value1=1.193750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624379700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624379100
value1=1.191250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624352700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624352100
value1=1.189020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624351200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624350600
value1=1.189710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624328400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624327800
value1=1.190880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624296000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624295400
value1=1.192070
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
date1=1624269000
value1=1.188770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624267800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624267200
value1=1.188130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624234200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624233600
value1=1.185480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624059900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624059300
value1=1.185550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624036200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624035600
value1=1.185880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624035600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624035000
value1=1.186300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624034700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624034100
value1=1.186120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624030500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624029900
value1=1.187130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624010400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624009800
value1=1.188390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624005600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624005000
value1=1.189800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623998400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623997800
value1=1.192790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623997200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623996600
value1=1.192620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623959100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623958500
value1=1.189330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623958500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623957900
value1=1.189070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623931200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623930600
value1=1.193500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623927600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623927000
value1=1.194460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623921300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623920700
value1=1.197210
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
date1=1623891000
value1=1.198970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623889800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623889200
value1=1.199170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623887400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623886800
value1=1.199490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623884700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623884100
value1=1.200320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623883800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623883200
value1=1.200390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623883200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623882600
value1=1.200680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623881400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623880800
value1=1.202160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623836700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623836100
value1=1.213770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623834000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623833400
value1=1.213350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623833400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623832800
value1=1.213270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623831000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623830400
value1=1.213160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623822300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623821700
value1=1.211530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623817500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623816900
value1=1.211920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623769500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623768900
value1=1.210430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623768300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623767700
value1=1.210870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623765600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623765000
value1=1.211160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623759600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623759000
value1=1.211980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623754200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623753600
value1=1.215000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623753300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623752700
value1=1.214670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623752400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623751800
value1=1.214400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623750900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623750300
value1=1.213940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623749700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623749100
value1=1.213610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623726600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623726000
value1=1.211400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623687600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623687000
value1=1.213260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623644700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623644100
value1=1.209400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623643800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623643200
value1=1.209780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623643200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623642600
value1=1.209730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623453300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623452700
value1=1.211250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623436200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623435600
value1=1.209440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623433800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623433200
value1=1.209920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623430800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623430200
value1=1.211470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623425700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623425100
value1=1.212470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623419400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623418800
value1=1.214760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623417300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623416700
value1=1.215070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623391800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623391200
value1=1.219410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623387900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623387300
value1=1.219020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623381900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623381300
value1=1.218120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623311100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623310500
value1=1.216130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623305400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623304800
value1=1.216500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623302400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623301800
value1=1.216660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623299400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623298800
value1=1.216940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623298200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623297600
value1=1.216940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623268800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623268200
value1=1.217350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623261600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623261000
value1=1.217990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623258300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623257700
value1=1.221950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623257100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623256500
value1=1.221760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623237900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623237300
value1=1.219560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623231900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623231300
value1=1.218980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623219900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623219300
value1=1.218690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623216000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623215400
value1=1.218290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623210000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623209400
value1=1.218000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623148200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623147600
value1=1.216290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623133200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623132600
value1=1.217780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623124800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623124200
value1=1.218120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623093000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623092400
value1=1.220290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623091500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623090900
value1=1.219920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623076800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623076200
value1=1.217280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623061500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623060900
value1=1.214430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623060900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623060300
value1=1.214380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623060000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623059400
value1=1.215020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623058200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623057600
value1=1.215270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623057300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623056700
value1=1.215420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623035700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623035100
value1=1.217530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622826300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622825700
value1=1.218860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622821200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622820600
value1=1.215810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622799300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622798700
value1=1.210410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622797500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622796900
value1=1.210470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622791200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622790600
value1=1.211110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622777100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622776500
value1=1.211490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622747400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622746800
value1=1.212070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622745000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622744400
value1=1.212350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622743200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622742600
value1=1.212550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622741100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622740500
value1=1.213090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622739900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622739300
value1=1.213640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622734800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622734200
value1=1.216270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622726100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622725500
value1=1.220750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622718600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622718000
value1=1.217780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622715300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622714700
value1=1.218120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622714100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622713500
value1=1.218570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622658300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622657700
value1=1.222050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622657100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622656500
value1=1.221070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622653500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622652900
value1=1.220740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622638200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622637600
value1=1.217450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622635800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622635200
value1=1.218190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622606100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622605500
value1=1.222720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622605200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622604600
value1=1.222700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622592000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622591400
value1=1.221030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622590800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622590200
value1=1.221390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622588100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622587500
value1=1.221800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622578800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622578200
value1=1.222620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622569800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622569200
value1=1.225340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622544000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622543400
value1=1.224380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622541600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622541000
value1=1.223960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622537100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622536500
value1=1.221730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622534700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622534100
value1=1.222060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622511600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622511000
value1=1.223450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622488200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622487600
value1=1.223240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622485800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622485200
value1=1.222930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622474700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622474100
value1=1.220460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622454600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622454000
value1=1.218200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622441700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622441100
value1=1.220700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622441100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622440500
value1=1.220710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622430600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622430000
value1=1.218440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622231400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622230800
value1=1.220710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622228400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622227800
value1=1.220120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622224200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622223600
value1=1.218820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622223600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622223000
value1=1.218550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622217900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622217300
value1=1.213120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622210400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622209800
value1=1.217230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622193900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622193300
value1=1.217020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622192700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622192100
value1=1.217430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622191800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622191200
value1=1.217670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622175600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622175000
value1=1.218070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622106900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622106300
value1=1.220330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622088000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622087400
value1=1.217860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622086500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622085900
value1=1.218370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622062200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622061600
value1=1.218110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622060700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622060100
value1=1.218940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622056500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622055900
value1=1.219430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622055600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622055000
value1=1.219840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622045400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622044800
value1=1.221630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622024700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622024100
value1=1.223240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622021700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622021100
value1=1.224420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622014500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622013900
value1=1.226400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622010600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622010000
value1=1.226190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621979400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621978800
value1=1.225960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621939200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621938600
value1=1.226300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621936800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621936200
value1=1.225160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621916700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621916100
value1=1.223060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621915800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621915200
value1=1.222840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621877100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621876500
value1=1.223280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621848000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621847400
value1=1.219500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621847100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621846500
value1=1.219340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621845300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621844700
value1=1.219050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621627500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621626900
value1=1.216120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621616400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621615800
value1=1.217480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621610400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621609800
value1=1.218580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621594500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621593900
value1=1.220870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621567200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621566600
value1=1.224020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621523400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621522800
value1=1.221000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621503600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621503000
value1=1.220080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621483500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621482900
value1=1.218800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621462500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621461900
value1=1.216520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621459500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621458900
value1=1.217760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621443600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621443000
value1=1.223790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621425300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621424700
value1=1.220370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621422000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621421400
value1=1.221620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621416900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621416300
value1=1.224740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621409700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621409100
value1=1.223780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621396500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621395900
value1=1.223520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621375800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621375200
value1=1.223310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621374600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621374000
value1=1.223110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621353000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621352400
value1=1.223220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621342200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621341600
value1=1.222560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621336200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621335600
value1=1.220860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621332000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621331400
value1=1.219070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621314600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621314000
value1=1.217220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621312800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621312200
value1=1.217050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621311900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621311300
value1=1.216640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621296900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621296300
value1=1.214810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621265700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621265100
value1=1.213570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621260300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621259700
value1=1.217000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621258800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621258200
value1=1.216760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621229700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621229100
value1=1.212780
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
date1=1621223400
value1=1.213090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621210500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621209900
value1=1.213170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621011600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621011000
value1=1.214740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621009800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621009200
value1=1.214230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620993900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620993300
value1=1.212950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620990600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620990000
value1=1.212030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620988200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620987600
value1=1.211520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620977700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620977100
value1=1.209100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620961800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620961200
value1=1.207180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620920700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620920100
value1=1.209690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620907200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620906600
value1=1.205280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620902100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620901500
value1=1.210630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620881400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620880800
value1=1.209180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620834000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620833400
value1=1.208130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620803700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620803100
value1=1.211590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620801900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620801300
value1=1.212240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620801300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620800700
value1=1.212300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620798300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620797700
value1=1.212910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620793800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620793200
value1=1.213300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620793200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620792600
value1=1.213340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620768600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620768000
value1=1.214590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620738000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620737400
value1=1.217090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620736200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620735600
value1=1.217110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620735300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620734700
value1=1.216910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620728400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620727800
value1=1.212180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620727500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620726900
value1=1.212840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620713700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620713100
value1=1.215120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620706200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620705600
value1=1.212520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620694200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620693600
value1=1.212810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620687900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620687300
value1=1.213910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620687000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620686400
value1=1.214010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620685200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620684600
value1=1.214310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620648000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620647400
value1=1.217710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620643800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620643200
value1=1.213600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620609600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620609000
value1=1.217740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620414300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620413700
value1=1.216770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620412200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620411600
value1=1.215710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620410100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620409500
value1=1.215010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620409200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620408600
value1=1.215290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620403500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620402900
value1=1.213580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620400800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620400200
value1=1.205690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620383100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620382500
value1=1.208300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620380100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620379500
value1=1.205150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620357000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620356400
value1=1.207270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620320100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620319500
value1=1.207450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620314400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620313800
value1=1.206340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620305700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620305100
value1=1.205450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620305100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620304500
value1=1.205400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620301500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620300900
value1=1.204660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620300300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620299700
value1=1.203740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620298200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620297600
value1=1.203150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620296400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620295800
value1=1.202750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620294600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620294000
value1=1.202050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620280800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620280200
value1=1.199270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620274200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620273600
value1=1.199750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620268500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620267900
value1=1.201080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620229500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620228900
value1=1.199270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620223800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620223200
value1=1.201960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620211800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620211200
value1=1.198840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620196200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620195600
value1=1.202930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620130200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620129600
value1=1.199840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620126600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620126000
value1=1.201370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620112800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620112200
value1=1.203660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620110700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620110100
value1=1.203800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620110100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620109500
value1=1.203860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620108000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620107400
value1=1.204100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620107100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620106500
value1=1.204200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620104700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620104100
value1=1.204440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620102900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620102300
value1=1.204540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620064500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620063900
value1=1.207890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620063900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620063300
value1=1.207660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620062700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620062100
value1=1.207530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620044700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620044100
value1=1.205820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620037200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620036600
value1=1.204380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620036300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620035700
value1=1.204430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619809800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619809200
value1=1.202540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619808300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619807700
value1=1.202470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619803200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619802600
value1=1.205900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619791500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619790900
value1=1.207860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619783100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619782500
value1=1.209370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619782500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619781900
value1=1.209470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619781300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619780700
value1=1.209890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619741400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619740800
value1=1.211460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619736900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619736300
value1=1.213230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619691000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619690400
value1=1.211730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619690400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619689800
value1=1.211590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619681400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619680800
value1=1.212550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619680500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619679900
value1=1.212500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619672400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619671800
value1=1.215070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619669100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619668500
value1=1.214480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619666100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619665500
value1=1.214010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619665200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619664600
value1=1.213830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619661300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619660700
value1=1.213580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619647500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619646900
value1=1.212810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619632200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619631600
value1=1.209830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619631300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619630700
value1=1.210160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619604600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619604000
value1=1.205550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619603100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619602500
value1=1.205940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619598900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619598300
value1=1.207050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619597100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619596500
value1=1.207130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619585100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619584500
value1=1.207390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619583600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619583000
value1=1.207640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619582700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619582100
value1=1.207680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619581200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619580600
value1=1.207850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619580000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619579400
value1=1.208080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619535600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619535000
value1=1.209320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619532300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619531700
value1=1.208690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619514900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619514300
value1=1.208140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619503500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619502900
value1=1.206430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619499300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619498700
value1=1.207020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619497800
value1=1.206770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619490300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619489700
value1=1.207810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619455200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619454600
value1=1.206200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619451600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619451000
value1=1.207560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619431500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619430900
value1=1.208980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619410500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619409900
value1=1.211310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619409300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619408700
value1=1.210790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619219400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619218800
value1=1.210140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619212200
value1=1.209120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619193300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619192700
value1=1.207860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619179200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619178600
value1=1.206390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619178300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619177700
value1=1.206320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619166300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619165700
value1=1.203160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619165400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619164800
value1=1.203080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619126700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619126100
value1=1.199530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619126100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619125500
value1=1.199270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619112900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619112300
value1=1.200330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619107800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619107200
value1=1.207130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619102100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619101500
value1=1.206120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619097900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619097300
value1=1.205540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619093700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619093100
value1=1.202450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619077500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619076900
value1=1.203150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619076300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619075700
value1=1.203180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619031000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619030400
value1=1.204200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619029200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619028600
value1=1.203890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619002500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619001900
value1=1.200330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618991400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618990800
value1=1.202320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618948200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618947600
value1=1.202430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618935000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618934400
value1=1.202970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618913100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618912500
value1=1.207630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618911000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618910400
value1=1.204780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618901100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618900500
value1=1.207060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618896900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618896300
value1=1.205320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618889100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618888500
value1=1.204800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618888200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618887600
value1=1.204810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618887300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618886700
value1=1.204610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618841700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618841100
value1=1.204960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618833000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618832400
value1=1.203300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618828800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618828200
value1=1.199230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618827600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618827000
value1=1.198640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618827000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618826400
value1=1.198770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618824600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618824000
value1=1.197270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618823100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618822500
value1=1.196970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618809300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618808700
value1=1.194590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618795200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618794600
value1=1.196840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618791000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618790400
value1=1.197140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618572600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618572000
value1=1.198980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618563900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618563300
value1=1.197340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618560600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618560000
value1=1.196810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618560000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618559400
value1=1.196700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618547400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618546800
value1=1.195360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618545300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618544700
value1=1.195750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618495500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618494900
value1=1.196030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618494600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618494000
value1=1.196390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618463100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618462500
value1=1.197150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618459800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618459200
value1=1.199270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618459200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618458600
value1=1.199160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618430400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618429800
value1=1.198930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618369200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618368600
value1=1.195810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618355100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618354500
value1=1.195770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618350000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618349400
value1=1.195020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618341600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618341000
value1=1.194640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618333800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618333200
value1=1.194340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618333200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618332600
value1=1.194270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618329300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618328700
value1=1.193040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618306200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618305600
value1=1.190340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618298100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618297500
value1=1.188690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618297500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618296900
value1=1.188870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618284600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618284000
value1=1.190110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618283700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618283100
value1=1.190210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618266300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618265700
value1=1.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618264200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618263600
value1=1.190210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618263300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618262700
value1=1.190320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618235700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618235100
value1=1.191970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618234200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618233600
value1=1.191000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618233300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618232700
value1=1.190860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618232700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618232100
value1=1.190750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618232100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618231500
value1=1.190770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618223700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618223100
value1=1.187060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618186800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618186200
value1=1.188890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618001700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618001100
value1=1.191250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617983700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617983100
value1=1.186600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617982200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617981600
value1=1.187280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617961500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617960900
value1=1.188360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617959400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617958800
value1=1.189150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617958500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617957900
value1=1.189280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617957300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617956700
value1=1.189580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617949200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617948600
value1=1.190190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617947100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617946500
value1=1.190270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617946500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617945900
value1=1.190320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617945900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617945300
value1=1.190360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617912000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617911400
value1=1.192820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617901200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617900600
value1=1.191320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617897900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617897300
value1=1.189600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617894000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617893400
value1=1.188720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617877500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617876900
value1=1.189410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617871800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617871200
value1=1.188170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617862800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617862200
value1=1.187680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617856200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617855600
value1=1.186050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617834600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617834000
value1=1.185950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617833700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617833100
value1=1.186040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617833100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617832500
value1=1.186390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617832500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617831900
value1=1.186680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617817800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617817200
value1=1.191750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617786600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617786000
value1=1.188000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617752700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617752100
value1=1.188030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617748500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617747900
value1=1.187680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617746700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617746100
value1=1.187520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617740700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617740100
value1=1.186290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617740100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617739500
value1=1.186150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617735600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617735000
value1=1.185640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617735000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617734400
value1=1.185410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617730200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617729600
value1=1.184880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617728700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617728100
value1=1.184410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617727800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617727200
value1=1.184140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617724500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617723900
value1=1.183620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617707100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617706500
value1=1.182320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617700800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617700200
value1=1.181970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617691800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617691200
value1=1.179820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617691200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617690600
value1=1.180050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617687300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617686700
value1=1.180210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617678900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617678300
value1=1.182280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617678000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617677400
value1=1.182020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617676800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617676200
value1=1.181950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617654300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617653700
value1=1.182250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617653100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617652500
value1=1.181930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617652500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617651900
value1=1.181960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617651300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617650700
value1=1.181890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617648300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617647700
value1=1.181570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617647400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617646800
value1=1.181530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617645300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617644700
value1=1.180840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617635100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617634500
value1=1.176240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617617400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617616800
value1=1.174320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617614400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617613800
value1=1.174830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617611400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617610800
value1=1.175800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617608400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617607800
value1=1.176090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617581400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617580800
value1=1.175130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617380100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617379500
value1=1.174940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617377700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617377100
value1=1.175290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617345000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617344400
value1=1.178400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617318600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617318000
value1=1.177970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617273300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617272700
value1=1.174580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617271500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617270900
value1=1.173660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617265500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617264900
value1=1.171480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617240000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617239400
value1=1.171930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617231600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617231000
value1=1.172130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617230400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617229800
value1=1.172290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617228600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617228000
value1=1.172500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617227700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617227100
value1=1.172750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617213900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617213300
value1=1.175600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617212400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617211800
value1=1.175060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617211500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617210900
value1=1.174930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617196500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617195900
value1=1.172170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617192300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617191700
value1=1.174880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617191100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617190500
value1=1.175070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617186600
value1=1.173960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617186000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617185400
value1=1.173610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617185100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617184500
value1=1.173010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617183900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617183300
value1=1.172740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617166500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617165900
value1=1.170920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617165600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617165000
value1=1.171090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617159600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617159000
value1=1.172630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617123600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617123000
value1=1.171370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617102000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617101400
value1=1.173170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617099300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617098700
value1=1.174130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617097500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617096900
value1=1.174950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617089100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617088500
value1=1.175980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617067200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617066600
value1=1.177470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617041700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617041100
value1=1.175960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617006600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617006000
value1=1.177490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617005700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617005100
value1=1.177550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616992200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616991600
value1=1.177380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616990700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616990100
value1=1.177810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616769300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616768700
value1=1.177040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616702700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616702100
value1=1.176040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616702100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616701500
value1=1.176440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616700000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616699400
value1=1.177080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616699100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616698500
value1=1.177330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616687400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616686800
value1=1.179020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616628900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616628300
value1=1.180870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616627100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616626500
value1=1.181080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616585400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616584800
value1=1.181340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616584800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616584200
value1=1.181510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616584200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616583600
value1=1.181330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616583300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616582700
value1=1.181630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616582400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616581800
value1=1.182130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616554800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616554200
value1=1.183470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616535600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616535000
value1=1.184870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616517600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616517000
value1=1.187060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616500500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616499900
value1=1.189080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616499900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616499300
value1=1.188620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616497800
value1=1.189770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616426400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616425800
value1=1.193370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616413200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616412600
value1=1.190770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616408100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616407500
value1=1.187500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616394900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616394300
value1=1.190110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616394300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616393700
value1=1.189950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616387400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616386800
value1=1.187370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616373600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616373000
value1=1.187530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616181000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616180400
value1=1.190950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616172900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616172300
value1=1.187730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616161500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616160900
value1=1.189330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616147400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616146800
value1=1.192970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616140800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616140200
value1=1.192270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616128200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616127600
value1=1.190180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616127600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616127000
value1=1.190380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616126700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616126100
value1=1.190540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616125800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616125200
value1=1.190460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616104200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616103600
value1=1.191090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616085000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616084400
value1=1.190960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616084400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616083800
value1=1.190880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616068200
value1=1.193750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616065500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616064900
value1=1.194340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616063100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616062500
value1=1.198820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616052600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616052000
value1=1.195460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616043000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616042400
value1=1.196600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616020800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616020200
value1=1.198300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616019300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616018700
value1=1.197250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615991700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615991100
value1=1.189300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615985100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615984500
value1=1.191590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615979700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615979100
value1=1.188480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615956000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615955400
value1=1.189130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615920900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615920300
value1=1.188360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615914600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615914000
value1=1.190440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615911600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615911000
value1=1.191980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615906500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615905900
value1=1.195330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615905600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615905000
value1=1.195350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615902900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615902300
value1=1.194710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615890900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615890300
value1=1.191610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615876500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615875900
value1=1.193900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615800300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615799700
value1=1.192550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615798500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615797900
value1=1.192970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615767300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615766700
value1=1.194160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615589700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615589100
value1=1.196320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615577100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615576500
value1=1.195790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615575600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615575000
value1=1.195800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615551900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615551300
value1=1.190880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615550400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615549800
value1=1.191130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615542300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615541700
value1=1.193610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615541400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615540800
value1=1.193650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615526700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615526100
value1=1.195860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615489800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615489200
value1=1.198110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615474800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615474200
value1=1.194550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615461600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615461000
value1=1.197160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615455900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615455300
value1=1.194920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615437600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615437000
value1=1.193740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615431600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615431000
value1=1.191430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615431000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615430400
value1=1.191570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615407300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615406700
value1=1.192510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615393200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615392600
value1=1.192790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615375200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615374600
value1=1.190300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615374300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615373700
value1=1.190390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615362900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615362300
value1=1.186900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615350000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615349400
value1=1.187770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615343700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615343100
value1=1.188760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615327200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615326600
value1=1.190730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615302300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615301700
value1=1.188620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615291800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615291200
value1=1.191260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615288800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615288200
value1=1.190500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615288200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615287600
value1=1.190010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615286700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615286100
value1=1.189250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615285500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615284900
value1=1.188620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615284300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615283700
value1=1.188390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615267500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615266900
value1=1.186580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615257600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615257000
value1=1.183840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615231200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615230600
value1=1.184760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615226700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615226100
value1=1.185380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615212900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615212300
value1=1.185940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615204200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615203600
value1=1.186920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615197600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615197000
value1=1.187970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615194300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615193700
value1=1.188970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615180800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615180200
value1=1.189910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615179600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615179000
value1=1.190190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614958800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614958200
value1=1.190040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614942000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614941400
value1=1.191360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614894300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614893700
value1=1.196700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614893100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614892500
value1=1.197010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614892200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614891600
value1=1.196840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614890400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614889800
value1=1.198010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614859200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614858600
value1=1.202520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614858600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614858000
value1=1.202680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614858000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614857400
value1=1.203080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614855300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614854700
value1=1.203490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614823500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614822900
value1=1.204490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614822300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614821700
value1=1.204710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614785100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614784500
value1=1.204690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614780900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614780300
value1=1.205930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614772500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614771900
value1=1.211310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614765000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614764400
value1=1.210570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614760500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614759900
value1=1.207790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614723300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614722700
value1=1.209670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614718500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614717900
value1=1.209020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614715200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614714600
value1=1.208490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614713700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614713100
value1=1.208270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614702900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614702300
value1=1.204910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614677100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614676500
value1=1.200290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614660600
value1=1.201570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614657300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614656700
value1=1.202570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614656700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614656100
value1=1.202750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614654300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614653700
value1=1.203710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614599100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614598500
value1=1.202700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614593700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614593100
value1=1.206430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614589200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614588600
value1=1.209440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614566700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614566100
value1=1.210370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614380700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614380100
value1=1.206080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614369600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614369000
value1=1.207220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614346800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614346200
value1=1.209180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614346200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614345600
value1=1.209720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614341700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614341100
value1=1.211500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614340800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614340200
value1=1.212130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614333000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614332400
value1=1.212960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614322500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614321900
value1=1.214630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614320400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614319800
value1=1.215320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614314400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614313800
value1=1.218400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614307200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614306600
value1=1.214160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614305100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614304500
value1=1.215630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614292800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614292200
value1=1.216130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614286200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614285600
value1=1.216620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614284100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614283500
value1=1.218670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614257100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614256500
value1=1.223410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614252300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614251700
value1=1.222180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614249900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614249300
value1=1.220300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614249300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614248700
value1=1.219990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614239400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614238800
value1=1.218370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614238500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614237900
value1=1.218550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614235200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614234600
value1=1.217660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614210000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614209400
value1=1.217750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614207900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614207300
value1=1.216960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614205200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614204600
value1=1.215980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614187500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614186900
value1=1.211070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614180600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614180000
value1=1.213440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614151200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614150600
value1=1.214430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614102600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614102000
value1=1.216870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614077100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614076500
value1=1.215320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614069000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614068400
value1=1.216130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614035700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614035100
value1=1.214940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614023400
value1=1.217030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614009300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614008700
value1=1.215720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614002100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614001500
value1=1.214400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613998200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613997600
value1=1.213570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613991000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613990400
value1=1.208980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613990400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613989800
value1=1.209110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613987700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613987100
value1=1.210420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613986800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613986200
value1=1.210690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613767200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613766600
value1=1.210670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613739300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613738700
value1=1.214590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613737500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613736900
value1=1.214250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613735400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613734800
value1=1.214010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613729700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613729100
value1=1.211680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613728800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613728200
value1=1.211650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613726700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613726100
value1=1.210970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613723100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613722500
value1=1.210200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613720700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613720100
value1=1.209860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613708700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613708100
value1=1.208100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613692500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613691900
value1=1.209720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613690700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613690100
value1=1.209640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613689200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613688600
value1=1.209580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613660100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613659500
value1=1.208790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613649900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613649300
value1=1.207650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613647800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613647200
value1=1.207260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613646600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613646000
value1=1.207080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613635500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613634900
value1=1.204900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613578500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613577900
value1=1.203070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613556000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613555400
value1=1.206940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613555100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613554500
value1=1.207050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613550600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613550000
value1=1.208370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613524800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613524200
value1=1.208460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613520300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613519700
value1=1.210130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613495100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613494500
value1=1.209590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613488200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613487600
value1=1.214390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613481600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613481000
value1=1.217060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613480100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613479500
value1=1.216960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613472000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613471400
value1=1.215440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613461500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613460900
value1=1.213130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613460600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613460000
value1=1.213490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613457900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613457300
value1=1.213660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613447700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613447100
value1=1.214780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613446800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613446200
value1=1.214640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613443800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613443200
value1=1.214200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613433600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613433000
value1=1.212410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613375700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613375100
value1=1.214270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613368500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613367900
value1=1.214050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613367300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613366700
value1=1.213800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613363400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613362800
value1=1.213480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613156400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613155800
value1=1.213060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613155500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613154900
value1=1.212780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613154300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613153700
value1=1.212630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613153100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613152500
value1=1.212320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613145300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613144700
value1=1.208330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613127900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613127300
value1=1.210020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613127300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613126700
value1=1.210310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613126100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613125500
value1=1.210650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613124000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613123400
value1=1.211090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613117100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613116500
value1=1.213450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613107800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613107200
value1=1.211740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613106600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613106000
value1=1.211770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613103900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613103300
value1=1.212090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613098800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613098200
value1=1.212460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613069100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613068500
value1=1.212010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613058000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613057400
value1=1.215010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613031000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613030400
value1=1.213200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613030400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613029800
value1=1.213030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613000400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612999800
value1=1.211510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612998000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612997400
value1=1.211740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612954800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612954200
value1=1.214690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612953900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612953300
value1=1.214310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612935900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612935300
value1=1.213210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612933200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612932600
value1=1.212900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612927200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612926600
value1=1.210750
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
date1=1612907400
value1=1.212380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612907400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612906800
value1=1.212110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612872900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612872300
value1=1.211380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612870200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612869600
value1=1.210560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612868700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612868100
value1=1.210660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612866900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612866300
value1=1.206690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612848300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612847700
value1=1.208430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612847700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612847100
value1=1.208210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612845900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612845300
value1=1.208260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612841700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612841100
value1=1.206660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612804200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612803600
value1=1.206870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612801500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612800900
value1=1.204910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612778100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612777500
value1=1.205160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612753500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612752900
value1=1.203010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612558500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612557900
value1=1.205020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612545300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612544700
value1=1.203680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612540800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612540200
value1=1.201530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612536000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612535400
value1=1.199300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612523400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612522800
value1=1.198920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612521900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612521300
value1=1.198380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612520700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612520100
value1=1.198390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612502700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612502100
value1=1.195270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612501800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612501200
value1=1.195270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612500600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612500000
value1=1.195210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612467300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612466700
value1=1.195610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612460400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612459800
value1=1.196550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612459500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612458900
value1=1.196990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612430400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612429800
value1=1.200150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612423500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612422900
value1=1.201270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612422000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612421400
value1=1.201580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612420200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612419600
value1=1.201700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612419600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612419000
value1=1.201780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612393200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612392600
value1=1.203920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612362300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612361700
value1=1.200360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612350900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612350300
value1=1.201330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612342800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612342200
value1=1.203370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612312500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612311900
value1=1.204750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612311600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612311000
value1=1.204750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612308600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612308000
value1=1.204430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612273500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612272900
value1=1.202710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612271100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612270500
value1=1.203270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612269900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612269300
value1=1.203600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612255500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612254900
value1=1.206640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612239300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612238700
value1=1.208860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612237800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612237200
value1=1.208350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612236900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612236300
value1=1.207900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612207200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612206600
value1=1.206120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612184400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612183800
value1=1.207220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612182300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612181700
value1=1.208180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612178400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612177800
value1=1.209030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612171200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612170600
value1=1.212050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612142700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612142100
value1=1.211920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612142100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612141500
value1=1.212000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611925500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611924900
value1=1.214040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611889500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611888900
value1=1.210490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611888300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611887700
value1=1.210850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611854700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611854100
value1=1.214470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611853200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611852600
value1=1.214000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611850800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611850200
value1=1.213410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611821100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611820500
value1=1.210840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611801300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611800700
value1=1.208380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611798300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611797700
value1=1.209300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611767100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611766500
value1=1.206640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611766500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611765900
value1=1.205790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611762900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611762300
value1=1.209680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611757500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611756900
value1=1.210860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611749700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611749100
value1=1.212070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611747600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611747000
value1=1.212550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611735000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611734400
value1=1.216880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611733800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611733200
value1=1.216530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611714900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611714300
value1=1.217260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611714300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611713700
value1=1.217150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611687600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611687000
value1=1.214170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611681300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611680700
value1=1.217080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611676500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611675900
value1=1.216480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611654600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611654000
value1=1.211020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611645000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611644400
value1=1.212620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611630300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611629700
value1=1.213280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611629700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611629100
value1=1.213370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611595500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611594900
value1=1.211730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611577200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611576600
value1=1.213880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611575700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611575100
value1=1.214270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611574200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611573600
value1=1.214700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611313800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611313200
value1=1.218890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611312300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611311700
value1=1.218340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611311400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611310800
value1=1.215200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611309900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611309300
value1=1.215370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611309000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611308400
value1=1.215430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611303900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611303300
value1=1.216170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611282000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611281400
value1=1.218050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611270600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611270000
value1=1.217170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611268500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611267900
value1=1.216790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611267900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611267300
value1=1.216810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611215100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611214500
value1=1.214000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611205200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611204600
value1=1.213600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611200100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611199500
value1=1.213030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611193200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611192600
value1=1.212080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611162000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611161400
value1=1.207580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611155700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611155100
value1=1.209480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611154800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611154200
value1=1.209480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611143100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611142500
value1=1.212000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611140400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611139800
value1=1.212940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611139200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611138600
value1=1.213260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611132600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611132000
value1=1.216030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611108300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611107700
value1=1.214280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611107400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611106800
value1=1.214200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611106500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611105900
value1=1.214080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611073200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611072600
value1=1.214790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611062700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611062100
value1=1.213900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611061800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611061200
value1=1.213580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611051000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611050400
value1=1.212170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611030300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611029700
value1=1.210020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611028800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611028200
value1=1.209890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611028200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611027600
value1=1.209900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611027000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611026400
value1=1.209550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611024300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611023700
value1=1.209560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611023100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611022500
value1=1.208840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610961900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610961300
value1=1.208760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610935800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610935200
value1=1.206560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610933400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610932800
value1=1.208860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610730900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610730300
value1=1.208370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610727900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610727300
value1=1.210380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610706900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610706300
value1=1.211820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610705700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610705100
value1=1.211880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610697300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610696700
value1=1.213460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610696700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610696100
value1=1.213750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610695800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610695200
value1=1.213820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610654700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610654100
value1=1.217070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610651400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610650800
value1=1.215730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610649300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610648700
value1=1.215120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610638500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610637900
value1=1.211160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610599500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610598900
value1=1.214080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610591700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610591100
value1=1.217370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610565900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610565300
value1=1.213880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610536200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610535600
value1=1.218130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610535300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610534700
value1=1.218420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610532600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610532000
value1=1.219280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610488500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610487900
value1=1.220910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610484600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610484000
value1=1.219200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610444400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610443800
value1=1.217210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610442300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610441700
value1=1.216380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610441700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610441100
value1=1.216410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610439300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610438700
value1=1.215910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610392500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610391900
value1=1.217720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610367300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610366700
value1=1.215480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610357100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610356500
value1=1.219640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610354400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610353800
value1=1.219110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610339100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610338500
value1=1.216560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610336700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610336100
value1=1.217200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610335500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610334900
value1=1.217470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610330700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610330100
value1=1.218300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610329800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610329200
value1=1.218590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610328300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610327700
value1=1.219560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610327700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610327100
value1=1.219710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610139300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610138700
value1=1.219330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610137800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610137200
value1=1.220270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610121300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610120700
value1=1.228250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610102700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610102100
value1=1.221990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610101800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610101200
value1=1.222010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610101200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610100600
value1=1.221540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610076900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610076300
value1=1.223520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610025000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610024400
value1=1.225030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610018700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610018100
value1=1.228240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610017800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610017200
value1=1.228740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610015100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610014500
value1=1.229590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610007300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610006700
value1=1.230590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610006100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610005500
value1=1.230990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609993800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609993200
value1=1.231750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609983300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609982700
value1=1.234250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609971900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609971300
value1=1.233660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609957200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609956600
value1=1.226970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609956000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609955400
value1=1.227440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609951200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609950600
value1=1.229280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609927500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609926900
value1=1.234330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609926000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609925400
value1=1.233460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609925100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609924500
value1=1.233240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609923600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609923000
value1=1.232230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609902000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609901400
value1=1.232160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609874100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609873500
value1=1.230750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609825200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609824600
value1=1.227950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609824300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609823700
value1=1.227790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609823100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609822500
value1=1.227430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609822200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609821600
value1=1.227190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609818300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609817700
value1=1.226530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609787400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609786800
value1=1.225170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609762800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609762200
value1=1.230290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609761300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609760700
value1=1.229770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609757700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609757100
value1=1.228780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609752300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609751700
value1=1.226990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609725900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609725300
value1=1.225300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609723200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609722600
value1=1.224250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609720500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609719900
value1=1.224290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609452300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609451700
value1=1.220840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609441200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609440600
value1=1.222160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609440000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609439400
value1=1.222640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609439100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609438500
value1=1.222390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609437600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609437000
value1=1.222340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609390800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609390200
value1=1.228400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609344900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609344300
value1=1.230950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609340700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609340100
value1=1.229280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609332300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609331700
value1=1.228680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609324200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609323600
value1=1.225200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609323300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609322700
value1=1.225410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609301700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609301100
value1=1.229340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609297200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609296600
value1=1.227520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609290900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609290300
value1=1.226140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609238100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609237500
value1=1.226090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609235100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609234500
value1=1.225320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609221900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609221300
value1=1.224480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609216800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609216200
value1=1.223970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609210200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609209600
value1=1.223350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609205400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609204800
value1=1.222290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609174500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609173900
value1=1.224170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609173600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609173000
value1=1.223800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609165200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609164600
value1=1.219180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609157100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609156500
value1=1.225330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609153500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609152900
value1=1.224370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609149900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609149300
value1=1.223510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609143300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609142700
value1=1.222900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609141500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609140900
value1=1.222120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609129800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609129200
value1=1.221510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609129200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609128600
value1=1.221590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609121100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609120500
value1=1.221120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609117200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609116600
value1=1.219240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608785100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608784500
value1=1.221810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608782400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608781800
value1=1.221510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608780900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608780300
value1=1.221050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608776100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608775500
value1=1.220330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608764700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608764100
value1=1.219870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608759300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608758700
value1=1.217340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608742800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608742200
value1=1.222100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608738000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608737400
value1=1.216110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608717600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608717000
value1=1.220380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608715800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608715200
value1=1.219700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608689400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608688800
value1=1.218790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608670500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608669900
value1=1.215480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608663900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608663300
value1=1.216980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608657600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608657000
value1=1.220040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608657000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608656400
value1=1.220120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608655800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608655200
value1=1.220870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608647700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608647100
value1=1.225750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608647100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608646500
value1=1.226020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608623700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608623100
value1=1.221440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608620100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608619500
value1=1.221840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608619200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608618600
value1=1.221780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608592200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608591600
value1=1.222650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608585300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608584700
value1=1.225320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608584400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608583800
value1=1.225030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608566100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608565500
value1=1.221760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608554700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608554100
value1=1.213500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608548400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608547800
value1=1.222480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608544200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608543600
value1=1.216730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608530700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608530100
value1=1.218320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608529500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608528900
value1=1.218400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608528000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608527400
value1=1.218720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608527400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608526800
value1=1.218650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608526500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608525900
value1=1.218990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608517500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608516900
value1=1.220350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608516900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608516300
value1=1.220720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608516300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608515700
value1=1.220690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608515400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608514800
value1=1.221240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608514500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608513900
value1=1.221510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608509400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608508800
value1=1.222050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608335100
value1=1.226090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608334800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608334200
value1=1.225750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608310800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608310200
value1=1.223390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608303300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608302700
value1=1.227170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608282000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608281400
value1=1.225860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608274500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608273900
value1=1.223720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608267900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608267300
value1=1.224510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608259800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608259200
value1=1.225100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608232500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608231900
value1=1.226770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608219300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608218700
value1=1.226170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608186900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608186300
value1=1.223240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608181500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608180900
value1=1.221500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608176100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608175500
value1=1.221150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608153900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608153300
value1=1.212650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608117000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608116400
value1=1.221140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608110700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608110100
value1=1.217360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608098100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608097500
value1=1.216600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608063900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608063300
value1=1.217180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608044700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608044100
value1=1.212360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608027300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608026700
value1=1.213310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608025200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608024600
value1=1.213720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608015900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608015300
value1=1.214520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608003300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608002700
value1=1.216320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608002100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608001500
value1=1.216360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607986200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607985600
value1=1.213790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607966700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607966100
value1=1.212720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607940300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607939700
value1=1.215950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607934600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607934000
value1=1.214670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607933700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607933100
value1=1.214600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607906100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607905500
value1=1.214140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607682900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607682300
value1=1.211680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607659200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607658600
value1=1.216300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607657400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607656800
value1=1.216130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607656500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607655900
value1=1.215670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607641200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607640600
value1=1.214780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607639400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607638800
value1=1.214550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607620200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607619600
value1=1.216200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607615700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607615100
value1=1.213850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607613000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607612400
value1=1.212930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607612100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607611500
value1=1.211820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607609700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607609100
value1=1.207990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607608800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607608200
value1=1.208370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607583900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607583300
value1=1.210210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607582100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607581500
value1=1.210110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607581500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607580900
value1=1.210080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607580600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607580000
value1=1.209850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607579700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607579100
value1=1.209720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607575800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607575200
value1=1.209300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607575200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607574600
value1=1.209280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607541900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607541300
value1=1.206130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607538300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607537700
value1=1.207400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607536800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607536200
value1=1.207630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607535000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607534400
value1=1.208590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607534400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607533800
value1=1.208950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607522400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607521800
value1=1.210650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607521800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607521200
value1=1.210680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607503200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607502600
value1=1.214640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607497500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607496900
value1=1.213190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607496300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607495700
value1=1.212980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607495100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607494500
value1=1.213230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607490600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607490000
value1=1.212300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607489700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607489100
value1=1.212210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607487900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607487300
value1=1.211950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607481300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607480700
value1=1.211750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607449500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607448900
value1=1.209870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607423100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607422500
value1=1.209690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607415300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607414700
value1=1.212550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607382300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607381700
value1=1.210690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607379600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607379000
value1=1.211150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607359800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607359200
value1=1.216530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607357700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607357100
value1=1.214420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607356200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607355600
value1=1.214040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607340600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607340000
value1=1.208290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607338200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607337600
value1=1.209740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607334000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607333400
value1=1.211410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607330400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607329800
value1=1.212440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607329500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607328900
value1=1.212750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607315400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607314800
value1=1.214210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607314800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607314200
value1=1.214240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607313900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607313300
value1=1.213800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607299200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607125500
value1=1.211100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607122800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607122200
value1=1.211730
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
date1=1607097000
value1=1.213200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607071500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607070900
value1=1.215860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607012700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607012100
value1=1.216850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607007900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607007300
value1=1.215860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607007300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607006700
value1=1.214920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607006400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607005800
value1=1.214850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606995600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606995000
value1=1.210020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606974900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606974300
value1=1.212720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606973400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606972800
value1=1.212680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606953600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606953000
value1=1.212030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606929900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606929300
value1=1.211070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606924200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606923600
value1=1.208140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606899900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606899300
value1=1.206340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606896300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606895700
value1=1.206640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606866900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606866300
value1=1.207610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606847400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606846800
value1=1.205660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606844400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606843800
value1=1.202070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606843500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606842900
value1=1.201650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606838700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606838100
value1=1.199730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606836900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606836300
value1=1.198500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606819800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606819200
value1=1.198580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606816800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606816200
value1=1.197570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606816200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606815600
value1=1.197430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606803600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606803000
value1=1.196260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606801800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606801200
value1=1.196180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606791300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606790700
value1=1.194760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606780200
value1=1.192310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606779600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606779000
value1=1.192360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606778700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606778100
value1=1.192670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606775700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606775100
value1=1.193130
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
date1=1606762200
value1=1.194170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606761600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606761000
value1=1.194560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606701000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606700400
value1=1.197680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606697400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606696800
value1=1.196820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606513500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606512900
value1=1.196460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606502400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606501800
value1=1.196470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606495800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606495200
value1=1.194900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606465800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606465200
value1=1.193170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606464000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606463400
value1=1.193160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606458900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606458300
value1=1.192710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606427100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606426500
value1=1.191990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606401600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606401000
value1=1.188540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606392300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606391700
value1=1.190020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606384500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606383900
value1=1.194350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606380900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606380300
value1=1.193990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606380000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606379400
value1=1.194000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606357500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606356900
value1=1.192830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606318800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606318200
value1=1.191520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606299600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606299000
value1=1.193010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606297500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606296900
value1=1.191740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606293900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606293300
value1=1.189060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606291500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606290900
value1=1.189630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606283100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606282500
value1=1.191170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606271400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606270800
value1=1.190360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606270500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606269900
value1=1.190390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606262100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606261500
value1=1.189900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606259100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606258500
value1=1.189530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606234500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606233900
value1=1.184180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606221000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606220400
value1=1.189700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606218900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606218300
value1=1.189130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606215000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606214400
value1=1.188150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606214100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606213500
value1=1.188190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606206600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606206000
value1=1.185990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606201500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606200900
value1=1.185710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606182600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606182000
value1=1.185030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606181700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606181100
value1=1.184890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606156200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606155600
value1=1.181040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606140300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606139700
value1=1.190750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606139100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606138500
value1=1.190610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606119000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606118400
value1=1.188160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606102500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606101900
value1=1.187900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606097100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606096500
value1=1.186870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605895500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605894900
value1=1.185180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605881100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605880500
value1=1.188120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605875700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605875100
value1=1.185130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605866400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605865800
value1=1.186710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605864300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605863700
value1=1.187100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605858600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605858000
value1=1.189020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605856500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605855900
value1=1.188850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605828000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605827400
value1=1.188510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605826200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605825600
value1=1.188120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605783900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605783300
value1=1.182130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605782700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605782100
value1=1.183180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605753300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605752700
value1=1.183440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605752700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605752100
value1=1.183520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605741900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605741300
value1=1.184930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605695400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605694800
value1=1.189400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605692700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605692100
value1=1.188720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605691800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605691200
value1=1.188620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605686400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605685800
value1=1.187960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605685500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605684900
value1=1.187770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605684300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605683700
value1=1.187800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605679500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605678900
value1=1.186510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605671400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605670800
value1=1.184940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605620100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605619500
value1=1.188850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605619500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605618900
value1=1.188760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605611100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605610500
value1=1.187800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605600900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605600300
value1=1.185060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605584700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605584100
value1=1.186890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605582900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605582300
value1=1.186840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605581400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605580800
value1=1.186700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605579900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605579300
value1=1.186420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605577500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605576900
value1=1.186270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605576000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605575400
value1=1.186070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605571200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605570600
value1=1.185990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605567900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605567300
value1=1.185550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605528900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605528300
value1=1.183470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605524100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605523500
value1=1.186910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605521700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605521100
value1=1.186450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605503700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605503100
value1=1.185640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605492000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605491400
value1=1.185040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605491400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605490800
value1=1.185170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605490800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605490200
value1=1.184920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605270600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605270000
value1=1.183340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605261300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605260700
value1=1.182080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605193200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605192600
value1=1.179150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605185400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605184800
value1=1.182110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605170700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605170100
value1=1.175940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605151800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605151200
value1=1.179120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605151200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605150600
value1=1.178860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605105900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605105300
value1=1.175230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605104400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605103800
value1=1.175470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605092400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605091800
value1=1.178270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605091800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605091200
value1=1.179050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605088500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605087900
value1=1.180710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605062100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605061500
value1=1.182860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605061500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605060900
value1=1.182650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605013500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605012900
value1=1.177830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605012900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605012300
value1=1.177860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605010800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605010200
value1=1.179310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605009600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605009000
value1=1.180080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604982300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604981700
value1=1.184050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604946300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604945700
value1=1.180670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604944800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604944200
value1=1.181760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604909100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604908500
value1=1.187910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604672100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604671500
value1=1.188460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604667300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604666700
value1=1.187840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604657700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604657100
value1=1.185300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604656500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604655900
value1=1.184260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604613000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604612400
value1=1.184120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604589600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604589000
value1=1.185840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604588100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604587500
value1=1.184970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604581500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604580900
value1=1.181520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604580000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604579400
value1=1.180800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604572200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604571600
value1=1.177290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604550300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604549700
value1=1.170940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604546400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604545800
value1=1.171710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604539800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604539200
value1=1.174040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604501100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604500500
value1=1.174180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604486700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604486100
value1=1.169450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604465700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604465100
value1=1.160840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604459100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604458500
value1=1.168350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604456700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604456100
value1=1.177030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604455500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604454900
value1=1.176730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604448300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604447700
value1=1.171690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604438100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604437500
value1=1.169760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604437500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604436900
value1=1.169810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604436900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604436300
value1=1.170170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604426400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604425800
value1=1.173830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604411400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604410800
value1=1.171640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604405100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604404500
value1=1.169970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604403000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604402400
value1=1.169720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604400600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604400000
value1=1.168710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604399700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604399100
value1=1.169040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604398500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604397900
value1=1.167730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604397900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604397300
value1=1.167440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604393700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604393100
value1=1.166890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604389500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604388900
value1=1.166250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604376900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604376300
value1=1.165490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604376300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604375700
value1=1.165410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604358000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604357400
value1=1.164380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604334300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604333700
value1=1.162790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604333700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604333100
value1=1.163080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604325600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604325000
value1=1.165830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604300700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604300100
value1=1.162950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604299800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604299200
value1=1.163020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604085900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604085300
value1=1.164530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604085000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604084400
value1=1.164730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604074800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604074200
value1=1.170100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604053500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604052900
value1=1.166800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604047500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604046900
value1=1.167460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604046600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604046000
value1=1.167360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604040000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604039400
value1=1.169740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604035500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604034900
value1=1.169270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604033700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604033100
value1=1.168780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603985100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603984500
value1=1.169370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603983900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603983300
value1=1.170140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603970700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603970100
value1=1.172330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603942200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603941600
value1=1.175890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603913700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603913100
value1=1.176270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603900200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603899600
value1=1.171640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603899600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603899000
value1=1.171930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603885200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603884600
value1=1.175070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603879500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603878900
value1=1.176620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603849500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603848900
value1=1.177270
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
date1=1603846200
value1=1.178400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603845600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603845000
value1=1.178550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603840500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603839900
value1=1.180720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603838100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603837500
value1=1.181200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603815300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603814700
value1=1.184000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603798200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603797600
value1=1.179490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603795200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603794600
value1=1.181620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603794300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603793700
value1=1.181980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603790400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603789800
value1=1.183840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603773300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603772700
value1=1.182500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603772400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603771800
value1=1.182410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603688100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603687500
value1=1.183240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603675500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603674900
value1=1.183950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603490100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603489500
value1=1.186430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603487700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603487100
value1=1.186030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603474500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603473900
value1=1.182450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603457100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603456500
value1=1.185360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603454100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603453500
value1=1.184460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603425300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603424700
value1=1.178580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603377600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603377000
value1=1.181460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603371300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603370700
value1=1.182670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603360500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603359900
value1=1.186020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603356300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603355700
value1=1.185280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603344300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603343700
value1=1.183680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603338600
value1=1.184130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603338000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603337400
value1=1.184140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603336200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603335600
value1=1.184750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603335300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603334700
value1=1.185040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603320600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603320000
value1=1.185610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603272900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603272300
value1=1.186470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603272300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603271700
value1=1.186160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603263300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603262700
value1=1.184990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603257600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603257000
value1=1.184650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603256100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603255500
value1=1.184270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603216200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603215600
value1=1.184370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603215000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603214400
value1=1.183830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603202100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603201500
value1=1.181880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603200900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603200300
value1=1.181920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603197900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603197300
value1=1.180900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603182000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603181400
value1=1.178320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603178400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603177800
value1=1.178080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603177500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603176900
value1=1.177910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603145400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603144800
value1=1.176430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603121100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603120500
value1=1.178960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603116600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603116000
value1=1.177120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603114500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603113900
value1=1.176230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603113300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603112700
value1=1.176000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603107600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603107000
value1=1.173940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603077000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603076400
value1=1.172370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602861900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602861300
value1=1.174910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602859200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602858600
value1=1.174260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602842400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602841800
value1=1.169280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602840600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602840000
value1=1.169440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602805200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602804600
value1=1.171290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602774900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602774300
value1=1.169100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602764100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602763500
value1=1.170280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602755700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602755100
value1=1.173580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602755100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602754500
value1=1.173970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602752100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602751500
value1=1.175940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602735900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602735300
value1=1.175880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602690900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602690300
value1=1.176950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602679800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602679200
value1=1.171870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602671100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602670500
value1=1.172940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602645000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602644400
value1=1.173710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602611700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602611100
value1=1.173810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602609900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602609300
value1=1.174370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602587100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602586500
value1=1.177800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602584700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602584100
value1=1.177690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602578100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602577500
value1=1.180460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602561300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602560700
value1=1.179510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602514500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602513900
value1=1.178540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602506400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602505800
value1=1.179370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602492900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602492300
value1=1.182860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602464100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602463500
value1=1.181090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602260400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602259800
value1=1.181900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602245100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602244500
value1=1.180610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602243900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602243300
value1=1.180010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602241800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602241200
value1=1.179920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602225600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602225000
value1=1.178360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602224400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602223800
value1=1.178380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602219600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602219000
value1=1.177710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602217800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602217200
value1=1.177460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602214500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602213900
value1=1.175620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602212700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602212100
value1=1.177010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602174300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602173700
value1=1.173740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602155400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602154800
value1=1.175700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602148200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602147600
value1=1.177990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602137400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602136800
value1=1.177410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602081300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602080700
value1=1.177670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602068700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602068100
value1=1.177000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602066900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602066300
value1=1.176430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602065700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602065100
value1=1.176350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602033300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602032700
value1=1.172910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602032400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602031800
value1=1.172960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602026700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602026100
value1=1.174200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602022500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602021900
value1=1.174210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601998500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601997900
value1=1.180690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601966400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601965800
value1=1.179850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601940300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601939700
value1=1.179030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601934600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601934000
value1=1.177110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601918100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601917500
value1=1.179820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601911200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601910600
value1=1.177150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601903100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601902500
value1=1.176080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601901900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601901300
value1=1.175860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601899800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601899200
value1=1.175660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601897100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601896500
value1=1.174820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601874300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601873700
value1=1.173740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601873100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601872500
value1=1.173830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601869500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601868900
value1=1.173170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601626500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601625900
value1=1.170040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601623200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601622600
value1=1.171220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601622300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601621700
value1=1.171340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601621700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601621100
value1=1.171620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601620200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601619600
value1=1.171500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601615400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601614800
value1=1.172620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601610000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601609400
value1=1.173320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601609400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601608800
value1=1.173640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601608800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601608200
value1=1.173580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601563500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601562900
value1=1.176590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601549400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601548800
value1=1.172180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601533500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601532900
value1=1.174830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601527800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601527200
value1=1.174300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601516700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601516100
value1=1.173340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601490000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601489400
value1=1.175460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601469300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601468700
value1=1.169540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601468400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601467800
value1=1.169860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601400900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601400300
value1=1.174280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601399700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601399100
value1=1.173480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601388900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601388300
value1=1.171740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601350200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601349600
value1=1.168350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601349000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601348400
value1=1.168150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601305500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601304900
value1=1.167980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601300400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601299800
value1=1.166660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601293800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601293200
value1=1.164820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601265900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601265300
value1=1.161490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601053800
value1=1.161440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601038500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601037900
value1=1.163750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600981200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600980600
value1=1.168790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600921800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600921200
value1=1.168250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600899000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600898400
value1=1.165060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600883100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600882500
value1=1.166390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600882200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600881600
value1=1.166490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600873800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600873200
value1=1.168520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600864500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600863900
value1=1.172170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600835100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600834500
value1=1.167580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600834200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600833600
value1=1.167680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600832700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600832100
value1=1.169340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600798500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600797900
value1=1.169820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600797300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600796700
value1=1.170640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600783200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600782600
value1=1.176930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600782600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600782000
value1=1.176680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600771800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600771200
value1=1.172020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600770300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600769700
value1=1.173150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600767900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600767300
value1=1.173650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600765500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600764900
value1=1.175120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600764900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600764300
value1=1.175190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600727700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600727100
value1=1.177310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600710300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600709700
value1=1.173030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600703700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600703100
value1=1.176180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600695000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600694400
value1=1.177670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600693500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600692900
value1=1.178200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600673100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600672500
value1=1.187410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600660800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600660200
value1=1.186350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600646700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600473000
value1=1.183970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600453200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600452600
value1=1.186940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600452300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600451700
value1=1.186430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600423500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600422900
value1=1.186990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600383900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600383300
value1=1.185340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600383300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600382700
value1=1.185280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600379100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600378500
value1=1.184380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600344300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600343700
value1=1.181110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600343400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600342800
value1=1.181050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600339800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600339200
value1=1.178910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600338600
value1=1.179150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600325100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600324500
value1=1.174520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600323900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600323300
value1=1.173990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600319400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600318800
value1=1.176010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600315500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600314900
value1=1.177530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600278300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600277700
value1=1.181800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600271700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600271100
value1=1.184460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600260900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600260300
value1=1.188510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600255800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600255200
value1=1.187380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600229400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600228800
value1=1.182740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600228200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600227600
value1=1.183030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600227600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600227000
value1=1.183300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600224900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600224300
value1=1.184060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600191600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600191000
value1=1.184110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600191000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600190400
value1=1.184050
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
date1=1600188600
value1=1.185560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600185600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600185000
value1=1.186750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600157700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600157100
value1=1.190220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600156200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600155600
value1=1.189750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600155300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600154700
value1=1.189640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600152600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600152000
value1=1.189370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600147800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600147200
value1=1.188500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600140600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600140000
value1=1.185760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600082700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600082100
value1=1.187090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600074300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600073700
value1=1.185710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600062600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600062000
value1=1.185300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600061700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600061100
value1=1.185300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600055100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600054500
value1=1.183130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600054500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600053900
value1=1.183050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600048800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600048200
value1=1.185040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599829500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599828900
value1=1.187660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599826800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599826200
value1=1.186860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599825300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599824700
value1=1.186240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599797400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599796800
value1=1.184290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599796500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599795900
value1=1.183890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599777000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599776400
value1=1.180870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599774600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599774000
value1=1.182390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599774000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599773400
value1=1.182470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599768000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599767400
value1=1.184680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599756900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599756300
value1=1.192050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599756000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599755400
value1=1.190490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599754800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599754200
value1=1.190990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599753600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599753000
value1=1.190250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599729300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599728700
value1=1.183760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599717600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599717000
value1=1.182700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599714300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599713700
value1=1.182390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599708300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599707700
value1=1.181720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599673800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599673200
value1=1.183700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599670800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599670200
value1=1.182360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599669600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599669000
value1=1.182030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599667200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599666600
value1=1.181190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599645000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599644400
value1=1.176040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599643800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599643200
value1=1.176390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599614400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599613800
value1=1.175920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599584100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599583500
value1=1.176430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599572400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599571800
value1=1.177650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599571500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599570900
value1=1.178560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599556500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599555900
value1=1.183040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599555000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599554400
value1=1.179700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599541500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599540900
value1=1.179520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599540600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599540000
value1=1.179630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599539400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599538800
value1=1.180020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599538800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599538200
value1=1.179910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599528900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599528300
value1=1.182320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599501300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599500700
value1=1.183540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599485700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599485100
value1=1.181130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599469200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599468600
value1=1.182560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599256800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599256200
value1=1.185770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599252600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599252000
value1=1.184970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599251400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599250800
value1=1.184650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599238800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599238200
value1=1.179180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599237300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599236700
value1=1.179920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599236700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599236100
value1=1.180360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599234300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599233700
value1=1.181260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599171300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599170700
value1=1.186430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599169500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599168900
value1=1.186010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599123000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599122400
value1=1.179580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599119700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599119100
value1=1.180320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599118500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599117900
value1=1.180930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599117900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599117300
value1=1.181080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599112800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599112200
value1=1.182240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599108600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599108000
value1=1.182510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599108000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599107400
value1=1.182670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599106800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599106200
value1=1.182990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599106200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599105600
value1=1.183150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599102600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599102000
value1=1.183790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599090000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599089400
value1=1.185720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599043200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599042600
value1=1.186300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599020400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599019800
value1=1.189540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599019200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599018600
value1=1.190520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599015300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599014700
value1=1.193130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598991600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598991000
value1=1.190520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598980200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598979600
value1=1.193460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598942400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598941800
value1=1.199700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598937000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598936400
value1=1.197590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598935500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598934900
value1=1.196210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598930400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598929800
value1=1.195100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598886300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598885700
value1=1.194280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598843400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598842800
value1=1.192810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598614800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598614200
value1=1.192090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598610600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598610000
value1=1.190040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598603400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598602800
value1=1.187840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598599800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598599200
value1=1.186030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598596500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598595900
value1=1.184910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598595000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598594400
value1=1.184360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598546100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598545500
value1=1.188350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598538300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598537700
value1=1.179720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598537400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598536800
value1=1.179280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598501400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598500800
value1=1.185280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598497800
value1=1.184790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598493600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598493000
value1=1.184110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598457000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598456400
value1=1.177340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598455500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598454900
value1=1.178240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598430000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598429400
value1=1.180560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598428800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598428200
value1=1.180870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598427600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598427000
value1=1.181220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598422500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598421900
value1=1.181530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598421600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598421000
value1=1.181620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598394900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598394300
value1=1.184030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598358300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598357700
value1=1.184410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598354100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598353500
value1=1.183350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598339400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598338800
value1=1.181670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598331900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598331300
value1=1.181130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598307900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598307300
value1=1.178610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598298600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598298000
value1=1.179260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598294400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598293800
value1=1.179870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598276400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598275800
value1=1.184720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598274000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598273400
value1=1.183980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598259900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598259300
value1=1.180820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598251800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598251200
value1=1.178330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598052600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598052000
value1=1.180120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598022900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598022300
value1=1.175890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598017800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598017200
value1=1.178750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598011800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598011200
value1=1.180970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598007000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598006400
value1=1.183600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597998300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597997700
value1=1.188490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597980300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597979700
value1=1.187680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597979400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597978800
value1=1.187660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597978800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597978200
value1=1.187390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597940700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597940100
value1=1.180620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597923300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597922700
value1=1.181070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597919700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597919100
value1=1.187160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597872300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597871700
value1=1.183520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597868400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597867800
value1=1.186780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597866900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597866300
value1=1.187430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597866000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597865400
value1=1.187530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597862100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597861500
value1=1.189330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597861200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597860600
value1=1.189230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597828200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597827600
value1=1.194960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597807200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597806600
value1=1.195050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597803000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597802400
value1=1.194280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597770300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597769700
value1=1.196390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597767900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597767300
value1=1.194480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597766100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597765500
value1=1.194680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597725000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597724400
value1=1.189540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597720500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597719900
value1=1.188210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597683300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597682700
value1=1.188390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597664400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597663800
value1=1.183030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597655400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597654800
value1=1.187020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597642800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597642200
value1=1.186800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597436400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597435800
value1=1.185190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597435200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597434600
value1=1.185130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597408500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597407900
value1=1.178030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597401900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597401300
value1=1.179290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597355400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597354800
value1=1.179580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597311600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597311000
value1=1.183810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597310100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597309500
value1=1.183100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597292400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597291800
value1=1.181600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597287300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597286700
value1=1.179900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597248900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597248300
value1=1.180430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597238400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597237800
value1=1.177730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597236600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597236000
value1=1.177250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597229100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597228500
value1=1.174840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597223700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597223100
value1=1.173620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597209000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597208400
value1=1.171570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597203900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597203300
value1=1.172460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597186800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597186200
value1=1.172990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597182900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597182300
value1=1.174080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597157700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597157100
value1=1.180740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597153500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597152900
value1=1.180400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597152300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597151700
value1=1.179980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597148700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597148100
value1=1.178760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597147800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597147200
value1=1.178590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597146000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597145400
value1=1.177270
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
date1=1597139400
value1=1.172190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597131300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597130700
value1=1.175760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597124100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597123500
value1=1.175280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597123500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597122900
value1=1.175350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597118700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597118100
value1=1.172170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597116900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597116300
value1=1.172690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597097400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597096800
value1=1.173600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597088100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597087500
value1=1.174650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597079100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597078500
value1=1.179040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597070100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597069500
value1=1.174220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597068300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597067700
value1=1.174470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597055400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597054800
value1=1.175820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597053900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597053300
value1=1.176410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597032000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597031400
value1=1.179830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597023300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597022700
value1=1.177250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596821400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596820800
value1=1.175440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596820500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596819900
value1=1.175860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596819600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596819000
value1=1.176480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596818100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596817500
value1=1.176780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596784200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596783600
value1=1.182130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596783000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596782400
value1=1.182430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596747300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596746700
value1=1.189660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596741900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596741300
value1=1.188790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596712200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596711600
value1=1.184080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596705300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596704700
value1=1.191450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596684600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596684000
value1=1.188740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596684000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596683400
value1=1.188630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596677700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596677100
value1=1.187850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596664500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596663900
value1=1.185530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596660600
value1=1.186120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596642000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596641400
value1=1.187630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596633300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596632700
value1=1.186220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596619500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596618900
value1=1.179850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596618300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596617700
value1=1.180070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596607500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596606900
value1=1.182310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596597300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596596700
value1=1.181440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596582600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596582000
value1=1.180490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596579600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596579000
value1=1.180040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596575400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596574800
value1=1.179380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596558900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596558300
value1=1.172550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596557700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596557100
value1=1.172870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596552900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596552300
value1=1.175310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596550200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596549600
value1=1.176400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596538200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596537600
value1=1.180510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596521400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596520800
value1=1.177660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596472200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596471600
value1=1.170190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596471600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596471000
value1=1.170150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596462900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596462300
value1=1.171690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596462000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596461400
value1=1.171580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596460200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596459600
value1=1.173420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596449100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596448500
value1=1.174850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596447900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596447300
value1=1.174740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596427800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596427200
value1=1.174830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596426600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596426000
value1=1.175150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596420600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596420000
value1=1.179820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596224700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596224100
value1=1.176330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596223800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596223200
value1=1.178740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596213600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596213000
value1=1.180070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596206700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596206100
value1=1.182600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596205800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596205200
value1=1.182780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596205200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596204600
value1=1.182820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596198300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596197700
value1=1.183830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596196800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596196200
value1=1.185290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596174600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596174000
value1=1.189980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596172500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596171900
value1=1.189030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596165900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596165300
value1=1.188700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596165000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596164400
value1=1.188000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596162900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596162300
value1=1.187260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596153600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596153000
value1=1.185080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596153000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596152400
value1=1.185130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596151800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596151200
value1=1.185090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596149700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596149100
value1=1.184700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596148200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596147600
value1=1.184380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596145800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596145200
value1=1.183850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596142200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596141600
value1=1.183450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596141600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596141000
value1=1.183710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596127800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596127200
value1=1.180790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596125400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596124800
value1=1.179200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596102300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596101700
value1=1.174900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596079800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596079200
value1=1.177320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596057600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596057000
value1=1.179840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596045900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596045300
value1=1.177830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596039600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596039000
value1=1.175870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596035400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596034800
value1=1.171810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596019800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596019200
value1=1.177240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596016500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596015900
value1=1.175380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596015600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596015000
value1=1.175300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596004200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596003600
value1=1.173470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595948700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595948100
value1=1.170280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595948100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595947500
value1=1.170550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595934900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595934300
value1=1.169720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595921100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595920500
value1=1.172030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595920200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595919600
value1=1.172130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595918100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595917500
value1=1.173490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595901900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595901300
value1=1.176650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595901000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595900400
value1=1.176340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595872200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595871600
value1=1.178090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595863200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595862600
value1=1.176320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595862300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595861700
value1=1.174830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595856900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595856300
value1=1.173390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595832300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595831700
value1=1.171760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595825400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595824800
value1=1.170000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595823600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595823000
value1=1.169190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595634000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595633400
value1=1.165890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595633100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595632500
value1=1.165630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595626500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595625900
value1=1.165020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595613300
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595612700
value1=1.163920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595603700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595603100
value1=1.161560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595576400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595575800
value1=1.159440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595564700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595564100
value1=1.162110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595531400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595530800
value1=1.162350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595520600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595520000
value1=1.154320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595519100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595518500
value1=1.155660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595496000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595495400
value1=1.159550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595493000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595492400
value1=1.158790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595490000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595489400
value1=1.158680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595432700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595432100
value1=1.160290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595431800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595431200
value1=1.159230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595424900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595424300
value1=1.157930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595414700
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595414100
value1=1.150830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595410500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595409900
value1=1.152070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595404500
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595403900
value1=1.153510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595403900
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595403300
value1=1.153490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595402100
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595401500
value1=1.154450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

</window>

<window>
height=50.000000
objects=0

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
scale_fix_min_val=-0.001232
scale_fix_max=0
scale_fix_max_val=0.000734
expertmode=0
fixed_height=-1

<graph>
name=
draw=2
style=0
width=1
arrow=251
color=12632256
</graph>

<graph>
name=
draw=1
style=2
width=1
arrow=251
color=255
</graph>

<level>
level=0.001000
style=0
color=65535
width=3
descr=
</level>

<level>
level=-0.001000
style=0
color=65535
width=3
descr=
</level>

<level>
level=0.000500
style=0
color=65535
width=3
descr=
</level>

<level>
level=-0.000500
style=0
color=65535
width=3
descr=
</level>
fast_ema=50
slow_ema=26
macd_sma=9
</indicator>
</window>

<window>
height=50.000000
objects=0

<indicator>
name=Momentum
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=100.107500
scale_fix_min=0
scale_fix_min_val=99.771450
scale_fix_max=0
scale_fix_max_val=100.443550
expertmode=0
fixed_height=-1

<graph>
name=
draw=1
style=0
width=1
arrow=251
color=255
</graph>

<level>
level=100.050000
style=2
color=65535
width=1
descr=
</level>

<level>
level=99.950000
style=2
color=65535
width=1
descr=
</level>
period=7
</indicator>
</window>
</chart>