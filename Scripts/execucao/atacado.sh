#!/bin/sh
COUNT=0
RODADA=$1

collectl -sscmn -P -f /gpcn/atacado/logs/collectl/$RODADA &

while [ $COUNT != 840 ]
do
netstat -taupen | grep 80 | wc -l >> /gpcn/atacado/logs/netstat/socket_$RODADA.log
sleep 1
COUNT=$((COUNT+1))
done

killall collectl
killall atacado.sh
