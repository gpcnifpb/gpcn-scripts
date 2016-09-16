#!/bin/bash
###################################################################
# Script para checar se o ambiente está configurado corretamente! #
# Data: 13/09/2016        										  #
# Autor: Leandro Almeida										  #
###################################################################



# Testar se os diretórios corretos existem no Atacado

if [ ! -d '/gpcn/atacado/scripts' ]
 then
    echo "O diretório /gpcn/atacado/scripts não existe!"
    echo "Criando diretório /gpcn/atacado/scripts"
    mkdir -p /gpcn/atacado/scripts > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/atacado/scripts criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/atacado/scripts já existe!"
 fi

if [ ! -d '/gpcn/atacado/logs/collectl' ]
 then
    echo "O diretório /gpcn/atacado/logs/collectl não existe!"
    echo "Criando diretório /gpcn/atacado/logs/collectl"
    mkdir -p /gpcn/atacado/logs/collectl > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/atacado/logs/collectl criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/atacado/logs/collectl já existe!"
 fi


if [ ! -d '/gpcn/atacado/logs/netstat' ]
 then
    echo "O diretório /gpcn/atacado/logs/netstat não existe!"
    echo "Criando diretório /gpcn/atacado/logs/netstat"
    mkdir -p /gpcn/atacado/logs/netstat > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/atacado/logs/netstat criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/atacado/logs/netstat já existe!"
 fi

# Testa se o Collectl está instalado no Atacado
collectl -v > /dev/null 2> /dev/null 

 if [ $? -eq 0 ]
    then
       echo "Collectl instalado no Atacado"
    else
        echo "Collectl não instalado no Atacado"
 fi
