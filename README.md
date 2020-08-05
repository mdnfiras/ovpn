# ovpn

Automatic deployment of a VPN solution on a virtual machine provisioned by Vagrant on a Ubuntu Server 18.04

Run the script vagrantinstall.sh to install Vagrant on the host server along with all the required packages and plugins (KVM & LibVirt).
Run the script ovpn_vm.sh to start the virtual machine, provision it by installing OpenVPN and exposing the service on <host_private/public_ip>:1194
