#!/bin/bash
. "$(dirname "$0")/util.sh"

require haskell-stack libz-dev
stack upgrade --install-ghc
hash -r
stack setup
