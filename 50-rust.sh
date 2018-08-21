#!/bin/bash
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path
. ~/.environment
rustup component add rls-preview rustfmt-preview rust-src
