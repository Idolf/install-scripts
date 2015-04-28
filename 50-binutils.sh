#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

# requirements
require gcc make texinfo gcc-multilib

wget http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz.sig
gpg --verify binutils-2.25.tar.gz.sig || exit 1
tar zxfv binutils-2.25.tar.gz
for TARGET in i386 x86_64 aarch64 alpha avr arm mips msp430 powerpc m68k sparc vax; do
  rm -rf binutils-build
  mkdir binutils-build
  pushd binutils-build
  ../binutils-2.25/configure --prefix=/opt/binutils-$TARGET \
    --target=$TARGET-unknown-linux-gnu --disable-static --disable-multilib \
    --disable-werror --disable-nls && \
    make -j5 && sudo make install
  popd
done

epilogue
