#!/bin/bash
cd ~/
pip3 install meson
git clone https://gitlab.freedesktop.org/libnice/libnice.git && \
cd libnice && \
meson --prefix=/usr build && \
ninja -C build && \
ninja -C build install
