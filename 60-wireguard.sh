#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require linux-headers-amd64 linux-image-amd64
echo "deb http://deb.debian.org/debian/ unstable main" | sudo tee /etc/apt/sources.list.d/unstable-wireguard.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' | sudo tee /etc/apt/preferences.d/limit-unstable
sudo apt-get update && sudo apt-get install wireguard

epilogue
