#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirements
require git zlib1g-dev liblzma-dev ca-certificates g++

run sudo rm -rf /opt/firmware-mod-kit
run sudo mkdir -p /opt/firmware-mod-kit/bin
run sudo chown -R `id -u`:`id -g` /opt/firmware-mod-kit
run git clone https://code.google.com/p/firmware-mod-kit/ /opt/firmware-mod-kit/bin
run cd /opt/firmware-mod-kit/bin/src
run ./configure
run make -j4

epilogue
