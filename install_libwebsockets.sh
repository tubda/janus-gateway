#!/bin/bash
cd ~/
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
# If you want to use the latest master version of libwebsockets, comment the next line
git checkout v4.1-stable
mkdir build
cd build
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
sudo cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
sudo make && sudo make install
