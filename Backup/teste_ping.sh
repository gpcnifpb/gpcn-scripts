#!/bin/bash

for i in `seq 1 16`
do
ping 192.168.0.$i -c 1
done

