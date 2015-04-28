#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirement -- not needed after building
require bzr libgtk-3-dev libvte-2.90-dev cmake

run bzr branch http://bazaar.launchpad.net/~dabisu/sakura/sakura
run cd sakura
run cmake -DCMAKE_INSTALL_PREFIX=/opt/sakura .
run make -j5
run sudo make install

epilogue
