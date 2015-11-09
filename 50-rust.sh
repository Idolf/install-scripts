#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

git clone --recursive https://github.com/brson/multirust && cd multirust
git submodule update --init
./build.sh
sudo ./install.sh --prefix=/opt/multirust
/opt/multirust/bin/multirust default beta

epilogue
