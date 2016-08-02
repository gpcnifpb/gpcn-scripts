#!/bin/sh

for i in `seq 1 6`
do
sshpass -p 'debian01' scp -r root@192.168.0.$i:/root/logs/* /home/ifpb/Documentos/logs_experimentos/clientes/0$i/logs/
done

sshpass -p '321r3d3s' scp -r -P 122 root@10.0.24.12:/var/www/experimentos/* /home/ifpb/Documentos/logs_experimentos/atacado/collectl/
sshpass -p '321r3d3s' scp -r -P 122 root@10.0.24.12:/root/log/netstat/* /home/ifpb/Documentos/logs_experimentos/atacado/netstat/

sshpass -p '321r3d3s' scp -r -P 122 root@10.0.24.13:/var/www/experimentos/* /home/ifpb/Documentos/logs_experimentos/monitorado/collectl/
sshpass -p '321r3d3s' scp -r -P 122 root@10.0.24.13:/root/log/netstat/* /home/ifpb/Documentos/logs_experimentos/monitorado/netstat/
sshpass -p '321r3d3s' scp -r -P 122 root@10.0.24.13:/root/log/sysbench/* /home/ifpb/Documentos/logs_experimentos/monitorado/sysbench/
