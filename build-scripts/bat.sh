#!/bin/bash -e

git clone https://github.com/sharkdp/bat.git
cd bat
git checkout v0.18.3
cargo install --path .

