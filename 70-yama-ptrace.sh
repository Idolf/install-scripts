#!/bin/bash
. "$(dirname "$0")/util.sh"

if [ ! -e /etc/sysctl.d/10-ptrace.conf ] ; then
    run sudo tee /etc/sysctl.d/10-ptrace.conf <<EOF
kernel.yama.ptrace_scope = 0
EOF
fi
