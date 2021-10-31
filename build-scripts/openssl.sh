#!/bin/bash -e

curl -sL https://www.openssl.org/source/openssl-1.0.2.tar.gz | tar xz
cd openssl-1.0.2/
./config shared --prefix=/usr/
sudo make install

