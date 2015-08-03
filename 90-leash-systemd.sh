#!/bin/sh

# Disable excessive gettys
sudo systemctl stop getty@tty2
sudo systemctl stop getty@tty3
sudo systemctl stop getty@tty4
sudo systemctl stop getty@tty5
sudo systemctl stop getty@tty6
sudo systemctl stop getty-static
sudo systemctl mask getty-static

# Disable timesyncd. I will handle ntp myself.
sudo systemctl stop systemd-timesyncd.service
sudo systemctl mask systemd-timesyncd.service
