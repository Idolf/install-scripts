#!/bin/bash
. "$(dirname "$0")/util.sh"

require libtinfo-dev

run stack install Agda
