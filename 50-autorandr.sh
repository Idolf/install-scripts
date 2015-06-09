#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

run git clone git@github.com:phillipberndt/autorandr.git .
run sudo make install
run sudo make hotplug

epilogue
