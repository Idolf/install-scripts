#!/bin/sh

sudo systemctl stop getty@tty3.service
sudo systemctl stop getty@tty4.service
sudo systemctl stop getty@tty5.service
sudo systemctl stop getty@tty6.service
sudo systemctl disable getty@tty3.service
sudo systemctl disable getty@tty4.service
sudo systemctl disable getty@tty5.service
sudo systemctl disable getty@tty6.service
