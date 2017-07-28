#!/usr/bin/env bash

echo "Install OTTO certificates"

apt-get install openssl

rm -f /usr/local/share/ca-certificates/otto.crt
rm -f /usr/local/share/ca-certificates/old_otto.crt

OTTO_ROOT_CERT_DOWNLOAD="${DOWNLOADS_DIR}/root_ca.crt"
curl -s http://pki.ottogroup.com/OTTO-Root-CA-v01.crt > ${OTTO_ROOT_CERT_DOWNLOAD}

OTTO_SUB_CA_CERT_DOWNLOAD="${DOWNLOADS_DIR}/sub_ca.crt"
curl -s http://pki.ottogroup.com/OTTO-Company-CA1-v01.crt > ${OTTO_SUB_CA_CERT_DOWNLOAD}

OTTO_ISSUING_CA_CERT_PEM="${DOWNLOADS_DIR}/issuing_ca.crt"
curl -s http://pki.ottogroup.com/OTTO-Universal-Issuing-CA1-v01.crt > ${OTTO_ISSUING_CA_CERT_PEM}

NEW_OTTO_CERT_PEM="${DOWNLOADS_DIR}/new_ca.pem"
openssl x509 -inform der -in ${OTTO_ROOT_CERT_DOWNLOAD} -out ${NEW_OTTO_CERT_PEM}

OTTO_SUB_CA_CERT_PEM="${DOWNLOADS_DIR}/sub_ca.pem"
openssl x509 -inform der -in ${OTTO_SUB_CA_CERT_DOWNLOAD} -out ${OTTO_SUB_CA_CERT_PEM}

cp ${NEW_OTTO_CERT_PEM} /usr/local/share/ca-certificates/ottoroot.crt
cp ${OTTO_SUB_CA_CERT_PEM} /usr/local/share/ca-certificates/ottosub.crt
cp ${OTTO_ISSUING_CA_CERT_PEM} /usr/local/share/ca-certificates/ottoissuing.crt

update-ca-certificates --fresh > /dev/null
