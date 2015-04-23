#!/bin/bash
. "$(dirname "$0")/util.sh"


run sudo apt-get update
run sudo apt-get upgrade
run sudo apt-get autoremove --purge
run sudo apt-get autoclean
