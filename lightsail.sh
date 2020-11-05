#!/bin/bash

# Install janus on AWS Lightsail

#Install dependencies
apt-get update && \
	apt-get install -y --no-install-recommends \
  git\
  libmicrohttpd-dev\
  libjansson-dev\
  libssl-dev\
  libsrtp-dev\
  libsofia-sip-ua-dev\
  libglib2.0-dev\
  libopus-dev\
  libogg-dev\
  libcurl4-openssl-dev\
  liblua5.3-dev\
  libconfig-dev\
  pkg-config\
  gengetopt\
  libtool\
  automake\
  gtk-doc-tools\
  cmake\
  ninja-build\
  python3-pip\
  wget\
  make &&\
  rm -rf /var/lib/apt/lists/*

# Install libnice
cd ~/
pip3 install meson
git clone https://gitlab.freedesktop.org/libnice/libnice.git && \
cd libnice && \
meson --prefix=/usr build && \
ninja -C build && \
ninja -C build install

# Install libsrtp
cd ~/
wget https://github.com/cisco/libsrtp/archive/v2.2.0.tar.gz
tar xfv v2.2.0.tar.gz
cd libsrtp-2.2.0
./configure --prefix=/usr --enable-openssl
make shared_library && make install

# Install usrsctp
cd ~/
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr --disable-programs --disable-inet --disable-inet6
make && make install

# Install libwebsockets
cd ~/
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
# If you want to use the latest master version of libwebsockets, comment the next line
git checkout v4.1-stable
mkdir build
cd build
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
make && make install

# Install Janus
cd ~/
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus
make && make install
make configs

# start janus
/opt/janus/bin/janus
