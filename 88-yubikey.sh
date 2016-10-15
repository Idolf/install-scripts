#!/bin/bash

. "$(dirname "$0")/util.sh"

cd /etc/udev/rules.d
sudo wget https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-old-u2f.rules -O 70-old-u2f.rules
sudo udevadm control --reload-rules
sudo service udev restart
