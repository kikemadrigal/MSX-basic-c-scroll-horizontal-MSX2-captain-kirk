1 'El mapa completo son 120 patrones * 13 filas'
1 'Juan quiere mover las 3 las 3 ultimas filas del banco 1  y las 3 primeras del banco 3'







1 'Color caracteres, fondo, borde'
10 cls:color 15,1,1:key off
1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E, inicializamos el psg &h90'
1 '&h41 y &h44 Enlazamos con las rutinas de apagar y encender la pantalla, &h156 borra el buffer del teclado'
20 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0):defusr3=&h41:defusr4=&h44:defusr5=&h156
30 screen 2,2,0
1 'Todas las variables serán enteras'
40 defint a-z
1 'Definimos un canal necesario para poder mostrar texto, habrá que poner en el print o input #1'
50 open "grp:" as #1
1 '2000 es la subrrutina para pintar un mensaje'
60 me$="^Loading sprites":gosub 2000
1 'cargamos los sprites en VRAM'
70 gosub 6000
80 me$="^Loading tileset":gosub 2000
1 'Cargamos los tiles'
90 gosub 10000
100 me$="^Borrar pantalla?":gosub 2100
1 'Borramos la pantalla'
110 gosub 20000
120 dim m(120,13):sl=6:n=0:w=88
130 x=0:y=9*8:v=8:h=8:l=9:s=0
1 'Inicializamos el array con el menú, importante colocar el puntero de los datas al principio'
140 restore 21000: gosub 20200
1 'Pintamos toda la pantalla
150 gosub 20800
1 'Mostramos un mensaje sin pausa'
160 me$="^Press space key to start":gosub 2100

1 'Main loop :loop:'
    1 'time incrementa en 1 cada vez que el vdp genera una interrupción, es decir en 1 segundo hace 60 incrementos'
    1 'debug time'
        1 '200 time=0:j=STICK(0) OR STICK(1)
    200 j=STICK(0) OR STICK(1)
    1 ' on variable goto numero_linea1, numero_linea2,etc salta a la linea 1,2,etc o si es cero continua la ejecución '
    210 ON j GOTO 230,250,270,290,310,330,350,370
    220 goto 400
    1 'movimiento hacia arriba 
    1 'Ponemos el sprite correspondiente que mira hacia arriba que irá alternando ente 2 sprites'
    230 y=y-h:p=p4:goto 400
    1 '2 Pulsado 2 movimiento hacia arriba derecha 
    1 ' ponemos el sprite 0 o 1 que corresponde a los de la derecha'
    250 x=x+v:y=y-h:p=p0:goto 400
    1 '3 pulsado Movimiento hacia la derecha '
    270 x=x+v:p=p0:goto 400
    1 '4 Movimiento abajo derecha'
    290 x=x+v:y=y+h:p=p0:goto 400
    1 '5 Movimiento abajo'
    310 y=y+h:p=p4:goto 400 
    1 '6 Movimiento abajo izquierda'
    330 x=x-v-4:y=y+h:p=p2:goto 400
    1 '7 Movimiento izquierda'
    350 x=x-v-4:p=p2:goto 400
    1 '8 movimiento arriba izquierda'
    370 x=x-v-4:y=y-h:p=p2:goto 400

    400 rem nada de momento
    1 'Chekeo de límites'
    500 IF y<24 THEN y=24 else if y>112 then y=112
    510 if x<0 then x=0 else if x>250 then x=250

    1 'Render :framed_picture:'
    1 '520 vpoke 6912,y:vpoke 6913,x:vpoke 6914,p
    520 PUTSPRITE0,(X,Y),15,P

    1 ' Aumentando el contador de pantalla y moviendo el tercio central'
    600 if n<w then n=n+1:gosub 20600 else n=0
    1 'Debug'
    1 '680 me$=str$(time):gosub 2000
690 goto 200

1 'imprimir mensajes sin pausa (necesita que esté inicializada me$)''
    2000 line(0,170)-(255,180),6,bf
    2010 preset (0,170):? #1,me$
2090 return

1 'Imprimir mensajes con pausa (necesita que esté inicializada me$)'
    2100 line(0,170)-(255,180),6,bf
    2110 preset (0,170):? #1,me$
    2120 if strig(0)=-1 then 2180 else 2120
    2180 line(0,170)-(255,180),6,bf
2190 return

