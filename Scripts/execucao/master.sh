#!/bin/sh

ROUNDS=$1
NUMCLIENTS=$2
NUMSLAVES=$3

################# Secao de checagem de rede e diretorios do master #################

# Testar se todas as máquinas estão ligadas e respondendo a ping!

ping -c1 192.168.0.200 > /dev/null

	if [ $? -eq 0 ]
	 then
		echo "Teste de ping para Atacado com sucesso"
	 else
		echo "Teste de ping para Atacado falhou"
		exit

	fi

ping -c1 192.168.10.201 > /dev/null

	if [ $? -eq 0 ]
	 then
		echo "Teste de ping para Monitorado com sucesso"
	else
		echo "Teste de ping para Monitorado falhou"
		exit
	fi

for i in `seq 1 $NUMCLIENTS`
do
	ping -c1 192.168.0.$i > /dev/null

		if [ $? -eq 0 ]
	 	then
			echo "Teste de ping para Cliente "$i" com sucesso"
		else
			echo "Teste de ping para Cliente "$i" falhou"
			exit
		fi
done

for i in `seq $[NUMCLIENTS+1] $[NUMCLIENTS+NUMSLAVES]`
do
	ping -c1 192.168.0.$i > /dev/null

		if [ $? -eq 0 ]
	 	then
			echo "Teste de ping para Atacante "$i" com sucesso"
		else
			echo "Teste de ping para Atacante "$i" falhou"
			exit
		fi
done

# Testar se os diretórios corretos existem no Master

if [ ! -d '/gpcn/master/logs/monitorado/collectl' ]
 then
    echo "O diretório /gpcn/master/logs/monitorado/collectl não existe!"
    echo "Criando diretório /gpcn/master/logs/monitorado/collectl"
    mkdir -p /gpcn/master/logs/monitorado/collectl > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/monitorado/collectl criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/monitorado/collectl já existe!"
 fi

 if [ ! -d '/gpcn/master/logs/monitorado/netstat' ]
 then
    echo "O diretório /gpcn/master/logs/monitorado/netstat não existe!"
    echo "Criando diretório /gpcn/master/logs/monitorado/netstat"
    mkdir -p /gpcn/master/logs/monitorado/netstat > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/monitorado/netstat criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/monitorado/netstat já existe!"
 fi

 if [ ! -d '/gpcn/master/logs/monitorado/sysbench' ]
 then
    echo "O diretório /gpcn/master/logs/monitorado/sysbench não existe!"
    echo "Criando diretório /gpcn/master/logs/monitorado/sysbench"
    mkdir -p /gpcn/master/logs/monitorado/sysbench > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/monitorado/sysbench criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/monitorado/sysbench já existe!"
 fi

if [ ! -d '/gpcn/master/logs/atacado/collectl' ]
 then
    echo "O diretório /gpcn/master/logs/atacado/collectl não existe!"
    echo "Criando diretório /gpcn/master/logs/atacado/collectl"
    mkdir -p /gpcn/master/logs/atacado/collectl > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/atacado/collectl criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/atacado/collectl já existe!"
 fi

if [ ! -d '/gpcn/master/logs/atacado/sysbench' ]
 then
    echo "O diretório /gpcn/master/logs/atacado/sysbench não existe!"
    echo "Criando diretório /gpcn/master/logs/atacado/sysbench"
    mkdir -p /gpcn/master/logs/atacado/sysbench > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/atacado/sysbench criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/atacado/sysbench já existe!"
 fi


for i in `seq 1 $NUMCLIENTS`
do
if [ ! -d "/gpcn/master/logs/clientes/0$i/ping" ]
 then
    echo "O diretório /gpcn/master/logs/clientes/0$i/ping não existe!"
    echo "Criando diretório /gpcn/master/logs/clientes/0$i/ping"
    mkdir -p /gpcn/master/logs/clientes/0$i/ping > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/clientes/0$i/ping criado com sucesso !!!"
    fi
 else
 	echo "Diretório /gpcn/master/logs/clientes/0$i/ping já existe!"
 fi
done

for i in `seq 1 $NUMCLIENTS`
do
if [ ! -d "/gpcn/master/logs/clientes/0$i/siege" ]
 then
    echo "O diretório /gpcn/master/logs/clientes/0$i/siege não existe!"
    echo "Criando diretório /gpcn/master/logs/clientes/0$i/siege"
    mkdir -p /gpcn/master/logs/clientes/0$i/siege > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/logs/clientes/0$i/siege criado com sucesso !!!"
    fi
 else
    echo "Diretório /gpcn/master/logs/clientes/0$i/siege já existe!"
 fi
done

if [ ! -d '/gpcn/master/scripts' ]
	then
	  echo "O diretório /gpcn/master/scripts não existe!"
    echo "Criando diretório /gpcn/master/scripts"
    mkdir -p /gpcn/master/scripts > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/master/scripts criado com sucesso !"
    fi
 else
 		echo "Diretório /gpcn/master/scripts já existe!"
 fi


