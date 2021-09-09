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
4. Check that the VM has received an ip address by clicking on the network icon in the top right and seeing "Wired Connected"
5. If you are connected open a terminal on the VM and run (otherwise stop here and fix your connection)
```
cd ~/Desktop/dev/docker
./vm_update_ip.sh
```
5. Visit your browser of choice and go to any of the URLs found in the .env file, for example 'splash.inethihome.net' to view the docker container's UI.
### Use Host Machine to View Services
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org). Find [help](https://www.techrepublic.com/article/how-to-export-virtualbox-virtual-machines-as-appliances/) for that task here. Edit the RAM to meet your requirements and make sure your network settings for the VM (this can be edited through the VirtualBox GUI under network) have a bridged adapter connected to the interface that you use to access the internet
2. Start the virtual box and login with username: inethi and password: inethi
3. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of at least 3 containers.
4. Check that the VM has received an ip address by clicking on the network icon in the top right and seeing "Wired Connected"
5. If you are connected open a terminal on the VM and run (otherwise stop here and fix your connection). Make a note of the IP address returned below
```
cd ~/Desktop/dev/docker
./vm_update_ip.sh
```
6. Open your network interface settings and set the DNS to the address noted in step 5. On a MAc this is done by selecting the Network icon and Network Preferences an then selecting Advanced
7. Ping the IP address noted in step 5. and the URLs from your host machine's terminal to make sure that your DNS entry is working.
8. Visit your browser of choice and go to 'http://splash.inethihome.net' for example to view the docker container's UI.
## Use this code with no VM

1. Clone the repo
```
github clone https://github.com/keegan337/inethi-vm
```
2. Run the build script
```
cd ./docker-files-in-the-vm
./vm_build_all.sh script
./vm_update_ip.sh
```
=======

## TO DO
1. Add music share
2. Add instructions on how to setup a VM without downloading the current one
