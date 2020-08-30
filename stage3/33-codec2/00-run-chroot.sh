#!/usr/bin/env bash
set -euo pipefail

pushd /tmp

git clone https://github.com/drowe67/codec2.git
mkdir codec2/build
pushd codec2/build
cmake ..
make
make install
install -m 0755 src/freedv_rx /usr/local/bin
popd
rm -rf codec2

popd