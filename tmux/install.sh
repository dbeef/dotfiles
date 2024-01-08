#!/bin/bash

set -x
set -e 
set -u

TMUX_DIR=~/.tmux/
mkdir -p $TMUX_DIR/plugins

# Tmux:
sudo apt install tmux --yes
# Dependencies (including plugins):
sudo apt install xsel --yes
# Install tpm (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
# Copy config:
cp tmux.conf ~/.tmux.conf 
# Reload:
tmux source ~/.tmux.conf
