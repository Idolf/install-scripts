#!/bin/bash
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path
rustup component add rustfmt-preview rust-src
