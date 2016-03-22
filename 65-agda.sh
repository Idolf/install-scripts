#!/bin/bash
. "$(dirname "$0")/util.sh"

require libtinfo-dev libncurses5-dev

run stack install Agda
