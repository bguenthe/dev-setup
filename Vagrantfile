# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '30GB'

  required_plugins = %w( vagrant-fsnotify )
  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
  end

  # avoid OTTO Certificates...
  config.vm.box_download_insecure=true

  # Increase memory
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "6096", "--cpus", "4"]
  end

  # Netzwerk für IP-Adresse
  config.vm.network "private_network", type: "dhcp"

  # Port forwardings (private)
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"       # nginx
  config.vm.network "forwarded_port", guest: 2181, host: 2181, host_ip: "127.0.0.1"   # zookeeper
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"   # grafana
  config.vm.network "forwarded_port", guest: 4200, host: 4200                         # angular dev-server
  config.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "127.0.0.1"   # local Postgres DB
  config.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: "127.0.0.1"   # Spring Boot DEBUG
  config.vm.network "forwarded_port", guest: 8001, host: 8001, host_ip: "127.0.0.1"   # Spring Boot DEBUG
  config.vm.network "forwarded_port", guest: 8002, host: 8002, host_ip: "127.0.0.1"   # Spring Boot DEBUG
  config.vm.network "forwarded_port", guest: 8003, host: 8003, host_ip: "127.0.0.1"   # Spring Boot DEBUG
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 8081, host: 8081, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 8082, host: 8082, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 8083, host: 8083, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 8084, host: 8084, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 9092, host: 9092, host_ip: "127.0.0.1"   # kafka
  config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1" # mongodb

  # Sync Folder Vagrant to Host
  config.vm.synced_folder ".", "/setup/"
  config.vm.synced_folder "../", "/repos/"

  config.vm.provider "virtualbox" do |vb|
      vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.provision "shell", path: "./provisioning/common.sh"
  config.vm.provision "shell", path: "./provisioning/jdk.sh"
  config.vm.provision "shell", path: "./provisioning/maven.sh"
  config.vm.provision "shell", path: "./provisioning/gradle.sh"
  config.vm.provision "shell", path: "./provisioning/docker.sh"
  config.vm.provision "shell", path: "./provisioning/postgres.sh"
  config.vm.provision "shell", path: "./provisioning/terraform.sh"
  config.vm.provision "shell", path: "./provisioning/aws.sh"
  config.vm.provision "shell", path: "./provisioning/ruby.sh"
  config.vm.provision "shell", path: "./provisioning/npmnode.sh"
  config.vm.provision "shell", path: "./provisioning/setupnodelocal.sh"
end
