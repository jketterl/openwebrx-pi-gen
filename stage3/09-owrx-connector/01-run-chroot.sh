#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git --depth 1 clone https://github.com/jketterl/owrx_connector.git
pushd owrx_connector
mkdir build
pushd build
cmake ..
make
sudo make install
popd
popd
rm -rf owrx_connector
popd
