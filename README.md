# inethi-vm
## Download here
[Download the Virtual Machine here](https://drive.google.com/drive/folders/18oZQE0x_e755D2oNJ7frNiGfTxlYc2D5?usp=sharing).
## Description
Base Ubuntu Virtual Machine (VM) I built to aid development of docker services to be run on the iNethi network. Find the full iNethi docker environment [here](https://github.com/iNethi/docker-master) and find out more about iNethi [here](https://www.inethi.org.za).
## Setup and Usage of VM
There are two ways to utilise the VM. You can do both at the same time.
### Use VM as Standalone Dev Envirnment
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org). Find [help](https://www.techrepublic.com/article/how-to-export-virtualbox-virtual-machines-as-appliances/) for that task here. Edit the RAM to meet your requirements and make sure your network settings for the VM (this can be edited through the VirtualBox GUI under network) have a bridged adapter connected to the interface that you use to access the internet
2. Start the virtual box and login with username: inethi and password: inethi
3. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of at least 3 containers.
4. Open and edit the /etc/resolv.conf file on the VM and add 'nameserver 127.0.0.1'. This has to be done every time the system is restarted (THIS IS A TO DO).
5. Visit your browser of choice and go to any of the URLs found in the .env file, for example 'splash.inethihome.net' to view the docker container's UI.
### Use Host Machine to View Services
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org). Find [help](https://www.techrepublic.com/article/how-to-export-virtualbox-virtual-machines-as-appliances/) for that task here. Edit the RAM to meet your requirements and make sure your network settings for the VM (this can be edited through the VirtualBox GUI under network) have a bridged adapter connected to the interface that you use to access the internet
2. Start the virtual box and login with username: inethi and password: inethi
3. Open the terminal and run 'ifconfig' to find the IP address of the VM. For example on Mac it may be under enp0s3. Take note of this address.
4. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of at least 3 containers.
5. Open and edit the /etc/resolv.conf file on the VM and add 'nameserver 127.0.0.1'. This has to be done every time the system is restarted (THIS IS A TO DO).
6. From your host device add the URL's of the containers to your DNS. For example on Mac or Linux you can do this by editing your /etc/hosts file by running 'sudo nano /etc/hosts' from your terminal (given that you have nano installed). For example add: '192.168.0.190 splash.inethihome.net' to the file to get the splash page working, where 192.168.0.190 is the VM's IP address.
7. Ping the VM and the URLs from your host machine's terminal to make sure that your DNS entry is working.
8. Visit your browser of choice and go to 'http://splash.inethihome.net' for example to view the docker container's UI.
## Use this code with no VM
1. Clone the repo and run the vm_build_all.sh script. Remember to open and edit the /etc/resolv.conf file on the VM and add 'nameserver 127.0.0.1'. This has to be done every time the system is restarted (THIS IS A TO DO).
## TO DO
1. Fix the need to edit resolv.conf on restart
2. Add music share
3. Add instructions on how to setup a VM without downloading the current one
