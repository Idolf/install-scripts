#!/bin/bash
. "$(dirname "$0")/util.sh"

echo "# " | sudo tee /lib/udev/rules.d/75-persistent-net-generator.rules
sudo rm /etc/udev/rules.d/70-persistent-net.rules || true
