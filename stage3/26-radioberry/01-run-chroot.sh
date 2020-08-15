#!/usr/bin/env bash
set -euo pipefail

function cmakebuild() {
  pushd $1
  mkdir build
  pushd build
  cmake "${@:2}" ..
  make
  make install
  popd
  popd
  rm -rf $1
}

pushd /tmp

git clone https://github.com/pa3gsb/Radioberry-2.x
pushd Radioberry-2.x/SBC/rpi-4
cmakebuild SoapyRadioberrySDR
popd
ldconfig
rm -rf Radioberry-2.x

popd