#!/bin/bash
. "$(dirname "$0")/util.sh"

if [ ! -e /etc/apt/apt.conf.d/01norecommend ] ; then
    run sudo tee /etc/apt/apt.conf.d/01norecommend <<EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF
fi
