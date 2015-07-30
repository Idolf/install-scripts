#!/bin/bash
. "$(dirname "$0")/util.sh"

run sudo tee /etc/sysctl.d/10-ptrace.conf <<EOF
kernel.yama.ptrace_scope = 0
EOF
