#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

sudo rm -rf /opt/z3
sudo mkdir /opt/z3
sudo chown `id -u`:`id -g` /opt/z3

git clone git@github.com:Z3Prover/z3.git .
sudo python scripts/mk_make.py --prefix=/opt/z3
cd build
make
sudo make install

epilogue
