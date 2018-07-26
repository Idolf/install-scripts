#!/bin/bash
. "$(dirname "$0")/util.sh"

require tor
run sudo update-rc.d -f tor remove
