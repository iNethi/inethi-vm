#!/bin/sh

docker network create web
sudo mkdir /mnt/data/
sudo mkdir /mnt/data/splash-nginx/
sudo mkdir /mnt/data/smokeping/

cd ./traefik
./local_build.sh
cd ..
cd ./netdata
./local_build.sh
cd ..
cd ./nginx
./local_build.sh
cd ..
cd ./smokeping
./local_build.sh
cd ..
