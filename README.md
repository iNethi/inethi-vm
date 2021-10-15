# inethi-vm
#### Table of Contents
- [Download the VM](https://github.com/keegan337/inethi-vm#download-here)
- [Description](https://github.com/keegan337/inethi-vm#description)
- [Setup and Usage](https://github.com/keegan337/inethi-vm#setup-and-usage-of-vm)
- [Use the code with no VM](https://github.com/keegan337/inethi-vm#use-this-code-with-no-vm)
- [TO DO](https://github.com/keegan337/inethi-vm#to-do)

## Download here
[Download the Virtual Machine here](https://mega.nz/file/kRZRxKDI#RORrgPjdzakIhuXjco4ZuB_axc9ii9ptpFBRt4WnIQ8).
## Description
Base Ubuntu Virtual Machine (VM) I built to aid development of docker services to be run on the iNethi network. Find the full iNethi docker environment [here](https://github.com/iNethi/docker-master) and find out more about iNethi [here](https://www.inethi.org.za).
## Setup and Usage of VM
There are two ways to utilise the VM. You can do both at the same time.
### Use VM as Standalone Dev Environment
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org). Find [help](https://www.techrepublic.com/article/how-to-export-virtualbox-virtual-machines-as-appliances/) for that task here. Edit the RAM to meet your requirements and make sure your network settings for the VM (this can be edited through the VirtualBox GUI under network) have a bridged adapter connected to the interface that you use to access the internet
2. Start the virtual box and login with username: inethi and password: inethi
3. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of at least 3 containers.
4. Update the dnsmasq.conf file in the /mnt/data/dnsmasq folder. Edit this using ``` sudo nano /mnt/data/dnsmasq/dnsmasq.conf ``` or some equivalent and change the 6th line of this file to read as follows:
  address=/inethihome.net/*the ip address of your server*
Where the 'the ip address of your server' is found using ``` ifconfig ``` or some equivalent. Find the ip address of the interface that you are connecting to your local network with on screen and use this ip address. This can be 'eth0', 'eth1', 'en0', etc. depending on what OS you are running. This is a vital step as the build script has disabled the default dns settings of the VM in order for the dnsmasq docker container to bind to port 53.
5. Restart the dnsmasq docker container
```
docker restart inethi-dnsmasq
```
5. Visit your browser of choice and go to any of the URLs found in the .env file, for example 'splash.inethihome.net' to view the docker container's UI.
### Use Host Machine to View Services
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org). Find [help](https://www.techrepublic.com/article/how-to-export-virtualbox-virtual-machines-as-appliances/) for that task here. Edit the RAM to meet your requirements and make sure your network settings for the VM (this can be edited through the VirtualBox GUI under network) have a bridged adapter connected to the interface that you use to access the internet
2. Start the virtual box and login with username: inethi and password: inethi
3. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of at least 3 containers.
5. Open a terminal on the VM and run ```ifconfig``` to find the IP address of the. Make a note of the IP address returned below
```
cd ~/Desktop/dev/docker
./vm_update_ip.sh
```
6. Open your network interface settings and set the DNS to the address noted in step 5. On a MAc this is done by selecting the Network icon and Network Preferences an then selecting Advanced
7. Ping the IP address noted in step 5. and the URLs from your host machine's terminal to make sure that your DNS entry is working.
8. Visit your browser of choice and go to 'http://splash.inethihome.net' for example to view the docker container's UI.
## Use this code with no VM
This build has been tested on both Ubuntu server and desktop. This is the new architecture that iNethi is adopting. Please make use of it. You can either run the master build script to build all the dockers linked to iNethi or you can build individual dockers that you need. Docker and docker compose need to be installed before running the build script.

Clone the repo
```
git clone https://github.com/keegan337/inethi-vm
```
To build the whole system on a server simply run you can run the build script and follow the instructions displayed on screen. The majority of the process is automatic but there is one manual step. *Before* you run the build script navigate to docker-master/traefik-with-dnsmasq/dnsmasq/dnsmasq.conf and edit the 6th line of this file to read as follows:
  address=/inethihome.net/*the ip address of your server*
Where the 'the ip address of your server' is found using ``` ip a ``` or some equivalent. Find the ip address of the interface that you are connecting to your local network with on screen and use this ip address. This can be 'eth0', 'eth1', 'en0', etc. depending on what OS you are running. This is a vital step as the build script will disable your current dns settings on your device in order for the dnsmasq docker container to bind to port 53. If your system fails to resolve requests following this you may be having errors with the dns servers used by the docker container. These can be changed in the dnsmasq.conf file that has been moved to the /mnt/data/dnsmasq folder. Edit this using ``` sudo nano /mnt/data/dnsmasq/dnsmasq.conf ``` or some equivalent.

Once you have chosen the containers you want to start the build script will create a docker bridge network, download the trafik and dnsmasq docker files and then disable your current dns settings so that the dnsmasq and traefik docker containers can be set up correctly. Following this the rest of the containers will be built.

The build script can be starting by running:
```
sudo ./vm_build_all.sh
```
Note root privileges will be necessary.
```
=======

## TO DO
1. Add music share
