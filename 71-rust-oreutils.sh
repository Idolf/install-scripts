#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

export RUSTFLAGS="-C target-cpu=native"
#cargo +nightly install --force ripgrep --features 'simd-accel avx-accel'
cargo +nightly install -f exa fd-find bat tokei

epilogue
