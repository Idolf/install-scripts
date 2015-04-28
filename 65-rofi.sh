#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require autoconf automake libpango1.0-dev libxinerama-dev make
# clone repo in tmp dir
run git clone git@github.com:DaveDavenport/rofi.git .

# install
# recipe from INSTALL.md
run autoreconf -i
run mkdir build
run cd build
run ../configure
run make
run sudo make install

assert installed rofi

epilogue
