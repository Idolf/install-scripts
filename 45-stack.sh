#!/bin/bash
. "$(dirname "$0")/util.sh"

require haskell-stack zlib1g-dev
stack upgrade --install-ghc
hash -r
stack setup
