#!/bin/bash
. "$(dirname "$0")/util.sh"

sudo sed -i -e 's/use_tempaddr.*/use_tempaddr = 0/' /etc/sysctl.d/10-ipv6-privacy.conf
