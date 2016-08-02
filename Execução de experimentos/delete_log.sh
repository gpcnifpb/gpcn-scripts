#!/bin/sh

for i in `seq 1 6`
do
sshpass -p 'debian01' ssh root@192.168.0.$i 'rm /root/logs/* ;rm /root/log'
done

for i in `seq 7 16`
do
sshpass -p 'debian01' ssh root@192.168.0.$i 'rm /root/log'
done

sshpass -p '321r3d3s' ssh -p 122 root@10.0.24.12 'rm /root/log/netstat/* ; rm /var/www/experimentos/*'
sshpass -p '321r3d3s' ssh -p 122 root@10.0.24.13 'rm /root/log/netstat/* ; rm /root/log/sysbench/* ; rm /var/www/experimentos/*'

echo 'Ouch'
