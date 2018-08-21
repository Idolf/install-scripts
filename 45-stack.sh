#!/bin/bash
. "$(dirname "$0")/util.sh"

require zlib1g-dev
curl -sSL https://get.haskellstack.org/ | sh
. ~/.environment
hash -r
stack setup
