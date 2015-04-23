#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

sudo tee /etc/acpi/events/mylid >/dev/null <<EOF
# /etc/acpi/events/mylid
# Called when the user closes or opens the lid

event=button[ /]lid
action=$HOME/.xmonad/lid.sh
EOF

epilogue
