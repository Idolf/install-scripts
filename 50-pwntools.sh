#!/bin/bash
. "$(dirname "$0")/util.sh"

# requirement -- not needed after building
require python-pip

run mkdir $HOME/git || true
run cd $HOME/git
run rm -rf ./pwntools || true
run git clone git@github.com:Gallopsled/pwntools.git
run cd pwntools
run sudo pip install -e .

epilogue
