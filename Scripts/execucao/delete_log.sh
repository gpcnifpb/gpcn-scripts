#!/bin/sh

for i in `seq 1 6`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i 'rm /root/logs/* ;rm /root/log ; rm /root/*.cap'
done

for i in `seq 7 16`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i 'rm /root/log'
done

sshpass -p 'vagrant' ssh root@192.168.0.200 'rm /gpcn/atacado/logs/netstat/* ; rm /gpcn/atacado/logs/collectl/*'
sshpass -p 'vagrant' ssh root@192.168.10.201 'rm /gpcn/monitorado/logs/netstat/* ; rm /root/log/sysbench/* ; rm /gpcn/monitorado/logs/collectl/*'

echo 'Ouch'
