#!/bin/bash -e

# Change GCC/G++ in path:
update-alternatives --install /usr/local/bin/g++ g++ /usr/bin/g++-12 50
update-alternatives --install /usr/local/bin/gcc gcc /usr/bin/gcc-12 50
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-12 50
update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-12 50

