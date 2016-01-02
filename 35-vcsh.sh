#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require vcsh myrepos python-pip

cd $HOME
run vcsh clone odroid-home:vcsh/ssh ssh || true
run vcsh ssh fetch origin master
run vcsh ssh reset --hard origin/master
run vcsh mr checkout -f $HOME

run vcsh clone git@git.pwnies.dk:IdolfHatler/vcsh-mr.git mr || true
run vcsh mr fetch origin master
run vcsh mr reset --hard origin/master
run vcsh mr checkout -f $HOME
run mr co

epilogue
