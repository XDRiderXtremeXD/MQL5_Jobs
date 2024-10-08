<chart>
id=132852670910783611
symbol=EURUSD
description=Euro vs US Dollar
period_type=1
period_size=1
digits=5
tick_size=0.000000
position_time=1638417600
scale_fix=0
scale_fixed_min=1.122000
scale_fixed_max=1.137300
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
shift_size=20.076849
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=0
lastline=0
days=1
descriptions=0
tradelines=1
tradehistory=1
window_left=130
window_top=130
window_right=1959
window_bottom=769
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
bardown_color=65280
bullcandle_color=0
bearcandle_color=16777215
chartline_color=65280
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=49152
stops_color=255
windows_total=1

<window>
height=100.000000
objects=417

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
path=Indicators\Supply And Demand V3.0.ex5
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
Testeado=0
TransparienciaDePatronesSinRSIoEST=true
Hora_Inicio=0
Hora_Final=0
Tipo_de_Datos=1
Filtro_Traspaso_50=false
Tolerancia_Puntos_Flecha=10
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
AlertPC=true
AlertMovil=true
AlertMail=false
BackLimit=3000
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
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
name=Custom Indicator
path=Indicators\Examples\ZigZag.ex5
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
name=ZigZag(15,5,3)
draw=4
style=0
width=1
arrow=251
color=255
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
<inputs>
InpDepth=15
InpDeviation=5
InpBackstep=3
</inputs>
</indicator>
<object>
type=32
name=autotrade #16250606 sell 0.01 EURUSD at 1.18651
hidden=1
color=1918177
selectable=0
date1=1596660767
value1=1.186510
</object>

<object>
type=31
name=autotrade #16253742 buy 0.01 EURUSD at 1.18645
hidden=1
descr=[sl 1.18645]
color=11296515
selectable=0
date1=1596666264
value1=1.186450
</object>

<object>
type=32
name=autotrade #16680944 sell 0.01 EURUSD at 1.18200
hidden=1
color=1918177
selectable=0
date1=1597343639
value1=1.182000
</object>

<object>
type=31
name=autotrade #16695763 buy 0.01 EURUSD at 1.18180
hidden=1
descr=[sl 1.18180]
color=11296515
selectable=0
date1=1597370345
value1=1.181800
</object>

<object>
type=32
name=autotrade #16963675 sell 0.01 EURUSD at 1.18252
hidden=1
color=1918177
selectable=0
date1=1597922509
value1=1.182520
</object>

<object>
type=31
name=autotrade #16972380 buy 0.01 EURUSD at 1.18462
hidden=1
descr=[sl 1.18462]
color=11296515
selectable=0
date1=1597934168
value1=1.184620
</object>

<object>
type=32
name=autotrade #17094845 sell 0.01 EURUSD at 1.18157
hidden=1
color=1918177
selectable=0
date1=1598290619
value1=1.181570
</object>

<object>
type=31
name=autotrade #17101923 buy 0.01 EURUSD at 1.18014
hidden=1
color=11296515
selectable=0
date1=1598299238
value1=1.180140
</object>

<object>
type=32
name=autotrade #17342282 sell 0.01 EURUSD at 1.18683
hidden=1
color=1918177
selectable=0
date1=1598634539
value1=1.186830
</object>

<object>
type=31
name=autotrade #17343841 buy 0.01 EURUSD at 1.18884
hidden=1
descr=[sl 1.18884]
color=11296515
selectable=0
date1=1598635304
value1=1.188840
</object>

<object>
type=31
name=autotrade #17390388 buy 0.01 EURUSD at 1.19435
hidden=1
color=11296515
selectable=0
date1=1598890398
value1=1.194350
</object>

<object>
type=32
name=autotrade #17391174 sell 0.01 EURUSD at 1.19361
hidden=1
color=1918177
selectable=0
date1=1598891259
value1=1.193610
</object>

<object>
type=32
name=autotrade #17392804 sell 0.01 EURUSD at 1.19254
hidden=1
color=1918177
selectable=0
date1=1598892492
value1=1.192540
</object>

<object>
type=31
name=autotrade #17398623 buy 0.01 EURUSD at 1.19555
hidden=1
descr=[sl 1.19555]
color=11296515
selectable=0
date1=1598896142
value1=1.195550
</object>

<object>
type=32
name=autotrade #17454342 sell 0.01 EURUSD at 1.19543
hidden=1
color=1918177
selectable=0
date1=1598979638
value1=1.195430
</object>

<object>
type=31
name=autotrade #17467841 buy 0.01 EURUSD at 1.19411
hidden=1
color=11296515
selectable=0
date1=1598989822
value1=1.194110
</object>

<object>
type=32
name=autotrade #17495273 sell 0.01 EURUSD at 1.18865
hidden=1
color=1918177
selectable=0
date1=1599041222
value1=1.188650
</object>

<object>
type=31
name=autotrade #17528337 buy 0.01 EURUSD at 1.18396
hidden=1
color=11296515
selectable=0
date1=1599069911
value1=1.183960
</object>

<object>
type=32
name=autotrade #17637708 sell 0.02 EURUSD at 1.18300
hidden=1
color=1918177
selectable=0
date1=1599234633
value1=1.183000
</object>

<object>
type=31
name=autotrade #17646877 buy 0.02 EURUSD at 1.17898
hidden=1
descr=[tp 1.17900]
color=11296515
selectable=0
date1=1599239107
value1=1.178980
</object>

<object>
type=32
name=autotrade #17744440 sell 0.02 EURUSD at 1.17730
hidden=1
color=1918177
selectable=0
date1=1599583504
value1=1.177300
</object>

<object>
type=31
name=autotrade #17748098 buy 0.02 EURUSD at 1.17882
hidden=1
color=11296515
selectable=0
date1=1599585078
value1=1.178820
</object>

<object>
type=32
name=autotrade #17865554 sell 0.04 EURUSD at 1.18817
hidden=1
color=1918177
selectable=0
date1=1599760085
value1=1.188170
</object>

<object>
type=31
name=autotrade #17870958 buy 0.04 EURUSD at 1.18835
hidden=1
color=11296515
selectable=0
date1=1599763787
value1=1.188350
</object>

<object>
type=31
name=autotrade #17897707 buy 0.04 EURUSD at 1.18449
hidden=1
color=11296515
selectable=0
date1=1599819638
value1=1.184490
</object>

<object>
type=32
name=autotrade #17908828 sell 0.04 EURUSD at 1.18518
hidden=1
color=1918177
selectable=0
date1=1599836647
value1=1.185180
</object>

<object>
type=32
name=autotrade #17910010 sell 0.04 EURUSD at 1.18439
hidden=1
color=1918177
selectable=0
date1=1599838370
value1=1.184390
</object>

<object>
type=31
name=autotrade #17924364 buy 0.04 EURUSD at 1.18310
hidden=1
color=11296515
selectable=0
date1=1599855241
value1=1.183100
</object>

<object>
type=32
name=autotrade #18013210 sell 0.04 EURUSD at 1.18542
hidden=1
color=1918177
selectable=0
date1=1600189299
value1=1.185420
</object>

<object>
type=31
name=autotrade #18020129 buy 0.04 EURUSD at 1.18494
hidden=1
color=11296515
selectable=0
date1=1600194943
value1=1.184940
</object>

<object>
type=32
name=autotrade #18054781 sell 0.04 EURUSD at 1.18573
hidden=1
color=1918177
selectable=0
date1=1600270900
value1=1.185730
</object>

<object>
type=31
name=autotrade #18055950 buy 0.04 EURUSD at 1.18564
hidden=1
descr=[sl 1.18564]
color=11296515
selectable=0
date1=1600271588
value1=1.185640
</object>

<object>
type=32
name=autotrade #18056043 sell 0.04 EURUSD at 1.18543
hidden=1
color=1918177
selectable=0
date1=1600271672
value1=1.185430
</object>

<object>
type=31
name=autotrade #18056064 buy 0.04 EURUSD at 1.18543
hidden=1
color=11296515
selectable=0
date1=1600271708
value1=1.185430
</object>

<object>
type=31
name=autotrade #18069708 buy 0.04 EURUSD at 1.18461
hidden=1
color=11296515
selectable=0
date1=1600280106
value1=1.184610
</object>

<object>
type=32
name=autotrade #18070374 sell 0.04 EURUSD at 1.18405
hidden=1
color=1918177
selectable=0
date1=1600280762
value1=1.184050
</object>

<object>
type=31
name=autotrade #18131165 buy 0.04 EURUSD at 1.18152
hidden=1
color=11296515
selectable=0
date1=1600361760
value1=1.181520
</object>

<object>
type=32
name=autotrade #18140858 sell 0.04 EURUSD at 1.18204
hidden=1
color=1918177
selectable=0
date1=1600370278
value1=1.182040
</object>

<object>
type=32
name=autotrade #18168587 sell 0.04 EURUSD at 1.18389
hidden=1
color=1918177
selectable=0
date1=1600436443
value1=1.183890
</object>

<object>
type=31
name=autotrade #18176498 buy 0.04 EURUSD at 1.18478
hidden=1
color=11296515
selectable=0
date1=1600445092
value1=1.184780
</object>

<object>
type=32
name=autotrade #18181305 sell 0.08 EURUSD at 1.18271
hidden=1
color=1918177
selectable=0
date1=1600448598
value1=1.182710
</object>

<object>
type=31
name=autotrade #18184985 buy 0.08 EURUSD at 1.18521
hidden=1
descr=[sl 1.18520]
color=11296515
selectable=0
date1=1600450641
value1=1.185210
</object>

<object>
type=32
name=autotrade #18217584 sell 0.04 EURUSD at 1.18245
hidden=1
color=1918177
selectable=0
date1=1600686187
value1=1.182450
</object>

<object>
type=31
name=autotrade #18223221 buy 0.04 EURUSD at 1.18001
hidden=1
color=11296515
selectable=0
date1=1600689513
value1=1.180010
</object>

<object>
type=32
name=autotrade #18327484 sell 0.04 EURUSD at 1.17169
hidden=1
color=1918177
selectable=0
date1=1600796560
value1=1.171690
</object>

<object>
type=31
name=autotrade #18332894 buy 0.04 EURUSD at 1.17167
hidden=1
descr=[sl 1.17165]
color=11296515
selectable=0
date1=1600798532
value1=1.171670
</object>

