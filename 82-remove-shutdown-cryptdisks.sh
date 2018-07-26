#!/bin/sh

sudo tee /etc/insserv/overrides/cryptdisks-early  <<EOF
### BEGIN INIT INFO
# Provides:          cryptdisks-early
# Required-Start:    checkroot
# Required-Stop:     umountroot
# Should-Start:      udev mdadm-raid
# Should-Stop:       udev mdadm-raid
# X-Start-Before:    lvm2
# X-Stop-After:      lvm2 umountfs
# X-Interactive:     true
# Default-Start:     S
# Default-Stop:      
# Short-Description: Setup early encrypted block devices.
# Description:
### END INIT INFO
EOF

sudo tee /etc/insserv/overrides/cryptdisks  <<EOF
### BEGIN INIT INFO
# Provides:          cryptdisks
# Required-Start:    checkroot cryptdisks-early
# Required-Stop:     umountroot cryptdisks-early
# Should-Start:      udev mdadm-raid lvm2
# Should-Stop:       udev mdadm-raid lvm2
# X-Start-Before:    checkfs
# X-Stop-After:      umountfs
# X-Interactive:     true
# Default-Start:     S
# Default-Stop:      
# Short-Description: Setup remaining encrypted block devices.
# Description:
### END INIT INFO
EOF

sudo update-rc.d -f cryptdisks-early remove
sudo update-rc.d -f cryptdisks-early defaults

sudo update-rc.d -f cryptdisks remove
sudo update-rc.d -f cryptdisks defaults
