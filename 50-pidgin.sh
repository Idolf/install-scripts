#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirement -- not needed after building
require libgtk2.0-dev libxml2-dev libidn11-dev libgnutls28-dev libotr5-dev intltool

wget http://heanet.dl.sourceforge.net/project/pidgin/Pidgin/2.10.11/pidgin-2.10.11.tar.bz2.asc http://heanet.dl.sourceforge.net/project/pidgin/Pidgin/2.10.11/pidgin-2.10.11.tar.bz2
gpg --verify pidgin-2.10.11.tar.bz2.asc || exit 1
tar jxfv pidgin-2.10.11.tar.bz2

pushd pidgin-2.10.11
./configure --disable-nls --disable-screensaver --disable-gtkspell --disable-gstreamer --disable-vv --disable-meanwhile --disable-avahi --disable-dbus --disable-perl --disable-tcl --prefix=/opt/pidgin
make -j4
sudo make install
popd

wget https://otr.cypherpunks.ca/pidgin-otr-4.0.1.tar.gz https://otr.cypherpunks.ca/pidgin-otr-4.0.1.tar.gz.asc
gpg --verify pidgin-otr-4.0.1.tar.gz.asc || exit 1
tar zxfv pidgin-otr-4.0.1.tar.gz
pushd pidgin-otr-4.0.1
PKG_CONFIG_PATH=/opt/pidgin/lib/pkgconfig/ ./configure --prefix=/opt/pidgin --disable-nls
make -j4
sudo make install
popd

epilogue
