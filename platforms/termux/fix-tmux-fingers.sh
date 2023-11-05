#!/bin/bash -e

# Since /tmp/ is not writable under termux, replace all paths containing it:

HOME_TMP=$HOME/.tmp
mkdir -p $HOME_TMP

cd ~/.tmux/plugins/tmux-fingers
sed -i `grep -rlF . -e "/tmp/"` -e "s#/tmp/#$HOME_TMP#g"

