#!/bin/sh

# Descrição:
#   Extrai dados dos logs do sysbench do servidor monitorado (ou seja,
#   vizinho do atacado)
# Como usar:
#    Atualmente utilizado dentro de monitorado/sysbench
#
# Resultado:
#   17 arquivos
#

# TODO 1 - Fazer do 0

for i in `seq 1 30`
do
# sed -n 'Np' origem >> destiono
# -n -> Ignora todas as outras linhas
# Np -> Onde N é um número inteiro que indica a linha que o sed deve exibir na tela
# Ou seja o sed imprime apenas a linha indicada por N e salva no final do arquivo
# de destino.
sed -n '1p' disk_"$i"_AT.log >> Op_perform_Read.log
sed -n '2p' disk_"$i"_AT.log >> Op_perform_Write.log
sed -n '3p' disk_"$i"_AT.log >> Op_perform_Other.log
sed -n '4p' disk_"$i"_AT.log >> Op_perform_total.log
sed -n '5p' disk_"$i"_AT.log | awk '{print substr($1,1,6)}' >> Read_Mb.log
sed -n '6p' disk_"$i"_AT.log | rev | awk '{print substr($1,3,6)}' | rev >> Written_Mb.log
sed -n '7p' disk_"$i"_AT.log | awk '{print substr($1,1,6)}' >> Total_Transferred_Mb.log
sed -n '8p' disk_"$i"_AT.log | awk '{print substr($1,1,5)}' >> Total_Mb-sec.log
sed -n '9p' disk_"$i"_AT.log  >> Requests-sec_exec.log
sed -n '10p' disk_"$i"_AT.log | awk '{print substr($1,1,6)}' >> Exec_total_time.log
sed -n '11p' disk_"$i"_AT.log >> total_number_events.log
sed -n '12p' disk_"$i"_AT.log >> time_taken_events_exec.log
sed -n '13p' disk_"$i"_AT.log | awk '{print substr($1,1,4)}' >> stats_min.log
sed -n '14p' disk_"$i"_AT.log | awk '{print substr($1,1,4)}' >> stats_avg.log
sed -n '15p' disk_"$i"_AT.log | awk '{print substr($1,1,5)}' >> stats_max.log
sed -n '16p' disk_"$i"_AT.log | awk '{print substr($1,1,4)}' >> stats_approx.log
sed -n '17p' disk_"$i"_AT.log  >> threads_events_avg_stddev.log
sed -n '18p' disk_"$i"_AT.log  >> threads_exec_time_avg_stddev.log

done
