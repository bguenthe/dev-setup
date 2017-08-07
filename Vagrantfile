# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # avoid OTTO Certificates...
  config.vm.box_download_insecure=true

  # Port forwardings (private)
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1" # Spring Boot
  config.vm.network "forwarded_port", guest: 8888, host: 8888, host_ip: "127.0.0.1" # Jenkins

  # Sync Folder Vagrant to Host
  config.vm.synced_folder ".", "/setup/"
  config.vm.synced_folder "../", "/repos/"

  # Provisioning
  ## Copy SSH Keys from G:/ share if we're running on Windows
  if Vagrant::Util::Platform.windows? then
    config.vm.provision "file", source: "G:/.ssh/", destination: "/home/ubuntu/.ssh/"
    config.vm.provision "file", source: "G:/.ssh/id_rsa.pub", destination: "/home/ubuntu/.ssh/id_rsa.pub"
    config.vm.provision "file", source: "G:/.ssh/id_rsa", destination: "/home/ubuntu/.ssh/id_rsa"
  else
    config.ssh.forward_agent = true
  end

  config.vm.provision "file", source: "./provisioning/.secrets/credentials", destination: "/home/ubuntu/.aws/credentials"
  config.vm.provision "shell", path: "./provisioning/common.sh"
  config.vm.provision "shell", path: "./provisioning/certificates.sh"
  config.vm.provision "shell", path: "./provisioning/jdk.sh"
  config.vm.provision "shell", path: "./provisioning/maven.sh"
  config.vm.provision "shell", path: "./provisioning/docker.sh"
  config.vm.provision "shell", path: "./provisioning/postgres.sh"
  config.vm.provision "shell", path: "./provisioning/terraform.sh"
  config.vm.provision "shell", path: "./provisioning/aws.sh"
  config.vm.provision "shell", path: "./provisioning/clone_bitbucket_projects.sh", privileged: false
end
