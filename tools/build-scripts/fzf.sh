#!/bin/bash -e

if ! [ -d "fzf" ]; then
git clone https://github.com/junegunn/fzf.git 
fi
cd fzf
./install

