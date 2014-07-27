#!/bin/bash

FASTEST_TIME=5000
FASTEST_SERVER=""

while read LINE
do
  if [[ $LINE != !* ]]; then
    SPEED=`ping -c 1 $LINE | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|'`
    INT_SPEED=${SPEED/.*}
    if [[ $INT_SPEED -le $FASTEST_TIME ]]; then
      FASTEST_TIME=$INT_SPEED
      FASTEST_SERVER=$LINE
      echo "New fastest server is $FASTEST_SERVER with $INT_SPEED ms"
    fi
  fi
done < servers

sed "s/##SERVER##/$FASTEST_SERVER/g" template.ovpn > output

sudo openvpn output
