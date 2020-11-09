#!/bin/bash
cd ~/
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus
sudo make && sudo make install
sudo make configs
