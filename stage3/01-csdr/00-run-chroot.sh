#!/usr/bin/env bash
set -euxo pipefail

pushd /tmp
git clone https://github.com/jketterl/csdr.git
pushd csdr
make PARAMS_SIMD="-mfloat-abi=hard -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mvectorize-with-neon-quad -funsafe-math-optimizations -Wformat=0 -DNEON_OPTS -DCSDR_DISABLE_FFTW_MEASURE"
sudo make install
popd
rm -rf csdr
popd
