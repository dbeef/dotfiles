#!/bin/bash -e

mkdir -p ~/.termux/
echo "bell-character=ignore" >> ~/.termux/termux.properties

pkg update
pkg install openssh \
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

