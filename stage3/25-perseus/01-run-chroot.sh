#!/usr/bin/env bash
set -euo pipefail

BUILD_PACKAGES="autoconf automake libtool"
apt-get -y install ${BUILD_PACKAGES}

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

usermod -a -G perseususb openwebrx
usermod -a -G perseususb pi

apt-get -y purge ${BUILD_PACKAGES}