1 'Rutina cargar sprites'
    1 'Con leo dibujamos 14 sprites'
    6000 call turbo on
    1 '6010 for i=0 to 42:sp$=""
    6010 for i=0 to 5:sp$=""
        6020 for j=0 to 31
            6030 read a$
            6040 sp$=sp$+chr$(val(a$))
        6050 next J
        6060 sprite$(i)=sp$
    6070 next i
    1 '6080 for i=4 to 42 step 4:co=1
    6080 for i=4 to 5 step 4:co=1
        6090 for j=0 to 15
            6100 co=co+1:if co>15 then co=1
            6110 vpoke 6912+i,co
        6120 next J
    6130 next I
    1' rem sprites data definitions
    1' rem data definition sprite 0, name: Sprite-2
    6140 data 32,48,56,127,127,63,126,63
    6150 data 127,127,127,56,48,48,32,0
    6160 data 0,0,0,224,240,224,0,0
    6170 data 240,248,240,0,0,0,0,0
    6180 rem data definition sprite 1, name: Sprite-2
    6190 data 32,48,127,31,127,56,127,39
    6200 data 127,48,56,60,127,31,127,32
    6210 data 0,0,240,248,240,0,248,252
    6220 data 248,0,0,0,240,248,240,0
    1 '' rem data definition sprite 2, name: Sprite-16
    6230 data 0,0,3,15,31,63,127,255
    6240 data 127,63,15,15,0,0,0,0
    6250 data 0,0,248,252,252,248,248,192
    6260 data 248,252,252,248,0,0,0,0
    1 '' rem data definition sprite 3, name: Sprite-16
    6270 data 3,31,59,115,96,192,255,255
    6280 data 255,192,96,48,27,15,3,3
    6290 data 248,252,252,248,0,0,0,192
    6300 data 0,0,0,0,248,252,252,248
    6310 rem data definition sprite 4, name: Sprite-8
    6320 data 0,0,0,15,159,207,255,255
    6330 data 255,238,207,159,15,0,0,0
    6340 data 0,0,0,248,252,254,248,240
    6350 data 224,0,252,254,252,0,0,0
    1 '' rem data definition sprite 5, name: Sprite-8
    6360 data 3,7,3,31,159,206,255,255
    6370 data 255,206,159,31,31,3,7,3
    6380 data 252,254,252,224,128,0,224,240
    6390 data 224,0,128,224,128,252,254,252
   1 '' 1' rem data definition sprite 6, name: No_name9
   1 '' 6400 data 0,0,0,240,248,254,127,127
   1 '' 6410 data 127,127,254,248,240,0,0,0
   1 '' 6420 data 0,0,0,0,0,0,0,252
   1 '' 6430 data 252,0,0,0,0,0,0,0
   1 '' 6440 rem data definition sprite 7, name: No_name9
   1 '' 6450 data 96,112,120,252,255,255,127,127
   1 '' 6460 data 127,127,255,255,252,120,112,96
   1 '' 6470 data 0,0,0,0,0,128,224,252
   1 '' 6480 data 252,224,128,0,0,0,0,0
   1 '' 1 '' rem data definition sprite 8, name: Sprite-6
   1 '' 6490 data 0,0,85,106,117,0,117,106
   1 '' 6500 data 85,0,91,109,118,0,0,0
   1 '' 6510 data 0,0,86,171,86,0,86,171
   1 '' 6520 data 86,0,110,183,218,0,0,0
   1 '' 6530 rem data definition sprite 9, name: Sprite-6
   1 '' 6540 data 117,106,85,0,85,106,117,0
   1 '' 6550 data 117,106,85,0,91,109,118,0
   1 '' 6560 data 86,171,86,0,86,171,86,0
   1 '' 6570 data 86,171,86,0,110,183,218,0
   1 '' 6580 rem data definition sprite 10, name: Sprite-30
   1 '' 6590 data 0,0,0,0,0,1,1,6
   1 '' 6600 data 6,1,1,0,0,0,0,0
   1 '' 6610 data 0,0,0,0,0,128,128,96
   1 '' 6620 data 96,128,128,0,0,0,0,0
   1 '' 1 '' rem data definition sprite 11, name: Sprite-30
   1 '' 6630 data 0,0,0,0,0,1,3,7
   1 '' 6640 data 7,3,1,0,0,0,0,0
   1 '' 6650 data 0,0,0,0,0,128,192,224
   1 '' 6660 data 224,192,128,0,0,0,0,0
   1 '' 6670 rem data definition sprite 12, name: Sprite-30
   1 '' 6680 data 0,0,0,0,0,1,2,5
   1 '' 6690 data 5,2,1,0,0,0,0,0
   1 '' 6700 data 0,0,0,0,0,128,64,160
   1 '' 6710 data 160,64,128,0,0,0,0,0
   1 '' 1 '' rem data definition sprite 13, name: Sprite-30
   1 '' 6720 data 0,0,0,0,0,0,0,7
   1 '' 6730 data 7,0,0,0,0,0,0,0
   1 '' 6740 data 0,0,0,0,0,0,0,224
   1 '' 6750 data 224,0,0,0,0,0,0,0
   1 '' 6760 rem data definition sprite 14, name: Sprite-26
   1 '' 6770 data 128,64,32,50,31,15,15,63
   1 '' 6780 data 31,31,47,15,16,32,0,0
   1 '' 6790 data 0,0,0,144,40,208,224,224
   1 '' 6800 data 248,224,240,248,176,24,8,4
   1 '' 1 ' rem data definition sprite 15, name: Sprite-26
   1 '' 6810 data 0,0,0,0,1,4,1,31
   1 '' 6820 data 7,3,5,1,0,0,0,0
   1 '' 6830 data 0,0,0,0,32,192,224,248
   1 '' 6840 data 224,192,160,0,0,0,0,0
   1 '' 1 '' rem data definition sprite 16, name: Sprite-26
   1 '' 6850 data 0,0,0,0,0,0,1,0
   1 '' 6860 data 0,2,0,0,0,0,0,0
   1 '' 6870 data 0,0,0,0,0,0,32,0
   1 '' 6880 data 128,0,32,0,0,0,0,0
   1 '' 1' rem data definition sprite 17, name: Sprite-26
   1 '' 6890 data 0,0,0,0,0,0,0,0
   1 '' 6900 data 0,0,0,0,0,0,0,0
   1 '' 6910 data 0,0,0,0,0,0,0,0
   1 '' 6920 data 0,0,0,0,0,0,0,0
   1 '' 1' rem data definition sprite 18, name: Sprite-7
   1 '' 6930 data 0,0,0,0,0,0,0,1
   1 '' 6940 data 1,1,3,63,63,63,60,60
   1 '' 6950 data 0,0,0,0,0,0,0,128
   1 '' 6960 data 128,128,192,252,252,252,60,60
   1 '' 6970 rem data definition sprite 19, name: Sprite-14
   1 '' 6980 data 32,248,112,112,112,112,113,115
   1 '' 6990 data 114,115,115,251,255,255,240,96
   1 '' 7000 data 4,31,14,14,14,14,206,110
   1 '' 7010 data 46,110,110,111,255,255,15,6
   1 '' 1 '' rem data definition sprite 20, name: Sprite-22
   1 '' 7020 data 1,1,2,2,2,2,3,3
   1 '' 7030 data 3,3,9,9,15,1,3,2
   1 '' 7040 data 128,128,64,64,64,64,192,192
   1 '' 7050 data 192,192,144,144,240,128,192,64
   1 '' 1 ' rem data definition sprite 21, name: Sprite-23
   1 '' 7060 data 0,0,12,12,12,12,12,12
   1 '' 7070 data 30,63,30,255,255,187,40,16
   1 '' 7080 data 0,0,0,0,0,0,0,0
   1 '' 7090 data 112,104,102,255,254,212,40,16
   1 '' 1 '' rem data definition sprite 22, name: Sprite-24
   1 '' 7100 data 0,8,28,12,2,1,0,0
   1 '' 7110 data 0,7,15,127,187,17,187,85
   1 '' 7120 data 0,0,0,0,0,0,128,112
   1 '' 7130 data 80,240,248,254,186,17,186,84
   1 '' 1 '' rem data definition sprite 23, name: Sprite-25
   1 '' 7140 data 0,0,0,0,0,0,8,28
   1 '' 7150 data 14,7,3,31,15,16,41,16
   1 '' 7160 data 0,0,0,0,0,0,0,0
   1 '' 7170 data 0,12,236,132,28,132,74,138
   1 '' 1 '' rem data definition sprite 24, name: Sprite-34
   1 '' 7180 data 53,58,53,58,53,63,63,63
   1 '' 7190 data 3,6,6,3,1,1,1,0
   1 '' 7200 data 92,172,92,172,92,252,252,252
   1 '' 7210 data 192,96,96,192,128,128,128,0
   1 '' 1 '' rem data definition sprite 25, name: Sprite-35
   1 '' 7220 data 25,114,102,198,204,204,204,252
   1 '' 7230 data 252,31,7,3,6,12,6,0
   1 '' 7240 data 140,70,102,99,51,51,51,63
   1 '' 7250 data 63,240,192,128,192,96,192,0
   1 '' 1 '' rem data definition sprite 26, name: Sprite-37
   1 '' 7260 data 1,1,1,1,1,131,143,248
   1 '' 7270 data 251,8,15,1,1,1,1,0
   1 '' 7280 data 128,128,128,128,128,193,241,31
   1 '' 7290 data 223,16,240,128,128,128,128,0
   1 '' 1 '' rem data definition sprite 27, name: Sprite-36
   1 '' 7300 data 3,7,13,30,30,13,7,3
   1 '' 7310 data 3,7,13,30,30,13,7,3
   1 '' 7320 data 192,224,176,120,120,176,224,192
   1 '' 7330 data 192,224,176,120,120,176,224,192
   1 '' 1 '' rem data definition sprite 28, name: Sprite-38
   1 '' 7340 data 1,0,0,1,3,3,1,0
   1 '' 7350 data 0,1,3,3,1,7,5,7
   1 '' 7360 data 128,192,192,128,0,0,128,192
   1 '' 7370 data 192,128,0,0,128,224,160,224
   1 '' 1 '' rem data definition sprite 29, name: Sprite-39
   1 '' 7380 data 6,7,7,6,7,7,51,49
   1 '' 7390 data 55,62,54,55,49,3,2,0
   1 '' 7400 data 48,112,112,48,240,240,230,70
   1 '' 7410 data 246,190,54,246,198,224,32,0
   1 '' 1 '' rem data definition sprite 30, name: Sprite-8
   1 '' 7420 data 0,0,1,7,1,0,0,0
   1 '' 7430 data 0,0,1,7,1,0,0,0
   1 '' 7440 data 0,0,224,248,252,62,31,15
   1 '' 7450 data 31,63,254,252,224,0,0,0
   1 '' 1 '' rem data definition sprite 31, name: No_name9
   1 '' 7460 data 0,0,0,0,1,3,127,3
   1 '' 7470 data 3,127,3,1,0,0,0,0
   1 '' 7480 data 0,28,52,116,244,246,252,248
   1 '' 7490 data 248,252,246,244,116,52,28,0
   1 '' 1 '' rem data definition sprite 32, name: Sprite_name10
   1 '' 7500 data 0,0,0,0,1,2,123,187
   1 '' 7510 data 187,123,2,1,0,0,0,0
   1 '' 7520 data 30,32,94,190,126,248,255,255
   1 '' 7530 data 255,255,248,126,190,94,32,30
   1 '' 1 '' rem data definition sprite 33, name: Sprite-11
   1 '' 7540 data 0,0,0,0,6,4,30,47
   1 '' 7550 data 47,30,4,6,0,0,0,0
   1 '' 7560 data 30,62,127,255,224,254,254,254
   1 '' 7570 data 254,254,224,255,255,126,62,30
   1 '' 1 '' rem data definition sprite 34, name: Sprite-12
   1 '' 7580 data 0,15,23,15,0,1,126,191
   1 '' 7590 data 191,126,1,0,15,23,15,0
   1 '' 7600 data 4,255,252,255,228,128,240,64
   1 '' 7610 data 64,240,128,228,255,252,255,4
   1 '' 1 '' rem data definition sprite 35, name: Sprite-13
   1 '' 7620 data 15,15,1,1,1,1,1,125
   1 '' 7630 data 253,125,1,1,1,1,15,15
   1 '' 7640 data 224,224,128,192,224,240,248,87
   1 '' 7650 data 87,248,240,224,192,128,224,224
   1 '' 1 '' rem data definition sprite 36, name: Sprite-14
   1 '' 7660 data 0,0,0,63,255,0,0,7
   1 '' 7670 data 15,7,1,0,255,63,0,0
   1 '' 7680 data 4,14,63,254,255,30,238,132
   1 '' 7690 data 128,132,238,31,254,254,15,4
   1 '' 1 '' rem data definition sprite 37, name: Sprite-15
   1 '' 7700 data 0,0,0,1,3,31,241,44
   1 '' 7710 data 44,241,31,15,7,3,0,0
   1 '' 7720 data 6,102,226,238,240,192,220,28
   1 '' 7730 data 28,220,192,240,238,226,230,102
   1 '' 1 '' rem data definition sprite 38, name: Sprite-16
   1 '' 7740 data 31,63,31,0,31,7,0,3
   1 '' 7750 data 0,7,31,0,31,63,31,0
   1 '' 7760 data 192,240,216,12,230,243,255,255
   1 '' 7770 data 255,243,230,12,216,240,192,0
   1 '' 1 '' rem data definition sprite 39, name: Sprite-17
   1 '' 7780 data 0,0,0,0,0,0,31,243
   1 '' 7790 data 31,0,0,0,0,0,0,0
   1 '' 7800 data 224,240,248,252,255,255,255,252
   1 '' 7810 data 252,255,255,252,248,240,224,192
   1 '' 1 '' rem data definition sprite 40, name: Sprite-26
   1 '' 7820 data 255,255,255,255,255,255,255,255
   1 '' 7830 data 255,255,255,255,255,255,255,255
   1 '' 7840 data 255,255,255,255,255,255,255,255
   1 '' 7850 data 255,255,255,255,255,255,255,255
   1 '' 1 '' rem data definition sprite 41, name: Sprite-6
   1 '' 7860 data 0,0,0,0,0,0,0,109
   1 '' 7870 data 118,123,0,0,0,0,0,0
   1 '' 7880 data 0,0,0,0,0,0,0,182
   1 '' 7890 data 219,110,0,0,0,0,0,0
   1 '' 1 '' rem data definition sprite 42, name: Sprite-6
   1 '' 7900 data 0,0,0,0,117,106,85,0
   1 '' 7910 data 0,109,118,123,0,0,0,0
   1 '' 7920 data 0,0,0,0,86,171,86,0
   1 '' 7930 data 0,182,219,110,0,0,0,0

   7940 for i=0 to 6:PUTSPRITE i,(0,210),15,i:next i


   7980 call turbo off
