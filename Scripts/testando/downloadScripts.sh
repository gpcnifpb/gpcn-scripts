#!/bin/bash

# Setting default values
cn=1
sn=1

key=$1

case $key in
	-cn| --client-number)
		cn=$2
		shift
		;;
	-sn| --slave-number)
		sn=$2
		shift
		;;
esac

# Sending client.sh to clients
for i in `seq 1 $cn`
do
	sudo sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/client.sh root@192.168.0.$i:/gpcn/clientes/scripts/
done


# Sending slave.sh to atacantes
sn=$((sn+6))
for j in `seq 7 $sn`
do
	sudo sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/slave.sh root@192.168.0.$j:/gpcn/atacante/scripts/
done

# Sending atacado.sh to atacados
sudo sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/atacado.sh root@192.168.0.200:/gpcn/atacado/scripts/

# Sending monitrado.sh to monitorados
sudo sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/monitorado.sh root@192.168.10.201:/gpcn/monitorado/scripts/
