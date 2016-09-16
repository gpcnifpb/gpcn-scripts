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
esac

# Sending client.sh to clients
for i in `seq 1 $cn`
do
	sudo sshpass -p 'vagrant' scp client.sh root@192.168.0.$i:/gpcn/client/scripts
done

# Sending atacado.sh to atacados
sudo sshpass -p 'vagrant' scp atacdo.sh root@192.168.0.200:/gpcn/atacado/scripts

# Sending monitrado.sh to monitorados
sudo sshpass -p 'vagrant' scp monitorado.sh root@192.168.10.201:/gpcn/monitorado/scripts