7990 return





















1 'Rutina cargar la definición y colores de tiles en screen 2'
    1 'Con leo dibujamos 96 tiles'
    10000 call turbo on
    1' Hay que recordar la estructura de la VRAM, el tilemap se divide en 3 zonas
    1 'Nuestro tileset son X tiles o de 0 hasta el X-1'
    1 'Definiremos a partir de la posición 0 de la VRAM 18 tiles de 8 bytes'
    10030 restore 10040:FOR I=0 TO (160*8)-1
        10035 READ A$
        10036 VPOKE I,VAL("&H"+A$)
        10037 VPOKE 2048+I,VAL("&H"+A$)
        10038 VPOKE 4096+I,VAL("&H"+A$)
    10039 NEXT I

    10040 DATA 80,C0,E0,3F,3F,3F,2F,30
    10050 DATA 01,03,07,FC,E8,F8,F8,38
    10060 DATA C0,E0,3F,38,1E,07,00,00
    10070 DATA 03,06,0C,3C,70,C0,00,00
    10080 DATA 80,C0,C0,E0,0F,3C,1C,05
    10090 DATA FF,FF,FF,FF,FF,FF,FF,40
    10100 DATA 00,00,00,00,00,0E,0F,CA
    10110 DATA 07,3F,7C,C0,C0,C0,C0,80
    10120 DATA C0,F0,3E,07,03,00,00,00
    10130 DATA FF,FF,01,03,F0,CE,00,00
    10140 DATA 0F,78,C0,C0,00,00,00,00
    10150 DATA C0,C0,C3,C3,27,24,3C,18
    10160 DATA 01,01,01,33,B7,FC,C0,00
    10170 DATA 3C,3C,36,14,1C,00,00,00
    10180 DATA C1,C1,C1,C1,C1,C3,66,24
    10190 DATA 88,8C,C4,E3,E1,E1,0F,0F
    10200 DATA 03,03,07,F8,F8,98,98,70
    10210 DATA C0,C0,E7,3C,00,00,00,00
    10220 DATA 03,67,BC,00,00,00,00,00
    10230 DATA 81,E7,3C,00,00,00,00,00
    10240 DATA 38,6C,38,00,00,00,00,0F
    10250 DATA 18,3C,08,00,00,00,00,F0
    10260 DATA FF,8C,00,00,00,00,00,00
    10270 DATA 38,7C,18,00,00,00,00,00
    10280 DATA 60,B0,60,00,00,00,00,0A
    10290 DATA 07,0C,07,00,00,00,00,00
    10300 DATA 61,96,0C,00,00,00,00,00
    10310 DATA FF,CD,00,00,00,00,00,00
    10320 DATA FF,99,00,00,00,00,00,00
    10330 DATA 10,38,24,18,00,00,00,00
    10340 DATA F8,78,38,7C,38,18,00,01
    10350 DATA 3E,0C,E1,1F,0E,00,00,80
    10360 DATA 1C,07,03,00,00,00,80,88
    10370 DATA E0,E0,C0,00,00,00,21,21
    10380 DATA 00,00,00,00,00,00,80,80
    10390 DATA 00,00,00,00,00,00,10,10
    10400 DATA 03,00,00,00,00,00,00,40
    10410 DATA C8,77,03,00,00,00,00,04
    10420 DATA 70,E0,80,00,00,00,18,C3
    10430 DATA 00,00,00,00,00,00,03,07
    10440 DATA 00,00,00,00,00,00,C0,E0
    10450 DATA 00,00,00,00,00,00,00,FF
    10460 DATA 00,00,00,00,00,00,00,FF
    10470 DATA 18,00,00,00,00,00,00,FF
    10480 DATA 00,00,00,00,00,00,00,FF
    10490 DATA 00,00,00,00,00,00,00,FF
    10500 DATA 1C,0C,00,00,00,00,00,FF
    10510 DATA 07,07,03,03,03,02,03,FF
    10520 DATA 30,30,C0,C0,60,80,80,FF
    10530 DATA 07,1F,3D,7F,FF,F7,FF,FF
    10540 DATA F8,FF,B7,FB,EF,FF,FF,FF
    10550 DATA 00,80,C0,E1,FF,3F,00,00
    10560 DATA 3C,7E,FF,EF,F7,7F,00,00
    10570 DATA FF,FF,BF,EE,E7,FF,00,00
    10580 DATA 80,E0,FC,7E,FF,FF,00,00
    10590 DATA 00,00,00,00,C4,DE,01,01
    10600 DATA 1F,17,3F,3F,7F,5F,80,80
    10610 DATA 00,C0,40,E0,B8,FE,00,00
    10620 DATA 00,00,01,07,0F,1B,00,00
    10630 DATA 00,00,06,9E,DF,6F,00,00
    10640 DATA 0F,1F,17,3F,3F,7F,00,00
    10650 DATA 80,E0,F1,FB,FB,FF,00,00
    10660 DATA 1F,FF,BF,FB,FF,FE,80,80
    10670 DATA 60,B0,F8,EC,FE,FE,00,00
    10680 DATA 0C,00,22,00,00,00,04,00
    10690 DATA 20,00,00,88,00,00,0C,84
    10700 DATA 20,10,80,00,28,00,28,00
    10710 DATA 23,00,88,00,20,04,40,10
    10720 DATA 40,08,20,00,00,00,00,02
    10730 DATA 04,00,60,00,04,00,00,40
    10740 DATA 81,80,C3,C3,C3,C3,C3,C3
    10750 DATA F0,E0,C0,80,F0,0F,0F,F0
    10760 DATA 0F,07,03,01,0F,F0,F0,0F
    10770 DATA FF,FF,F8,C3,FF,FF,FF,FF
    10780 DATA FF,1F,7F,FF,FF,FF,FF,FF
    10790 DATA FF,DF,DF,EF,E3,FB,FF,FF
    10800 DATA FB,FB,FF,FF,FF,FF,FF,FF
    10810 DATA FF,FF,1F,FF,FF,FF,FF,FF
    10820 DATA FF,FF,FF,FF,FF,7F,FF,FF
    10830 DATA FF,1F,FF,FF,FF,FF,FF,FF
    10840 DATA FF,EF,F9,FD,FF,FF,FF,F7
    10850 DATA FF,FF,FB,FF,FF,FF,FF,F7
    10860 DATA FF,FF,FF,FF,FF,EF,FF,FF
    10870 DATA 00,00,00,71,FD,DF,00,00
    10880 DATA 00,80,E0,A0,F0,7D,00,00
    10890 DATA 00,00,00,00,F1,FF,00,60
    10900 DATA 00,00,00,01,01,00,03,07
    10910 DATA 0F,1E,FD,FB,F7,FF,FF,FD
    10920 DATA FC,FB,DF,EE,FF,FB,BF,9F
    10930 DATA 00,00,00,00,00,00,E0,F0
    10940 DATA 00,00,00,01,03,03,01,07
    10950 DATA 0F,0F,57,FB,DD,FF,9F,BF
    10960 DATA 00,00,80,C0,C0,E0,70,98
    10970 DATA 03,03,07,07,0F,0F,1D,1F
    10980 DATA F0,FC,BD,FF,DF,FF,F7,FF
    10990 DATA 00,00,00,00,80,40,E0,E0
    11000 DATA 84,84,10,00,80,00,00,00
    11010 DATA 84,84,80,00,01,00,00,00
    11020 DATA FF,48,5A,04,00,00,00,00
    11030 DATA 90,84,94,02,00,00,00,00
    11040 DATA 42,50,10,00,00,00,00,00
    11050 DATA 48,08,48,00,00,00,00,00
    11060 DATA 3C,00,81,C3,E7,00,00,00
    11070 DATA C0,E0,F0,F8,FC,00,00,00
    11080 DATA 03,07,0F,1F,3F,00,00,00
    11090 DATA 7F,03,FF,FF,FF,00,00,00
    11100 DATA F3,FF,FF,FF,FF,00,00,00
    11110 DATA F3,F7,FF,FF,FF,00,00,00
    11120 DATA FB,FF,FF,FF,FF,00,00,00
    11130 DATA FF,FB,FF,FF,FF,00,00,00
    11140 DATA FF,FF,FF,FF,FF,00,00,00
    11150 DATA E7,FF,FF,FF,FF,00,00,00
    11160 DATA FF,DF,FF,FF,FF,00,00,00
    11170 DATA FF,FF,FF,FF,FF,00,00,00
    11180 DATA FF,FF,FF,FF,FF,00,00,00
    11190 DATA 03,0F,0D,0F,1B,00,00,00
    11200 DATA 00,C3,E7,E7,EF,00,00,00
    11210 DATA E0,F0,D8,FC,DF,00,00,00
    11220 DATA 0F,3D,3F,FF,FF,00,00,00
    11230 DATA 77,FF,E7,EF,FF,00,00,00
    11240 DATA EF,FF,FC,FF,FF,00,00,00
    11250 DATA 78,FC,FE,DF,FF,00,00,00
    11260 DATA 07,1F,1D,3B,FF,00,00,00
    11270 DATA 7D,EF,FF,BF,FF,00,00,00
    11280 DATA A8,DE,EE,FF,FF,00,00,00
    11290 DATA 3B,37,2F,7F,FF,00,00,00
    11300 DATA FB,DF,F7,FF,FF,00,00,00
    11310 DATA B0,98,F8,F6,FF,00,00,00
    11320 DATA 00,00,00,00,00,00,00,00
    11330 DATA 00,00,00,00,00,00,00,00
    11340 DATA 00,00,00,00,00,00,00,00
    11350 DATA 00,00,00,00,00,00,00,00
    11360 DATA 00,00,00,00,00,00,00,00
    11370 DATA 00,00,00,00,00,00,00,00
    11380 DATA 00,00,00,00,00,00,00,00
    11390 DATA 00,00,00,00,00,00,00,00
    11400 DATA 00,00,00,00,00,00,00,00
    11410 DATA 00,00,00,00,00,00,00,00
    11420 DATA 00,00,00,00,00,00,00,00
    11430 DATA 00,00,00,00,00,00,00,00
    11440 DATA 00,00,00,00,00,00,00,00
    11450 DATA 00,00,00,00,00,00,00,00
    11460 DATA 00,00,00,00,00,00,00,00
    11470 DATA 00,00,00,00,00,00,00,00
    11480 DATA 00,00,00,00,00,00,00,00
    11490 DATA 00,00,00,00,00,00,00,00
    11500 DATA 00,00,00,00,00,00,00,00
    11510 DATA 00,00,00,00,00,00,00,00
    11520 DATA 00,00,00,00,00,00,00,00
    11530 DATA 00,00,00,00,00,00,00,00
    11540 DATA 00,00,00,00,00,00,00,00
    11550 DATA 00,00,00,00,00,00,00,00
    11560 DATA 00,00,00,00,00,00,00,00
    11570 DATA 00,00,00,00,00,00,00,00
    11580 DATA 00,00,00,00,00,00,00,00
    11590 DATA 00,00,00,00,00,00,00,00
    11600 DATA 00,00,00,00,00,00,00,00
    11610 DATA 00,00,00,00,00,00,00,00
    11620 DATA 00,00,00,00,00,00,00,00
    11630 DATA 00,00,00,00,00,00,00,00

    1 'Definición de colores, los colores se definen a partir de la dirección 8192/&h2000'
    1 'Como la memoria se divide en 3 bancos, la parte de arriba en medio y la de abajo hay que ponerlos en 3 partes'
    13000 restore 17740:FOR I=0 TO (160*8)-1
        13010 READ A$
        13020 VPOKE 8192+I,VAL("&H"+A$): '&h2000'
        13030 VPOKE 10240+I,VAL("&H"+A$): '&h2800'
        13040 VPOKE 12288+I,VAL("&H"+A$): ' &h3000'
    13050 NEXT I
    13060 call turbo off
    17740 DATA 9A,9A,6A,A1,A1,A1,A1,9A
    17750 DATA 9A,9A,6A,A1,A1,A1,A1,81
    17760 DATA 9A,8A,A1,9A,61,61,61,61
    17770 DATA 9A,8A,9A,61,61,61,61,61
    17780 DATA 6A,6A,6A,6A,A1,61,61,61
    17790 DATA A1,A1,A1,A1,A1,A1,A1,BA
    17800 DATA BA,BA,BA,BA,BA,BA,9A,98
    17810 DATA 9A,9A,61,91,81,61,61,91
    17820 DATA 9A,9A,61,91,61,61,61,61
    17830 DATA A1,A1,9A,9A,89,61,61,61
    17840 DATA 6A,81,91,61,61,61,61,61
    17850 DATA 6A,6A,6A,6A,61,61,61,61
    17860 DATA 6A,6A,6A,6A,6A,61,61,61
    17870 DATA A6,A6,61,61,61,61,61,61
    17880 DATA 6A,6A,6A,6A,6A,6A,61,61
    17890 DATA 6A,6A,6A,6A,6A,6A,A1,A1
    17900 DATA 6A,6A,6A,A1,A1,61,61,61
    17910 DATA 6A,6A,6A,61,61,61,61,61
    17920 DATA 6A,6A,61,61,61,61,61,61
    17930 DATA 6A,6A,61,61,61,61,61,61
    17940 DATA A6,61,61,61,61,61,61,E1
    17950 DATA A6,61,61,61,61,61,61,E1
    17960 DATA 61,61,61,61,61,61,61,61
    17970 DATA B6,61,61,61,61,61,61,61
    17980 DATA B6,61,61,61,61,61,61,E1
    17990 DATA B6,61,61,61,61,61,61,61
    18000 DATA 6B,61,61,61,61,61,61,61
    18010 DATA 61,61,61,61,61,61,61,61
    18020 DATA 61,61,61,61,61,61,61,61
    18030 DATA AB,B6,61,61,61,61,61,61
    18040 DATA B6,B6,B6,61,61,61,61,E1
    18050 DATA B6,AB,6B,61,61,61,61,E1
    18060 DATA 81,91,81,81,81,81,61,8B
    18070 DATA A1,91,81,81,81,81,61,8B
    18080 DATA 11,11,11,11,11,11,61,8B
    18090 DATA 11,11,11,11,11,11,61,8B
    18100 DATA 61,61,61,61,61,61,61,8B
    18110 DATA 6A,61,61,61,61,61,61,8B
    18120 DATA 61,61,61,61,61,61,A1,BA
    18130 DATA 11,11,11,11,11,11,A1,AB
    18140 DATA 11,11,11,11,11,11,A1,AB
    18150 DATA 11,11,11,11,11,11,11,E1
    18160 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18170 DATA 61,61,61,61,61,61,61,E1
    18180 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18190 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18200 DATA 61,61,61,61,61,61,61,E1
    18210 DATA A1,A1,A1,A1,A1,61,81,E1
    18220 DATA 61,61,A1,A1,61,A1,81,E1
    18230 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18240 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18250 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18260 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18270 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18280 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18290 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18300 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18310 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18320 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18330 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18340 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18350 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18360 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18370 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18380 DATA 8B,8B,6B,6B,6B,6B,8B,8B
    18390 DATA 8B,8B,8B,6B,6B,6B,8B,8B
    18400 DATA 8B,6B,6B,6B,6B,6B,8B,8B
    18410 DATA 8B,8B,6B,6B,6B,6B,8B,8B
    18420 DATA 8B,6B,6B,6B,6B,6B,6B,8B
    18430 DATA 8B,8B,6B,6B,6B,6B,6B,8B
    18440 DATA BA,BA,A9,A9,A9,A9,A9,A9
    18450 DATA BA,BA,BA,BA,A9,BA,BA,A8
    18460 DATA BA,BA,BA,BA,A9,BA,BA,A8
    18470 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18480 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18490 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18500 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18510 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18520 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18530 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18540 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18550 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18560 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18570 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18580 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18590 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18600 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18610 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18620 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18630 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18640 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18650 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18660 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18670 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18680 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18690 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18700 DATA 8B,8B,8B,8B,6B,11,11,11
    18710 DATA 8B,8B,8B,8B,6B,11,11,11
    18720 DATA B1,8B,8B,6B,6B,11,11,11
    18730 DATA 8B,8B,8B,6B,6B,11,11,11
    18740 DATA 8B,8B,8B,8B,8B,11,11,11
    18750 DATA 8B,6B,8B,8B,8B,11,11,11
    18760 DATA BA,BA,BA,BA,BA,11,11,11
    18770 DATA BA,BA,BA,BA,BA,11,11,11
    18780 DATA BA,BA,BA,BA,BA,11,11,11
    18790 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18800 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18810 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18820 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18830 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18840 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18850 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18860 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18870 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18880 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18890 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18900 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18910 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18920 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18930 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18940 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18950 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18960 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18970 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18980 DATA E1,E1,E1,E1,E1,E1,E1,E1
    18990 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19000 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19010 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19020 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19030 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19040 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19050 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19060 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19070 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19080 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19090 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19100 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19110 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19120 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19130 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19140 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19150 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19160 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19170 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19180 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19190 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19200 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19210 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19220 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19230 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19240 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19250 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19260 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19270 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19280 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19290 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19300 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19310 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19320 DATA E1,E1,E1,E1,E1,E1,E1,E1
    19330 DATA E1,E1,E1,E1,E1,E1,E1,E1

