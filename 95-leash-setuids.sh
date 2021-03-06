#!/bin/sh

sudo chmod -s /bin/mount
sudo chmod -s /bin/su
sudo chmod -s /bin/umount
sudo chmod -s /sbin/pam_extrausers_chkpwd
sudo chmod -s /sbin/unix_chkpwd
sudo chmod -s /usr/bin/bsd-write
sudo chmod -s /usr/bin/chage
sudo chmod -s /usr/bin/chfn
sudo chmod -s /usr/bin/chsh
sudo chmod -s /usr/bin/dotlockfile
sudo chmod -s /usr/bin/expiry
sudo chmod -s /usr/bin/gpasswd
sudo chmod -s /usr/bin/newgrp
sudo chmod -s /usr/bin/passwd
sudo chmod -s /usr/bin/ssh-agent
sudo chmod -s /usr/bin/wall
sudo chmod -s /usr/bin/X
sudo chmod -s /usr/lib/emacs/*/x86_64-linux-gnu/movemail
sudo chmod -s /usr/lib/libvte-*/gnome-pty-helper
sudo chmod -s /usr/lib/openssh/ssh-keysign
sudo chmod -s /usr/lib/pt_chown
sudo chmod -s /usr/lib/virtualbox/VBoxHeadless
sudo chmod -s /usr/lib/virtualbox/VBoxNetAdpCtl
sudo chmod -s /usr/lib/virtualbox/VBoxNetDHCP
sudo chmod -s /usr/lib/virtualbox/VBoxSDL
sudo setcap -r /usr/bin/systemd-detect-virt 2>/dev/null || true
sudo setcap -r /usr/lib/x86_64-linux-gnu/gstreamer*/gstreamer-*/gst-ptp-helper 2>/dev/null || true

sudo find / -type f -perm /6000 -ls 2>/dev/null
sudo find / -type f -perm /0111 -exec getcap {} + 2>/dev/null
