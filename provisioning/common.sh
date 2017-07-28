#! /usr/bin/env bash

echo "Install Tools"
sudo apt-get update
sudo apt-get install -y unzip jq python-pip git-core ntp

# Automatically go to /repos directory on login
echo "cd /repos/" >> /home/ubuntu/.bashrc

# Start SSH agent via bashrc if it's not running yet
echo "
if [ -z ${SSH_AUTH_SOCK} ] ; then
    eval \$(ssh-agent)
    ssh-add
fi
" >> /home/ubuntu/.bashrc

chmod 0600 /home/ubuntu/.ssh/id_rsa

echo "|1|BD7jCFUF+pHmu3uninMoR6eohjE=|NO7IHeLYw1kSbDqz/Byh5BaF7EY= ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiPM2+Lx6lV9e4OF9NvgsVSRq/+AXqvTwNw2fq8xiSvFmFBiSkZaIR21cnqr/rLF8pA66Bzzk7ZXR3ft5EKfQ9pfkxl5F8u2YPD1heb76R6wX/Bp0nHY1uab14ltop1V
88XjG0taR5LOI3uDAqvFRP/qReriFn+RaKeIF76Rjm/YEgqqN2fbDK+0okvjZZtOgIe6F7c0X4L8mSSbUaqVQHs42OgUeCKXtcEVF+sZWL7+GdVtVKcQ3+34IoOipKhJiphgg7RTTIC2CFLq/wrOMMcOhUY/z/nmVBxZm6cvNWkqYQBzKqmrhkUH9PzHLxlioYZa0uyiMFXPxsh6kzXgtv" >> /home/ubuntu/.ssh/known_hosts

echo "88XjG0taR5LOI3uDAqvFRP/qReriFn+RaKeIF76Rjm/YEgqqN2fbDK+0okvjZZtOgIe6F7c0X4L8mSSbUaqVQHs42OgUeCKXtcEVF+sZWL7+GdVtVKcQ3+34IoOipKhJiphgg7RTTIC2CFLq/wrOMMcOhUY/z/nmVBxZm6cvNWkqYQBzKqmrhkUH9PzHLxlioYZa0uyiMFXPxsh6kzXgtv" >> /home/ubuntu/.ssh/known_hosts
