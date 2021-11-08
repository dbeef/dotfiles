#!/bin/bash -e

git clone https://github.com/ycm-core/YouCompleteMe.git --depth 1
git submodule update --init --recursive
# TODO: Build & install

