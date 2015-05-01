#!/bin/bash
. "$(dirname "$0")/util.sh"

run chmod og-rwx .ssh .ssh/id_rsa
run sudo chown root:root .netrc bin/net
