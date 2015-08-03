#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

sudo tee /root/lid.sh >/dev/null <<EOFF
#!/bin/sh

if [ "$1" = "--usage" ]; then
  cat << DONE
You might want to do this:

sudo tee /etc/acpi/events/mylid >/dev/null <<EOF
# /etc/acpi/events/mylid
# Called when the user closes or opens the lid

event=button[ /]lid
action=$(realpath $0)
EOF
DONE
fi

if grep -q closed /proc/acpi/button/lid/LID/state; then
  su - freaken -c 'DISPLAY=:0 slock' &
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
