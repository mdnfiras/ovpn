# ovpn-eyacom

Automatic deployment of a VPN solution on a virtual machine provisioned by Vagrant on a Ubuntu Server 18.04

Run the script vagrantinstall.sh to install Vagrant on the host server along with all the required packages and plugins (KVM & LibVirt).
The script will proceed to launching the virtual machine, provisionning it by installing OpenVPN and exposing the service  on 5.135.137.79:1194
