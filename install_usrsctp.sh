#!/bin/bash
cd ~/
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr --disable-programs --disable-inet --disable-inet6
sudo make && sudo make install
