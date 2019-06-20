#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/f4exb/dsd
pushd dsd
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf dsd
popd
