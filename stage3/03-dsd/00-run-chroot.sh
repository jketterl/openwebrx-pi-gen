#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone --depth 1 https://github.com/f4exb/dsd
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
