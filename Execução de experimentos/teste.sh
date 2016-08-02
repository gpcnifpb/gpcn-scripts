#!/bin/sh

for i in `seq 1 6`
do

sshpass -p 'debian01' ssh root@192.168.0.$i 'ls -l'

done
