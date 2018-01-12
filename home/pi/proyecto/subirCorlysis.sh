#!/bin/bash

TEMP=`/home/pi/proyecto/rele/dht_proyecto`
LDR=`/home/pi/proyecto/practica3/scriptldr.sh`
SONIDO=`/home/pi/proyecto/sonido/sonidoOK.py`
HUMEDADAIRE=`/home/pi/proyecto/rele/dht_humedad`
PLACE=clase112
TOKEN=4822f88526bb41ab426425f08c8833a3

CANTLUZ=`expr 2400 - $LDR`
CANTLUZ1=`expr $CANTLUZ \* 100`
CANTLUZ2=`expr $CANTLUZ1 / 2350`

#echo $TEMP
echo $LDR
#echo $SONIDO
#echo $HUMEDADAIRE
echo $CANTLUZ2

curl -i -XPOST 'https://corlysis.com:8086/write?db=Proyecto_IoT' -u token:$TOKEN --data-binary "TEMPERATURA,place=$PLACE value=$TEMP"
curl -i -XPOST 'https://corlysis.com:8086/write?db=Proyecto_IoT' -u token:$TOKEN --data-binary "LDR,place=$PLACE value=$CANTLUZ2"
curl -i -XPOST 'https://corlysis.com:8086/write?db=Proyecto_IoT' -u token:$TOKEN --data-binary "SONIDO,place=$PLACE value=$SONIDO"
curl -i -XPOST 'https://corlysis.com:8086/write?db=Proyecto_IoT' -u token:$TOKEN --data-binary "HUMEDADAIRE,place=$PLACE value=$HUMEDADAIRE"
