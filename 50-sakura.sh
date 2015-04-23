#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirement -- not needed after building
require bzr libgtk-3-dev libvte-2.90-dev cmake

bzr branch http://bazaar.launchpad.net/~dabisu/sakura/sakura
cd sakura
cmake -DCMAKE_INSTALL_PREFIX=/opt/sakura .
make -j5
sudo make install

epilogue
