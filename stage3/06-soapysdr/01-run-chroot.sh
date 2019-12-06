#!/usr/bin/env bash
set -euxo pipefail

function cmakebuild() {
  pushd $1
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

git clone https://github.com/pothosware/SoapySDR
cmakebuild SoapySDR
ldconfig

git clone https://github.com/pothosware/SoapySDRPlay.git
cmakebuild SoapySDRPlay
ldconfig

git clone https://github.com/pothosware/SoapyAirspy.git
cmakebuild SoapyAirspy
ldconfig

git clone https://github.com/pothosware/SoapyAirspyHF.git
cmakebuild SoapyAirspyHF
ldconfig

git clone https://github.com/rxseger/rx_tools
cmakebuild rx_tools

popd
