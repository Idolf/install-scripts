#!/bin/bash
. "$(dirname "$0")/util.sh"

wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/wily stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update
require stack
