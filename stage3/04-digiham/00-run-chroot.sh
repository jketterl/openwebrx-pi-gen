#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone --depth 1 https://github.com/jketterl/digiham.git
pushd digiham
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf digiham
popd
