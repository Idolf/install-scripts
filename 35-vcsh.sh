#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require vcsh mr python-pip

cd $HOME
run vcsh clone git@git.pwnies.dk:IdolfHatler/vcsh-mr.git mr || true
run vcsh mr fetch origin master
run vcsh mr reset --hard origin/master
run vcsh mr checkout -f $HOME
run mr -j4 co

epilogue
