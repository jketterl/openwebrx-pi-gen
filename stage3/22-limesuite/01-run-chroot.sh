#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp

git clone https://github.com/myriadrf/LimeSuite.git
pushd LimeSuite
git checkout stable
mkdir builddir
pushd builddir
cmake .. -DENABLE_EXAMPLES=OFF -DENABLE_DESKTOP=OFF -DENABLE_LIME_UTIL=OFF -DENABLE_QUICKTEST=OFF -DENABLE_OCTAVE=OFF -DENABLE_GUI=OFF -DCMAKE_CXX_STANDARD_LIBRARIES="-latomic"
make
make install
popd
pushd udev-rules
./install.sh
popd
popd
rm -rf LimeSuite
ldconfig

popd