19990 return


1 'Rutina borrar pantalla'
1 'Ponemos que en la parte del mapa solo se vea el ultimo tile, dejamos el 3 tercio sin tocar para el marcador
1 'en realidad la tabla de nombres son 768 bytes'
    20000 FOR t=6144 TO (6144+768)-97
        20010 vpoke t,255
    20020 next t
20090 return

1 'Cargar array con compresión RLE-16'
    20200 call turbo on (m())
    20205 for r=0 to 12
        20210 READ mp$:po=0
        20220 for c=0 to len(mp$) step 4
            1 'El 1 valor indica la cantidad de repeticiones, el 2 el valor en si'
            20230 r$=mid$(mp$,c+1,2)
            20240 tn$=mid$(mp$,c+3,2)
            20250 tn=val("&h"+tn$):tn=tn-1
            20260 re=val("&h"+r$)
            20270 for i=0 to re
                20280 m(po,r)=tn:po=po+1
            20300 next i
        20310 next c
    20320 next r
    20325 call turbo off
20390 return


1 ' Scroll tercio inferior
    20600 _TURBO ON (m(),n)
    1 'Fila 0:6144, 1: 6176, 2: 6208, 3. 6240, 4: 6272, 5: 6304, 6: 6336, 7: 6368, 8: 6400'
    1 '6144+(32*8 filas)=6400'
    1 '20605 d1=6144+(32*2)
    1 '20605 d1=6208
    1 '20610 d2=6144+(32*7)
    20610 d2=6400
    1 '20620 for r=2 to 5
    20620 for r=8 to 11
        20630 for c=n to 31+n
            1 '20635 VPOKE d1,m(c,r):d1=d1+1
            1 '20640 VPOKE d2,m(c,r+6):d2=d2+1
            20640 VPOKE d2,m(c,r):d2=d2+1
        20650 next c
    20660 next r
    20670 _TURBO OFF
