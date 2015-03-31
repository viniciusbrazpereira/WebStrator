# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :web do |web|
    web.vm.box = "hashicorp/precise64"
    web.vm.provision "shell", path: "provision-web.sh"

    #NGINX
    web.vm.network "forwarded_port", guest: 80, host: 80

    #PRIVATE NETWORK
    web.vm.network "private_network", ip: "192.168.40.11"
 
    #SHAREFOLDER DEFAULT NGINX VHOST
    web.vm.synced_folder ".", "/var/www/"
  end

  config.vm.define :mongo do |mongo|
    mongo.vm.box = "hashicorp/precise64"
    mongo.vm.provision "shell", path: "provision-mongo.sh"

    # MongoDB
    mongo.vm.network "forwarded_port", guest: 27017, host: 27017

    #PRIVATE NETWORK
    mongo.vm.network "private_network", ip: "192.168.40.12"
 
    #SHAREFOLDER DEFAULT NGINX VHOST
    #web.vm.synced_folder ".", "/var/www/"
  end
end
