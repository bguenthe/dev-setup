#!/usr/bin/env bash

echo "Set up Intrastat Environment"
mkdir /app
keytool -genkey -noprompt -keyalg RSA -alias tomcat -dname "CN=localhost, OU=IT-KS-BV-BE, O=Otto GmbH&Co KG, L=Hamburg, S=Hamburg, C=DE" -keystore /app/ssl.intrastat.jks -storepass idontcare -keypass idontcare