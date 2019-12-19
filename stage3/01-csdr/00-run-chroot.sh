#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone --depth 1 https://github.com/jketterl/csdr.git
pushd csdr
make
sudo make install
popd
rm -rf csdr
popd
