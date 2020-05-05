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

git clone --depth 1 https://github.com/airspy/airspyhf.git
cmakebuild airspyhf -DINSTALL_UDEV_RULES=ON
ldconfig

git clone https://github.com/pothosware/SoapyAirspyHF.git
pushd SoapyAirspyHF
git checkout df64188dd36bc0be4db623726a4aad89c775d937
popd
cmakebuild SoapyAirspyHF
ldconfig

popd
