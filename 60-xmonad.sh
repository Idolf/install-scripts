#!/bin/bash
. "$(dirname "$0")/util.sh"

# requirement
require \
    ghc cabal-install zlib1g-dev libx11-dev libxinerama-dev libxrandr-dev \
    libxft-dev libpcre3-dev

run cabal update
if [ ! -f ".cabal/bin/cabal" ] ; then
    run cabal install cabal-install
    [ -f ~/.environment ] && . ~/.environment
fi
run cabal install xmonad
# Currently version 0.11.4 does not compile with latest GHC...
run cabal install xmonad-contrib-0.11.3
# My XMonad configuration needs this package
run cabal install regex-pcre
# Compile `blink' to alert me of IRC activity
run sudo gcc .xmonad/blink.c -o .xmonad/blink
run sudo chmod u+s .xmonad/blink

run xmonad --recompile

assert installed xmonad