<object>
type=32
name=autotrade #18333368 sell 0.04 EURUSD at 1.17099
hidden=1
color=1918177
selectable=0
date1=1600798806
value1=1.170990
</object>

<object>
type=31
name=autotrade #18336209 buy 0.04 EURUSD at 1.17076
hidden=1
color=11296515
selectable=0
date1=1600801352
value1=1.170760
</object>

<object>
type=32
name=autotrade #18393868 sell 0.04 EURUSD at 1.16668
hidden=1
color=1918177
selectable=0
date1=1600881750
value1=1.166680
</object>

<object>
type=31
name=autotrade #18397520 buy 0.04 EURUSD at 1.16665
hidden=1
color=11296515
selectable=0
date1=1600883468
value1=1.166650
</object>

<object>
type=32
name=autotrade #18442155 sell 0.04 EURUSD at 1.16400
hidden=1
color=1918177
selectable=0
date1=1600950716
value1=1.164000
</object>

<object>
type=31
name=autotrade #18466254 buy 0.04 EURUSD at 1.16607
hidden=1
descr=[sl 1.16607]
color=11296515
selectable=0
date1=1600973595
value1=1.166070
</object>

<object>
type=32
name=autotrade #18511573 sell 0.04 EURUSD at 1.16245
hidden=1
color=1918177
selectable=0
date1=1601053722
value1=1.162450
</object>

<object>
type=31
name=autotrade #18518512 buy 0.04 EURUSD at 1.16240
hidden=1
descr=[sl 1.16240]
color=11296515
selectable=0
date1=1601060459
value1=1.162400
</object>

<object>
type=31
name=autotrade #18902537 buy 0.04 EURUSD at 1.18042
hidden=1
color=11296515
selectable=0
date1=1601997753
value1=1.180420
</object>

<object>
type=32
name=autotrade #18910080 sell 0.04 EURUSD at 1.17817
hidden=1
descr=[sl 1.17818]
color=1918177
selectable=0
date1=1602003249
value1=1.178170
</object>

<object>
type=32
name=autotrade #19228764 sell 0.04 EURUSD at 1.17278
hidden=1
color=1918177
selectable=0
date1=1602677592
value1=1.172780
</object>

<object>
type=31
name=autotrade #19237508 buy 0.04 EURUSD at 1.17477
hidden=1
descr=[sl 1.17477]
color=11296515
selectable=0
date1=1602687495
value1=1.174770
</object>

<object>
type=32
name=autotrade #19673538 sell 0.08 EURUSD at 1.18350
hidden=1
color=1918177
selectable=0
date1=1603472498
value1=1.183500
</object>

<object>
type=31
name=autotrade #19685464 buy 0.08 EURUSD at 1.18518
hidden=1
descr=[sl 1.18517]
color=11296515
selectable=0
date1=1603484285
value1=1.185180
</object>

<object>
type=32
name=autotrade #19708681 sell 0.04 EURUSD at 1.18256
hidden=1
color=1918177
selectable=0
date1=1603710068
value1=1.182560
</object>

<object>
type=31
name=autotrade #19742578 buy 0.04 EURUSD at 1.18250
hidden=1
descr=[sl 1.18250]
color=11296515
selectable=0
date1=1603742964
value1=1.182500
</object>

<object>
type=32
name=autotrade #19764834 sell 0.04 EURUSD at 1.18022
hidden=1
color=1918177
selectable=0
date1=1603797277
value1=1.180220
</object>

<object>
type=31
name=autotrade #19785077 buy 0.04 EURUSD at 1.18390
hidden=1
descr=[sl 1.18390]
color=11296515
selectable=0
date1=1603818076
value1=1.183900
</object>

<object>
type=32
name=autotrade #19821796 sell 0.04 EURUSD at 1.17671
hidden=1
color=1918177
selectable=0
date1=1603878799
value1=1.176710
</object>

<object>
type=32
name=autotrade #19826461 sell 0.08 EURUSD at 1.17600
hidden=1
color=1918177
selectable=0
date1=1603883081
value1=1.176000
</object>

<object>
type=31
name=autotrade #19847712 buy 0.08 EURUSD at 1.17300
hidden=1
descr=[tp 1.17300]
color=11296515
selectable=0
date1=1603897934
value1=1.173000
</object>

<object>
type=31
name=autotrade #19856397 buy 0.04 EURUSD at 1.17322
hidden=1
color=11296515
selectable=0
date1=1603902530
value1=1.173220
</object>

<object>
type=32
name=autotrade #19926878 sell 0.08 EURUSD at 1.16848
hidden=1
color=1918177
selectable=0
date1=1603990163
value1=1.168480
</object>

<object>
type=31
name=autotrade #19930735 buy 0.08 EURUSD at 1.16845
hidden=1
descr=[sl 1.16845]
color=11296515
selectable=0
date1=1603991956
value1=1.168450
</object>

<object>
type=32
name=autotrade #19971032 sell 0.04 EURUSD at 1.16600
hidden=1
color=1918177
selectable=0
date1=1604058915
value1=1.166000
</object>

<object>
type=31
name=autotrade #19973050 buy 0.04 EURUSD at 1.16800
hidden=1
descr=[sl 1.16800]
color=11296515
selectable=0
date1=1604061156
value1=1.168000
</object>

<object>
type=31
name=autotrade #20100173 buy 0.04 EURUSD at 1.17200
hidden=1
color=11296515
selectable=0
date1=1604421013
value1=1.172000
</object>

<object>
type=32
name=autotrade #20112406 sell 0.04 EURUSD at 1.17209
hidden=1
descr=[sl 1.17210]
color=1918177
selectable=0
date1=1604429429
value1=1.172090
</object>

<object>
type=32
name=autotrade #20264905 sell 0.04 EURUSD at 1.18201
hidden=1
color=1918177
selectable=0
date1=1604593231
value1=1.182010
</object>

<object>
type=31
name=autotrade #20310544 buy 0.04 EURUSD at 1.18501
hidden=1
descr=[sl 1.18500]
color=11296515
selectable=0
date1=1604657402
value1=1.185010
</object>

<object>
type=32
name=autotrade #20494341 sell 0.04 EURUSD at 1.18093
hidden=1
color=1918177
selectable=0
date1=1605008839
value1=1.180930
</object>

<object>
type=31
name=autotrade #20600802 buy 0.04 EURUSD at 1.17652
hidden=1
descr=[sl 1.17650]
color=11296515
selectable=0
date1=1605119229
value1=1.176520
</object>

<object>
type=32
name=autotrade #20903885 sell 0.04 EURUSD at 1.18649
hidden=1
color=1918177
selectable=0
date1=1605708198
value1=1.186490
</object>

<object>
type=31
name=autotrade #20987147 buy 0.04 EURUSD at 1.18310
hidden=1
color=11296515
selectable=0
date1=1605804822
value1=1.183100
</object>

<object>
type=32
name=autotrade #21018118 sell 0.04 EURUSD at 1.18700
hidden=1
color=1918177
selectable=0
date1=1605864843
value1=1.187000
</object>

<object>
type=31
name=autotrade #21035483 buy 0.04 EURUSD at 1.18692
hidden=1
descr=[sl 1.18692]
color=11296515
selectable=0
date1=1605887829
value1=1.186920
</object>

<object>
type=32
name=autotrade #21071871 sell 0.04 EURUSD at 1.18649
hidden=1
color=1918177
selectable=0
date1=1606127196
value1=1.186490
</object>

<object>
type=31
name=autotrade #21081285 buy 0.04 EURUSD at 1.18952
hidden=1
descr=[sl 1.18950]
color=11296515
selectable=0
date1=1606136301
value1=1.189520
</object>

<object>
type=32
name=autotrade #21091479 sell 0.04 EURUSD at 1.18898
hidden=1
color=1918177
selectable=0
date1=1606146128
value1=1.188980
</object>

<object>
type=31
name=autotrade #21111475 buy 0.04 EURUSD at 1.18268
hidden=1
color=11296515
selectable=0
date1=1606154100
value1=1.182680
</object>

<object>
type=32
name=autotrade #21177544 sell 0.04 EURUSD at 1.18585
hidden=1
color=1918177
selectable=0
date1=1606233517
value1=1.185850
</object>

<object>
type=31
name=autotrade #21189471 buy 0.04 EURUSD at 1.18786
hidden=1
descr=[sl 1.18785]
color=11296515
selectable=0
date1=1606240331
value1=1.187860
</object>

<object>
type=32
name=autotrade #21235452 sell 0.04 EURUSD at 1.18876
hidden=1
color=1918177
selectable=0
date1=1606309586
value1=1.188760
</object>

<object>
type=32
name=autotrade #21244623 sell 0.04 EURUSD at 1.19029
hidden=1
color=1918177
selectable=0
date1=1606319104
value1=1.190290
</object>

<object>
type=31
name=autotrade #21254363 buy 0.04 EURUSD at 1.19230
hidden=1
descr=[sl 1.19228]
color=11296515
selectable=0
date1=1606326181
value1=1.192300
</object>

<object>
type=31
name=autotrade #21254365 buy 0.04 EURUSD at 1.19230
hidden=1
descr=[sl 1.19230]
color=11296515
selectable=0
date1=1606326181
value1=1.192300
</object>

<object>
type=32
name=autotrade #21329369 sell 0.04 EURUSD at 1.19170
hidden=1
color=1918177
selectable=0
date1=1606476812
value1=1.191700
</object>

<object>
type=31
name=autotrade #21352723 buy 0.04 EURUSD at 1.19470
hidden=1
descr=[sl 1.19470]
color=11296515
selectable=0
date1=1606498098
value1=1.194700
</object>

<object>
type=31
name=autotrade #21568528 buy 0.04 EURUSD at 1.20906
hidden=1
color=11296515
selectable=0
date1=1606928548
value1=1.209060
</object>

<object>
type=32
name=autotrade #21582041 sell 0.04 EURUSD at 1.20900
hidden=1
descr=[sl 1.20900]
color=1918177
selectable=0
date1=1606943487
value1=1.209000
</object>

<object>
type=32
name=autotrade #21690245 sell 0.04 EURUSD at 1.21627
hidden=1
color=1918177
selectable=0
date1=1607095987
value1=1.216270
</object>