################# Final de secao de checagem de rede e diretorios do master #################

################# Testar se os diretórios existem no Atacado #################
sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/checklist/checklist-atacado.sh root@192.168.0.200:/root
sshpass -p 'vagrant' ssh root@192.168.0.200 'bash /root/checklist-atacado.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Atacado sendo executado!"
fi

################# Final testar se os diretórios existem no Atacado #################


################# Testar se os diretórios existem no Monitorado #################
sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/checklist/checklist-monitorado.sh root@192.168.10.201:/root
sshpass -p 'vagrant' ssh root@192.168.10.201 'bash /root/checklist-monitorado.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Monitorado sendo executado!"
fi

################# Final testar se os diretórios existem no Monitorado #################


################# Testar se os diretórios existem nos Clientes #################

for i in `seq 1 $NUMCLIENTS`
do
	sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/checklist/checklist-cliente.sh root@192.168.0.$i:/root
	sshpass -p 'vagrant' ssh root@192.168.0.$i 'bash /root/checklist-cliente.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Cliente $i sendo executado!"
fi

done

################# Final testar se os diretórios existem nos Clientes #################


################# Testar se os diretórios existem nos Atacantes #################

for i in `seq $[NUMCLIENTS+1] $[NUMCLIENTS+NUMSLAVES]`
do
	sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/checklist/checklist-atacante.sh root@192.168.0.$i:/root
	sshpass -p 'vagrant' ssh root@192.168.0.$i 'bash /root/checklist-atacante.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Atacante $i sendo executado!"
fi
done

################# Final testar se os diretórios existem nos Atacantes #################


#echo "Informe a quantidade de rodadas que o experimento terá ?"
#read ROUNDS

#while [[ $ROUNDS =~ [a-zA-Z] ]]; do
#    echo "Digite um número inteiro: "
#    read ROUNDS
#done

sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/monitorado.sh root@192.168.10.201:/gpcn/monitorado/scripts
sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/atacado.sh root@192.168.0.200:/gpcn/atacado/scripts


EXP='_SA'

for j in `seq 1 $ROUNDS`
do
sshpass -p 'vagrant' ssh root@192.168.0.200 'bash /gpcn/atacado/scripts/atacado.sh '$j$EXP &
sshpass -p 'vagrant' ssh root@192.168.0.200 'stress-ng --cpu 2 --io 2 --vm 4 --vm-bytes 1G --timeout 840s' &
sshpass -p 'vagrant' ssh root@192.168.10.201 'bash /gpcn/monitorado/scripts/monitorado.sh '$j$EXP &
sshpass -p 'vagrant' ssh root@10.0.4.186 'bash /root/xenserver.sh '$j$EXP &
#echo "OUCH NA SERVER SSHPASS ESPERANDO 35 Segundos"
#Ja tem Sleep nos clientes
#sleep 35

for i in `seq 1 $NUMCLIENTS`
do
sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/client.sh root@192.168.0.$i:/gpcn/clientes/scripts
sshpass -p 'vagrant' ssh root@192.168.0.$i 'bash /gpcn/clientes/scripts/client.sh '$j$EXP &
echo "OUCH $i clients"
done
echo 'OUCH Esperando 1080 segundos'
sleep 1080

done

EXP2='_CA'

for j in `seq 1 $ROUNDS`
do
sshpass -p 'vagrant' ssh root@192.168.0.200 'bash /gpcn/atacado/scripts/atacado.sh '$j$EXP2 &
sshpass -p 'vagrant' ssh root@192.168.0.200 'stress-ng --cpu 2 --io 2 --vm 4 --vm-bytes 1G --timeout 840s' &
sshpass -p 'vagrant' ssh root@192.168.10.201 'bash /gpcn/monitorado/scripts/monitorado.sh '$j$EXP2 &
sshpass -p 'vagrant' ssh root@10.0.4.186 'bash /root/xenserver.sh '$j$EXP2 &
#echo "OUCH NA SERVER SSHPASS ESPERANDO 35 Segundos"
#sleep 35

for i in `seq 1 $NUMCLIENTS`
do
sshpass -p 'vagrant' ssh root@192.168.0.$i 'bash /gpcn/clientes/scripts/client.sh '$j$EXP2 &
echo "OUCH $i clients"
done

for i in `seq $[NUMCLIENTS+1] $[NUMCLIENTS+NUMSLAVES]`
do
sshpass -p 'vagrant' scp /gpcn/git/gpcn-scripts/Scripts/execucao/slave.sh root@192.168.0.$i:/gpcn/atacante/scripts
sshpass -p 'vagrant' ssh root@192.168.0.$i 'bash /gpcn/atacante/scripts/slave.sh' &
echo 'OUCH Esperando 1080 segundos'
done

sleep 1080

done
