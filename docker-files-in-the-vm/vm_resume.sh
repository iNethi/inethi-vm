#!/bin/sh

cd ./nginx-traefik
./local_build.sh
cd ..
cd ./traefik
./local_build.sh
cd ..
