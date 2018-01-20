#!/bin/bash
. "$(dirname "$0")/util.sh"

sudo sed -i -e 's/use_tempaddr.*/use_tempaddr = 0/' /etc/sysctl.d/10-ipv6-privacy.conf || true

echo kernel.yama.ptrace_scope = 0 | sudo tee /etc/sysctl.d/10-ptrace.conf
echo kernel.core_uses_pid = 1 | sudo tee /etc/sysctl.d/10-core-uses-pid.conf
echo kernel.kptr_restrict = 1 | sudo tee /etc/sysctl.d/10-kptr-restrict.conf
