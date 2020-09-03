#!/usr/bin/env bash
set -euo pipefail

pushd /tmp

BINARY=SDRplay_RSP_API-ARM64-3.07.1.run
wget http://www.sdrplay.com/software/$BINARY
sh $BINARY --noexec --target sdrplay
patch --verbose -Np0 < install-lib.aarch64.patch

pushd sdrplay
./install_lib.sh
popd
rm -rf sdrplay
rm $BINARY
rm install-lib.aarch64.patch

systemctl daemon-reload
systemctl enable sdrplay

popd
