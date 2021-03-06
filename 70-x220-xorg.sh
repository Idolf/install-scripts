#!/bin/bash
. "$(dirname "$0")/util.sh"

sudo mkdir -p /etc/X11/xorg.conf.d
cat << EOF | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
  Identifier  "Intel Graphics"
  Driver      "intel"
  Option "TearFree" "true"
EndSection
EOF
