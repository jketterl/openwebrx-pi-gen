#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/jketterl/digiham.git
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
