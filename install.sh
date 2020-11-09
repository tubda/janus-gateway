#!/bin/bash
# Install janus it's dependencies, then start janus.

# Run this script from janus-gateway dir, on the lightsail inance terminal
sudo chmod +x install_dependencies.sh
./install_dependencies.sh

sudo chmod +x install_libnice.sh
./install_libnice.sh

sudo chmod +x install_libsrtp.sh
./install_libsrtp.sh

sudo chmod +x install_usrsctp.sh
./install_usrsctp.sh

sudo chmod +x install_libwebsockets.sh
./install_libwebsockets.sh

sudo chmod +x install_janus.sh
./install_janus.sh

# chmod x+ setup_ssl.sh
# setup_ssl.sh

# start janus
/opt/janus/bin/janus
