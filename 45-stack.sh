#!/bin/bash
. "$(dirname "$0")/util.sh"

require haskell-stack
stack upgrade --install-ghc
hash -r
stack setup
