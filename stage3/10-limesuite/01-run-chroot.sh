#!/usr/bin/env bash
set -euxo pipefail

function cmakebuild() {
  pushd $1
  git checkout stable
  mkdir builddir
  pushd builddir
  cmake ..
  make -j4
  make install
  popd
  pushd udev-rules
  ./install.sh
  popd
  popd
  rm -rf $1
}


pushd /tmp

git clone https://github.com/myriadrf/LimeSuite.git
cmakebuild LimeSuite
ldconfig

popd
