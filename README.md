Developer Setup
===============

Um für alle Entwickler des Teams Bestand eine einfach aufzusetzende und einheitliche Entwicklungsumgebung zu haben, wird in diesem Repository ein Setup für Entwicklerrechner bereitgestellt.

Das Setup sorgt dafür, dass in einer [Vagrant](https://www.vagrantup.com/) VM alle benötigten Tools und Konfigurationen hinterlegt werden. Nach dem Setup kann jeder Entwickler in der Vagrant VM arbeiten, um Tools und Skripte auszuführen.

## Installation
Vor dem Einrichten der Entwicklungsumgebung müssen ein paar wenige Voraussetzungen erfüllt sein:

  1. [Vagrant](https://www.vagrantup.com/downloads.html) für das eigene Betriebssystem installieren
  2. [AWS CLI](https://aws.amazon.com/cli/) installieren und anschließend einmal `aws configure` ausführen. Die Fragen der CLI mit dem eigenen Access Key, Secret Access Key und `eu-central-1` als "region" beantworten. Das Installieren der AWS CLI auf dem Host verhindert, dass nach dem Abreißen der Vagrant VM die Credentials neu eingegeben werden müssen
  3. _Windows-User_: SSH-Key unter `G:/.ssh/id_rsa` (private key) und `G:/.ssh/id_rsa.pub` (public key) bereitstellen. Der SSH-Key wird in die Vagrant VM kopiert
  4. SSH-Public-Key [zu Bitbucket hinzufügen](https://bitbucket.scm.otto.de/plugins/servlet/ssh/account/keys)
  5. _Windows-User_: `init.bat` ausführen,  
     _Linux/Mac-User_: `./go run` ausführen
  6. Kaffee holen und abwarten, das dauert einen Moment
  

## Hochfahren der Entwicklungsumgebung
In der Command Line in das `dev-setup` Verzeichnis wechseln und dort

    vagrant up

ausführen. Das erste Hochfahren dauert ein paar Minuten. Ist die Umgebung einmal installiert, fährt Vagrant in Zukunft innerhalb weniger Sekunden hoch.

Fährt man den eigenen Rechner runter, wird auch die Vagrant VM heruntergefahren. Nach einem Neustart muss also wieder `vagrant up` ausgeführt werden (dieses Mal ohne die langen Wartezeiten).

## In der Entwicklungsumgebung arbeiten
Im `dev-setup` Verzeichnis den Kommandozeilenbefehl

    vagrant ssh

ausführen, um sich über SSH mit Vagrant zu verbinden. Du befindest dich jetzt in deiner eigenen, fertig eingerichteten Ubuntu Linux VM und kannst hier machen, wonach dir ist.

### Struktur
Unter `/repos` findest du alle ausgecheckten git Repositories. Diese Repositories sind ebenfalls auf deinem Host-Betriebssystem verfügbar, direkt neben dem `dev-setup` Verzeichnis. Willst du also bspw. mit deiner IDE unter Windows an einem Projekt arbeiten, öffnest du einfach das Verzeichnis unter deinem Windows Pfad. Die Änderungen werden automatisch in deine Linux-VM synchronisiert.

Unter `/setup` findest du das `dev-setup` Verzeichnis selbst.

## Entwicklungsumgebung neu aufsetzen
Solltest du mal das Bedürfnis haben, die Umgebung komplett neu aufzusetzen (z.B. weil sie kaputt ist oder lange nicht mehr aktualisiert wurde) kannst du mit dem Befehl

    vagrant destroy

die komplette Umgebung abreißen. Mit einem

    vagrant up

wird dann eine neue Version hochgefahren und eingerichtet.

#Vagrant
**Plugin zum Rezizen der Disk**

vagrant plugin install vagrant-disksize

**Einbauen mit**

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.disksize.size = '50GB'
end

#Docker

Alle stopped Container löschen
docker rm $(docker ps -aq)

Alle images löschen
docker rmi $(docker images -q)

#DNS
Zum testen
in  c:\windows\system32\drivers\etc\hosts folgende Zeilen eintragen
    127.0.0.1       kafka
	127.0.0.1       zookeeper
	127.0.0.1       postgres	

