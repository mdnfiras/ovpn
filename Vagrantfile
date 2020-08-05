# -*- mode: ruby -*-
# vi: set ft=ruby:

ovpnscript = "initscripts/ovpninstall.sh"

nodes = [
		{:hostname => "ovpn", :cpus => 1, :mem => 512, :script => ovpnscript}
	]


Vagrant.configure(2) do |config|
	nodes.each do |node|
		config.vm.define node[:hostname] do |vmachine|
			config.vm.box_download_insecure = true
			config.vm.box = "peru/ubuntu-18.04-server-amd64"
			config.vm.box_check_update = false
			vmachine.vm.hostname = node[:hostname]
            vmachine.vm.network "forwarded_port", guest: 1194, host: 1194, host_ip: "<host_private/public_ip>", protocol: "tcp"
			vmachine.vm.provider :libvirt do |domain|
				domain.memory = node[:mem]
				domain.cpus = node[:cpus]
			end
			vmachine.vm.provision :shell, path: node[:script]
		end
	end
end