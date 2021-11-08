#!/bin/bash -e

# TODO: Clone and build from source
git clone -b 13.0.0 https://github.com/BurntSushi/ripgrep.git
cd ripgrep
cargo install --path . 

