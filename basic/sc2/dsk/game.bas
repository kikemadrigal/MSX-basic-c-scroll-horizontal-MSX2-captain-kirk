10cls:color15,1,1:keyoff
20defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0):defusr3=&h41:defusr4=&h44:defusr5=&h156
30screen2,2,0
40definta-z
50open"grp:"as#1
60 me$="Loading sprites":gosub 2000
70gosub6000
80 me$="Loading tileset":gosub 2000
90gosub10000
100 me$="Borrar pantalla?":gosub 2100
110gosub20000
120dimm(120,13):sl=6:n=0:w=88
130x=0:y=9*8:v=8:h=8:l=9:s=0
140restore21000:gosub20200
150gosub20800
160 me$="Press space key to start":gosub 2100
200j=STICK(0)ORSTICK(1)
210ONjGOTO230,250,270,290,310,330,350,370
220goto400
230y=y-h:p=p4:goto400
250x=x+v:y=y-h:p=p0:goto400
270x=x+v:p=p0:goto400
290x=x+v:y=y+h:p=p0:goto400
310y=y+h:p=p4:goto400
330x=x-v-4:y=y+h:p=p2:goto400
350x=x-v-4:p=p2:goto400
370x=x-v-4:y=y-h:p=p2:goto400
400remnadademomento
500IFy<24THENy=24elseify>112theny=112
510ifx<0thenx=0elseifx>250thenx=250
520PUTSPRITE0,(X,Y),15,P
600ifn<wthenn=n+1:gosub20600elsen=0
690goto200
2000line(0,170)-(255,180),6,bf
2010preset(0,170):?#1,me$
2090return
2100line(0,170)-(255,180),6,bf
2110preset(0,170):?#1,me$
2120ifstrig(0)=-1then2180else2120
2180line(0,170)-(255,180),6,bf
2190return
6000callturboon
6010fori=0to5:sp$=""
6020forj=0to31
6030reada$
6040sp$=sp$+chr$(val(a$))
6050nextJ
6060sprite$(i)=sp$
6070nexti
6080fori=4to5step4:co=1
6090forj=0to15
6100co=co+1:ifco>15thenco=1
6110vpoke6912+i,co
6120nextJ
6130nextI
6140data32,48,56,127,127,63,126,63
6150data127,127,127,56,48,48,32,0
6160data0,0,0,224,240,224,0,0
6170data240,248,240,0,0,0,0,0
6180remdatadefinitionsprite1,name:Sprite-2
6190data32,48,127,31,127,56,127,39
6200data127,48,56,60,127,31,127,32
6210data0,0,240,248,240,0,248,252
6220data248,0,0,0,240,248,240,0
6230data0,0,3,15,31,63,127,255
6240data127,63,15,15,0,0,0,0
6250data0,0,248,252,252,248,248,192
6260data248,252,252,248,0,0,0,0
6270data3,31,59,115,96,192,255,255
6280data255,192,96,48,27,15,3,3
6290data248,252,252,248,0,0,0,192
6300data0,0,0,0,248,252,252,248
6310remdatadefinitionsprite4,name:Sprite-8
6320data0,0,0,15,159,207,255,255
6330data255,238,207,159,15,0,0,0
6340data0,0,0,248,252,254,248,240
6350data224,0,252,254,252,0,0,0
6360data3,7,3,31,159,206,255,255
6370data255,206,159,31,31,3,7,3
6380data252,254,252,224,128,0,224,240
6390data224,0,128,224,128,252,254,252
7940fori=0to6:PUTSPRITEi,(0,210),15,i:nexti
7980callturbooff
7990return
10000callturboon
10030restore10040:FORI=0TO(160*8)-1
10035READA$
10036VPOKEI,VAL("&H"+A$)
10037VPOKE2048+I,VAL("&H"+A$)
10038VPOKE4096+I,VAL("&H"+A$)
10039NEXTI
10040DATA80,C0,E0,3F,3F,3F,2F,30
10050DATA01,03,07,FC,E8,F8,F8,38
10060DATAC0,E0,3F,38,1E,07,00,00
10070DATA03,06,0C,3C,70,C0,00,00
10080DATA80,C0,C0,E0,0F,3C,1C,05
10090DATAFF,FF,FF,FF,FF,FF,FF,40
10100DATA00,00,00,00,00,0E,0F,CA
10110DATA07,3F,7C,C0,C0,C0,C0,80
10120DATAC0,F0,3E,07,03,00,00,00
10130DATAFF,FF,01,03,F0,CE,00,00
10140DATA0F,78,C0,C0,00,00,00,00
10150DATAC0,C0,C3,C3,27,24,3C,18
10160DATA01,01,01,33,B7,FC,C0,00
10170DATA3C,3C,36,14,1C,00,00,00
10180DATAC1,C1,C1,C1,C1,C3,66,24
10190DATA88,8C,C4,E3,E1,E1,0F,0F
10200DATA03,03,07,F8,F8,98,98,70
10210DATAC0,C0,E7,3C,00,00,00,00
10220DATA03,67,BC,00,00,00,00,00
10230DATA81,E7,3C,00,00,00,00,00
10240DATA38,6C,38,00,00,00,00,0F
10250DATA18,3C,08,00,00,00,00,F0
10260DATAFF,8C,00,00,00,00,00,00
10270DATA38,7C,18,00,00,00,00,00
10280DATA60,B0,60,00,00,00,00,0A
10290DATA07,0C,07,00,00,00,00,00
10300DATA61,96,0C,00,00,00,00,00
10310DATAFF,CD,00,00,00,00,00,00
10320DATAFF,99,00,00,00,00,00,00
10330DATA10,38,24,18,00,00,00,00
10340DATAF8,78,38,7C,38,18,00,01
10350DATA3E,0C,E1,1F,0E,00,00,80
10360DATA1C,07,03,00,00,00,80,88
10370DATAE0,E0,C0,00,00,00,21,21
10380DATA00,00,00,00,00,00,80,80
10390DATA00,00,00,00,00,00,10,10
10400DATA03,00,00,00,00,00,00,40
10410DATAC8,77,03,00,00,00,00,04
10420DATA70,E0,80,00,00,00,18,C3
10430DATA00,00,00,00,00,00,03,07
10440DATA00,00,00,00,00,00,C0,E0
10450DATA00,00,00,00,00,00,00,FF
10460DATA00,00,00,00,00,00,00,FF
10470DATA18,00,00,00,00,00,00,FF
10480DATA00,00,00,00,00,00,00,FF
10490DATA00,00,00,00,00,00,00,FF
10500DATA1C,0C,00,00,00,00,00,FF
10510DATA07,07,03,03,03,02,03,FF
10520DATA30,30,C0,C0,60,80,80,FF
10530DATA07,1F,3D,7F,FF,F7,FF,FF
10540DATAF8,FF,B7,FB,EF,FF,FF,FF
10550DATA00,80,C0,E1,FF,3F,00,00
10560DATA3C,7E,FF,EF,F7,7F,00,00
10570DATAFF,FF,BF,EE,E7,FF,00,00
10580DATA80,E0,FC,7E,FF,FF,00,00
10590DATA00,00,00,00,C4,DE,01,01
10600DATA1F,17,3F,3F,7F,5F,80,80
10610DATA00,C0,40,E0,B8,FE,00,00
10620DATA00,00,01,07,0F,1B,00,00
10630DATA00,00,06,9E,DF,6F,00,00
10640DATA0F,1F,17,3F,3F,7F,00,00
10650DATA80,E0,F1,FB,FB,FF,00,00
10660DATA1F,FF,BF,FB,FF,FE,80,80
10670DATA60,B0,F8,EC,FE,FE,00,00
10680DATA0C,00,22,00,00,00,04,00
10690DATA20,00,00,88,00,00,0C,84
10700DATA20,10,80,00,28,00,28,00
10710DATA23,00,88,00,20,04,40,10
10720DATA40,08,20,00,00,00,00,02
10730DATA04,00,60,00,04,00,00,40
10740DATA81,80,C3,C3,C3,C3,C3,C3
10750DATAF0,E0,C0,80,F0,0F,0F,F0
10760DATA0F,07,03,01,0F,F0,F0,0F
10770DATAFF,FF,F8,C3,FF,FF,FF,FF
10780DATAFF,1F,7F,FF,FF,FF,FF,FF
10790DATAFF,DF,DF,EF,E3,FB,FF,FF
10800DATAFB,FB,FF,FF,FF,FF,FF,FF
10810DATAFF,FF,1F,FF,FF,FF,FF,FF
10820DATAFF,FF,FF,FF,FF,7F,FF,FF
10830DATAFF,1F,FF,FF,FF,FF,FF,FF
10840DATAFF,EF,F9,FD,FF,FF,FF,F7
10850DATAFF,FF,FB,FF,FF,FF,FF,F7
10860DATAFF,FF,FF,FF,FF,EF,FF,FF
10870DATA00,00,00,71,FD,DF,00,00
10880DATA00,80,E0,A0,F0,7D,00,00
10890DATA00,00,00,00,F1,FF,00,60
10900DATA00,00,00,01,01,00,03,07
10910DATA0F,1E,FD,FB,F7,FF,FF,FD
10920DATAFC,FB,DF,EE,FF,FB,BF,9F
10930DATA00,00,00,00,00,00,E0,F0
10940DATA00,00,00,01,03,03,01,07
10950DATA0F,0F,57,FB,DD,FF,9F,BF
10960DATA00,00,80,C0,C0,E0,70,98
10970DATA03,03,07,07,0F,0F,1D,1F
10980DATAF0,FC,BD,FF,DF,FF,F7,FF
10990DATA00,00,00,00,80,40,E0,E0
11000DATA84,84,10,00,80,00,00,00
11010DATA84,84,80,00,01,00,00,00
11020DATAFF,48,5A,04,00,00,00,00
11030DATA90,84,94,02,00,00,00,00
11040DATA42,50,10,00,00,00,00,00
11050DATA48,08,48,00,00,00,00,00
11060DATA3C,00,81,C3,E7,00,00,00
11070DATAC0,E0,F0,F8,FC,00,00,00
11080DATA03,07,0F,1F,3F,00,00,00
11090DATA7F,03,FF,FF,FF,00,00,00
11100DATAF3,FF,FF,FF,FF,00,00,00
11110DATAF3,F7,FF,FF,FF,00,00,00
11120DATAFB,FF,FF,FF,FF,00,00,00
11130DATAFF,FB,FF,FF,FF,00,00,00
11140DATAFF,FF,FF,FF,FF,00,00,00
11150DATAE7,FF,FF,FF,FF,00,00,00
11160DATAFF,DF,FF,FF,FF,00,00,00
11170DATAFF,FF,FF,FF,FF,00,00,00
11180DATAFF,FF,FF,FF,FF,00,00,00
11190DATA03,0F,0D,0F,1B,00,00,00
11200DATA00,C3,E7,E7,EF,00,00,00
11210DATAE0,F0,D8,FC,DF,00,00,00
11220DATA0F,3D,3F,FF,FF,00,00,00
11230DATA77,FF,E7,EF,FF,00,00,00
11240DATAEF,FF,FC,FF,FF,00,00,00
11250DATA78,FC,FE,DF,FF,00,00,00
11260DATA07,1F,1D,3B,FF,00,00,00
11270DATA7D,EF,FF,BF,FF,00,00,00
11280DATAA8,DE,EE,FF,FF,00,00,00
11290DATA3B,37,2F,7F,FF,00,00,00
11300DATAFB,DF,F7,FF,FF,00,00,00
11310DATAB0,98,F8,F6,FF,00,00,00
11320DATA00,00,00,00,00,00,00,00
11330DATA00,00,00,00,00,00,00,00
11340DATA00,00,00,00,00,00,00,00
11350DATA00,00,00,00,00,00,00,00
11360DATA00,00,00,00,00,00,00,00
11370DATA00,00,00,00,00,00,00,00
11380DATA00,00,00,00,00,00,00,00
11390DATA00,00,00,00,00,00,00,00
11400DATA00,00,00,00,00,00,00,00
11410DATA00,00,00,00,00,00,00,00
11420DATA00,00,00,00,00,00,00,00
11430DATA00,00,00,00,00,00,00,00
11440DATA00,00,00,00,00,00,00,00
11450DATA00,00,00,00,00,00,00,00
11460DATA00,00,00,00,00,00,00,00
11470DATA00,00,00,00,00,00,00,00
11480DATA00,00,00,00,00,00,00,00
11490DATA00,00,00,00,00,00,00,00
11500DATA00,00,00,00,00,00,00,00
11510DATA00,00,00,00,00,00,00,00
11520DATA00,00,00,00,00,00,00,00
11530DATA00,00,00,00,00,00,00,00
11540DATA00,00,00,00,00,00,00,00
11550DATA00,00,00,00,00,00,00,00
11560DATA00,00,00,00,00,00,00,00
11570DATA00,00,00,00,00,00,00,00
11580DATA00,00,00,00,00,00,00,00
11590DATA00,00,00,00,00,00,00,00
11600DATA00,00,00,00,00,00,00,00
11610DATA00,00,00,00,00,00,00,00
11620DATA00,00,00,00,00,00,00,00
11630DATA00,00,00,00,00,00,00,00
13000restore17740:FORI=0TO(160*8)-1
13010READA$
13020VPOKE8192+I,VAL("&H"+A$):'&h2000'
13030VPOKE10240+I,VAL("&H"+A$):'&h2800'
13040VPOKE12288+I,VAL("&H"+A$):'&h3000'
13050NEXTI
13060callturbooff
17740DATA9A,9A,6A,A1,A1,A1,A1,9A
17750DATA9A,9A,6A,A1,A1,A1,A1,81
17760DATA9A,8A,A1,9A,61,61,61,61
17770DATA9A,8A,9A,61,61,61,61,61
17780DATA6A,6A,6A,6A,A1,61,61,61
17790DATAA1,A1,A1,A1,A1,A1,A1,BA
17800DATABA,BA,BA,BA,BA,BA,9A,98
17810DATA9A,9A,61,91,81,61,61,91
17820DATA9A,9A,61,91,61,61,61,61
17830DATAA1,A1,9A,9A,89,61,61,61
17840DATA6A,81,91,61,61,61,61,61
17850DATA6A,6A,6A,6A,61,61,61,61
17860DATA6A,6A,6A,6A,6A,61,61,61
17870DATAA6,A6,61,61,61,61,61,61
17880DATA6A,6A,6A,6A,6A,6A,61,61
17890DATA6A,6A,6A,6A,6A,6A,A1,A1
17900DATA6A,6A,6A,A1,A1,61,61,61
17910DATA6A,6A,6A,61,61,61,61,61
17920DATA6A,6A,61,61,61,61,61,61
17930DATA6A,6A,61,61,61,61,61,61
17940DATAA6,61,61,61,61,61,61,E1
17950DATAA6,61,61,61,61,61,61,E1
17960DATA61,61,61,61,61,61,61,61
17970DATAB6,61,61,61,61,61,61,61
17980DATAB6,61,61,61,61,61,61,E1
17990DATAB6,61,61,61,61,61,61,61
18000DATA6B,61,61,61,61,61,61,61
18010DATA61,61,61,61,61,61,61,61
18020DATA61,61,61,61,61,61,61,61
18030DATAAB,B6,61,61,61,61,61,61
18040DATAB6,B6,B6,61,61,61,61,E1
18050DATAB6,AB,6B,61,61,61,61,E1
18060DATA81,91,81,81,81,81,61,8B
18070DATAA1,91,81,81,81,81,61,8B
18080DATA11,11,11,11,11,11,61,8B
18090DATA11,11,11,11,11,11,61,8B
18100DATA61,61,61,61,61,61,61,8B
18110DATA6A,61,61,61,61,61,61,8B
18120DATA61,61,61,61,61,61,A1,BA
18130DATA11,11,11,11,11,11,A1,AB
18140DATA11,11,11,11,11,11,A1,AB
18150DATA11,11,11,11,11,11,11,E1
18160DATAE1,E1,E1,E1,E1,E1,E1,E1
18170DATA61,61,61,61,61,61,61,E1
18180DATAE1,E1,E1,E1,E1,E1,E1,E1
18190DATAE1,E1,E1,E1,E1,E1,E1,E1
18200DATA61,61,61,61,61,61,61,E1
18210DATAA1,A1,A1,A1,A1,61,81,E1
18220DATA61,61,A1,A1,61,A1,81,E1
18230DATAE1,E1,E1,E1,E1,E1,E1,E1
18240DATAE1,E1,E1,E1,E1,E1,E1,E1
18250DATAE1,E1,E1,E1,E1,E1,E1,E1
18260DATAE1,E1,E1,E1,E1,E1,E1,E1
18270DATAE1,E1,E1,E1,E1,E1,E1,E1
18280DATAE1,E1,E1,E1,E1,E1,E1,E1
18290DATAE1,E1,E1,E1,E1,E1,E1,E1
18300DATAE1,E1,E1,E1,E1,E1,E1,E1
18310DATAE1,E1,E1,E1,E1,E1,E1,E1
18320DATAE1,E1,E1,E1,E1,E1,E1,E1
18330DATAE1,E1,E1,E1,E1,E1,E1,E1
18340DATAE1,E1,E1,E1,E1,E1,E1,E1
18350DATAE1,E1,E1,E1,E1,E1,E1,E1
18360DATAE1,E1,E1,E1,E1,E1,E1,E1
18370DATAE1,E1,E1,E1,E1,E1,E1,E1
18380DATA8B,8B,6B,6B,6B,6B,8B,8B
18390DATA8B,8B,8B,6B,6B,6B,8B,8B
18400DATA8B,6B,6B,6B,6B,6B,8B,8B
18410DATA8B,8B,6B,6B,6B,6B,8B,8B
18420DATA8B,6B,6B,6B,6B,6B,6B,8B
18430DATA8B,8B,6B,6B,6B,6B,6B,8B
18440DATABA,BA,A9,A9,A9,A9,A9,A9
18450DATABA,BA,BA,BA,A9,BA,BA,A8
18460DATABA,BA,BA,BA,A9,BA,BA,A8
18470DATAE1,E1,E1,E1,E1,E1,E1,E1
18480DATAE1,E1,E1,E1,E1,E1,E1,E1
18490DATAE1,E1,E1,E1,E1,E1,E1,E1
18500DATAE1,E1,E1,E1,E1,E1,E1,E1
18510DATAE1,E1,E1,E1,E1,E1,E1,E1
18520DATAE1,E1,E1,E1,E1,E1,E1,E1
18530DATAE1,E1,E1,E1,E1,E1,E1,E1
18540DATAE1,E1,E1,E1,E1,E1,E1,E1
18550DATAE1,E1,E1,E1,E1,E1,E1,E1
18560DATAE1,E1,E1,E1,E1,E1,E1,E1
18570DATAE1,E1,E1,E1,E1,E1,E1,E1
18580DATAE1,E1,E1,E1,E1,E1,E1,E1
18590DATAE1,E1,E1,E1,E1,E1,E1,E1
18600DATAE1,E1,E1,E1,E1,E1,E1,E1
18610DATAE1,E1,E1,E1,E1,E1,E1,E1
18620DATAE1,E1,E1,E1,E1,E1,E1,E1
18630DATAE1,E1,E1,E1,E1,E1,E1,E1
18640DATAE1,E1,E1,E1,E1,E1,E1,E1
18650DATAE1,E1,E1,E1,E1,E1,E1,E1
18660DATAE1,E1,E1,E1,E1,E1,E1,E1
18670DATAE1,E1,E1,E1,E1,E1,E1,E1
18680DATAE1,E1,E1,E1,E1,E1,E1,E1
18690DATAE1,E1,E1,E1,E1,E1,E1,E1
18700DATA8B,8B,8B,8B,6B,11,11,11
18710DATA8B,8B,8B,8B,6B,11,11,11
18720DATAB1,8B,8B,6B,6B,11,11,11
18730DATA8B,8B,8B,6B,6B,11,11,11
18740DATA8B,8B,8B,8B,8B,11,11,11
18750DATA8B,6B,8B,8B,8B,11,11,11
18760DATABA,BA,BA,BA,BA,11,11,11
18770DATABA,BA,BA,BA,BA,11,11,11
18780DATABA,BA,BA,BA,BA,11,11,11
18790DATAE1,E1,E1,E1,E1,E1,E1,E1
18800DATAE1,E1,E1,E1,E1,E1,E1,E1
18810DATAE1,E1,E1,E1,E1,E1,E1,E1
18820DATAE1,E1,E1,E1,E1,E1,E1,E1
18830DATAE1,E1,E1,E1,E1,E1,E1,E1
18840DATAE1,E1,E1,E1,E1,E1,E1,E1
18850DATAE1,E1,E1,E1,E1,E1,E1,E1
18860DATAE1,E1,E1,E1,E1,E1,E1,E1
18870DATAE1,E1,E1,E1,E1,E1,E1,E1
18880DATAE1,E1,E1,E1,E1,E1,E1,E1
18890DATAE1,E1,E1,E1,E1,E1,E1,E1
18900DATAE1,E1,E1,E1,E1,E1,E1,E1
18910DATAE1,E1,E1,E1,E1,E1,E1,E1
18920DATAE1,E1,E1,E1,E1,E1,E1,E1
18930DATAE1,E1,E1,E1,E1,E1,E1,E1
18940DATAE1,E1,E1,E1,E1,E1,E1,E1
18950DATAE1,E1,E1,E1,E1,E1,E1,E1
18960DATAE1,E1,E1,E1,E1,E1,E1,E1
18970DATAE1,E1,E1,E1,E1,E1,E1,E1
18980DATAE1,E1,E1,E1,E1,E1,E1,E1
18990DATAE1,E1,E1,E1,E1,E1,E1,E1
19000DATAE1,E1,E1,E1,E1,E1,E1,E1
19010DATAE1,E1,E1,E1,E1,E1,E1,E1
19020DATAE1,E1,E1,E1,E1,E1,E1,E1
19030DATAE1,E1,E1,E1,E1,E1,E1,E1
19040DATAE1,E1,E1,E1,E1,E1,E1,E1
19050DATAE1,E1,E1,E1,E1,E1,E1,E1
19060DATAE1,E1,E1,E1,E1,E1,E1,E1
19070DATAE1,E1,E1,E1,E1,E1,E1,E1
19080DATAE1,E1,E1,E1,E1,E1,E1,E1
19090DATAE1,E1,E1,E1,E1,E1,E1,E1
19100DATAE1,E1,E1,E1,E1,E1,E1,E1
19110DATAE1,E1,E1,E1,E1,E1,E1,E1
19120DATAE1,E1,E1,E1,E1,E1,E1,E1
19130DATAE1,E1,E1,E1,E1,E1,E1,E1
19140DATAE1,E1,E1,E1,E1,E1,E1,E1
19150DATAE1,E1,E1,E1,E1,E1,E1,E1
19160DATAE1,E1,E1,E1,E1,E1,E1,E1
19170DATAE1,E1,E1,E1,E1,E1,E1,E1
19180DATAE1,E1,E1,E1,E1,E1,E1,E1
19190DATAE1,E1,E1,E1,E1,E1,E1,E1
19200DATAE1,E1,E1,E1,E1,E1,E1,E1
19210DATAE1,E1,E1,E1,E1,E1,E1,E1
19220DATAE1,E1,E1,E1,E1,E1,E1,E1
19230DATAE1,E1,E1,E1,E1,E1,E1,E1
19240DATAE1,E1,E1,E1,E1,E1,E1,E1
19250DATAE1,E1,E1,E1,E1,E1,E1,E1
19260DATAE1,E1,E1,E1,E1,E1,E1,E1
19270DATAE1,E1,E1,E1,E1,E1,E1,E1
19280DATAE1,E1,E1,E1,E1,E1,E1,E1
19290DATAE1,E1,E1,E1,E1,E1,E1,E1
19300DATAE1,E1,E1,E1,E1,E1,E1,E1
19310DATAE1,E1,E1,E1,E1,E1,E1,E1
19320DATAE1,E1,E1,E1,E1,E1,E1,E1
19330DATAE1,E1,E1,E1,E1,E1,E1,E1
19990return
20000FORt=6144TO(6144+768)-97
20010vpoket,255
20020nextt
20090return
20200callturboon(m())
20205forr=0to12
20210READmp$:po=0
20220forc=0tolen(mp$)step4
20230r$=mid$(mp$,c+1,2)
20240tn$=mid$(mp$,c+3,2)
20250tn=val("&h"+tn$):tn=tn-1
20260re=val("&h"+r$)
20270fori=0tore
20280m(po,r)=tn:po=po+1
20300nexti
20310nextc
20320nextr
20325callturbooff
20390return
20600_TURBOON(m(),n)
20610d2=6400
20620forr=8to11
20630forc=nto31+n
20640VPOKEd2,m(c,r):d2=d2+1
20650nextc
20660nextr
20670_TURBOOFF
20690return
20800_TURBOON(m())
20810d=6144
20820forr=0to12
20830forc=0to31
20840VPOKEd,m(c,r):d=d+1
20850nextc
20860nextr
20870_TURBOOFF
20890return
21000data7741
21010data7741
21020data0000054104000341040008410400084106000010001104000341010003410b00044106000541040007410800
21030data020000100011060000050006000700080400001000110e000009000a000b0900003000310400000500060007000812000009000a000b0800000500060007000808000009000a000b0a00
21040data02000030003106000025002600270028040000300031220000250026002700281e0000250026002700281600
21050data7700
21060data7700
21070data7700
21080data0700005700580059005a0c00005b005c005d0800005700580059005a0a00005b005c005d0900005700580059005a0300005e005f00600900005b005c005d0900005700580059005a005e005f00600700005700580059005a0100
21090data0100005b005c005d0200007700780079007a0200005e005f00600600007b007c007d0800007700780079007a0a00007b007c007d0900007700780079007a0300007e007f008006000039003a0000007b007c007d0900007700780079007a007e007f00800700007700780079007a0100
21100data0100007b007c007d000006710100007e007f008000000039003a0039003a010003710000003200330034003500360037067101000039003a0200047101000032003300340035003600370000047100000039003a0000027100320033003400350036003709710100003b003c003d003e0871030007710000
21110data7771
21120data7771
