#!/bin/bash -e

git clone --branch v18.0.0 --depth 1 --recursive https://github.com/nodejs/node.git
cd node
./configure
make -j 12
sudo make install


