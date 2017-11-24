#! /usr/bin/env bash

echo "Install Tools"
sudo apt-get update
sudo apt-get install -y unzip jq python-pip git-core ntp

# Automatically go to /repos directory on login
echo "cd /repos/" >> /home/ubuntu/.bashrc

# Start SSH agent via bashrc if it's not running yet
echo "
if [ -z \${SSH_AUTH_SOCK} ] ; then
    eval \$(ssh-agent)
    ssh-add
fi

PATH=\$PATH:/repos/vnc_gui/node
PATH=\$PATH:/repos/vnc_gui/node_modules/@angular/cli/bin

export PATH=.:\$PATH
" >> /home/ubuntu/.bashrc

chmod 0600 /home/ubuntu/.ssh/id_rsa

# Add Bitbucket to known hosts (to prevent interactive prompt when cloning)
ssh-keyscan bitbucket.scm.otto.de >> /home/ubuntu/.ssh/known_hosts
chown ubuntu:ubuntu /home/ubuntu/.ssh/known_hosts