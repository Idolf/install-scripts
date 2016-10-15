#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirements
require gcc make mlton

run wget http://twelf.plparty.org/releases/twelf-src-1.7.1.tar.gz
run sha1sum twelf-src-1.7.1.tar.gz | grep 7717ddb924d12f1b9aa3934ea5fa44e133f72518
run tar zxfv twelf-src-1.7.1.tar.gz
cd twelf
make mlton
sudo cp -a . /opt/twelf

epilogue
