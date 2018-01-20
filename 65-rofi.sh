#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require autoconf automake libpango1.0-dev libxinerama-dev make libstartup-notification0-dev libxcb-util0-dev
require libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-ewmh-dev libxcb-xrm-dev
require libxcb-icccm4-dev libxcb-randr0-dev libxcb-xinerama0-dev bison
# clone repo in tmp dir
run git clone https://github.com/DaveDavenport/rofi.git .

# install
# recipe from INSTALL.md
run git submodule update --init
run autoreconf -i
run mkdir build
run cd build
run ../configure --prefix=/opt/rofi
run make
run sudo make install

epilogue
