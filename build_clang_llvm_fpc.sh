#!/usr/bin/env bash

mkdir -v build &&
cd       build &&

CC=gcc CXX=g++                              \
cmake -DCMAKE_INSTALL_PREFIX=/usr           \
      -DLLVM_ENABLE_FFI=ON                  \
      -DCMAKE_BUILD_TYPE=Release            \
      -DLLVM_BUILD_LLVM_DYLIB=ON            \
      -DLLVM_TARGETS_TO_BUILD="host;ARM;AArch64;PowerPC" \
      -Wno-dev -Wno-unused-command-line-argument .. &&
make -j4 &&
make install