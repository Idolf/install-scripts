#!/bin/bash
. "$(dirname "$0")/util.sh"

xdg-mime default /usr/share/applications/org.pwmt.zathura.desktop application/pdf
xdg-mime default /usr/share/applications/feh.desktop image/jpeg
