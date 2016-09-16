#!/bin/bash
###################################################################
# Script para checar se o ambiente está configurado corretamente! #
# Data: 13/09/2016        										  #
# Autor: Leandro Almeida										  #
###################################################################



# Testar se os diretórios corretos existem nos Clientes

if [ ! -d '/gpcn/clientes/scripts' ]
 then
    echo "O diretório /gpcn/clientes/scripts não existe!"
    echo "Criando diretório /gpcn/clientes/scripts"
    mkdir -p /gpcn/clientes/scripts > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/clientes/scripts criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/clientes/scripts já existe!"
 fi

 if [ ! -d '/gpcn/clientes/logs/ping' ]
 then
    echo "O diretório /gpcn/clientes/logs/ping/ não existe!"
    echo "Criando diretório /gpcn/clientes/logs/ping/"
    mkdir -p /gpcn/clientes/logs/ping/ > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/clientes/logs/ping/ criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/clientes/logs/ping/ já existe!"
 fi


 if [ ! -d '/gpcn/clientes/logs/siege' ]
 then
    echo "O diretório /gpcn/clientes/logs/siege/ não existe!"
    echo "Criando diretório /gpcn/clientes/logs/siege/"
    mkdir -p /gpcn/clientes/logs/siege/ > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/clientes/logs/siege/ criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/clientes/logs/siege/ já existe!"
 fi


cp ./checklist-clientes.sh /gpcn/clientes/scripts

 # Testa se o Siege está instalado no Cliente
siege --version > /dev/null 2> /dev/null

 if [ $? -eq 0 ]
    then
       echo "Siege instalado no Cliente"
    else
        echo "Siege não instalado no Cliente"
 fi


 # Testa se o TCPDUMP está instalado no Cliente
tcpdump -h > /dev/null 2> /dev/null

 if [ $? -eq 0 ]
    then
       echo "Tcpdump instalado no Cliente"
    else
        echo "Tcpdump não instalado no Cliente"
 fi
