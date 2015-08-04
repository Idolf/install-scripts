#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

sudo tee /root/lid.sh >/dev/null <<EOFF
#!/bin/sh

if grep -q closed /proc/acpi/button/lid/LID/state; then
  su - $USER -c 'DISPLAY=:0 slock' &
  sleep 1
  pm-suspend &
fi
EOFF

sudo chmod 755 /root/lid.sh

sudo tee /etc/acpi/events/mylid >/dev/null <<EOF
# /etc/acpi/events/mylid
# Called when the user closes or opens the lid

event=button[ /]lid
action=/root/lid.sh
EOF

sudo service acpid restart

epilogue
