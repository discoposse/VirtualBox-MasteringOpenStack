# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'securerandom'

nodes = {
    'controller'  => [0, 200],
}

# This is some magic to help avoid network collisions.
# If however, it still collides, comment out this line and uncomment the one below it
third_octet = SecureRandom.random_number(200)
#third_octet = 172

Vagrant.configure("2") do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|
            hostname = "%s" % [prefix, (i+1)]

            config.vm.define "#{hostname}" do |box|
                box.vm.hostname = "#{hostname}.book"
                box.vm.network :private_network, ip: "172.16.#{third_octet}.#{ip_start+i}", :netmask => "255.255.0.0"
                box.vm.network :private_network, ip: "10.10.#{third_octet}.#{ip_start+i}", :netmask => "255.255.0.0"

                # Run the installer shell file based on the name
                box.vm.provision :shell, :path => "#{prefix}.sh"

                box.vm.provider :virtualbox do |vbox|
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                end
            end
        end
    end
end