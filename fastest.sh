#!/bin/bash

FASTEST_TIME=5000
FASTEST_SERVER=""

echo "Checking which vpn is the fastest now..."

while read LINE
do
  if [[ $LINE != !* ]]; then
    SPEED=`ping -c 4 $LINE | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|'`
    INT_SPEED=${SPEED/.*}
    echo "$LINE has an average response time of $INT_SPEED ms"
    if [[ $INT_SPEED -le $FASTEST_TIME ]]; then
      FASTEST_TIME=$INT_SPEED
      FASTEST_SERVER=$LINE
    fi
  fi
done < servers

echo "The fastest server is $FASTEST_SERVER with $FASTEST_TIME ms"

sed "s/##SERVER##/$FASTEST_SERVER/g" template.ovpn > output

echo "Connecting to $FASTEST_SERVER ..."

sudo openvpn output
