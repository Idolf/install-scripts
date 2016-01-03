#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

run sudo rm -rf /opt/z3
run sudo mkdir /opt/z3

run git clone git@github.com:Z3Prover/z3.git .
run sudo python scripts/mk_make.py --prefix=/opt/z3 --pypkgdir=/opt/z3/py-pkg
run cd build
run sudo make
run sudo make install

epilogue
