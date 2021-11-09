#!/bin/bash -e 

# Since /tmp/ is not writable under termux, replace all paths containing it:

HOME_TMP=$HOME/.tmp
mkdir $HOME_TMP
HOME_TMP_ESCAPED=`echo $HOME_TMP | sed "s/\//\\\\\\//g"`

cd ~/.tmux/plugins/tmux-fingers
sed -i `grep -rnF . -e "/tmp/"` "s/\/tmp\//$HOME_TMP/g"