<object>
type=31
name=autotrade #21707879 buy 0.04 EURUSD at 1.21396
hidden=1
color=11296515
selectable=0
date1=1607105037
value1=1.213960
</object>

<object>
type=32
name=autotrade #21739118 sell 0.04 EURUSD at 1.21069
hidden=1
color=1918177
selectable=0
date1=1607335963
value1=1.210690
</object>

<object>
type=31
name=autotrade #21747135 buy 0.04 EURUSD at 1.20875
hidden=1
descr=[tp 1.20875]
color=11296515
selectable=0
date1=1607339078
value1=1.208750
</object>

<object>
type=32
name=autotrade #21785355 sell 0.04 EURUSD at 1.21250
hidden=1
color=1918177
selectable=0
date1=1607372051
value1=1.212500
</object>

<object>
type=32
name=autotrade #21872034 sell 0.04 EURUSD at 1.21360
hidden=1
color=1918177
selectable=0
date1=1607504784
value1=1.213600
</object>

<object>
type=31
name=autotrade #21890308 buy 0.04 EURUSD at 1.21056
hidden=1
color=11296515
selectable=0
date1=1607524011
value1=1.210560
</object>

<object>
type=31
name=autotrade #21890313 buy 0.04 EURUSD at 1.21053
hidden=1
color=11296515
selectable=0
date1=1607524014
value1=1.210530
</object>

<object>
type=32
name=autotrade #21952452 sell 0.04 EURUSD at 1.20830
hidden=1
color=1918177
selectable=0
date1=1607598605
value1=1.208300
</object>

<object>
type=31
name=autotrade #21953916 buy 0.04 EURUSD at 1.21040
hidden=1
descr=[sl 1.21030]
color=11296515
selectable=0
date1=1607599939
value1=1.210400
</object>

<object>
type=32
name=autotrade #22141078 sell 0.04 EURUSD at 1.21421
hidden=1
color=1918177
selectable=0
date1=1608024397
value1=1.214210
</object>

<object>
type=31
name=autotrade #22208735 buy 0.04 EURUSD at 1.21820
hidden=1
descr=[sl 1.21825]
color=11296515
selectable=0
date1=1608114602
value1=1.218200
</object>

<object>
type=32
name=autotrade #22229409 sell 0.04 EURUSD at 1.21839
hidden=1
color=1918177
selectable=0
date1=1608132647
value1=1.218390
</object>

<object>
type=31
name=autotrade #22234549 buy 0.04 EURUSD at 1.22043
hidden=1
descr=[sl 1.22040]
color=11296515
selectable=0
date1=1608136844
value1=1.220430
</object>

<object>
type=32
name=autotrade #22408658 sell 0.04 EURUSD at 1.21745
hidden=1
color=1918177
selectable=0
date1=1608543399
value1=1.217450
</object>

<object>
type=31
name=autotrade #22415207 buy 0.04 EURUSD at 1.22047
hidden=1
descr=[sl 1.22045]
color=11296515
selectable=0
date1=1608546851
value1=1.220470
</object>

<object>
type=32
name=autotrade #22489829 sell 0.04 EURUSD at 1.22150
hidden=1
color=1918177
selectable=0
date1=1608627782
value1=1.221500
</object>

<object>
type=31
name=autotrade #22504680 buy 0.04 EURUSD at 1.22450
hidden=1
descr=[sl 1.22450]
color=11296515
selectable=0
date1=1608645903
value1=1.224500
</object>

<object>
type=32
name=autotrade #22666342 sell 0.04 EURUSD at 1.22300
hidden=1
color=1918177
selectable=0
date1=1609174802
value1=1.223000
</object>

<object>
type=31
name=autotrade #22714149 buy 0.04 EURUSD at 1.22697
hidden=1
descr=[sl 1.22700]
color=11296515
selectable=0
date1=1609260625
value1=1.226970
</object>

<object>
type=32
name=autotrade #22718125 sell 0.08 EURUSD at 1.22439
hidden=1
color=1918177
selectable=0
date1=1609262141
value1=1.224390
</object>

<object>
type=31
name=autotrade #22734644 buy 0.08 EURUSD at 1.22740
hidden=1
descr=[sl 1.22740]
color=11296515
selectable=0
date1=1609296844
value1=1.227400
</object>

<object>
type=32
name=autotrade #22929921 sell 0.08 EURUSD at 1.22575
hidden=1
color=1918177
selectable=0
date1=1609840636
value1=1.225750
</object>

<object>
type=31
name=autotrade #22931809 buy 0.08 EURUSD at 1.22775
hidden=1
descr=[sl 1.22775]
color=11296515
selectable=0
date1=1609841966
value1=1.227750
</object>

<object>
type=32
name=autotrade #22932018 sell 0.08 EURUSD at 1.22729
hidden=1
color=1918177
selectable=0
date1=1609842112
value1=1.227290
</object>

<object>
type=31
name=autotrade #22966092 buy 0.08 EURUSD at 1.22933
hidden=1
descr=[sl 1.22930]
color=11296515
selectable=0
date1=1609871828
value1=1.229330
</object>

<object>
type=32
name=autotrade #22986569 sell 0.1 EURUSD at 1.22815
hidden=1
color=1918177
selectable=0
date1=1609904261
value1=1.228150
</object>

<object>
type=31
name=autotrade #22993199 buy 0.1 EURUSD at 1.23030
hidden=1
descr=[sl 1.23030]
color=11296515
selectable=0
date1=1609914204
value1=1.230300
</object>

<object>
type=32
name=autotrade #23039633 sell 0.1 EURUSD at 1.22939
hidden=1
color=1918177
selectable=0
date1=1609950887
value1=1.229390
</object>

<object>
type=31
name=autotrade #23056655 buy 0.1 EURUSD at 1.22928
hidden=1
descr=[sl 1.22930]
color=11296515
selectable=0
date1=1609959553
value1=1.229280
</object>

<object>
type=32
name=autotrade #23091208 sell 0.1 EURUSD at 1.23100
hidden=1
color=1918177
selectable=0
date1=1610012700
value1=1.231000
</object>

<object>
type=31
name=autotrade #23099302 buy 0.1 EURUSD at 1.22801
hidden=1
descr=[tp 1.22800]
color=11296515
selectable=0
date1=1610019564
value1=1.228010
</object>

<object>
type=32
name=autotrade #23269955 sell 0.1 EURUSD at 1.21600
hidden=1
color=1918177
selectable=0
date1=1610366262
value1=1.216000
</object>

<object>
type=31
name=autotrade #23300165 buy 0.1 EURUSD at 1.21590
hidden=1
descr=[sl 1.21590]
color=11296515
selectable=0
date1=1610389699
value1=1.215900
</object>

<object>
type=32
name=autotrade #23395431 sell 0.1 EURUSD at 1.21975
hidden=1
color=1918177
selectable=0
date1=1610532215
value1=1.219750
</object>

<object>
type=31
name=autotrade #23418851 buy 0.1 EURUSD at 1.21570
hidden=1
color=11296515
selectable=0
date1=1610555625
value1=1.215700
</object>

<object>
type=32
name=autotrade #23600588 sell 0.1 EURUSD at 1.20630
hidden=1
color=1918177
selectable=0
date1=1610969469
value1=1.206300
</object>

<object>
type=31
name=autotrade #23626661 buy 0.1 EURUSD at 1.20836
hidden=1
color=11296515
selectable=0
date1=1611022331
value1=1.208360
</object>

<object>
type=32
name=autotrade #23769504 sell 0.1 EURUSD at 1.21208
hidden=1
color=1918177
selectable=0
date1=1611223090
value1=1.212080
</object>

<object>
type=31
name=autotrade #23776016 buy 0.1 EURUSD at 1.21408
hidden=1
descr=[sl 1.21410]
color=11296515
selectable=0
date1=1611228404
value1=1.214080
</object>

<object>
type=32
name=autotrade #23796074 sell 0.1 EURUSD at 1.21435
hidden=1
color=1918177
selectable=0
date1=1611245999
value1=1.214350
</object>

<object>
type=31
name=autotrade #23801195 buy 0.1 EURUSD at 1.21635
hidden=1
descr=[sl 1.21635]
color=11296515
selectable=0
date1=1611249124
value1=1.216350
</object>

<object>
type=31
name=autotrade #23837272 buy 0.1 EURUSD at 1.21850
hidden=1
color=11296515
selectable=0
date1=1611313218
value1=1.218500
</object>

<object>
type=32
name=autotrade #23839889 sell 0.1 EURUSD at 1.21647
hidden=1
descr=[sl 1.21650]
color=1918177
selectable=0
date1=1611315896
value1=1.216470
</object>

<object>
type=32
name=autotrade #23967223 sell 0.1 EURUSD at 1.21210
hidden=1
color=1918177
selectable=0
date1=1611653527
value1=1.212100
</object>

<object>
type=31
name=autotrade #23974949 buy 0.1 EURUSD at 1.21412
hidden=1
descr=[sl 1.21410]
color=11296515
selectable=0
date1=1611658574
value1=1.214120
</object>

<object>
type=31
name=autotrade #24356794 buy 0.1 EURUSD at 1.20928
hidden=1
color=11296515
selectable=0
date1=1612199540
value1=1.209280
</object>

<object>
type=32
name=autotrade #24368651 sell 0.1 EURUSD at 1.20691
hidden=1
descr=[sl 1.20690]
color=1918177
selectable=0
date1=1612205957
value1=1.206910
</object>

<object>
type=32
name=autotrade #24369076 sell 0.1 EURUSD at 1.20654
hidden=1
color=1918177
selectable=0
date1=1612206107
value1=1.206540
</object>

<object>
type=31
name=autotrade #24450707 buy 0.1 EURUSD at 1.20343
hidden=1
color=11296515
selectable=0
date1=1612285620
value1=1.203430
</object>

<object>
type=32
name=autotrade #24490466 sell 0.1 EURUSD at 1.20326
hidden=1
color=1918177
selectable=0
date1=1612342869
value1=1.203260
</object>

<object>
type=31
name=autotrade #24521892 buy 0.1 EURUSD at 1.20315
hidden=1
descr=[sl 1.20315]
color=11296515
selectable=0
date1=1612370086
value1=1.203150
</object>

