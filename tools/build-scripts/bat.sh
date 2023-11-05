#!/bin/bash -e

if ! [ -d "bat" ]; then
git clone -b v0.18.3 https://github.com/sharkdp/bat.git
fi

cd bat
cargo install --path .

