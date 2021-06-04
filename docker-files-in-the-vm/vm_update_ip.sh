#!/bin/sh

NEWIP=`ifconfig | sed -n '/enp/{n;p}' | grep -E -o 'inet\ [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | grep -E -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'`

echo
echo Set the DNS IP on your machine to: $NEWIP
echo
sudo sed -i "/inethihome/s/.*/address=\/inethihome\.net\/$NEWIP/" /mnt/data/dnsmasq/dnsmasq.conf
echo Restarting dnsmasq docker service ... please wait ...
docker restart inethi-dnsmasq
echo
echo Complete
echo
