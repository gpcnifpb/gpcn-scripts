#!/bin/sh

for i in `seq 1 6`
do
sshpass -p 'vagrant' scp -r root@192.168.0.$i:/gpcn/clientes/logs/ping/* /gpcn/master/logs/clientes/0$i/ping/
sshpass -p 'vagrant' scp -r root@192.168.0.$i:/var/log/siege.log /gpcn/master/logs/clientes/0$i/siege/
done

sshpass -p 'vagrant' scp -r root@10.0.4.60:/var/run/sr-mount/dac32a23-2fa2-ca8a-2c33-e9f74828588d/*.cap /home/ifpb/Documentos/logs_experimentos/xenserver/

sshpass -p 'vagrant' scp -r root@192.168.0.200:/gpcn/atacado/logs/collectl/* /gpcn/master/logs/atacado/collectl/
sshpass -p 'vagrant' scp -r root@192.168.0.200:/gpcn/atacado/logs/netstat/* /gpcn/master/logs/atacado/netstat/
#sshpass -p 'vagrant' scp -r root@192.168.0.200:/root/*.cap /gpcn/scripts/logs_experimentos/atacado/tshark/

sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/collectl/* /gpcn/master/logs/monitorado/collectl/
sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/netstat/* /gpcn/master/logs/monitorado/netstat/
sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/sysbench/* /gpcn/master/logs/monitorado/sysbench/
#sshpass -p 'vagrant' scp -r root@192.168.10.201:/root/*.cap /gpcn/scripts/logs_experimentos/monitorado/tshark/
