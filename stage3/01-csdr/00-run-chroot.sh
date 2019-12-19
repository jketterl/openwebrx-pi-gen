#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/jketterl/csdr.git
pushd csdr
make
sudo make install
popd
rm -rf csdr
popd
