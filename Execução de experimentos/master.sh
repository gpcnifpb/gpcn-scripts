#!/bin/sh

#$1 ping collectl
sshpass -p '321r3d3s' ssh root@10.0.24.11 -p 122 'stress-ng --cpu 8 --io 8 --vm 16 --float 5 --vm-bytes 1G --timeout 240s -l 100' &
sshpass -p '321r3d3s' ssh root@10.0.24.12 -p 122 '/root/server.sh '$1 &
sshpass -p '321r3d3s' ssh root@10.0.24.12 -p 122 'stress-ng --cpu 2 --io 2 --vm 4 --vm-bytes 1G --timeout 240s' &
sshpass -p '321r3d3s' ssh root@10.0.24.13 -p 122 '/root/server.sh '$1 &
sshpass -p '321r3d3s' ssh root@10.0.24.13 -p 122 '/root/stress.sh '$1 &

sleep 30

for i in `seq 1 6`
do 
sshpass -p 'debian01' ssh root@192.168.0.$i '/root/client.sh '$1 &
done

for i in `seq 7 16`
do
sshpass -p 'debian01' ssh root@192.168.0.$i '/root/slave.sh' &
done