<object>
type=31
name=autotrade #24679310 buy 0.1 EURUSD at 1.20011
hidden=1
color=11296515
selectable=0
date1=1612539299
value1=1.200110
</object>

<object>
type=32
name=autotrade #24684279 sell 0.1 EURUSD at 1.20020
hidden=1
color=1918177
selectable=0
date1=1612540818
value1=1.200200
</object>

<object>
type=32
name=autotrade #24743165 sell 0.1 EURUSD at 1.20268
hidden=1
color=1918177
selectable=0
date1=1612781329
value1=1.202680
</object>

<object>
type=31
name=autotrade #24768029 buy 0.1 EURUSD at 1.20589
hidden=1
descr=[sl 1.20567]
color=11296515
selectable=0
date1=1612801930
value1=1.205890
</object>

<object>
type=32
name=autotrade #25038218 sell 0.1 EURUSD at 1.20924
hidden=1
color=1918177
selectable=0
date1=1613143841
value1=1.209240
</object>

<object>
type=31
name=autotrade #25052984 buy 0.1 EURUSD at 1.21170
hidden=1
descr=[sl 1.21170]
color=11296515
selectable=0
date1=1613152412
value1=1.211700
</object>

<object>
type=32
name=autotrade #25105673 sell 0.1 EURUSD at 1.21283
hidden=1
color=1918177
selectable=0
date1=1613397926
value1=1.212830
</object>

<object>
type=31
name=autotrade #25155608 buy 0.1 EURUSD at 1.21590
hidden=1
descr=[sl 1.21592]
color=11296515
selectable=0
date1=1613478404
value1=1.215900
</object>

<object>
type=32
name=autotrade #25168737 sell 0.1 EURUSD at 1.21468
hidden=1
color=1918177
selectable=0
date1=1613487830
value1=1.214680
</object>

<object>
type=32
name=autotrade #25169762 sell 0.1 EURUSD at 1.21441
hidden=1
color=1918177
selectable=0
date1=1613488279
value1=1.214410
</object>

<object>
type=32
name=autotrade #25176027 sell 0.1 EURUSD at 1.21110
hidden=1
color=1918177
selectable=0
date1=1613490376
value1=1.211100
</object>

<object>
type=31
name=autotrade #25176853 buy 0.1 EURUSD at 1.21154
hidden=1
color=11296515
selectable=0
date1=1613490750
value1=1.211540
</object>

<object>
type=31
name=autotrade #25176861 buy 0.1 EURUSD at 1.21153
hidden=1
color=11296515
selectable=0
date1=1613490755
value1=1.211530
</object>

<object>
type=31
name=autotrade #25176867 buy 0.1 EURUSD at 1.21159
hidden=1
color=11296515
selectable=0
date1=1613490763
value1=1.211590
</object>

<object>
type=32
name=autotrade #25231754 sell 0.1 EURUSD at 1.20773
hidden=1
color=1918177
selectable=0
date1=1613552601
value1=1.207730
</object>

<object>
type=31
name=autotrade #25269297 buy 0.1 EURUSD at 1.20421
hidden=1
descr=[sl 1.20420]
color=11296515
selectable=0
date1=1613579064
value1=1.204210
</object>

<object>
type=32
name=autotrade #25492157 sell 0.1 EURUSD at 1.21027
hidden=1
color=1918177
selectable=0
date1=1613989646
value1=1.210270
</object>

<object>
type=31
name=autotrade #25501802 buy 0.1 EURUSD at 1.21218
hidden=1
descr=[sl 1.21220]
color=11296515
selectable=0
date1=1613997162
value1=1.212180
</object>

<object>
type=32
name=autotrade #25697029 sell 0.1 EURUSD at 1.21287
hidden=1
color=1918177
selectable=0
date1=1614181765
value1=1.212870
</object>

<object>
type=31
name=autotrade #25722785 buy 0.1 EURUSD at 1.21400
hidden=1
descr=[sl 1.21400]
color=11296515
selectable=0
date1=1614193137
value1=1.214000
</object>

<object>
type=32
name=autotrade #25818547 sell 0.1 EURUSD at 1.22027
hidden=1
color=1918177
selectable=0
date1=1614283343
value1=1.220270
</object>

<object>
type=31
name=autotrade #25823878 buy 0.1 EURUSD at 1.21749
hidden=1
descr=[tp 1.21760]
color=11296515
selectable=0
date1=1614285139
value1=1.217490
</object>

<object>
type=32
name=autotrade #25864815 sell 0.1 EURUSD at 1.21420
hidden=1
color=1918177
selectable=0
date1=1614330696
value1=1.214200
</object>

<object>
type=31
name=autotrade #25884800 buy 0.1 EURUSD at 1.21019
hidden=1
descr=[tp 1.21020]
color=11296515
selectable=0
date1=1614345707
value1=1.210190
</object>

<object>
type=32
name=autotrade #26056812 sell 0.1 EURUSD at 1.20095
hidden=1
color=1918177
selectable=0
date1=1614676619
value1=1.200950
</object>

<object>
type=31
name=autotrade #26085771 buy 0.1 EURUSD at 1.20302
hidden=1
descr=[sl 1.20300]
color=11296515
selectable=0
date1=1614693059
value1=1.203020
</object>

<object>
type=32
name=autotrade #26094847 sell 0.1 EURUSD at 1.20225
hidden=1
color=1918177
selectable=0
date1=1614699872
value1=1.202250
</object>

<object>
type=31
name=autotrade #26098385 buy 0.1 EURUSD at 1.20424
hidden=1
descr=[sl 1.20425]
color=11296515
selectable=0
date1=1614701752
value1=1.204240
</object>

<object>
type=32
name=autotrade #26295784 sell 0.1 EURUSD at 1.20246
hidden=1
color=1918177
selectable=0
date1=1614878356
value1=1.202460
</object>

<object>
type=32
name=autotrade #26308055 sell 0.1 EURUSD at 1.20380
hidden=1
color=1918177
selectable=0
date1=1614885085
value1=1.203800
</object>

<object>
type=31
name=autotrade #26315664 buy 0.1 EURUSD at 1.20073
hidden=1
color=11296515
selectable=0
date1=1614886947
value1=1.200730
</object>

<object>
type=31
name=autotrade #26315686 buy 0.1 EURUSD at 1.20072
hidden=1
color=11296515
selectable=0
date1=1614886957
value1=1.200720
</object>

<object>
type=32
name=autotrade #27148469 sell 0.1 EURUSD at 1.19534
hidden=1
color=1918177
selectable=0
date1=1616063821
value1=1.195340
</object>

<object>
type=31
name=autotrade #27188291 buy 0.1 EURUSD at 1.19220
hidden=1
descr=[sl 1.19220]
color=11296515
selectable=0
date1=1616087070
value1=1.192200
</object>

<object>
type=32
name=autotrade #27269113 sell 0.1 EURUSD at 1.18812
hidden=1
color=1918177
selectable=0
date1=1616171395
value1=1.188120
</object>

<object>
type=31
name=autotrade #27275693 buy 0.1 EURUSD at 1.18803
hidden=1
color=11296515
selectable=0
date1=1616174083
value1=1.188030
</object>

<object>
type=32
name=autotrade #27391201 sell 0.1 EURUSD at 1.19049
hidden=1
color=1918177
selectable=0
date1=1616496776
value1=1.190490
</object>

<object>
type=31
name=autotrade #27431973 buy 0.1 EURUSD at 1.18737
hidden=1
color=11296515
selectable=0
date1=1616522391
value1=1.187370
</object>

<object>
type=32
name=autotrade #27470811 sell 0.1 EURUSD at 1.18301
hidden=1
color=1918177
selectable=0
date1=1616581347
value1=1.183010
</object>

<object>
type=31
name=autotrade #27505328 buy 0.1 EURUSD at 1.18295
hidden=1
descr=[sl 1.18295]
color=11296515
selectable=0
date1=1616608511
value1=1.182950
</object>

<object>
type=32
name=autotrade #28483695 sell 0.2 EURUSD at 1.19749
hidden=1
color=1918177
selectable=0
date1=1618595686
value1=1.197490
</object>

<object>
type=31
name=autotrade #28491511 buy 0.2 EURUSD at 1.19824
hidden=1
color=11296515
selectable=0
date1=1618613387
value1=1.198240
</object>

<object>
type=32
name=autotrade #28758431 sell 0.2 EURUSD at 1.20147
hidden=1
color=1918177
selectable=0
date1=1619111678
value1=1.201470
</object>

<object>
type=31
name=autotrade #28761306 buy 0.2 EURUSD at 1.20145
hidden=1
descr=[sl 1.20145]
color=11296515
selectable=0
date1=1619113360
value1=1.201450
</object>

<object>
type=32
name=autotrade #28827847 sell 0.2 EURUSD at 1.20472
hidden=1
color=1918177
selectable=0
date1=1619200375
value1=1.204720
</object>

<object>
type=31
name=autotrade #28830340 buy 0.2 EURUSD at 1.20628
hidden=1
color=11296515
selectable=0
date1=1619202715
value1=1.206280
</object>

<object>
type=32
name=autotrade #28878968 sell 0.2 EURUSD at 1.20780
hidden=1
color=1918177
selectable=0
date1=1619451213
value1=1.207800
</object>

<object>
type=31
name=autotrade #28890737 buy 0.2 EURUSD at 1.20775
hidden=1
descr=[sl 1.20775]
color=11296515
selectable=0
date1=1619458475
value1=1.207750
</object>

<object>
type=32
name=autotrade #28920478 sell 0.2 EURUSD at 1.20599
hidden=1
color=1918177
selectable=0
date1=1619521906
value1=1.205990
</object>

<object>
type=31
name=autotrade #28927556 buy 0.2 EURUSD at 1.20803
hidden=1
descr=[sl 1.20800]
color=11296515
selectable=0
date1=1619531549
value1=1.208030
</object>

<object>
type=32
name=autotrade #29217276 sell 0.2 EURUSD at 1.20300
hidden=1
color=1918177
selectable=0
date1=1620122573
value1=1.203000
</object>

<object>
type=31
name=autotrade #29225714 buy 0.2 EURUSD at 1.20043
hidden=1
descr=[sl 1.20040]
color=11296515
selectable=0
date1=1620130072
value1=1.200430
</object>

