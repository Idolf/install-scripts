#!/bin/bash
. "$(dirname "$0")/util.sh"


run sudo apt-get update
run sudo apt-get dist-upgrade
run sudo apt-get install linux-image-amd64 linux-headers-amd64
run sudo apt-get autoremove --purge
run sudo apt-get autoclean
