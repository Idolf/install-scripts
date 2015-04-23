#!/bin/bash
. "$(dirname "$0")/util.sh"

echo 'DPkg::Post-Invoke {"'$HOME'/.pkgs/check-pkgs";};' | run sudo tee /etc/apt/apt.conf.d/99check-pkgs
run sudo tee /etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

run sudo apt-get -y install linux-headers-$(uname -r)
run .pkgs/check-pkgs


