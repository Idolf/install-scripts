#!/bin/sh
echo 'options thinkpad_acpi fan_control=1' | sudo tee /etc/modprobe.d/fancontrol.conf
