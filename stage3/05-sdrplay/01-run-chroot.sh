#!/usr/bin/env bash

pushd /tmp

BINARY=SDRplay_RSP_API-RPi-2.13.1.run
wget http://www.sdrplay.com/software/$BINARY
sh $BINARY --noexec --target sdrplay
patch --verbose -Np0 < install-lib.armv7l.patch

pushd sdrplay
./install_lib.sh
popd
rm -rf sdrplay
rm $BINARY
rm install-lib.armv7l.patch

popd