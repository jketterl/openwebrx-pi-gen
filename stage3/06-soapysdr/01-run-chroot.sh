#!/usr/bin/env bash
set -euxo pipefail

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

git clone --depth 1 https://github.com/pothosware/SoapySDR
cmakebuild SoapySDR
ldconfig

git clone --depth 1 https://github.com/pothosware/SoapySDRPlay.git
cmakebuild SoapySDRPlay
ldconfig

git clone --depth 1 https://github.com/pothosware/SoapyAirspy.git
cmakebuild SoapyAirspy
ldconfig

git clone --depth 1 https://github.com/airspy/airspyhf.git
cmakebuild airspyhf -DINSTALL_UDEV_RULES=ON
ldconfig

git clone --depth 1 https://github.com/pothosware/SoapyAirspyHF.git
cmakebuild SoapyAirspyHF
ldconfig

git clone --depth 1 https://github.com/pothosware/SoapyRTLSDR.git
cmakebuild SoapyRTLSDR -DCMAKE_CXX_STANDARD_LIBRARIES="-latomic"
ldconfig

popd
