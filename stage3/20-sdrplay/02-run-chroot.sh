#!/usr/bin/env bash
set -euo pipefail

pushd /tmp

BINARY=SDRplay_RSP_API-ARM32-3.07.2.run
wget http://www.sdrplay.com/software/$BINARY
sh $BINARY --noexec --target sdrplay
patch --verbose -Np0 < install-lib.armv7l.patch

pushd sdrplay
./install_lib.sh
popd
rm -rf sdrplay
rm $BINARY
rm install-lib.armv7l.patch

systemctl daemon-reload
systemctl enable sdrplay

popd