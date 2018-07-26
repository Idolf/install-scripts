#!/bin/sh

sudo sed -i 's@^1:.*@1:2345:respawn:/sbin/getty --noclear 38400 tty1@' /etc/inittab
sudo sed -i '/7:.*/d' /etc/inittab
echo '7:23:respawn:/sbin/getty --autologin=idolf 38400 tty7' | sudo tee -a /etc/inittab
