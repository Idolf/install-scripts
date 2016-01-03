#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirement -- not needed after building
require libgtk2.0-dev libxml2-dev libidn11-dev libgnutls28-dev libotr5-dev intltool gcc

run wget http://heanet.dl.sourceforge.net/project/pidgin/Pidgin/2.10.12/pidgin-2.10.12.tar.bz2.asc http://heanet.dl.sourceforge.net/project/pidgin/Pidgin/2.10.12/pidgin-2.10.12.tar.bz2
run gpg --verify pidgin-2.10.12.tar.bz2.asc || exit 1
run tar jxfv pidgin-2.10.12.tar.bz2

run pushd pidgin-2.10.12
run ./configure --disable-nls --disable-screensaver --disable-gtkspell --disable-gstreamer --disable-vv --disable-meanwhile --disable-avahi --disable-dbus --disable-perl --disable-tcl --prefix=/opt/pidgin
run make -j4
run sudo make install
run popd

run wget https://otr.cypherpunks.ca/pidgin-otr-4.0.1.tar.gz https://otr.cypherpunks.ca/pidgin-otr-4.0.1.tar.gz.asc
run gpg --verify pidgin-otr-4.0.1.tar.gz.asc || exit 1
run tar zxfv pidgin-otr-4.0.1.tar.gz
run pushd pidgin-otr-4.0.1
run PKG_CONFIG_PATH=/opt/pidgin/lib/pkgconfig/ ./configure --prefix=/opt/pidgin --disable-nls
run make -j4
run sudo make install
run popd

epilogue
