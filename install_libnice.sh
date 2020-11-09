#!/bin/bash
cd ~/
sudo pip3 install meson
git clone https://gitlab.freedesktop.org/libnice/libnice.git && \
cd libnice && \
sudo meson --prefix=/usr build && \
sudo ninja -C build && \
sudo ninja -C build install
