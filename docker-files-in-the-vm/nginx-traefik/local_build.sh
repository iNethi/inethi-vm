#!/bin/sh

sudo mkdir /mnt/data/traefik-nginx
sudo cp -R ./html /mnt/data/traefik-nginx
sudo chmod -R 645 /mnt/data/traefik-nginx
docker-compose up -d
