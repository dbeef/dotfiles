#!/bin/bash -e 

# https://github.com/MaskRay/ccls/wiki/Build
# https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file

# To use with coc.vim CMake project must be generated with CMAKE_EXPORT_COMPILE_COMMANDS:
# cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
# And a symlink made in the root of the project:
# ln -s Debug/compile_commands.json .

git clone --recursive --branch 0.20220729 --depth 1 https://github.com/MaskRay/ccls
cd ccls
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
sudo cmake --build build --config Release --target install -j 12
