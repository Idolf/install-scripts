#!/bin/bash
. "$(dirname "$0")/util.sh"

if ! installed emacs ; then
    prompt_install emacs Emacs
    require emacs emacs-goodies-el
fi

if [ ! -d .emacs.d/elpa ] && \
       promptyn "Install Emacs packages now?" "y" ; then
    run .emacs.d/install-packages.sh
fi
