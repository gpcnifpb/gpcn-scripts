#!/bin/sh

#Ping Atacado
ping 10.0.24.12 >> /root/logs/ping_$1_clt_01_srv_01.txt &

#Ping Nao-Atacado
ping 10.0.24.13 >> /root/logs/ping_$1_clt_01_srv_02.txt &

#Star Siege
siege -c 100 10.0.24.12 &
siege -c 100 10.0.24.13 &

#Espera 4 minutos
sleep 240

#Finaliza os processos do Ping e Siege
killall ping
killall -s SIGINT siege

#Espera aparecer na Tela
sleep 5

echo "1" >> log
