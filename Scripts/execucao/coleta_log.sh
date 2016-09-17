#!/bin/sh

for i in `seq 1 6`
do
sshpass -p 'vagrant' scp -r root@192.168.0.$i:/gpcn/clientes/logs/ping/* /gpcn/master/logs/clientes/0$i/ping/
sshpass -p 'vagrant' scp -r root@192.168.0.$i:/var/log/siege.log /gpcn/master/logs/clientes/0$i/siege/
done

sshpass -p 'vagrant' scp -r root@10.0.4.186:/root/vmstat/* /home/ifpb/Documentos/logs_experimentos/xenserver/vmstat/
sshpass -p 'vagrant' scp -r root@10.0.4.186:/root/eth1/* /home/ifpb/Documentos/logs_experimentos/xenserver/eth1/
sshpass -p 'vagrant' scp -r root@10.0.4.186:/root/vif1/* /home/ifpb/Documentos/logs_experimentos/xenserver/vif1/
sshpass -p 'vagrant' scp -r root@10.0.4.186:/root/vif2/* /home/ifpb/Documentos/logs_experimentos/xenserver/vif2/

sshpass -p 'vagrant' scp -r root@192.168.0.200:/gpcn/atacado/logs/collectl/* /gpcn/master/logs/atacado/collectl/
sshpass -p 'vagrant' scp -r root@192.168.0.200:/gpcn/atacado/logs/netstat/* /gpcn/master/logs/atacado/netstat/
#sshpass -p 'vagrant' scp -r root@192.168.0.200:/root/*.cap /gpcn/scripts/logs_experimentos/atacado/tshark/

sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/collectl/* /gpcn/master/logs/monitorado/collectl/
sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/netstat/* /gpcn/master/logs/monitorado/netstat/
sshpass -p 'vagrant' scp -r root@192.168.10.201:/gpcn/monitorado/logs/sysbench/* /gpcn/master/logs/monitorado/sysbench/
#sshpass -p 'vagrant' scp -r root@192.168.10.201:/root/*.cap /gpcn/scripts/logs_experimentos/monitorado/tshark/
