#!/bin/bash
. "$(dirname "$0")/util.sh"

# Make sure i386 is added as a foreign architecture
arch=i386
if [[ ! "$(dpkg --print-foreign-architectures)" =~ "$arch" ]] ; then
    run sudo dpkg --add-architecture $arch
fi