<object>
type=32
name=autotrade #33349545 sell 0.06 EURUSD at 1.17846
hidden=1
color=1918177
selectable=0
date1=1626952050
value1=1.178460
</object>

<object>
type=32
name=autotrade #33349949 sell 0.06 EURUSD at 1.17831
hidden=1
color=1918177
selectable=0
date1=1626952189
value1=1.178310
</object>

<object>
type=31
name=autotrade #33361946 buy 0.06 EURUSD at 1.18124
hidden=1
descr=[sl 1.18100]
color=11296515
selectable=0
date1=1626965256
value1=1.181240
</object>

<object>
type=31
name=autotrade #33361947 buy 0.06 EURUSD at 1.18124
hidden=1
descr=[sl 1.18100]
color=11296515
selectable=0
date1=1626965256
value1=1.181240
</object>

<object>
type=32
name=autotrade #34077717 sell 0.08 EURUSD at 1.18399
hidden=1
color=1918177
selectable=0
date1=1628097937
value1=1.183990
</object>

<object>
type=31
name=autotrade #34225474 buy 0.08 EURUSD at 1.17871
hidden=1
color=11296515
selectable=0
date1=1628265259
value1=1.178710
</object>

<object>
type=32
name=autotrade #34776800 sell 0.06 EURUSD at 1.17581
hidden=1
color=1918177
selectable=0
date1=1629214365
value1=1.175810
</object>

<object>
type=31
name=autotrade #34797753 buy 0.06 EURUSD at 1.17281
hidden=1
color=11296515
selectable=0
date1=1629221012
value1=1.172810
</object>

<object>
type=31
name=autotrade #35207083 buy 0.06 EURUSD at 1.17521
hidden=1
color=11296515
selectable=0
date1=1629820363
value1=1.175210
</object>

<object>
type=32
name=autotrade #35233163 sell 0.06 EURUSD at 1.17527
hidden=1
color=1918177
selectable=0
date1=1629844318
value1=1.175270
</object>

<object>
type=32
name=autotrade #35360411 sell 0.06 EURUSD at 1.17488
hidden=1
color=1918177
selectable=0
date1=1629994030
value1=1.174880
</object>

<object>
type=31
name=autotrade #35448378 buy 0.06 EURUSD at 1.17852
hidden=1
color=11296515
selectable=0
date1=1630083672
value1=1.178520
</object>

<object>
type=32
name=autotrade #35523186 sell 0.06 EURUSD at 1.17889
hidden=1
color=1918177
selectable=0
date1=1630339050
value1=1.178890
</object>

<object>
type=31
name=autotrade #35565713 buy 0.06 EURUSD at 1.18118
hidden=1
descr=[sl 1.18116]
color=11296515
selectable=0
date1=1630390654
value1=1.181180
</object>

<object>
type=32
name=autotrade #35623565 sell 0.06 EURUSD at 1.18098
hidden=1
color=1918177
selectable=0
date1=1630432542
value1=1.180980
</object>

<object>
type=31
name=autotrade #35633901 buy 0.06 EURUSD at 1.18064
hidden=1
color=11296515
selectable=0
date1=1630438697
value1=1.180640
</object>

<object>
type=32
name=autotrade #36006767 sell 0.06 EURUSD at 1.18475
hidden=1
color=1918177
selectable=0
date1=1631030573
value1=1.184750
</object>

<object>
type=31
name=autotrade #36117649 buy 0.06 EURUSD at 1.18066
hidden=1
descr=[sl 1.18065]
color=11296515
selectable=0
date1=1631123308
value1=1.180660
</object>

<object>
type=32
name=autotrade #36772570 sell 0.06 EURUSD at 1.17664
hidden=1
color=1918177
selectable=0
date1=1631895270
value1=1.176640
</object>

<object>
type=31
name=autotrade #36786518 buy 0.06 EURUSD at 1.17559
hidden=1
color=11296515
selectable=0
date1=1631897733
value1=1.175590
</object>

<object>
type=32
name=autotrade #38006052 sell 0.06 EURUSD at 1.15835
hidden=1
color=1918177
selectable=0
date1=1633453497
value1=1.158350
</object>

<object>
type=31
name=autotrade #38015166 buy 0.06 EURUSD at 1.16034
hidden=1
descr=[sl 1.16035]
color=11296515
selectable=0
date1=1633457384
value1=1.160340
</object>

<object>
type=31
name=autotrade #38809383 buy 0.1 EURUSD at 1.16429
hidden=1
color=11296515
selectable=0
date1=1634623134
value1=1.164290
</object>

<object>
type=32
name=autotrade #38854584 sell 0.1 EURUSD at 1.16426
hidden=1
descr=[sl 1.16430]
color=1918177
selectable=0
date1=1634660645
value1=1.164260
</object>

<object>
type=31
name=autotrade #38859455 buy 0.1 EURUSD at 1.16509
hidden=1
color=11296515
selectable=0
date1=1634662087
value1=1.165090
</object>

<object>
type=32
name=autotrade #38868739 sell 0.1 EURUSD at 1.16362
hidden=1
color=1918177
selectable=0
date1=1634665131
value1=1.163620
</object>

<object>
type=32
name=autotrade #38868857 sell 0.1 EURUSD at 1.16357
hidden=1
color=1918177
selectable=0
date1=1634665185
value1=1.163570
</object>

<object>
type=31
name=autotrade #38874248 buy 0.1 EURUSD at 1.16362
hidden=1
color=11296515
selectable=0
date1=1634668698
value1=1.163620
</object>

<object>
type=31
name=autotrade #38880939 buy 0.1 EURUSD at 1.16427
hidden=1
color=11296515
selectable=0
date1=1634675727
value1=1.164270
</object>

<object>
type=32
name=autotrade #38915767 sell 0.1 EURUSD at 1.16179
hidden=1
descr=[sl 1.16179]
color=1918177
selectable=0
date1=1634726250
value1=1.161790
</object>

<object>
type=32
name=autotrade #39320210 sell 0.1 EURUSD at 1.15898
hidden=1
color=1918177
selectable=0
date1=1635273122
value1=1.158980
</object>

<object>
type=32
name=autotrade #39391278 sell 0.1 EURUSD at 1.16174
hidden=1
color=1918177
selectable=0
date1=1635350065
value1=1.161740
</object>

<object>
type=31
name=autotrade #39424633 buy 0.1 EURUSD at 1.16151
hidden=1
color=11296515
selectable=0
date1=1635365059
value1=1.161510
</object>

<object>
type=31
name=autotrade #39424770 buy 0.1 EURUSD at 1.16143
hidden=1
color=11296515
selectable=0
date1=1635365137
value1=1.161430
</object>

<object>
type=31
name=autotrade #39486353 buy 0.1 EURUSD at 1.16270
hidden=1
color=11296515
selectable=0
date1=1635436072
value1=1.162700
</object>

<object>
type=32
name=autotrade #39533626 sell 0.1 EURUSD at 1.16825
hidden=1
color=1918177
selectable=0
date1=1635459135
value1=1.168250
</object>

<object>
type=32
name=autotrade #39858196 sell 0.1 EURUSD at 1.15709
hidden=1
color=1918177
selectable=0
date1=1635956599
value1=1.157090
</object>

<object>
type=31
name=autotrade #39886006 buy 0.1 EURUSD at 1.15991
hidden=1
descr=[sl 1.15989]
color=11296515
selectable=0
date1=1635973210
value1=1.159910
</object>

<object>
type=32
name=autotrade #40748763 sell 0.1 EURUSD at 1.13472
hidden=1
color=1918177
selectable=0
date1=1637078768
value1=1.134720
</object>

<object>
type=31
name=autotrade #40793167 buy 0.1 EURUSD at 1.13201
hidden=1
color=11296515
selectable=0
date1=1637116627
value1=1.132010
</object>

<object>
type=31
name=autotrade #41697101 buy 0.1 EURUSD at 1.13645
hidden=1
color=11296515
selectable=0
date1=1638285763
value1=1.136450
</object>

<object>
type=32
name=autotrade #41702564 sell 0.1 EURUSD at 1.13647
hidden=1
color=1918177
selectable=0
date1=1638288544
value1=1.136470
</object>

<object>
type=31
name=autotrade #41707523 buy 0.05 EURUSD at 1.13760
hidden=1
color=11296515
selectable=0
date1=1638290724
value1=1.137600
</object>

<object>
type=31
name=autotrade #41707537 buy 0.1 EURUSD at 1.13761
hidden=1
color=11296515
selectable=0
date1=1638290724
value1=1.137610
</object>

<object>
type=32
name=autotrade #41717822 sell 0.05 EURUSD at 1.13605
hidden=1
descr=[sl 1.13605]
color=1918177
selectable=0
date1=1638293584
value1=1.136050
</object>

<object>
type=32
name=autotrade #41717823 sell 0.1 EURUSD at 1.13605
hidden=1
descr=[sl 1.13605]
color=1918177
selectable=0
date1=1638293584
value1=1.136050
</object>

<object>
type=32
name=autotrade #41985893 sell 0.1 EURUSD at 1.12823
hidden=1
color=1918177
selectable=0
date1=1638521880
value1=1.128230
</object>

<object>
type=31
name=autotrade #42003408 buy 0.1 EURUSD at 1.13120
hidden=1
color=11296515
selectable=0
date1=1638540278
value1=1.131200
</object>

<object>
type=31
name=autotrade #42008956 buy 0.1 EURUSD at 1.13161
hidden=1
color=11296515
selectable=0
date1=1638545401
value1=1.131610
</object>

<object>
type=32
name=autotrade #42031562 sell 0.1 EURUSD at 1.12801
hidden=1
descr=[sl 1.12809]
color=1918177
selectable=0
date1=1638550931
value1=1.128010
</object>

<object>
type=31
name=autotrade #42490095 buy 0.1 EURUSD at 1.12836
hidden=1
color=11296515
selectable=0
date1=1639155398
value1=1.128360
</object>

<object>
type=32
name=autotrade #42493648 sell 0.1 EURUSD at 1.13011
hidden=1
descr=[sl 1.13015]
color=1918177
selectable=0
date1=1639157003
value1=1.130110
</object>

<object>
type=32
name=autotrade #42845034 sell 0.1 EURUSD at 1.13308
hidden=1
color=1918177
selectable=0
date1=1639673079
value1=1.133080
</object>

