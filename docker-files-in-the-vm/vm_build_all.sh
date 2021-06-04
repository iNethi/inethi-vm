#!/bin/bash
echo "Creating data mount folder"
echo
sudo mkdir /mnt/data/

# customize with your own.
options=("nginx(splash)")

menu() {
    echo "iNethi (Traefik) version 0.0.1 builder"
    echo
    echo "Avaliable options:"
    for i in ${!options[@]}; do
        printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
    done
    if [[ "$msg" ]]; then echo "$msg"; fi
}

prompt="Select which iNethi components you want (again to uncheck, ENTER when done): "
while menu && read -rp "$prompt" num && [[ "$num" ]]; do
    [[ "$num" != *[![:digit:]]* ]] &&
    (( num > 0 && num <= ${#options[@]} )) ||
    { msg="Invalid option: $num"; continue; }
    ((num--));
    [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
done

printf "You selected"; msg=" nothing"
for i in ${!options[@]}; do
    [[ "${choices[i]}" ]] && {
        printf " %s" "[${options[i]}]"; msg="";
    }
done

echo "$msg"
printf "Starting to build dockers ... "
echo


printf "Create docker traefik bridge: traefik-bridge ..."
echo
#sudo docker network create --attachable -d bridge --subnet=172.19.0.0/16  inethi-bridge-traefik
#docker network create web
sudo docker network create --attachable -d bridge inethi-bridge-traefik
#
# Build traefik - compulsory docker
printf "Building Traefik docker ... "
    sudo mkdir /mnt/data/traefik
    sudo mkdir /mnt/data/dnsmasq
    cd ./traefik
    sudo cp ./dnsmasq/dnsmasq.conf /mnt/data/dnsmasq
    ./local_build.sh
    cd ..

[[ "${choices[0]}" ]] && {
    printf "Building nginx(splash) docker ... "
    sudo mkdir /mnt/data/traefik-nginx
    cd ./nginx-traefik
    ./local_build.sh
    cd ..
}
