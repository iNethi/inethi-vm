#!/bin/sh

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