<object>
type=31
name=autotrade #42857261 buy 0.1 EURUSD at 1.13090
hidden=1
descr=[sl 1.13087]
color=11296515
selectable=0
date1=1639677328
value1=1.130900
</object>

<object>
type=2
name=autotrade #16250606 -> #16253742 EURUSD
hidden=1
descr=1.18651 -> 1.18645
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1596660767
date2=1596666264
value1=1.186510
value2=1.186450
</object>

<object>
type=2
name=autotrade #16680944 -> #16695763 EURUSD
hidden=1
descr=1.18200 -> 1.18180
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1597343639
date2=1597370345
value1=1.182000
value2=1.181800
</object>

<object>
type=2
name=autotrade #16963675 -> #16972380 EURUSD
hidden=1
descr=1.18252 -> 1.18462
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1597922509
date2=1597934168
value1=1.182520
value2=1.184620
</object>

<object>
type=2
name=autotrade #17094845 -> #17101923 EURUSD
hidden=1
descr=1.18157 -> 1.18014
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1598290619
date2=1598299238
value1=1.181570
value2=1.180140
</object>

<object>
type=2
name=autotrade #17342282 -> #17343841 EURUSD
hidden=1
descr=1.18683 -> 1.18884
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1598634539
date2=1598635304
value1=1.186830
value2=1.188840
</object>

<object>
type=2
name=autotrade #17390388 -> #17391174 EURUSD
hidden=1
descr=1.19435 -> 1.19361
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1598890398
date2=1598891259
value1=1.194350
value2=1.193610
</object>

<object>
type=2
name=autotrade #17392804 -> #17398623 EURUSD
hidden=1
descr=1.19254 -> 1.19555
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1598892492
date2=1598896142
value1=1.192540
value2=1.195550
</object>

<object>
type=2
name=autotrade #17454342 -> #17467841 EURUSD
hidden=1
descr=1.19543 -> 1.19411
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1598979638
date2=1598989822
value1=1.195430
value2=1.194110
</object>

<object>
type=2
name=autotrade #17495273 -> #17528337 EURUSD
hidden=1
descr=1.18865 -> 1.18396
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599041222
date2=1599069911
value1=1.188650
value2=1.183960
</object>

<object>
type=2
name=autotrade #17637708 -> #17646877 EURUSD
hidden=1
descr=1.18300 -> 1.17898
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599234633
date2=1599239107
value1=1.183000
value2=1.178980
</object>

<object>
type=2
name=autotrade #17744440 -> #17748098 EURUSD
hidden=1
descr=1.17730 -> 1.17882
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599583504
date2=1599585078
value1=1.177300
value2=1.178820
</object>

<object>
type=2
name=autotrade #17865554 -> #17870958 EURUSD
hidden=1
descr=1.18817 -> 1.18835
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599760085
date2=1599763787
value1=1.188170
value2=1.188350
</object>

<object>
type=2
name=autotrade #17897707 -> #17908828 EURUSD
hidden=1
descr=1.18449 -> 1.18518
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1599819638
date2=1599836647
value1=1.184490
value2=1.185180
</object>

<object>
type=2
name=autotrade #17910010 -> #17924364 EURUSD
hidden=1
descr=1.18439 -> 1.18310
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599838370
date2=1599855241
value1=1.184390
value2=1.183100
</object>

<object>
type=2
name=autotrade #18013210 -> #18020129 EURUSD
hidden=1
descr=1.18542 -> 1.18494
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600189299
date2=1600194943
value1=1.185420
value2=1.184940
</object>

<object>
type=2
name=autotrade #18054781 -> #18055950 EURUSD
hidden=1
descr=1.18573 -> 1.18564
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600270900
date2=1600271588
value1=1.185730
value2=1.185640
</object>

<object>
type=2
name=autotrade #18056043 -> #18056064 EURUSD
hidden=1
descr=1.18543 -> 1.18543
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600271672
date2=1600271708
value1=1.185430
value2=1.185430
</object>

<object>
type=2
name=autotrade #18069708 -> #18070374 EURUSD
hidden=1
descr=1.18461 -> 1.18405
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1600280106
date2=1600280762
value1=1.184610
value2=1.184050
</object>

<object>
type=2
name=autotrade #18131165 -> #18140858 EURUSD
hidden=1
descr=1.18152 -> 1.18204
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1600361760
date2=1600370278
value1=1.181520
value2=1.182040
</object>

<object>
type=2
name=autotrade #18168587 -> #18176498 EURUSD
hidden=1
descr=1.18389 -> 1.18478
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600436443
date2=1600445092
value1=1.183890
value2=1.184780
</object>

<object>
type=2
name=autotrade #18181305 -> #18184985 EURUSD
hidden=1
descr=1.18271 -> 1.18521
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600448598
date2=1600450641
value1=1.182710
value2=1.185210
</object>

<object>
type=2
name=autotrade #18217584 -> #18223221 EURUSD
hidden=1
descr=1.18245 -> 1.18001
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600686187
date2=1600689513
value1=1.182450
value2=1.180010
</object>

<object>
type=2
name=autotrade #18327484 -> #18332894 EURUSD
hidden=1
descr=1.17169 -> 1.17167
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600796560
date2=1600798532
value1=1.171690
value2=1.171670
</object>

<object>
type=2
name=autotrade #18333368 -> #18336209 EURUSD
hidden=1
descr=1.17099 -> 1.17076
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600798806
date2=1600801352
value1=1.170990
value2=1.170760
</object>

<object>
type=2
name=autotrade #18393868 -> #18397520 EURUSD
hidden=1
descr=1.16668 -> 1.16665
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600881750
date2=1600883468
value1=1.166680
value2=1.166650
</object>

<object>
type=2
name=autotrade #18442155 -> #18466254 EURUSD
hidden=1
descr=1.16400 -> 1.16607
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600950716
date2=1600973595
value1=1.164000
value2=1.166070
</object>

<object>
type=2
name=autotrade #18511573 -> #18518512 EURUSD
hidden=1
descr=1.16245 -> 1.16240
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1601053722
date2=1601060459
value1=1.162450
value2=1.162400
</object>

<object>
type=2
name=autotrade #18902537 -> #18910080 EURUSD
hidden=1
descr=1.18042 -> 1.17817
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1601997753
date2=1602003249
value1=1.180420
value2=1.178170
</object>

<object>
type=2
name=autotrade #19228764 -> #19237508 EURUSD
hidden=1
descr=1.17278 -> 1.17477
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1602677592
date2=1602687495
value1=1.172780
value2=1.174770
</object>

<object>
type=2
name=autotrade #19673538 -> #19685464 EURUSD
hidden=1
descr=1.18350 -> 1.18518
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603472498
date2=1603484285
value1=1.183500
value2=1.185180
</object>

<object>
type=2
name=autotrade #19708681 -> #19742578 EURUSD
hidden=1
descr=1.18256 -> 1.18250
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603710068
date2=1603742964
value1=1.182560
value2=1.182500
</object>

<object>
type=2
name=autotrade #19764834 -> #19785077 EURUSD
hidden=1
descr=1.18022 -> 1.18390
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603797277
date2=1603818076
value1=1.180220
value2=1.183900
</object>

<object>
type=2
name=autotrade #19821796 -> #19856397 EURUSD
hidden=1
descr=1.17671 -> 1.17322
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603878799
date2=1603902530
value1=1.176710
value2=1.173220
</object>

<object>
type=2
name=autotrade #19826461 -> #19847712 EURUSD
hidden=1
descr=1.17600 -> 1.17300
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603883081
date2=1603897934
value1=1.176000
value2=1.173000
</object>

<object>
type=2
name=autotrade #19926878 -> #19930735 EURUSD
hidden=1
descr=1.16848 -> 1.16845
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603990163
date2=1603991956
value1=1.168480
value2=1.168450
</object>

<object>
type=2
name=autotrade #19971032 -> #19973050 EURUSD
hidden=1
descr=1.16600 -> 1.16800
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1604058915
date2=1604061156
value1=1.166000
value2=1.168000
</object>

<object>
type=2
name=autotrade #20100173 -> #20112406 EURUSD
hidden=1
descr=1.17200 -> 1.17209
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1604421013
date2=1604429429
value1=1.172000
value2=1.172090
</object>

<object>
type=2
name=autotrade #20264905 -> #20310544 EURUSD
hidden=1
descr=1.18201 -> 1.18501
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1604593231
date2=1604657402
value1=1.182010
value2=1.185010
</object>

<object>
type=2
name=autotrade #20494341 -> #20600802 EURUSD
hidden=1
descr=1.18093 -> 1.17652
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1605008839
date2=1605119229
value1=1.180930
value2=1.176520
</object>

<object>
type=2
name=autotrade #20903885 -> #20987147 EURUSD
hidden=1
descr=1.18649 -> 1.18310
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1605708198
date2=1605804822
value1=1.186490
value2=1.183100
</object>

<object>
type=2
name=autotrade #21018118 -> #21035483 EURUSD
hidden=1
descr=1.18700 -> 1.18692
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1605864843
date2=1605887829
value1=1.187000
value2=1.186920
</object>

<object>
type=2
name=autotrade #21071871 -> #21081285 EURUSD
hidden=1
descr=1.18649 -> 1.18952
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606127196
date2=1606136301
value1=1.186490
value2=1.189520
</object>

<object>
type=2
name=autotrade #21091479 -> #21111475 EURUSD
hidden=1
descr=1.18898 -> 1.18268
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606146128
date2=1606154100
value1=1.188980
value2=1.182680
</object>

<object>
type=2
name=autotrade #21177544 -> #21189471 EURUSD
hidden=1
descr=1.18585 -> 1.18786
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606233517
date2=1606240331
value1=1.185850
value2=1.187860
</object>

<object>
type=2
name=autotrade #21235452 -> #21254363 EURUSD
hidden=1
descr=1.18876 -> 1.19230
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606309586
date2=1606326181
value1=1.188760
value2=1.192300
</object>

<object>
type=2
name=autotrade #21244623 -> #21254365 EURUSD
hidden=1
descr=1.19029 -> 1.19230
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606319104
date2=1606326181
value1=1.190290
value2=1.192300
</object>

<object>
type=2
name=autotrade #21329369 -> #21352723 EURUSD
hidden=1
descr=1.19170 -> 1.19470
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1606476812
date2=1606498098
value1=1.191700
value2=1.194700
</object>

