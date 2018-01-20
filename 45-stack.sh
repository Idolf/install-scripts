#!/bin/bash
. "$(dirname "$0")/util.sh"

require haskell-stack
stack upgrade
stack setup
