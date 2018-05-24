#!/bin/bash

if [[ ${target_platform} =~ linux* ]]; then
    # stdc++ 11 is required on Linux
    CPPFLAGS="${CPPFLAGS//-std=c++17/-std=c++11}"
    CXXFLAGS="${CXXFLAGS//-std=c++17/-std=c++11}"
fi

autoconf
autoreconf -i
# copy in newer config scripts for guessing the canonical system name.
# The latest version are available from:
# http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
cp $RECIPE_DIR/config.guess .
cp $RECIPE_DIR/config.sub .
./configure --prefix=$PREFIX
make
# make check fails with gcc 7.2.0
# https://github.com/google/glog/issues/194
#make check
make install