<object>
type=2
name=autotrade #21568528 -> #21582041 EURUSD
hidden=1
descr=1.20906 -> 1.20900
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1606928548
date2=1606943487
value1=1.209060
value2=1.209000
</object>

<object>
type=2
name=autotrade #21690245 -> #21707879 EURUSD
hidden=1
descr=1.21627 -> 1.21396
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1607095987
date2=1607105037
value1=1.216270
value2=1.213960
</object>

<object>
type=2
name=autotrade #21739118 -> #21747135 EURUSD
hidden=1
descr=1.21069 -> 1.20875
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1607335963
date2=1607339078
value1=1.210690
value2=1.208750
</object>

<object>
type=2
name=autotrade #21785355 -> #21890308 EURUSD
hidden=1
descr=1.21250 -> 1.21056
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1607372051
date2=1607524011
value1=1.212500
value2=1.210560
</object>

<object>
type=2
name=autotrade #21872034 -> #21890313 EURUSD
hidden=1
descr=1.21360 -> 1.21053
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1607504784
date2=1607524014
value1=1.213600
value2=1.210530
</object>

<object>
type=2
name=autotrade #21952452 -> #21953916 EURUSD
hidden=1
descr=1.20830 -> 1.21040
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1607598605
date2=1607599939
value1=1.208300
value2=1.210400
</object>

<object>
type=2
name=autotrade #22141078 -> #22208735 EURUSD
hidden=1
descr=1.21421 -> 1.21820
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1608024397
date2=1608114602
value1=1.214210
value2=1.218200
</object>

<object>
type=2
name=autotrade #22229409 -> #22234549 EURUSD
hidden=1
descr=1.21839 -> 1.22043
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1608132647
date2=1608136844
value1=1.218390
value2=1.220430
</object>

<object>
type=2
name=autotrade #22408658 -> #22415207 EURUSD
hidden=1
descr=1.21745 -> 1.22047
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1608543399
date2=1608546851
value1=1.217450
value2=1.220470
</object>

<object>
type=2
name=autotrade #22489829 -> #22504680 EURUSD
hidden=1
descr=1.22150 -> 1.22450
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1608627782
date2=1608645903
value1=1.221500
value2=1.224500
</object>

<object>
type=2
name=autotrade #22666342 -> #22714149 EURUSD
hidden=1
descr=1.22300 -> 1.22697
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609174802
date2=1609260625
value1=1.223000
value2=1.226970
</object>

<object>
type=2
name=autotrade #22718125 -> #22734644 EURUSD
hidden=1
descr=1.22439 -> 1.22740
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609262141
date2=1609296844
value1=1.224390
value2=1.227400
</object>

<object>
type=2
name=autotrade #22929921 -> #22931809 EURUSD
hidden=1
descr=1.22575 -> 1.22775
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609840636
date2=1609841966
value1=1.225750
value2=1.227750
</object>

<object>
type=2
name=autotrade #22932018 -> #22966092 EURUSD
hidden=1
descr=1.22729 -> 1.22933
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609842112
date2=1609871828
value1=1.227290
value2=1.229330
</object>

<object>
type=2
name=autotrade #22986569 -> #22993199 EURUSD
hidden=1
descr=1.22815 -> 1.23030
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609904261
date2=1609914204
value1=1.228150
value2=1.230300
</object>

<object>
type=2
name=autotrade #23039633 -> #23056655 EURUSD
hidden=1
descr=1.22939 -> 1.22928
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1609950887
date2=1609959553
value1=1.229390
value2=1.229280
</object>

<object>
type=2
name=autotrade #23091208 -> #23099302 EURUSD
hidden=1
descr=1.23100 -> 1.22801
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610012700
date2=1610019564
value1=1.231000
value2=1.228010
</object>

<object>
type=2
name=autotrade #23269955 -> #23300165 EURUSD
hidden=1
descr=1.21600 -> 1.21590
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610366262
date2=1610389699
value1=1.216000
value2=1.215900
</object>

<object>
type=2
name=autotrade #23395431 -> #23418851 EURUSD
hidden=1
descr=1.21975 -> 1.21570
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610532215
date2=1610555625
value1=1.219750
value2=1.215700
</object>

<object>
type=2
name=autotrade #23600588 -> #23626661 EURUSD
hidden=1
descr=1.20630 -> 1.20836
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610969469
date2=1611022331
value1=1.206300
value2=1.208360
</object>

<object>
type=2
name=autotrade #23769504 -> #23776016 EURUSD
hidden=1
descr=1.21208 -> 1.21408
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611223090
date2=1611228404
value1=1.212080
value2=1.214080
</object>

<object>
type=2
name=autotrade #23796074 -> #23801195 EURUSD
hidden=1
descr=1.21435 -> 1.21635
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611245999
date2=1611249124
value1=1.214350
value2=1.216350
</object>

<object>
type=2
name=autotrade #23837272 -> #23839889 EURUSD
hidden=1
descr=1.21850 -> 1.21647
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1611313218
date2=1611315896
value1=1.218500
value2=1.216470
</object>

<object>
type=2
name=autotrade #23967223 -> #23974949 EURUSD
hidden=1
descr=1.21210 -> 1.21412
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611653527
date2=1611658574
value1=1.212100
value2=1.214120
</object>

<object>
type=2
name=autotrade #24356794 -> #24368651 EURUSD
hidden=1
descr=1.20928 -> 1.20691
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1612199540
date2=1612205957
value1=1.209280
value2=1.206910
</object>

<object>
type=2
name=autotrade #24369076 -> #24450707 EURUSD
hidden=1
descr=1.20654 -> 1.20343
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612206107
date2=1612285620
value1=1.206540
value2=1.203430
</object>

<object>
type=2
name=autotrade #24490466 -> #24521892 EURUSD
hidden=1
descr=1.20326 -> 1.20315
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612342869
date2=1612370086
value1=1.203260
value2=1.203150
</object>

<object>
type=2
name=autotrade #24679310 -> #24684279 EURUSD
hidden=1
descr=1.20011 -> 1.20020
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1612539299
date2=1612540818
value1=1.200110
value2=1.200200
</object>

<object>
type=2
name=autotrade #24743165 -> #24768029 EURUSD
hidden=1
descr=1.20268 -> 1.20589
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612781329
date2=1612801930
value1=1.202680
value2=1.205890
</object>

<object>
type=2
name=autotrade #25038218 -> #25052984 EURUSD
hidden=1
descr=1.20924 -> 1.21170
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613143841
date2=1613152412
value1=1.209240
value2=1.211700
</object>

<object>
type=2
name=autotrade #25176027 -> #25176867 EURUSD
hidden=1
descr=1.21110 -> 1.21159
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613490376
date2=1613490763
value1=1.211100
value2=1.211590
</object>

<object>
type=2
name=autotrade #25105673 -> #25155608 EURUSD
hidden=1
descr=1.21283 -> 1.21590
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613397926
date2=1613478404
value1=1.212830
value2=1.215900
</object>

<object>
type=2
name=autotrade #25168737 -> #25176853 EURUSD
hidden=1
descr=1.21468 -> 1.21154
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613487830
date2=1613490750
value1=1.214680
value2=1.211540
</object>

<object>
type=2
name=autotrade #25169762 -> #25176861 EURUSD
hidden=1
descr=1.21441 -> 1.21153
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613488279
date2=1613490755
value1=1.214410
value2=1.211530
</object>

<object>
type=2
name=autotrade #25231754 -> #25269297 EURUSD
hidden=1
descr=1.20773 -> 1.20421
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613552601
date2=1613579064
value1=1.207730
value2=1.204210
</object>

<object>
type=2
name=autotrade #25492157 -> #25501802 EURUSD
hidden=1
descr=1.21027 -> 1.21218
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1613989646
date2=1613997162
value1=1.210270
value2=1.212180
</object>

<object>
type=2
name=autotrade #25697029 -> #25722785 EURUSD
hidden=1
descr=1.21287 -> 1.21400
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614181765
date2=1614193137
value1=1.212870
value2=1.214000
</object>

<object>
type=2
name=autotrade #25818547 -> #25823878 EURUSD
hidden=1
descr=1.22027 -> 1.21749
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614283343
date2=1614285139
value1=1.220270
value2=1.217490
</object>

<object>
type=2
name=autotrade #25864815 -> #25884800 EURUSD
hidden=1
descr=1.21420 -> 1.21019
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614330696
date2=1614345707
value1=1.214200
value2=1.210190
</object>

<object>
type=2
name=autotrade #26056812 -> #26085771 EURUSD
hidden=1
descr=1.20095 -> 1.20302
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614676619
date2=1614693059
value1=1.200950
value2=1.203020
</object>

<object>
type=2
name=autotrade #26094847 -> #26098385 EURUSD
hidden=1
descr=1.20225 -> 1.20424
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614699872
date2=1614701752
value1=1.202250
value2=1.204240
</object>

<object>
type=2
name=autotrade #26295784 -> #26315686 EURUSD
hidden=1
descr=1.20246 -> 1.20072
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614878356
date2=1614886957
value1=1.202460
value2=1.200720
</object>

<object>
type=2
name=autotrade #26308055 -> #26315664 EURUSD
hidden=1
descr=1.20380 -> 1.20073
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1614885085
date2=1614886947
value1=1.203800
value2=1.200730
</object>

<object>
type=2
name=autotrade #27148469 -> #27188291 EURUSD
hidden=1
descr=1.19534 -> 1.19220
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616063821
date2=1616087070
value1=1.195340
value2=1.192200
</object>

<object>
type=2
name=autotrade #27269113 -> #27275693 EURUSD
hidden=1
descr=1.18812 -> 1.18803
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616171395
date2=1616174083
value1=1.188120
value2=1.188030
</object>

<object>
type=2
name=autotrade #27391201 -> #27431973 EURUSD
hidden=1
descr=1.19049 -> 1.18737
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616496776
date2=1616522391
value1=1.190490
value2=1.187370
</object>

<object>
type=2
name=autotrade #27470811 -> #27505328 EURUSD
hidden=1
descr=1.18301 -> 1.18295
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616581347
date2=1616608511
value1=1.183010
value2=1.182950
</object>

