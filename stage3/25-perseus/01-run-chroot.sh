#!/usr/bin/env bash
set -euo pipefail

BUILD_PACKAGES="autoconf automake libtool"
sudo apt-get -y install ${BUILD_PACKAGES}

pushd /tmp

git clone https://github.com/Microtelecom/libperseus-sdr.git
pushd libperseus-sdr
git checkout v0.8.2
./bootstrap.sh
./configure
make
make install
ldconfig
popd
rm -rf libperseus-sdr

popd

sudo apt-get -y purge ${BUILD_PACKAGES}