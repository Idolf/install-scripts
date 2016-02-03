#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

sudo tee /root/lid.sh >/dev/null <<EOF
#!/bin/sh

if grep -q closed /proc/acpi/button/lid/LID/state; then
  su - idolf -c 'DISPLAY=:0 slock' &
  sleep 1
  (
    pm-suspend
    for i in \`seq 100\`; do
      sleep 0.25
      DISPLAY=:0 su -c xrandr idolf
    done
  ) &
fi
EOF

sudo chmod 755 /root/lid.sh

sudo tee /etc/acpi/events/mylid >/dev/null <<EOF
# /etc/acpi/events/mylid
# Called when the user closes or opens the lid

event=button[ /]lid
action=/root/lid.sh
EOF

sudo service acpid restart

epilogue
