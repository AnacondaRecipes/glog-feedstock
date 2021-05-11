#!/bin/bash

mkdir build_release
cd build_release

cmake ${CMAKE_ARGS} ..  \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DINSTALL_HEADERS=1 \
    -DBUILD_SHARED_LIBS=1 \
    -DBUILD_STATIC_LIBS=0 \
    -DBUILD_TESTING=0

ninja install
