#!/bin/bash
###################################################################
# Script para checar se o ambiente está configurado corretamente! #
# Data: 13/09/2016        										  #
# Autor: Leandro Almeida										  #
###################################################################



# Testar se todas as máquinas estão ligadas e respondendo a ping!

ping -c1 192.168.0.200 > /dev/null

	if [ $? -eq 0 ]
	 then
		echo "Teste de ping para Atacado com sucesso"
	 else
		echo "Teste de ping para Atacado falhou"

	fi

ping -c1 192.168.10.201 > /dev/null

	if [ $? -eq 0 ]
	 then
		echo "Teste de ping para Monitorado com sucesso"
	else
		echo "Teste de ping para Monitorado falhou"
	fi

for i in `seq 1 1`
do
	ping -c1 192.168.0.$i > /dev/null

		if [ $? -eq 0 ]
	 	then
			echo "Teste de ping para Cliente "$i" com sucesso"
		else
			echo "Teste de ping para Cliente "$i" falhou"
		fi
done

for i in `seq 7 7`
do
	ping -c1 192.168.0.$i > /dev/null

		if [ $? -eq 0 ]
	 	then
			echo "Teste de ping para Atacante "$i" com sucesso"
		else
			echo "Teste de ping para Atacante "$i" falhou"
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


for i in `seq 1 6`
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

for i in `seq 1 6`
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


# Testar se os diretórios existem no Atacado
sshpass -p 'vagrant' ssh root@192.168.0.200 '/gpcn/atacado/scripts/checklist-atacado.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Atacado sendo executado!"
fi

# Testar se os diretórios existem no Monitorado
sshpass -p 'vagrant' ssh root@192.168.10.201 '/gpcn/monitorado/scripts/checklist-monitorado.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Monitorado sendo executado!"
fi
# Testar se os diretórios existem nos Clientes
for i in `seq 1 1`
do
	sshpass -p 'vagrant' ssh root@192.168.0.$i '/gpcn/clientes/scripts/checklist-cliente.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Cliente $i sendo executado!"
fi

done

# Testar se os diretórios existem nos Atacante
for i in `seq 7 7`
do
	sshpass -p 'vagrant' ssh root@192.168.0.$i '/gpcn/atacante/scripts/checklist-atacante.sh' > /dev/null

if [ $? -eq 0 ]
    then
       echo "Checklist no Atacante $i sendo executado!"
fi
done
