#!/bin/bash -e

if ! [ -d "ripgrep" ]; then
git clone -b 13.0.0 https://github.com/BurntSushi/ripgrep.git
fi

cd ripgrep
rm HomebrewFormula # Causes error on Termux
cargo install --path . 

