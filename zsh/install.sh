#!/bin/bash

set -x
set -u
set -e

# Install zsh:
sudo apt install zsh --yes
# Change default shell:
chsh -s /bin/zsh
# First run (select 2):
zsh
# Install oh-my-zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Copy my theme:
cp ./dbeef.zsh-theme ~/.oh-my-zsh/themes/
# Copy .zshrc:
cp ./zshrc ~/.zshrc