# inethi-vm
## Download here
[Download the Virtual Machine here](https://drive.google.com/drive/folders/18oZQE0x_e755D2oNJ7frNiGfTxlYc2D5?usp=sharing)
## Description
Base Ubuntu Virtual Machine (VM) I built to aid development of docker services to be run on the iNethi network. Find the full [iNethi docker environment](https://github.com/iNethi/docker-master) and find out more about iNethi [here] (https://www.inethi.org.za)
## Setup and Usage
1. Download and import the ova into [Virtual Box](https://www.virtualbox.org)
2. Start the virtual box and login with username: inethi and password: inethi
3. Open the terminal and run 'ifconfig' to find the IP address of the VM. For example on Mac it may be under enp0s3. Take note of this address.
4. In the terminal navigate to the 'docker' folder located within the 'dev' folder on the desktop. Do this in the terminal by running: 'cd Desktop/dev/docker/'
5. Now start up the example docker containers via the terminal by running: './vm_resume.sh'
6. Check that the docker containers are running via the terminal by running: 'docker ps -a'. This should show you a list of 4 containers. Namely 'inethi-smokeping', 'inethi-splash-nginx', 'inethi-netdata' and 'inethi-traefik'.
7. From your host device add the URL's of the containers to your DNS. For example on Mac or Linux you can do this by editing your /etc/hosts file by running 'sudo nano /etc/hosts' from your terminal (given that you have nano installed). Here is an example of an edited file:

#Host Database
#localhost is used to configure the loopback interface
#when the system is booting.  Do not change this entry.
192.168.0.190   splash.internal.local
192.168.0.190   traefik.internal.local
192.168.0.190   netdata.internal.local
192.168.0.190   smokeping.internal.local
127.0.0.1       localhost
255.255.255.255 broadcasthost
::1             localhost
#Added by Docker Desktop
#To allow the same kube context to work on the host and the container:
127.0.0.1 kubernetes.docker.internal
#End of section
127.0.0.1       myapp.local

Where 192.168.0.190 is the VM's IP address and the URLs of the docker containers are 'splash.internal.local', 'traefik.internal.local', 'netdata.internal.local' and 'smokeping.internal.local'.

8. Ping the VM and the URLs from your host machine's terminal to make sure that your DNS entry is working.
9. Visit your browser of choice and go to 'http://splash.internal.local', 'http://traefik.internal.local', 'http://netdata.internal.local' or 'http://smokeping.internal.local' to view the docker container's UI.
