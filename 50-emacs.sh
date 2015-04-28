#!/bin/bash
. "$(dirname "$0")/util.sh"

require emacs emacs-goodies-el

if [ ! -d .emacs.d/elpa ] && \
       promptyn "Install Emacs packages now?" "y" ; then
    run .emacs.d/install-packages.sh
fi
