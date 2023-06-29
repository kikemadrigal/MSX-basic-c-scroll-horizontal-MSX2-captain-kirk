#!/bin/bash

APP="main"

#SDCC --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -Lfusion-c/lib/ fusion-c/include/crt0_msxdos.rel ${APP}.c
#./tools/hex2bin/hex2bin.exe -e com ${APP}.ihx
#mv ${APP}.com dsk/
#./tools/openMSX/openmsx.exe -machine Philips_NMS_8255  -diska dsk/ &


echo "Creando el programa para la depuración en linux"
sdasz80 -o ./fusion-c/include/crt0msx_rom.rel ./fusion-c/source/crt0msx_rom.s
sdcc -mz80 --debug --constseg DUMMY -c ${APP}.c -o ${APP}.rel
sdcc -mz80 --debug --constseg DUMMY --no-std-crt0 --code-loc 0x4100 --data-loc 0xc000 --out-fmt-ihx -o ${APP}.ihx fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0msx_rom.rel ${APP}.rel 
./tools/hex2bin/hex2bin.exe -e rom -s 0x4000 -l 0x8000 ${APP}.ihx

#./tools/hex2bin/hex2bin.exe -e rom ${APP}.ihx
#gcc -g fusion-c/lib/fusion.lib -I. ${APP}.c -o ${APP}
./tools/openMSX/openmsx.exe -carta ${APP}.rom -machine Philips_NMS_8255 &
#ddd& --trace --debugger ./openmsxgdb.py ${APP} 2> ddd_openmsx.log


rm -rf *.ihx
rm -rf *.adb
rm -rf *.cdb
rm -rf *.rom

rm -rf *.asm
rm -rf *.lk
rm -rf *.lst
rm -rf *.map
rm -rf *.map
rm -rf *.noi
rm -rf *.rel   
rm -rf *.sym