<object>
type=2
name=autotrade #28483695 -> #28491511 EURUSD
hidden=1
descr=1.19749 -> 1.19824
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618595686
date2=1618613387
value1=1.197490
value2=1.198240
</object>

<object>
type=2
name=autotrade #28758431 -> #28761306 EURUSD
hidden=1
descr=1.20147 -> 1.20145
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1619111678
date2=1619113360
value1=1.201470
value2=1.201450
</object>

<object>
type=2
name=autotrade #28827847 -> #28830340 EURUSD
hidden=1
descr=1.20472 -> 1.20628
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1619200375
date2=1619202715
value1=1.204720
value2=1.206280
</object>

<object>
type=2
name=autotrade #28878968 -> #28890737 EURUSD
hidden=1
descr=1.20780 -> 1.20775
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1619451213
date2=1619458475
value1=1.207800
value2=1.207750
</object>

<object>
type=2
name=autotrade #28920478 -> #28927556 EURUSD
hidden=1
descr=1.20599 -> 1.20803
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1619521906
date2=1619531549
value1=1.205990
value2=1.208030
</object>

<object>
type=2
name=autotrade #29217276 -> #29225714 EURUSD
hidden=1
descr=1.20300 -> 1.20043
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1620122573
date2=1620130072
value1=1.203000
value2=1.200430
</object>

<object>
type=2
name=autotrade #33349545 -> #33361946 EURUSD
hidden=1
descr=1.17846 -> 1.18124
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626952050
date2=1626965256
value1=1.178460
value2=1.181240
</object>

<object>
type=2
name=autotrade #33349949 -> #33361947 EURUSD
hidden=1
descr=1.17831 -> 1.18124
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626952189
date2=1626965256
value1=1.178310
value2=1.181240
</object>

<object>
type=2
name=autotrade #34077717 -> #34225474 EURUSD
hidden=1
descr=1.18399 -> 1.17871
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1628097937
date2=1628265259
value1=1.183990
value2=1.178710
</object>

<object>
type=2
name=autotrade #34776800 -> #34797753 EURUSD
hidden=1
descr=1.17581 -> 1.17281
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1629214365
date2=1629221012
value1=1.175810
value2=1.172810
</object>

<object>
type=2
name=autotrade #35207083 -> #35233163 EURUSD
hidden=1
descr=1.17521 -> 1.17527
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1629820363
date2=1629844318
value1=1.175210
value2=1.175270
</object>

<object>
type=2
name=autotrade #35360411 -> #35448378 EURUSD
hidden=1
descr=1.17488 -> 1.17852
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1629994030
date2=1630083672
value1=1.174880
value2=1.178520
</object>

<object>
type=2
name=autotrade #35523186 -> #35565713 EURUSD
hidden=1
descr=1.17889 -> 1.18118
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1630339050
date2=1630390654
value1=1.178890
value2=1.181180
</object>

<object>
type=2
name=autotrade #35623565 -> #35633901 EURUSD
hidden=1
descr=1.18098 -> 1.18064
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1630432542
date2=1630438697
value1=1.180980
value2=1.180640
</object>

<object>
type=2
name=autotrade #36006767 -> #36117649 EURUSD
hidden=1
descr=1.18475 -> 1.18066
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1631030573
date2=1631123308
value1=1.184750
value2=1.180660
</object>

<object>
type=2
name=autotrade #36772570 -> #36786518 EURUSD
hidden=1
descr=1.17664 -> 1.17559
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1631895270
date2=1631897733
value1=1.176640
value2=1.175590
</object>

<object>
type=2
name=autotrade #38006052 -> #38015166 EURUSD
hidden=1
descr=1.15835 -> 1.16034
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1633453497
date2=1633457384
value1=1.158350
value2=1.160340
</object>

<object>
type=2
name=autotrade #38809383 -> #38854584 EURUSD
hidden=1
descr=1.16429 -> 1.16426
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1634623134
date2=1634660645
value1=1.164290
value2=1.164260
</object>

<object>
type=2
name=autotrade #38859455 -> #38868857 EURUSD
hidden=1
descr=1.16509 -> 1.16357
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1634662087
date2=1634665185
value1=1.165090
value2=1.163570
</object>

<object>
type=2
name=autotrade #38868739 -> #38874248 EURUSD
hidden=1
descr=1.16362 -> 1.16362
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1634665131
date2=1634668698
value1=1.163620
value2=1.163620
</object>

<object>
type=2
name=autotrade #38880939 -> #38915767 EURUSD
hidden=1
descr=1.16427 -> 1.16179
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1634675727
date2=1634726250
value1=1.164270
value2=1.161790
</object>

<object>
type=2
name=autotrade #39320210 -> #39424770 EURUSD
hidden=1
descr=1.15898 -> 1.16143
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1635273122
date2=1635365137
value1=1.158980
value2=1.161430
</object>

<object>
type=2
name=autotrade #39391278 -> #39424633 EURUSD
hidden=1
descr=1.16174 -> 1.16151
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1635350065
date2=1635365059
value1=1.161740
value2=1.161510
</object>

<object>
type=2
name=autotrade #39486353 -> #39533626 EURUSD
hidden=1
descr=1.16270 -> 1.16825
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1635436072
date2=1635459135
value1=1.162700
value2=1.168250
</object>

<object>
type=2
name=autotrade #39858196 -> #39886006 EURUSD
hidden=1
descr=1.15709 -> 1.15991
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1635956599
date2=1635973210
value1=1.157090
value2=1.159910
</object>

<object>
type=2
name=autotrade #40748763 -> #40793167 EURUSD
hidden=1
descr=1.13472 -> 1.13201
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1637078768
date2=1637116627
value1=1.134720
value2=1.132010
</object>

<object>
type=2
name=autotrade #41697101 -> #41702564 EURUSD
hidden=1
descr=1.13645 -> 1.13647
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1638285763
date2=1638288544
value1=1.136450
value2=1.136470
</object>

<object>
type=2
name=autotrade #41707523 -> #41717822 EURUSD
hidden=1
descr=1.13760 -> 1.13605
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1638290724
date2=1638293584
value1=1.137600
value2=1.136050
</object>

<object>
type=2
name=autotrade #41707537 -> #41717823 EURUSD
hidden=1
descr=1.13761 -> 1.13605
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1638290724
date2=1638293584
value1=1.137610
value2=1.136050
</object>

<object>
type=2
name=autotrade #41985893 -> #42003408 EURUSD
hidden=1
descr=1.12823 -> 1.13120
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1638521880
date2=1638540278
value1=1.128230
value2=1.131200
</object>

<object>
type=2
name=autotrade #42008956 -> #42031562 EURUSD
hidden=1
descr=1.13161 -> 1.12801
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1638545401
date2=1638550931
value1=1.131610
value2=1.128010
</object>

<object>
type=2
name=autotrade #42490095 -> #42493648 EURUSD
hidden=1
descr=1.12836 -> 1.13011
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1639155398
date2=1639157003
value1=1.128360
value2=1.130110
</object>

<object>
type=2
name=autotrade #42845034 -> #42857261 EURUSD
hidden=1
descr=1.13308 -> 1.13090
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1639673079
date2=1639677328
value1=1.133080
value2=1.130900
</object>

<object>
type=20
name=SSSR#R0 Strength=Verified, Test Count=2
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1627506000
date2=1640804400
value1=1.179340
value2=1.176354
</object>

<object>
type=20
name=SSSR#R1 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1627646400
date2=1640804400
value1=1.191393
value2=1.189944
</object>

<object>
type=20
name=SSSR#R2 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1628175600
date2=1640804400
value1=1.186320
value2=1.183241
</object>

<object>
type=20
name=SSSR#R3 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1630987200
date2=1640804400
value1=1.188682
value2=1.188240
</object>

<object>
type=20
name=SSSR#R4 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1631696400
date2=1640804400
value1=1.180428
value2=1.179666
</object>

<object>
type=20
name=SSSR#R5 Strength=Proven, Test Count=4
hidden=1
background=1
selectable=0
filling=1
date1=1631808000
date2=1640804400
value1=1.176273
value2=1.173914
</object>

<object>
type=20
name=SSSR#R6 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1632700800
date2=1640804400
value1=1.172924
value2=1.171982
</object>

<object>
type=20
name=SSSR#R7 Strength=Verified, Test Count=3
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1632816000
date2=1640804400
value1=1.170716
value2=1.168208
</object>

<object>
type=20
name=SSSR#R8 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1635991200
date2=1640804400
value1=1.162209
value2=1.159917
</object>

<object>
type=20
name=SSSR#R9 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1636128000
date2=1640804400
value1=1.151900
value2=1.150776
</object>

<object>
type=20
name=SSSR#R10 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1636650000
date2=1640804400
value1=1.148270
value2=1.147040
</object>

<object>
type=20
name=SSSR#R11 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1636732800
date2=1640804400
value1=1.143759
value2=1.142821
</object>

<object>
type=20
name=SSSR#R12 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1636736400
date2=1640804400
value1=1.146751
value2=1.145128
</object>

<object>
type=20
name=SSSR#S13 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1637769600
date2=1640804400
value1=1.120644
value2=1.117756
</object>

<object>
type=20
name=SSSR#R14 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1638288000
date2=1640804400
value1=1.138987
value2=1.137593
</object>

<object>
type=20
name=SSSR#S15 Strength=Proven, Test Count=11
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1638295200
date2=1640804400
value1=1.127060
value2=1.121386
</object>

<object>
type=20
name=SSSR#R16 Strength=Verified, Test Count=3
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1639670400
date2=1640804400
value1=1.136987
value2=1.132742
</object>

<object>
type=20
name=SSSR#S17 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640775600
date2=1640804400
value1=1.127980
value2=1.127065
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Verificado Resistencia, Retesteado=2
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.177847
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.190668
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
date1=1640843694
value1=1.184781
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.188461
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.180047
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Probado Resistencia, Retesteado=4   
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.175094
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.172453
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Verificado Resistencia, Retesteado=3
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.169462
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.161063
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.151338
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#10LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.147655
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.143290
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#12LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.145939
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#13LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.119200
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#14LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.138290
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#15LBL
hidden=1
descr=Probado Soporte, Retesteado=11      
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.124223
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#16LBL
hidden=1
descr=Verificado Resistencia, Retesteado=3
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.134865
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#17LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1640843694
value1=1.127522
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>