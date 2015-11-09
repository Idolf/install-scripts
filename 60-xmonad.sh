#!/bin/bash
. "$(dirname "$0")/util.sh"

# requirement
require stack

cd $HOME/git/xmonad
# Compile `blink' to alert me of IRC activity
run sudo gcc blink.c -o /usr/local/bin/blink
run sudo chmod u+s /usr/local/bin/blink

run stack setup
run stack install
. ~/.environment
assert installed xmonad
