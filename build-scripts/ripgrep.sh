#!/bin/bash -e

git clone -b 13.0.0 https://github.com/BurntSushi/ripgrep.git
cd ripgrep
cargo check
cargo install --path . 

