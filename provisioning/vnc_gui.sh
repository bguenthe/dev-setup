#!/usr/bin/env bash

cd /repos/vnc_gui

# die angular komponenten installieren
mvn frontend:install-node-and-npm

# die Node.exe für Windows wird von vagrant falsch mit x Rechten versehen und dann versucht, zu nutzen, deshalb
# benennen wir sie um
mv node/node.exe node/node_win.exe

# path setzen, damit npm und node funktionieren
PATH=$PATH:/repos/vnc_gui/node

# angular-cli installieren, wichtig ist der --no-bin-links, der behebt ein Problem mit symlinks und vagrant und windows
npm install --no-bin-links

# path setzen, damit ng funktioniert
PATH=$PATH:/repos/vnc_gui/node_modules/@angular/cli/bin

