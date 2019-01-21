# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '30GB'

  # avoid OTTO Certificates...
  config.vm.box_download_insecure=true

  # Increase memory
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "6096", "--cpus", "4"]
    # ADD USB
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'ESP', '--vendorid', '0x074d', '--productid', '0x3556']
    vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'ESP', '--vendorid', '0x05e3', '--productid', '0x0743']
  end

  # Netzwerk für IP-Adresse
  config.vm.network "private_network", type: "dhcp"

  # Port forwardings (private)
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"       # nginx
  config.vm.network "forwarded_port", guest: 2181, host: 2181, host_ip: "127.0.0.1"   # zookeeper
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"   # grafana
  config.vm.network "forwarded_port", guest: 4200, host: 4200, host_ip: "127.0.0.1"   # angular dev-server
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
  config.vm.network "forwarded_port", guest: 8443, host: 8443, host_ip: "127.0.0.1"   # Spring Boot
  config.vm.network "forwarded_port", guest: 8888, host: 8888, host_ip: "127.0.0.1"   # Jenkins
  config.vm.network "forwarded_port", guest: 9092, host: 9092, host_ip: "127.0.0.1"   # kafka
  config.vm.network "forwarded_port", guest: 15672, host: 15672, host_ip: "127.0.0.1" # rabbitmq management console
  config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1" # mongodb

  # Sync Folder Vagrant to Host
  config.vm.synced_folder ".", "/setup/"
  config.vm.synced_folder "../", "/repos/"

  # erlaube symbolic links
  config.vm.provider "virtualbox" do |v|
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Provisioning
  ## Copy SSH Keys from G:/ share if we're running on Windows
#  if Vagrant::Util::Platform.windows? then
#    config.vm.provision "file", source: "G:/.ssh/", destination: "/home/ubuntu/.ssh/"
#    config.vm.provision "file", source: "G:/.ssh/id_rsa.pub", destination: "/home/ubuntu/.ssh/id_rsa.pub"
#    config.vm.provision "file", source: "G:/.ssh/id_rsa", destination: "/home/ubuntu/.ssh/id_rsa"
#  else
#    config.ssh.forward_agent = true
#  end

  #config.vm.provision "file", source: "./provisioning/.secrets/credentials", destination: "/home/ubuntu/.aws/credentials"
  config.vm.provision "shell", path: "./provisioning/common.sh"
  #config.vm.provision "shell", path: "./provisioning/certificates.sh"
  config.vm.provision "shell", path: "./provisioning/jdk.sh"
  config.vm.provision "shell", path: "./provisioning/maven.sh"
  config.vm.provision "shell", path: "./provisioning/gradle.sh"
  config.vm.provision "shell", path: "./provisioning/docker.sh"
  config.vm.provision "shell", path: "./provisioning/postgres.sh"
  config.vm.provision "shell", path: "./provisioning/terraform.sh"
  config.vm.provision "shell", path: "./provisioning/aws.sh"
  #config.vm.provision "shell", path: "./provisioning/clone_bitbucket_projects.sh", privileged: false
  #config.vm.provision "shell", path: "./provisioning/intrastat.sh"
  config.vm.provision "shell", path: "./provisioning/ruby.sh"
  config.vm.provision "shell", path: "./provisioning/npmnode.sh"
end
