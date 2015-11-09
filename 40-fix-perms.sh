#!/bin/bash
. "$(dirname "$0")/util.sh"

cd $HOME
run chmod og-rwx .ssh .ssh/id_rsa
run sudo chown root:root .net.conf bin/net
