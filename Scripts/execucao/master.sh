#!/bin/sh

EXP='_SA'

echo "Informe a quantidade de rodadas que o experimento terá ?"
read rounds

while [[ $rounds =~ [a-zA-Z] ]]; do
    echo "Digite um número inteiro: "
    read rounds
done

for j in `seq 1 $rounds`
do
sshpass -p 'vagrant' ssh root@192.168.0.200 '/gpcn/atacado/scripts/atacado.sh '$j$EXP &
sshpass -p 'vagrant' ssh root@192.168.0.200 'stress-ng --cpu 2 --io 2 --vm 4 --vm-bytes 1G --timeout 840s' &
sshpass -p 'vagrant' ssh root@192.168.10.201 '/gpcn/monitorado/scripts/monitorado.sh '$j$EXP &
#sshpass -p 'vagrant' ssh root@10.0.4.60 '/gpcn/scripts/xenserver.sh '$j$EXP &
#echo "OUCH NA SERVER SSHPASS ESPERANDO 35 Segundos"
#Ja tem Sleep nos clientes
#sleep 35

for i in `seq 1 6`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i '/gpcn/clientes/scripts/client.sh '$j$EXP &
echo "OUCH $i clients"
done
echo 'OUCH Esperando 1080 segundos'
sleep 1080

done

EXP2='_CA'

for j in `seq 1 $rounds`
do
sshpass -p 'vagrant' ssh root@192.168.0.200 '/gpcn/atacado/scripts/atacado.sh '$j$EXP2 &
sshpass -p 'vagrant' ssh root@192.168.0.200 'stress-ng --cpu 2 --io 2 --vm 4 --vm-bytes 1G --timeout 840s' &
sshpass -p 'vagrant' ssh root@192.168.10.201 '/gpcn/monitorado/scripts/monitorado.sh '$j$EXP2 &
#sshpass -p 'vagrant' ssh root@10.0.4.60 '/gpcn/scripts/xenserver.sh '$j$EXP2 &
#echo "OUCH NA SERVER SSHPASS ESPERANDO 35 Segundos"
#sleep 35

for i in `seq 1 6`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i '/gpcn/clientes/scripts/client.sh '$j$EXP2 &
echo "OUCH $i clients"
done

for i in `seq 7 16`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i '/gpcn/atacante/scripts/slave.sh' &
echo 'OUCH Esperando 1080 segundos'
done

sleep 1080

done
