#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

git clone git@github.com:Z3Prover/z3.git .
python scripts/mk_make.py
cd build
make
sudo make install

epilogue
