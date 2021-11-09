#!/bin/bash -e

mkdir -p ~/.termux/
echo "bell-character=ignore" >> ~/.termux/termux.properties

pkg install root-repo
echo "Calling termux-change-repo. Select all repositories (press a key)" && read
termux-change-repo
pkg update

pkg install \
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
    libicu

npm install -g yarn
yarn install

