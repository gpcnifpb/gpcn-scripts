#!/bin/sh
COUNT=0
RODADA=$1

collectl -sscmn -P -f /gpcn/monitorado/logs/collectl/$RODADA &

while [ $COUNT != 840 ]
do
netstat -taupen | grep 80 | wc -l >> /gpcn/monitorado/logs/netstat/socket_$RODADA.log
sleep 1
COUNT=$((COUNT+1))
done


sleep 70
sysbench --test=fileio --num-threads=32 --file-total-size=4G --file-test-mode=rndrw prepare
sleep 10
sysbench --test=cpu --cpu-max-prime=200000 --max-time=120s --num-threads=4 run >> /gpcn/monitorado/logs/sysbench/cpu_$RODADA.log
sleep 10
sysbench --test=fileio --num-threads=16 --file-total-size=2G --file-test-mode=rndrw run >> /gpcn/monitorado/logs/sysbench/disk_$RODADA.log
sleep 10
sysbench --test=memory --memory-block-size=1K --memory-total-size=50G --memory-oper=read run >> /gpcn/monitorado/logs/sysbench/memr_$RODADA.log
sleep 10
sysbench --test=memory --memory-block-size=1K --memory-total-size=50G --memory-oper=write run >> /gpcn/monitorado/logs/sysbench/memw_$RODADA.log
sleep 10
sysbench --test=fileio --num-threads=16 --file-total-size=2G --file-test-mode=rndrw cleanup

killall collectl
