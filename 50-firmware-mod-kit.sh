#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirements
require git zlib1g-dev liblzma-dev ca-certificates g++

sudo rm -rf /opt/firmware-mod-kit
sudo mkdir -p /opt/firmware-mod-kit/bin
sudo chown -R `id -u`:`id -g` /opt/firmware-mod-kit
git clone https://code.google.com/p/firmware-mod-kit/ /opt/firmware-mod-kit/bin
cd /opt/firmware-mod-kit/bin/src
./configure
make -j4

epilogue
