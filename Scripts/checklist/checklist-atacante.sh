#!/bin/bash
###################################################################
# Script para checar se o ambiente está configurado corretamente! #
# Data: 13/09/2016        										  #
# Autor: Leandro Almeida										  #
###################################################################



# Testar se os diretórios corretos existem nos Atacantes

if [ ! -d '/gpcn/atacante/scripts' ]
 then
    echo "O diretório /gpcn/atacante/scripts não existe!"
    echo "Criando diretório /gpcn/atacante/scripts"
    mkdir -p /gpcn/atacante/scripts > /dev/null

    if [ $? -eq 0 ]
    then
       echo "Diretório /gpcn/atacante/scripts criado com sucesso !"
    fi
 	else
 		echo "Diretório /gpcn/atacante/scripts já existe!"
 fi


cp ./checklist-atacante.sh /gpcn/atacante/scripts

# Testa se o t50 está instalado no Atacante
t50 --version > /dev/null

 if [ $? -eq 0 ]
    then
       echo "T50 instalado no Atacante"
    else
        echo "T50 não instalado no Atacante"
 fi
