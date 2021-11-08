#!/bin/bash -e

git clone -b v0.18.3 https://github.com/sharkdp/bat.git
cd bat
cargo build
cargo install --path .

