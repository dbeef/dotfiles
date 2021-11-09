#!/bin/bash -e 
mkdir -p ~/.termux/
echo "bell-character=ignore" >> ~/.termux/termux.properties

pkg install root-repo
echo "Calling termux-change-repo. Select all repositories and mirror by Albatros (press a key)" && read
termux-change-repo
pkg update

pkg install --yes \
    openssh \
    python \
    vim-python \
    tmux \
    cmake \
    git \
    curl \
    procps \
    proot \
    nodejs \
    wget \
    mc \
    rust \
    golang \
    fzf \
    man \
    nmap-ncat \
    clang \
    perl \
    libicu \
    yarn

yarn install

