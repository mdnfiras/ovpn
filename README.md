# OpenVPN fully automated installation

Automatic deployment of OpenVPN on a virtual machine provisioned by Vagrant.

# Installation

Clone the repository.

```bash
git clone https://github.com/mdnfiras/ovpn.git
```

Change directory.

```bash
cd ovpn
```

Install Vagrant on the host server along with all the required packages and plugins (KVM & LibVirt).


```bash
sudo chmod u=x vagrantinstall.sh
sudo ./vagrantinstall.sh
```

# Usage

Change "<host_private/public_ip>" from ./Vagrantfile to match the IP address of the host server's interface from which connections will be recieved on port 1194.


```
...
vmachine.vm.network "forwarded_port", guest: 1194, host: 1194, host_ip: "<host_private/public_ip>", protocol: "tcp"
...
```

Start the Vagrant ovpn virtual machine, provision it to install OpenVPN and expose the service on <host_private/public_ip>:1194

```bash
sudo chmod u=x ovpn_vm.sh
sudo ./ovpn_vm.sh
```

# Removal

Run the following command in the project's directory:

```bash
sudo vagrant destroy ovpn
```

# VM details
ovpn_vm.sh script will first check if there is any other service listening on port 1194 of the host machine.

The VM will start with 1 CPU, 512 MB of RAM and hostname ovpn. Vagrant should automatically tie it with its own virtual network which can access the host's private networks and the Internet.

The TCP requests on the host's <host_private/public_ip>:1194 will be forwarded to the VM's eth0 interface. Vagrant is not capable of forwarding UDP paquets using LibVirt as provider.

The VM's OS will be Ubuntu Server 18.04.

# OpenVPN details
The provisioning script will:

1) Select the first available network interface's IPv4 address for paquets INPUT/OUTPUT.

2) Check if that interface is behind a NAT, and detect the public IP address using the online service http://ip1.dynupdate.no-ip.com/

3) Check for an existing IPv6 and select the first available network interface's IPv6 address for paquets INPUT/OUTPUT.

4) Select TCP as protocol.

5) Select current system resolvers as DNS server.

6) Select "client" as the first client's name.

7) Proceed to install OpenVPN server (check comments in initscript/openvpn-install.sh for more details).

8) Output the steps to follow on the client machine to set up OpenVPN client.