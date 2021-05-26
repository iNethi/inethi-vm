#!/bin/sh

cd ./traefik
docker-compose down
cd ..
cd ./nginx-traefik
docker-compose down
cd ..
