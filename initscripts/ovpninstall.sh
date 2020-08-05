#!/bin/bash

echo "=======> downloading ovpn automatic installer :"
wget https://raw.githubusercontent.com/Nyr/openvpn-install/master/openvpn-install.sh 
echo "=======> giving exec right to downloaded script :"
chmod u=x openvpn-install.sh
echo "=======> running downloaded script :"
./openvpn-install.sh