20690 return 

1 ' Pintar toda la pantalla
    20800 _TURBO ON (m())
    20810 d=6144
    20820 for r=0 to 12
        1 ' Ahora leemos las columnas c hasta 32, (recuerda que para en la 88 que es 120-32)
        20830 for c=0 to 31
            20840 VPOKE d,m(c,r):d=d+1
        20850 next c
    20860 next r
    20870 _TURBO OFF
20890 return 

1 'Level 0'
21000 data 7741
21010 data 7741
21020 data 0000054104000341040008410400084106000010001104000341010003410b00044106000541040007410800
21030 data 020000100011060000050006000700080400001000110e000009000a000b0900003000310400000500060007000812000009000a000b0800000500060007000808000009000a000b0a00
21040 data 02000030003106000025002600270028040000300031220000250026002700281e0000250026002700281600
21050 data 7700
21060 data 7700
21070 data 7700
21080 data 0700005700580059005a0c00005b005c005d0800005700580059005a0a00005b005c005d0900005700580059005a0300005e005f00600900005b005c005d0900005700580059005a005e005f00600700005700580059005a0100
21090 data 0100005b005c005d0200007700780079007a0200005e005f00600600007b007c007d0800007700780079007a0a00007b007c007d0900007700780079007a0300007e007f008006000039003a0000007b007c007d0900007700780079007a007e007f00800700007700780079007a0100
21100 data 0100007b007c007d000006710100007e007f008000000039003a0039003a010003710000003200330034003500360037067101000039003a0200047101000032003300340035003600370000047100000039003a0000027100320033003400350036003709710100003b003c003d003e0871030007710000
21110 data 7771
21120 data 7771


