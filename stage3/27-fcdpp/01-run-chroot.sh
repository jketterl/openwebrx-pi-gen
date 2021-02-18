#!/usr/bin/env bash
set -euo pipefail

function cmakebuild() {
  cd $1
  if [[ ! -z "${2:-}" ]]; then
    git checkout $2
  fi
  mkdir build
  pushd build
  cmake ..
  make
  make install
  popd
  popd
  rm -rf $1
}

pushd /tmp

git clone https://github.com/pothosware/SoapyFCDPP.git
cmakebuild SoapyFCDPP soapy-fcdpp-0.1.1
ldconfig

popd