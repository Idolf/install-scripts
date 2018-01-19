#!/bin/bash
. "$(dirname "$0")/util.sh"

prologue

cargo install racer || true

epilogue
