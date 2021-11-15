#!/bin/bash -e

git clone --branch v17.1.0 --depth 1 --recursive https://github.com/nodejs/node.git
cd node
./configure
make -j 4
sudo make install


