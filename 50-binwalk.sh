#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirement
require python-lzma

run git clone git@github.com:devttys0/binwalk.git .
run sudo python setup.py install --prefix /opt/binwalk

epilogue
