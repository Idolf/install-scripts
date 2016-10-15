#!/bin/bash
. "$(dirname "$0")/util.sh"

wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/yakkety stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update
require stack
CONF_LD_LINKER_OPTS_STAGE2=-no-pie \
  CONF_GCC_LINKER_OPTS_STAGE2=-no-pie \
  CONF_CC_OPTS_STAGE2=-fno-PIE  \
  stack setup
