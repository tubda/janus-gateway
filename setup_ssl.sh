#!/bin/bash

cd ~
mkdir ssl
cd ssl

# Gen ssl certs:
openssl req -new -newkey rsa:4096 -nodes -keyout key.pem -out cert.csr
openssl x509 -req -sha256 -days 365 -in cert.csr -signkey key.pem -out cert.pem
chmod 600 cert.csr
chmod 600 cert.pem
chmod 600 key.pem

#Janus config
sudo nano /opt/janus/etc/janus/janus.jcfg
=> to
certificates: {
        cert_pem = "/home/nhancv/ssl/cert.pem"
        cert_key = "/home/nhancv/ssl/key.pem" }

#Http transport config
sudo nano /opt/janus/etc/janus/janus.transport.http.jcfg
=> to
general: {
        http = true
        port = 8088
        https = true
        secure_port = 8089 }
certificates: {
        cert_pem = "/home/nhancv/ssl/cert.pem"
        cert_key = "/home/nhancv/ssl/key.pem" }
