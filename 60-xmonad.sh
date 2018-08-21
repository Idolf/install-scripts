#!/bin/bash
. "$(dirname "$0")/util.sh"

# requirement
require libxrandr-dev

cd $HOME/git/xmonad
# Compile `blink' to alert me of IRC activity
run sudo gcc blink.c -o /usr/local/bin/blink
run sudo chmod u+s /usr/local/bin/blink

# Compile `brightness' to control screen brightness
run sudo gcc brightness.c -o /usr/local/bin/_brightness
run sudo chmod u+s /usr/local/bin/_brightness
run sudo cp brightness.py /usr/local/bin/brightness
run sudo chmod 755 /usr/local/bin/brightness

run stack setup
run stack install
. ~/.environment
assert installed xmonad
