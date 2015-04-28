#!/bin/bash
. "$(dirname "$0")/util.sh"

require emacs emacs-goodies-el
run .emacs.d/install-packages.sh
