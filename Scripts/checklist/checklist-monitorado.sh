#!/bin/bash
###################################################################
# Script para checar se o ambiente está configurado corretamente! #
# Data: 13/09/2016        										  #
# Autor: Leandro Almeida										  #
###################################################################



# Testar se os diretórios corretos existem no Monitorado

if [ ! -d '/gpcn/monitorado/scripts' ]
 then
    echo "O diretório /gpcn/monitorado/scripts não existe!"
    echo "Criando diretório /gpcn/monitorado/scripts"
    mkdir -p /gpcn/monitorado/scripts > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/monitorado/scripts criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/monitorado/scripts já existe!"
 fi

if [ ! -d '/gpcn/monitorado/logs/collectl' ]
 then
    echo "O diretório /gpcn/monitorado/logs/collectl não existe!"
    echo "Criando diretório /gpcn/monitorado/logs/collectl"
    mkdir -p /gpcn/monitorado/logs/collectl > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/monitorado/logs/collectl criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/monitorado/logs/collectl já existe!"
 fi


if [ ! -d '/gpcn/monitorado/logs/netstat' ]
 then
    echo "O diretório /gpcn/monitorado/logs/netstat não existe!"
    echo "Criando diretório /gpcn/monitorado/logs/netstat"
    mkdir -p /gpcn/monitorado/logs/netstat > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/monitorado/logs/netstat criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/monitorado/logs/netstat já existe!"
 fi

# Testa se o Collectl está instalado no Monitorado
collectl -v > /dev/null 2> /dev/null

 if [ $? -eq 0 ]
    then
       echo "Collectl instalado no Monitorado"
    else
        echo "Collectl não instalado no Monitorado"
 fi

# Testa se o Sysbench está instalado no Monitorado
sysbench -v > /dev/null 2> /dev/null

 if [ $? -eq 0 ]
    then
       echo "Sysbench instalado no Monitorado"
    else
        echo "Sysbench não instalado no Monitorado"
 fi
