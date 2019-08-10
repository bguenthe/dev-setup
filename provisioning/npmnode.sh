#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y nodejs

npm install -g @angular/cli