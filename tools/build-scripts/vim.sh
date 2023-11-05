#!/bin/bash -e

git clone https://github.com/vim/vim.git
cd vim
git checkout v8.2.3567
cd src/
./configure --enable-python3interp=yes
sudo make install

