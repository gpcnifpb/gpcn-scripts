#!/bin/sh

# Descrição:
#   Trata relativos ao uso de CPU
#   Gera arquivos .log com trechos especificos do .log do sysbench.
#   TODO: Descrever a saída do sysbench.
# Como usar:
#   Deve ser utilizado dentro da pasta logs_experimentos\monitorado\sysbench
#
# Resultado:
#   9 arquivos
#   Cada linha dos 9 arquivos representa um dos logs gerados.
#

# TODO 1 - Deve ser atualizado o arquivo cpu_??_AT.log para cpu_??_NA.log pois remete
# não atacado (NA) e atacado (AT)

# TODO 2 - O head -n 1 não vai pegar a informação correta, existem outras coisas
# na primeira linha o tempo total tem aparecido na 17º linha. Assim como todos
# os outros comandos vão estar incorretos.

for i in `seq 1 30`
do
# Pega a primeira linha do arquivo, tempo total de execução
# dela extrai a string do 1º ao 8º caractere.
head -n 1 cpu_"$i"_AT.log | awk '{print substr($1,1,8)}' >> total_time.log
# Pega a segunda linha de origem e joga para o final do arquivo do destiono
# os comandos a seguir pegam a linha correspondendo ao argumento apos o -n.
# Obs: -n ignora todo o arquivo, fazendo com que o sed repita apenas a linha
# espcifica.
sed -n '2p' cpu_"$i"_AT.log >> totaln_events.log
sed -n '3p' cpu_"$i"_AT.log >> total_time_by_event_exec.log
# o AWK nas 4 linhas abaixo são pra pegar trechos especificos da linha.
sed -n '4p' cpu_"$i"_AT.log | awk '{print substr($1,1,5)}' >> stats_min.log
sed -n '5p' cpu_"$i"_AT.log | awk '{print substr($1,1,5)}' >> stats_avg.log
sed -n '6p' cpu_"$i"_AT.log | awk '{print substr($1,1,6)}' >> stats_max.log
sed -n '7p' cpu_"$i"_AT.log | awk '{print substr($1,1,5)}' >> stats_approx.log
sed -n '8p' cpu_"$i"_AT.log  >> threads_events_avg_stddev.log
sed -n '9p' cpu_"$i"_AT.log  >> threads_exec_time_avg_stddev.log

done
