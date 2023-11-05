#!/bin/bash -e

# Download CMake - usually more recent than in default repository packages:
VERSION=3.23.0 && \
wget -q https://github.com/Kitware/CMake/releases/download/v$VERSION-rc5/cmake-$VERSION-rc5-linux-x86_64.tar.gz && \
tar -xf cmake-$VERSION-rc5-linux-x86_64.tar.gz && \
cp -r cmake-$VERSION-rc5-linux-x86_64/* /usr/ && \
rm -r /tmp/*
