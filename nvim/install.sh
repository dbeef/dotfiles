#!/bin/bash

set -e
set -u
set -x

VERSION=0.9.5
NVIM_DIR=~/.config/nvim/
mkdir -p $NVIM_DIR
cp ./init.lua $NVIM_DIR

# Install dependencies (including plugins):
sudo apt install ripgrep
# Install neovim:
cd /tmp
wget https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
sudo cp -r ./nvim-linux64/bin/* /usr/local/bin/ 
sudo cp -r ./nvim-linux64/lib/* /usr/local/lib/ 
sudo cp -r ./nvim-linux64/man/* /usr/local/man/ 
sudo cp -r ./nvim-linux64/share/* /usr/local/share/ 
cd -
# Remove existing vi/vim:
sudo rm -f /usr/bin/vi
sudo rm -f /usr/bin/vim 
# Alias nvim as vi/vim:
sudo ln -s /usr/local/bin/nvim /usr/bin/vim
sudo ln -s /usr/local/bin/nvim /usr/bin/vi

echo "Success"
