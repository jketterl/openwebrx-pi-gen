#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/jketterl/owrx_connector.git
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
