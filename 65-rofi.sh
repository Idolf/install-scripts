#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require autoconf automake libpango1.0-dev libxinerama-dev make libstartup-notification0-dev
# clone repo in tmp dir
run git clone git@github.com:DaveDavenport/rofi.git .

# install
# recipe from INSTALL.md
run autoreconf -i
run mkdir build
run cd build
run ../configure --prefix=/opt/rofi
run make
run sudo make install

epilogue
