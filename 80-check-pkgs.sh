#!/bin/bash
. "$(dirname "$0")/util.sh"

echo 'DPkg::Post-Invoke {"'$HOME'/bin/check-pkgs";};' | run sudo tee /etc/apt/apt.conf.d/99check-pkgs

run sudo apt-get -y install linux-headers-$(uname -r)
run check-pkgs


