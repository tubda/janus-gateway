#!/bin/bash

# Install janus on AWS Lightsail

sudo apt-get update && sudo apt-get install git

# clone our janus-gateway repo
cd /srv
git clone https://github.com/tubda/janus-gateway.git && cd janus-gateway

chmod x+ install_dependencies.sh
install_dependencies.sh

chmod x+ install_libnice.sh
install_libnice.sh

chmod x+ install_libsrtp.sh
install_libsrtp.sh

chmod x+ install_usrsctp.sh
install_usrsctp.sh

chmod x+ install_libwebsockets.sh
install_libwebsockets.sh

chmod x+ install_janus.sh
install_janus.sh

# chmod x+ setup_ssl.sh
# setup_ssl.sh

# start janus
/opt/janus/bin/janus
