#!/bin/bash
. "$(dirname "$0")/util.sh"

prologue

cargo install racer || true
wget https://static.rust-lang.org/dist/rustc-1.9.0-src.tar.gz
SRC=$PWD/rustc-1.9.0-src.tar.gz

mkdir $HOME/.rust-src || true
cd $HOME/.rust-src
tar xf $SRC

epilogue
