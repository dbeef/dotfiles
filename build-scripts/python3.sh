#!/bin/bash -e

wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tar.xz
tar -xf Python-3.9.7.tar.xz
cd Python-3.9.7/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64
./configure --with-openssl=/usr/ --enable-optimizations --enable-shared
make -j 12
sudo make install

sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 100

